Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F25595CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:54:34 +0200 (CEST)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f5F-0007SE-Hy
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4eu5-0003MB-Rx
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:43:03 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:53284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4eu2-0007iE-KR
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:43:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id C58013877E5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656060175;
 bh=j1A5Pea82mqVnFxZrObKlXuML62ZMtmvc09/LUAX0iM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iTDdgUt4qQbD6Bqas4twN8F0EJRu9k+gSGuuXOFsMDGN86kObVHDO4Bq2sDInInMu
 HgBset9reMMnl3wF2/AgBxV7XdqRfCkjkb6HPJzYEIzuvV/N2dKs9/rJOjSf9rc1Ah
 IPLqJRp72FNJQoM8GmbXER9ySbYtXlKv7J0V7Fhc=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 6972D3877D7; Fri, 24 Jun 2022 10:42:55 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id E2D4838778D; Fri, 24 Jun
 2022 10:42:53 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id C226F27E04FE; Fri, 24 Jun 2022
 10:42:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id AC50827E04FD; Fri, 24 Jun 2022 10:42:53 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 CGN9y-rg768J; Fri, 24 Jun 2022 10:42:53 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 93E2327E04FB; Fri, 24 Jun 2022 10:42:53 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <8df6.62b5790d.e1db2.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AC50827E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656060173;
 bh=NKbZcO0PuXFuoxb5937eF/h/jzngVh6mn5oK4K6t1FU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=XZdeNd0dliKcVmjy/jKYh5C5DJmhwp6rJ4yuoqTxI4sOKS89QL7mCEi6FCcs8wSB1
 CgX7HOjfJ82mJO9BToRr5ycwvs96QfxUViL+UZmY7SKP78/wZ5D2xicsjpzB4/qZWE
 3IiJ2vharUHvT10xCYO/jJu/et9cOIPH04CdoL9c=
Date: Fri, 24 Jun 2022 10:42:53 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 41/53] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
Message-ID: <20220624084253.GI25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-42-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-42-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
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
> The implementation of qemu_semihosting_console_inc does not
> defer to gdbstub, but only reads from the fifo in console.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 0238f540f4..4f6217bf10 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -41,11 +41,10 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>   * qemu_semihosting_console_inc:
>   * @env: CPUArchState
>   *
> - * Receive single character from debug console. This may be the remote
> - * gdb session if a softmmu guest is currently being debugged. As this
> - * call may block if no data is available we suspend the CPU and will
> - * re-execute the instruction when data is there. Therefore two
> - * conditions must be met:
> + * Receive single character from debug console.  As this call may block
> + * if no data is available we suspend the CPU and will re-execute the
> + * instruction when data is there. Therefore two conditions must be met:
> + *
>   *   - CPUState is synchronized before calling this function
>   *   - pc is only updated once the character is successfully returned
>   *
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=5699.629fd40f.c3695.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+41%2F53%5D+semihosting%3A+Fix+docs+comment+for+qemu_semihosting_console_inc&verdict=C&c=4edb0e3b3a44b5db8e011cdb60e9e8174e2cc844
> 

-- 





