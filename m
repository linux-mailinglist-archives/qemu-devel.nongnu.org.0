Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E446CEF3A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:22:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYYx-0001Oz-Do; Wed, 29 Mar 2023 12:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phYYu-0001Or-TO
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:22:12 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phYYt-0000e0-3Y
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:22:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MC2k1-1pa6IZ0BGX-00CV6A; Wed, 29 Mar 2023 18:22:02 +0200
Message-ID: <60a7075e-64fd-674a-900c-94ec4ee0b6db@vivier.eu>
Date: Wed, 29 Mar 2023 18:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: stat64 wrong on sparc64 user
To: Luca Bonissi <qemu@bonslack.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
 <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
 <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6R6u3d7NDywLW56gbaL8i0grVSByv91HGZ/Z9veDEbp4fkCLQEX
 h37nAgQ5BIYo37K8e2Wnd5WOadgH8f+VTr6adCOC/XNIuIWsLp6IMqGZLNNlQPNly7zlBkt
 kw/wRWuXB3uIjJYcZ5avRM6Fc8HJ7u7L7ra+lQqgy/B3fTeNYQO6ZP2wHvbD6wpuHJ7Zdhh
 QLUHqmWapyfQr+Y05chsA==
UI-OutboundReport: notjunk:1;M01:P0:KYE0WS4+j2k=;bOZUFBEPBbfvgGcTIY6y5LEq3GI
 3LCHTNqU7TmQyuILC4/trWdGslNKPV9tXr47Igo7ZyCt6vuxTH1XhtqRcnTrFmXdfcEk63H66
 397SuWrL1wO6E3oFznjq9HwpyPSctxR399KXlaPkwFRw8EGRwugf0oa1F6FRWGecgbJ/rbxXF
 GipMZ5ZJv9f131icUJUq9jIhkXbkz1zqyZlWcL4U2Pz5FRO0W+rKHrkNWvJqgmpFzjIwBcmla
 4681AJ98V51EXHXehKSJZQGVmyP4KQ06as9cd0K/JgQSqlCuwR6mQd0sJnwdU0Qk1+TX4ofS/
 d012YFfuLMOhCZtLH6mhSAVdXJWm1WEqTouQkyXeVJeMoLmCeBn93u25/fTU1+GFQNn77lqh7
 G5zbZnHayDyp7U2SBRpkbZfaVpZdf46JuuU13OW2rxwebgtNdqCql4uBjWOl+eDK5SuQqiNN6
 zbOagUTfHeAWJ5MElghlSE7D6UDsclzEI9AOt3EE7ntsG2yKlgj3YnTHK2wvgJDTqlL90cWTk
 ciDr57ppEf1uqnyxubFtvgIAhsC3pC/KX7mJuVPNHF28n9mX3Alu7bo1wthq7z6u5i0Ocd9QH
 gOTbTt3U+RjvZLJsDr/8xDiNIQMhH9aD1aDTuMNxm0Js0meXe0xtuVOpfvLnNPMY5k6yzcmqH
 +vArxlV8saOeSiPI/MLz0NuowW+xPYN4brHugWxXaA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 28/03/2023 à 14:22, Luca Bonissi a écrit :
> On 28/03/23 13:55, Thomas Huth wrote:
>> On 28/03/2023 13.48, Luca Bonissi wrote:
>>> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 15:41:42.000000000 +0200
>>> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 21:43:25.615115126 +0200
>>> @@ -1450,7 +1450,7 @@ struct target_stat {
>>>       unsigned int    st_dev;
>>>       abi_ulong    st_ino;
>>>       unsigned int    st_mode;
>>> -    unsigned int    st_nlink;
>>> +    short int    st_nlink;
>>>       unsigned int    st_uid;
>>
>> That looks wrong at a first glance. IIRC Sparc is a very strictly aligned architecture, so if the 
>> previous field "st_mode" was aligned to a 4-byte boundary, the "st_uid" field now would not be 
>> aligned anymore... are you sure about this change? Maybe it needs a padding field now?
> 
> The padding is automatic (either on Sparc or x86-64): short will be aligned to 2-byte boundary, int 
> will be aligned to 4-byte boundary, long will be aligned to 8-byte boundary.
> 
> E.g.:
> st_dev=0x05060708;
> st_ino=0x1112131415161718;
> st_mode=0x1a1b1c1d;
> st_nlink=0x2728;
> st_uid=0x2a2b2c2d;
> st_gid=0x3a3b3c3d;
> st_rdev=0x35363738;
> st_size=0x4142434445464748;
> st_blksize=0x5152535455565758;
> 
> will result (sparc64 - big endian):
> 00: 05 06 07 08 00 00 00 00
> 08: 11 12 13 14 15 16 17 18
> 10: 1A 1B 1C 1D 27 28 00 00
> 18: 2A 2B 2C 2D 3A 3B 3C 3D
> 20: 35 36 37 38 00 00 00 00
> 28: 41 42 43 44 45 46 47 48
> 30: 00 00 00 00 00 00 00 00
> 38: 00 00 00 00 00 00 00 00
> 40: 00 00 00 00 00 00 00 00
> 48: 51 52 53 54 55 56 57 58
> 50: 00 00 00 00 00 00 00 00
> 58: 00 00 00 00 00 00 00 00
> 60: 00 00 00 00 00 00 00 00
> 
> Or on x86-64 (little endian):
> 00: 08 07 06 05 00 00 00 00
> 08: 18 17 16 15 14 13 12 11
> 10: 1D 1C 1B 1A 28 27 00 00
> 18: 2D 2C 2B 2A 3D 3C 3B 3A
> 20: 38 37 36 35 00 00 00 00
> 28: 48 47 46 45 44 43 42 41
> 30: 00 00 00 00 00 00 00 00
> 38: 00 00 00 00 00 00 00 00
> 40: 00 00 00 00 00 00 00 00
> 48: 58 57 56 55 54 53 52 51
> 50: 00 00 00 00 00 00 00 00
> 58: 00 00 00 00 00 00 00 00
> 60: 00 00 00 00 00 00 00 00
> 
> Please note the automatic padding between "st_dev" and "st_ino" (offset 0x04, 4 bytes), "st_nlink" 
> and "st_uid" (offset 0x16, 2 bytes), "st_rdev" and "st_size" (offset 0x24, 4 bytes).
> 
> Placing st_nlink as int would result in incorrect big/little endian conversion, so it should be set 
> as short. If you like clearer source code, you can optionally add padding, but it is not mandatory.
> 

To have automatic alignment according to target ABI, you must use abi_XXX type (see 
include/exec/user/abitypes.h)

For sparc, from the kernel, we have:

struct stat {
         unsigned int st_dev;
         __kernel_ino_t st_ino;
         __kernel_mode_t st_mode;
         short   st_nlink;
         __kernel_uid32_t st_uid;
         __kernel_gid32_t st_gid;
         unsigned int st_rdev;
         long    st_size;
         long    st_atime;
         long    st_mtime;
         long    st_ctime;
         long    st_blksize;
         long    st_blocks;
         unsigned long  __unused4[2];
};

So for the st_link we need to use abi_short.

We can do the same with stat64 and other fields (see linux/arch/sparc/include/uapi/asm/stat.h)

Thanks,
Laurent

