Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257653907D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:17:50 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0on-0005n6-5q
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0kl-00037I-5q
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:13:42 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:35645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0kh-0003So-Oj
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:13:36 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-30c1b401711so73540187b3.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BFKjmtnXqW55CDR8fdtXdPj6OfmSaEEc7QVS09Rq2hE=;
 b=k9pEO2xzRQCMQVb7rWc0FONxooAaR+KK2KknGr7MJ5PB+b8sQsjDLC0oWyjuYfLBts
 1g/YIBz7e62fJs3DISct5bYnt8aRDva3RzWe8rvQbASpmeOLNdNBEJV/9/eXgsSgX9Wf
 JcJv3d2a20j74vFOLb1wS4nsRyzBIVW/CmpWWSeXnQhEhFWAtEEaDnm8oc5mGKcyRkAU
 gkJtyKfs4V9ajjRRo2ZM+WCXGARt4fEIRslOF6eDqltxxDqXPIehLM9mCvvetwjBRdNh
 SonMj6UeSP1E63e9sGsB039jBygot9+1mEhb0hVyNcEFrEVj0pPpbqBCfbAHIhGjzf6V
 60rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFKjmtnXqW55CDR8fdtXdPj6OfmSaEEc7QVS09Rq2hE=;
 b=rKiHSsME7EDZjM9dtBxDWEBuuzRXKTwPeOEvKHfTToxXPJwOynN+vXvLBLTIgiTIAr
 s9a8R0o51GKPwpotT7TWHpHEStvD1KkoNcBTkripH6oDMch9AdG+v+eG4czsCt9lyk+1
 w0hZFZMs7tWBdlVegeOrLVcRwu7uy7tz2KlnpUL/pCKPD+/FpwLRnwL88a2pPMkv0d4g
 IfdPqPryDl09Go0jaFmM26jroGuqBcaVMT4Wm7jyKJhmLFCgBvqc75E8MLxKv5FBxcZA
 GUQHdOXcI/sN/qxk107mZzFAdoz3LBwrBbtTOQzyKD0+0/PQILIPnnMzxasjT0Il4ZC5
 LlVA==
X-Gm-Message-State: AOAM5300Se76/U6XWgILAZlKf0ZeCf8iITTPTAzcWafJD2sqbopT337H
 63dfrrCmM2l/Y9+/9nmcehXOrBivS/wggt6grsCd+Q==
X-Google-Smtp-Source: ABdhPJzxAEmPYgDO7FJco5qEgEvLrTxa+2V5nwmC1UqD0Qp8VRB6W4cEKcqMwyhDZSPo0ys95qeUJo27Wcyzj9m+RcY=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr7083178ywa.455.1653999213982; Tue, 31
 May 2022 05:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-2-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:13:23 +0100
Message-ID: <CAFEAcA-NWP95FCUBzC2jKJ2V9ioCnuLjcM+zq3DAPV_4oKiZTA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] target/arm: Rename TBFLAG_A64 ZCR_LEN to SVE_LEN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Fri, 27 May 2022 at 19:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With SME, the vector length does not only come from ZCR_ELx.
> Comment that this is either the SVE VL, or the Streaming SVE VL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

