Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60BE2DC2A1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:02:12 +0100 (CET)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYJf-0003ea-MI
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYHK-0002gn-4V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:59:46 -0500
Received: from relay2.mymailcheap.com ([217.182.113.132]:48936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYHG-0006X6-C5
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:59:45 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id EA4923EDFC;
 Wed, 16 Dec 2020 15:59:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id CC0D52A5BB;
 Wed, 16 Dec 2020 15:59:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608130779;
 bh=vBGMYn3+nMdmDe6WU3WxSPubLKNRvILozTH8XbB4W5g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cAiZUWVj7zURU9TnRYQ39TDc2E//Ibkx0UVxXaSSG6mSl0Tn/iHEHSt9kr2ZMpmOH
 8oGj5RPyYMLdv0qhmDqbUdoaAecFmLw3FsAvP7l4dm4JnIFep7lX9hgDe4Bz0ndm2S
 F+ldw68tlCQVP3oBG2ODR5vp6eh4Cxm5mZdnmmj0=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MZaQFwAV6gm; Wed, 16 Dec 2020 15:59:38 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 15:59:38 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 580C942F5F;
 Wed, 16 Dec 2020 14:59:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="NYzroKKc"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.43.15] (unknown [114.85.170.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4C68842EF6;
 Wed, 16 Dec 2020 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608130774;
 bh=vBGMYn3+nMdmDe6WU3WxSPubLKNRvILozTH8XbB4W5g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NYzroKKcPd7Y4oXILwKVKD0UxUDBYxFV2PSuJoOfv5uK33TBPp15zhrSLhV7NxycW
 szyX+DIXlAAu5m8GuqfzTzPmUgeJpPPQqdH6YL6XaRrF3JNzjkUda01FKP7a9QtbdS
 2ppDHlKqxlXbH/AaBxUOe2U3i8hXhE36DJdLdpeM=
Subject: Re: [PATCH 02/11] target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
 <20201216134328.851840-3-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a544f9b4-ed19-7536-37f1-b863753f4f98@flygoat.com>
Date: Wed, 16 Dec 2020 22:59:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216134328.851840-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_PBL(0.00)[114.85.170.252:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all:c];
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[7];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 580C942F5F
Received-SPF: pass client-ip=217.182.113.132;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/16 21:43, Philippe Mathieu-Daudé 写道:
> MIPS 64-bit ISA is introduced with MIPS3.
> No need for another bit/definition to check for 64-bit.
>
> Simplify CPU_MIPS64 definition as CPU_MIPS5 contains
> CPU_MIPS4 which contains CPU_MIPS3 which contains ISA_MIPS3.
>
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/mips-defs.h |  5 ++---
>   hw/mips/boston.c        |  2 +-
>   target/mips/translate.c | 10 +++++-----
>   3 files changed, 8 insertions(+), 9 deletions(-)
- Jiaxun

