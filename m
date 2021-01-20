Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290B2FD167
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:49:42 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Drh-0005wC-Bg
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2DpT-0004OS-5F
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:47:24 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2DpR-0001pZ-Ah
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:47:22 -0500
Received: by mail-ed1-x52c.google.com with SMTP id dj23so23246367edb.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 05:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CxFxw2FPligxJeDGz0GCGaIYhSRUnvi0Wev0gfmHbJI=;
 b=f67WdzJP0f2OxysYPMVAAi9oPB1B8JeKkQLUNFucgNigHk9QXn5Zze37ASzQcGtOEH
 XHReOTsqzXqeD4wF4cwWfLASpgmjvZ+TtdHezHoixuWXzPWp4O9FGbVZcx7NDYcyWzDf
 Ih8Ua5sxnfm5roJdCEma4we6LhkuQi/rimRmz9pgCt2U02+PV0M77rGeDSEi8HEpGeGx
 dExQZ2Jn/RTe87r+k2lPnpEm2dGacTw4UycNmy75p6495WNcn2LXFdejo0ljK4a9mPAj
 tYkrvzKyQV1T/7UkMHXlgHxJZknk3l7wAAJhftGhVZW/FZ3vKPqO/1hEGuDGYY+ZtamE
 c0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CxFxw2FPligxJeDGz0GCGaIYhSRUnvi0Wev0gfmHbJI=;
 b=mZD1mc9lvO+axirCBcqsR4fQ20xpIEIn9UNLuWcbmm8J8msXUBUI49FbVoE+2YX+Uc
 NSrlM8ulueDBZYnJZrbVHt/hvJjsxVrg996lGkJCeYDx1IvRi5Wva+O3ZaKWn9qJ39QN
 SkRhIxWNX1cetHZc8az02UccWvy4i7B4ZYmGgyYzBPGEjB93+DcHIuzcGF3eJ0x3+W6t
 1coBpMrvvxx5h7CoooA4NcE01SmPqUDyNAiIrByMsbiJ1kL6EP2EYZdQ0l2P33/pp54I
 4QwR7/RTM1uM0tB8zDXYbsaLrSom120B/51wVqGeOVNNqC8dJPBy15LCe8tnzGoXxIUW
 w+aw==
X-Gm-Message-State: AOAM5324x/bgqNRmXYqJDZ6+4lOLPLVAPmpHxCzpjOI8arRFGpaloYWt
 +9TjlkpcXUT9Du6xiTVjcRtVRhBIx0csHswTZN0SFw==
X-Google-Smtp-Source: ABdhPJxwwqdMUNG2Ik0cYHg8uJTiCOMKlFj4tvEOEcs9KEKCh5HR9zkido3Y/6IBVOgr88jKPX9J90BbSG/EyDmFxsQ=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr7320694eds.204.1611150437480; 
 Wed, 20 Jan 2021 05:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
 <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
 <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
In-Reply-To: <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2021 13:47:06 +0000
Message-ID: <CAFEAcA9vpqS+cwMv_gFnRMKCUo167=aLohTyxQ_u_0h9_ODwzQ@mail.gmail.com>
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 05:28, Alejandro Jimenez
<alejandro.j.jimenez@oracle.com> wrote:
> On 1/19/2021 4:34 PM, Peter Maydell wrote:
> > Test cases aren't very exciting, but was it really intentional
> > to change the default behaviour?
> My intention was to preserve the default behavior. Perhaps Paolo wanted
> to reduce the number of GUEST_PANICKED events by removing the one with
> 'pause' action? You could consider it superfluous since it is
> immediately followed by another indicating the 'poweroff' action...
> Unless I hear otherwise from either of you, I'll work on a fix to keep
> the same number and type of events sent.

I'm happy to defer to you/Paolo on the behaviour -- I mostly
wanted to check if the change was intentional.

-- PMM

