Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF91488887
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:39:49 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Ug0-0000NK-Rw
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTo-0005KB-6m
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:12 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55718
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTm-0006Kk-Dv
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:11 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 91C5A62E76;
 Sun,  9 Jan 2022 17:26:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720404; bh=8LF+DfmhKLz8MzPLhyJcVrCGDldWjCYO5UZ5J2QBeaU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=xRYgjtDRj/6yiJfTVNB3tLbuujf/PHmnj8wFxOFgjZ8gdc5W83O7Z8HTnRhXpv/Xk
 7WPps6Ckx2WVatfiyRxsCP2AcBns2b2Akukd9j72looBEyl0RBSTdZbwyh9sfwJf4c
 PtIuG+8Ubzl3tHn27RDH+KGZd+7fCtLRT+ZGM2iU=
Message-ID: <8614f944-057e-195f-88ab-fe7a08a22903@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 24/26] target/loongarch: Add target build suport
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-25-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-25-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> This patch adds build loongarch-linux-user target support.

Chinglish... You may just say "target: Add the loongarch target_arch" 
and remove this sentence.

> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/loongarch/meson.build | 19 +++++++++++++++++++
>   target/meson.build           |  1 +
>   2 files changed, 20 insertions(+)
>   create mode 100644 target/loongarch/meson.build
>
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> new file mode 100644
> index 0000000000..bcb076e55f
> --- /dev/null
> +++ b/target/loongarch/meson.build
> @@ -0,0 +1,19 @@
> +gen = decodetree.process('insns.decode')
> +
> +loongarch_ss = ss.source_set()
> +loongarch_ss.add(files(
> +  'cpu.c',
> +  'disas.c',
> +))
> +loongarch_tcg_ss = ss.source_set()
> +loongarch_tcg_ss.add(gen)
> +loongarch_tcg_ss.add(files(
> +  'fpu_helper.c',
> +  'op_helper.c',
> +  'translate.c',
> +))
> +loongarch_tcg_ss.add(zlib)
> +
> +loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
> +
> +target_arch += {'loongarch': loongarch_ss}
> diff --git a/target/meson.build b/target/meson.build
> index 2f6940255e..a53a60486f 100644
> --- a/target/meson.build
> +++ b/target/meson.build
> @@ -5,6 +5,7 @@ subdir('cris')
>   subdir('hexagon')
>   subdir('hppa')
>   subdir('i386')
> +subdir('loongarch')
>   subdir('m68k')
>   subdir('microblaze')
>   subdir('mips')

