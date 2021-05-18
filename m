Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00669387D2B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:15:39 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2Ne-0000i5-21
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2Ch-00032V-T0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:04:20 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2Cf-0000oR-1X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:04:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id b17so11884832ede.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKlegO0j26ymEWX7vm+vV6Gv9F4Nfcn7+aAaew3lYMM=;
 b=V+sqAyc6ORoW0VHIDAPdHj90Rit/myCB6ZkXvHpMgRyaErgEDUNKMhQKlChxuzBkT2
 m2uvyG4qLLa0tKgz/ovJFQ8kr3UDN4xJ9yOMah3FI1bGrCeY758h7QAjqT8/lGDRy1ET
 rZNVDQDPSHq2KcTINiC0JRLz2sZmKZIEhgw7ebIPgOL5WmHSur2K0dqKxneFU1RqGCPJ
 m3GBO+Y75shAdP+gTjNWQixtiL/TvwAU76cRZEKcOxm+VIiZG3XDAjoDFSByAVXrI21v
 m72qMkTrpP2DduT75Kb5eUP6UasmTdYxu4X0Ue0I2CdFOS92xSzzA5J25+QNZyBYdfv6
 2/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKlegO0j26ymEWX7vm+vV6Gv9F4Nfcn7+aAaew3lYMM=;
 b=IyVt1uQRJg801Y6fb/6SCPsHhiaTY9//xHCfrEbG7/aojKkyV7LSO9vmyV4sFbCGV3
 AEJxds6Zk9+FyZVEhOfUGXMtIYLrIYgbIFTK7ej5d/GpXcVmzxGH+tBf5OtT5RMwl6O5
 wTCQ02XM/HTBN/Ntmvk/RlFq46H0SKtLnhRactPalwFoXqe2nKyxNFBXD1xq8gvjOCxi
 +Tq892KQ5UhaTFOyuF4cvN8DZMOk5BVrUysd3nFKEcvtEtUo9Sc8CiFwYbiyh6KZMfVS
 7AKdlRb1gsT0pPY3VKXyhmy24gwYKvM9iHRxDQ3q8/RMqlPvfEc6n9fGut3/fJ/RQxQS
 ZorA==
X-Gm-Message-State: AOAM532+awzciGoXlTrrNQBuCYSJLw2spovG4uVrQjdx/or98dCSLfNb
 rU8KWlWJ8U0CqSuhVcW+ZsMX03jpiTGuLOVZ6PrTBA==
X-Google-Smtp-Source: ABdhPJy1oFhYzQiLPF9dFvbER6CzD8fBLLnN/LD8yKVvy2uw49SYHARigSh+QRbvcuPQ2FCn1ie0iVkfUmMpdh9MBUM=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr7839560edt.36.1621353854291; 
 Tue, 18 May 2021 09:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-8-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 17:03:57 +0100
Message-ID: <CAFEAcA9jJYwq8kRRUwqeaD6-fPcF5fHt6JEnE2=ufKEBAi0HJA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

