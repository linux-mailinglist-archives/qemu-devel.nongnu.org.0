Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC565A7FA4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:12:30 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOSC-0001pO-Sg
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOQT-0000N6-IR
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:10:42 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOQR-0006Fz-Bb
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:10:41 -0400
Received: by mail-lj1-x234.google.com with SMTP id y10so11620237ljq.0
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8QLfrF4qcJQZ/kMQCoDwF9sR9h/aaJntImb+3TqJ/uQ=;
 b=qMkIMieXf8IZ7lVM+zW5TSypphvnWW7nM1KnK/nA87j6pzPYcCk3X+hVZaKcvJqncf
 qtP+C6kiAw6bbmcVZbPZNYwQm0UD3tM3H0St1ZZslGkHsm6ieT/cOgdoUdJLXTQ29zPd
 U+q0hAiO/0xJli0j1KUWjVboyQ2YieJp5IvblE1jtvrxjIsrNOckxc1PewCm3Mrfi11V
 /tuxWEI6VyvTNTSRmGjemWkpluNeW2EUwGTmm8U0LxyPTfFOCBlyPREzjtN8OkVzzUGN
 +yB4kfRQN6yofNADXVa3N9G3b9wn8IbfLyqtNTd4YcxoerefTpaViJ0J1Vl+MnB4WDJ+
 9x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8QLfrF4qcJQZ/kMQCoDwF9sR9h/aaJntImb+3TqJ/uQ=;
 b=sJtfikgju2fzkNKc2fx9jFK5EVxvmvcPo7YT1+MP4fbn2YT/ynIuoOFI25X1LKzr6B
 8VMZV86SIxNP2onkyVEqSjBytebjsZK43hR80MFRKsQppoaUy1eviUZRr4M1OfKmOVUn
 5YUAq9YG66mBwjXvmsua4P4/quadBnyfmB3Ym4DFMrcmm2GZaRjJUZzxG/Bx2j9JPpna
 wgQFDb98tlxcrK3f00TWmYlB+tZq7FJS8nVd0oSGz2FIIU+V/PJoo95hFYHSgLevXcpe
 5igKTCHUJxr0nnPDn0bjSGpKEgkETgvAQwhk5Wz5KcBUhocrYGClbyuvMMwcA0MUgywT
 R98A==
X-Gm-Message-State: ACgBeo2ZWQQpmP9qopI8PuZiTO9eh7X/noMypRS0vjDPT1CdI4+OQoPm
 OR9+2TjmC7N5iqIJJlipzIUFHWblsrri3Wg/N08=
X-Google-Smtp-Source: AA6agR73NnAN8UkfLUlgwZTbi8C0+utk1Tf3IpWqfkfUwz6A5K5sTdanXDQ+Ylz0WEv8oHHE/YVeEhPDWYJurgBfoxk=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr8490869ljq.529.1661955037189; Wed, 31
 Aug 2022 07:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-29-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-29-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 18:10:25 +0400
Message-ID: <CAJ+F1CLBR6chChurLOtsp8op21sM3gC5-GGRDK5sBfY9eJ3y7w@mail.gmail.com>
Subject: Re: [PATCH 28/51] tests/qtest: libqtest: Exclude the *_fds APIs for
 win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009fdc8105e78a0fa8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000009fdc8105e78a0fa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:38 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> libqmp.c::qmp_fd_vsend_fds() is not available on Windows, hence any
> APIs in libqtest that call libqmp.c::qmp_fd_vsend_fds() should be
> excluded for win32 too. This includes the following:
>
>   * qtest_qmp_vsend_fds()
>   * qtest_vqmp_fds()
>   * qtest_qmp_fds()
>   * qtest_qmp_add_client()
>
> Note qtest_qmp_vsend() was wrongly written to call qmp_fd_vsend_fds()
> previously, but it should call the non fds version API qmp_fd_vsend().
>

This doesn't look relevant anymore


>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/libqtest.h |  8 ++++++++
>  tests/qtest/libqtest.c | 10 +++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 94b187837d..3abc75964d 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -94,6 +94,7 @@ void qtest_kill_qemu(QTestState *s);
>   */
>  void qtest_quit(QTestState *s);
>
> +#ifndef _WIN32
>  /**
>   * qtest_qmp_fds:
>   * @s: #QTestState instance to operate on.
> @@ -108,6 +109,7 @@ void qtest_quit(QTestState *s);
>  QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
>                       const char *fmt, ...)
>      G_GNUC_PRINTF(4, 5);
> +#endif /* _WIN32 */
>
>  /**
>   * qtest_qmp:
> @@ -152,6 +154,7 @@ void qtest_qmp_send_raw(QTestState *s, const char
> *fmt, ...)
>   */
>  int qtest_socket_server(const char *socket_path);
>
> +#ifndef _WIN32
>  /**
>   * qtest_vqmp_fds:
>   * @s: #QTestState instance to operate on.
> @@ -167,6 +170,7 @@ int qtest_socket_server(const char *socket_path);
>  QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
>                        const char *fmt, va_list ap)
>      G_GNUC_PRINTF(4, 0);
> +#endif /* _WIN32 */
>
>  /**
>   * qtest_vqmp:
> @@ -181,6 +185,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t
> fds_num,
>  QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
>      G_GNUC_PRINTF(2, 0);
>
> +#ifndef _WIN32
>  /**
>   * qtest_qmp_vsend_fds:
>   * @s: #QTestState instance to operate on.
> @@ -196,6 +201,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt,
> va_list ap)
>  void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
>                           const char *fmt, va_list ap)
>      G_GNUC_PRINTF(4, 0);
> +#endif /* _WIN32 */
>
>  /**
>   * qtest_qmp_vsend:
> @@ -743,6 +749,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, cons=
t
> char *drv,
>  void qtest_qmp_device_add(QTestState *qts, const char *driver, const cha=
r
> *id,
>                            const char *fmt, ...) G_GNUC_PRINTF(4, 5);
>
> +#ifndef _WIN32
>  /**
>   * qtest_qmp_add_client:
>   * @qts: QTestState instance to operate on
> @@ -752,6 +759,7 @@ void qtest_qmp_device_add(QTestState *qts, const char
> *driver, const char *id,
>   * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
>   */
>  void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)=
;
> +#endif /* _WIN32 */
>
>  /**
>   * qtest_qmp_device_del:
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index b7b7c9c541..1b24a4f1f7 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -594,17 +594,20 @@ int qtest_socket_server(const char *socket_path)
>      return sock;
>  }
>
> +#ifndef _WIN32
>  void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
>                           const char *fmt, va_list ap)
>  {
>      qmp_fd_vsend_fds(s->qmp_fd, fds, fds_num, fmt, ap);
>  }
> +#endif
>
>  void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
>  {
> -    qmp_fd_vsend_fds(s->qmp_fd, NULL, 0, fmt, ap);
> +    qmp_fd_vsend(s->qmp_fd, fmt, ap);
>  }
>
> +#ifndef _WIN32
>  QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
>                        const char *fmt, va_list ap)
>  {
> @@ -613,6 +616,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t
> fds_num,
>      /* Receive reply */
>      return qtest_qmp_receive(s);
>  }
> +#endif
>
>  QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
>  {
> @@ -622,6 +626,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt,
> va_list ap)
>      return qtest_qmp_receive(s);
>  }
>
> +#ifndef _WIN32
>  QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
>                       const char *fmt, ...)
>  {
> @@ -633,6 +638,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t
> fds_num,
>      va_end(ap);
>      return response;
>  }
> +#endif
>
>  QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
>  {
> @@ -1329,6 +1335,7 @@ void qtest_qmp_device_add(QTestState *qts, const
> char *driver, const char *id,
>      qobject_unref(args);
>  }
>
> +#ifndef _WIN32
>  void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
>  {
>      QDict *resp;
> @@ -1348,6 +1355,7 @@ void qtest_qmp_add_client(QTestState *qts, const
> char *protocol, int fd)
>      g_assert(!qdict_haskey(resp, "error"));
>      qobject_unref(resp);
>  }
> +#endif
>
>  /*
>   * Generic hot-unplugging test via the device_del QMP command.
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009fdc8105e78a0fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:38 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
libqmp.c::qmp_fd_vsend_fds() is not available on Windows, hence any<br>
APIs in libqtest that call libqmp.c::qmp_fd_vsend_fds() should be<br>
excluded for win32 too. This includes the following:<br>
<br>
=C2=A0 * qtest_qmp_vsend_fds()<br>
=C2=A0 * qtest_vqmp_fds()<br>
=C2=A0 * qtest_qmp_fds()<br>
=C2=A0 * qtest_qmp_add_client()<br>
<br>
Note qtest_qmp_vsend() was wrongly written to call qmp_fd_vsend_fds()<br>
previously, but it should call the non fds version API qmp_fd_vsend().<br><=
/blockquote><div><br></div><div>This doesn&#39;t look relevant anymore</div=
><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/libqtest.h |=C2=A0 8 ++++++++<br>
=C2=A0tests/qtest/libqtest.c | 10 +++++++++-<br>
=C2=A02 files changed, 17 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h<br>
index 94b187837d..3abc75964d 100644<br>
--- a/tests/qtest/libqtest.h<br>
+++ b/tests/qtest/libqtest.h<br>
@@ -94,6 +94,7 @@ void qtest_kill_qemu(QTestState *s);<br>
=C2=A0 */<br>
=C2=A0void qtest_quit(QTestState *s);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_fds:<br>
=C2=A0 * @s: #QTestState instance to operate on.<br>
@@ -108,6 +109,7 @@ void qtest_quit(QTestState *s);<br>
=C2=A0QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(4, 5);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp:<br>
@@ -152,6 +154,7 @@ void qtest_qmp_send_raw(QTestState *s, const char *fmt,=
 ...)<br>
=C2=A0 */<br>
=C2=A0int qtest_socket_server(const char *socket_path);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0/**<br>
=C2=A0 * qtest_vqmp_fds:<br>
=C2=A0 * @s: #QTestState instance to operate on.<br>
@@ -167,6 +170,7 @@ int qtest_socket_server(const char *socket_path);<br>
=C2=A0QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *fmt, va_list ap)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(4, 0);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0/**<br>
=C2=A0 * qtest_vqmp:<br>
@@ -181,6 +185,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t f=
ds_num,<br>
=C2=A0QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(2, 0);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_vsend_fds:<br>
=C2=A0 * @s: #QTestState instance to operate on.<br>
@@ -196,6 +201,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_li=
st ap)<br>
=C2=A0void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *fmt, va_list ap)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(4, 0);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_vsend:<br>
@@ -743,6 +749,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const =
char *drv,<br>
=C2=A0void qtest_qmp_device_add(QTestState *qts, const char *driver, const =
char *id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *fmt, ...) G_GNUC_PRINTF(4, 5);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_add_client:<br>
=C2=A0 * @qts: QTestState instance to operate on<br>
@@ -752,6 +759,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *=
driver, const char *id,<br>
=C2=A0 * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.<=
br>
=C2=A0 */<br>
=C2=A0void qtest_qmp_add_client(QTestState *qts, const char *protocol, int =
fd);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_device_del:<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index b7b7c9c541..1b24a4f1f7 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -594,17 +594,20 @@ int qtest_socket_server(const char *socket_path)<br>
=C2=A0 =C2=A0 =C2=A0return sock;<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *fmt, va_list ap)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qmp_fd_vsend_fds(s-&gt;qmp_fd, fds, fds_num, fmt, ap);<=
br>
=C2=A0}<br>
+#endif<br>
<br>
=C2=A0void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qmp_fd_vsend_fds(s-&gt;qmp_fd, NULL, 0, fmt, ap);<br>
+=C2=A0 =C2=A0 qmp_fd_vsend(s-&gt;qmp_fd, fmt, ap);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *fmt, va_list ap)<br>
=C2=A0{<br>
@@ -613,6 +616,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t f=
ds_num,<br>
=C2=A0 =C2=A0 =C2=A0/* Receive reply */<br>
=C2=A0 =C2=A0 =C2=A0return qtest_qmp_receive(s);<br>
=C2=A0}<br>
+#endif<br>
<br>
=C2=A0QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)<br>
=C2=A0{<br>
@@ -622,6 +626,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_li=
st ap)<br>
=C2=A0 =C2=A0 =C2=A0return qtest_qmp_receive(s);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *fmt, ...)<br>
=C2=A0{<br>
@@ -633,6 +638,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fd=
s_num,<br>
=C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
=C2=A0 =C2=A0 =C2=A0return response;<br>
=C2=A0}<br>
+#endif<br>
<br>
=C2=A0QDict *qtest_qmp(QTestState *s, const char *fmt, ...)<br>
=C2=A0{<br>
@@ -1329,6 +1335,7 @@ void qtest_qmp_device_add(QTestState *qts, const char=
 *driver, const char *id,<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(args);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0void qtest_qmp_add_client(QTestState *qts, const char *protocol, int =
fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QDict *resp;<br>
@@ -1348,6 +1355,7 @@ void qtest_qmp_add_client(QTestState *qts, const char=
 *protocol, int fd)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(!qdict_haskey(resp, &quot;error&quot;));<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(resp);<br>
=C2=A0}<br>
+#endif<br>
<br>
=C2=A0/*<br>
=C2=A0 * Generic hot-unplugging test via the device_del QMP command.<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009fdc8105e78a0fa8--

