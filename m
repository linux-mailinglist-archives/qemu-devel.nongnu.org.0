Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A02533EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:21:01 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrsi-0004xS-8q
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntrpj-0003WN-Bu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntrph-0001BQ-1i
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653488272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kgYdASM7nLALAvNPqDU1it9sVDk9e7GWqrYXhi8+fM=;
 b=AWAUn2LhQHfICgnObkkOkUg6RMoppYStNvWFP2nMfk82R3VQ+Mx+OkFrFwcAeGRvnmVpOj
 lnlBUiCYT3lU3I4J1pYTzgL1bZNNfXkk6FkgVMgaqbhCx06U8NixW6AIvnt7YwWQD/QY2a
 rwWNHQ8vuam4T3xRHCVoE/j0CPoAV+4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-EwKIcZNzM664-KVRwGWhmw-1; Wed, 25 May 2022 10:17:50 -0400
X-MC-Unique: EwKIcZNzM664-KVRwGWhmw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f4e17a5809so179443257b3.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 07:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0kgYdASM7nLALAvNPqDU1it9sVDk9e7GWqrYXhi8+fM=;
 b=PsXoExzYbmsjh+EJnCcPRyRDjYkUAtAolwGcZWNmGFY+W8QqW3Q/XBdw5ff+Z3Ok8m
 xtU95m5bB63nJItqcbN9NatwwFvvwRzmPjIPue7IgtzLnCkjw5yyJWc7T5F4RBTYiZEt
 pkRPfdMf1u+74PRCKd4iX2gFS0ihOaTjil8ZQEcB00SlFLUMYWZJm/x7FhgB5rOfTkSC
 Dg08VR7CNjSh85FNiLzdAZ8NSb0h74HggjZZA+f+IGmnZCP9GZa+NVZZgnvczkulZo/L
 8ZDfqjoq/6Ghbq63wOtIGE2/fcqfTQZ6au5OKu5ce8FBFyBWEzM5cnizySqybQKdVUKY
 wTjQ==
X-Gm-Message-State: AOAM531a1SA70bAvl+uKtwPEIK15w7Q5yRGtMr+nzgyXT5sDIRL9nWOo
 6Uw3tBDkfIMjl8sZYW0deM9h3tLQE2yHY2ucR+Ba3UtBKp2bN9+ZB2iTqbHu99R4T4Q1Ls7x8km
 muuL4Y+j5j/Lp+/ltYImuj74ZIBk22Uo=
X-Received: by 2002:a25:ce0e:0:b0:655:8329:9be0 with SMTP id
 x14-20020a25ce0e000000b0065583299be0mr5656588ybe.387.1653488269679; 
 Wed, 25 May 2022 07:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaYFANbbz/b2dFp6OH4txNgYKNqJFf7R3fRBRYhSv5KviJ0NSum/Ndbe2cBh3gIBxLqeDuzlYnw7ICYUT7cQM=
X-Received: by 2002:a25:ce0e:0:b0:655:8329:9be0 with SMTP id
 x14-20020a25ce0e000000b0065583299be0mr5656560ybe.387.1653488269301; Wed, 25
 May 2022 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
 <20220524103453.162665-16-marcandre.lureau@redhat.com>
 <CAPMcbCpTjjOQtrc6=TFzaBcTQQry7z5N+wP2br8FmDrtjWXrmQ@mail.gmail.com>
In-Reply-To: <CAPMcbCpTjjOQtrc6=TFzaBcTQQry7z5N+wP2br8FmDrtjWXrmQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 25 May 2022 16:17:38 +0200
Message-ID: <CAMxuvazDBJEEnVG8NLGJw0whqA_o_-fZj33qU3DUgtdABALDzw@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] test/qga: use g_auto wherever sensible
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 25, 2022 at 4:13 PM Konstantin Kostiuk <kkostiuk@redhat.com> wr=
ote:
>
>
>
>
>
> On Tue, May 24, 2022 at 1:35 PM <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  tests/unit/test-qga.c | 121 +++++++++++++++---------------------------
>>  1 file changed, 43 insertions(+), 78 deletions(-)
>>
>> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
>> index ab0b12a2dd..530317044b 100644
>> --- a/tests/unit/test-qga.c
>> +++ b/tests/unit/test-qga.c
>> @@ -52,7 +52,10 @@ fixture_setup(TestFixture *fixture, gconstpointer dat=
a, gchar **envp)
>>  {
>>      const gchar *extra_arg =3D data;
>>      GError *error =3D NULL;
>> -    gchar *cwd, *path, *cmd, **argv =3D NULL;
>> +    g_autofree char *cwd =3D NULL;
>> +    g_autofree char *path =3D NULL;
>> +    g_autofree char *cmd =3D NULL;
>> +    g_auto(GStrv) argv =3D NULL;
>>
>>      fixture->loop =3D g_main_loop_new(NULL, FALSE);
>>
>> @@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer da=
ta, gchar **envp)
>>
>>      fixture->fd =3D connect_qga(path);
>>      g_assert_cmpint(fixture->fd, !=3D, -1);
>> -
>> -    g_strfreev(argv);
>> -    g_free(cmd);
>> -    g_free(cwd);
>> -    g_free(path);
>>  }
>>
>>  static void
>>  fixture_tear_down(TestFixture *fixture, gconstpointer data)
>>  {
>> -    gchar *tmp;
>> +    g_autofree char *tmp =3D NULL;
>>
>>      kill(fixture->pid, SIGTERM);
>>
>> @@ -107,7 +105,6 @@ fixture_tear_down(TestFixture *fixture, gconstpointe=
r data)
>>
>>      tmp =3D g_build_filename(fixture->test_dir, "sock", NULL);
>>      g_unlink(tmp);
>> -    g_free(tmp);
>>
>>      g_rmdir(fixture->test_dir);
>>      g_free(fixture->test_dir);
>> @@ -122,7 +119,7 @@ static void qmp_assertion_message_error(const char  =
   *domain,
>>                                          QDict          *dict)
>>  {
>>      const char *class, *desc;
>> -    char *s;
>> +    g_autofree char *s =3D NULL;
>>      QDict *error;
>>
>>      error =3D qdict_get_qdict(dict, "error");
>> @@ -131,7 +128,6 @@ static void qmp_assertion_message_error(const char  =
   *domain,
>>
>>      s =3D g_strdup_printf("assertion failed %s: %s %s", expr, class, de=
sc);
>>      g_assertion_message(domain, file, line, func, s);
>> -    g_free(s);
>>  }
>>
>>  #define qmp_assert_no_error(err) do {                                  =
 \
>> @@ -146,7 +142,7 @@ static void test_qga_sync_delimited(gconstpointer fi=
x)
>>      const TestFixture *fixture =3D fix;
>>      guint32 v, r =3D g_test_rand_int();
>>      unsigned char c;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>
>>      qmp_fd_send_raw(fixture->fd, "\xff");
>>      qmp_fd_send(fixture->fd,
>> @@ -180,15 +176,13 @@ static void test_qga_sync_delimited(gconstpointer =
fix)
>>
>>      v =3D qdict_get_int(ret, "return");
>>      g_assert_cmpint(r, =3D=3D, v);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_sync(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>>      guint32 v, r =3D g_test_rand_int();
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>
>>      /*
>>       * TODO guest-sync is inherently limited: we cannot distinguish
>> @@ -210,33 +204,27 @@ static void test_qga_sync(gconstpointer fix)
>>
>>      v =3D qdict_get_int(ret, "return");
>>      g_assert_cmpint(r, =3D=3D, v);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_ping(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
>>      g_assert_nonnull(ret);
>>      qmp_assert_no_error(ret);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_id(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping', 'id': 1}");
>>      g_assert_nonnull(ret);
>>      qmp_assert_no_error(ret);
>>      g_assert_cmpint(qdict_get_int(ret, "id"), =3D=3D, 1);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_invalid_oob(gconstpointer fix)
>> @@ -253,7 +241,8 @@ static void test_qga_invalid_oob(gconstpointer fix)
>>  static void test_qga_invalid_args(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *error;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *error;
>
>
> Why the error pointer should not be freed?

qdict_get_qdict() returns a weak reference.

> Just a question, the patch looks good anyway.
>

thanks

>>
>>      const gchar *class, *desc;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping', "
>> @@ -266,14 +255,13 @@ static void test_qga_invalid_args(gconstpointer fi=
x)
>>
>>      g_assert_cmpstr(class, =3D=3D, "GenericError");
>>      g_assert_cmpstr(desc, =3D=3D, "Parameter 'foo' is unexpected");
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_invalid_cmd(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *error;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *error;
>>      const gchar *class, *desc;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-invalid-cmd'}");
>> @@ -285,14 +273,13 @@ static void test_qga_invalid_cmd(gconstpointer fix=
)
>>
>>      g_assert_cmpstr(class, =3D=3D, "CommandNotFound");
>>      g_assert_cmpint(strlen(desc), >, 0);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_info(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *val;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *val;
>>      const gchar *version;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-info'}");
>> @@ -302,14 +289,12 @@ static void test_qga_info(gconstpointer fix)
>>      val =3D qdict_get_qdict(ret, "return");
>>      version =3D qdict_get_try_str(val, "version");
>>      g_assert_cmpstr(version, =3D=3D, QEMU_VERSION);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_get_vcpus(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      QList *list;
>>      const QListEntry *entry;
>>
>> @@ -322,14 +307,12 @@ static void test_qga_get_vcpus(gconstpointer fix)
>>      entry =3D qlist_first(list);
>>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "online"));
>>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "logical-id"=
));
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_get_fsinfo(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      QList *list;
>>      const QListEntry *entry;
>>
>> @@ -346,14 +329,13 @@ static void test_qga_get_fsinfo(gconstpointer fix)
>>          g_assert(qdict_haskey(qobject_to(QDict, entry->value), "type"))=
;
>>          g_assert(qdict_haskey(qobject_to(QDict, entry->value), "disk"))=
;
>>      }
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_get_memory_block_info(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *val;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *val;
>>      int64_t size;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-memory-block-in=
fo'}");
>> @@ -366,14 +348,12 @@ static void test_qga_get_memory_block_info(gconstp=
ointer fix)
>>          size =3D qdict_get_int(val, "size");
>>          g_assert_cmpint(size, >, 0);
>>      }
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_get_memory_blocks(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      QList *list;
>>      const QListEntry *entry;
>>
>> @@ -391,14 +371,12 @@ static void test_qga_get_memory_blocks(gconstpoint=
er fix)
>>              g_assert(qdict_haskey(qobject_to(QDict, entry->value), "onl=
ine"));
>>          }
>>      }
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_network_get_interfaces(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      QList *list;
>>      const QListEntry *entry;
>>
>> @@ -410,8 +388,6 @@ static void test_qga_network_get_interfaces(gconstpo=
inter fix)
>>      list =3D qdict_get_qlist(ret, "return");
>>      entry =3D qlist_first(list);
>>      g_assert(qdict_haskey(qobject_to(QDict, entry->value), "name"));
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_file_ops(gconstpointer fix)
>> @@ -642,7 +618,7 @@ static void test_qga_file_write_read(gconstpointer f=
ix)
>>  static void test_qga_get_time(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      int64_t time;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-time'}");
>> @@ -651,8 +627,6 @@ static void test_qga_get_time(gconstpointer fix)
>>
>>      time =3D qdict_get_int(ret, "return");
>>      g_assert_cmpint(time, >, 0);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_blacklist(gconstpointer data)
>> @@ -693,18 +667,22 @@ static void test_qga_blacklist(gconstpointer data)
>>  static void test_qga_config(gconstpointer data)
>>  {
>>      GError *error =3D NULL;
>> -    char *cwd, *cmd, *out, *err, *str, **strv, **argv =3D NULL;
>> +    g_autofree char *out =3D NULL;
>> +    g_autofree char *err =3D NULL;
>> +    g_autofree char *cwd =3D NULL;
>> +    g_autofree char *cmd =3D NULL;
>> +    g_auto(GStrv) argv =3D NULL;
>> +    g_auto(GStrv) strv =3D NULL;
>> +    g_autoptr(GKeyFile) kf =3D NULL;
>> +    char *str;
>>      char *env[2];
>>      int status;
>>      gsize n;
>> -    GKeyFile *kf;
>>
>>      cwd =3D g_get_current_dir();
>>      cmd =3D g_strdup_printf("%s%cqga%cqemu-ga -D",
>>                            cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
>> -    g_free(cwd);
>>      g_shell_parse_argv(cmd, NULL, &argv, &error);
>> -    g_free(cmd);
>>      g_assert_no_error(error);
>>
>>      env[0] =3D g_strdup_printf("QGA_CONF=3Dtests%cdata%ctest-qga-config=
",
>> @@ -712,7 +690,6 @@ static void test_qga_config(gconstpointer data)
>>      env[1] =3D NULL;
>>      g_spawn_sync(NULL, argv, env, 0,
>>                   NULL, NULL, &out, &err, &status, &error);
>> -    g_strfreev(argv);
>>
>>      g_assert_no_error(error);
>>      g_assert_cmpstr(err, =3D=3D, "");
>> @@ -759,18 +736,14 @@ static void test_qga_config(gconstpointer data)
>>      g_assert_true(g_strv_contains((const char * const *)strv,
>>                                    "guest-get-time"));
>>      g_assert_no_error(error);
>> -    g_strfreev(strv);
>>
>> -    g_free(out);
>> -    g_free(err);
>>      g_free(env[0]);
>> -    g_key_file_free(kf);
>>  }
>>
>>  static void test_qga_fsfreeze_status(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      const gchar *status;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-fsfreeze-status'}")=
;
>> @@ -779,16 +752,15 @@ static void test_qga_fsfreeze_status(gconstpointer=
 fix)
>>
>>      status =3D qdict_get_try_str(ret, "return");
>>      g_assert_cmpstr(status, =3D=3D, "thawed");
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_exec(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *val;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *val;
>>      const gchar *out;
>> -    guchar *decoded;
>> +    g_autofree guchar *decoded =3D NULL;
>>      int64_t pid, now, exitcode;
>>      gsize len;
>>      bool exited;
>> @@ -827,14 +799,13 @@ static void test_qga_guest_exec(gconstpointer fix)
>>      decoded =3D g_base64_decode(out, &len);
>>      g_assert_cmpint(len, =3D=3D, 12);
>>      g_assert_cmpstr((char *)decoded, =3D=3D, "\" test_str \"");
>> -    g_free(decoded);
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_exec_invalid(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *error;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *error;
>>      const gchar *class, *desc;
>>
>>      /* invalid command */
>> @@ -859,13 +830,13 @@ static void test_qga_guest_exec_invalid(gconstpoin=
ter fix)
>>      desc =3D qdict_get_str(error, "desc");
>>      g_assert_cmpstr(class, =3D=3D, "GenericError");
>>      g_assert_cmpint(strlen(desc), >, 0);
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_get_host_name(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *val;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *val;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-host-name'}");
>>      g_assert_nonnull(ret);
>> @@ -873,14 +844,13 @@ static void test_qga_guest_get_host_name(gconstpoi=
nter fix)
>>
>>      val =3D qdict_get_qdict(ret, "return");
>>      g_assert(qdict_haskey(val, "host-name"));
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_get_timezone(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret, *val;
>> +    g_autoptr(QDict) ret =3D NULL;
>> +    QDict *val;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-timezone'}");
>>      g_assert_nonnull(ret);
>> @@ -889,14 +859,12 @@ static void test_qga_guest_get_timezone(gconstpoin=
ter fix)
>>      /* Make sure there's at least offset */
>>      val =3D qdict_get_qdict(ret, "return");
>>      g_assert(qdict_haskey(val, "offset"));
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_get_users(gconstpointer fix)
>>  {
>>      const TestFixture *fixture =3D fix;
>> -    QDict *ret;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      QList *val;
>>
>>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-get-users'}");
>> @@ -906,15 +874,13 @@ static void test_qga_guest_get_users(gconstpointer=
 fix)
>>      /* There is not much to test here */
>>      val =3D qdict_get_qlist(ret, "return");
>>      g_assert_nonnull(val);
>> -
>> -    qobject_unref(ret);
>>  }
>>
>>  static void test_qga_guest_get_osinfo(gconstpointer data)
>>  {
>>      TestFixture fixture;
>>      const gchar *str;
>> -    QDict *ret =3D NULL;
>> +    g_autoptr(QDict) ret =3D NULL;
>>      char *env[2];
>>      QDict *val;
>>
>> @@ -958,7 +924,6 @@ static void test_qga_guest_get_osinfo(gconstpointer =
data)
>>      g_assert_nonnull(str);
>>      g_assert_cmpstr(str, =3D=3D, "unit-test");
>>
>> -    qobject_unref(ret);
>>      g_free(env[0]);
>>      fixture_tear_down(&fixture, NULL);
>>  }
>> --
>> 2.36.1
>>
>
> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>


