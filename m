Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE940C716
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVax-0000qL-UC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQVUW-0003BF-Fo; Wed, 15 Sep 2021 10:02:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQVUR-0002VT-7I; Wed, 15 Sep 2021 10:02:24 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnFps-1n9QXp3k8K-00jJCL; Wed, 15 Sep 2021 16:02:14 +0200
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
To: Programmingkid <programmingkidx@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210831165020.84855-1-programmingkidx@gmail.com>
 <694bebbe-9920-c110-4331-47cefbdfde51@ilande.co.uk>
 <B8D898FD-3C06-4086-8BB2-C3A414E8E504@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <be8816fc-8816-2268-3745-127ecb9d2594@vivier.eu>
Date: Wed, 15 Sep 2021 16:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <B8D898FD-3C06-4086-8BB2-C3A414E8E504@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qvA28RnI0CskUgOBwDjhPUAoMI7FQ9sIG7YQ24vW/wWnMq4dmcp
 tLFr45ZKt8fj1B86chmBVdZEXYuLpRb8MJTCqXL8D9X9RIS7wAfm3YJK8NJAs4NYtydsaAc
 Cf16ZMlhSX/rqTBlIx4x/UTSYY0+1Ms9nZDl+ICDkJrK3qjB8GE3wBVun0TjAzhEwwcAfic
 OnXtl+18z7jfgH/6fi3Nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RbXwzOWbU7o=:WRWFNzW9bmj4ziYtBTsFWu
 d8ZppwvL1KOrip3UCzFxXtdIK+dz7tVlPe1sDMD30D/zFwUS45XvC5ifw8Vb8AF306b3ZVg5c
 PgmKKe5n3MJ/+z593DLuXnzFJuFHjq5x1kMaBR24VI0ztXojRaFq0LCZN66KZkT+ULzfMtTTv
 4tLlSz+tHQBEb3yw1tXip8l0+nWYx9SsZBwUko1uD1so277ASVHQi1FXl6ClhEMiZ2zVH0lQ3
 MD+sYjLu9sIGpBm+WUscMbGD4vzsyHggY5uAWy/pSVFo0H0d9mtG6fUk66m9DAYe7vGT7tdL5
 cY4JwZmEoBlUdmHipNlrckdYmaKGikkeaHcx1aPsb3cOlAFoFt7YmFNzseXomIGveY2p/yvv8
 /6BQGCg8bH5hvZMjvP/y1Pjp7pGY7/NTc5O4eZOpUjConR+F8HgE3i+ME7vgczQO3MkBCygYl
 SEe2u1b1k7gPtb67wNoP8MNgwGFzJzvtdVDWzZcX+4uuJvrC53B8YY1LqHmi563phg7vuYlbW
 2ptjAvGt/hBDWS3p9UvzmSHrstJTZIYJyDiMkbYbzxdkUFqdRCsWC1t37/Fxwr4WUiAYbu58g
 Wn1HFm17t5+U6XRO6V8ZZV9qicv+qUJ/l8JiHTBtrjCbzm7o+Migx0WmBSHSuzbTnIW13pnT2
 N6rvgqmiDt84InifKdNnKm0ILF+5Ft2wemu68WMNjUBPypFP8ZsZER410ujWASokTE1ZuhKYd
 oEu+BgzoPV+39GRqY7hhaWgJLXhgFf5NSSuhrw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, groug@kaod.org, qemu-ppc@nongnu.org,
 hsp.cat7@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/08/2021 à 22:52, Programmingkid a écrit :
> 
> 
>> On Aug 31, 2021, at 4:33 PM, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 31/08/2021 17:50, John Arbuckle wrote:
>>
>>> Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios folder. This makes all video resolution choices disappear from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-bios folder giving users back their video resolution choices.
>>> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>>> ---
>>>  configure | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>> diff --git a/configure b/configure
>>> index 9a79a004d7..281577e46f 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -5056,7 +5056,9 @@ for bios_file in \
>>>      $source_path/pc-bios/openbios-* \
>>>      $source_path/pc-bios/u-boot.* \
>>>      $source_path/pc-bios/edk2-*.fd.bz2 \
>>> -    $source_path/pc-bios/palcode-*
>>> +    $source_path/pc-bios/palcode-* \
>>> +    $source_path/pc-bios/qemu_vga.ndrv
>>> +
>>>  do
>>>      LINKS="$LINKS pc-bios/$(basename $bios_file)"
>>>  done
>>
>> I think the patch looks correct, however the commit message and subject aren't quite right. How about something like:
>>
>> [PATCH] configure: add missing pc-bios/qemu_vga.ndrv symlink in build tree
>>
>> Ensure that a link to pc-bios/qemu_vga.ndrv is added to the build tree, otherwise the optional MacOS client driver will not be loaded by OpenBIOS when launching QEMU directly from the build directory.
>>
>>
>> ATB,
>>
>> Mark.
> 
> Ok. I will create a new patch with these changes.
> 


Applied to my trivial-patches branch with Mark's commit message rewording and Peter's R-b.

Thanks,
Laurent

