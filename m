Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045752D11EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:28:28 +0100 (CET)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGZ1-0003Tk-3D
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kmFIz-0001bm-0p
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:07:49 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kmFIv-0007X4-95
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:07:48 -0500
Received: by mail-wm1-x342.google.com with SMTP id h21so13451191wmb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 04:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1YtGVMQr0FVZeOcoG12r04oSiXeoZfgTnI9hlfdcSzo=;
 b=yEbG9z312qL8WgG25/vC5rQMHTxs3uwpVgBg8mZRrDzazg51fmCBQ50jqAlEUFwjOM
 TqNAHGPqMa/maYBO8fJ1XvRwaD0h/VZctiGhf3OYa3BlIMGGt9OoFOAdsvLvwh7hwnBp
 hgoBOap9nyf/bFpXeMG1H83kWxOfWLIVXfxdlY0+VU9g+jZqAt6A48T8qhN3P+kwNagc
 jRJ7uboUgIJyjxtLvljGsqQ45dObLP7cW6sUUqeG6J/QjfxqpxpqkQQPk+Kvf97qAx6G
 1ia+4ZBv7jAtTptcIF6Ka89R56u3vshNAMARRvnReXlb19vnLE32FVlKpTWY2iXZWXsi
 geMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1YtGVMQr0FVZeOcoG12r04oSiXeoZfgTnI9hlfdcSzo=;
 b=IDr0YRdBCScuvH/i2zaakZhh6pt3a97xOyiazsIjM6CReVj+IMuUZ9I5WyTvbJ580M
 YDI/05/XUgx05zQtweIh2x0GPX2yDvqBuczg0YGcZKIvGD8t2da9ERvSWpnxQIr2liC3
 pR8QysBdjRMmw/VmmxRbRdSHRWRrAnQuPEGAF6lpR1vYYLodPTkZr33Hk0sY6XKOnuna
 XcWRTtVJWHRRi2y/LRTcfGR2D+v0a/eVZ/J7OhOLIUQQm+G+dyEsoJbmv23uRaILrwhU
 Wkph1McJV6w9XjP4nIqmTnGtlEp3JaOI9XJjDn1IXh62cLys89sy+GEQa2unha6niM7t
 Ip4Q==
X-Gm-Message-State: AOAM531e9+0Lat+SYqFQBG6HT2wusFGfPOp5wXt+2+heTuYpfp57wbrL
 9hs83PaFabR/yNhqG1sn8X26WQ==
X-Google-Smtp-Source: ABdhPJzBq0JkYF3zZLNV83dRq2OhRaOZ8Kd3btLsPel723XZipm0sIUjqhNPOW2cGU2ZMTt/8VagdQ==
X-Received: by 2002:a1c:3902:: with SMTP id g2mr17883020wma.117.1607342862798; 
 Mon, 07 Dec 2020 04:07:42 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id h20sm13609575wmb.29.2020.12.07.04.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 04:07:41 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d43b7dac;
 Mon, 7 Dec 2020 12:07:40 +0000 (UTC)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
In-Reply-To: <87ft55vad4.fsf@linaro.org>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
 <87ft55vad4.fsf@linaro.org>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 07 Dec 2020 12:07:40 +0000
Message-ID: <cun5z5du8dv.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::342;
 envelope-from=dme@dme.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 =?utf-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Mihai Carabas <mihai.carabas@oracle.com>, Igor Mammedov <imammedo@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the delay in replying - holiday then distractions.

On Thursday, 2020-11-19 at 11:45:11 GMT, Alex Benn=C3=A9e wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
>> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>=20
>>>> Hi David,
>>>>
>>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>>> images for code and variables respectively. These images are both then
>>>>> padded out to 64MB before being loaded by QEMU.
>>>>>
>>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>>> padding.
>>>>
>>>> 2 years ago I commented the same problem, and suggested to access the
>>>> underlying storage by "block", as this is a "block storage".
>>>>
>>>> Back then the response was "do not try to fix something that works".
>>>> This is why we choose the big hammer "do not accept image size not
>>>> matching device size" way.
>>>>
>>>> While your series seems to help, it only postpone the same
>>>> implementation problem. If what you want is use the least memory
>>>> required, I still believe accessing the device by block is the
>>>> best approach.
>>>=20
>>> "Do not try to fix something that works" is hard to disagree with.
>>> However, at least some users seem to disagree with "this works".  Enough
>>> to overcome the resistance to change?
>>
>> Yeah, at least 3 big users so far:
>>
>> - Huawei
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
>> - Tencent
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
>> - Oracle
>> (this series).
>>
>> Then Huawei tried the MicroVM approach:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>>
>> I simply wanted to save David time by remembering this other approach,
>> since Peter already commented on David's one (see Huawei link).
>
> IIRC the two questions that came up were:
>
>   - what would reading memory not covered by a file look like (0's or
>     something more like real HW, 7f?).
>
>   - what happens when the guest writes beyond the bounds of a backing
>     file?

In the non-backward-compatible-case (pre virt-5.2 in the patches, but
obviously not actually in 5.2, where the memory range is declared to the
guest as the extent of the file) neither of these issues should arise.

Reading/writing outside of the declared range should generate a fault,
much like any other non-existent region.

In the backward-compatible case the patches are obviously flawed - a
write outside of the extent of the backing file would have nowhere to
go.

In order to figure out how to move forward, I think that the summary of
the previous conversations is that either:
- it's not possible to reduce the size of the memory region declared to
  the guest from 64M+64M because of $reasons, or
- we don't want to reduce the size of the memory region declared to the
  guest from 64M+64M because of $reasons.

If that's right, I'd be curious to better understand $reasons, but have
no basis on which to argue.

Presuming that it's not acceptable to reduce the declared extent of the
flash regions, I will probably look to implement Philippe's suggestion:

> If what you want is use the least memory required, I still believe
> accessing the device by block is the best approach.

...which I interpret to mean that the pflash drivers should not allocate
memory and read the images (later writing back modified blocks), but
handle each IO request from the caller by reading and writing blocks
from the underlying device as necessary.

If this interpretation is wrong, please let me know :-)

Looking at doing that, it seems that a new variant of
memory_region_init_rom_device() that does not allocate memory will be
required, unless there anything already available that performs a
similar function?

Booting a VM with AAVMF and writing some variables to the flash doesn't
exercise much of the pflash functionality. In particular it would seem
like the right time to fix the batch write omission in the current
code. Is there another consumer of the pflash drivers that is likely to
exercise more? (I can write tests that run in the guest, of course,
presuming that the Linux driver can be pushed into using those paths.)

> I'm guessing for these cloudy type applications no one cares about
> persistence of EFI variables? Maybe we just need a formulation for the
> second pflash which is explicit about writes being ephemeral while also
> being accepted?

Our current deployments on x86 do not have writable flash for VARS,
though I believe that was problematic on arm64 until a recent
change. It's my suspicion that assuming we can continue to present
read-only VARS generally is going to be proven wrong before too long.

dme.
--=20
I'm not living in the real world, no more, no more.

