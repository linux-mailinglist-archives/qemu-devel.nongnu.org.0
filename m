Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B37488888
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:40:32 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Ugh-0001zO-N0
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:40:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTb-0004bY-G9
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:59 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55716
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTY-0006Ke-P2
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:59 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0368C62E77;
 Sun,  9 Jan 2022 17:26:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720405; bh=E8mvOdiJLio3Sjin91AoTuw2Wojjy7N2CI1LMSOUOUk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=UL81DHvPKF27aAf+hcp62iH/Eu+HWsVPJfWRQ9JsEc1IEtDu+tI24oZwF8Klk8rfM
 87kcdgJhpcptGbmJpC5wsEVgfU76LZGksXwHMVbKS+T1jtlS7htcLh8JoTvY/yZSbs
 6fEG/6nXrUJC3LmxAThNidtferoBZBA9BGGbj6lc=
Message-ID: <0ab09818-3e50-31db-c425-c70cc84ee509@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 25/26] target/loongarch: 'make check-tcg' support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-26-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-26-gaosong@loongson.cn>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Acked-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   tests/tcg/configure.sh | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 8eb4287c84..c3d7e45524 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -51,6 +51,7 @@ fi
>   : ${cross_cc_cflags_armeb="-mbig-endian"}
>   : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
>   : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
> +: ${cross_cc_loongarch64="loongarch64-unknown-linux-gnu-gcc"}
>   : ${cross_cc_hppa="hppa-linux-gnu-gcc"}
>   : ${cross_cc_i386="i686-linux-gnu-gcc"}
>   : ${cross_cc_cflags_i386="-m32"}
Reviewed-by: WANG Xuerui <git@xen0n.name>

