Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACB5BAA25
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:12:34 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8Kn-00079n-Rr
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@freepascal.org>)
 id 1oZ8J1-0004nm-Bb
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:10:44 -0400
Received: from mail.freepascal.org ([178.33.235.90]:51128)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1oZ8Ix-00062P-7E
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:10:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id DF62818005B
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 10:10:30 +0000 (UTC)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefixng.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvbFX12r7UJx for <qemu-devel@nongnu.org>;
 Fri, 16 Sep 2022 10:10:30 +0000 (UTC)
Received: from [192.168.50.107] (gw-ics.u-strasbg.fr [130.79.210.225])
 by mail.freepascal.org (Postfix) with ESMTPSA id B7EDB180053
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 10:10:30 +0000 (UTC)
Message-ID: <d63b636b-aaf5-461b-d83d-827ee41616b4@freepascal.org>
Date: Fri, 16 Sep 2022 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Content-Language: en-US, fr
To: qemu-devel@nongnu.org
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
 <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
 <9b3aa9b3-f657-7087-9d4c-06e071f7da4d@linaro.org>
From: Pierre Muller <pierre@freepascal.org>
In-Reply-To: <9b3aa9b3-f657-7087-9d4c-06e071f7da4d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.33.235.90; envelope-from=pierre@freepascal.org;
 helo=mail.freepascal.org
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.816,
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 16/09/2022 à 10:38, Richard Henderson a écrit :
> On 9/16/22 10:08, Pierre Muller wrote:
>>
>>     I am using gcc230 machine for the gcc compile farm.
>>
>>     This is a big endian mips64 machine runnig Debian Buster.
>>
>> When compiling the qemu 7.1.0 release source,
>> the generated binaries are 32-bit mips binaries,
>> and I did not find out how to generate a 64-bit versions
>> of the executables.
> 
> Yes, that host seems to have been installed with the o32 abi instead of the n64 (or n32) abi.

Indeed,
>>     As mips32 seems to still be the default arch that gcc uses,
>> I don't really understand the idea of depreciating big endian mips32.
>>
>> Is this solely related to cross-compilation issues?
> 
> Yes.  Even gcc230 is fairly small for actually compiling qemu, it takes many hours.  So
> for many hosts we rely on cross-compilation from x86_64.
> 
> For that, we rely on the set of cross-compilers built by Debian 11 (bullseye) plus (!) the
> host libraries for that platform.  We cannot simply rely on crossbuild-essential-mips
> because building qemu requires many more system libraries than just libc.
> 
> In https://www.debian.org/releases/bullseye/, you'll note that big-endian mips is not
> listed, so we are now missing those system libraries.

  So this is not limited to mips32, as big endian mips64 is also not supported anymore in bulleye...

> We are not intending to *remove* support for big-endian mips, as 99% of the code paths are
> shared with little-endian mips, which we can continue to test.  But we are now saying that
> big-endian mips is not "supported" and might break.

   Thank you for your answer and the clarifications!

Pierre

