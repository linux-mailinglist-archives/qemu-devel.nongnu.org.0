Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0595EFBFF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:28:53 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxL9-00018s-AR
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvTn-0008Ki-B0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:29:39 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvTl-0007VB-Lq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:29:39 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hy2so3541188ejc.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kOw2PfsqjA9PeHoLDljprV+sUjfX8jWcZQWDNyq0/FY=;
 b=tH5GV7neVLuUWmHNd2ihnnSQSfclGg7WYA/EAjQRTQtxV8mDiS8yUr0cmec6PFz/0o
 pEqtDFpTrtiFkAPFbKy0jeZ7PagII8dRMEKucTFNuenOZQbPa9/VDHcLxoWA6DXzV1JT
 6oUg5S+Fbo+mW0SszZq4Zz1n1WHvrxEAjzPyg1VGAfnzrNHb0m8YyVY7IWv5KzLuo/oY
 MbLvBdPKYBciInW4PvuCSRl5ybSwBsbIHy4DeInV+GfOlldN756buX0U61RCmhhhxz2n
 aEDXaVDgbTk3Sjy5jsl9wQ+HgzdLUHsIalodm/4tkA3iqQ90WweV0A+jwmNMt0Ulx/WU
 3j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kOw2PfsqjA9PeHoLDljprV+sUjfX8jWcZQWDNyq0/FY=;
 b=aiqTln1zFCugampEm7//nvV9v7JLUBc+WlEs/dkTx/etSUzJPdBpnVW7rPHu+awLFe
 CDb2/qGA25IazfLRXtI4GKLIKKDPwLAoMtYOjqVkTlUqGH/F8zuGRUark9aS7dqnv10B
 C/1G2pT4YaSUq2TSaMI7ekYahDGl6VJ9h63U3dCe3JdaZja5+ALkTg36DV0bBlR858fQ
 bQQxhgX0CbkAu2UL2i/pBeLwqmpHoiLpZ2OKDRwok1h+egPdpWuCu6JghUcqn1liEan/
 rzuY5Z/2ycCPOCje97iPVLuKmxS93pFwffbLUKvNgCQIaQWbe2MAAqvPaWT28tqdVMmz
 Gz0A==
X-Gm-Message-State: ACrzQf1u+Z8MWGamR5CF4nPS6TQc5El0RJ+qDR+kKSMpsRJUud9d6FMi
 t9RmzOS4GetOhWqHlJIeBT5nlKVLCRd3IeXo6OttXw==
X-Google-Smtp-Source: AMsMyM7lsT6nPvSleAJ7+9ReTOdcMNUZ++FZo+bxr28iXlkvh3tf2sP7be06jAQYRBwmYv2npEJ2QmC9mSt0S/HlvyM=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr3059091ejc.619.1664465374378; Thu, 29
 Sep 2022 08:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
 <12117a96-6b68-3146-3576-261228f15203@linaro.org>
In-Reply-To: <12117a96-6b68-3146-3576-261228f15203@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 16:29:22 +0100
Message-ID: <CAFEAcA-bXQp=eLs+4orqbRV+E8ATauuGVHv4zhZGVa99ZgqT4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Sept 2022 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/29/22 04:44, Peter Maydell wrote:
> > Architecturally, Neon implies that you must have 32 dp registers,
> > but not having Neon does not imply that you must only have 16.
> > In particular, the Cortex-A15 always implements VFPv4-D32
> > whether Neon is enabled or not.
>
> A15 requires VFP == NEON in its configuration.

No, it requires that if you have Neon then you have VFP;
but it allows all of:
 * no VFP or Neon
 * VFP, no Neon
 * VFP and Neon

https://developer.arm.com/documentation/ddi0438/i/neon-and-vfp-unit/about-neon-and-vfp-unit

-- PMM

