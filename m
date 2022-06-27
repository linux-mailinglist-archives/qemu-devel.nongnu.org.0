Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBF55B846
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:39:16 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jL1-00006V-Tz
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5j6D-0004Rw-UJ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:23:57 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5j6B-0004qx-Hm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:23:57 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id C27A6323662
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656314631;
 bh=g0O7hAuRjmBl/wb0Jw7pBOxO1Nq3wRUREURr+xKlR5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hBPNVz3r/dPCMolfxW+9JMJw20SdGf0rV8Rv4xRQfcNsvB3BhIMuPEwSFrovutCWt
 Goevc9CuQg1Dn6hexz3oLckLfn84IaSfbdmOgNGtWjRXkaeWE03H0uwgRV4uGuBBvs
 TiPGFAQN0RAkKjFe6H0KbjIk1rjqQH6GchAHxMGw=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id 73B653237C5; Mon, 27 Jun 2022 09:23:51 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id AA889323788; Mon, 27 Jun
 2022 09:23:50 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8638227E04D6; Mon, 27 Jun 2022
 09:23:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 6FBE227E04F8; Mon, 27 Jun 2022 09:23:50 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 RI4j4FO1pH5n; Mon, 27 Jun 2022 09:23:50 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 5111A27E04D6; Mon, 27 Jun 2022 09:23:50 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <b53b.62b95b06.a50e1.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6FBE227E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656314630;
 bh=vfS4u9frxa9e/3D3Qwfqj+KjygrPIShcMMB/LULBESc=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Tp0X8HS5OvARa94zwaWpGuZTztJedSME1pJjBXLY3ByptW5js5FI9PREQL6iQNpct
 e6Py880lcsImo+qH4JL2e35cTwWOOwiwVQOC9CQXyW2P0jujaKNycQzJxkx5C7xb2o
 MVGlvo6vm5W/7VSvTDOvGbE+WWLjXHWGLCs2QpIo=
Date: Mon, 27 Jun 2022 09:23:49 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 45/53] semihosting: Create
 qemu_semihosting_console_write
Message-ID: <20220627072349.GA1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-46-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-46-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Will replace qemu_semihosting_console_{outs,outc},
> but we need more plumbing first.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h | 12 ++++++++++++
>  linux-user/semihost.c         |  5 +++++
>  semihosting/console.c         |  9 +++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 39dbf1b062..6994f23c82 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -54,6 +54,18 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>   */
>  int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
>  
> +/**
> + * qemu_semihosting_console_write:
> + * @buf: host buffer
> + * @len: buffer size
> + *
> + * Write len bytes from buf to the debug console.
> + *
> + * Returns: number of bytes written -- this should only ever be short
> + * on some sort of i/o error.
> + */
> +int qemu_semihosting_console_write(void *buf, int len);
> +
>  /**
>   * qemu_semihosting_log_out:
>   * @s: pointer to string
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index 2029fb674c..871edf993a 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -76,3 +76,8 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>  
>      return ret;
>  }
> +
> +int qemu_semihosting_console_write(void *buf, int len)
> +{
> +    return fwrite(buf, 1, len, stderr);
> +}
> diff --git a/semihosting/console.c b/semihosting/console.c
> index 4088192842..b6a342744d 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -169,6 +169,15 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>      return ret;
>  }
>  
> +int qemu_semihosting_console_write(void *buf, int len)
> +{
> +    if (console.chr) {
> +        return qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
> +    } else {
> +        return fwrite(buf, 1, len, stderr);
> +    }
> +}
> +
>  void qemu_semihosting_console_init(Chardev *chr)
>  {
>      console.chr = chr;
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=17cb8.629fd4d3.e3b54.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+45%2F53%5D+semihosting%3A+Create+qemu_semihosting_console_write&verdict=C&c=62fc4b596a4980c709b5ba86793f19d99fbc6d6f
> 

-- 





