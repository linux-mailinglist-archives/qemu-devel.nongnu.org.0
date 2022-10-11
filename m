Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491B5FB758
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:33:26 +0200 (CEST)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHG0-0008Lt-Oa
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiH0I-0006pn-FD
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:17:10 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiH0F-0001A0-4x
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:17:09 -0400
Received: by mail-lf1-x136.google.com with SMTP id y5so21607392lfl.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fDxlu2XcVaZhFUwfGgSe+v2bXFw9Uk3mhTVCLasypaw=;
 b=kPSCZr2P4s/DudDxsN6ERhxNd2VEULcfV2xM/YqNpXLUzQYP7SrRWkmIRI/wm48u4j
 925432GivNgJDERv1C9c+tMa+BQJHo18qiLpH83OsygD77B4NeiB/LU+M4dnez3E751O
 7MJFmkop/f2oxCZEf44krspLNQrEbncwqUprrmqXASvIQQPUhO9xfOLkhnTGbG/R3RlT
 dx+Z5k95byjG/GsYkn6N3NLuvPGwV/D9e+uCBB1sgImCKrTq57EzOURRlfsrCoh8qWKp
 DHD4Rw9wQ/AOMe8ne2YdnJnWdXdrbwAMb691BMMlEZmmenfzW3756OGjz33OIPSoFEda
 et8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDxlu2XcVaZhFUwfGgSe+v2bXFw9Uk3mhTVCLasypaw=;
 b=1OPrgtfz4IXimzhYbcG6hzuqfMwHYTBeUfmzi6TD8dzcAUZmYwrFNjeq/02+SjIy8O
 LO5rnaEeQ9TrcmDI678pxJY7bg2A4HHfE70vHfuoemizHXLo61EQSDfCA59N0t13j95b
 Tt0i77v43qWs8aP8mPMcKCb7rTnI9ow+bxy3cxZp9wl3ThYIacdiTDNARFAw6D49Zm3M
 YxVvHD1ffzftkEhOxyeABET+BcWykN43YIfuZBr8o9AP8qNakEBSfigpt7KdZRrI5LqU
 Ohv93gd7hAdHXE0rd1y9E+xG54pPKuZr00+TigvHrG65aV89cciwLn1VQj5AeCGLoumk
 Pb1w==
X-Gm-Message-State: ACrzQf1HjBoM13WPt/+3tHu3iWVpXEF0WEK8LUi5QiW5/yyoDURtPtuu
 NvoZ/lthebchAlghVX7MBol3U7+Jb6b+Rf+fvLA=
X-Google-Smtp-Source: AMsMyM6rd7JjS5DuZxuoPPNUYOnXrDuxJrzbuclgRpuYZZ5rtYujH/PwOTrdWQPRxiVCm1ZD5L2VegfRP/wtTLVfLO0=
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id
 z13-20020a0565120c0d00b004a24129366emr9534382lfu.328.1665501424527; Tue, 11
 Oct 2022 08:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221011144509.493646-1-den-plotnikov@yandex-team.ru>
In-Reply-To: <20221011144509.493646-1-den-plotnikov@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 11 Oct 2022 19:16:52 +0400
Message-ID: <CAJ+F1C+eYO=hciZ=dkwAr+sGUY2J-9-o-a2w7i4JZ-Ci9K7yig@mail.gmail.com>
Subject: Re: [PATCH v2] qapi/qmp: Add timestamps to qmp command responses
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, armbru@redhat.com, 
 michael.roth@amd.com, vsementsov@yandex-team.ru, berrange@redhat.com
Content-Type: multipart/alternative; boundary="000000000000c82f0605eac3c4fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c82f0605eac3c4fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 6:49 PM Denis Plotnikov <
den-plotnikov@yandex-team.ru> wrote:

> Add "start" & "end" time values to qmp command responses.
>
> These time values are added to let the qemu management layer get the exac=
t
> command execution time without any other time variance which might be
> brought by
> other parts of management layer or qemu internals. This is particulary
> useful
> for the management layer logging for later problems resolving.
>
> Example of result:
>
>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
>
>     (QEMU) query-status
>     {"end": {"seconds": 1650367305, "microseconds": 831032},
>      "start": {"seconds": 1650367305, "microseconds": 831012},
>      "return": {"status": "running", "singlestep": false, "running": true=
}}
>
> The responce of the qmp command contains the start & end time of
> the qmp command processing.
>
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
> v0->v1:
>  - remove interface to control "start" and "end" time values: return
> timestamps unconditionally
>  - add description to qmp specification
>  - leave the same timestamp format in "seconds", "microseconds" to be
> consistent with events
>    timestamp
>  - fix patch description
>
> v1->v2:
>  - rephrase doc descriptions [Daniel]
>  - add tests for qmp timestamps to qmp test and qga test [Daniel]
>  - adjust asserts in test-qmp-cmds according to the new number of
> returning keys
>
>  docs/interop/qmp-spec.txt  | 28 ++++++++++++++++++++++++++--
>  qapi/qmp-dispatch.c        | 18 ++++++++++++++++++
>  tests/qtest/qmp-test.c     | 34 ++++++++++++++++++++++++++++++++++
>  tests/unit/test-qga.c      | 31 +++++++++++++++++++++++++++++++
>  tests/unit/test-qmp-cmds.c |  4 ++--
>  5 files changed, 111 insertions(+), 4 deletions(-)
>
> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
> index b0e8351d5b261..2e0b7de0c4dc7 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.txt
> @@ -158,7 +158,9 @@ responses that have an unknown "id" field.
>
>  The format of a success response is:
>
> -{ "return": json-value, "id": json-value }
> +{ "return": json-value, "id": json-value,
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }
>
>   Where,
>
> @@ -169,13 +171,25 @@ The format of a success response is:
>    command does not return data
>  - The "id" member contains the transaction identification associated
>    with the command execution if issued by the Client
> +- The "start" member contains the exact time of when the server
> +  started executing the command. This excludes any time the
> +  command request spent queued, after reading it off the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
> +- The "end" member contains the exact time of when the server
> +  finished executing the command. This excludes any time the
> +  command response spent queued, waiting to be sent on the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
>
>  2.4.2 error
>  -----------
>
>  The format of an error response is:
>
> -{ "error": { "class": json-string, "desc": json-string }, "id":
> json-value }
> +{ "error": { "class": json-string, "desc": json-string }, "id": json-val=
ue
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }
>
>   Where,
>
> @@ -184,6 +198,16 @@ The format of an error response is:
>    not attempt to parse this message.
>  - The "id" member contains the transaction identification associated wit=
h
>    the command execution if issued by the Client
> +- The "start" member contains the exact time of when the server
> +  started executing the command. This excludes any time the
> +  command request spent queued, after reading it off the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
> +- The "end" member contains the exact time of when the server
> +  finished executing the command. This excludes any time the
> +  command response spent queued, waiting to be sent on the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
>
>  NOTE: Some errors can occur before the Server is able to read the "id"
> member,
>  in these cases the "id" member will not be part of the error response,
> even
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 0990873ec8ec1..fce87416f2128 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)
>      aio_co_wake(data->co);
>  }
>
> +static void add_timestamps(QDict *qdict, uint64_t start_ms, uint64_t
> end_ms)
> +{
> +    QDict *start_dict, *end_dict;
> +
> +    start_dict =3D qdict_new();
> +    qdict_put_int(start_dict, "seconds", start_ms / G_USEC_PER_SEC);
> +    qdict_put_int(start_dict, "microseconds", start_ms % G_USEC_PER_SEC)=
;
> +
> +    end_dict =3D qdict_new();
> +    qdict_put_int(end_dict, "seconds", end_ms / G_USEC_PER_SEC);
> +    qdict_put_int(end_dict, "microseconds", end_ms % G_USEC_PER_SEC);
> +
> +    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
> +    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
> +}
> +
>  /*
>   * Runs outside of coroutine context for OOB commands, but in coroutine
>   * context for everything else.
> @@ -146,6 +162,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
>      QObject *id;
>      QObject *ret =3D NULL;
>      QDict *rsp =3D NULL;
> +    uint64_t ts_start =3D g_get_real_time();
>
>      dict =3D qobject_to(QDict, request);
>      if (!dict) {
> @@ -270,5 +287,6 @@ out:
>          qdict_put_obj(rsp, "id", qobject_ref(id));
>      }
>
> +    add_timestamps(rsp, ts_start, g_get_real_time());
>      return rsp;
>  }
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index 22957fa49c228..e0d83eea91ae5 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -33,6 +33,30 @@ static void test_version(QObject *version)
>      visit_free(v);
>  }
>
> +static void test_timestamps(QDict *resp)
> +{
> +    QDict *start, *end;
> +    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
> +
> +    start =3D qdict_get_qdict(resp, "start");
> +    g_assert(start);
> +    end =3D qdict_get_qdict(resp, "end");
> +    g_assert(end);
> +
> +    start_s =3D qdict_get_try_int(start, "seconds", 0);
> +    g_assert(start_s);
> +    start_us =3D qdict_get_try_int(start, "microseconds", 0);
> +
> +    end_s =3D qdict_get_try_int(end, "seconds", 0);
> +    g_assert(end_s);
> +    end_us =3D qdict_get_try_int(end, "microseconds", 0);
> +
> +    start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;
> +    end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;
> +
> +    g_assert(end_ts > start_ts);
> +}
> +
>  static void assert_recovered(QTestState *qts)
>  {
>      QDict *resp;
> @@ -156,6 +180,16 @@ static void test_qmp_protocol(void)
>      g_assert_cmpint(qdict_get_int(resp, "id"), =3D=3D, 2);
>      qmp_expect_error_and_unref(resp, "GenericError");
>
> +    /* Test timestamps on success */
> +    resp =3D qtest_qmp(qts, "{ 'execute': 'query-version' }");
> +    test_timestamps(resp);
> +    qobject_unref(resp);
> +
> +    /* Test timestamps on error */
> +    resp =3D qtest_qmp(qts, "{ 'execute': 'not-existing-cmd' }");
> +    test_timestamps(resp);
> +    qobject_unref(resp);
> +
>      qtest_quit(qts);
>  }
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index b4e0a145737d1..b30a3d1abe55f 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -217,6 +217,36 @@ static void test_qga_ping(gconstpointer fix)
>      qmp_assert_no_error(ret);
>  }
>
> +static void test_qga_timestamps(gconstpointer fix)
> +{
> +    QDict *start, *end;
> +    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
> +    const TestFixture *fixture =3D fix;
> +    g_autoptr(QDict) ret =3D NULL;
> +
> +    ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +
> +    start =3D qdict_get_qdict(ret, "start");
> +    g_assert(start);
> +    end =3D qdict_get_qdict(ret, "end");
> +    g_assert(end);
> +
> +    start_s =3D qdict_get_try_int(start, "seconds", 0);
> +    g_assert(start_s);
> +    start_us =3D qdict_get_try_int(start, "microseconds", 0);
> +
> +    end_s =3D qdict_get_try_int(end, "seconds", 0);
> +    g_assert(end_s);
> +    end_us =3D qdict_get_try_int(end, "microseconds", 0);
> +
> +    start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;
> +    end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;
> +
> +    g_assert(end_ts > start_ts);
> +}
> +
>  static void test_qga_id(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> @@ -948,6 +978,7 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/qga/sync-delimited", &fix,
> test_qga_sync_delimited);
>      g_test_add_data_func("/qga/sync", &fix, test_qga_sync);
>      g_test_add_data_func("/qga/ping", &fix, test_qga_ping);
> +    g_test_add_data_func("/qga/timestaps", &fix, test_qga_timestamps);
>

 /qga/timestaMps

lgtm otherwise

     g_test_add_data_func("/qga/info", &fix, test_qga_info);
>      g_test_add_data_func("/qga/network-get-interfaces", &fix,
>                           test_qga_network_get_interfaces);
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 6085c099950b5..54d63bb8e346f 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -154,7 +154,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const
> char *template, ...)
>      g_assert(resp);
>      ret =3D qdict_get(resp, "return");
>      g_assert(ret);
> -    g_assert(qdict_size(resp) =3D=3D 1);
> +    g_assert(qdict_size(resp) =3D=3D 3);
>
>      qobject_ref(ret);
>      qobject_unref(resp);
> @@ -181,7 +181,7 @@ static void do_qmp_dispatch_error(bool allow_oob,
> ErrorClass cls,
>                      =3D=3D, QapiErrorClass_str(cls));
>      g_assert(qdict_get_try_str(error, "desc"));
>      g_assert(qdict_size(error) =3D=3D 2);
> -    g_assert(qdict_size(resp) =3D=3D 1);
> +    g_assert(qdict_size(resp) =3D=3D 3);
>
>      qobject_unref(resp);
>      qobject_unref(req);
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c82f0605eac3c4fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 11, 2022 at 6:49 PM Denis=
 Plotnikov &lt;<a href=3D"mailto:den-plotnikov@yandex-team.ru">den-plotniko=
v@yandex-team.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Add &quot;start&quot; &amp; &quot;end&quot; time values to =
qmp command responses.<br>
<br>
These time values are added to let the qemu management layer get the exact<=
br>
command execution time without any other time variance which might be broug=
ht by<br>
other parts of management layer or qemu internals. This is particulary usef=
ul<br>
for the management layer logging for later problems resolving.<br>
<br>
Example of result:<br>
<br>
=C2=A0 =C2=A0 ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket<br>
<br>
=C2=A0 =C2=A0 (QEMU) query-status<br>
=C2=A0 =C2=A0 {&quot;end&quot;: {&quot;seconds&quot;: 1650367305, &quot;mic=
roseconds&quot;: 831032},<br>
=C2=A0 =C2=A0 =C2=A0&quot;start&quot;: {&quot;seconds&quot;: 1650367305, &q=
uot;microseconds&quot;: 831012},<br>
=C2=A0 =C2=A0 =C2=A0&quot;return&quot;: {&quot;status&quot;: &quot;running&=
quot;, &quot;singlestep&quot;: false, &quot;running&quot;: true}}<br>
<br>
The responce of the qmp command contains the start &amp; end time of<br>
the qmp command processing.<br>
<br>
Suggested-by: Andrey Ryabinin &lt;<a href=3D"mailto:arbn@yandex-team.ru" ta=
rget=3D"_blank">arbn@yandex-team.ru</a>&gt;<br>
Signed-off-by: Denis Plotnikov &lt;<a href=3D"mailto:den-plotnikov@yandex-t=
eam.ru" target=3D"_blank">den-plotnikov@yandex-team.ru</a>&gt;<br>
---<br>
v0-&gt;v1:<br>
=C2=A0- remove interface to control &quot;start&quot; and &quot;end&quot; t=
ime values: return timestamps unconditionally<br>
=C2=A0- add description to qmp specification<br>
=C2=A0- leave the same timestamp format in &quot;seconds&quot;, &quot;micro=
seconds&quot; to be consistent with events<br>
=C2=A0 =C2=A0timestamp<br>
=C2=A0- fix patch description<br>
<br>
v1-&gt;v2:<br>
=C2=A0- rephrase doc descriptions [Daniel]<br>
=C2=A0- add tests for qmp timestamps to qmp test and qga test [Daniel]<br>
=C2=A0- adjust asserts in test-qmp-cmds according to the new number of retu=
rning keys<br>
<br>
=C2=A0docs/interop/qmp-spec.txt=C2=A0 | 28 ++++++++++++++++++++++++++--<br>
=C2=A0qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++++++++=
+<br>
=C2=A0tests/qtest/qmp-test.c=C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++++++++=
++++++++++++<br>
=C2=A0tests/unit/test-qga.c=C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++++++++++++++=
+++++++++<br>
=C2=A0tests/unit/test-qmp-cmds.c |=C2=A0 4 ++--<br>
=C2=A05 files changed, 111 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt<br>
index b0e8351d5b261..2e0b7de0c4dc7 100644<br>
--- a/docs/interop/qmp-spec.txt<br>
+++ b/docs/interop/qmp-spec.txt<br>
@@ -158,7 +158,9 @@ responses that have an unknown &quot;id&quot; field.<br=
>
<br>
=C2=A0The format of a success response is:<br>
<br>
-{ &quot;return&quot;: json-value, &quot;id&quot;: json-value }<br>
+{ &quot;return&quot;: json-value, &quot;id&quot;: json-value,<br>
+=C2=A0 &quot;start&quot;: {&quot;seconds&quot;: json-value, &quot;microsec=
onds&quot;: json-value},<br>
+=C2=A0 &quot;end&quot;: {&quot;seconds&quot;: json-value, &quot;microsecon=
ds&quot;: json-value} }<br>
<br>
=C2=A0 Where,<br>
<br>
@@ -169,13 +171,25 @@ The format of a success response is:<br>
=C2=A0 =C2=A0command does not return data<br>
=C2=A0- The &quot;id&quot; member contains the transaction identification a=
ssociated<br>
=C2=A0 =C2=A0with the command execution if issued by the Client<br>
+- The &quot;start&quot; member contains the exact time of when the server<=
br>
+=C2=A0 started executing the command. This excludes any time the<br>
+=C2=A0 command request spent queued, after reading it off the wire.<br>
+=C2=A0 It is a fixed json-object with time in seconds and microseconds<br>
+=C2=A0 relative to the Unix Epoch (1 Jan 1970)<br>
+- The &quot;end&quot; member contains the exact time of when the server<br=
>
+=C2=A0 finished executing the command. This excludes any time the<br>
+=C2=A0 command response spent queued, waiting to be sent on the wire.<br>
+=C2=A0 It is a fixed json-object with time in seconds and microseconds<br>
+=C2=A0 relative to the Unix Epoch (1 Jan 1970)<br>
<br>
=C2=A02.4.2 error<br>
=C2=A0-----------<br>
<br>
=C2=A0The format of an error response is:<br>
<br>
-{ &quot;error&quot;: { &quot;class&quot;: json-string, &quot;desc&quot;: j=
son-string }, &quot;id&quot;: json-value }<br>
+{ &quot;error&quot;: { &quot;class&quot;: json-string, &quot;desc&quot;: j=
son-string }, &quot;id&quot;: json-value<br>
+=C2=A0 &quot;start&quot;: {&quot;seconds&quot;: json-value, &quot;microsec=
onds&quot;: json-value},<br>
+=C2=A0 &quot;end&quot;: {&quot;seconds&quot;: json-value, &quot;microsecon=
ds&quot;: json-value} }<br>
<br>
=C2=A0 Where,<br>
<br>
@@ -184,6 +198,16 @@ The format of an error response is:<br>
=C2=A0 =C2=A0not attempt to parse this message.<br>
=C2=A0- The &quot;id&quot; member contains the transaction identification a=
ssociated with<br>
=C2=A0 =C2=A0the command execution if issued by the Client<br>
+- The &quot;start&quot; member contains the exact time of when the server<=
br>
+=C2=A0 started executing the command. This excludes any time the<br>
+=C2=A0 command request spent queued, after reading it off the wire.<br>
+=C2=A0 It is a fixed json-object with time in seconds and microseconds<br>
+=C2=A0 relative to the Unix Epoch (1 Jan 1970)<br>
+- The &quot;end&quot; member contains the exact time of when the server<br=
>
+=C2=A0 finished executing the command. This excludes any time the<br>
+=C2=A0 command response spent queued, waiting to be sent on the wire.<br>
+=C2=A0 It is a fixed json-object with time in seconds and microseconds<br>
+=C2=A0 relative to the Unix Epoch (1 Jan 1970)<br>
<br>
=C2=A0NOTE: Some errors can occur before the Server is able to read the &qu=
ot;id&quot; member,<br>
=C2=A0in these cases the &quot;id&quot; member will not be part of the erro=
r response, even<br>
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
index 0990873ec8ec1..fce87416f2128 100644<br>
--- a/qapi/qmp-dispatch.c<br>
+++ b/qapi/qmp-dispatch.c<br>
@@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0aio_co_wake(data-&gt;co);<br>
=C2=A0}<br>
<br>
+static void add_timestamps(QDict *qdict, uint64_t start_ms, uint64_t end_m=
s)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *start_dict, *end_dict;<br>
+<br>
+=C2=A0 =C2=A0 start_dict =3D qdict_new();<br>
+=C2=A0 =C2=A0 qdict_put_int(start_dict, &quot;seconds&quot;, start_ms / G_=
USEC_PER_SEC);<br>
+=C2=A0 =C2=A0 qdict_put_int(start_dict, &quot;microseconds&quot;, start_ms=
 % G_USEC_PER_SEC);<br>
+<br>
+=C2=A0 =C2=A0 end_dict =3D qdict_new();<br>
+=C2=A0 =C2=A0 qdict_put_int(end_dict, &quot;seconds&quot;, end_ms / G_USEC=
_PER_SEC);<br>
+=C2=A0 =C2=A0 qdict_put_int(end_dict, &quot;microseconds&quot;, end_ms % G=
_USEC_PER_SEC);<br>
+<br>
+=C2=A0 =C2=A0 qdict_put_obj(qdict, &quot;start&quot;, QOBJECT(start_dict))=
;<br>
+=C2=A0 =C2=A0 qdict_put_obj(qdict, &quot;end&quot;, QOBJECT(end_dict));<br=
>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Runs outside of coroutine context for OOB commands, but in corouti=
ne<br>
=C2=A0 * context for everything else.<br>
@@ -146,6 +162,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject=
 *request,<br>
=C2=A0 =C2=A0 =C2=A0QObject *id;<br>
=C2=A0 =C2=A0 =C2=A0QObject *ret =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QDict *rsp =3D NULL;<br>
+=C2=A0 =C2=A0 uint64_t ts_start =3D g_get_real_time();<br>
<br>
=C2=A0 =C2=A0 =C2=A0dict =3D qobject_to(QDict, request);<br>
=C2=A0 =C2=A0 =C2=A0if (!dict) {<br>
@@ -270,5 +287,6 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdict_put_obj(rsp, &quot;id&quot;, qobjec=
t_ref(id));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 add_timestamps(rsp, ts_start, g_get_real_time());<br>
=C2=A0 =C2=A0 =C2=A0return rsp;<br>
=C2=A0}<br>
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c<br>
index 22957fa49c228..e0d83eea91ae5 100644<br>
--- a/tests/qtest/qmp-test.c<br>
+++ b/tests/qtest/qmp-test.c<br>
@@ -33,6 +33,30 @@ static void test_version(QObject *version)<br>
=C2=A0 =C2=A0 =C2=A0visit_free(v);<br>
=C2=A0}<br>
<br>
+static void test_timestamps(QDict *resp)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *start, *end;<br>
+=C2=A0 =C2=A0 uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;=
<br>
+<br>
+=C2=A0 =C2=A0 start =3D qdict_get_qdict(resp, &quot;start&quot;);<br>
+=C2=A0 =C2=A0 g_assert(start);<br>
+=C2=A0 =C2=A0 end =3D qdict_get_qdict(resp, &quot;end&quot;);<br>
+=C2=A0 =C2=A0 g_assert(end);<br>
+<br>
+=C2=A0 =C2=A0 start_s =3D qdict_get_try_int(start, &quot;seconds&quot;, 0)=
;<br>
+=C2=A0 =C2=A0 g_assert(start_s);<br>
+=C2=A0 =C2=A0 start_us =3D qdict_get_try_int(start, &quot;microseconds&quo=
t;, 0);<br>
+<br>
+=C2=A0 =C2=A0 end_s =3D qdict_get_try_int(end, &quot;seconds&quot;, 0);<br=
>
+=C2=A0 =C2=A0 g_assert(end_s);<br>
+=C2=A0 =C2=A0 end_us =3D qdict_get_try_int(end, &quot;microseconds&quot;, =
0);<br>
+<br>
+=C2=A0 =C2=A0 start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;<br>
+=C2=A0 =C2=A0 end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;<br>
+<br>
+=C2=A0 =C2=A0 g_assert(end_ts &gt; start_ts);<br>
+}<br>
+<br>
=C2=A0static void assert_recovered(QTestState *qts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QDict *resp;<br>
@@ -156,6 +180,16 @@ static void test_qmp_protocol(void)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qdict_get_int(resp, &quot;id&quot;), =
=3D=3D, 2);<br>
=C2=A0 =C2=A0 =C2=A0qmp_expect_error_and_unref(resp, &quot;GenericError&quo=
t;);<br>
<br>
+=C2=A0 =C2=A0 /* Test timestamps on success */<br>
+=C2=A0 =C2=A0 resp =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39;quer=
y-version&#39; }&quot;);<br>
+=C2=A0 =C2=A0 test_timestamps(resp);<br>
+=C2=A0 =C2=A0 qobject_unref(resp);<br>
+<br>
+=C2=A0 =C2=A0 /* Test timestamps on error */<br>
+=C2=A0 =C2=A0 resp =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39;not-=
existing-cmd&#39; }&quot;);<br>
+=C2=A0 =C2=A0 test_timestamps(resp);<br>
+=C2=A0 =C2=A0 qobject_unref(resp);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index b4e0a145737d1..b30a3d1abe55f 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -217,6 +217,36 @@ static void test_qga_ping(gconstpointer fix)<br>
=C2=A0 =C2=A0 =C2=A0qmp_assert_no_error(ret);<br>
=C2=A0}<br>
<br>
+static void test_qga_timestamps(gconstpointer fix)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *start, *end;<br>
+=C2=A0 =C2=A0 uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;=
<br>
+=C2=A0 =C2=A0 const TestFixture *fixture =3D fix;<br>
+=C2=A0 =C2=A0 g_autoptr(QDict) ret =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_fd(fixture-&gt;fd, &quot;{&#39;execute&#39;: &#3=
9;guest-ping&#39;}&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ret);<br>
+=C2=A0 =C2=A0 qmp_assert_no_error(ret);<br>
+<br>
+=C2=A0 =C2=A0 start =3D qdict_get_qdict(ret, &quot;start&quot;);<br>
+=C2=A0 =C2=A0 g_assert(start);<br>
+=C2=A0 =C2=A0 end =3D qdict_get_qdict(ret, &quot;end&quot;);<br>
+=C2=A0 =C2=A0 g_assert(end);<br>
+<br>
+=C2=A0 =C2=A0 start_s =3D qdict_get_try_int(start, &quot;seconds&quot;, 0)=
;<br>
+=C2=A0 =C2=A0 g_assert(start_s);<br>
+=C2=A0 =C2=A0 start_us =3D qdict_get_try_int(start, &quot;microseconds&quo=
t;, 0);<br>
+<br>
+=C2=A0 =C2=A0 end_s =3D qdict_get_try_int(end, &quot;seconds&quot;, 0);<br=
>
+=C2=A0 =C2=A0 g_assert(end_s);<br>
+=C2=A0 =C2=A0 end_us =3D qdict_get_try_int(end, &quot;microseconds&quot;, =
0);<br>
+<br>
+=C2=A0 =C2=A0 start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;<br>
+=C2=A0 =C2=A0 end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;<br>
+<br>
+=C2=A0 =C2=A0 g_assert(end_ts &gt; start_ts);<br>
+}<br>
+<br>
=C2=A0static void test_qga_id(gconstpointer fix)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const TestFixture *fixture =3D fix;<br>
@@ -948,6 +978,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/sync-delimited&quot;, &=
amp;fix, test_qga_sync_delimited);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/sync&quot;, &amp;fix, t=
est_qga_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/ping&quot;, &amp;fix, t=
est_qga_ping);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/qga/timestaps&quot;, &amp;fix, t=
est_qga_timestamps);<br></blockquote><div><br></div><div>=C2=A0/qga/timesta=
Mps</div><div><br></div><div>lgtm otherwise</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/info&quot;, &amp;fix, t=
est_qga_info);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/network-get-interfaces&=
quot;, &amp;fix,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 test_qga_network_get_interfaces);<br>
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c<br>
index 6085c099950b5..54d63bb8e346f 100644<br>
--- a/tests/unit/test-qmp-cmds.c<br>
+++ b/tests/unit/test-qmp-cmds.c<br>
@@ -154,7 +154,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const c=
har *template, ...)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(resp);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qdict_get(resp, &quot;return&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret);<br>
-=C2=A0 =C2=A0 g_assert(qdict_size(resp) =3D=3D 1);<br>
+=C2=A0 =C2=A0 g_assert(qdict_size(resp) =3D=3D 3);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qobject_ref(ret);<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(resp);<br>
@@ -181,7 +181,7 @@ static void do_qmp_dispatch_error(bool allow_oob, Error=
Class cls,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D=3D, QapiErrorClass_str(cls));<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_get_try_str(error, &quot;desc&quot;));<b=
r>
=C2=A0 =C2=A0 =C2=A0g_assert(qdict_size(error) =3D=3D 2);<br>
-=C2=A0 =C2=A0 g_assert(qdict_size(resp) =3D=3D 1);<br>
+=C2=A0 =C2=A0 g_assert(qdict_size(resp) =3D=3D 3);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(resp);<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(req);<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c82f0605eac3c4fa--

