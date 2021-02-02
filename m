Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DB30BDE7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:15:37 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uam-0003hX-0w
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6uZC-0002y7-1C
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:13:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6uZA-0002Oz-8c
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:13:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id q7so20170125wre.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iZILxQ+vsSrVqPCFV1Yoq//r1xFbadJ5C5V0UkGOX+M=;
 b=fpC2l5IxXaCT5QKdDUUPrKENwwct1JfWCZx02o+NUYGiUGTYPRpL2YKbCsr9tn56Y0
 3oUczShFJAXo3Gw7L2HVsSrlKouwqw7UnY/db3lCngUA2R1GU+Mw149B2IQFSvtcc6jF
 yDaY2MwtxAX/Vu1l/aUSA1tBVHF5m5tMFjKknqJXUE4n9NVpz+1QLTHoLeQa2dBNxRe3
 5y427K/hl+UqtLd2Y3C3pFqFd5PzW9KzbJTC44nczX8sQTDlRYywCbA8gzX5uzRC8J2R
 UOCECyxJrBogMWDB8jtUpORwEpxpGp9xSt/6/fVhwVBskoyjcR3z9/AzcTjAQmylOQBi
 RlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iZILxQ+vsSrVqPCFV1Yoq//r1xFbadJ5C5V0UkGOX+M=;
 b=j/bJ8FQAEkL1ai13w6tgCW3v/yMx6gaFd2y9wchtt6BOI2ozE2rajmNcSei73vE/EG
 8bgUzIQD6yg5FsxD8mMSObC92pjNdMuoKrhjudRLgU4IMI9886SyBc0Y9zooefRpVkEp
 2u6ECZav4n3YLUaIuOAUi0ezttv2w9SGVC5mphr1f8xxhDa4Lm5J9xTVR5v2JmyhAl31
 gH25CLGdNjEH4jbhYBOxrc9pCzfuqW/9mJXvUy4D4dKjyRm1fJ+QxUB0pJNU+Ps3q2ox
 uqQWxX5QxLzMlv1wu9GcvXPbQjYibEygYpnJ5JJY4jQF2HbLDo67mD/IinPGPY5nSbaY
 TkfA==
X-Gm-Message-State: AOAM531sTD1mjHZbpnPWiNiNfNJiO+r+1mURqYziZarkISA2XHw2vHYN
 Rorz4pSiTwaC7q0jsLhn1RZ9sQ==
X-Google-Smtp-Source: ABdhPJwnBNTFC84DUw56QU3JEhTKgcrG1KTS+kjxoFeisuJ7GFi1yZdfNKAAdcKpIdQrm8YplXXMhg==
X-Received: by 2002:adf:f04b:: with SMTP id t11mr22933785wro.347.1612268033694; 
 Tue, 02 Feb 2021 04:13:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm2582543wmq.33.2021.02.02.04.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 04:13:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FF831FF7E;
 Tue,  2 Feb 2021 12:13:51 +0000 (GMT)
References: <20210129181319.2992-1-alex.bennee@linaro.org>
 <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system: document an example booting the
 versatilepb machine
Date: Tue, 02 Feb 2021 12:11:09 +0000
In-reply-to: <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
Message-ID: <87pn1iu0ow.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 29 Jan 2021 at 18:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> There is a bit more out there including Aurelien's excellent write up
>> and older Debian images here:
>>
>>   https://www.aurel32.net/info/debian_arm_qemu.php
>>   https://people.debian.org/~aurel32/qemu/armel/
>>
>> However the web is transitory and git is forever so lets add something
>> to the fine manual.
>>
>> Cc: Anders Roxell <anders.roxell@linaro.org>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.r=
st
>> index 51221c30a4..d16f20ccae 100644
>> --- a/docs/system/arm/versatile.rst
>> +++ b/docs/system/arm/versatile.rst
>> @@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the foll=
owing devices:
>>     devices.
>>
>>  -  PL181 MultiMedia Card Interface with SD card.
>> +
>> +Booting a Linux kernel
>> +----------------------
>> +
>> +Building a current Linux kernel with ``versatile_defconfig`` should be
>> +enough to get something running.
>> +
>> +.. code-block:: bash
>> +
>> +  $ export ARCH=3Darm
>> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> +  $ make versatile_defconfig
>> +  $ make
>
> same remarks as for other patch.
>
> Does the 'make' make the right dtb automatically, by the way?
> (I have some notes where I had to tell the kernel to build the
> dtb explicitly, but maybe they are out of date.)

I didn't do anything special and it was there in the build directory. Do
your notes pre-date 2013:

commit cc8e9ad88487004372cae87718ff593d0a2fdc3a
Author: Rob Herring <rob.herring@calxeda.com>
Date:   Wed Mar 13 21:31:42 2013 -0500

    ARM: versatile: add versatile dtbs to dtbs target

    Add the versatile platform dtbs to the dtbs make rule.

    Signed-off-by: Rob Herring <rob.herring@calxeda.com>

>
>> +
>> +You may want to enable some additional modules if you want to boot
>> +something from the SCSI interface::
>> +
>> +  CONFIG_PCI=3Dy
>> +  CONFIG_PCI_VERSATILE=3Dy
>
> It's a bit daft that these aren't in the defconfig, but hey.
>
>> +  CONFIG_SCSI=3Dy
>> +  CONFIG_SCSI_SYM53C8XX_2=3Dy
>> +
>> +You can then boot with a command line like:
>> +
>> +.. code-block:: bash
>> +
>> +  $ qemu-system-arm -machine type=3Dversatilepb \
>> +      -serial mon:stdio \
>> +      -drive if=3Dscsi,driver=3Dfile,filename=3Ddebian-buster-armel-roo=
tfs.ext4 \
>> +      -kernel zImage \
>> +      -dtb versatile-pb.dtb  \
>> +      -append "console=3DttyAMA0 ro root=3D/dev/sda"
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

