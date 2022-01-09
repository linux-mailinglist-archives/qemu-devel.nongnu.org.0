Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85548887B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:33:52 +0100 (CET)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UaF-0004pl-BC
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTc-0004fp-P0
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:00 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55712
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTb-0006Kq-52
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:00 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2F2C762E75;
 Sun,  9 Jan 2022 17:26:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720404; bh=FlITQgBVJIttRcNHd+wf4hZkkZ90RuDnJMNLvLbz1Vc=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=EbPcHzZVYHwjnA+swpoYm3/zAAmTxdMoctClLkg9+jdv//lc/xujVtwzUK1nwS3Gp
 F0c6gEIDtbh6KAmQQKf2zetoZ8oPRA4A9NruAsvsZ1BfiKStKt+Yi/OM9yKLLTd8Z+
 TyoY5BMNlbbfopHfZqpe4JoBeqP9mM95+/Mz0YIA=
Message-ID: <a96f6a64-c75c-20b4-cc82-331a4e258ee7@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 23/26] default-configs: Add loongarch linux-user
 support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-24-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-24-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> This patch adds loongarch64 linux-user default configs file.
>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   configs/targets/loongarch64-linux-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
>
> diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
> new file mode 100644
> index 0000000000..5b0acfa3ec
> --- /dev/null
> +++ b/configs/targets/loongarch64-linux-user.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongson64-linux-user
"loongarch64-linux-user"?
> +TARGET_ARCH=loongarch64
> +TARGET_BASE_ARCH=loongarch

With that fixed:

Reviewed-by: WANG Xuerui <git@xen0n.name>


