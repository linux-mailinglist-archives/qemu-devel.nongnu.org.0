Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30030B16B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:10:54 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fXA-0001kH-KE
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6fVn-0000uL-Ff
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:09:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6fVk-0002eI-O2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:09:27 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 6so18012325wri.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 12:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FeK0+xKxBnD8gF2RZHla86TPWWFkv0D8WYQVFTeDkwg=;
 b=kae6JSWrDFixtPOL7Sl4Vs+Ahac2HVKVa3EC7a2bzwHI1Lpq6VH5zQQnqPEjyrm/VK
 bI3syZ+A7uTRw/0aOTH1R0Z1l5E8sXxdhmZPGXa9xk2XgPxomdqfCJMzAoGsjSQAjWNt
 srtLUvbwV5McVtRRjjKiqMu2zC0ND42DBAvmGC459dQzXPlL1r4INZ8EiLC/sZ9v/f0y
 Imk4Gd+9rFC6uW2R4CphjoA7iVxPOUM0WdXbAo4xV8od+3xuj3uZGhygYWZtmRElF4CS
 mqpkdrlzih+8wxEFLL4IC22TNZKnKQCGFzAlkghaLbz/MRpnWK4f0JM6L8xNH8wbHN49
 Hetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FeK0+xKxBnD8gF2RZHla86TPWWFkv0D8WYQVFTeDkwg=;
 b=f9L8Dp5gcYaxX7ciazYOfaXYZGrpSh+AifveqXKOyM6gx3PPS5kM10T+Wh2oZdO32p
 bfN7DF6dKUyaR7NVz1m1M38zvzqQdFeQ6ervgnjbw5BJd8r7X3yqw5kIjh7vpVAviv5Z
 OYUfme2aongvysyoqHYJxi17oaxaGUvz8Y+afjiIyXjmPmsdztm9vCWqAZYU4paL6P6e
 hvx4ls09/ANqD1CrVBiGXUzoHBVTxekVmU7CdNj8qHBwB/C8yiK8m5dswNpifd7fHfQ1
 xHpFMkhTstilaKiLbxPAmpUSLFW8SbMw88cmMMPHLz4LESOPMe4b1FHbzhS/412L64r1
 8L4A==
X-Gm-Message-State: AOAM5332cxvW5gWGBKxVU3uokZge0BV1DiQQQoERxZWwbXvn7P0JEZoA
 O2AKUnMfUQWFkmAb7QbxmWRdpg==
X-Google-Smtp-Source: ABdhPJyymjQV3QmuSa998oaaUip2jgpRvX98Wz2fCWkqkSwTqrWJtxzztLrotykoQri8qFvWasHV2g==
X-Received: by 2002:adf:9226:: with SMTP id 35mr4424725wrj.408.1612210162785; 
 Mon, 01 Feb 2021 12:09:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n15sm27685167wrx.2.2021.02.01.12.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 12:09:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E06AB1FF7E;
 Mon,  1 Feb 2021 20:09:20 +0000 (GMT)
References: <20210128185300.2875-1-alex.bennee@linaro.org>
 <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Mon, 01 Feb 2021 20:08:59 +0000
In-reply-to: <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
Message-ID: <871rdzv9cf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The wiki and the web are curiously absent of the right runes to boot a
>> vexpress model so I had to work from first principles to work it out.
>> Use the more modern -drive notation so alternative backends can be
>> used (unlike the hardwired -sd mode).
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Anders Roxell <anders.roxell@linaro.org>
>> ---
>>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
>> index 7f1bcbef07..30b1823b95 100644
>> --- a/docs/system/arm/vexpress.rst
>> +++ b/docs/system/arm/vexpress.rst
>> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU m=
odel:
>>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>>    provided on the command line then QEMU will edit it to include
>>    suitable entries describing these transports for the guest.
>> +
>> +Booting a Linux kernel
>> +----------------------
>> +
>> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> +enough to get something running.
>> +
>> +.. code-block:: bash
>> +
>> +  $ export ARCH=3Darm
>> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> +  $ make multi_v7_defconfig
>> +  $ make
>
> We probably shouldn't be recommending in-tree kernel builds, or
> polluting the user's environment with random variables. Try:
>
> $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- multi=
_v7_defconfig
> $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-
>
>> +By default you will want to boot your rootfs of the sdcard interface.
>
> "off"
>
>> +Your rootfs will need to be padded to the right size. With a suitable
>> +DTB you could also add devices to the virtio-mmio bus.
>> +
>> +.. code-block:: bash
>> +
>> +  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
>> +      -machine type=3Dvexpress-a15 -serial mon:stdio \
>> +      -drive if=3Dsd,driver=3Dfile,filename=3Darmel-rootfs.ext4 \
>> +      -kernel zImage  \
>> +      -dtb vexpress-v2p-ca15-tc1.dtb \
>> +      -append "console=3DttyAMA0 root=3D/dev/mmcblk0 ro"
>
> thanks
> -- PMM


Booting a Linux kernel
----------------------

Building a current Linux kernel with ``multi_v7_defconfig`` should be
enough to get something running. Nowadays an out-of-tree build is
recommended (and also useful if you build a lot of different targets).
$SRC points at root of the linux source tree.

.. code-block:: bash

  $ mkdir build; cd build
  $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-=
 multi_v7_defconfig
  $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

By default you will want to boot your rootfs off the sdcard interface.
Your rootfs will need to be padded to the right size. With a suitable
DTB you could also add devices to the virtio-mmio bus.

.. code-block:: bash

  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
      -machine type=3Dvexpress-a15 -serial mon:stdio \
      -drive if=3Dsd,driver=3Dfile,filename=3Darmel-rootfs.ext4 \
      -kernel zImage  \
      -dtb vexpress-v2p-ca15-tc1.dtb \
      -append "console=3DttyAMA0 root=3D/dev/mmcblk0 ro"

--=20
Alex Benn=C3=A9e

