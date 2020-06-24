Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4292206C39
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 08:13:36 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnyf9-0006cH-Cy
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 02:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jnyeF-00065o-9q
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 02:12:39 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jnyeD-0001L0-9K
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 02:12:39 -0400
Received: by mail-io1-xd41.google.com with SMTP id c16so886262ioi.9
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 23:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=THCVmA5nxW5gZMRqlo1ujbNHdXWMlnemA8TYLmf2SzY=;
 b=eGqaXl4BqJp/d7SPa9bPqFZdKjPDpO0WT84KfAwQo7GTIuqgzbmOpHzWSW+K6rI9V/
 oEnnFZ9CEDug2TOpqt1ZOGt+QwBNrJO+wE0ZOpFs7Cv2qvtXXRHTNSH0JUs4z0e7kywB
 YKZr5x4oud+YCboDbOx7Vy6RfruMRT4fl0bkXkzKTrM9lKIccbflNtthAyKHTr+NuZeq
 1AmbPalnvp03ww1vWxMFULolxeNgyzMk3GdoRLiCJMdq/NA/k6BTVXXsvslQxv3yfGl2
 i+eylxdPgXZksyUXQhs7SgYxnafo24F0JZjQ67WgyBPx9GRRwwK4XKx3QXWXP9ujXGgp
 9w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=THCVmA5nxW5gZMRqlo1ujbNHdXWMlnemA8TYLmf2SzY=;
 b=QeQNLWpWhsnDtFXbFcqW6/EgH2vU8AJsnexLM5g/yl5CDJjeMgGmgaLoI8a1MEErt6
 JcsAmApAGnNwL38kDnHZfG8sLG54Xs9P/hBnGUen6P9IXweqdiwFAjaxlQw25uyHDlhw
 J6oZYZUUBmE1YGEZqpWr7qQmMfRYxtdAgkpKMi658ouGubKKsjubWhKLQWq0CTZCcoXe
 L2ZwkwhUxLihr1Pb0VgS27lhV5aadFSWQK6Smn0f6RxxBMpxZKoWJ+c3ukSfr7jSbzEZ
 zIWmYpF21ZYqZqxX3zQiWUf7tmeDJqgw5go86Aqid56PYYgn1y6SANmo20RIht/WmFf2
 u2Yw==
X-Gm-Message-State: AOAM533ahVGFGsoP7ipTqlu2bCkNZGSCBwLY+R56OiaQHWBQDcBJ3+Mc
 1YUb2ynI8p31qPic9P0kdcdfuC2MnhjS2BAlouw=
X-Google-Smtp-Source: ABdhPJwrawR2TwtC7+8ST9Jd954uxdUTUcpmDy9amaXqQ9C6UpB7b3YdkF8q3A49h8Chv6nToaxK/CcvnCafwHVTaIw=
X-Received: by 2002:a5d:9288:: with SMTP id s8mr21937920iom.42.1592979155703; 
 Tue, 23 Jun 2020 23:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <1592914438-30317-1-git-send-email-chenhc@lemote.com>
 <159291732571.6029.8642408239343726657@d1fd068a5071>
 <CAHiYmc6rMujXmF6NuoQVwm484PXxW2876zdp6wXpiO0p+ssAqw@mail.gmail.com>
In-Reply-To: <CAHiYmc6rMujXmF6NuoQVwm484PXxW2876zdp6wXpiO0p+ssAqw@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 24 Jun 2020 14:12:24 +0800
Message-ID: <CAAhV-H4Tb6VNZgr2KgAiaJubzZwsa9Z2dXYMTDSnPGcajun-ng@mail.gmail.com>
Subject: Re: [PATCH for-5.1 V5 0/4] mips: Add Loongson-3 machine support (with
 KVM)
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=chenhuacai@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "zltjiangshi@gmail.com" <zltjiangshi@gmail.com>,
 "aleksandar.rikalo@syrmia.com" <aleksandar.rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Aleksandar,

On Tue, Jun 23, 2020 at 9:58 PM Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
>
>
> =D1=83=D1=82=D0=BE=D1=80=D0=B0=D0=BA, 23. =D1=98=D1=83=D0=BD 2020., <no-r=
eply@patchew.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>>
>> Patchew URL: https://patchew.org/QEMU/1592914438-30317-1-git-send-email-=
chenhc@lemote.com/
>>
>>
>>
>> Hi,
>>
>> This series seems to have some coding style problems. See output below f=
or
>> more information:
>>
>
> Hi, Huacai.
>
> Please fix all checkpatch warnings in the next version (except thise that=
 complain about the need for updating MAONTAINERS)
>
> Also, you dont need " for-5.1" in subject prefixes.
>
> Please fix these and other small things that I commented about, and send =
v6 soon (tomorrow, if possible?), so that we remove these small obstacles a=
nd focus on the core functionality of tge series.
>
> Thanks, Aleksandar
>
>
>
>
>>
>> Subject: [PATCH for-5.1 V5 0/4] mips: Add Loongson-3 machine support (wi=
th KVM)
>> Type: series
>> Message-id: 1592914438-30317-1-git-send-email-chenhc@lemote.com
>>
>> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
>> #!/bin/bash
>> git rev-parse base > /dev/null || exit 0
>> git config --local diff.renamelimit 0
>> git config --local diff.renames True
>> git config --local diff.algorithm histogram
>> ./scripts/checkpatch.pl --mailback base..
>> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>>
>> From https://github.com/patchew-project/qemu
>>  * [new tag]         patchew/1592914438-30317-1-git-send-email-chenhc@le=
mote.com -> patchew/1592914438-30317-1-git-send-email-chenhc@lemote.com
>> Switched to a new branch 'test'
>> 63e13a2 MAINTAINERS: Add Loongson-3 maintainer and reviewer
>> 727fa14 hw/mips: Add Loongson-3 machine support (with KVM)
>> 5fd21a0 hw/intc: Add Loongson liointc support
>> 6996d49 hw/mips: Implement the kvm_type() hook in MachineClass
>>
>> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
>> 1/4 Checking commit 6996d492ec71 (hw/mips: Implement the kvm_type() hook=
 in MachineClass)
>> 2/4 Checking commit 5fd21a0bcd83 (hw/intc: Add Loongson liointc support)
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating=
?
>> #36:
>> new file mode 100644
>>
>> ERROR: line over 90 characters
>> #90: FILE: hw/intc/loongson_liointc.c:50:
>> +#define LOONGSON_LIOINTC(obj) OBJECT_CHECK(struct loongson_liointc, (ob=
j), TYPE_LOONGSON_LIOINTC)
>>
>> ERROR: open brace '{' following struct go on the same line
>> #93: FILE: hw/intc/loongson_liointc.c:53:
>> +struct loongson_liointc
>> +{
>>
>> ERROR: code indent should never use tabs
>> #148: FILE: hw/intc/loongson_liointc.c:108:
>> +^I    if (p->parent_state[parent] !=3D$
>>
>> total: 3 errors, 1 warnings, 256 lines checked
>>
>> Patch 2/4 has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
>>
>> 3/4 Checking commit 727fa142abed (hw/mips: Add Loongson-3 machine suppor=
t (with KVM))
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating=
?
>> #84:
>> new file mode 100644
>>
>> WARNING: line over 80 characters
>> #404: FILE: hw/mips/loongson3_virt.c:316:
>> +static void loongson3_pm_write(void *opaque, hwaddr addr, uint64_t val,=
 unsigned size)
>>
>> WARNING: line over 80 characters
>> #704: FILE: hw/mips/loongson3_virt.c:616:
>> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)current_machine->=
smp.max_cpus);
>>
>> WARNING: line over 80 characters
>> #840: FILE: hw/mips/loongson3_virt.c:752:
>> +static inline void loongson3_virt_devices_init(MachineState *machine, D=
eviceState *pic)
>>
>> WARNING: line over 80 characters
>> #871: FILE: hw/mips/loongson3_virt.c:783:
>> +                             get_system_io(), 0, virt_memmap[VIRT_PCIE_=
PIO].size);
>>
>> WARNING: line over 80 characters
>> #977: FILE: hw/mips/loongson3_virt.c:889:
>> +    /* Allocate RAM/BIOS, 0x00000000~0x10000000 is alias of 0x80000000~=
0x90000000 */
>>
>> total: 0 errors, 6 warnings, 999 lines checked
>>
>> Patch 3/4 has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
>> 4/4 Checking commit 63e13a297290 (MAINTAINERS: Add Loongson-3 maintainer=
 and reviewer)
>> =3D=3D=3D OUTPUT END =3D=3D=3D
>>
>> Test command exited with code: 1
>>
>>
>> The full log is available at
>> http://patchew.org/logs/1592914438-30317-1-git-send-email-chenhc@lemote.=
com/testing.checkpatch/?type=3Dmessage.
OK, all errors will be fixed.

>> ---
>> Email generated automatically by Patchew [https://patchew.org/].
>> Please send your feedback to patchew-devel@redhat.com

