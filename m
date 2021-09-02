Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0C3FEA1D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:39:34 +0200 (CEST)
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhJt-0005er-6Y
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhIF-0004KE-0h
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:37:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhIA-0005H0-8W
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:37:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id i6so1354468wrv.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+w0EJzIo1YSbCP3egCVRlj9aghbRtycsh0NNA/7E8g=;
 b=FVnZfwR3XH8v1QzqFa8WjvAUFRA8AO760OJZq+c1k4bswRPKS8T/bAdSVvG+WT0mpw
 bKUU5+XU2fvYLJH8QHEa4DYYhQv71DPxO/tO4J1T1BzKSeV9y0mH9V846OoA4uzgXUPH
 V4MFJtMa/IRu8DPdhiowP8ktWcZu5jT8FIbyInowKodJWrmZllPDGmjsoBOMJM2p24RU
 FhwTf1WbzNAg75TcFwiuTW0TZUsTTzXWn9oo04/SMjeXdLw7W45Gts4Q0lbaHfYmnnc0
 xmB6bIcPK0Mu20QG/aBWb73fXnV1PDCqiVAGZADg0W7C0j98PZP29c7JFTktXz7RlfX6
 ME9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+w0EJzIo1YSbCP3egCVRlj9aghbRtycsh0NNA/7E8g=;
 b=mlNnhBhuUrHsnhfHhmZ596zvpWxIkU0Ho02z42aRDXdxuT6uGil5qsjESwTqDCr46r
 QFlmWVJJYLymxXxbed/liBOlOoozlBhPXCbq2X5pvVIcePrHrI2bAmk+rWMNx9wB6s5q
 4lptIhJvzacKN7yKsWazMgniiqsh8KjW6PN0b13wBFoX8bsiGL2v0VD/Anwv0txCIMVB
 xa5JHJZRLvvcewnN3hV13JfdLEeBR3QgSNyZkem9tnowLBnx095nItXWdrisJzkWL2Dj
 S0CdcioPQRrQrtu2NDpULbzIRt1JSIWnxI4GMrEA4i0yP92s/b7LAYltryrmmDhIpM5C
 cetg==
X-Gm-Message-State: AOAM531vBugsDqcqs2GH9tFCDYmNqQbAOPsVANj+NyMbBvut2fqQfrqv
 qN9PXyuLWHB0hM2P5xd7TDYRFTdUZ/5xwldqSsh4CA==
X-Google-Smtp-Source: ABdhPJy/9ny4Auy/O8iJNc0GD80lQR1MYRiwVyPXaKWLOSgm0QIsdfi9yzartaI+zfYzU55f3Zhi6Uvv8UhOu8tnuEI=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr1996067wrg.386.1630568264477; 
 Thu, 02 Sep 2021 00:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
 <20210901183009.GG26415@redhat.com>
 <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
 <20210901185115.GI26415@redhat.com>
 <CAFEAcA_JiWFrtj8nyVuPio-qPmu2z4_V4mu1kXFSv-UPXXxPNA@mail.gmail.com>
 <20210901202443.GL26415@redhat.com>
In-Reply-To: <20210901202443.GL26415@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 08:36:56 +0100
Message-ID: <CAFEAcA80RmVg=EbSvX+KJGdAk9YFt5Fzaw1GaUrkORoA3qh0wQ@mail.gmail.com>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 21:24, Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Wed, Sep 01, 2021 at 09:17:07PM +0100, Peter Maydell wrote:
> > On Wed, 1 Sept 2021 at 19:51, Richard W.M. Jones <rjones@redhat.com> wrote:
> > >
> > > On Wed, Sep 01, 2021 at 07:41:21PM +0100, Peter Maydell wrote:
> > > > Is the failure case short enough to allow -d ... logging to
> > > > be taken? That's usually the most useful info, but it's so huge
> > > > it's often not feasible.
> > >
> > > I can try -- what exact -d option would be useful?
> >
> > Depends what you're after. Personally I'm fairly sure I know
> > what's going on, I'm just not sure what the right fix is.
>
> Another question: We couldn't reproduce this even with the identical
> ARM guest kernel + initrd + command line using qemu-system-arm
> compiled for x86-64 host.  This was a bit surprising!  Was that bad
> luck or is there some reason why this bug might not be reproducible
> except on armv7 host?  (Both cases use -machine accel=tcg).

That's expected -- this is a bug in the codegen for arm hosts
(specifically 32-bit arm where Neon is available). tcg/i386/
sets TCG_TARGET_STACK_ALIGN to 16, so it won't hit the assert.

Yesterday I wrote:
> The prologue does seem to actively align to the
> specified value, not merely assume-and-preserve that alignment.

but I was misreading the code -- it does just assume-and-preserve.

Do you need an urgent fix/workaround for this? The simplest thing
is to wait for RTH to look at this, which is not likely to be before
the 13th.

Otherwise I think you can work around it with:

--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -152,7 +152,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_qemu_st8_i32     0

 #define TCG_TARGET_HAS_v64              use_neon_instructions
-#define TCG_TARGET_HAS_v128             use_neon_instructions
+#define TCG_TARGET_HAS_v128             0
 #define TCG_TARGET_HAS_v256             0

 #define TCG_TARGET_HAS_andc_vec         1

though this is just a bodge that (hopefully) turns the use of v128
off entirely.

-- PMM

