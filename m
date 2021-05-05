Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCC373C43
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:21:26 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHSv-0001Nx-3N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leHRW-0000Mo-89
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:19:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leHRU-0007fO-CF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:19:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so1820866wrr.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=w6pNYmE/MUy5Bt7H2El8Wabx7XEGwphu+bVLbGP64fw=;
 b=Y+Xg7+XagDhCe81S3qA4Db+gXcg9lIfVOqJoesXJ9S5sJPCmDLYCdu6bp8ZakEzJyg
 bTnXUeCEvXfuoyTmpaDUhXz81OdbVCLzfst1JYs2lxFuWChKRbfzm2MKkIUsuoMMs5by
 vIBFtQmCSDGQFgYNy1RA45OzWuyERe0UtyzMnJ6fQbFHtvn2jEdbhc1PptgDeLRDbEWi
 nudVw0Ay7HMH2/GKfgjHIN+KVVcuugK8+k5w95aWsphFKpeWnmqoWyniL0RvUjSfUUeB
 FoJROU+trtB0TRR27EQRCeQu7tkbCwG5gsvXlOGK+L89MQ4AHdzS+W+2/b1KXBhuZeOV
 f+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=w6pNYmE/MUy5Bt7H2El8Wabx7XEGwphu+bVLbGP64fw=;
 b=HYjoflEBKsL4Txh1ipXjZp2YC2HQD/NmFGM02u6OQ+CzZ8HPJdDSjlnM+IRIXh9NlJ
 e75a2cxzz4gKEueGRlYiXQiG8ka4FCo93Im+KiAOLlLRJvcM9ksuh06jsI+rmoxZMse+
 sc0Aqh+iChJoNuzbxdbOE/9m0x1Gl1k4kvQq5dJ+/75O4fXuqmHsTGLF4X9vVk93L7/l
 KWTa+VXkL+uiLGfsE4n+Et9DgItXoNwirzi5CSuJQpuRKopgrNys7yTIERsxvxIgJVRP
 +8ul/vEHS5jtQxwxLSBVzZfyj1sOXZR+QPpI4BTyAzgvwr04ubHtiYrNCIrjv9cOzsn4
 Sg9g==
X-Gm-Message-State: AOAM532pe3JRCLGcKXYm9iHWaOrfKkuFbk7v6vzIlFOCBxHb0jY1zaC/
 6rEEED26ANsHz0EFo6RS582xwQ==
X-Google-Smtp-Source: ABdhPJwHU8mHKx+KhVxSBKXW0I6UaBt92wkZkz1mxKZ94i3+tUQNS+JP7uQUrdmJZ1bjaUoRadXTLg==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr12031575wrq.317.1620220794321; 
 Wed, 05 May 2021 06:19:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g19sm5371424wme.48.2021.05.05.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 06:19:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 439151FF7E;
 Wed,  5 May 2021 14:19:52 +0100 (BST)
References: <20210420115433.12148-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v3] plugins/syscall: Added a table-like summary output
Date: Wed, 05 May 2021 14:13:53 +0100
In-reply-to: <20210420115433.12148-1-ma.mandourr@gmail.com>
Message-ID: <87fsz1nwqv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Added a table-like output which contains the total number of calls
> for each used syscall along with the number of errors that occurred.
>
> Per-call tracing is still available through supplying the argument
> ``print`` to the plugin.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
<snip>
> +
> +void print_entry(gpointer val, gpointer user_data)
>  {
>      g_autofree gchar *out;
> -    out =3D g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 =
"\n",
> -            num, ret);
> +    SyscallStats *entry =3D (SyscallStats *) val;
> +    int64_t syscall_num =3D entry->num;
> +    out =3D g_strdup_printf(
> +        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
> +        syscall_num, entry->calls, entry->errors);
>      qemu_plugin_outs(out);
>  }

This still fails to compile due to a missing static:

[2/10] Compiling C object tests/plugin/libsyscall.so.p/syscall.c.o
FAILED: tests/plugin/libsyscall.so.p/syscall.c.o
cc -Itests/plugin/libsyscall.so.p -Itests/plugin -I../../tests/plugin -I../=
../include/qemu -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.=
0/include -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu99 -O2 -g -isystem /home/alex/lsrc/qemu.git/linux-headers -isystem li=
nux-headers -iquote . -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/l=
src/qemu.git/include -iquote /home/alex/lsrc/qemu.git/disas/libvixl -iquote=
 /home/alex/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SO=
URCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SO=
URCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissin=
g-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declarati=
on -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Win=
it-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -=
Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs =
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -DLEGACY_RDMA=
_REG_MR -fPIC -MD -MQ tests/plugin/libsyscall.so.p/syscall.c.o -MF tests/pl=
ugin/libsyscall.so.p/syscall.c.o.d -o tests/plugin/libsyscall.so.p/syscall.=
c.o -c ../../tests/plugin/syscall.c
../../tests/plugin/syscall.c:80:6: error: no previous prototype for =E2=80=
=98print_entry=E2=80=99 [-Werror=3Dmissing-prototypes]
 void print_entry(gpointer val, gpointer user_data)
      ^~~~~~~~~~~
cc1: all warnings being treated as errors
ninja: build stopped: subcommand failed.
make: *** [Makefile:152: run-ninja] Error 1

>=20=20
> +static gint comp_func(gconstpointer ea, gconstpointer eb)
> +{
> +    SyscallStats *ent_a =3D (SyscallStats *) ea;
> +    SyscallStats *ent_b =3D (SyscallStats *) eb;
> +
> +    return ent_a->calls > ent_b->calls ? -1 : 1;
> +}
> +
>  /* *********************************************************************=
**** */
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +    if (!statistics) {
> +        return;
> +    }
> +
> +    g_mutex_lock(&lock);
> +    GList *entries =3D g_hash_table_get_values(statistics);
> +    entries =3D g_list_sort(entries, comp_func);
> +    qemu_plugin_outs("syscall no.  calls  errors\n");
>=20=20
> -static void plugin_exit(qemu_plugin_id_t id, void *p) {}
> +    g_list_foreach(entries, print_entry, NULL);
> +
> +    g_list_free(entries);
> +    g_hash_table_destroy(statistics);
> +    g_mutex_unlock(&lock);
> +}

Hmm it looks like we see multiple plugin_exit's when running multiple
threads:

  ./qemu-aarch64 -d plugin -D output -plugin ./tests/plugin/libsyscall.so .=
/tests/tcg/aarch64-linux-user/linux-test

I don't see it with testthread or the new signals test though which is
confusing. Something linux-test is doing must be different.

>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                             const qemu_info_t *info,
>                                             int argc, char **argv)
>  {
> +    if (argc =3D=3D 0) {
> +        statistics =3D g_hash_table_new_full(NULL, g_direct_equal, NULL,=
 g_free);
> +    } else {
> +        for (int i =3D 0; i < argc; i++) {
> +            if (g_strcmp0(argv[i], "print") !=3D 0) {
> +                fprintf(stderr, "unsupported argument: %s\n", argv[i]);
> +                return -1;
> +            }
> +        }
> +    }
> +
>      qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
>      qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);

Otherwise looking pretty good - certainly a more useful default ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

