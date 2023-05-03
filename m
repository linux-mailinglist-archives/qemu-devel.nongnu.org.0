Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D723E6F6011
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:29:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJ5W-0003kq-PI; Wed, 03 May 2023 16:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ5U-0003hc-Ca
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:28:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ5S-0007o7-S4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L0IZbLvkSV8xY0bdspN8VKANzA4NCUOszHE1YlYXuUo=; b=Yd9LbFe5kjD4krWFp6FNC/PkD0
 tSsBgTifqZa/diTjtARquVS2VihmKMuZbB8d/qHwm4Swk036nzaGZ5/q4Is/gRj8gT/Omcf0QRxyZ
 9Y1+MGU1Vj1DeRUx8dqbTAx1F2EcjV1tepA8ELajkl7UUx3hzRm+BF5dzMy9pEGzC2xQCPGN+dxoX
 cMrOfdWvGfEc0wqH4WXGuNEBKhYXEB1iNru/EGUS/G07Qy7VnpZ6zPbew2B38cO/RW5mKD4xVpqrF
 2FVj1ICCWGM1IbaV4OXJoSiygAEXBqUKCcGPNxt3ZYgkFItjI3gqyYntdAhM/zYyt8LG0AafmjAdO
 DTQpaKB7v+5E33TO280LqtruN085v1g3uodPycdglgCudfEK/dv+U/7TT8LxJn9uRl8AsubWJp9nc
 YD3UxZxN4hrttKqkzAS0I24LB1EaEm5ByoCiNkoyof4aHRzEqi2f5TxiEzi+BrJUzR4dWxZpaozcQ
 Bqxdj1ompmOeJPwVeVvwpURnwPQqTxqs21sXqwkiATwJ49V8f7HTqg//vyU+98MXUoMkLcge9qemi
 mtgxVc+xXLfWA8NcwSsWQLgT+K8vc8RE24qbQGLN2b4MqHFdIz/1jicYTclWqTGkMGgKt2U/i/j5x
 obm4rsbFp8XdiSqbW0OCd7Vx+u2XOnINAeEsqmgG8=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ4T-00042y-UZ; Wed, 03 May 2023 21:27:34 +0100
Message-ID: <3aa11f77-b78d-c254-70ac-c05d627d46e8@ilande.co.uk>
Date: Wed, 3 May 2023 21:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-16-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230502160846.1289975-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 15/16] target/sparc: Remove TARGET_ALIGNED_ONLY
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/05/2023 17:08, Richard Henderson wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/sparc-linux-user.mak       | 1 -
>   configs/targets/sparc-softmmu.mak          | 1 -
>   configs/targets/sparc32plus-linux-user.mak | 1 -
>   configs/targets/sparc64-linux-user.mak     | 1 -
>   configs/targets/sparc64-softmmu.mak        | 1 -
>   5 files changed, 5 deletions(-)
> 
> diff --git a/configs/targets/sparc-linux-user.mak b/configs/targets/sparc-linux-user.mak
> index 00e7bc1f07..abcfb8fc62 100644
> --- a/configs/targets/sparc-linux-user.mak
> +++ b/configs/targets/sparc-linux-user.mak
> @@ -1,5 +1,4 @@
>   TARGET_ARCH=sparc
>   TARGET_SYSTBL_ABI=common,32
>   TARGET_SYSTBL=syscall.tbl
> -TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> diff --git a/configs/targets/sparc-softmmu.mak b/configs/targets/sparc-softmmu.mak
> index a849190f01..454eb35499 100644
> --- a/configs/targets/sparc-softmmu.mak
> +++ b/configs/targets/sparc-softmmu.mak
> @@ -1,3 +1,2 @@
>   TARGET_ARCH=sparc
> -TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> diff --git a/configs/targets/sparc32plus-linux-user.mak b/configs/targets/sparc32plus-linux-user.mak
> index a65c0951a1..6cc8fa516b 100644
> --- a/configs/targets/sparc32plus-linux-user.mak
> +++ b/configs/targets/sparc32plus-linux-user.mak
> @@ -4,5 +4,4 @@ TARGET_BASE_ARCH=sparc
>   TARGET_ABI_DIR=sparc
>   TARGET_SYSTBL_ABI=common,32
>   TARGET_SYSTBL=syscall.tbl
> -TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> diff --git a/configs/targets/sparc64-linux-user.mak b/configs/targets/sparc64-linux-user.mak
> index 20fcb93fa4..52f05ec000 100644
> --- a/configs/targets/sparc64-linux-user.mak
> +++ b/configs/targets/sparc64-linux-user.mak
> @@ -3,5 +3,4 @@ TARGET_BASE_ARCH=sparc
>   TARGET_ABI_DIR=sparc
>   TARGET_SYSTBL_ABI=common,64
>   TARGET_SYSTBL=syscall.tbl
> -TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
> index c626ac3eae..d3f8a3b710 100644
> --- a/configs/targets/sparc64-softmmu.mak
> +++ b/configs/targets/sparc64-softmmu.mak
> @@ -1,4 +1,3 @@
>   TARGET_ARCH=sparc64
>   TARGET_BASE_ARCH=sparc
> -TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


