Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA0533F3A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:31:05 +0200 (CEST)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nts2S-00042u-D6
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntrlr-0007oP-5r
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntrln-0000Lu-8D
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653488027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUEVORGvVXH9qSd5SUaOaaXW6WtuoJ8JpFqQtx0E2Q0=;
 b=BCeBLva6PkyWwFBLcOEzEhrsM36MiRVKphp2s4kYQkxE62QWtIfDknr+YecxIKnhb6v0H7
 YrCScBudkksXcPzjecP36FTjJ0CjuLqcR90xc5/Zqu93u0eyl/qm8Wu4QZg+wrwjg+kjnp
 FyCp3/lp/aiIksDtYkFX6dl4acHRp8M=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-mBCbeuQaN_6gxGJFyqqbvw-1; Wed, 25 May 2022 10:13:45 -0400
X-MC-Unique: mBCbeuQaN_6gxGJFyqqbvw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2dc7bdd666fso178753697b3.7
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 07:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUEVORGvVXH9qSd5SUaOaaXW6WtuoJ8JpFqQtx0E2Q0=;
 b=o+MflmnDkRO9CJkqllgbGwo/+wGLo9udfj2ZXmcZvA7lJlBJEQS6TaLfea8s0kclJN
 FRB1uRU/fGJvaY80ZLh570tmKKSmYwZMKgM5QwHJaEgruYQYvZuCqWdK73GTENFxitfL
 7TLEZtZW1/u99m3TR07budIAqinebEmQ5M+PeuCilMKwWAziX6ONa96/sYWSVJmJFjj5
 Ru1Wx53FkeoHZSM3gO/vT/6QpQWkED02+5R9Xn6JId3z8eVlOvkv4/nngk1uLzMPiRdm
 LkJzsJ/PAOs0ULhjn69pnlEqkJSvcyHHPWeTs6Kw4zW3E0wNztz2bjco0sgmbpDvXExo
 7rDQ==
X-Gm-Message-State: AOAM532nrX/DtnOK/9RfBcSND2IyzDSU94L/C3c2h2ap2ZQYKk9wdS+6
 j8+O0UVOoeh2ZXNwZXA6h2fJJrq/FRike7t9F1cVH9wfRq+wrR6F+y3KxXuORXkBgOLKyoz2DwV
 XXbOUyg9sbodGFKMnykOiXNkNtqEjFMo=
X-Received: by 2002:a25:7e84:0:b0:650:10e0:87bd with SMTP id
 z126-20020a257e84000000b0065010e087bdmr11444781ybc.257.1653488024533; 
 Wed, 25 May 2022 07:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6b4/lP80WMBSHM2ohbe9sw+4KLrR70G6xP4IHQDVrdKzij06ZiPaxdv73ow+vFfR8InmNirulXjPxV4+V1dg=
X-Received: by 2002:a25:7e84:0:b0:650:10e0:87bd with SMTP id
 z126-20020a257e84000000b0065010e087bdmr11444761ybc.257.1653488024274; Wed, 25
 May 2022 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
 <20220524103453.162665-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220524103453.162665-16-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 25 May 2022 17:13:33 +0300
Message-ID: <CAPMcbCpTjjOQtrc6=TFzaBcTQQry7z5N+wP2br8FmDrtjWXrmQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] test/qga: use g_auto wherever sensible
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000053db5605dfd6aefe"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000053db5605dfd6aefe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 1:35 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-qga.c | 121 +++++++++++++++---------------------------
>  1 file changed, 43 insertions(+), 78 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index ab0b12a2dd..530317044b 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -52,7 +52,10 @@ fixture_setup(TestFixture *fixture, gconstpointer data=
,
> gchar **envp)
>  {
>      const gchar *extra_arg =3D data;
>      GError *error =3D NULL;
> -    gchar *cwd, *path, *cmd, **argv =3D NULL;
> +    g_autofree char *cwd =3D NULL;
> +    g_autofree char *path =3D NULL;
> +    g_autofree char *cmd =3D NULL;
> +    g_auto(GStrv) argv =3D NULL;
>
>      fixture->loop =3D g_main_loop_new(NULL, FALSE);
>
> @@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer
> data, gchar **envp)
>
>      fixture->fd =3D connect_qga(path);
>      g_assert_cmpint(fixture->fd, !=3D, -1);
> -
> -    g_strfreev(argv);
> -    g_free(cmd);
> -    g_free(cwd);
> -    g_free(path);
>  }
>
>  static void
>  fixture_tear_down(TestFixture *fixture, gconstpointer data)
>  {
> -    gchar *tmp;
> +    g_autofree char *tmp =3D NULL;
>
>      kill(fixture->pid, SIGTERM);
>
> @@ -107,7 +105,6 @@ fixture_tear_down(TestFixture *fixture, gconstpointer
> data)
>
>      tmp =3D g_build_filename(fixture->test_dir, "sock", NULL);
>      g_unlink(tmp);
> -    g_free(tmp);
>
>      g_rmdir(fixture->test_dir);
>      g_free(fixture->test_dir);
> @@ -122,7 +119,7 @@ static void qmp_assertion_message_error(const char
>  *domain,
>                                          QDict          *dict)
>  {
>      const char *class, *desc;
> -    char *s;
> +    g_autofree char *s =3D NULL;
>      QDict *error;
>
>      error =3D qdict_get_qdict(dict, "error");
> @@ -131,7 +128,6 @@ static void qmp_assertion_message_error(const char
>  *domain,
>
>      s =3D g_strdup_printf("assertion failed %s: %s %s", expr, class, des=
c);
>      g_assertion_message(domain, file, line, func, s);
> -    g_free(s);
>  }
>
>  #define qmp_assert_no_error(err) do {                                   =
\
> @@ -146,7 +142,7 @@ static void test_qga_sync_delimited(gconstpointer fix=
)
>      const TestFixture *fixture =3D fix;
>      guint32 v, r =3D g_test_rand_int();
>      unsigned char c;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>
>      qmp_fd_send_raw(fixture->fd, "\xff");
>      qmp_fd_send(fixture->fd,
> @@ -180,15 +176,13 @@ static void test_qga_sync_delimited(gconstpointer
> fix)
>
>      v =3D qdict_get_int(ret, "return");
>      g_assert_cmpint(r, =3D=3D, v);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_sync(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
>      guint32 v, r =3D g_test_rand_int();
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>
>      /*
>       * TODO guest-sync is inherently limited: we cannot distinguish
> @@ -210,33 +204,27 @@ static void test_qga_sync(gconstpointer fix)
>
>      v =3D qdict_get_int(ret, "return");
>      g_assert_cmpint(r, =3D=3D, v);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_ping(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
>      g_assert_nonnull(ret);
>      qmp_assert_no_error(ret);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_id(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping', 'id': 1}");
>      g_assert_nonnull(ret);
>      qmp_assert_no_error(ret);
>      g_assert_cmpint(qdict_get_int(ret, "id"), =3D=3D, 1);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_invalid_oob(gconstpointer fix)
> @@ -253,7 +241,8 @@ static void test_qga_invalid_oob(gconstpointer fix)
>  static void test_qga_invalid_args(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *error;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *error;
>

Why the error pointer should not be freed?
Just a question, the patch looks good anyway.


>      const gchar *class, *desc;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping', "
> @@ -266,14 +255,13 @@ static void test_qga_invalid_args(gconstpointer fix=
)
>
>      g_assert_cmpstr(class, =3D=3D, "GenericError");
>      g_assert_cmpstr(desc, =3D=3D, "Parameter 'foo' is unexpected");
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_invalid_cmd(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *error;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *error;
>      const gchar *class, *desc;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-invalid-cmd'}");
> @@ -285,14 +273,13 @@ static void test_qga_invalid_cmd(gconstpointer fix)
>
>      g_assert_cmpstr(class, =3D=3D, "CommandNotFound");
>      g_assert_cmpint(strlen(desc), >, 0);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_info(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *val;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
>      const gchar *version;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-info'}");
> @@ -302,14 +289,12 @@ static void test_qga_info(gconstpointer fix)
>      val =3D qdict_get_qdict(ret, "return");
>      version =3D qdict_get_try_str(val, "version");
>      g_assert_cmpstr(version, =3D=3D, QEMU_VERSION);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_get_vcpus(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      QList *list;
>      const QListEntry *entry;
>
> @@ -322,14 +307,12 @@ static void test_qga_get_vcpus(gconstpointer fix)
>      entry =3D qlist_first(list);
>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "online"));
>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "logical-id")=
);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_get_fsinfo(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      QList *list;
>      const QListEntry *entry;
>
> @@ -346,14 +329,13 @@ static void test_qga_get_fsinfo(gconstpointer fix)
>          g_assert(qdict_haskey(qobject_to(QDict, entry->value), "type"));
>          g_assert(qdict_haskey(qobject_to(QDict, entry->value), "disk"));
>      }
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_get_memory_block_info(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *val;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
>      int64_t size;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute':
> 'guest-get-memory-block-info'}");
> @@ -366,14 +348,12 @@ static void
> test_qga_get_memory_block_info(gconstpointer fix)
>          size =3D qdict_get_int(val, "size");
>          g_assert_cmpint(size, >, 0);
>      }
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_get_memory_blocks(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      QList *list;
>      const QListEntry *entry;
>
> @@ -391,14 +371,12 @@ static void test_qga_get_memory_blocks(gconstpointe=
r
> fix)
>              g_assert(qdict_haskey(qobject_to(QDict, entry->value),
> "online"));
>          }
>      }
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_network_get_interfaces(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      QList *list;
>      const QListEntry *entry;
>
> @@ -410,8 +388,6 @@ static void
> test_qga_network_get_interfaces(gconstpointer fix)
>      list =3D qdict_get_qlist(ret, "return");
>      entry =3D qlist_first(list);
>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "name"));
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_file_ops(gconstpointer fix)
> @@ -642,7 +618,7 @@ static void test_qga_file_write_read(gconstpointer fi=
x)
>  static void test_qga_get_time(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      int64_t time;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-time'}");
> @@ -651,8 +627,6 @@ static void test_qga_get_time(gconstpointer fix)
>
>      time =3D qdict_get_int(ret, "return");
>      g_assert_cmpint(time, >, 0);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_blacklist(gconstpointer data)
> @@ -693,18 +667,22 @@ static void test_qga_blacklist(gconstpointer data)
>  static void test_qga_config(gconstpointer data)
>  {
>      GError *error =3D NULL;
> -    char *cwd, *cmd, *out, *err, *str, **strv, **argv =3D NULL;
> +    g_autofree char *out =3D NULL;
> +    g_autofree char *err =3D NULL;
> +    g_autofree char *cwd =3D NULL;
> +    g_autofree char *cmd =3D NULL;
> +    g_auto(GStrv) argv =3D NULL;
> +    g_auto(GStrv) strv =3D NULL;
> +    g_autoptr(GKeyFile) kf =3D NULL;
> +    char *str;
>      char *env[2];
>      int status;
>      gsize n;
> -    GKeyFile *kf;
>
>      cwd =3D g_get_current_dir();
>      cmd =3D g_strdup_printf("%s%cqga%cqemu-ga -D",
>                            cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
> -    g_free(cwd);
>      g_shell_parse_argv(cmd, NULL, &argv, &error);
> -    g_free(cmd);
>      g_assert_no_error(error);
>
>      env[0] =3D g_strdup_printf("QGA_CONF=3Dtests%cdata%ctest-qga-config"=
,
> @@ -712,7 +690,6 @@ static void test_qga_config(gconstpointer data)
>      env[1] =3D NULL;
>      g_spawn_sync(NULL, argv, env, 0,
>                   NULL, NULL, &out, &err, &status, &error);
> -    g_strfreev(argv);
>
>      g_assert_no_error(error);
>      g_assert_cmpstr(err, =3D=3D, "");
> @@ -759,18 +736,14 @@ static void test_qga_config(gconstpointer data)
>      g_assert_true(g_strv_contains((const char * const *)strv,
>                                    "guest-get-time"));
>      g_assert_no_error(error);
> -    g_strfreev(strv);
>
> -    g_free(out);
> -    g_free(err);
>      g_free(env[0]);
> -    g_key_file_free(kf);
>  }
>
>  static void test_qga_fsfreeze_status(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      const gchar *status;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-fsfreeze-status'}");
> @@ -779,16 +752,15 @@ static void test_qga_fsfreeze_status(gconstpointer
> fix)
>
>      status =3D qdict_get_try_str(ret, "return");
>      g_assert_cmpstr(status, =3D=3D, "thawed");
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_exec(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *val;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
>      const gchar *out;
> -    guchar *decoded;
> +    g_autofree guchar *decoded =3D NULL;
>      int64_t pid, now, exitcode;
>      gsize len;
>      bool exited;
> @@ -827,14 +799,13 @@ static void test_qga_guest_exec(gconstpointer fix)
>      decoded =3D g_base64_decode(out, &len);
>      g_assert_cmpint(len, =3D=3D, 12);
>      g_assert_cmpstr((char *)decoded, =3D=3D, "\" test_str \"");
> -    g_free(decoded);
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_exec_invalid(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *error;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *error;
>      const gchar *class, *desc;
>
>      /* invalid command */
> @@ -859,13 +830,13 @@ static void
> test_qga_guest_exec_invalid(gconstpointer fix)
>      desc =3D qdict_get_str(error, "desc");
>      g_assert_cmpstr(class, =3D=3D, "GenericError");
>      g_assert_cmpint(strlen(desc), >, 0);
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_get_host_name(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *val;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-host-name'}");
>      g_assert_nonnull(ret);
> @@ -873,14 +844,13 @@ static void
> test_qga_guest_get_host_name(gconstpointer fix)
>
>      val =3D qdict_get_qdict(ret, "return");
>      g_assert(qdict_haskey(val, "host-name"));
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_get_timezone(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret, *val;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-timezone'}");
>      g_assert_nonnull(ret);
> @@ -889,14 +859,12 @@ static void
> test_qga_guest_get_timezone(gconstpointer fix)
>      /* Make sure there's at least offset */
>      val =3D qdict_get_qdict(ret, "return");
>      g_assert(qdict_haskey(val, "offset"));
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_get_users(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> -    QDict *ret;
> +    g_autoptr(QDict) ret =3D NULL;
>      QList *val;
>
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-users'}");
> @@ -906,15 +874,13 @@ static void test_qga_guest_get_users(gconstpointer
> fix)
>      /* There is not much to test here */
>      val =3D qdict_get_qlist(ret, "return");
>      g_assert_nonnull(val);
> -
> -    qobject_unref(ret);
>  }
>
>  static void test_qga_guest_get_osinfo(gconstpointer data)
>  {
>      TestFixture fixture;
>      const gchar *str;
> -    QDict *ret =3D NULL;
> +    g_autoptr(QDict) ret =3D NULL;
>      char *env[2];
>      QDict *val;
>
> @@ -958,7 +924,6 @@ static void test_qga_guest_get_osinfo(gconstpointer
> data)
>      g_assert_nonnull(str);
>      g_assert_cmpstr(str, =3D=3D, "unit-test");
>
> -    qobject_unref(ret);
>      g_free(env[0]);
>      fixture_tear_down(&fixture, NULL);
>  }
> --
> 2.36.1
>
>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

--00000000000053db5605dfd6aefe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><br></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, May 24, 2022 at 1:35 PM &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-qga.c | 121 +++++++++++++++--------------------------=
-<br>
=C2=A01 file changed, 43 insertions(+), 78 deletions(-)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index ab0b12a2dd..530317044b 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -52,7 +52,10 @@ fixture_setup(TestFixture *fixture, gconstpointer data, =
gchar **envp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const gchar *extra_arg =3D data;<br>
=C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;<br>
-=C2=A0 =C2=A0 gchar *cwd, *path, *cmd, **argv =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *cwd =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *path =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *cmd =3D NULL;<br>
+=C2=A0 =C2=A0 g_auto(GStrv) argv =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;loop =3D g_main_loop_new(NULL, FALSE);<br>
<br>
@@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer data,=
 gchar **envp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;fd =3D connect_qga(path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(fixture-&gt;fd, !=3D, -1);<br>
-<br>
-=C2=A0 =C2=A0 g_strfreev(argv);<br>
-=C2=A0 =C2=A0 g_free(cmd);<br>
-=C2=A0 =C2=A0 g_free(cwd);<br>
-=C2=A0 =C2=A0 g_free(path);<br>
=C2=A0}<br>
<br>
=C2=A0static void<br>
=C2=A0fixture_tear_down(TestFixture *fixture, gconstpointer data)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 gchar *tmp;<br>
+=C2=A0 =C2=A0 g_autofree char *tmp =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0kill(fixture-&gt;pid, SIGTERM);<br>
<br>
@@ -107,7 +105,6 @@ fixture_tear_down(TestFixture *fixture, gconstpointer d=
ata)<br>
<br>
=C2=A0 =C2=A0 =C2=A0tmp =3D g_build_filename(fixture-&gt;test_dir, &quot;so=
ck&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_unlink(tmp);<br>
-=C2=A0 =C2=A0 g_free(tmp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_rmdir(fixture-&gt;test_dir);<br>
=C2=A0 =C2=A0 =C2=A0g_free(fixture-&gt;test_dir);<br>
@@ -122,7 +119,7 @@ static void qmp_assertion_message_error(const char=C2=
=A0 =C2=A0 =C2=A0*domain,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QD=
ict=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *dict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *class, *desc;<br>
-=C2=A0 =C2=A0 char *s;<br>
+=C2=A0 =C2=A0 g_autofree char *s =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QDict *error;<br>
<br>
=C2=A0 =C2=A0 =C2=A0error =3D qdict_get_qdict(dict, &quot;error&quot;);<br>
@@ -131,7 +128,6 @@ static void qmp_assertion_message_error(const char=C2=
=A0 =C2=A0 =C2=A0*domain,<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_strdup_printf(&quot;assertion failed %s: %s %s&=
quot;, expr, class, desc);<br>
=C2=A0 =C2=A0 =C2=A0g_assertion_message(domain, file, line, func, s);<br>
-=C2=A0 =C2=A0 g_free(s);<br>
=C2=A0}<br>
<br>
=C2=A0#define qmp_assert_no_error(err) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
@@ -146,7 +142,7 @@ static void test_qga_sync_delimited(gconstpointer fix)<=
br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
=C2=A0 =C2=A0 =C2=A0guint32 v, r =3D g_test_rand_int();<br>
=C2=A0 =C2=A0 =C2=A0unsigned char c;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qmp_fd_send_raw(fixture-&gt;fd, &quot;\xff&quot;);<br>
=C2=A0 =C2=A0 =C2=A0qmp_fd_send(fixture-&gt;fd,<br>
@@ -180,15 +176,13 @@ static void test_qga_sync_delimited(gconstpointer fix=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0v =3D qdict_get_int(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(r, =3D=3D, v);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_sync(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
=C2=A0 =C2=A0 =C2=A0guint32 v, r =3D g_test_rand_int();<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * TODO guest-sync is inherently limited: we cannot dis=
tinguish<br>
@@ -210,33 +204,27 @@ static void test_qga_sync(gconstpointer fix)<br>
<br>
=C2=A0 =C2=A0 =C2=A0v =3D qdict_get_int(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(r, =3D=3D, v);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_ping(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-ping&#39;}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(ret);<br>
=C2=A0 =C2=A0 =C2=A0qmp_assert_no_error(ret);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_id(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-ping&#39;, &#39;id&#39;: 1}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(ret);<br>
=C2=A0 =C2=A0 =C2=A0qmp_assert_no_error(ret);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qdict_get_int(ret, &quot;id&quot;), =3D=
=3D, 1);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_invalid_oob(gconstpointer fix)<br>
@@ -253,7 +241,8 @@ static void test_qga_invalid_oob(gconstpointer fix)<br>
=C2=A0static void test_qga_invalid_args(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *error;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *error;<br></blockquote><div><br></div><div>Why the er=
ror pointer should not be freed? <br></div><div>Just a question, the patch =
looks good anyway.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
=C2=A0 =C2=A0 =C2=A0const gchar *class, *desc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-ping&#39;, &quot;<br>
@@ -266,14 +255,13 @@ static void test_qga_invalid_args(gconstpointer fix)<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(class, =3D=3D, &quot;GenericError&quot;=
);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(desc, =3D=3D, &quot;Parameter &#39;foo&=
#39; is unexpected&quot;);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_invalid_cmd(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *error;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *error;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *class, *desc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-invalid-cmd&#39;}&quot;);<br>
@@ -285,14 +273,13 @@ static void test_qga_invalid_cmd(gconstpointer fix)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(class, =3D=3D, &quot;CommandNotFound&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(strlen(desc), &gt;, 0);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_info(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *val;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *version;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-info&#39;}&quot;);<br>
@@ -302,14 +289,12 @@ static void test_qga_info(gconstpointer fix)<br>
=C2=A0 =C2=A0 =C2=A0val =3D qdict_get_qdict(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0version =3D qdict_get_try_str(val, &quot;version&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(version, =3D=3D, QEMU_VERSION);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_get_vcpus(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QList *list;<br>
=C2=A0 =C2=A0 =C2=A0const QListEntry *entry;<br>
<br>
@@ -322,14 +307,12 @@ static void test_qga_get_vcpus(gconstpointer fix)<br>
=C2=A0 =C2=A0 =C2=A0entry =3D qlist_first(list);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobject_to(QDict, entry-&gt;value=
), &quot;online&quot;));<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobject_to(QDict, entry-&gt;value=
), &quot;logical-id&quot;));<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_get_fsinfo(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QList *list;<br>
=C2=A0 =C2=A0 =C2=A0const QListEntry *entry;<br>
<br>
@@ -346,14 +329,13 @@ static void test_qga_get_fsinfo(gconstpointer fix)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobject_to(QDict, e=
ntry-&gt;value), &quot;type&quot;));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobject_to(QDict, e=
ntry-&gt;value), &quot;disk&quot;));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_get_memory_block_info(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *val;<br>
=C2=A0 =C2=A0 =C2=A0int64_t size;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-get-memory-block-info&#39;}&quot;);<br>
@@ -366,14 +348,12 @@ static void test_qga_get_memory_block_info(gconstpoin=
ter fix)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D qdict_get_int(val, &quot;size&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpint(size, &gt;, 0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_get_memory_blocks(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QList *list;<br>
=C2=A0 =C2=A0 =C2=A0const QListEntry *entry;<br>
<br>
@@ -391,14 +371,12 @@ static void test_qga_get_memory_blocks(gconstpointer =
fix)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobje=
ct_to(QDict, entry-&gt;value), &quot;online&quot;));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_network_get_interfaces(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QList *list;<br>
=C2=A0 =C2=A0 =C2=A0const QListEntry *entry;<br>
<br>
@@ -410,8 +388,6 @@ static void test_qga_network_get_interfaces(gconstpoint=
er fix)<br>
=C2=A0 =C2=A0 =C2=A0list =3D qdict_get_qlist(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0entry =3D qlist_first(list);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(qobject_to(QDict, entry-&gt;value=
), &quot;name&quot;));<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_file_ops(gconstpointer fix)<br>
@@ -642,7 +618,7 @@ static void test_qga_file_write_read(gconstpointer fix)=
<br>
=C2=A0static void test_qga_get_time(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int64_t time;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-get-time&#39;}&quot;);<br>
@@ -651,8 +627,6 @@ static void test_qga_get_time(gconstpointer fix)<br>
<br>
=C2=A0 =C2=A0 =C2=A0time =3D qdict_get_int(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(time, &gt;, 0);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_blacklist(gconstpointer data)<br>
@@ -693,18 +667,22 @@ static void test_qga_blacklist(gconstpointer data)<br=
>
=C2=A0static void test_qga_config(gconstpointer data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;<br>
-=C2=A0 =C2=A0 char *cwd, *cmd, *out, *err, *str, **strv, **argv =3D NULL;<=
br>
+=C2=A0 =C2=A0 g_autofree char *out =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *err =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *cwd =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *cmd =3D NULL;<br>
+=C2=A0 =C2=A0 g_auto(GStrv) argv =3D NULL;<br>
+=C2=A0 =C2=A0 g_auto(GStrv) strv =3D NULL;<br>
+=C2=A0 =C2=A0 g_autoptr(GKeyFile) kf =3D NULL;<br>
+=C2=A0 =C2=A0 char *str;<br>
=C2=A0 =C2=A0 =C2=A0char *env[2];<br>
=C2=A0 =C2=A0 =C2=A0int status;<br>
=C2=A0 =C2=A0 =C2=A0gsize n;<br>
-=C2=A0 =C2=A0 GKeyFile *kf;<br>
<br>
=C2=A0 =C2=A0 =C2=A0cwd =3D g_get_current_dir();<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D g_strdup_printf(&quot;%s%cqga%cqemu-ga -D&quot;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR);<br>
-=C2=A0 =C2=A0 g_free(cwd);<br>
=C2=A0 =C2=A0 =C2=A0g_shell_parse_argv(cmd, NULL, &amp;argv, &amp;error);<b=
r>
-=C2=A0 =C2=A0 g_free(cmd);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_no_error(error);<br>
<br>
=C2=A0 =C2=A0 =C2=A0env[0] =3D g_strdup_printf(&quot;QGA_CONF=3Dtests%cdata=
%ctest-qga-config&quot;,<br>
@@ -712,7 +690,6 @@ static void test_qga_config(gconstpointer data)<br>
=C2=A0 =C2=A0 =C2=A0env[1] =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0g_spawn_sync(NULL, argv, env, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, =
&amp;out, &amp;err, &amp;status, &amp;error);<br>
-=C2=A0 =C2=A0 g_strfreev(argv);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert_no_error(error);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(err, =3D=3D, &quot;&quot;);<br>
@@ -759,18 +736,14 @@ static void test_qga_config(gconstpointer data)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(g_strv_contains((const char * const *)str=
v,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;guest-get-time&qu=
ot;));<br>
=C2=A0 =C2=A0 =C2=A0g_assert_no_error(error);<br>
-=C2=A0 =C2=A0 g_strfreev(strv);<br>
<br>
-=C2=A0 =C2=A0 g_free(out);<br>
-=C2=A0 =C2=A0 g_free(err);<br>
=C2=A0 =C2=A0 =C2=A0g_free(env[0]);<br>
-=C2=A0 =C2=A0 g_key_file_free(kf);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_fsfreeze_status(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *status;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-fsfreeze-status&#39;}&quot;);<br>
@@ -779,16 +752,15 @@ static void test_qga_fsfreeze_status(gconstpointer fi=
x)<br>
<br>
=C2=A0 =C2=A0 =C2=A0status =3D qdict_get_try_str(ret, &quot;return&quot;);<=
br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(status, =3D=3D, &quot;thawed&quot;);<br=
>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_exec(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *val;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *out;<br>
-=C2=A0 =C2=A0 guchar *decoded;<br>
+=C2=A0 =C2=A0 g_autofree guchar *decoded =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int64_t pid, now, exitcode;<br>
=C2=A0 =C2=A0 =C2=A0gsize len;<br>
=C2=A0 =C2=A0 =C2=A0bool exited;<br>
@@ -827,14 +799,13 @@ static void test_qga_guest_exec(gconstpointer fix)<br=
>
=C2=A0 =C2=A0 =C2=A0decoded =3D g_base64_decode(out, &amp;len);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(len, =3D=3D, 12);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr((char *)decoded, =3D=3D, &quot;\&quot; =
test_str \&quot;&quot;);<br>
-=C2=A0 =C2=A0 g_free(decoded);<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_exec_invalid(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *error;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *error;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *class, *desc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* invalid command */<br>
@@ -859,13 +830,13 @@ static void test_qga_guest_exec_invalid(gconstpointer=
 fix)<br>
=C2=A0 =C2=A0 =C2=A0desc =3D qdict_get_str(error, &quot;desc&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(class, =3D=3D, &quot;GenericError&quot;=
);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(strlen(desc), &gt;, 0);<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_get_host_name(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-get-host-name&#39;}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(ret);<br>
@@ -873,14 +844,13 @@ static void test_qga_guest_get_host_name(gconstpointe=
r fix)<br>
<br>
=C2=A0 =C2=A0 =C2=A0val =3D qdict_get_qdict(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(val, &quot;host-name&quot;));<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_get_timezone(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+=C2=A0 =C2=A0 QDict *val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-get-timezone&#39;}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(ret);<br>
@@ -889,14 +859,12 @@ static void test_qga_guest_get_timezone(gconstpointer=
 fix)<br>
=C2=A0 =C2=A0 =C2=A0/* Make sure there&#39;s at least offset */<br>
=C2=A0 =C2=A0 =C2=A0val =3D qdict_get_qdict(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_haskey(val, &quot;offset&quot;));<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_get_users(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
-=C2=A0 =C2=A0 QDict *ret;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QList *val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;=
: &#39;guest-get-users&#39;}&quot;);<br>
@@ -906,15 +874,13 @@ static void test_qga_guest_get_users(gconstpointer fi=
x)<br>
=C2=A0 =C2=A0 =C2=A0/* There is not much to test here */<br>
=C2=A0 =C2=A0 =C2=A0val =3D qdict_get_qlist(ret, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(val);<br>
-<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0}<br>
<br>
=C2=A0static void test_qga_guest_get_osinfo(gconstpointer data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestFixture fixture;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *str;<br>
-=C2=A0 =C2=A0 QDict *ret =3D NULL;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0char *env[2];<br>
=C2=A0 =C2=A0 =C2=A0QDict *val;<br>
<br>
@@ -958,7 +924,6 @@ static void test_qga_guest_get_osinfo(gconstpointer dat=
a)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(str);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(str, =3D=3D, &quot;unit-test&quot;);<br=
>
<br>
-=C2=A0 =C2=A0 qobject_unref(ret);<br>
=C2=A0 =C2=A0 =C2=A0g_free(env[0]);<br>
=C2=A0 =C2=A0 =C2=A0fixture_tear_down(&amp;fixture, NULL);<br>
=C2=A0}<br>
-- <br>
2.36.1<br>
<br></blockquote><div><br></div><div>Reviewed-by: Konstantin Kostiuk &lt;<a=
 href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; <br></div>=
</div></div>

--00000000000053db5605dfd6aefe--


