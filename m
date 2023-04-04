Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB06D6ADE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 19:46:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjkiR-0003Vl-7I; Tue, 04 Apr 2023 13:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkiO-0003Va-AS
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:45:04 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkiM-0003Ih-Cx
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:45:03 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h8so133873386ede.8
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680630300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dP25ePLR9FkdLhRmFPnZ1rwejDAetN7vPsIU7xk3Jhc=;
 b=askSkpy26XxN1Asg/cbsC8BR8LWb2iaSOdczo7RhoYP2e40EAEtVkFla5na7SCDhqK
 v6D7VqCZXEPYSPJfY3+12KDPfKV9UNN0tOk536QYxUAmgr0GneABDZI/eybuIHX1ftyK
 AWWEXCUfwi+61RM0ui20L4KbAS+PSpDM0emfdvqcmGF8eR984uebjaYU1UONg1KUjbkG
 p2AWNdpPmXvusy4oOBykyojZeGeh5a0mUKo/ObQAHF9fLs4rtSO3Q/TP6B7xZTrzFTGV
 R2Q+b19Mu6YPRsDB77hfUovJBLftLSxW0idNA0yFSBE0+dZvhw3RfrskRxjkC/nW6NBB
 GmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680630300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dP25ePLR9FkdLhRmFPnZ1rwejDAetN7vPsIU7xk3Jhc=;
 b=NX1bK7y6ANGau3q8EoZKykkftuYFQNAbvl2zjYg7lwtxhCaGYmsoN17VVYjcZyKXwx
 1idntX0/MsA5WZBs+LtQTckwYYzFTkid+1dhAtjAcABfnpnRWrI64CQMRzyNtk67cJVr
 BXJ3BtjCfqrW+ADP22Nt3mOBomkGENevtlAv49fGG+CBvDxtHsqKW+9P5ub8CYyKYpIn
 jaEGZqP0jEP8pU8zZ9yqKt9931Fl6TY9uM9hSZHyNxDxNRm4W0kcut/jbIGFPzWC0g2S
 hgyCDS33YyDOKQD1EhHFdH1Gij0eJCOFmt12QjWKcQkNBVEw46Utq57ax8jXXJB3DDkv
 j/nw==
X-Gm-Message-State: AAQBX9dOyw3mQGBDLoCMlvw4kyWHKt342fFcJcFCWLb7oHR9RQD1YgDp
 BEUnrWNNuXSkYkxkMb5F+BClNYaDu2o1ksnVsQ8WBX3jY3wrGjTMRTI=
X-Google-Smtp-Source: AKy350bhP2WaagN3aP3EPKNorKxW54bPGFKCKjlA/G4Y/m7m23CsPPAR/pNCHmyUw7VJSV59tUMQg8a6c0fRlohJZgU=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr202589ejb.6.1680630300240; Tue, 04 Apr
 2023 10:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230227140213.35084-1-philmd@linaro.org>
 <20230227140213.35084-83-philmd@linaro.org>
In-Reply-To: <20230227140213.35084-83-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 18:44:49 +0100
Message-ID: <CAFEAcA_mmZUoeCaA7AJLecxt8J_Y=GVDex-OQ0aOSv8vdXH_sQ@mail.gmail.com>
Subject: Re: [PULL 092/126] hw/display/sm501: Add fallbacks to pixman routines
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 27 Feb 2023 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: BALATON Zoltan <balaton@eik.bme.hu>
>
> Pixman may return false if it does not have a suitable implementation.
> Add fallbacks to handle such cases.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reported-by: Rene Engel <ReneEngel80@emailn.de>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> Message-Id: <20ed9442a0146238254ccc340c0d1efa226c6356.1677445307.git.bala=
ton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Hi; Coverity points out what may be a bug in this code
(CID 1508621):

> @@ -868,13 +891,19 @@ static void sm501_2d_operation(SM501State *s)
>              color =3D cpu_to_le16(color);
>          }
>
> -        if (width =3D=3D 1 && height =3D=3D 1) {
> -            unsigned int i =3D (dst_x + dst_y * dst_pitch) * bypp;
> -            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
> -        } else {
> -            pixman_fill((uint32_t *)&s->local_mem[dst_base],
> -                        dst_pitch * bypp / sizeof(uint32_t),
> -                        8 * bypp, dst_x, dst_y, width, height, color);
> +        if ((width =3D=3D 1 && height =3D=3D 1) ||
> +            !pixman_fill((uint32_t *)&s->local_mem[dst_base],
> +                         dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
> +                         dst_x, dst_y, width, height, color)) {
> +            /* fallback when pixman failed or we don't want to call it *=
/
> +            uint8_t *d =3D s->local_mem + dst_base;
> +            unsigned int x, y, i;
> +            for (y =3D 0; y < height; y++, i +=3D dst_pitch * bypp) {

In this loop, the on-every-iteration expression updates i...

> +                i =3D (dst_x + (dst_y + y) * dst_pitch) * bypp;

...but the first statement in the loop unconditionally sets i,
so whatever value the loop iteration expression calculated is ignored.

Should the iteration expression just be deleted, or should the
statement in the loop be updating i rather than just setting it?

> +                for (x =3D 0; x < width; x++, i +=3D bypp) {
> +                    stn_he_p(&d[i], bypp, color);
> +                }
> +            }

thanks
-- PMM

