Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BEB3D1FF4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:44:00 +0200 (CEST)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6UJD-0005Ld-UE
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6UI5-0003uv-B3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:42:49 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6UI3-00015M-Mf
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:42:48 -0400
Received: by mail-ej1-x62c.google.com with SMTP id hc15so7273375ejc.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDWVODhHge0X0IMh0ZTbCC40ApiaMke3rxNr8FAwob4=;
 b=dqcHZqGU1HZEXZtEZdEe1Phkqg4h+p/k2TPxDIy+JJ1QfQG/RLgfm+6nWaymNR/YtV
 nUFZdmPddVHTohVQa93dcZAXmZACKvlWa4DoRR5DTaUPRkIk5a0QCIQnLk42o/Q5ki41
 qEHsJKbbhmvSP6J9WOTI6Y0SBDjcgAYEk1qOvX+EK1hmr5FVTlzf2HafkrFPF29I35W/
 KhQ8KYRziWKSGFSdsXRVVrT3hAofjPoHhkW17Q5wQuLq9kVtiwJwjQH2jolWZsbY6yJP
 wL5qA5JbbeOzPsKIsf97Hcct/5AVEvFo0V/29t7LpIwfYOuyDQUirHr7+KBvJ+ApiPQ9
 mW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDWVODhHge0X0IMh0ZTbCC40ApiaMke3rxNr8FAwob4=;
 b=U2r2eB7zIY0BLowV8tjCLC8JwFB4WV8qKbd8ZAtO+esmDugKpE2TZvAJd45OqctopX
 foMFE8JK0lMVBlVLf0QqHanT3ebf2Ob/ISdPVo3NqqdvI+eXt8XRpwt8Sifp7zaTMHDt
 UnyHFz2SW5wYyGiSzjRxYNYsHrxMpVg7Pvf7MRgNsi+j4ASMbNZYeQ+Caq3/aD9HATiZ
 U00taqXSuHi7rJV/NSjUyqLKaUXf67TFSC4ZkVxQA84gu50c2J6gaVCanJtejcb3tQkT
 nvrSgeJXuZGCnCVCLrUb4t1hMSr6d4+97H1IDU0YMACBtHDSoP2yywfKv3Qt+nBYV0sj
 anUQ==
X-Gm-Message-State: AOAM533wh7e7DjbN4IwiCB69xpa6ptqW+z1TTm3nciwqhKAosk/kBVhU
 TN6PphniXJrQi2gJfKy2d93UIWu3q0IT/CzfaE5hNw==
X-Google-Smtp-Source: ABdhPJzNGEQF5AmlR6F2yd5UH6hpd4vGHxFHlBhiT1RPQRI6EoRGA/MDaeSY9PG+Lej+qMiPxmtJAvxTGOk0ADryHn0=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr43114761ejc.56.1626943365330; 
 Thu, 22 Jul 2021 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-33-peter.maydell@linaro.org>
 <3421f037-6aac-b91b-1fa4-806af98e5ece@linaro.org>
In-Reply-To: <3421f037-6aac-b91b-1fa4-806af98e5ece@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 09:42:03 +0100
Message-ID: <CAFEAcA8JW8yw0YM3P0mTkJji8OCkHER2is0+cCEnu4gRx+oh-Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 32/34] target/arm: Implement MVE scatter-gather
 insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Jul 2021 at 01:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 3:37 AM, Peter Maydell wrote:
> > +static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
> > +{
> > +    TCGv_i32 addr;
> > +    TCGv_ptr qd, qm;
> > +
> > +    if (!dc_isar_feature(aa32_mve, s) ||
> > +        !mve_check_qreg_bank(s, a->qd | a->qm) ||
> > +        !fn || a->rn == 15) {
> > +        /* Rn case is UNPREDICTABLE */
> > +        return false;
> > +    }
>
> No Qd != Qm check for loads?  Given that we know in advance that it simply won't work for
> VLDRD, it would be nice to diagnose the error.
>
> > +static bool trans_VLDR_S_sg(DisasContext *s, arg_vldst_sg *a)
> > +{
> > +    static MVEGenLdStSGFn * const fns[2][4][4] = { {
> > +            { NULL, F(vldrb_sg_sh), F(vldrb_sg_sw), NULL },
> > +            { NULL, NULL,           F(vldrh_sg_sw), NULL },
> > +            { NULL, NULL,           NULL,           NULL },
> > +            { NULL, NULL,           NULL,           NULL }
> > +        }, {
> > +            { NULL, NULL,              NULL,              NULL },
> > +            { NULL, NULL,              F(vldrh_sg_os_sw), NULL },
> > +            { NULL, NULL,              NULL,              NULL },
> > +            { NULL, NULL,              NULL,              NULL }
> > +        }
> > +    };
>
> A little bit unfortunate with table density here, but whatever.

Yes; I initially wrote things this way incorrectly thinking more of the
tables would be populated than they are, but I think overall it's
a fairly readable way to go.

I noticed yesterday that these load/store implementations aren't
enforcing the alignment fault requirements, though, so I need to
add that.

thanks
-- PMM

