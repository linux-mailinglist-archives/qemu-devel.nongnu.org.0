Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549A44090A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 15:14:01 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgoBL-0005Ks-PF
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 09:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mgo8z-0003uT-KY; Sat, 30 Oct 2021 09:11:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mgo8x-0007pq-Gm; Sat, 30 Oct 2021 09:11:33 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRTEp-1mJNZS411p-00NOtP; Sat, 30 Oct 2021 15:11:12 +0200
Message-ID: <777f45b4-62a1-e136-8aff-8fc673e157dd@vivier.eu>
Date: Sat, 30 Oct 2021 15:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: add myself as partial audio reviewer
Content-Language: fr
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com> <3098986.y1qXEgzS8n@silver>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <3098986.y1qXEgzS8n@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oMr/yoS400bGN6UZRkIYwAbKMXnq8ljG3grAiXcwYa40vch//g3
 C7e3tJZRKYst5HbNcG4V8+s8idYfqOfagWKPFvLRStKw9zryh/sFx/rP0UbSzcSw3Zai2IB
 Jw/FOpB+BXHf/qZa2YPxXn+gsXpLjMzWiWuu+gulwHjEtlKdM/Xr9D5VWbodKgby9+2fJ4o
 ApFewV9eVOoxCB1LbGHwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sMwTF4HJJiA=:qupB4y3TBGLYQ8/2Hj8F+K
 wscG3EJLI6D1SC8xTSHxTiAsEeDzkRUIkoWoDoSe5Cm/1y4omvnnTn6hVUDeDe8G6g3NipqC2
 A0sTZcNz4SlgMUiyiF+nriNOV5Ar35NfI7fZGQIOUC/Eo+0hUOWhdeJo8Hay2Gt7LEpqJwbrR
 A/O/nCdrOcGsFIGYTJ8CqPyPGPL+hJgQulO0ubO+m4t0+bMVhMUTRVxwxRKBrBp08ZZOzTcU3
 G3BCLNKlPebFHMZHkxkUTClt0i4zR5lih5VWD41JOqWaImsiJjw3Y4ClKhAMIpE+A/XOCCbtm
 z0eRAh/zpVgq2gjIijuG5xuUQRWDUAv4a4uJEkgLw1hAMpy1eMLYor3QZNTIlqNoSSzS+oK4j
 zWrohzzBNLLK8qUHjgxOjA9krwxx6/yL9ZsXQiurpP8m8o7cnct8nIhtDA7H89ocrOh1utnNF
 9ECu/sUJ233Eyfj3bS1LTGQvt64rvzZ/wAkOAyffVQw3nK6VgO9VNw9j7MvFd4t/fcIPSBuwZ
 jvDF53HkPUNkJ7/yUMfzjElf/qgF3I358m9a97JSG93+sOZTUQ4sg5o0RVtiQMlyOrtkcAyGv
 g31tdN8lEGDjO61eklVV8KwZj7kCD6hhCfl0jGwpOdFH0h+k7eSpWdDQdDihUEp2+JEMYP/GI
 9ztyApq/a0Q9fNM6aTG02CYbNMBMXWQifFPY8n4LCV2n2ZFCNNw5LBGwise2Ez/Ii8r0=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.426,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/10/2021 à 21:37, Christian Schoenebeck a écrit :
> On Samstag, 4. September 2021 15:13:46 CEST Christian Schoenebeck wrote:
>> Volunteering as reviewer for some of the audio backends; namely
>> ALSA, CoreAudio and JACK.
>>
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>   MAINTAINERS | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d923a6544..f018c1891a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2289,11 +2289,13 @@ F: qapi/audio.json
>>
>>   ALSA Audio backend
>>   M: Gerd Hoffmann <kraxel@redhat.com>
>> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>   S: Odd Fixes
>>   F: audio/alsaaudio.c
>>
>>   Core Audio framework backend
>>   M: Gerd Hoffmann <kraxel@redhat.com>
>> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>   S: Odd Fixes
>>   F: audio/coreaudio.c
>>
>> @@ -2304,6 +2306,7 @@ F: audio/dsound*
>>
>>   JACK Audio Connection Kit backend
>>   M: Gerd Hoffmann <kraxel@redhat.com>
>> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>   S: Odd Fixes
>>   F: audio/jackaudio.c
> 
> Ping
> 
> I just realized this patch was never queued. Could this go through the trivial
> branch maybe, please?
> 
> I should have probably CCed qemu-trivial right from the start, sorry.
> 

Perhaps an Ack from Gerd would help.

Thanks,
Laurent


