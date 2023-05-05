Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFFB6F82A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:08:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuDr-0001UD-7Z; Fri, 05 May 2023 08:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDo-0001Sz-HF
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDl-0003rw-V5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-958bb7731a9so299873666b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288452; x=1685880452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IeE0tVUnAAHqiHSGH+f5XWMkv7TsILguSa4HC+yC1iM=;
 b=hMdr4GCUaI68TRF86RjfqmIuq2ROqfHmBZktJVb8X3XuzXJbKQ2wocFuYb5ywS1oip
 0vayBnie0xTmxntcGFV9WbcRY7YAvxoVC8eQHJ3C2kN2i9kIxQX4YTfka48BFIUQxlX9
 o4h19h8Oc7eefmcmLP3O7LqGSKkN90bc7uyncHpJNfDmOb2MbPkkxQ5ApZvqxdORbRCv
 EakmCJdih/sp9R6AFYYJBP48Vv1pnSaf08JnumaQdS8vR4/vtoGLZkw7b3jCjbPi9L9G
 uvNqHFnBIesgQ6KIzeH2DCR7EpwCI7H2FC+d8NKw5fN21Sk0d18K4IdT5IyyyJxksLHa
 Vr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288452; x=1685880452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IeE0tVUnAAHqiHSGH+f5XWMkv7TsILguSa4HC+yC1iM=;
 b=DG/a9nNoo7F+D6ZuLVx5ItFoXHeajDmAeFEXJ9RsIcvUZw1LeRWWsEL4a3JEMYWYG2
 gb5t3DNLM9tF7DVmH2X4XU8th/tE7rkWrO0J7C8rPIL8s9iFIpOYOnaLXL/QrcVK8ps3
 ybgkyfGmHTHloyqP0xIsgrJ75k9y8ZOeMp35ouzl9yh63zC5/j7F8Cp22UV3dMVpYNXT
 PZc5VuGWPgMO39hu1Hjw6PwfrywxV202ji/rZDlRCqgHfHvOktzG2tqYY9CbVJpuG9Fi
 8cuOZCoD5yGLbd2RMkLC8St+AV4ZY44BptDrZmqQFOakgoJJu0hyt3GRRKalV5uy98uU
 t26g==
X-Gm-Message-State: AC+VfDxqxhOYviId7b6r3IG46MizoryYSk7PiOXtqxXK+uSrI1Ou5DIX
 RQLe4DdyTaf2MH5TCVStjfuRhaDsCkUw1PZkjIC1Gw==
X-Google-Smtp-Source: ACHHUZ47gp9QmvWri8RxBgyOFoCQvBeFa0xb5LBnzYS8XLxx/1kS23WQeSRNz5B6PbOovwNu6tKR/Nrci0kzSlNqAyw=
X-Received: by 2002:a17:907:940c:b0:960:ddba:e5bb with SMTP id
 dk12-20020a170907940c00b00960ddbae5bbmr848052ejc.43.1683288452225; Fri, 05
 May 2023 05:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-25-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:21 +0100
Message-ID: <CAFEAcA9WXOKQ5Nw2gDvcsJhBOSvCd0L_HN__1yoNCWN8Hr-YoA@mail.gmail.com>
Subject: Re: [PATCH v4 24/57] tcg/loongarch64: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

