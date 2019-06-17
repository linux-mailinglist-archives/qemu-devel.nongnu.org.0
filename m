Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5F48149
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:52:07 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcqBA-0000Zq-UR
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54567)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hcpvo-0001vV-Ue
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hcpvo-0007xH-1c
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:12 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33719 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hcpvn-0007wC-Pc
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:11 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 91CD31A21B4;
 Mon, 17 Jun 2019 13:36:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from [10.10.13.132] (rtrkw870-lin.domain.local [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 76FFB1A2158;
 Mon, 17 Jun 2019 13:36:09 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
 <1559816130-17113-3-git-send-email-stefan.brankovic@rt-rk.com>
 <d73b67d1-5776-d9e6-3d7d-2c3e84f3b9a9@linaro.org>
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
Message-ID: <17adc6f6-4503-6390-0693-35f1946c8d44@rt-rk.com>
Date: Mon, 17 Jun 2019 13:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d73b67d1-5776-d9e6-3d7d-2c3e84f3b9a9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: Re: [Qemu-devel] [PATCH 2/8] target/ppc: Optimize emulation of vsl
 and vsr instructions
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6.6.19. 19:03, Richard Henderson wrote:
> On 6/6/19 5:15 AM, Stefan Brankovic wrote:
>> +    tcg_gen_subi_i64(tmp, sh, 64);
>> +    tcg_gen_neg_i64(tmp, tmp);
> Better as
>
>      tcg_gen_subfi_i64(tmp, 64, sh);
>
I was aware there must be way of doing it in a single tcg invocation, 
but couldn't find right tcg instruction. I will apply this in v2.

Kind Regards,

Stefan

> r~

