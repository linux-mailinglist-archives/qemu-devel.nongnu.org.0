Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E65506822
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:57:16 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkbk-0003bo-1i
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngk7r-0005Sg-9t
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:26:23 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngk7p-0002VW-BV
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:26:22 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d19so1533020ybc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cou3Mi6/FL2ZBfMF87QpeYwSSi0iKoQeYEI0CYMDKRE=;
 b=nT4siUEJasAHfRAK56hXv7Vij6Dmy9BZNRL1clOBpmokH9WSWjqCkmetUci7AY69K7
 74p7fapODd5qrhGcgjajhhs2PaTWaOoXwuZAaDETgxMDyBDlD9hSxhFFpQPtJ9jXb6vp
 iWQvqmcoYuI074M/khwsNCmAQ8uG0c4Qt/2nvX3iE2Dn0jYS8Lj/a1JCf6AIqvvVTwD+
 6/Rm6vTcyuhIBQGnrykAy0PyOE/vGHeE5/HMi6/+tiiOdOprnOh0jun/hhLZkg2oBtrE
 7j3QIxK2uyuWm/Gs4wdfEC7Z2WvW0YQFYnuiWJOLJS2K/dwOjw+aMw+aqPEVDAd127Z3
 XD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cou3Mi6/FL2ZBfMF87QpeYwSSi0iKoQeYEI0CYMDKRE=;
 b=4+kBQeh3+HiPjN9DAXtl7oBBKcbagZBbgmLOyjKFz3E0AESANq78vipF66yf2pi+fs
 yG5+63C+EWCFbHKvxUVwa32ZICFB1IWq98B84VNGuRk2DuOBqlC58PSnJAPfdkhMVsEF
 ItstX/kTWmLEanRMk5eV87TqaghcyDpUquzpGj8mFSHtn+zESQRbL5VP1AyEIhN5ivHU
 T/We8kKPCkLxOrbMBy3lIopu05VNAKdXg2VAN8MYKlwdmP+5wlfQZ2xFvzjh6Q8RfP2I
 TDhScN1HjfHVfH8NMuELZQwoW+5jwOBHb/M8SPbyKMO9jEhTHUdlUh+p+yfrPigfsdqP
 iYRw==
X-Gm-Message-State: AOAM531QfbNkvMvJOfspeptTUMzEm2rUy8QZT5nPiALWy9UY89KHKKdl
 ufN9a+fIQ3RSUTVKahPaNGyTGDsdVpFDiCySROiqIA==
X-Google-Smtp-Source: ABdhPJxykR0qv9D4dg9YkXaUA6M4OixpLDHDgX+vorM7c64Z9dFj8mOFHL5PbmmFBSUQJ/A1yoYTtOHXNYZZgufUErM=
X-Received: by 2002:a25:5014:0:b0:641:f856:aa1f with SMTP id
 e20-20020a255014000000b00641f856aa1fmr13119845ybb.140.1650360380403; Tue, 19
 Apr 2022 02:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
In-Reply-To: <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Apr 2022 10:26:09 +0100
Message-ID: <CAFEAcA8YzC-gFCv73S-5uxPvcUP=9TFP50xsi44L8Gm-B4ZScg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 20:15, Leandro Lupori
<leandro.lupori@eldorado.org.br> wrote:
>
> Add semihosting support for PPC64. This implementation is
> based on the standard for ARM semihosting version 2.0, as
> implemented by QEMU and documented in
>
>     https://github.com/ARM-software/abi-aa/releases
>
> The PPC64 specific differences are the following:
>
> Semihosting Trap Instruction: sc 7
> Operation Number Register: r3
> Parameter Register: r4
> Return Register: r3
> Data block field size: 64 bits

Where is the independent specification which defines that
this is the ABI for PPC semihosting? You should provide the
URL for that in a comment somewhere.

thanks
-- PMM

