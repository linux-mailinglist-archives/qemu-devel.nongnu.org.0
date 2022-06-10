Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19751546A1C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:08:36 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhBa-0006b6-Nn
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzh6m-0004RO-D9
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:03:36 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzh6k-0006VS-5v
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:03:36 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso276764847b3.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tDLHMZIPgdmwO9gpUPBaTey1FMyJ0vxqN5vtllRnXt4=;
 b=k8G75+Vc5IwNjUutMandQoLQ/RE3jisXUbU6OaKGdIoqSuCpiZ5KN68TXD3LTJgwFV
 dnCv282szREWA7HFk8gRQ9wQQPHUYPt1bzb6Gqo5XYF7dqVoaAhuXvRGReySGlNFdQMR
 iYw6Vd9rPFOzAba4fV1chCbYRMkDbbKyomNiZcVjH9gU5alP+Iq0P6ED+VzbdMAjB6LR
 XbJg6LvUtYJyd9qBGNvYinRfSo0/xKehUQ2Fd6EiIImKjMZEEIa53q67M/wLGIvBLqXS
 bAH/kM/baJ/Tx1f7tMZPLpdXsuyQw2wzsJj0NjD1hxKf/xq9iJsnc3ryCGkWTiFFrXfn
 ZhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tDLHMZIPgdmwO9gpUPBaTey1FMyJ0vxqN5vtllRnXt4=;
 b=Y5X/mm4g3XIIQ/kzZymsKoTVEWahyz3djZWteRoDRuWRbrfMNz4IKFR7eZavRWeky0
 rOJrnnSuedKIL78zmem/ZhQgNiO726CAaMw1BwsPtbQE+T8bUECb6B25KPFGrdO2izI5
 nxmvvat43o00BlS+goo99nqtHrt4M96xK478TCUzulM6oCYPMdGviVgqlIRx4sBHXrJI
 XxKyHdT5MLemUQmNVuFmuzVxh6lnMzPPS5+ILp2Y2FFnHqz2iANHxeCEFomMgxnJPxdD
 5PzGTN5W8Kg996pQVWtmfly2XtSXzlCL997Tjxby3cCg8CaomEfZ1PC48KVHbRtayeGY
 aEBQ==
X-Gm-Message-State: AOAM531FVSiCYCNoU7gt52EsVSWPaOuiHPvdAGxOP+ZtJr7oXrIMiltw
 fxS2uVvRxyH7Qca+FVr/COpbTfQVj+OKGCLJWqvgIQ==
X-Google-Smtp-Source: ABdhPJw0zA9LzuYrUvgXHQ/BcgMM7Issa0TwnTGmisaRf97DbH8nHNl0S3rxyxjPee9Uj9dJVyZG81WTGOC/yp8POFc=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr47584116ywb.64.1654877012686; Fri, 10
 Jun 2022 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220610154036.1253158-1-alex.bennee@linaro.org>
In-Reply-To: <20220610154036.1253158-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 17:03:22 +0100
Message-ID: <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: de-duplicate our register XML definitions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, agorglouk@gmail.com, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Jun 2022 at 16:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We generate the XML for each vCPU we create which for heavily threaded
> linux-user runs can add up to a lot of memory. Unfortunately we can't
> only do it once as we may have vCPUs with different capabilities in
> different cores but we can at least free duplicate definitions if we
> find them.

How big actually is the XML here? 400 bytes? 4K? 40K? 400K?

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Can we defer the work until/unless gdb actually asks for it?

I have some details-of-the-code comments below, but first:
does gdb even support having the XML for each CPU be different?
Our gdbstub.c seems to always ask for the XML only for the first
CPU in the "process". If gdb does support heterogenous CPU XML,
does it require that different XML descriptions have different
names? We always call them system-registers.xml and sve-registers.xml
regardless of whether different CPUs might have different contents
for those XML blobs...

> ---
>  target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 2f806512d0..85ef6dc6db 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int bas=
e_reg)
>      g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.arm.sys.re=
gs\">");
>      g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &par=
am);
>      g_string_append_printf(s, "</feature>");
> -    cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
> +
> +    /* De-duplicate system register descriptions */
> +    if (cs !=3D first_cpu) {
> +        CPUState *other_cs;
> +        CPU_FOREACH(other_cs) {
> +            ARMCPU *other_arm =3D ARM_CPU(other_cs);
> +            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) =3D=3D=
 0) {

If you check whether the dyn_sysreg_xml.num matches first, that will
probably be a much faster way of checking in almost all cases than
doing the strcmp on the however-long-it-is XML string: it seems unlikely
that in a heterogenous config the CPUs will manage to have exactly the
same number of registers.

If you have a setup with, say, 4 CPUs of type X and then 4 of type Y,
for every type Y CPU this loop will do the strcmp of Y's XML against
the type X XML for cpu 0, then again for 1, then again for 2, then for 3,
even though in theory we already know at that point that 0,1,2,3 all
have the same XML and so if it didn't match for cpu 0 it won't match
for 1,2,3...  But maybe the comparison against the number-of-registers
saves us from having to try to optimise that away.

> +                cpu->dyn_sysreg_xml.desc =3D other_arm->dyn_sysreg_xml.d=
esc;
> +                g_string_free(s, true);
> +                s =3D NULL;
> +                break;
> +            }
> +        }
> +    }
> +
> +    if (s) {
> +        cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
> +    }
>      return cpu->dyn_sysreg_xml.num;
>  }

-- PMM

