Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB40363FF0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:54:05 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRXX-0003uV-0K
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYRHn-0004QN-0r
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:37:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYRHk-0001pu-T4
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:37:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id w186so13360985wmg.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=srymAYRzhj5zIEa340DmYlGR4IEUW+bg+daCCBpoBqc=;
 b=wXX41+SySlNyZgpyNjPI1XftkwJlkkGDL3IEJtEDuF1PcQKxSrpv7UVFDKJi+m1q62
 GQj/svx3o+V3zpCW3C6S2wBNYiEr/KhBV+3yf6daJsY7TNch5AdhFO9t34lvwL/shWXs
 lJ6Mj+f2Ne8uZpISm3Queqzs3UJyxXREGUq4lXbjFpZQ1Ypk8ZGDpIjZXpwPM28jbQgb
 pjFuQVWGylT69bLPuZ5Xb73Y3w+oLutWK9eb3oYkd5pnFv4kkI9Xz9VDzGLhTSEi05gS
 CSLBmvn8/eapb5vAdE5pDRejcYzGo4V70y/sV5hyljeUEFbomEfrCIexigAe5KlB9PFE
 eQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=srymAYRzhj5zIEa340DmYlGR4IEUW+bg+daCCBpoBqc=;
 b=RBwwm8XkaX1vTgOUn8EQiYEBJM3ldgGwfOncqDPBR+3Nu9e9MnqNfGm6osTIszv9ss
 pAhz7NidIT0Ol6yGVDkmxtKJMqRzwOenTsNnQ3t5rjCS4ev5PHltFgqC3F3hcvdsO78c
 N49EnHWPfEShpouOi8scak7AU4PiG2gQ/A8JkonNyJfC4j581/hgIO9lYXGqsvwhXUMt
 pG+tKVh1I3WjsGUi53etaRFx/zpNPvcRVhmiCqaw/T+m3kfEFjRZBXlP6bFZdNfr+g9K
 /7c6fSnDUvGkkwJnGODGyPP830PppIVI7zYRFynyyjiedqf4OEKfAkZJQF2G8olv6ryX
 t62A==
X-Gm-Message-State: AOAM530noKjkXhYQU5ysR8ltI8xIgJwALP7Gw9RUoRII+L0VU8CjTm+t
 UbCLUt/ECw8omARxZGHdTuTuxw==
X-Google-Smtp-Source: ABdhPJwtbfnMmLZtd7wYPCb2dJWEyk+UOnDTXoVvGmeBCJXloVdnENCtBAMHhMRcsSztwJdvxQY2yw==
X-Received: by 2002:a1c:454:: with SMTP id 81mr20892868wme.186.1618828663127; 
 Mon, 19 Apr 2021 03:37:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm24593227wrg.31.2021.04.19.03.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 03:37:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 202481FF7E;
 Mon, 19 Apr 2021 11:37:41 +0100 (BST)
References: <20210416071740.3393-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2] plugins/syscall: Added a table-like summary output
Date: Mon, 19 Apr 2021 11:23:30 +0100
In-reply-to: <20210416071740.3393-1-ma.mandourr@gmail.com>
Message-ID: <87czuqa7be.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02623.html
> v1 -> v2: Removed debugging code in the on-return from syscall callback=20
>           that was silently existent.
>
>  tests/plugin/syscall.c | 91 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 85 insertions(+), 6 deletions(-)
>
> diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
> index 53ee2ab6c4..b66a930635 100644
> --- a/tests/plugin/syscall.c
> +++ b/tests/plugin/syscall.c
> @@ -16,32 +16,111 @@
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>=20=20
> +typedef struct {
> +    int64_t calls;
> +    int64_t errors;
> +} SyscallStats;
> +
> +static GHashTable *syscalls_statistics;
> +
> +static bool percall_print;
> +
>  static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
>                           int64_t num, uint64_t a1, uint64_t a2,
>                           uint64_t a3, uint64_t a4, uint64_t a5,
>                           uint64_t a6, uint64_t a7, uint64_t a8)
>  {
> -    g_autofree gchar *out =3D g_strdup_printf("syscall #%" PRIi64 "\n", =
num);
> -    qemu_plugin_outs(out);
> +    if (!percall_print) {

I think you could eliminate the percall_print global and just invert the
test and have if (syscall_statisitics)

> +        SyscallStats *syscall_entry;
> +
> +        syscall_entry =3D
> +            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
> +                                                  GINT_TO_POINTER(num));
> +
> +        if (!syscall_entry) {
> +            syscall_entry =3D g_new(SyscallStats, 1);
> +            syscall_entry->calls =3D 1;
> +            syscall_entry->errors =3D 0;
> +
> +            g_hash_table_insert(syscalls_statistics, GINT_TO_POINTER(num=
),
> +                                (gpointer) syscall_entry);

You you wrap up the entry creation into a helper it would make the code
less cluttered here, e.g.:

     syscall_entry =3D get_or_create_entry();
     syscall_entry->calls++;

> +        } else {
> +            syscall_entry->calls++;
> +        }
> +    } else {
> +        g_autofree gchar *out =3D g_strdup_printf("syscall #%" PRIi64 "\=
n", num);
> +        qemu_plugin_outs(out);
> +    }
>  }
>=20=20
>  static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
>                               int64_t num, int64_t ret)
> +{
> +    if (!percall_print) {
> +        SyscallStats *syscall_entry;
> +
> +        syscall_entry =3D
> +            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
> +                                                  GINT_TO_POINTER(num));
> +        if (ret < 0) {
> +            syscall_entry->errors++;
> +        }
> +    } else {
> +        g_autofree gchar *out;
> +        out =3D g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRI=
i64 "\n",
> +                num, ret);
> +        qemu_plugin_outs(out);
> +    }

ditto.

> +}
> +
> +/* *********************************************************************=
**** */
> +
> +void print_entry(gpointer key, gpointer val, gpointer user_data)
>  {
>      g_autofree gchar *out;
> -    out =3D g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 =
"\n",
> -            num, ret);
> +    int64_t syscall_num =3D (int64_t) key;
> +    SyscallStats *syscall_entry =3D (SyscallStats *) val;
> +    out =3D g_strdup_printf(
> +        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
> +        syscall_num, syscall_entry->calls, syscall_entry->errors);
>      qemu_plugin_outs(out);
>  }
>=20=20
> -/* *********************************************************************=
**** */
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +    if (!percall_print) {
> +        qemu_plugin_outs("syscall no.  calls  errors\n");
> +        g_hash_table_foreach(syscalls_statistics, &print_entry,
> NULL);

Sorting the hash list by calls would be a nice improvement - see howvec
for an example of how to use g_hash_table_get_values/g_list_sort.

For cleanliness you should also clean-up the syscall_statisitics hash
table and deallocation although in practice it doesn't really matter as
use space is about to exit anyway.

> +    }
> +}
>=20=20
> -static void plugin_exit(qemu_plugin_id_t id, void *p) {}
> +void free_entry(gpointer entry)
> +{
> +    g_free(entry);
> +}
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                             const qemu_info_t *info,
>                                             int argc, char **argv)
>  {
> +    int i;
> +
> +    for (i =3D 0; i < argc; i++) {
> +        char *opt =3D argv[i];
> +        if (g_strcmp0(opt, "print") =3D=3D 0) {
> +            percall_print =3D true;

So this would be a local now and or even:

  if (argc =3D=3D 0) {
      syscalls_statistics =3D g_hash_table_new_full(g_direct_hash, g_direct=
_equal,  NULL, &free_entry);
  } else {
      for (i =3D 0; i < argc; i++) {
          ...

> +        } else {
> +            fprintf(stderr, "unsupported argument: %s\n", opt);
> +            return -1;
> +        }
> +    }
> +
> +    if (!percall_print) {
> +        syscalls_statistics =3D
> +            g_hash_table_new_full(g_direct_hash, g_direct_equal,
> +                    NULL, &free_entry);

For a simple non-nested structure you might even get away with a plain g_ha=
sh_table_new()

> +    }
> +
>      qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
>      qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);


--=20
Alex Benn=C3=A9e

