Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591182D8137
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:40:40 +0100 (CET)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knq9W-0001c0-R3
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knq6m-000162-U5
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:37:48 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knq6j-0005lY-HM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:37:48 -0500
Received: by mail-ej1-x644.google.com with SMTP id ce23so14304269ejb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 13:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZaYkU6fHDFR60wiJGeoWZEVL8jGIzUmhNFV9+Ek3Ds=;
 b=KyIsVLv7zPTV7Js8fen2jGH73VLg+zxQrUVVNztT/NYG357j119nMFDugbu4E7iBHb
 tKr8PosHxs3RwCrYkc4GS1CTMmd+pbNv0NQ+iqzsKFx97Z8KLw0vrhE2stuG2YOy+QH+
 3cHGCC9WbFWByVEuOicMJKG+puSE4bddqSzCekHBHeVU40EexBziTaSw03EUdsQyE6ic
 V5WY4NFhJA7AZGV7Pai1rTAdRr0qy1lv1VssZ99PEozBqhzcGlOavQQPJEB//nxr9AiT
 BnnkohnOXSYUFqf3sy5ai4yoxUXleRMbN0b7vxyb/f5MXYFV0ZyHHIUDXsPvIy3pmosm
 cfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZaYkU6fHDFR60wiJGeoWZEVL8jGIzUmhNFV9+Ek3Ds=;
 b=mqF7KZJgT0S9nvmEod8IhXiAsKbgVaC25EOrmzXj77KXupyy4OUBI60hpDjxA3j8qE
 dABmMTuCi73iv6DtG7UdBdeNngONPWYwGt018tP7Vt4lQ9hPwCooTAsTITy1Dt0iT7zF
 R7RMRNxP376gLavRczBGnBbCLMV3A3S3f7Mh9ZMBMvFJ1yQFCCmInxQ0k/CHEqdOAKib
 +QGqNDEv1Evsuj+yuTg6c//o/OA6RDEYNK2uX3sTi/wK0IHyugo9sD8D0nz15dZPd6aA
 L4KFBqHKX4ZKUId2EE2R0ZyOZPNqu1eDca/JVEgOgVbHvKwYVQG5ke054iVUiv2/gpul
 Z2OA==
X-Gm-Message-State: AOAM530iJ58oPGTjs/qYqrAhAY0HVZ0dG3pCXkgFHJRIamcybH0yaxKS
 8TE10pt1XqEV5FMpEdMuq0OXlV97CUunhoixcvf/dQ==
X-Google-Smtp-Source: ABdhPJxlv/VM/X+tN/JbBVGOkIaypDqu7TxEkjpDsLJoPGJ2+3TXSgEPgFGWcMwzLu+9CGgsQzNJhZPnVOIoFERaqpo=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr12731354ejf.407.1607722660076; 
 Fri, 11 Dec 2020 13:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
 <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
 <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
 <46d7b991-d305-bd2f-91f9-cdc2ee1e73ce@linaro.org>
In-Reply-To: <46d7b991-d305-bd2f-91f9-cdc2ee1e73ce@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 21:37:28 +0000
Message-ID: <CAFEAcA9NOez16SaKsegpURPtMJDByYQ2MaeUKjQAiKhm=O-7LA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/11/20 1:33 PM, Rebecca Cran wrote:
> > Is the comment in target/arm/op_helper.c:397 still relevant?
> >
> > uint32_t HELPER(cpsr_read)(CPUARMState *env)
> > {
> >     /*
> >      * We store the ARMv8 PSTATE.SS bit in env->uncached_cpsr.
> >      * This is convenient for populating SPSR_ELx, but must be
> >      * hidden from aarch32 mode, where it is not visible.
> >      *
> >      * TODO: ARMv8.4-DIT -- need to move SS somewhere else.
> >      */
> >     return cpsr_read(env) & ~(CPSR_EXEC | PSTATE_SS);
> > }
>
> I forgot about this.  So we can't "just" store DIT in uncached_cpsr.
>
> I'll let Peter weigh in, but I think it makes sense to move the SS bit
> somewhere else (e.g. env->pstate) and merge it into SPSR_ELx upon interrupt.
> While what we're doing here is convenient, it's not architectural, and it would
> be better to follow GetPSRFromPSTATE pseudocode.

Yes, I think that's the best thing to do. We've been skating
by on CPSR and SPSR being the same thing and it's just
stopped working.

-- PMM

