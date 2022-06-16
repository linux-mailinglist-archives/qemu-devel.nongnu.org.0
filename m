Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E988F54E6AA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:08:04 +0200 (CEST)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1s2N-000808-Dn
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1rvo-0003H6-8O
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:01:17 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1rvm-0005eu-FE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:01:16 -0400
Received: by mail-lf1-x135.google.com with SMTP id be31so2870615lfb.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJkbT1Fg+qlLjrj2FdLYONACiI9re3dBO3drSJDA/kw=;
 b=mFnCJ7jhzuTZqqGn0mgnfn/ysVbuoRFvdhX3GBKwFJAw+96lxo6sy8iMZORzkhphMJ
 hS6EzIkCDqiLBselI60I47YvovDJllmkXy8CGu29XgDJAXMxvItFPoZpZCQWzgP2w4Ff
 8M2KPGA3kmHGz5QTONErZIuhF6P/uhOnxKqwQhGW4ptdlj2cf2zX6bMorcNH+6jX8wjT
 kywmeTajGW6wZKD96vMYvB3CW4ep5RUgjcYZX/5iV0uWDhg+ATFtvMTWalroWMpaUfj/
 7vc9t1Fu6VZ+4M4zXgbLOJfwQf/pjQpSDWv2lbozmnNYqvTq0cF9lXCIIVGnMiX8+Bqg
 2rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJkbT1Fg+qlLjrj2FdLYONACiI9re3dBO3drSJDA/kw=;
 b=izxzYjO4L0xqMj4Sl98fkOorspiIFoAZX87uBfxCwJfjiu65XyPPFgtb2I5NLwVhFS
 JjFgRYrSf3QMYxII1XX69hYlfDUOjdcy3LHSq1obvSoIVxINfAybRktCW4ymADDDA6Q9
 HMoVFX+UjZyaw5Tw3BaWFbnG/WWPWDqY35FVUyz5kr2SA9bAzoXHGyv1IOCxr9/+8MfF
 tun6nOd1GexUbMYrQDfg+Fnb0nJSAdPklnuAARsgfKZ6YqU/MYFoVNJLXWW6m4qvlRmK
 EVzc8PnczNGZ5dRVPxfl8l9B8FZPg/eqAgqTEwcDIwacLCxHPiAEmxUUEx0LYuwb5gkz
 V8PQ==
X-Gm-Message-State: AJIora+Aj8nr1zgHEUqJoOhUFF/cMXFYHX/G0+PcBxxmqX67tzY98yW5
 Ip+tDuhRj+gTHXGulv3TNp5WCSy0vPAS/6Yl6mY=
X-Google-Smtp-Source: AGRyM1uVyQ7FocIHzZorFap03CUhKJ09E1lAEuYqVrLEZMcHqjWMrdT8MnyeqyyNv2f8pYQ8ZLCgMfX4wCYb90A4bPw=
X-Received: by 2002:ac2:5c44:0:b0:479:11e1:36f7 with SMTP id
 s4-20020ac25c44000000b0047911e136f7mr3085179lfp.432.1655395272107; Thu, 16
 Jun 2022 09:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-14-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-14-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 20:01:00 +0400
Message-ID: <CAJ+F1CL8FVp9EVQm09CZdtqP-xzwim2+j3x2XTq42NZLuceHLg@mail.gmail.com>
Subject: Re: [PATCH V8 13/39] oslib: qemu_clear_cloexec
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000028297605e192bf41"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

--00000000000028297605e192bf41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 7:01 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Define qemu_clear_cloexec, analogous to qemu_set_cloexec.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  include/qemu/osdep.h | 1 +
>  util/oslib-posix.c   | 9 +++++++++
>  util/oslib-win32.c   | 4 ++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c..e916f3b 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -548,6 +548,7 @@ ssize_t qemu_write_full(int fd, const void *buf,
> size_t count)
>      G_GNUC_WARN_UNUSED_RESULT;
>
>  void qemu_set_cloexec(int fd);
> +void qemu_clear_cloexec(int fd);
>
>  /* Return a dynamically allocated directory path that is appropriate for
> storing
>   * local state.
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 7a34c16..421e987 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -261,6 +261,15 @@ void qemu_set_cloexec(int fd)
>      assert(f !=3D -1);
>  }
>
> +void qemu_clear_cloexec(int fd)
> +{
> +    int f;
> +    f =3D fcntl(fd, F_GETFD);
> +    assert(f !=3D -1);
> +    f =3D fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
> +    assert(f !=3D -1);
> +}
> +
>  char *
>  qemu_get_local_state_dir(void)
>  {
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 5723d3e..5bed148 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -226,6 +226,10 @@ void qemu_set_cloexec(int fd)
>  {
>  }
>
> +void qemu_clear_cloexec(int fd)
> +{
> +}
> +
>  int qemu_get_thread_id(void)
>  {
>      return GetCurrentThreadId();
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000028297605e192bf41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:01 PM Steve=
 Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@or=
acle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Define qemu_clear_cloexec, analogous to qemu_set_cloexec.<br>
<br>
Reviewed-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.c=
om" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockquote><div=
><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qemu/osdep.h | 1 +<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0| 9 +++++++++<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0| 4 ++++<br>
=C2=A03 files changed, 14 insertions(+)<br>
<br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index b1c161c..e916f3b 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -548,6 +548,7 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t=
 count)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_WARN_UNUSED_RESULT;<br>
<br>
=C2=A0void qemu_set_cloexec(int fd);<br>
+void qemu_clear_cloexec(int fd);<br>
<br>
=C2=A0/* Return a dynamically allocated directory path that is appropriate =
for storing<br>
=C2=A0 * local state.<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index 7a34c16..421e987 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -261,6 +261,15 @@ void qemu_set_cloexec(int fd)<br>
=C2=A0 =C2=A0 =C2=A0assert(f !=3D -1);<br>
=C2=A0}<br>
<br>
+void qemu_clear_cloexec(int fd)<br>
+{<br>
+=C2=A0 =C2=A0 int f;<br>
+=C2=A0 =C2=A0 f =3D fcntl(fd, F_GETFD);<br>
+=C2=A0 =C2=A0 assert(f !=3D -1);<br>
+=C2=A0 =C2=A0 f =3D fcntl(fd, F_SETFD, f &amp; ~FD_CLOEXEC);<br>
+=C2=A0 =C2=A0 assert(f !=3D -1);<br>
+}<br>
+<br>
=C2=A0char *<br>
=C2=A0qemu_get_local_state_dir(void)<br>
=C2=A0{<br>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
index 5723d3e..5bed148 100644<br>
--- a/util/oslib-win32.c<br>
+++ b/util/oslib-win32.c<br>
@@ -226,6 +226,10 @@ void qemu_set_cloexec(int fd)<br>
=C2=A0{<br>
=C2=A0}<br>
<br>
+void qemu_clear_cloexec(int fd)<br>
+{<br>
+}<br>
+<br>
=C2=A0int qemu_get_thread_id(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return GetCurrentThreadId();<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000028297605e192bf41--

