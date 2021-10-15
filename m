Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14842F392
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:32:34 +0200 (CEST)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNK5-0000Hv-1L
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbNHO-0007Wv-0K
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:29:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbNHM-0004oV-2x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:29:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso2413639wmb.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KQOLGgDiu57qZka4kRXrhJREKYViuzM5pBH+LzVeR5k=;
 b=cebfpfGDGnH+B+bSMkZVq5ZWtsuLoJJJeonN/QGNY1Fb83ZFUUgFFMcqhZV0l+I8wH
 8ANt3Yk6O0C4C+twMn2K+ubjecfvYSg5LddfI6Hdly5HvUQtRhUL5jGeabMjm4FG5qN4
 lmPeiCEBdRXEwnxZ0Acg510jXYMzC2eik5qErgrEmi6UB0BZ74JieD5j87Wqmhm9IlK1
 JCJCf731EyIPUi42wSa/4zg0hcp50rb9/uBx4axgCto/kLKi3s40yH0Zj3FXUA6P+xPd
 ceaiZgKTrOurl1gAOxZyL2aiSYPrI/NXvcNHuZ8IhoH35sk1Fayby1waOYhPfpUc3dkd
 MKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KQOLGgDiu57qZka4kRXrhJREKYViuzM5pBH+LzVeR5k=;
 b=QPSfda9GyiJ+KkH6newLwYTm5SbBtdWKfjwpr9X5xslCpjS+fz7wbyo/4RQXMKy8SU
 lbEfgzlKaYiJ+UVLVNLvx3JnioqD4epAlAXpSU9esV6+s1TtcxIb4AUg+8r9GRxj6iFq
 p0GUyDJOpXHWiOzlnDDJWsF0cLGNlXo6gNwpu3NlhkJU9+FUa9/0UzFj2Kx9FaFMwpjp
 V4kha4fCl0NbKUyHXaJcp/lBP7jzvq2OePHnQPOtgjX92MYEGTKe57UGnmtn2QDRgcJD
 3EvrqEJ/uR9rU/rI6yGJ62iWYbxLiQuoWJ/dr+ZDi0d33/0wZUiQhzKrTF241oPuXWFH
 M4PQ==
X-Gm-Message-State: AOAM532pWC4pvnJ3bAtbBa7ZwHxRLrqHtfBVE8whrB4YYDLJM6+XjMjV
 2AcvgEiCZugzqNpUiHHP4ehlgA==
X-Google-Smtp-Source: ABdhPJzjE86n5fkguRdc4YDSZZ73VN937W2EJ+vdaCz3JHBnCnvA+G+LdoMEwqazOLcyJ7F/7EEpWQ==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr12905131wme.127.1634304582146; 
 Fri, 15 Oct 2021 06:29:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j206sm7901908wmj.23.2021.10.15.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:29:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82BCC1FF96;
 Fri, 15 Oct 2021 14:29:40 +0100 (BST)
References: <20211011111130.170178-1-arkaisp2021@gmail.com>
 <87pmsawlph.fsf@linaro.org> <a25c7f50daccd761189de8dfe08a641d@ispras.ru>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: arkadiy.ivanov@ispras.ru
Subject: Re: [PATCH] contrib/plugins: add a drcov plugin
Date: Fri, 15 Oct 2021 14:29:21 +0100
In-reply-to: <a25c7f50daccd761189de8dfe08a641d@ispras.ru>
Message-ID: <87pms6tnzv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Arkadiy <arkaisp2021@gmail.com>, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


arkadiy.ivanov@ispras.ru writes:

> Alex Benn=C3=A9e =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2021-10-12 13:36:
>> Arkadiy <arkaisp2021@gmail.com> writes:
>>=20
>>> From: NDNF <arkaisp2021@gmail.com>
>>> This patch adds the ability to generate files in drcov format.
>>> Primary goal this script is to have coverage
>>> logfiles thatwork in Lighthouse.
>>> Problems:
>>>     - The path to the executable file is not specified.
>> I don't see a problem in introducing a plugin helper function to
>> expose
>> the path to the binary/kernel to the plugin.
>>=20
>>>     - base, end, entry take incorrect values.
>>>       (Lighthouse + IDA Pro anyway work).
>> What are they meant to be? Again we could add a helper.
>>=20
>>> Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
>>> ---
>>>  contrib/plugins/Makefile |   1 +
>>>  contrib/plugins/drcov.c  | 112
>>> +++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 113 insertions(+)
>>>  create mode 100644 contrib/plugins/drcov.c
>>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>>> index 7801b08b0d..0a681efeec 100644
>>> --- a/contrib/plugins/Makefile
>>> +++ b/contrib/plugins/Makefile
>>> @@ -17,6 +17,7 @@ NAMES +=3D hotblocks
>>>  NAMES +=3D hotpages
>>>  NAMES +=3D howvec
>>>  NAMES +=3D lockstep
>>> +NAMES +=3D drcov
>>>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>>> diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
>>> new file mode 100644
>>> index 0000000000..d6a7d131c0
>>> --- /dev/null
>>> +++ b/contrib/plugins/drcov.c
>>> @@ -0,0 +1,112 @@
>>> +/*
>>> + * Copyright (C) 2021, Ivanov Arkady <arkadiy.ivanov@ispras.ru>
>>> + *
>>> + * Drcov - a DynamoRIO-based tool that collects coverage information
>>> + * from a binary. Primary goal this script is to have coverage log
>>> + * files that work in Lighthouse.
>>> + *
>>> + * License: GNU GPL, version 2 or later.
>>> + *   See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include <inttypes.h>
>>> +#include <assert.h>
>>> +#include <stdlib.h>
>>> +#include <inttypes.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +#include <stdio.h>
>>> +#include <glib.h>
>>> +
>>> +#include <qemu-plugin.h>
>>> +
>>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>>> +
>>> +static char header[] =3D "DRCOV VERSION: 2\n"
>>> +                "DRCOV FLAVOR: drcov-64\n"
>>> +                "Module Table: version 2, count 1\n"
>>> +                "Columns: id, base, end, entry, path\n";
>>> +
>>> +static FILE *fp;
>>> +
>>> +typedef struct {
>>> +    uint32_t start;
>>> +    uint16_t size;
>>> +    uint16_t mod_id;
>>> +} bb_entry_t;
>>> +
>>> +static GSList *bbs;
>>> +
>>> +static void printfHeader()
>> missing void in args.
>>=20
>>> +{
>>> +    g_autoptr(GString) head =3D g_string_new("");
>>> +    g_string_append(head, header);
>> You could just initialise with your header:
>>   g_autoptr(GString) head =3D g_string_new(header);
>>=20
>>> +    g_string_append_printf(head, "0, 0x%x, 0x%x, 0x%x, %s\n",
>>> +                           0, 0xffffffff, 0, "path");
>> Why pass consts intro the printf instead of just appending the data
>> as a string?
>>=20
>>> +    g_string_append_printf(head, "BB Table: %d bbs\n",
>>> g_slist_length(bbs));
>>> +    fwrite(head->str, sizeof(char), head->len, fp);
>>> +}
>>> +
>>> +static void printfCharArray32(uint32_t data)
>>> +{
>>> +    const uint8_t *bytes =3D (const uint8_t *)(&data);
>>> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
>>> +}
>>> +
>>> +static void printfCharArray16(uint16_t data)
>>> +{
>>> +    const uint8_t *bytes =3D (const uint8_t *)(&data);
>>> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
>>> +}
>> Can the above function names follow the QEMU house style please?
>>=20
>>> +
>>> +
>>> +static void printf_el(gpointer data, gpointer user_data)
>>> +{
>>> +    bb_entry_t *bb =3D (bb_entry_t *)data;
>>> +    printfCharArray32(bb->start);
>>> +    printfCharArray16(bb->size);
>>> +    printfCharArray16(bb->mod_id);
>>> +}
>>> +
>>> +static void plugin_exit(qemu_plugin_id_t id, void *p)
>>> +{
>>> +    /* Print function */
>>> +    printfHeader();
>>> +    g_slist_foreach(bbs, printf_el, NULL);
>>> +
>>> +    /* Clear */
>>> +    g_slist_free_full(bbs, &g_free);
>>> +    fclose(fp);
>>> +}
>>> +
>>> +static void plugin_init(void)
>>> +{
>>> +    fp =3D fopen("file.drcov.trace", "wb");
>> Could we make this configurable and just have "file.drcov.trace" as
>> the
>> default if not set?
>>=20
>>> +}
>>> +
>>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct
>>> qemu_plugin_tb *tb)
>>> +{
>>> +    bb_entry_t *bb =3D g_new0(bb_entry_t, 1);
>>> +    uint64_t pc =3D qemu_plugin_tb_vaddr(tb);
>>> +
>>> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
>>> +    for (int i =3D 0; i < n; i++) {
>>> +        bb->size +=3D
>>> qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, i));
>>> +    }
>>> +
>>> +    bb->start =3D pc;
>>> +    bb->mod_id =3D 0;
>>> +    bbs =3D g_slist_append(bbs, bb);
>>> +
>>> +}
>> I'm guessing this works in the simple case but beware that not all
>> translations get executed. It might be better to as a install an actual
>> tracer when the TB gets executed.
>> Although most TBs run to completion there are cases where execution
>> stops in them middle of TB. Generally this will be when a synchronous
>> fault has occurred and we exit the block early, potentially
>> regenerating
>> a block at the PC the fault was at.
>> The g_list_append should be protected by a mutex as translation can
>> be
>> multi-threaded (at least for system emulation).
>>=20
>>> +
>>> +QEMU_PLUGIN_EXPORT
>>> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
>>> +                        int argc, char **argv)
>>> +{
>>> +    plugin_init();
>>> +
>>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>>> +    return 0;
>>> +}
>> I'll happily take a v2 of this patch with the fixes outlined above.
>> However I note the dynamorio pages talk about drcov2lcov which can
>> convert to lcov data. Given the basics of code coverage will be the
>> same
>> it would be nice to see a re-factoring that would allow for multiple
>> output formats so the user could select their preferred output as an
>> option.
>
> I couldn't find a detailed description of the lcov format. Also, my
> tests with drcov2lcov were unsuccessful. At the moment, I don't think
> this is a priority.

That's a shame but I agree it shouldn't hold up getting this in ;-)

--=20
Alex Benn=C3=A9e

