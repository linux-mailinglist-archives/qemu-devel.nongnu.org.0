Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB32E3182
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:27:42 +0100 (CET)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktX1J-0007f1-Qx
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktWzF-0007A0-A5
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:25:34 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktWzB-0007IS-A9
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:25:32 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c5so8264905wrp.6
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wVN2P/O1NOlibFNThmrAVaaIEdUuje8eZ2w99eh1Ezc=;
 b=tX726NdHiE/dH9++ZurEIMp414GoVxJLyUEJRzq3mQeJzW6KtRNU7W1ewqFPR/UCHG
 Ea3C2WAUC4EQWeCuHyhwljyV63fiOc3ueKPhzPYZGmcUA/IdEBPnWg8OZBsk00qrynC+
 9o8jISgLkrMIiFmn5RPhlcP0tMMaw9eI/Lj/XjH5EieDxIGrW8AjaFBKuHqbM6OsOm4T
 rTaBt6Dm81HMc/HnqhSWfMDqb/5kpantBuVd6vKkPO38FgEfIQrU2gZbVFh7yL5ugEgz
 HYmsmLSsxNF2Zlxd7kX1dGjLmgMpr5zEeIHU8+hayLFEDm4NvfUu+McOxhKNOsBPl99S
 HBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wVN2P/O1NOlibFNThmrAVaaIEdUuje8eZ2w99eh1Ezc=;
 b=tmD2i2qr2XtrMXS1GcBkiN0RpGlNN8qpWg8O2shes81qrHOtrTkBq3ocCDUhVEqNIj
 IHLQ2zGWKwu+NANe+qy3QtB5btusswhxyXn8xQ95mTh33g6pkbmkAePd7Ualdt2NhLrb
 MH0Vy9s6mfgAgOGjmDxshJ/DS5/lVlPHsktAJO5DdgPjyhsESeGbp5Vm37h5ggE5WWyP
 jXYbKWtzMMb+kLkzbvnFC+OmfFUYpls+AoeDtTbv/aEIgdcsKV5sAI9omaReFwPMIQsN
 WPHRn/jK5yVn5stTlxjnNPHExQH/j/BrFc8kUZ3Q44wvrU+v0gRLhsCCiXMvmGWWZ8z9
 jISQ==
X-Gm-Message-State: AOAM533zpOCEoyE0c0yMLB/ZWzQ7DAHxouYR7wVv7le1jUA+rpoF+03P
 1ycMLnv90IazdB7u9nMW0jA=
X-Google-Smtp-Source: ABdhPJx5rfW4dy+82xZp0r9jYWICOUNgOxOmyCOcLzM93QWFOu/l2ZotvuEedaJdAOOJBEVf8z/5Yw==
X-Received: by 2002:adf:d082:: with SMTP id y2mr47840569wrh.301.1609079127032; 
 Sun, 27 Dec 2020 06:25:27 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id h13sm50775852wrm.28.2020.12.27.06.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:25:26 -0800 (PST)
Subject: Re: [PATCH 11/12] vt82c686: Rename some functions to better show
 where they belong
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <599e3174ab2cbe105d17733ae25c1a7f22030dcb.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0358f554-7e7a-d5f4-e9f3-23341b98690d@amsat.org>
Date: Sun, 27 Dec 2020 15:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <599e3174ab2cbe105d17733ae25c1a7f22030dcb.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> This groups identifiers related to the ISA bridge part and superio
> part also in their naming.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 48 ++++++++++++++++++---------------------
>  hw/mips/fuloong2e.c       |  2 +-
>  include/hw/isa/vt82c686.h |  2 +-
>  3 files changed, 24 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

