Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45205435FBD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:54:12 +0200 (CEST)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVi7-0007lo-C7
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdVgr-0006H8-RU
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:52:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdVgp-0003Ep-Mt
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:52:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id r10so127865wra.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VB0z5vRpxWgbSOHV8fsc3SsveTX0UJow93Xj7yYR/iE=;
 b=vwTjtq+jEhgtJaz7slFYIwEkmkrQJO6wjDTBGQgmPL63v6A0A39bwQYbKNn76w6hr2
 6ulbExgeD1VP7biA9zKrNk6q7Xy8qa+3B93KdkegtWFFWIiJ25UrdSsNPUgZwvrG/33S
 r0Qd1Vp6pRping3ivZ7J+DkWH2CD1yIpScu9/eTPhL3xQg7OF32ZPOtAo2Prxu6KpkaW
 bMbI/I3coHw3aqUfg30SwIkKx8QdA8gbVpaYJHiRiISIOSpUABa0S0jjLSRg5isAC7/h
 fdLMwxx/pcA3I1J4UE433aCjKK1782c2xRSc62K0fwkXqagKq4kQjwC1kq8E7VU2acgy
 0GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VB0z5vRpxWgbSOHV8fsc3SsveTX0UJow93Xj7yYR/iE=;
 b=Ngb8DJwwHezHc4m4XDMKelIARtIAWh4lTIvlBkEURbYX04+uDugDsrkrHzDl3gql7o
 wIkPjp50yCwdn51QhZyQ7nrPHfxPq4QqHIXbJdELfrIw+f4UucfncamWbcf1Nld2ywT0
 AJLlnG7rjGOhUq9QMkIBEr+Ka6aDLv/7GUl/vhHsDBufWIUPvzvDt0gU7NMcnKReSYi2
 73PI7VNOzrdGe9bAhLK4HPcBwjj6/Ft1GH3Zn08fChhe80heThhkPhUDIPeBgT7WFIYH
 knDJvMti5Q32f04fvNqVCVhw69A+FAehzhZHpGggnJViQ8Z5DJNUZ9galOCdAoFKnXy9
 OLEQ==
X-Gm-Message-State: AOAM5337xjfn9BUqsKNp8eQfK4hrxnqMro69QHtZplu8pTqTAxWvGii1
 IwBTKQ6FvRj7J5I98B5xLGPxJCWQpRM+uQ==
X-Google-Smtp-Source: ABdhPJzLDlwyr2k+qLDQMjMs80quckEYJamTvvm0YpzlbfvOa+ntBlBYQHadgAiC9Nj2GryhtY0nLQ==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr6320496wrr.439.1634813569727; 
 Thu, 21 Oct 2021 03:52:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a5sm4460720wrn.71.2021.10.21.03.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:52:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AEA41FF96;
 Thu, 21 Oct 2021 11:52:48 +0100 (BST)
References: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
 <163429172593.439576.18239997817704146254.stgit@pc-System-Product-Name>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: NDNF <arkaisp2021@gmail.com>
Subject: Re: [PATCH v2 2/2] contrib/plugins: add a drcov plugin
Date: Thu, 21 Oct 2021 11:40:04 +0100
In-reply-to: <163429172593.439576.18239997817704146254.stgit@pc-System-Product-Name>
Message-ID: <87v91qtzsv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


NDNF <arkaisp2021@gmail.com> writes:

> This patch adds the ability to generate files in drcov format.
> Primary goal this script is to have coverage
> logfiles thatwork in Lighthouse.
>
> Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
> ---
>  contrib/plugins/Makefile |    1=20
>  contrib/plugins/drcov.c  |  148 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 contrib/plugins/drcov.c
>
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index 7801b08b0d..0a681efeec 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -17,6 +17,7 @@ NAMES +=3D hotblocks
>  NAMES +=3D hotpages
>  NAMES +=3D howvec
>  NAMES +=3D lockstep
> +NAMES +=3D drcov
>=20=20
>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>=20=20
> diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
> new file mode 100644
> index 0000000000..f94b52ff64
> --- /dev/null
> +++ b/contrib/plugins/drcov.c
> @@ -0,0 +1,148 @@
> +/*
> + * Copyright (C) 2021, Ivanov Arkady <arkadiy.ivanov@ispras.ru>
> + *
> + * Drcov - a DynamoRIO-based tool that collects coverage information
> + * from a binary. Primary goal this script is to have coverage log
> + * files that work in Lighthouse.
> + *
> + * License: GNU GPL, version 2 or later.
> + *   See the COPYING file in the top-level directory.
> + */
> +
> +#include <inttypes.h>
> +#include <assert.h>
> +#include <stdlib.h>
> +#include <inttypes.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <glib.h>
> +
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +
> +static char header[] =3D "DRCOV VERSION: 2\n"
> +                "DRCOV FLAVOR: drcov-64\n"
> +                "Module Table: version 2, count 1\n"
> +                "Columns: id, base, end, entry, path\n";
> +
> +static FILE *fp;
> +static char *file_name;
> +static GMutex lock;
> +
> +typedef struct {
> +    uint32_t start;
> +    uint16_t size;
> +    uint16_t mod_id;
> +} bb_entry_t;
> +
> +static GSList *bbs;
> +
> +static void printf_header(void)
> +{
> +    g_autoptr(GString) head =3D g_string_new(header);
> +    const char *path =3D qemu_plugin_path_to_binary();
> +    uint64_t start_code =3D qemu_plugin_start_code();
> +    uint64_t end_code =3D qemu_plugin_end_code();
> +    uint64_t entry =3D qemu_plugin_entry_code();
> +    g_string_append_printf(head, "0, 0x%lx, 0x%lx, 0x%lx, %s\n",
> +                           start_code, end_code, entry, path);
> +    g_string_append_printf(head, "BB Table: %d bbs\n", g_slist_length(bb=
s));
> +    fwrite(head->str, sizeof(char), head->len, fp);
> +}
> +
> +static void printf_char_array32(uint32_t data)
> +{
> +    const uint8_t *bytes =3D (const uint8_t *)(&data);
> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
> +}
> +
> +static void printf_char_array16(uint16_t data)
> +{
> +    const uint8_t *bytes =3D (const uint8_t *)(&data);
> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
> +}
> +
> +
> +static void printf_el(gpointer data, gpointer user_data)
> +{
> +    g_mutex_lock(&lock);
> +
> +    bb_entry_t *bb =3D (bb_entry_t *)data;
> +    printf_char_array32(bb->start);
> +    printf_char_array16(bb->size);
> +    printf_char_array16(bb->mod_id);
> +
> +    g_mutex_unlock(&lock);
> +}
> +
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +    /* Print function */
> +    printf_header();
> +    g_slist_foreach(bbs, printf_el, NULL);
> +
> +    /* Clear */
> +    g_slist_free_full(bbs, &g_free);
> +    g_free(file_name);
> +    fclose(fp);
> +}
> +
> +static void plugin_init(void)
> +{
> +    fp =3D fopen(file_name, "wb");
> +}
> +
> +static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
> +{
> +    bb_entry_t *bb =3D g_malloc0(sizeof(bb_entry_t));
> +    memcpy(bb, udata, sizeof(bb_entry_t));
> +
> +    g_mutex_lock(&lock);
> +    bbs =3D g_slist_append(bbs, bb);
> +    g_mutex_unlock(&lock);

Hmm given the data you are copying is static and never going to change
you could just save the pointer to it in a log. Instead of maintaining a
bbs g_slist you could use g_ptr_array_add(bbs, udata) (with appropriate
locking) and then just iterate over the log at the end. As the same
entry will have multiple references you probably need another ptr array
just to track the creation bellow which you can use to clean-up on exit.
That should still be a net saving on two mallocs and s_list.

> +}
> +
> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> +{
> +    bb_entry_t *bb =3D g_new0(bb_entry_t, 1);
> +    uint64_t pc =3D qemu_plugin_tb_vaddr(tb);
> +
> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
> +    for (int i =3D 0; i < n; i++) {
> +        bb->size +=3D qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, =
i));
> +    }
> +
> +    bb->start =3D pc;
> +    bb->mod_id =3D 0;
> +
> +    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
> +                                         QEMU_PLUGIN_CB_NO_REGS,
> +                                         (void *)bb);
> +
> +}
> +
> +QEMU_PLUGIN_EXPORT
> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
> +                        int argc, char **argv)
> +{
> +
> +    if (!argc) {
> +        file_name =3D "file.drcov.trace";
> +    } else {
> +        if (g_str_has_prefix(argv[0], "filename=3D")) {
> +            size_t size =3D strlen(argv[0]) - 9;
> +            file_name =3D g_malloc0(size + 1);
> +            strncpy(file_name, argv[0] + 9, size);
> +            file_name[size] =3D '\0';

I guess it's probably overkill for a single arg but if you were looping
of argv something like:

        g_autofree char **tokens =3D g_strsplit(argv[i], "=3D", 2);
        if (g_strcmp0(tokens[0], "filename") =3D=3D 0) {
            file_name =3D g_strdup(tokens[1]);
        }

would be a more glib-like way to deal with it.

> +        }
> +    }
> +
> +    plugin_init();
> +
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> +
> +    return 0;
> +}


--=20
Alex Benn=C3=A9e

