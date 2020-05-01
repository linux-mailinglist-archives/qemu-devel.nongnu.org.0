Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8B1C19C9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUXkS-00053P-1Q
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUXiy-0004Q5-0X
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUXix-0007jy-1y
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:37:11 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:43383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUXiw-0007eT-L5
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:37:10 -0400
Received: by mail-oi1-x22b.google.com with SMTP id j16so57611oih.10
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiL+dDCIp/1mzzj/zAPpfK6g1INM+vYrw7+8AAaJ5+A=;
 b=pRaswsDU3+LiGsWKUeqpT2t0+mBtv5coS5WE1lHwyU9sCPLWIMDLhNfh2FmsWIWoej
 IoKikOgF8ehaDBby3CeRNBIijMCuSeA+TRp8Z+sWDRLbmm340kPPz66HD+2djkI9sqaz
 RnQHwIn+gaK9ReJQOoLHdVFvNBLJNg/FtdmGOZ48sycSRiW5JqEtlPjhzj5e8jmqYDc4
 ukd25baNuJZywZa/AOMjT2IwLE+awDAfFXmCcNji8mPRF7rGyvbp5cPiqwbM8yvX3o2d
 cXIIRFIlmewMeoobWAl96gINv2jo201yX1cokR010EuJ7sMnm72lvBvlb7tidWZIbeft
 2m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiL+dDCIp/1mzzj/zAPpfK6g1INM+vYrw7+8AAaJ5+A=;
 b=irFzGD3v/W0HjEdtOBQWjP6VeIpL1N0Ukd2nQ9C6TdxPswMWMPKNPTbi+vVtwgPlf1
 U/V61VQ4wlj2td538VvSmQVChyIJqRu7pboSmMVabfR2z3AP9xRZk/knt+B1LdR2OiFv
 vfpDKxM3LqLoAPf9A/aAaZ15tcz+WLwZG3F6Z4ljK1KJyMf47mkqCLQamWyCj1HGQfGB
 frc6/nmfQ7Z0L8Q0FfXzmixGTXhHyemdziG0WYQD0cP2IdHV4BVTp/WVgijB0nS7/NPS
 RORbHVRzP7DX7U4Xf2Nhch2yKvs4WgL8/jFrtmsN0j/0e57WcNdLU587fxRTCT/y9RUZ
 ijyw==
X-Gm-Message-State: AGi0Puasvx2OmZpeZbuL2I9+t0H2DxTsKUvdgYdOY3bZhRypHdJXz/bc
 uq5bIvtLQRvmoJn9A5+19XyY6RUyx8eCOrTNx3pKOA==
X-Google-Smtp-Source: APiQypLE0MME3smGL/H28MlsVfHGtj0Jze1HK+qAjFuYwTN+PgW0Mn9Qawf+5MAkiFjRdOlvIDP3PNFn7V0yldOrMj4=
X-Received: by 2002:aca:3441:: with SMTP id b62mr123957oia.146.1588347429116; 
 Fri, 01 May 2020 08:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
In-Reply-To: <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 16:36:57 +0100
Message-ID: <CAFEAcA8M6M7CYg0AsTVbmfX88jzW9MZvRFihQ9cGDJNHhXV+Pw@mail.gmail.com>
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::22b
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

On Thu, 30 Apr 2020 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
> You can morph this into the gvec interface like so:
>
> #define DO_3SAME_64(INSN, FUNC) \
>     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,
>                                 uint32_t rn_ofs, uint32_t rm_ofs,
>                                 uint32_t oprsz, uint32_t maxsz)
>     {
>         static const GVecGen3 op = { .fni8 = FUNC };
>         tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
>                        oprsz, maxsz, &op);
>     }
>     DO_3SAME(INSN, gen_##INSN##_3s)
>
> The .fni8 function tells gvec that we have a helper that processes the
> operation in 8 byte chunks.  It will handle the pass loop for you.
>
> There's also a .fni4 member, for those neon helpers that operate on 4-byte
> quantities, fwiw.

Is there a version of this that works on functions that need
to be passed the cpu_env, or do I have to create a trampoline
function that just calls the real helper function passing it
the extra argument ?

thanks
-- PMM

