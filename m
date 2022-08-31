Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77215A7C56
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 13:42:30 +0200 (CEST)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTM71-0002Ek-RD
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 07:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTM1x-0007Dk-79
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:37:13 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTM1u-0003Ng-Lk
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:37:12 -0400
Received: by mail-lj1-x232.google.com with SMTP id p18so10980774ljc.9
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dLj2+Y/Xyjz2ACLe74WLwJ7rb+Ql308Eug4j4Jbt74g=;
 b=YEiWCvDrL6oj5y3doaJ0HdKz66E6FU/ZW61wLtkyMVYFVs19k3niualIna9V5G3dhF
 A14SrbVJxT+xCIr0mQVOSWgaxTeL8Qf3/gO/VV4yIn+ey+7sltpLK4d0RqmH3lWYAPfa
 Q4wzKm7KlWzJPIig7FPoihwQ7wIjZxNEdRJBvJOC41J7j9hHCubjxFEdRswwJJs3Tm4c
 UELMG1IL+vue7tFpc0bhLK7LCLLW0g8CLdkhegAMzEjsufmfn1TfdnLpmVkK6rHNjqQR
 /cVNSau+DOQXCWOiUGlr41xrJoWDASr2sxazUMGfq+XqZ1KOWjNtCz6EOJiMc02Eovjk
 uTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dLj2+Y/Xyjz2ACLe74WLwJ7rb+Ql308Eug4j4Jbt74g=;
 b=0VCm4zpEBN1oRdQx9W8JHeyor/hNNNwurhmsvr4/fMpU3e0nX3HhGfjDGHna39OT3N
 pr0vXiqa5bNVgZivYs4PIV4Ssc4CuOxHuUYwh9JyhsA9bitBKtocc53tRczt87AlDuPK
 QPxGPTnhts5kijFEG5lqy4L7J1CRqeRN8wVswnROHqE8pSSu8McdBLuiDt104qw7/XF/
 6ny0Wgm+pK1lK32XMMDbINHMDKdwEaoFM9qOmvg4FYSmQLWbx1kniWnl+ZP1YSAS/f3T
 6DIgjD7Dc9c8C+1fV3KWKwIQg1HHuxSneIJwGBDXPUL5/YdB1pUVtyDaGRPEfkA6wg91
 NVBQ==
X-Gm-Message-State: ACgBeo2hUlrRBy4fatHMzSzsGsXfktkiohL0LIL9NBok1h6Gtc/01+YD
 WLk4jRWPJNuZiOSl7IQ7Z0sCmCl70Ffan3PYG/4=
X-Google-Smtp-Source: AA6agR7K7DvgPuZ4MpfjowzXwjGBvNr4BKiUJ0dYEaoOu7f3rF1nVOvOuHcqMyIEvINuGf37AQ4FeOYO4piIkK8EbWU=
X-Received: by 2002:a2e:9942:0:b0:265:e313:7fb7 with SMTP id
 r2-20020a2e9942000000b00265e3137fb7mr3474218ljj.449.1661945828541; Wed, 31
 Aug 2022 04:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220826154602.362516-1-stefanb@linux.ibm.com>
 <20220826154602.362516-2-stefanb@linux.ibm.com>
In-Reply-To: <20220826154602.362516-2-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 15:36:57 +0400
Message-ID: <CAJ+F1CK+Vk4zH_pejF_N3-H=2imOsen1u0NinoE7AW1cqLYM-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] tpm_emulator: Use latest tpm_ioctl.h from swtpm
 project
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bf087305e787ea7d"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

--000000000000bf087305e787ea7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 7:52 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:

> Use the latest tpm_ioctl.h from upstream swtpm project.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  backends/tpm/tpm_ioctl.h | 96 +++++++++++++++++++++++++++++++---------
>  1 file changed, 76 insertions(+), 20 deletions(-)
>
> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> index bd6c12cb86..20b1c7965a 100644
> --- a/backends/tpm/tpm_ioctl.h
> +++ b/backends/tpm/tpm_ioctl.h
> @@ -5,11 +5,16 @@
>   *
>   * This file is licensed under the terms of the 3-clause BSD license
>   */
> +#ifndef _TPM_IOCTL_H_
> +#define _TPM_IOCTL_H_
>
> -#ifndef TPM_IOCTL_H
> -#define TPM_IOCTL_H
> +#if defined(__CYGWIN__)
> +# define __USE_LINUX_IOCTL_DEFS
> +#endif
>
> +#include <stdint.h>
>  #include <sys/uio.h>
> +#include <sys/types.h>
>  #include <sys/ioctl.h>
>
>  #ifdef HAVE_SYS_IOCCOM_H
> @@ -194,6 +199,48 @@ struct ptm_setbuffersize {
>      } u;
>  };
>
> +#define PTM_GETINFO_SIZE (3 * 1024)
> +/*
> + * PTM_GET_INFO: Get info about the TPM implementation (from libtpms)
> + *
> + * This request allows to indirectly call TPMLIB_GetInfo(flags) and
> + * retrieve information from libtpms.
> + * Only one transaction is currently necessary for returning results
> + * to a client. Therefore, totlength and length will be the same if
> + * offset is 0.
> + */
> +struct ptm_getinfo {
> +    union {
> +        struct {
> +            uint64_t flags;
> +            uint32_t offset;      /* offset from where to read */
> +            uint32_t pad;         /* 32 bit arch */
> +        } req; /* request */
> +        struct {
> +            ptm_res tpm_result;
> +            uint32_t totlength;
> +            uint32_t length;
> +            char buffer[PTM_GETINFO_SIZE];
> +        } resp; /* response */
> +    } u;
> +};
> +
> +#define SWTPM_INFO_TPMSPECIFICATION ((uint64_t)1 << 0)
> +#define SWTPM_INFO_TPMATTRIBUTES    ((uint64_t)1 << 1)
> +
> +/*
> + * PTM_LOCK_STORAGE: Lock the storage and retry n times
> + */
> +struct ptm_lockstorage {
> +    union {
> +        struct {
> +            uint32_t retries; /* number of retries */
> +        } req; /* request */
> +        struct {
> +            ptm_res tpm_result;
> +        } resp; /* reponse */
> +    } u;
> +};
>
>  typedef uint64_t ptm_cap;
>  typedef struct ptm_est ptm_est;
> @@ -205,6 +252,8 @@ typedef struct ptm_getstate ptm_getstate;
>  typedef struct ptm_setstate ptm_setstate;
>  typedef struct ptm_getconfig ptm_getconfig;
>  typedef struct ptm_setbuffersize ptm_setbuffersize;
> +typedef struct ptm_getinfo ptm_getinfo;
> +typedef struct ptm_lockstorage ptm_lockstorage;
>
>  /* capability flags returned by PTM_GET_CAPABILITY */
>  #define PTM_CAP_INIT               (1)
> @@ -221,6 +270,9 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
>  #define PTM_CAP_GET_CONFIG         (1 << 11)
>  #define PTM_CAP_SET_DATAFD         (1 << 12)
>  #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
> +#define PTM_CAP_GET_INFO           (1 << 14)
> +#define PTM_CAP_SEND_COMMAND_HEADER (1 << 15)
> +#define PTM_CAP_LOCK_STORAGE       (1 << 16)
>
>  enum {
>      PTM_GET_CAPABILITY     =3D _IOR('P', 0, ptm_cap),
> @@ -240,6 +292,8 @@ enum {
>      PTM_GET_CONFIG         =3D _IOR('P', 14, ptm_getconfig),
>      PTM_SET_DATAFD         =3D _IOR('P', 15, ptm_res),
>      PTM_SET_BUFFERSIZE     =3D _IOWR('P', 16, ptm_setbuffersize),
> +    PTM_GET_INFO           =3D _IOWR('P', 17, ptm_getinfo),
> +    PTM_LOCK_STORAGE       =3D _IOWR('P', 18, ptm_lockstorage),
>  };
>
>  /*
> @@ -253,23 +307,25 @@ enum {
>   * and ptm_set_state:u.req.data) are 0xffffffff.
>   */
>  enum {
> -    CMD_GET_CAPABILITY =3D 1,
> -    CMD_INIT,
> -    CMD_SHUTDOWN,
> -    CMD_GET_TPMESTABLISHED,
> -    CMD_SET_LOCALITY,
> -    CMD_HASH_START,
> -    CMD_HASH_DATA,
> -    CMD_HASH_END,
> -    CMD_CANCEL_TPM_CMD,
> -    CMD_STORE_VOLATILE,
> -    CMD_RESET_TPMESTABLISHED,
> -    CMD_GET_STATEBLOB,
> -    CMD_SET_STATEBLOB,
> -    CMD_STOP,
> -    CMD_GET_CONFIG,
> -    CMD_SET_DATAFD,
> -    CMD_SET_BUFFERSIZE,
> +    CMD_GET_CAPABILITY =3D 1,   /* 0x01 */
> +    CMD_INIT,                 /* 0x02 */
> +    CMD_SHUTDOWN,             /* 0x03 */
> +    CMD_GET_TPMESTABLISHED,   /* 0x04 */
> +    CMD_SET_LOCALITY,         /* 0x05 */
> +    CMD_HASH_START,           /* 0x06 */
> +    CMD_HASH_DATA,            /* 0x07 */
> +    CMD_HASH_END,             /* 0x08 */
> +    CMD_CANCEL_TPM_CMD,       /* 0x09 */
> +    CMD_STORE_VOLATILE,       /* 0x0a */
> +    CMD_RESET_TPMESTABLISHED, /* 0x0b */
> +    CMD_GET_STATEBLOB,        /* 0x0c */
> +    CMD_SET_STATEBLOB,        /* 0x0d */
> +    CMD_STOP,                 /* 0x0e */
> +    CMD_GET_CONFIG,           /* 0x0f */
> +    CMD_SET_DATAFD,           /* 0x10 */
> +    CMD_SET_BUFFERSIZE,       /* 0x11 */
> +    CMD_GET_INFO,             /* 0x12 */
> +    CMD_LOCK_STORAGE,         /* 0x13 */
>  };
>
> -#endif /* TPM_IOCTL_H */
> +#endif /* _TPM_IOCTL_H_ */
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bf087305e787ea7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 7:52 PM Stefa=
n Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Use the latest tpm_ioctl.h from upstream swtpm project.<br>
<br>
Signed-off-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com" t=
arget=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0backends/tpm/tpm_ioctl.h | 96 +++++++++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 76 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h<br>
index bd6c12cb86..20b1c7965a 100644<br>
--- a/backends/tpm/tpm_ioctl.h<br>
+++ b/backends/tpm/tpm_ioctl.h<br>
@@ -5,11 +5,16 @@<br>
=C2=A0 *<br>
=C2=A0 * This file is licensed under the terms of the 3-clause BSD license<=
br>
=C2=A0 */<br>
+#ifndef _TPM_IOCTL_H_<br>
+#define _TPM_IOCTL_H_<br>
<br>
-#ifndef TPM_IOCTL_H<br>
-#define TPM_IOCTL_H<br>
+#if defined(__CYGWIN__)<br>
+# define __USE_LINUX_IOCTL_DEFS<br>
+#endif<br>
<br>
+#include &lt;stdint.h&gt;<br>
=C2=A0#include &lt;sys/uio.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
<br>
=C2=A0#ifdef HAVE_SYS_IOCCOM_H<br>
@@ -194,6 +199,48 @@ struct ptm_setbuffersize {<br>
=C2=A0 =C2=A0 =C2=A0} u;<br>
=C2=A0};<br>
<br>
+#define PTM_GETINFO_SIZE (3 * 1024)<br>
+/*<br>
+ * PTM_GET_INFO: Get info about the TPM implementation (from libtpms)<br>
+ *<br>
+ * This request allows to indirectly call TPMLIB_GetInfo(flags) and<br>
+ * retrieve information from libtpms.<br>
+ * Only one transaction is currently necessary for returning results<br>
+ * to a client. Therefore, totlength and length will be the same if<br>
+ * offset is 0.<br>
+ */<br>
+struct ptm_getinfo {<br>
+=C2=A0 =C2=A0 union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t offset;=C2=A0 =C2=A0 =
=C2=A0 /* offset from where to read */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pad;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* 32 bit arch */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } req; /* request */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptm_res tpm_result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t totlength;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t length;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char buffer[PTM_GETINFO_SIZE];<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } resp; /* response */<br>
+=C2=A0 =C2=A0 } u;<br>
+};<br>
+<br>
+#define SWTPM_INFO_TPMSPECIFICATION ((uint64_t)1 &lt;&lt; 0)<br>
+#define SWTPM_INFO_TPMATTRIBUTES=C2=A0 =C2=A0 ((uint64_t)1 &lt;&lt; 1)<br>
+<br>
+/*<br>
+ * PTM_LOCK_STORAGE: Lock the storage and retry n times<br>
+ */<br>
+struct ptm_lockstorage {<br>
+=C2=A0 =C2=A0 union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t retries; /* number of r=
etries */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } req; /* request */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptm_res tpm_result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } resp; /* reponse */<br>
+=C2=A0 =C2=A0 } u;<br>
+};<br>
<br>
=C2=A0typedef uint64_t ptm_cap;<br>
=C2=A0typedef struct ptm_est ptm_est;<br>
@@ -205,6 +252,8 @@ typedef struct ptm_getstate ptm_getstate;<br>
=C2=A0typedef struct ptm_setstate ptm_setstate;<br>
=C2=A0typedef struct ptm_getconfig ptm_getconfig;<br>
=C2=A0typedef struct ptm_setbuffersize ptm_setbuffersize;<br>
+typedef struct ptm_getinfo ptm_getinfo;<br>
+typedef struct ptm_lockstorage ptm_lockstorage;<br>
<br>
=C2=A0/* capability flags returned by PTM_GET_CAPABILITY */<br>
=C2=A0#define PTM_CAP_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1)<br>
@@ -221,6 +270,9 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;<br>
=C2=A0#define PTM_CAP_GET_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t; 11)<br>
=C2=A0#define PTM_CAP_SET_DATAFD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t; 12)<br>
=C2=A0#define PTM_CAP_SET_BUFFERSIZE=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 13)<br>
+#define PTM_CAP_GET_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t; 14)<br>
+#define PTM_CAP_SEND_COMMAND_HEADER (1 &lt;&lt; 15)<br>
+#define PTM_CAP_LOCK_STORAGE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 16)<br>
<br>
=C2=A0enum {<br>
=C2=A0 =C2=A0 =C2=A0PTM_GET_CAPABILITY=C2=A0 =C2=A0 =C2=A0=3D _IOR(&#39;P&#=
39;, 0, ptm_cap),<br>
@@ -240,6 +292,8 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0PTM_GET_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D _IO=
R(&#39;P&#39;, 14, ptm_getconfig),<br>
=C2=A0 =C2=A0 =C2=A0PTM_SET_DATAFD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D _IO=
R(&#39;P&#39;, 15, ptm_res),<br>
=C2=A0 =C2=A0 =C2=A0PTM_SET_BUFFERSIZE=C2=A0 =C2=A0 =C2=A0=3D _IOWR(&#39;P&=
#39;, 16, ptm_setbuffersize),<br>
+=C2=A0 =C2=A0 PTM_GET_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D _IO=
WR(&#39;P&#39;, 17, ptm_getinfo),<br>
+=C2=A0 =C2=A0 PTM_LOCK_STORAGE=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D _IOWR(&#39;P&=
#39;, 18, ptm_lockstorage),<br>
=C2=A0};<br>
<br>
=C2=A0/*<br>
@@ -253,23 +307,25 @@ enum {<br>
=C2=A0 * and ptm_set_state:u.req.data) are 0xffffffff.<br>
=C2=A0 */<br>
=C2=A0enum {<br>
-=C2=A0 =C2=A0 CMD_GET_CAPABILITY =3D 1,<br>
-=C2=A0 =C2=A0 CMD_INIT,<br>
-=C2=A0 =C2=A0 CMD_SHUTDOWN,<br>
-=C2=A0 =C2=A0 CMD_GET_TPMESTABLISHED,<br>
-=C2=A0 =C2=A0 CMD_SET_LOCALITY,<br>
-=C2=A0 =C2=A0 CMD_HASH_START,<br>
-=C2=A0 =C2=A0 CMD_HASH_DATA,<br>
-=C2=A0 =C2=A0 CMD_HASH_END,<br>
-=C2=A0 =C2=A0 CMD_CANCEL_TPM_CMD,<br>
-=C2=A0 =C2=A0 CMD_STORE_VOLATILE,<br>
-=C2=A0 =C2=A0 CMD_RESET_TPMESTABLISHED,<br>
-=C2=A0 =C2=A0 CMD_GET_STATEBLOB,<br>
-=C2=A0 =C2=A0 CMD_SET_STATEBLOB,<br>
-=C2=A0 =C2=A0 CMD_STOP,<br>
-=C2=A0 =C2=A0 CMD_GET_CONFIG,<br>
-=C2=A0 =C2=A0 CMD_SET_DATAFD,<br>
-=C2=A0 =C2=A0 CMD_SET_BUFFERSIZE,<br>
+=C2=A0 =C2=A0 CMD_GET_CAPABILITY =3D 1,=C2=A0 =C2=A0/* 0x01 */<br>
+=C2=A0 =C2=A0 CMD_INIT,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* 0x02 */<br>
+=C2=A0 =C2=A0 CMD_SHUTDOWN,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* 0x03 */<br>
+=C2=A0 =C2=A0 CMD_GET_TPMESTABLISHED,=C2=A0 =C2=A0/* 0x04 */<br>
+=C2=A0 =C2=A0 CMD_SET_LOCALITY,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0x05 *=
/<br>
+=C2=A0 =C2=A0 CMD_HASH_START,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0=
x06 */<br>
+=C2=A0 =C2=A0 CMD_HASH_DATA,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0=
x07 */<br>
+=C2=A0 =C2=A0 CMD_HASH_END,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* 0x08 */<br>
+=C2=A0 =C2=A0 CMD_CANCEL_TPM_CMD,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0x09 */<br>
+=C2=A0 =C2=A0 CMD_STORE_VOLATILE,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0x0a */<br>
+=C2=A0 =C2=A0 CMD_RESET_TPMESTABLISHED, /* 0x0b */<br>
+=C2=A0 =C2=A0 CMD_GET_STATEBLOB,=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0x0c */<br>
+=C2=A0 =C2=A0 CMD_SET_STATEBLOB,=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0x0d */<br>
+=C2=A0 =C2=A0 CMD_STOP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* 0x0e */<br>
+=C2=A0 =C2=A0 CMD_GET_CONFIG,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0=
x0f */<br>
+=C2=A0 =C2=A0 CMD_SET_DATAFD,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0=
x10 */<br>
+=C2=A0 =C2=A0 CMD_SET_BUFFERSIZE,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0x11 */<br>
+=C2=A0 =C2=A0 CMD_GET_INFO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* 0x12 */<br>
+=C2=A0 =C2=A0 CMD_LOCK_STORAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0x13 *=
/<br>
=C2=A0};<br>
<br>
-#endif /* TPM_IOCTL_H */<br>
+#endif /* _TPM_IOCTL_H_ */<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bf087305e787ea7d--

