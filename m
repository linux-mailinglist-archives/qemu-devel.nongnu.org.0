Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A228544CC1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:58:25 +0200 (CEST)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHk0-00019G-55
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzF8e-0007Zf-S1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:11:41 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54600
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzF8c-0007fz-MS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1654769491; bh=kEs30DEEDJDThBNkrIyw2BZ7ByGWanqV4PRozAJJcXM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tNtg+FoB/bIVS7XzXhqVUzfEUxG4FiPss6kD6rv7FWEUTgngcPKVKk/Zq1n+QPOIr
 FVgTJVXPuaot/BnMPj4dLbDPl8qXIVCep/GhzPgUgOQrtn1MTnhK0/0Q4ZBQ4qITfu
 MEMmHnhw5fS658zcluziTdevB9HQl8ZkdqNe+lvc=
Received: from [100.100.57.190] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8EFAA60694;
 Thu,  9 Jun 2022 18:11:31 +0800 (CST)
Message-ID: <9a5d26df-1820-f8c6-c876-a977d252b95f@xen0n.name>
Date: Thu, 9 Jun 2022 18:11:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:103.0)
 Gecko/20100101 Thunderbird/103.0a1
Subject: Re: [PATCH v15 6/9] default-configs: Add loongarch linux-user support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-7-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220609024209.2406188-7-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2022/6/9 10:42, Song Gao wrote:
> This patch adds loongarch64 linux-user default configs file.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/loongarch64-linux-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
>
> diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
> new file mode 100644
> index 0000000000..7d1b964020
> --- /dev/null
> +++ b/configs/targets/loongarch64-linux-user.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongarch64-linux-user
> +TARGET_ARCH=loongarch64
> +TARGET_BASE_ARCH=loongarch

Simple enough.

Reviewed-by: WANG Xuerui <git@xen0n.name>


