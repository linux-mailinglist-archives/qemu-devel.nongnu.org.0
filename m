Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C93A78FC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:24:11 +0200 (CEST)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4Mk-0006rs-G7
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt4Lg-00059q-Ml
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:23:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt4Ld-0007tT-4U
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:23:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id v9so1018312wrx.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=NzBguQNmKu9jWojJgoeSNNjLoQi19+cARFIjoD9uEpg=;
 b=PuLpISDLzEhL8LMM90wcUr3Puj0wyqgTz5RQr75r7j1XTsq2x6X0c7yty/xPHxdwFm
 qMRW+hSjX6gv6WQPb7VgS4tFoo5Km4t/MgIcGqiu5LiWZXBIEIUDAew76jF08t48GRoe
 bSZ4QEEmiZSgRwbCPwaXQm2KuY7EfvRpUKdTGAvszcno19ui0kEmpem7N8HXe2wyo/X2
 Gbv4ZaCw8Ggkluhz5zlbAmoqqCYaWW4MFAJxbRmeCO6ZmIsSEMVcFSpCrho33qDZhz2p
 8FMWcDGT40KCbrKDkIHhGsy3qqL2SqGJIeFqLko3LvE65l8TQePt8pk+lGa8PG25zAzo
 S4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=NzBguQNmKu9jWojJgoeSNNjLoQi19+cARFIjoD9uEpg=;
 b=XsnR2/jUikhiipiTvnMtZmXzV9k+393ShtHWlpkrCDaqSTPJwKLDXzO9zIpsVm7kW+
 geH+DSPv0dyym29SjbgZjxGtIcXSdqPOY0SOswfn+iHhGllwvrnNQdjyRqw1ASynmZcS
 uGN3P9aI64omXhLQJNS4bDow4CTI+DD6CEjrJov45++rl4tmiesWbNDBNoOg94IOh2f5
 Bq1YhP25efIcqaH6mUpSZRV3ZrF8RPPBvcRqVOG5zo1RoyKENqucmeCzLEinoBm07Bhy
 AhhSEb+zUDUE6UdZv3jquDNqWSgUHDnQdzU67ygFCzMkO0oko/rNm234kzIgenEQ8RdA
 3Emw==
X-Gm-Message-State: AOAM533aLZ68gnRCKJRoZDWJusyAHcUSiMXZ8SRoGXUZ2SBR/yGfmwaW
 6LGpXl7jldiotg6WwrwX9M+PtQ==
X-Google-Smtp-Source: ABdhPJxGH/jI1b/q6RU/l/PLAx7LXX1Xl9aBuTbHE+gan0v5oTpj0a1y87bXqe0URTgotuqPfqsDFw==
X-Received: by 2002:adf:c790:: with SMTP id l16mr23991773wrg.121.1623745379130; 
 Tue, 15 Jun 2021 01:22:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h11sm14842392wmq.34.2021.06.15.01.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 01:22:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 131851FF7E;
 Tue, 15 Jun 2021 09:22:56 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction
 execution and memory access
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com>
Date: Tue, 15 Jun 2021 09:22:56 +0100
In-Reply-To: <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com> (Mahmoud
 Mandour's message of "Mon, 14 Jun 2021 19:04:37 +0200")
Message-ID: <871r93k04f.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On 14/06/2021 11:01, Alexandre Iooss wrote:
>> Log instruction execution and memory access to a file.
>> This plugin can be used for reverse engineering or for side-channel anal=
ysis
>> using QEMU.
>>
>> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
>> ---
>>   MAINTAINERS               |   1 +
>>   contrib/plugins/Makefile  |   1 +
>>   contrib/plugins/execlog.c | 112 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 114 insertions(+)
>>   create mode 100644 contrib/plugins/execlog.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7d9cd29042..65942d5802 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2974,6 +2974,7 @@ F: include/tcg/
>>     TCG Plugins
>>   M: Alex Benn=C3=83=C2=A9e <alex.bennee@linaro.org>
>> +R: Alexandre Iooss <erdnaxe@crans.org>
>>   S: Maintained
>>   F: docs/devel/tcg-plugins.rst
>>   F: plugins/
>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>> index b9d7935e5e..51093acd17 100644
>> --- a/contrib/plugins/Makefile
>> +++ b/contrib/plugins/Makefile
>> @@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
>>   VPATH +=3D $(SRC_PATH)/contrib/plugins
>>     NAMES :=3D
>> +NAMES +=3D execlog
>>   NAMES +=3D hotblocks
>>   NAMES +=3D hotpages
>>   NAMES +=3D howvec
>> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
>> new file mode 100644
>> index 0000000000..80716e8eed
>> --- /dev/null
>> +++ b/contrib/plugins/execlog.c
>> @@ -0,0 +1,112 @@
>> +/*
>> + * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
>> + *
>> + * Log instruction execution and memory access to a file.
>> + * You may pass the output filename as argument.
>> + *
>> + * License: GNU GPL, version 2 or later.
>> + *   See the COPYING file in the top-level directory.
>> + */
>> +#include <glib.h>
>> +#include <inttypes.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +#include <qemu-plugin.h>
>> +
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>> +
>> +/* Execution trace buffer */
>> +FILE *output;
>
> Is there a reason for using a regular FILE * instead of using
> `qemu_plugin_outs()`?
>
> I don't see a benefit and since there's an API for logging I guess
> it's better to use it instead

I would prefer using qemu_plugin_outs unless there is a reason to have
multiple streams.

>
>> +
>> +/**
>> + * Log memory read or write
>> + */
>> +static void vcpu_mem(unsigned int vcpu_index, qemu_plugin_meminfo_t inf=
o,
>> +                     uint64_t vaddr, void *udata)
>> +{
>> +    struct qemu_plugin_hwaddr *hwaddr =3D qemu_plugin_get_hwaddr(info, =
vaddr);
>> +    if (!hwaddr) {
>> +        return;
>> +    }
>
> So you just reject all memory accesses in user mode? I think that it
> equally useful
>
> to log only the virtual address of a memory access in user-mode
> emulation? However, we better
>
> wait for Alex's opinion on all this since he had remarks about
> introducing a new ad-hoc
>
> tracing format...

It would be nice to integrate with the QEMU tracing support but
following Stefan's comments I think it will be fairly involved to work
out a way to do it. In the meantime using plain text logging will have
to do.

>> +
>> +    /* Add data to execution log */
>> +    const char *name =3D qemu_plugin_hwaddr_device_name(hwaddr);
>> +    uint64_t addr =3D qemu_plugin_hwaddr_phys_addr(hwaddr);
>> +    if (qemu_plugin_mem_is_store(info)) {
>> +        fprintf(output, "mem: %s store at 0x%08lx\n", name, addr);
>> +    } else {
>> +        fprintf(output, "mem: %s load at 0x%08lx\n", name, addr);
>> +    }

I would consider a comma separated output to make the file easily
digestible by other tools. Maybe:

  memory, 0x%08lx, load|store

>> +}
>> +
>> +/**
>> + * Log instruction execution
>> + */
>> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>> +{
>> +    char *insn_disas =3D (char *)udata;
>> +
>> +    /* Add data to execution log */
>> +    fprintf(output, "insn: %s\n", insn_disas);

  insn, 0x%08lx, disas

Currently however on a multi-threaded execution you will potentially
loose any synchronisation between the insn_exec and any memory operation
associated with it. If you really just care about what's tickling
hardware you could just drop the insn_exec callback and pass the
instruction information via udata to the vcpu_mem callback. You could
then dump everything in one line:

  0xPC, ld [x1], x2, 0xADDR, load|store

you wouldn't dump other instructions leading up to that though.

>> +}
>> +
>> +/**
>> + * On translation block new translation
>> + *
>> + * QEMU convert code by translation block (TB). By hooking here we can =
then hook
>> + * a callback on each instruction and memory access.
>> + */
>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *t=
b)
>> +{
>> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
>> +    for (size_t i =3D 0; i < n; i++) {
>> +        /* insn is shared between translations in QEMU, copy needed dat=
a here */
>> +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb,
>> i);

If you had some knowledge of the guest architecture you could attempt a
partial decode of the op and work out if it was a load/store and then
conditionally register the mem or exec callback.

>> +        char *insn_disas =3D qemu_plugin_insn_disas(insn);
>> +
>> +        /* Register callback on memory read or write */
>> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
>> +                                         QEMU_PLUGIN_CB_NO_REGS,
>> +                                         QEMU_PLUGIN_MEM_RW, NULL);
>> +
>> +        /* Register callback on instruction */
>> +        qemu_plugin_register_vcpu_insn_exec_cb(
>> +            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_R_REGS, insn_disas);
>> +    }
>> +}
>> +
>> +/**
>> + * On plugin exit, close output file
>> + */
>> +static void plugin_exit(qemu_plugin_id_t id, void *p)
>> +{
>> +    fclose(output);
>> +}
>> +
>> +/**
>> + * Install the plugin
>> + */
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>> +                                           const qemu_info_t *info, int=
 argc,
>> +                                           char **argv)
>> +{
>> +    /* Parse arguments to get output name and open for writing */
>> +    char *filename =3D "execution.log";
>> +    if (argc > 0) {
>> +        filename =3D argv[0];
>> +    }
>> +    output =3D fopen(filename, "w");
>> +    if (output =3D=3D NULL) {
>> +        qemu_plugin_outs("Cannot open output file for writing.\n");
>
> Here, I think that it's more logical to output error messages to
> stderr since
>
> logging can be redirected to a file so QEMU will error but the error mess=
age
>
> would be written to the log file.

Yes please, report errors directly to stderr as the execution is going
to trigger and exit at this point and the user needs direct feeback.

>
>> +        return -1;
>> +    }
>> +
>> +    /* Register translation block and exit callbacks */
>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>> +
>> +    return 0;
>> +}
>
>
> Thanks,
>
> Mahmoud
>
>
>

--=20
Alex Benn=C3=A9e

