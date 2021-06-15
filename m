Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4693A86D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:48:30 +0200 (CEST)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCEn-0003iU-BN
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1ltCDc-0002tO-SN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:47:17 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:50844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1ltCDX-0002kv-MU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:47:16 -0400
Received: from [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0]
 (2a02-8428-04db-b001-f255-832d-4007-dcd0.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 97B04204;
 Tue, 15 Jun 2021 18:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623775627; bh=jD1NmFtRxVECnaT0G6w9I504JoeF9Rgoir7nIYgyJng=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=soSIVpq4N/4EkW23KY3j4/RbSqPOx/HWmgvrbbL7KAkj6++5FKDYqXwGg56v9UhvF
 /PRvZL5bbxSlCsL4wIF5NKFM/uWVYRpr/3iwVyxuOKraAwkSySONVyYnwHOxcvSUBU
 Mx2Us76+aniaGNChHLxfLK9ZP6MXNm0lL7OWtWEaYHcVDCjNSdO0nBw8X779YIALYF
 uxdb3PWwe1DJhiIsEZXlQXKsYqIoC8zV1YWpYzizFBVWIZrnjXcrwLbNnARS5/yFRV
 PRJsVAmthYp2bA73BG3ejbOFW39GeGIJuEN8y310Cx4bRDQ3+5X92aGY/MGZjJwrlC
 bAhu6PH5xb6srohKERn6lpNphwIvJZBllu5f6f4xQv/hiNdlgBY1K+mrEFT9OywKlQ
 P35ioWDZ5VP1YozDZCCujYgCNNJLjOVMXClD7H6pN5SDSQzBrJuHsx/hMMWQjO66qa
 7spRsQ47P2S0r7YypyHF4JAExbvhFceqLysud8zSBX3LRseohyLrzRBMj8rxF8v51U
 IaUVrMSFnopl0T2Htn6C+bxzLh0O42t4MXLlJ6P+LM5W7shcCmJEqP/Picptt/NtR1
 FKcoMF1y+toep4CbqFTho1Q3fqhRwutdm49B2ybKJzGXr9F38gLS2i0xl0V7L68aJQ
 Glm6mbT2PYOu8872iE59AhFU=
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com> <871r93k04f.fsf@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction execution
 and memory access
Message-ID: <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
Date: Tue, 15 Jun 2021 18:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <871r93k04f.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bjT5QYiTNlCEECAhjq214gtPvp0T1G2N2"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bjT5QYiTNlCEECAhjq214gtPvp0T1G2N2
Content-Type: multipart/mixed; boundary="zPwXtj5jVPFA08aX2OBDyVBgpLZ8iRQw7";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Message-ID: <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction execution
 and memory access
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com> <871r93k04f.fsf@linaro.org>
In-Reply-To: <871r93k04f.fsf@linaro.org>

--zPwXtj5jVPFA08aX2OBDyVBgpLZ8iRQw7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/15/21 10:22 AM, Alex Benn=C3=A9e wrote:
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>=20
>> On 14/06/2021 11:01, Alexandre Iooss wrote:
>>> Log instruction execution and memory access to a file.
>>> This plugin can be used for reverse engineering or for side-channel a=
nalysis
>>> using QEMU.
>>>
>>> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
>>> ---
>>>    MAINTAINERS               |   1 +
>>>    contrib/plugins/Makefile  |   1 +
>>>    contrib/plugins/execlog.c | 112 ++++++++++++++++++++++++++++++++++=
++++
>>>    3 files changed, 114 insertions(+)
>>>    create mode 100644 contrib/plugins/execlog.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7d9cd29042..65942d5802 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2974,6 +2974,7 @@ F: include/tcg/
>>>      TCG Plugins
>>>    M: Alex Benn=C3=83=C2=A9e <alex.bennee@linaro.org>
>>> +R: Alexandre Iooss <erdnaxe@crans.org>
>>>    S: Maintained
>>>    F: docs/devel/tcg-plugins.rst
>>>    F: plugins/
>>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>>> index b9d7935e5e..51093acd17 100644
>>> --- a/contrib/plugins/Makefile
>>> +++ b/contrib/plugins/Makefile
>>> @@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
>>>    VPATH +=3D $(SRC_PATH)/contrib/plugins
>>>      NAMES :=3D
>>> +NAMES +=3D execlog
>>>    NAMES +=3D hotblocks
>>>    NAMES +=3D hotpages
>>>    NAMES +=3D howvec
>>> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
>>> new file mode 100644
>>> index 0000000000..80716e8eed
>>> --- /dev/null
>>> +++ b/contrib/plugins/execlog.c
>>> @@ -0,0 +1,112 @@
>>> +/*
>>> + * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
>>> + *
>>> + * Log instruction execution and memory access to a file.
>>> + * You may pass the output filename as argument.
>>> + *
>>> + * License: GNU GPL, version 2 or later.
>>> + *   See the COPYING file in the top-level directory.
>>> + */
>>> +#include <glib.h>
>>> +#include <inttypes.h>
>>> +#include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +
>>> +#include <qemu-plugin.h>
>>> +
>>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>>> +
>>> +/* Execution trace buffer */
>>> +FILE *output;
>>
>> Is there a reason for using a regular FILE * instead of using
>> `qemu_plugin_outs()`?
>>
>> I don't see a benefit and since there's an API for logging I guess
>> it's better to use it instead
>=20
> I would prefer using qemu_plugin_outs unless there is a reason to have
> multiple streams.

I was not aware of `-D` option in QEMU that does exactly what I need. So =

I am going to use qemu_plugin_outs for next version of this patch.

>>> +
>>> +/**
>>> + * Log memory read or write
>>> + */
>>> +static void vcpu_mem(unsigned int vcpu_index, qemu_plugin_meminfo_t =
info,
>>> +                     uint64_t vaddr, void *udata)
>>> +{
>>> +    struct qemu_plugin_hwaddr *hwaddr =3D qemu_plugin_get_hwaddr(inf=
o, vaddr);
>>> +    if (!hwaddr) {
>>> +        return;
>>> +    }
>>
>> So you just reject all memory accesses in user mode? I think that it
>> equally useful
>>
>> to log only the virtual address of a memory access in user-mode
>> emulation? However, we better
>>
>> wait for Alex's opinion on all this since he had remarks about
>> introducing a new ad-hoc
>>
>> tracing format...
>=20
> It would be nice to integrate with the QEMU tracing support but
> following Stefan's comments I think it will be fairly involved to work
> out a way to do it. In the meantime using plain text logging will have
> to do.

I will change this to log the vaddr in user mode without device name.

>>> +
>>> +    /* Add data to execution log */
>>> +    const char *name =3D qemu_plugin_hwaddr_device_name(hwaddr);
>>> +    uint64_t addr =3D qemu_plugin_hwaddr_phys_addr(hwaddr);
>>> +    if (qemu_plugin_mem_is_store(info)) {
>>> +        fprintf(output, "mem: %s store at 0x%08lx\n", name, addr);
>>> +    } else {
>>> +        fprintf(output, "mem: %s load at 0x%08lx\n", name, addr);
>>> +    }
>=20
> I would consider a comma separated output to make the file easily
> digestible by other tools. Maybe:
>=20
>    memory, 0x%08lx, load|store
>=20

Agree, I will change this.

>>> +}
>>> +
>>> +/**
>>> + * Log instruction execution
>>> + */
>>> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>>> +{
>>> +    char *insn_disas =3D (char *)udata;
>>> +
>>> +    /* Add data to execution log */
>>> +    fprintf(output, "insn: %s\n", insn_disas);
>=20
>    insn, 0x%08lx, disas
>=20
> Currently however on a multi-threaded execution you will potentially
> loose any synchronisation between the insn_exec and any memory operatio=
n
> associated with it. If you really just care about what's tickling
> hardware you could just drop the insn_exec callback and pass the
> instruction information via udata to the vcpu_mem callback. You could
> then dump everything in one line:
>=20
>    0xPC, ld [x1], x2, 0xADDR, load|store
>=20
> you wouldn't dump other instructions leading up to that though.

You are correct, this is indeed an issue and it's currently making my=20
life really hard when I try to apply a side-channel model on the memory=20
interactions.
I prefer to log all instructions, so I need to use vcpu_mem_cb when it's =

a memory instruction, or vcpu_insn_exec_cb if it's not.

>>> +}
>>> +
>>> +/**
>>> + * On translation block new translation
>>> + *
>>> + * QEMU convert code by translation block (TB). By hooking here we c=
an then hook
>>> + * a callback on each instruction and memory access.
>>> + */
>>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb=
 *tb)
>>> +{
>>> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
>>> +    for (size_t i =3D 0; i < n; i++) {
>>> +        /* insn is shared between translations in QEMU, copy needed =
data here */
>>> +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb=
,
>>> i);
>=20
> If you had some knowledge of the guest architecture you could attempt a=

> partial decode of the op and work out if it was a load/store and then
> conditionally register the mem or exec callback.

Agree. The TCG API does not offer a way to know from a insn if it's=20
something that is going to trigger a vcpu_mem_cb, so I will add some=20
code to decode this information from the opcode.
When the architecture is unknown, I might default to exec callback.

>>> +        char *insn_disas =3D qemu_plugin_insn_disas(insn);
>>> +
>>> +        /* Register callback on memory read or write */
>>> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
>>> +                                         QEMU_PLUGIN_CB_NO_REGS,
>>> +                                         QEMU_PLUGIN_MEM_RW, NULL);
>>> +
>>> +        /* Register callback on instruction */
>>> +        qemu_plugin_register_vcpu_insn_exec_cb(
>>> +            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_R_REGS, insn_disas)=
;
>>> +    }
>>> +}
>>> +
>>> +/**
>>> + * On plugin exit, close output file
>>> + */
>>> +static void plugin_exit(qemu_plugin_id_t id, void *p)
>>> +{
>>> +    fclose(output);
>>> +}
>>> +
>>> +/**
>>> + * Install the plugin
>>> + */
>>> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>>> +                                           const qemu_info_t *info, =
int argc,
>>> +                                           char **argv)
>>> +{
>>> +    /* Parse arguments to get output name and open for writing */
>>> +    char *filename =3D "execution.log";
>>> +    if (argc > 0) {
>>> +        filename =3D argv[0];
>>> +    }
>>> +    output =3D fopen(filename, "w");
>>> +    if (output =3D=3D NULL) {
>>> +        qemu_plugin_outs("Cannot open output file for writing.\n");
>>
>> Here, I think that it's more logical to output error messages to
>> stderr since
>>
>> logging can be redirected to a file so QEMU will error but the error m=
essage
>>
>> would be written to the log file.
>=20
> Yes please, report errors directly to stderr as the execution is going
> to trigger and exit at this point and the user needs direct feeback.
>=20

I am going to remove this section of code as I don't need to open a file =

anymore.

>>
>>> +        return -1;
>>> +    }
>>> +
>>> +    /* Register translation block and exit callbacks */
>>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>>> +
>>> +    return 0;
>>> +}
>>
>>
>> Thanks,
>>
>> Mahmoud
>>
>>
>>
>=20

Thanks,
-- Alexandre


--zPwXtj5jVPFA08aX2OBDyVBgpLZ8iRQw7--

--bjT5QYiTNlCEECAhjq214gtPvp0T1G2N2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDI2YsFAwAAAAAACgkQbHknjz/NzAIp
LRAAg5bzGTr6DUjVX1xnLQqNy/3K2Mj5eMLA9uokkRMC3q3OF5ZiBi+vwSI+4Ucx67T51qIr/EZs
8tctdwlqZtZ5r/QE/FmRxj3hq3slNgImnEZISmTdi82EeNm8I/7qzL89UbCMyzY8NxPVorHFJp1H
xbdVVSIfR0Z4kJ2R9vtzQ5Hi7uZ4ji728sZ59thZCedRlbPNbMLPK98bC8wavRWtVk/wyI0s71yG
AsQh8WNkKPrfR68d0iYzA4P/hfZAg+3yj5Nlf3ZiFxhPgwqez5JhkiuPxij8i4qKHLopamCKVdNA
nb39Pq6W5Ls61b0QCuCObhJ6zulV+/Yr59RR64teEljkBS5wFdN4EKZEwKRCE6WeyIlJbg8z6QpH
qE8MmTkvRXB/ymUniI3UAUlQY20wWbYjDB+eCf3SpvpyAPflBwBhte6baUWgbKk4Qgg5a/RDIZsa
ldh23kUB/VW4hobHYLwUR7xEWpZy3FMkhuzvtJu3XwlajaFhnsJLitB/AYQq6qZNh4zIdHjTica+
7jy9iey01+CNSmqHtAJx4BFnG8QBoQWvDas/QdKJqS7YefwO8/HVl7A/UqPAT5rWHVS/pYPbXFEs
GGvtIpKvXia4tMHnnUxP+FL2zoNexeFvzBuAi/dzdlzQxbuIlemmpEkh3zZnNUsJQanZ+6Djz15S
4SA=
=VOKe
-----END PGP SIGNATURE-----

--bjT5QYiTNlCEECAhjq214gtPvp0T1G2N2--

