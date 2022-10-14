Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280695FF350
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:02:17 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojP0h-0004XW-FJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOsX-0003SD-3h
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:53:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOsU-0001oU-7W
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:53:48 -0400
Received: by mail-pf1-x432.google.com with SMTP id y8so5542292pfp.13
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wT05a1DBUiMB3HdHpeJC+U3IJgoa+a7RGGIrRcmhPU=;
 b=H3QtdDnEb6L+wnwm4pOWsPKKwTX4Ivvy3joaPV/M+fAzDIwHxbt30Uy/EKh/b8fnNP
 mqgQj1eZ+BYyreRuQ2qjRBMOAVxUM2CpPDoqa6jK/QfVjWhfWvJSz8SeUhhZiqo3WHdK
 P6/jsUsfJBsriW5nSf45Sqsx4q1vYsADOznMlw205cXIOtc3djRTMGnyi+zGK/Fa0BgD
 fHvlRSLm5ulsgeTB04A5T94kMswkdN3Nxp/xWRE5dKhyfAO+79bCvBdQkeI7zUtQXpDt
 mGdiSA/fsh9HSXo1BG3tpV25U7qJaonkHLYbSJtexFDAC2aWt8Oz1/chOuFUnAbGD5cD
 s9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wT05a1DBUiMB3HdHpeJC+U3IJgoa+a7RGGIrRcmhPU=;
 b=yjUo+D11UosOCSwCQkBJqN4+OkD4sJE8tplv98XbY05sJFFXxojF5m9a1JdNDumhN+
 u41gjOl1lKz7od4FRyOWZCHqLsFCQ6d8maJvWSFQziokLjmWXVxV7zgPTo3AdNZIl4c7
 z6LJ9d0Hh4mlspep1lCouLhZjvrXatmPtq93h+HAKwhF2iaOl2sL8nsIfiXQc5MhAaMY
 hkVsxua6vO4R9mwyt4eKbL6OUD1Sceok2QPvNuIjA2e4UMjida6T5HDPpNQ/L0XSgMJz
 T1+rIiUfD0BsoeC+wqWOKgcu2hQYsrsOffMhbJCE5157d0gtJwGySpZlifyACMODFK5d
 ohuQ==
X-Gm-Message-State: ACrzQf3MMwJmKnevkGgYh2AWpEeK+M+5yFaqELQRe7W0ebK0sjDJCwpr
 NrmEiLJMbAVUegrLHq7BAUmFAFtNdD+lFT0Xr3PxKg==
X-Google-Smtp-Source: AMsMyM5OJbEg15W68dOABVP5V7wiKO/4m+EaSEMo5oPvlD8zbt+S29sICjCtk2nhsEeyIyX/q9aEPKO7hpOmD32N2To=
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr6270215pfk.51.1665770024568; Fri, 14
 Oct 2022 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
 <20221006033846.1178422-9-richard.henderson@linaro.org>
In-Reply-To: <20221006033846.1178422-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 18:53:33 +0100
Message-ID: <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, in=
t ofs)
>      TCGv_i32 tmp =3D tcg_temp_new_i32();
>
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
> +        /* This difference computes a page offset so ok for TARGET_TB_PC=
REL. */
> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
>      } else {
>          tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
>      }

This is still doing the pc - pc thing -- I guess my comment on v5
crossed in the mail with your v6 repost.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

