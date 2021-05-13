Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FD37F3C1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 09:55:21 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6Bk-0006Wx-DR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 03:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lh6AB-0004PS-1v; Thu, 13 May 2021 03:53:43 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lh6A9-000510-8C; Thu, 13 May 2021 03:53:42 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1xdf-1lWC4U2fxB-012HDn; Thu, 13 May 2021 09:53:35 +0200
Subject: Re: [PATCH] hw/input/hid: Add support for keys of jp106 keyboard.
To: Katsuhiro Ueno <uenobk@gmail.com>, qemu-devel@nongnu.org
References: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
 <CANrJRq+XjSjRqweBqDak8V9vi7cyNPiv8-g-irHbr6VAzo0a9w@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0532d1d6-1ddb-2c9c-6d16-dae5dacc86d1@vivier.eu>
Date: Thu, 13 May 2021 09:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANrJRq+XjSjRqweBqDak8V9vi7cyNPiv8-g-irHbr6VAzo0a9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:StStDuQt3h8LlCvxmiJJ1+sFGuLuE4WC6b8J9YAJOqZ09ZIRLnu
 t+Wx3fx0p4GCj3i0W9shiQ5olXU308TCfqGYwu/+05s7/ZClWmfCoF6vnZKDvKd619TT7Wl
 EdirWGBusr0FNnucTKf6BnnZWz4TyzCMWC61mwdEig1Hr2mKC+bmYujrmQ71TL0gUL8zsHn
 qon51sqQBhhsQsq8Hyhtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GGa1UAa+ghM=:/dJOIHjR33iLrE34mZYrWZ
 p7D3Iy08xFjG5+dGTbT4PD/SM5diUGIQNZxxv3uhjO0Hc7wslTtIuVUminYFwl9ebxQmYbNiA
 sHsSJB+aqyDNd25j2Dz2HyCKB6ZAPu24Ahgm7HvbwqsOn+781BF8Gq7KFM1IV6ZHa9UDjL/M9
 L08BRZEU/OR97pZ1ZsdpsmiLjb0ko2neMrzD7v7UfFaQ/2/uw8GAW8lfOEuPhs/Y78Hehaeld
 QwDN00C9weOTR7TdoUdf5kdjZChEn/J9wPShw8tzZjwRn50sb6xw6Lqh4jBcFXRM6d6LLCLLy
 Z3tw2XVzkCbpNElsPzt81qjt8eCTjbwDUFgUqmYpgzPf6UsJn4I8gHqJi1GiJYkJKfaDQG6EK
 CalwZmSChkDTwmw09CWSOz2BrAqJmjePtOzaSDGTIVFTfHfXSVI/zdZnkukRZ9GXS3YA0+kxG
 qyxh1J1qfwS3QSSFC2Gqc7OJWGVYIR1rBKXduZKWoZrqYhXa/7/Asb89wmvF/uSUt67/4I0QH
 zGwuDYdd4DQHwf0eQyKYpI=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/05/2021 à 08:11, Katsuhiro Ueno a écrit :
> Ping.

cc Gerd

> 2021-04-27 11:02 Katsuhiro Ueno <uenobk@gmail.com>:
>>
>> Add support for the following keys: KATAKANAHIRAGANA, HENKAN, MUHENKAN,
>> RO, and YEN.  Before this commit, these keys did not work as expected
>> when a jp106 keyboard was connected to the guest as a usb-kbd device.
>>
>> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
>> ---
>>  hw/input/hid.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/input/hid.c b/hw/input/hid.c
>> index e1d2e46083..8aab0521f4 100644
>> --- a/hw/input/hid.c
>> +++ b/hw/input/hid.c
>> @@ -51,8 +51,8 @@ static const uint8_t hid_usage_keys[0x100] = {
>>      0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
>>      0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65,
>> +    0x88, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x00,
>> +    0x00, 0x8a, 0x00, 0x8b, 0x00, 0x89, 0xe7, 0x65,
>>
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> --
>> 2.24.3 (Apple Git-128)
> 


