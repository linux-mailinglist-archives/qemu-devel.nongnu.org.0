Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AB6A9F67
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAOG-0001pc-Pp; Fri, 03 Mar 2023 13:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAOA-0001k8-Vy
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:44:19 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAO8-0007ew-JU
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:44:18 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q189so2045425pga.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=bTOA9Df5q0V+NQyltpkgQUtPGlWL/HYHUonQmNiX6yY3+UnFqH7O4HQYt0ILrtVK9J
 mZEDGmBTIvk6gRIPyFoYTMEwT8ZasHD8jsmCwvLck3g5mbXF8b5WbkMpea41KoU0CDKn
 doYXPo1fFZs2JGa4wqVNRxk4Dv0gNaecpDNH8scLg8KA1EDP0jAq90X68EsNh8OPci3N
 JUc2pGViAm52uXSqpkrgm3yWa1hqWd4y/Eg0H1AgsDXCHB4b4H2q2BE4aTrL5WJ/MioM
 7gDbRCLdRvJn/Rg6a8tAdUpZWTzaPgSXAhInITQct+kTJ9SE+ycV4O5/cZn75NjwnuT9
 3OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=1APwgoEjkx8pqmp7tGjIr5r5bnhs9v/fKgOMxvPWeSWx2nlICTIiw/xZwyAeTiDOsz
 yjs8JM4pHppkt1AY4i8xDXL4WNBcJnkB9SBK7F7KVBmJew5qLPXBwjmAjHVGDYQ+zjFc
 /TFoCWZyl4Zx2dIcnmmczaa5uMLe4tRD7ReN8Y4d1QhxGUPBwZeILMnNBx1ktnQhDAeI
 Eug2FUz+sd9K9mghNmfc8Zy8bQ+bAeied+/FbhKUNCwuU8PfnEe9rf0U61tZ4OTSydbf
 ySuv6vEhidGnVuk4XeMzHQXRV7hKMCucKOUxQds6kGB1icQbOpM4vjnvya9cponSeUsa
 HXyg==
X-Gm-Message-State: AO0yUKU32vQ8is39M/nbH8hk6Hu/D6IntLKFhU13faBGPSOKyMMKBHh7
 5FF8bICGyEwcZLjVdVE/S3E37Fal/eOEfYTMlSmciA==
X-Google-Smtp-Source: AK7set+enV2mf6xc6rTRBSHMstCHNSlxtzXkSi+5rsqQYTpQOLpbTd7oox3CL9NqVK+PEnNz5YzJPaC/+WLXuzaTXws=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr864956pgh.9.1677869055010; Fri, 03 Mar
 2023 10:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-20-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:44:03 +0000
Message-ID: <CAFEAcA_0BTp6YL_CEHDQBaNDiE3GSeV4pAFWyYBWRY6OKtTCjA@mail.gmail.com>
Subject: Re: [PATCH v2 19/76] target/avr: Drop R from trans_COM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This variable is not used, only allocated and freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

