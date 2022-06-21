Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A055535DF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:24:20 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fjn-0003Ve-J8
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fhs-00024u-6F
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:22:20 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fhn-0005Ip-Dt
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:22:19 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e4so12377018ybq.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EdQIpJzj9XVVFasKHXpEbEDMCzS4LEkfWXtGvmEL+9c=;
 b=zWl5hNY8d4VxmXfcEbZ5ukCJm2WJoJETfA+goY2EOV3QaFRzS0ytR/XrC4wC3Ld7TC
 I3AhciNk/aY8XvaIDb9qndud4yUug86v65lISNQU4+1Yp9Pq+HVMA4GfCBcGBHcqtC+d
 U3EKAweR6e7cgNB2IMC+8pzIIOwtXBHYzSEcC+ixGFB69zyHsL7PYW57CmB2PvmX2Hlc
 xUzWPRyz6Wpyj7WBVG4aEZlI1DwUmEUlhtZoTDWRZ6vQdzL30hzMmYzZ3oC3lgkvnLgG
 /7M5s49x+4TTqFPiorPmxSvzj590S20J6iyDhzLCWy+CWNXjdgSH0klqPVApQ3dGUem9
 g9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EdQIpJzj9XVVFasKHXpEbEDMCzS4LEkfWXtGvmEL+9c=;
 b=Fx3aNo+BK3nibzeVGr6FIlm1LA8xRRQOaiI58iq+nDusbKp0TWPax8M9REP8vBrcel
 vO9lXzrYZzVytKetm1nRlr+47OnEvas2c+ExB4Jsn+Oa41SfhC8sX7/Ir5HOga86ULEZ
 e2aCUDszn89YC982iKSwLaKWtH21nU/tgxKKLA5Kd3bTn/7o5dyFOVTW1YzMHRq3x8dd
 m3SID+/F2zJEWG6t276TRgl06uOJghDIXkBC4NvNs/MN4YrzjbN0S2keeESUzsviUvly
 10SsVZGjxLK+5Npu8VjvS4+Fx9x+xQw1ZORROZIrfdAVfcMtJf/i/f1xbISDwSu3Fh5k
 kV5g==
X-Gm-Message-State: AJIora+s3e4oyOnVkrqvf16fVEzNhHk8WmWeocWGU9jGrEy0Ym8PyUKv
 aME5OQe2TSodlj6NPuQM1Ex3d+fdWAciOKHWLGHVmg==
X-Google-Smtp-Source: AGRyM1vv5beIFZ4O/77ae546gYVvFCTzrZ8PG35AarKNmJCMCG16vNXF1bCxG/LZkwjFn6HMpBpmWMkZ2D+I1Oo8oL4=
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr21647522ybu.140.1655824933200; Tue, 21
 Jun 2022 08:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220621014837.189139-1-richard.henderson@linaro.org>
 <20220621014837.189139-4-richard.henderson@linaro.org>
In-Reply-To: <20220621014837.189139-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:21:36 +0100
Message-ID: <CAFEAcA9JVzV2s157K6zw5PFzOYodQcRAcPvC29JPkqqCUXz1uQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] util/cacheflush: Optimize flushing when ppc host
 has coherent icache
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, npiggin@gmail.com, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Tue, 21 Jun 2022 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Nicholas Piggin <npiggin@gmail.com>
>
> On linux, the AT_HWCAP bit PPC_FEATURE_ICACHE_SNOOP indicates
> that we can use a simplified 3 instruction flush sequence.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Message-Id: <20220519141131.29839-1-npiggin@gmail.com>
> [rth: update after merging cacheflush.c and cacheinfo.c]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

