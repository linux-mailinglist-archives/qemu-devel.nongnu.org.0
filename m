Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5AD544B74
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:13:58 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzH2y-0004w3-Ij
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzEs4-0000Q6-GM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:54:32 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54596
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzErm-00054l-GH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1654768443; bh=iyOXGfbHNW2JHFyQEq2I/YPuT9Q1cBDK0BuZqStXwiE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E32n+mLhVbyV/Gffek+CR2CIJ0S4RmlVhEHddZsfcmvHoqB3vIKW+DxDqLLBWI35E
 /vH2w1CTgUWl2D7WVSaB8p5DqhjEJjV6AydpTcpBaM//biU9OEGguhWIoU1wU5IpiQ
 5q2mSYdb/PzvlT0+rN/3vaPxEQrWCZ0dr0piO2zw=
Received: from [100.100.57.190] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 277FB60104;
 Thu,  9 Jun 2022 17:54:03 +0800 (CST)
Message-ID: <6df7787c-5625-93b3-fcb0-ed0b76e551b1@xen0n.name>
Date: Thu, 9 Jun 2022 17:54:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:103.0)
 Gecko/20100101 Thunderbird/103.0a1
Subject: Re: [PATCH v15 1/9] linux-user: Add LoongArch generic header files
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-2-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220609024209.2406188-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
> This includes:
> - sockbits.h
> - target_errno_defs.h
> - target_fcntl.h
> - termbits.h
> - target_resource.h
> - target_structs.h
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/loongarch64/sockbits.h          | 11 +++++++++++
>   linux-user/loongarch64/target_errno_defs.h | 12 ++++++++++++
>   linux-user/loongarch64/target_fcntl.h      | 11 +++++++++++
>   linux-user/loongarch64/target_prctl.h      |  1 +
>   linux-user/loongarch64/target_resource.h   | 11 +++++++++++
>   linux-user/loongarch64/target_structs.h    | 11 +++++++++++
>   linux-user/loongarch64/termbits.h          | 11 +++++++++++
>   7 files changed, 68 insertions(+)
>   create mode 100644 linux-user/loongarch64/sockbits.h
>   create mode 100644 linux-user/loongarch64/target_errno_defs.h
>   create mode 100644 linux-user/loongarch64/target_fcntl.h
>   create mode 100644 linux-user/loongarch64/target_prctl.h
>   create mode 100644 linux-user/loongarch64/target_resource.h
>   create mode 100644 linux-user/loongarch64/target_structs.h
>   create mode 100644 linux-user/loongarch64/termbits.h

So this is all nicely generic.

Reviewed-by: WANG Xuerui <git@xen0n.name>


