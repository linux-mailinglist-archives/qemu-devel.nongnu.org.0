Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F995304373
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:12:32 +0100 (CET)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QxD-0001fE-E4
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4Qva-0000ud-Sn
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:10:50 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4QvY-0002yJ-Vi
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:10:50 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g3so23727553ejb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yvCfRUwZzAwvAck9uBHsaGD1+MSp32gFRLxio76LPb4=;
 b=MBa42+SACwAsyuTTxEl0+/WP9bsXokUd1d6RMdE+3TlrkovQA3y+YDYB6jcAPwpS/V
 8L4XQaa9x1bmWGKR+4j7h9tJq9qZ3YyjzeyZm5BnsMRYHmfoweKuX8fSiULWf4fHwIRm
 jMiMxW+OQaIVylKiDkbATX3bpWYBCIqUTkyqwNpKBvisuWvsNoCZ/H8LRn792wRUG1TS
 79kq89okH63T7HxSzpMqKF1vnizHZyLtiSyhIDNNPhmwYYqL/LTfyUNBE/Td3Dy/1UHv
 rYb0o3Z4HwfCSApraDh7UdqZguO1Bst/uxKfCZX/Dx5Ir1aDaFeAlkYPaKY7z4p8ein6
 wxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yvCfRUwZzAwvAck9uBHsaGD1+MSp32gFRLxio76LPb4=;
 b=IuMnIGp30JH3/j3u5mYupE/ZbvQ+erV6MAHGLXknL5chzPSXK2VT1xfOnoGFCcSy2G
 /NhnSsXmmpzQ/W9eRgznsH40RyUmWP/XcH4hdrgfd7luL+YzWyM6E1XsA5iVWlJFxlBV
 c0OFTHhXD93Df4IZA4jeDcbou7R8Z1Bg9Ro4jondjgQFR0QSpwSE5kJAl8DoAg4LiYna
 ZLgEqh2jZI4zmHAMMFE2TppYYKUH0Xyq3Di0EFoqyDZSx/ZrFwGYr/BtV+86bbzXXdAn
 gLMxYdhcXx8ln4E3mFSqKiveQyih8Z39+vKo3/tVhj34HyrH1y16NC+avnrVsd7XtMgY
 uNiw==
X-Gm-Message-State: AOAM533ojS8+tmswcHCdhie1WKYzfE0gHsZLN1n9qo2dDeZDZGl21yqQ
 BZxZq7xYQ9aa8wBGqFkvTxRCnlmx/5W6gLOoVyo=
X-Google-Smtp-Source: ABdhPJzMOBTohFzDObT9muuQRfeIb5VHRnwhVbesZngQoQO0l6hsU0i+TdGMnbGeqXOqPLiKxMWzK0HtFWEsX5Hh31s=
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr3941381eje.109.1611677447487; 
 Tue, 26 Jan 2021 08:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20210126151649.2220902-1-armbru@redhat.com>
In-Reply-To: <20210126151649.2220902-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Jan 2021 20:10:35 +0400
Message-ID: <CAJ+F1C+6QnBRzCkbE4Yxs0Av5MuwM9X2HydkEUV+ZE4uMxVLLg@mail.gmail.com>
Subject: Re: [PATCH] libqtest: Rework qtest_rsp()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 7:19 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> qtest_rsp() is used in two different ways: (1) return some arguments
> to caller, which the caller must free, and (2) return no arguments to
> caller.  Passing non-zero @expected_args gets you (1), and passing
> zero gets you (2).
>
> Having "the return value must be freed" depend on an argument this way
> is less than ideal.
>
> Provide separate functions for the two ways: (1) qtest_rsp_args()
> takes @expected_args (possibly zero), and returns that number of
> arguments.  Caller must free the return value always.  (2) qtest_rsp()
> assumes zero, and returns nothing.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qtest/libqtest.c | 50 ++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 5249a628cc..fd043b0570 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -503,7 +503,7 @@ static GString *qtest_client_socket_recv_line(QTestSt=
ate *s)
>      return line;
>  }
>
> -static gchar **qtest_rsp(QTestState *s, int expected_args)
> +static gchar **qtest_rsp_args(QTestState *s, int expected_args)
>  {
>      GString *line;
>      gchar **words;
> @@ -539,25 +539,27 @@ redo:
>      g_assert(words[0] !=3D NULL);
>      g_assert_cmpstr(words[0], =3D=3D, "OK");
>
> -    if (expected_args) {
> -        for (i =3D 0; i < expected_args; i++) {
> -            g_assert(words[i] !=3D NULL);
> -        }
> -    } else {
> -        g_strfreev(words);
> -        words =3D NULL;
> +    for (i =3D 0; i < expected_args; i++) {
> +        g_assert(words[i] !=3D NULL);
>      }
>
>      return words;
>  }
>
> +static void qtest_rsp(QTestState *s)
> +{
> +    gchar **words =3D qtest_rsp_args(s, 0);

You may even use g_auto(GStrv) if you fancy that.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> +
> +    g_strfreev(words);
> +}
> +
>  static int qtest_query_target_endianness(QTestState *s)
>  {
>      gchar **args;
>      int big_endian;
>
>      qtest_sendf(s, "endianness\n");
> -    args =3D qtest_rsp(s, 1);
> +    args =3D qtest_rsp_args(s, 1);
>      g_assert(strcmp(args[1], "big") =3D=3D 0 || strcmp(args[1], "little"=
) =3D=3D 0);
>      big_endian =3D strcmp(args[1], "big") =3D=3D 0;
>      g_strfreev(args);
> @@ -892,14 +894,14 @@ bool qtest_get_irq(QTestState *s, int num)
>  void qtest_module_load(QTestState *s, const char *prefix, const char *li=
bname)
>  {
>      qtest_sendf(s, "module_load %s %s\n", prefix, libname);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  static int64_t qtest_clock_rsp(QTestState *s)
>  {
>      gchar **words;
>      int64_t clock;
> -    words =3D qtest_rsp(s, 2);
> +    words =3D qtest_rsp_args(s, 2);
>      clock =3D g_ascii_strtoll(words[1], NULL, 0);
>      g_strfreev(words);
>      return clock;
> @@ -926,13 +928,13 @@ int64_t qtest_clock_set(QTestState *s, int64_t val)
>  void qtest_irq_intercept_out(QTestState *s, const char *qom_path)
>  {
>      qtest_sendf(s, "irq_intercept_out %s\n", qom_path);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  void qtest_irq_intercept_in(QTestState *s, const char *qom_path)
>  {
>      qtest_sendf(s, "irq_intercept_in %s\n", qom_path);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  void qtest_set_irq_in(QTestState *s, const char *qom_path, const char *n=
ame,
> @@ -942,13 +944,13 @@ void qtest_set_irq_in(QTestState *s, const char *qo=
m_path, const char *name,
>          name =3D "unnamed-gpio-in";
>      }
>      qtest_sendf(s, "set_irq_in %s %s %d %d\n", qom_path, name, num, leve=
l);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  static void qtest_out(QTestState *s, const char *cmd, uint16_t addr, uin=
t32_t value)
>  {
>      qtest_sendf(s, "%s 0x%x 0x%x\n", cmd, addr, value);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  void qtest_outb(QTestState *s, uint16_t addr, uint8_t value)
> @@ -973,7 +975,7 @@ static uint32_t qtest_in(QTestState *s, const char *c=
md, uint16_t addr)
>      unsigned long value;
>
>      qtest_sendf(s, "%s 0x%x\n", cmd, addr);
> -    args =3D qtest_rsp(s, 2);
> +    args =3D qtest_rsp_args(s, 2);
>      ret =3D qemu_strtoul(args[1], NULL, 0, &value);
>      g_assert(!ret && value <=3D UINT32_MAX);
>      g_strfreev(args);
> @@ -1000,7 +1002,7 @@ static void qtest_write(QTestState *s, const char *=
cmd, uint64_t addr,
>                          uint64_t value)
>  {
>      qtest_sendf(s, "%s 0x%" PRIx64 " 0x%" PRIx64 "\n", cmd, addr, value)=
;
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  void qtest_writeb(QTestState *s, uint64_t addr, uint8_t value)
> @@ -1030,7 +1032,7 @@ static uint64_t qtest_read(QTestState *s, const cha=
r *cmd, uint64_t addr)
>      uint64_t value;
>
>      qtest_sendf(s, "%s 0x%" PRIx64 "\n", cmd, addr);
> -    args =3D qtest_rsp(s, 2);
> +    args =3D qtest_rsp_args(s, 2);
>      ret =3D qemu_strtou64(args[1], NULL, 0, &value);
>      g_assert(!ret);
>      g_strfreev(args);
> @@ -1082,7 +1084,7 @@ void qtest_memread(QTestState *s, uint64_t addr, vo=
id *data, size_t size)
>      }
>
>      qtest_sendf(s, "read 0x%" PRIx64 " 0x%zx\n", addr, size);
> -    args =3D qtest_rsp(s, 2);
> +    args =3D qtest_rsp_args(s, 2);
>
>      for (i =3D 0; i < size; i++) {
>          ptr[i] =3D hex2nib(args[1][2 + (i * 2)]) << 4;
> @@ -1098,7 +1100,7 @@ uint64_t qtest_rtas_call(QTestState *s, const char =
*name,
>  {
>      qtest_sendf(s, "rtas %s %u 0x%"PRIx64" %u 0x%"PRIx64"\n",
>                  name, nargs, args, nret, ret);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>      return 0;
>  }
>
> @@ -1134,7 +1136,7 @@ void qtest_bufwrite(QTestState *s, uint64_t addr, c=
onst void *data, size_t size)
>      qtest_sendf(s, "b64write 0x%" PRIx64 " 0x%zx ", addr, size);
>      s->ops.send(s, bdata);
>      s->ops.send(s, "\n");
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>      g_free(bdata);
>  }
>
> @@ -1144,7 +1146,7 @@ void qtest_bufread(QTestState *s, uint64_t addr, vo=
id *data, size_t size)
>      size_t len;
>
>      qtest_sendf(s, "b64read 0x%" PRIx64 " 0x%zx\n", addr, size);
> -    args =3D qtest_rsp(s, 2);
> +    args =3D qtest_rsp_args(s, 2);
>
>      g_base64_decode_inplace(args[1], &len);
>      if (size !=3D len) {
> @@ -1174,14 +1176,14 @@ void qtest_memwrite(QTestState *s, uint64_t addr,=
 const void *data, size_t size)
>      }
>
>      qtest_sendf(s, "write 0x%" PRIx64 " 0x%zx 0x%s\n", addr, size, enc);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>      g_free(enc);
>  }
>
>  void qtest_memset(QTestState *s, uint64_t addr, uint8_t pattern, size_t =
size)
>  {
>      qtest_sendf(s, "memset 0x%" PRIx64 " 0x%zx 0x%02x\n", addr, size, pa=
ttern);
> -    qtest_rsp(s, 0);
> +    qtest_rsp(s);
>  }
>
>  void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
> --
> 2.26.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

