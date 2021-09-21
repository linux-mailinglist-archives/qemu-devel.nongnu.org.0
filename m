Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988841339F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 14:58:15 +0200 (CEST)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfLh-0003nl-J4
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 08:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSfJt-0002lz-TQ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:56:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSfJq-0000CN-Lk
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:56:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so38832828wra.12
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 05:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sy/CpQh7eJVrtAeqt9h614OGuu9b4ePNnqstjuZxuOU=;
 b=D9DuWkQISN3B4UBGLLzbAONPYLXkL/2uq5nqN532ESMCDLqikLYXgeH2SHVNt8hS62
 dWxYEu8/RQj3bNg0hxzMJ81hs9lTdROyINRZZyDuJH6gI+B+ERoiJb7lSxkVSfFAg3VN
 Gp1xwqX3+0HAa6k5WCOkB7ELMue4wwe+feHPthMRzP1zDiV4QWMGWDtE4FtOiBLuIE1B
 3VbzzrwTAScdlq8YXUh/amR3Dl6FQReryYDaeezNtS0+oqYTS1QrTkD831L5hagtzf7v
 7GVGTw8UaQTexrVHMm0cHipI3O3/sH8TnIDxVk7PNzHnBj9/Ysl34pznIIBz8H7V4utS
 ifWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sy/CpQh7eJVrtAeqt9h614OGuu9b4ePNnqstjuZxuOU=;
 b=1agUcUGlfOL3hQ45em/IuuQ3MuRgcG1xC/uQOiK3JRuzphas/2WjAgHuEoGgeOVBRq
 FTMXWkrg3ag3szTfRpMcmrsak48yRxJpOUEuXL6/TAivvseBMxccxdK9/sXeygnb84ds
 3+8wsd4Q3v24g0fkKLkNp5mQPrvCFuAiqRp2IW6WAyBcsbQtohCOFNtzCcD6C2GxpHze
 9/XmDprP+AOEQAVbCWy26plLuLyhb14jGVeb6K7mCu6sPZBbwChYuLXTfBMpD8Z/SNVY
 5JKRcbNvh6Oxrc6+6I0/WfLjgHFHplmJ5gc7BcB/x/n9Uujkr9+6gZC7mM+GOeH6UYb2
 SYZQ==
X-Gm-Message-State: AOAM530TUXDyazYdxYiSzYoxeC1TDL4pOBENIDJn9iJaqG1xYUXmjWmP
 iNs4LTBpvghb8bZ90ijWdLrNLyoGRhbThNSZ56bL8w==
X-Google-Smtp-Source: ABdhPJwRO6igdW/yX4Ftx1f3/KdJKY1BHUkc5o5bD1JRNYzD222yvcR/a8sNa/PFHPOknx1niwj9i3hqmNfJ53xb7go=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr4506874wmo.21.1632228975917; 
 Tue, 21 Sep 2021 05:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
 <YUnUn100vx++0n5C@redhat.com>
In-Reply-To: <YUnUn100vx++0n5C@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 13:55:23 +0100
Message-ID: <CAFEAcA9Ywv+7M+60Rb=kvhE9pXY2hcuZmTs11nkWUpyLfcu+8g@mail.gmail.com>
Subject: Re: [PULL 0/3] Update meson version
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 13:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Sep 21, 2021 at 01:40:36PM +0100, Peter Maydell wrote:
> > Is there anything that can be done to make meson version bumps
> > not a horrific pain to back out ? This seems to go wrong pretty
> > much every time.
>
> Save your previous 'build' directory contents somewhere safe
> and record the submodule checkout hashes, so they can be
> reset to that ?

I want this fixed on the Meson end, because if I run into this
kind of thing while testing and then backing out pull requests
then it seems quite likely that it will also happen to people
as they try to bisect across the merge once it eventually gets
into git.

-- PMM

