Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8E6A3D60
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZ4O-0004EH-EK; Mon, 27 Feb 2023 03:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWZ4L-0004DC-Nl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:41:14 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWZ4J-0006Cu-Nu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:41:13 -0500
Received: by mail-lf1-x133.google.com with SMTP id k14so7467896lfj.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eg4vcUOabkI4sIzj1GFrRvmiousJjKUqwiR66qMNwAw=;
 b=J6H4pMEnkI941m7s7PC+ff7v/zy8NnMa3Z6XlFHunKhc7uA1KH7fRjTsSWT+ObFdUB
 0+rcAArnqTuFQo82ZGkDxEwrFzWV11k2m0ZDpg4UQWk2+KgsD+AILOyE1lw5pULWJ9LG
 e38dY1j8FrlyY75zEnwqrdABdWVllTZFbaqCdSxYxSXBjDtl0+9XGKIgeEWTuQcl64pO
 9W1O0ltDHppthw14MM6LEfDcf1xucPUcHsiq/8Iyb7C2oCPv5QVOdHzweGrNI8VrubPR
 4wlseTm5LYzlls9tZSr0DzHJE9uZVsc1Y4xvCkNorepVIntCWzV+6AI44/373P4om2cV
 76OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eg4vcUOabkI4sIzj1GFrRvmiousJjKUqwiR66qMNwAw=;
 b=4tXpZwOgngTVtSTXf2vuT8taSCaFtRNHfGVnqG5GwS3GEgXopqL9fKyBt5h13db4RV
 qBGsjKLXMB6/XFzpp+0e8Iu6cSH0gkbPpm3Pvbt1J2v0wo84skVe0vcLH2g4zVWUfMY5
 PBBtlwajMyTM76Op1IblLNSAYC3PgooipdxESFXKF7TXWcqJiXvupFF01QeNVVdisbCE
 JOiQx5cSnhOUTnEz00UddenhAA5cAQ6AeYoLwqO04W8PsyEAj57S/HuPd8T8jfH7Ot2j
 r1oHQoi1Ng8ki9dM5e/Xyiv+9BpjTmEpwTD3B2eyrLTQ6aZGAhk7YRf+ixs0TpihIKwN
 CKuw==
X-Gm-Message-State: AO0yUKU7wKccVAyrTihNhZEnwrCy5UohYmCuGb9diw0tNqFwXQ2Hjtj5
 2WNoOa0XLK/zNx8y67xEO3GhUE2Y/SAdvYo6/BA=
X-Google-Smtp-Source: AK7set/xWtR3ErpAUDZrYMXoj8fNqc2KRZx36/sdAxMNUjuYEcUHGBfZauw7D7btYuOQT+8HnzcHsx2rMYikc2DtSzQ=
X-Received: by 2002:a05:6512:4c8:b0:4db:1ae1:318b with SMTP id
 w8-20020a05651204c800b004db1ae1318bmr7125005lfq.5.1677487269433; Mon, 27 Feb
 2023 00:41:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <2d68032724822784750df4edc4df0c578c878871.1677197937.git.dxu@dxuuu.xyz>
In-Reply-To: <2d68032724822784750df4edc4df0c578c878871.1677197937.git.dxu@dxuuu.xyz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Feb 2023 12:40:57 +0400
Message-ID: <CAJ+F1CK2fHPSq=m=CX-2QVbg10TquLRWGtRRY1ip+ORozr+avw@mail.gmail.com>
Subject: Re: [PATCH 3/3] qga: test: Add tests for `merge-output` flag
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> This commit adds a test to ensure `merge-output` functions as expected.
> We also add a negative test to ensure we haven't regressed previous
> functionality.
>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>

Please check your patch with ASAN, you have use after-free introduced
by this change:
=3D=3D664972=3D=3DERROR: AddressSanitizer: heap-use-after-free on address
0x621000135028 at pc 0x55e617a38b39 bp 0x7fff7fe85390 sp
0x7fff7fe85388
READ of size 8 at 0x621000135028 thread T0
    #0 0x55e617a38b38 in qdict_find ../qobject/qdict.c:96
    #1 0x55e617a39bea in qdict_get ../qobject/qdict.c:164
    #2 0x55e617a39bea in qdict_get_int ../qobject/qdict.c:209
    #3 0x55e6179e2519 in test_qga_guest_exec ../tests/unit/test-qga.c:807
    #4 0x7fbaa499dc7d in g_test_run_suite_internal
(/lib64/libglib-2.0.so.0+0x84c7d)
    #5 0x7fbaa499d9e4 in g_test_run_suite_internal
(/lib64/libglib-2.0.so.0+0x849e4)
    #6 0x7fbaa499e181 in g_test_run_suite (/lib64/libglib-2.0.so.0+0x85181)
    #7 0x7fbaa49966ec in g_test_run (/lib64/libglib-2.0.so.0+0x7d6ec)
    #8 0x55e6179da0ac in main ../tests/unit/test-qga.c:1083
    #9 0x7fbaa384a50f in __libc_start_call_main (/lib64/libc.so.6+0x2750f)
    #10 0x7fbaa384a5c8 in __libc_start_main@GLIBC_2.2.5
(/lib64/libc.so.6+0x275c8)
    #11 0x55e6179daf44 in _start
(/home/elmarco/src/qemu/build/tests/unit/test-qga+0x1bbf44)

thanks
> ---
>  tests/unit/test-qga.c | 128 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 111 insertions(+), 17 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index 9d8e1d1cd3..0b3966024c 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -755,6 +755,31 @@ static void test_qga_fsfreeze_status(gconstpointer f=
ix)
>      g_assert_cmpstr(status, =3D=3D, "thawed");
>  }
>
> +static QDict *wait_for_guest_exec_completion(int fd, int64_t pid)
> +{
> +    QDict *ret =3D NULL;
> +    int64_t now;
> +    bool exited;
> +    QDict *val;
> +
> +    now =3D g_get_monotonic_time();
> +    do {
> +        ret =3D qmp_fd(fd,
> +                     "{'execute': 'guest-exec-status',"
> +                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
> +        g_assert_nonnull(ret);
> +        val =3D qdict_get_qdict(ret, "return");
> +        exited =3D qdict_get_bool(val, "exited");
> +        if (!exited) {
> +            qobject_unref(ret);
> +        }
> +    } while (!exited &&
> +             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
> +    g_assert(exited);
> +
> +    return ret;
> +}
> +
>  static void test_qga_guest_exec(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> @@ -762,9 +787,8 @@ static void test_qga_guest_exec(gconstpointer fix)
>      QDict *val;
>      const gchar *out;
>      g_autofree guchar *decoded =3D NULL;
> -    int64_t pid, now, exitcode;
> +    int64_t pid, exitcode;
>      gsize len;
> -    bool exited;
>
>      /* exec 'echo foo bar' */
>      ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': =
{"
> @@ -777,21 +801,7 @@ static void test_qga_guest_exec(gconstpointer fix)
>      g_assert_cmpint(pid, >, 0);
>      qobject_unref(ret);
>
> -    /* wait for completion */
> -    now =3D g_get_monotonic_time();
> -    do {
> -        ret =3D qmp_fd(fixture->fd,
> -                     "{'execute': 'guest-exec-status',"
> -                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
> -        g_assert_nonnull(ret);
> -        val =3D qdict_get_qdict(ret, "return");
> -        exited =3D qdict_get_bool(val, "exited");
> -        if (!exited) {
> -            qobject_unref(ret);
> -        }
> -    } while (!exited &&
> -             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
> -    g_assert(exited);
> +    ret =3D wait_for_guest_exec_completion(fixture->fd, pid);
>
>      /* check stdout */
>      exitcode =3D qdict_get_int(val, "exitcode");
> @@ -802,6 +812,86 @@ static void test_qga_guest_exec(gconstpointer fix)
>      g_assert_cmpstr((char *)decoded, =3D=3D, "\" test_str \"");
>  }
>
> +static void test_qga_guest_exec_output_no_merge(gconstpointer fix)
> +{
> +    const TestFixture *fixture =3D fix;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
> +    const gchar *out, *err;
> +    g_autofree guchar *out_decoded =3D NULL;
> +    g_autofree guchar *err_decoded =3D NULL;
> +    int64_t pid, exitcode;
> +    gsize len;
> +
> +    /* exec 'echo foo bar' */
> +    ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': =
{"
> +                 " 'path': '/bin/bash',"
> +                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )=
); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
> +                 " 'capture-output': true } }");
> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +    val =3D qdict_get_qdict(ret, "return");
> +    pid =3D qdict_get_int(val, "pid");
> +    g_assert_cmpint(pid, >, 0);
> +    qobject_unref(ret);
> +
> +    ret =3D wait_for_guest_exec_completion(fixture->fd, pid);
> +
> +    exitcode =3D qdict_get_int(val, "exitcode");
> +    g_assert_cmpint(exitcode, =3D=3D, 0);
> +
> +    /* check stdout */
> +    out =3D qdict_get_str(val, "out-data");
> +    out_decoded =3D g_base64_decode(out, &len);
> +    g_assert_cmpint(len, =3D=3D, 14);
> +    g_assert_cmpstr((char *)out_decoded, =3D=3D, "stdout\nstdout\n");
> +
> +    /* check stderr */
> +    err =3D qdict_get_try_str(val, "err-data");
> +    err_decoded =3D g_base64_decode(err, &len);
> +    g_assert_cmpint(len, =3D=3D, 14);
> +    g_assert_cmpstr((char *)err_decoded, =3D=3D, "stderr\nstderr\n");
> +}
> +
> +static void test_qga_guest_exec_output_merge(gconstpointer fix)
> +{
> +    const TestFixture *fixture =3D fix;
> +    g_autoptr(QDict) ret =3D NULL;
> +    QDict *val;
> +    const gchar *out, *err;
> +    g_autofree guchar *decoded =3D NULL;
> +    int64_t pid, exitcode;
> +    gsize len;
> +
> +    /* exec 'echo foo bar' */
> +    ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': =
{"
> +                 " 'path': '/bin/bash',"
> +                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )=
); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
> +                 " 'capture-output': true,"
> +                 " 'merge-output': true } }");
> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +    val =3D qdict_get_qdict(ret, "return");
> +    pid =3D qdict_get_int(val, "pid");
> +    g_assert_cmpint(pid, >, 0);
> +    qobject_unref(ret);
> +
> +    ret =3D wait_for_guest_exec_completion(fixture->fd, pid);
> +
> +    exitcode =3D qdict_get_int(val, "exitcode");
> +    g_assert_cmpint(exitcode, =3D=3D, 0);
> +
> +    /* check stdout */
> +    out =3D qdict_get_str(val, "out-data");
> +    decoded =3D g_base64_decode(out, &len);
> +    g_assert_cmpint(len, =3D=3D, 28);
> +    g_assert_cmpstr((char *)decoded, =3D=3D, "stdout\nstderr\nstdout\nst=
derr\n");
> +
> +    /* check stderr */
> +    err =3D qdict_get_try_str(val, "err-data");
> +    g_assert_null(err);
> +}
> +
>  static void test_qga_guest_exec_invalid(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> @@ -975,6 +1065,10 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs)=
;
>      g_test_add_data_func("/qga/config", NULL, test_qga_config);
>      g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
> +    g_test_add_data_func("/qga/guest-exec-output-no-merge", &fix,
> +                         test_qga_guest_exec_output_no_merge);
> +    g_test_add_data_func("/qga/guest-exec-output-merge", &fix,
> +                         test_qga_guest_exec_output_merge);
>      g_test_add_data_func("/qga/guest-exec-invalid", &fix,
>                           test_qga_guest_exec_invalid);
>      g_test_add_data_func("/qga/guest-get-osinfo", &fix,
> --
> 2.39.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

