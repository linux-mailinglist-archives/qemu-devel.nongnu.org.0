Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97557388DED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:23:02 +0200 (CEST)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLE5-0005II-Lk
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljLAo-0003V0-7J
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:19:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljLAj-0007Ca-PC
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:19:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v12so13798562wrq.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 05:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+m90p1VUSZQ3ZsbS02kSyptSdZ+QDmwPke/EsmcQFqA=;
 b=syyhULOzqDZVNRT0S992DJZlJ1OrjrPgf9dC7XaKOK5Ff/BiwjbW4+T30OWbCHHVG5
 c7HBYVDnu6bbrQAMWvg0x3+knbusYxUaZ+zY0K1ykhYTOyQlE9lsOwqH4RUv3l17+DV1
 CM9stdzGM32bKyal1+DV7F13P/iF4sa5EfkRJpLydNVXdPDfObOnWo86tsmFtnbwAmqn
 zFQI7pNfwEair9bTfE4RI5NxMCQo6iQulZMheBDXeKd0J/VfOZZuit8wKd348eV61OqK
 Uyg0AXvJV5LFcLgWZzi5FWqZDjgb0ERwdWNB6wvHXmcrpudqBE7oJBp1N3n7Fy55AHnl
 WDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+m90p1VUSZQ3ZsbS02kSyptSdZ+QDmwPke/EsmcQFqA=;
 b=aPzkx0pYszB8a9VrjH5liAFtpTaAoNSgX9Hw87Icu4xWY86X5zKLBZ5A9YqZrt+4i4
 5P7BSM+B13pcabLwBr9hP1Lcx0uJWIivWti627zu5J416mVCEUUYLK7NFgX4k6IBu4vX
 diZyEBxSeLRkJXgdDT4tSP8yYCAyr7yOrAYfoaUBKVgqG3hdWr8zW7A5D/ZiwY56jlmc
 4JBu23Og3AWlHMeUdRh6B/YUR05dMr+VPe57xMfbRuI7x9eq5CkGxRWexsk20NYIB63e
 Cwgqgnuzj2asBNqyCcLkEBgBFyAOl7mYWW0bpWW/+lDNVHwxv+I+vcfj6TZ5zfcGKMYv
 rlqQ==
X-Gm-Message-State: AOAM531LXQGKAwXyUVQSwsP+qSRgZQ194JuGij9olnxBvxapTUeUgRJ8
 juxuUGZhevTrGbgABHxjcjFS8A==
X-Google-Smtp-Source: ABdhPJyfJD0QYVVcrnnwGtZ+aEic2LeoCm2bh76A/UyaxsQNAixg0ThkIg4SXXTo8sA4atE8p5nMmw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr14406757wre.157.1621426771361; 
 Wed, 19 May 2021 05:19:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm5628229wmh.35.2021.05.19.05.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:19:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2FB31FF7E;
 Wed, 19 May 2021 13:19:28 +0100 (BST)
References: <20210519032409.3041-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4] plugins/syscall: Added a table-like summary output
Date: Wed, 19 May 2021 13:19:23 +0100
In-reply-to: <20210519032409.3041-1-ma.mandourr@gmail.com>
Message-ID: <87r1i2digf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

Queued to plugins/next, thanks.

> ---
> v3 -> v4: Added a missing ``static`` that was causing a compilation=20
>           error. Otherwise, everything else is left in place.
>  tests/plugin/syscall.c | 98 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 93 insertions(+), 5 deletions(-)
>
> diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
> index 53ee2ab6c4..6dd71092e1 100644
> --- a/tests/plugin/syscall.c
> +++ b/tests/plugin/syscall.c
> @@ -16,32 +16,120 @@
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>=20=20
> +typedef struct {
> +    int64_t num;
> +    int64_t calls;
> +    int64_t errors;
> +} SyscallStats;
> +
> +static GMutex lock;
> +static GHashTable *statistics;
> +
> +static SyscallStats *get_or_create_entry(int64_t num)
> +{
> +    SyscallStats *entry =3D
> +        (SyscallStats *) g_hash_table_lookup(statistics, GINT_TO_POINTER=
(num));
> +
> +    if (!entry) {
> +        entry =3D g_new0(SyscallStats, 1);
> +        entry->num =3D num;
> +        g_hash_table_insert(statistics, GINT_TO_POINTER(num), (gpointer)=
 entry);
> +    }
> +
> +    return entry;
> +}
> +
>  static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
>                           int64_t num, uint64_t a1, uint64_t a2,
>                           uint64_t a3, uint64_t a4, uint64_t a5,
>                           uint64_t a6, uint64_t a7, uint64_t a8)
>  {
> -    g_autofree gchar *out =3D g_strdup_printf("syscall #%" PRIi64 "\n", =
num);
> -    qemu_plugin_outs(out);
> +    if (statistics) {
> +        SyscallStats *entry;
> +        g_mutex_lock(&lock);
> +        entry =3D get_or_create_entry(num);
> +        entry->calls++;
> +        g_mutex_unlock(&lock);
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
> +    if (statistics) {
> +        SyscallStats *entry;
> +
> +        g_mutex_lock(&lock);
> +        /* Should always return an existent entry. */
> +        entry =3D get_or_create_entry(num);
> +        if (ret < 0) {
> +            entry->errors++;
> +        }
> +        g_mutex_unlock(&lock);
> +    } else {
> +        g_autofree gchar *out;
> +        out =3D g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRI=
i64 "\n",
> +                num, ret);
> +        qemu_plugin_outs(out);
> +    }
> +}
> +
> +static void print_entry(gpointer val, gpointer user_data)
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


--=20
Alex Benn=C3=A9e

