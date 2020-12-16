Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D52DC289
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:56:10 +0100 (CET)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYDp-0006GR-LU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYCf-0005VV-9Z
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:54:57 -0500
Received: from relay2.mymailcheap.com ([217.182.113.132]:51783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYCa-0004qk-TN
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:54:56 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 58A023ECDA;
 Wed, 16 Dec 2020 15:54:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 3051F2A7E9;
 Wed, 16 Dec 2020 15:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608130489;
 bh=7ti6LtMY1mHW/t5si+silZ0FlK4FcmupPAFfg/e4oNs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=wFG7ZZIgfcV3OVy2YgJ2zA4TAQY70jWg/cZ6CVFDwEJ/d3g2s3//wVE3Knxd6hArT
 F7LRr7GHm5HmzHUGSV5Fc6Y/6u/wWSadTVmYRmaZPyfUwT8rMNj6fPqL4tF+2MfIxZ
 YJSRkJ8HMePA7ZHZpExrprgSd8r6NfnSM6pAPZss=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0axUinttqsDJ; Wed, 16 Dec 2020 15:54:46 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 15:54:46 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id D388742FB0;
 Wed, 16 Dec 2020 14:54:43 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="BQO08YiV"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.43.15] (unknown [114.85.170.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id E4F8A42EA9;
 Wed, 16 Dec 2020 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608130478;
 bh=7ti6LtMY1mHW/t5si+silZ0FlK4FcmupPAFfg/e4oNs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BQO08YiVZfrD6vd5tb3FUhQ8F46NtjmJjMWOuaODRSSXCtev5Fb7T0cMed2foNT9n
 lxnDHdonU9befAEtTMEgIz6eBh7INGby9Jau0O8BD1AG9YFZaFRE2YaCl0nzy2HMai
 Nh0Od97PnyerfgRzb8eogIkHfjRHxSmF6rql9dNQ=
Subject: Re: [PATCH 00/11] target/mips/mips-defs: Simplify ISA definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <61967fba-b63c-1216-16c8-b62504e522d5@flygoat.com>
Date: Wed, 16 Dec 2020 22:54:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_PBL(0.00)[114.85.170.252:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[7];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: D388742FB0
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
> As we don't need to duplicate 32/64-bit ISA defititions,
>
> this series remove the duplicated 64-bit variants,
>
> simplifying the overall.

Thanks, that makes things much more clear!

>
>
>
> Changes done automatically with my editor using "find
>
> and replace".
>
>
>
> While the 'ISA_MIPS_Rx' form is shorter than 'ISA_MIPS_RELx',
>
> which one is the clearer?

I'd perfer Rx to keep consistent with wording elsewhere.

Thanks.

- Jiaxun

>
>
>
> Regards,
>
>
>
> Phil.
>
>
>
> Philippe Mathieu-Daudé (11):
>
>    target/mips/mips-defs: Reorder CPU_MIPS5 definition
>
>    target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
>
>    target/mips/mips-defs: Use ISA_MIPS32R2 definition to check Release 2
>
>    target/mips/mips-defs: Use ISA_MIPS32R3 definition to check Release 3
>
>    target/mips/mips-defs: Use ISA_MIPS32R5 definition to check Release 5
>
>    target/mips/mips-defs: Use ISA_MIPS32R6 definition to check Release 6
>
>    target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1
>
>    target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_R2
>
>    target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3
>
>    target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5
>
>    target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_R6
>
>
>
>   target/mips/internal.h     |   8 +-
>
>   target/mips/mips-defs.h    |  40 +--
>
>   hw/mips/boston.c           |   2 +-
>
>   linux-user/elfload.c       |   2 +-
>
>   linux-user/mips/cpu_loop.c |   6 +-
>
>   target/mips/cp0_helper.c   |  18 +-
>
>   target/mips/cp0_timer.c    |   4 +-
>
>   target/mips/cpu.c          |  12 +-
>
>   target/mips/fpu_helper.c   |   4 +-
>
>   target/mips/tlb_helper.c   |   6 +-
>
>   target/mips/translate.c    | 620 ++++++++++++++++++-------------------
>
>   11 files changed, 357 insertions(+), 365 deletions(-)
>
>
>

