Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B712568FA2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:50:36 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98EV-0000ar-Bo
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98C4-0007f9-J9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:48:05 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98C2-0003Wg-M6
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:48:04 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31cf1adbf92so19269597b3.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5id/fU6e4+BiyBLDcEg7NE/Z+ZXGnWqyK6G+oE3ni/Q=;
 b=HV1CK8K0BfeINztORDcYwxyC+1DL9IXCRfNKQmZ05t9Z0MnaDkFBR63xQ6unkJVbKu
 9wi3n6I3Dy9Rhh6we5iNSQIMJ+hbSsAZ057g6VTs9wqkosztxrn2pyGOygh32RY0HDH9
 VJgek88Q1cUMmtN9b05E2S5lZwS9bEfk+IsORLlMPTq7myQPGw0hibP0A9KLSwZGasqb
 iTWeKyD/zZxuQ2WD150U1zuT2QjDFp9A4vAlGrj5ZsmF53AbR62lIqRraA6H+3KQ/kLw
 QUGN+IWQLZ16Y4sac/sqPnlZ89aZ7D/3kaLTNuclrfT9HmmjZdD+Z170ZZd5W19tnI0h
 sLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5id/fU6e4+BiyBLDcEg7NE/Z+ZXGnWqyK6G+oE3ni/Q=;
 b=JkhODCI2F7rqVaJUM79utCkpV99nrsFBshMvMsAuJ9ZMojSHsuMcGT3CCmAG/VyeHF
 4vb5iC2QbLTKv0FTuy+W9qGm/pUBEoAi4dCS2/mdKM/xDmwL9ZSBKJQdHYP5eRc0sOQg
 ahGrjr3OE9VzxpGg5ZbOeTAhytpP7H21DAp71SmkR+gO1o/qIdhQafRcnC0KMWexLsu8
 x+Sq1c0NCopF4Y1Ieqw1wmIFZZQjFBecJokwGKaXSaOjE/EHeSZ5djBvTDWiC/j5adEq
 BIPuAPEfBvkYv7ol8iEjRAIB/+Didt9pqIcumhO1vRgdPX9vSJgftenLulgw7BBL/Uhs
 lxiQ==
X-Gm-Message-State: AJIora9ZT9Xw4Q1kqpYnh5Xi7EMYIp9YOHqAsAZKSRM1sCan9jgr38bg
 bBb3aX9uTt82YR2kK5JzltoXxnWoksMxfdnoDZagrw==
X-Google-Smtp-Source: AGRyM1uG+W/PuPsuKxdZq6bhDtLkgAQCyBzaMvcDWNkFMbuhAXgb/Wj/xc5pxeDA8oHLofDoYsCNgmc0CfoXyqHC4/A=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr45594571ywg.329.1657126081460; Wed, 06
 Jul 2022 09:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-20-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:47:23 +0100
Message-ID: <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
Subject: Re: [PATCH v5 19/45] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 6 Jul 2022 at 10:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for implementing moves to/from
> horizontal tile slices, but we need new ones for moves to/from
> vertical tile slices.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +/*
> + * Move Zreg vector to ZArray column.
> + */
> +#define DO_MOVA_C(NAME, TYPE, H)                                        \
> +void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
> +{                                                                       \
> +    int i, oprsz = simd_oprsz(desc);                                    \
> +    for (i = 0; i < oprsz; ) {                                          \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                *(TYPE *)(za + tile_vslice_offset(i)) = *(TYPE *)(vn + H(i)); \
> +            }                                                           \
> +            i += sizeof(TYPE);                                          \
> +            pg >>= sizeof(TYPE);                                        \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}
> +
> +DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
> +DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
> +DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)

i is a byte offset in this loop, so shouldn't these be using H1_2 and H1_4 ?



> +/*
> + * Move ZArray column to Zreg vector.
> + */
> +#define DO_MOVA_Z(NAME, TYPE, H)                                        \
> +void HELPER(NAME)(void *vd, void *za, void *vg, uint32_t desc)          \
> +{                                                                       \
> +    int i, oprsz = simd_oprsz(desc);                                    \
> +    for (i = 0; i < oprsz; ) {                                          \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                *(TYPE *)(vd + H(i)) = *(TYPE *)(za + tile_vslice_offset(i)); \
> +            }                                                           \
> +            i += sizeof(TYPE);                                          \
> +            pg >>= sizeof(TYPE);                                        \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}
> +
> +DO_MOVA_Z(sme_mova_zc_b, uint8_t, H1)
> +DO_MOVA_Z(sme_mova_zc_h, uint16_t, H2)
> +DO_MOVA_Z(sme_mova_zc_s, uint32_t, H4)

Similarly here?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

