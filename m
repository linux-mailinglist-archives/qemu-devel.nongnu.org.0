Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB0628E44
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouilE-0005pk-8i; Mon, 14 Nov 2022 18:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouifQ-0002Di-Bc
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:04 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouZMT-0001Ic-UY
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:18:55 -0500
Received: by mail-pj1-x102d.google.com with SMTP id k5so10288645pjo.5
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A78MonTqUVj6SW0ZTqjKXzSGKlFKvo8xINRWkrlof5A=;
 b=hiqdPmFRWf4Ykt+K7C5jCW4TX2bbJOY2VxJqGwpbnJckLKGoYHFq6WbtKZZR3HHA5B
 8/C0vHRmYga9jwO8unhJBUmahOMqEiK9SipfCmCTPBbfL/tclD0vnkMHzsu6IcsHmyuS
 6/b+nGWY3ueiERE4f9wp2oX0HYaHe0msBNThqrnYZtomvYD+3yu/1W5Tz3tbPLVjJP8q
 0nSOwZzfdLK1DSVA9v/WMG6kkGJg5gFRchN5PTlXdcTkNQIEJZIuFVX9ZgJ0ACyJ2mR/
 JF1KvZv8NbFppQQnJbCvx1IFeRhHLW4WUsCib+gCEr4znfsFcOi34Ol8neJ7PJAnz6M4
 eBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A78MonTqUVj6SW0ZTqjKXzSGKlFKvo8xINRWkrlof5A=;
 b=eCxHFeKIPLsLf8ioEpnLv9CdhC1+Hs2rRP5bFCeI6vtK7OXqH9GULMnWnYtjL6Bg3Y
 3ndsnrMs5qS1y46wfkjxpMSqRUxVlkRAc0bagCDKE3wDDv9JXuEkfa7wdOGKD7IBPwNi
 6erXUFSlWYGyH3eqrobwAX/sMbGB4zkhceilRGf+cGPYC1jzYDV6XQ3aNfJMc8OAAIev
 Eb7MpzJpX0ujHcCX+bBjnX4wImhTZ/CJrDHGi1k6vbLljIqikjJyK6Nk1vZxrfN2A/jp
 mko5/4ngbOsQEwEcNcJr2rOYGvNN+KdmY8N8avbYeGc4Sj+aCtw5KAPX77supPhuMrpO
 3S6g==
X-Gm-Message-State: ANoB5pnA2wmXipfbWgjCAx5qU/STYP3O5RTtVwMaWPrSsOAHL6mWng+/
 P0q8iUV0kZjy27lgWbBFst48ueAgdPzLLFaN7gqKDg==
X-Google-Smtp-Source: AA0mqf6I7SqcmQY2M7gFiqrPTl2RTqGiqf6Vx6Bc12y/PxjCloYbwkopPD8yqtFkzkfxmS/1nLV21tos/C/BX9tlkK8=
X-Received: by 2002:a17:902:ea91:b0:185:4ec3:c708 with SMTP id
 x17-20020a170902ea9100b001854ec3c708mr13726401plb.60.1668431931940; Mon, 14
 Nov 2022 05:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-13-alex.bennee@linaro.org>
In-Reply-To: <20221111145529.4020801-13-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 13:18:40 +0000
Message-ID: <CAFEAcA_HoysKQ83rNUn-3X0gdUMjEaq9Xg-scCGnDb18C3MJOw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] hw/intc: add implementation of GICD_IIDR to Arm
 GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, 
 "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 at 14:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
>
> Lightly re-factor this region of registers and also add a comment to
> the function in case anyway was under the illusion we only return
> bytes from a function called readb.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - checkpatch fixes.
> ---
>  hw/intc/arm_gic.c | 44 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..65b1ef7151 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -941,6 +941,10 @@ static void gic_complete_irq(GICState *s, int cpu, i=
nt irq, MemTxAttrs attrs)
>      gic_update(s);
>  }
>
> +/*
> + * Although this is named a byte read we don't always return bytes and
> + * rely on the calling function oring bits together.
> + */

Rather than documenting this, maybe it would be better to
fix the weirdness? We only do this for exactly one register,
the GICD_TYPER. Everything else is naturally byte-based.
(The GICD_CTLR looks like it is also doing this, but the
only non-zero bits are in the low byte, so it isn't really.)

The GICD_TYPER returning bigger than a byte's worth of
data I think is a bug we introduced in commit 5543d1abb6e2
when we added the security extensions support -- before that
all the bits we needed to return were in the low byte. So
I think we can fix this with just (untested):

--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque,
hwaddr offset, MemTxAttrs attrs)
     cm =3D 1 << cpu;
     if (offset < 0x100) {
         if (offset =3D=3D 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque,
hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset =3D=3D 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset =3D=3D 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset =3D=3D 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >=3D 0x80) {


(you can add my Signed-off-by: if you want to turn that into a proper patch=
.)

thanks
-- PMM

