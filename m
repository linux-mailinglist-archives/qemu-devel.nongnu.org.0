Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D06BFF9A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 07:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdmlH-0000pT-Kl; Sun, 19 Mar 2023 02:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pdml8-0000or-SC; Sun, 19 Mar 2023 02:43:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pdml6-0003aS-SC; Sun, 19 Mar 2023 02:43:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6BFFA40158;
 Sun, 19 Mar 2023 09:43:07 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0F5D6123;
 Sun, 19 Mar 2023 09:43:07 +0300 (MSK)
Message-ID: <9de0a5b4-0384-7b87-17db-e43b4c175f44@msgid.tls.msk.ru>
Date: Sun, 19 Mar 2023 09:43:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] doc: do not recommend -blockdev
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
References: <20230318075159.97849-1-mjt@msgid.tls.msk.ru>
 <874jqiw7rl.fsf@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <874jqiw7rl.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

18.03.2023 15:32, Alex Bennée пишет:
..

> Could we expand the images section:
> 
>    https://qemu.readthedocs.io/en/latest/system/images.html
> 
> to give a better overview of when you should use -device/-blockdev vs -drive?

Probably. It's not really about image formats but this info should be
somewhere anyway.  It's a separate step though.

>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>   qemu-options.hx | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 59bdf67a2c..8fe31b465d 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1143,7 +1143,7 @@ have gone through several iterations as the feature set and complexity
>>   of the block layer have grown. Many online guides to QEMU often
>>   reference older and deprecated options, which can lead to confusion.
>>   
>> -The recommended modern way to describe disks is to use a combination of
>> +The low-level detailed way to describe disks is to use a combination of
>>   ``-device`` to specify the hardware device and ``-blockdev`` to
>>   describe the backend. The device defines what the guest sees and the
>>   backend describes how QEMU handles the data.
> 
> How about:
> 
>    The most explicit way to describe disks is to use a combination of
>    ``-device`` to specify the hardware device and ``-blockdev`` to
>    describe the backend. The device defines what the guest sees and the
>    backend describes how QEMU handles the data. The ``--drive`` option
>    combines the device and backend into a single command line options which
>    is useful in the majority of cases. Older options like ``-hda`` make a
>    bake in a lot of assumptions from the days when QEMU was emulating a
>    legacy PC, they are not recommended for modern configurations.

This is much better indeed (with one exception, the double-dash in --drive
isn't usual). Would you like to send it as an actual patch?

Thanks!

/mjt

