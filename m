Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29A5A587D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 02:39:44 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSpI6-00077m-JD
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 20:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1oSmg8-0000Go-T1
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 17:52:20 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:49266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1oSmg6-0004QH-Qb
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 17:52:20 -0400
Received: from [192.168.2.145] (unknown [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DF4A6601E75;
 Mon, 29 Aug 2022 22:52:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661809933;
 bh=wLyab6RXY1aY+VWw3Gc8rHJ1ezdAoP2fqsQTyPPJfhM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fqdE1CqKyUHw5JSrTMe8iINBbJ2rsOaVgatEe7OQ7MibY5eYpEpPRtpGvZUkUdeTL
 qJZmQ4+Z2n+zA3X75muaCWuOCbmA1HxuIyn1AhSWVFFwyrYjQHndIc+//OXRhfr3I4
 trYIin97W8GIkGS2AJ6z/v0T6GjVCFnKHiv3wDzGflhBlaLifqGzgE+WNDaB1Wea7c
 t2/ra/FymV8tfKt0ri6HdJ9ZK4c98GVctXD8tcjjUHT4q7d+40h1o+4Cl5i9ZKh1fe
 53Y4ZwkvTFnwlp6EMyGQh/se9OZdf6+PrcEriffx8db2aIX1DRk2Vx0uYCNEERdkyI
 qmW0moxZ7OfgA==
Message-ID: <5cb4f479-f315-3b51-59f4-7f2e33c18b97@collabora.com>
Date: Tue, 30 Aug 2022 00:52:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/5] Update version for v7.1.0-rc4 release
Content-Language: en-US
To: Antonio Caggiano <antonio.caggiano@collabora.com>, qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, Richard Henderson <richard.henderson@linaro.org>
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
 <20220829154058.524413-2-antonio.caggiano@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220829154058.524413-2-antonio.caggiano@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Aug 2022 20:37:07 -0400
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

On 8/29/22 18:40, Antonio Caggiano wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  VERSION | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/VERSION b/VERSION
> index 1c944b9863..b8d5f3ebb6 100644
> --- a/VERSION
> +++ b/VERSION
> @@ -1 +1 @@
> -7.0.93
> +7.0.94

This patch shouldn't be here.

-- 
Best regards,
Dmitry

