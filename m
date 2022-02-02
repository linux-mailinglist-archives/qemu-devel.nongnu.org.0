Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3E4A6A8A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:29:57 +0100 (CET)
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6LE-0006r6-7f
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF5un-0007bR-1x
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 22:02:37 -0500
Received: from [2607:f8b0:4864:20::931] (port=37415
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF5uk-0003Ul-6e
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 22:02:35 -0500
Received: by mail-ua1-x931.google.com with SMTP id b16so16749187uaq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 19:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYP/99EV9DtPS1RTHYMgPd32Jix5R7Dzie9sBA5XVKQ=;
 b=uPynO+qfCesSmgzHI/3FVjQVCmKY8Wkod7ZD1aUwZB6MB9qgozTZw1o7i63oeNffOx
 KV5HFCS39df3QgRm5GHNqfK2AuUix0UmNqKD/vKq75PrRYDkS8OQtIpdv6xh5CLtaoR2
 LDOHpKQG8TPrw79F50VBpmglBBaq4UVwvVl4behRaeMHv9jkRBSIbTr3W8SWBHU349Ve
 VxbrPaPYZ+KgU/chJEgElafvMbUbiVB+ye+wKtJWriPK3AiPfCYUi0zHgh/K+GqM19Ij
 45pxjhOOyfXZnWhNatk4+0uZ7r0puufJCa8iPTtpC/H5/I9m84nFvyGDf5U0LnjDIVYz
 HZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYP/99EV9DtPS1RTHYMgPd32Jix5R7Dzie9sBA5XVKQ=;
 b=V73eYUqzZJMXS2ZzhjDH5RW0/Hr3VTP084HEUp2YDChh/uj8FqRdhVbMGD92U7apvp
 v71raPZNUjaNAOOGXeWhtc7Wq6aJE79v4tawHwEm6Vhw8Ma8nGDLJ6oToUMTuccrxG3K
 oTsT/SYZ4Gd9qlwP+Q7PBzhag3wMX8AwFDp5j6+NLS7mt96g9ztyetXiz1X+Yx2rb2Qt
 LSM+4Uk7d3gbvNGqElH7QxXAOkjtjFck6G2JmqVI0wyBEtWygTlEpKTJW/QVjbqonEsA
 XIVR9hILCb3WBAcPyUFG0mK0GfvyQStcO3mJchFhB6b0JLwR1mRt+PK55mAh43JR0yPn
 mEXA==
X-Gm-Message-State: AOAM531z5RjPlkV19npN+5sCNUPwhymLB2yAurlLkxDFPHp2Ms10iX1h
 J9xA1xDN3CdpdQRxFvH2oOIp2mX7R7e6u9j8TAaclA==
X-Google-Smtp-Source: ABdhPJy9R/H2O3DF/8RXYko3KOzwo7dF/QQdGAXhcuJQOGv84o/zvRavN1J5SgqOEFXM3olXWNxhuG3eaA21yxYSH2o=
X-Received: by 2002:a67:dd17:: with SMTP id y23mr9696617vsj.77.1643770952690; 
 Tue, 01 Feb 2022 19:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-21-imp@bsdimp.com>
 <9863981c-9040-6eff-27e6-6629d94069a5@linaro.org>
In-Reply-To: <9863981c-9040-6eff-27e6-6629d94069a5@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 20:02:26 -0700
Message-ID: <CANCZdfo3-APWNr+cu3P=uD7-gYJvDSFqHeE98dutN26ACSd7Bg@mail.gmail.com>
Subject: Re: [PATCH 20/22] bsd-user/bsd-file.h: Add implementations for read, 
 pread, readv and preadv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ba442205d7003f0a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 Gleb Popov <arrowd@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Konrad Witaszczyk <def@freebsd.org>,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ba442205d7003f0a
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 2:37 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/1/22 22:14, Warner Losh wrote:
> > Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system
> > call table.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/bsd-file.h           | 79 +++++++++++++++++++++++++++++++++++
> >   bsd-user/freebsd/os-syscall.c | 24 +++++++++++
> >   2 files changed, 103 insertions(+)
> >
> > diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> > index 2f743db38e1..5934cbd5612 100644
> > --- a/bsd-user/bsd-file.h
> > +++ b/bsd-user/bsd-file.h
> > @@ -36,4 +36,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong
> target_addr, int count,
> >   extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int
> count,
> >           int copy);
> >
> > +ssize_t safe_read(int fd, void *buf, size_t nbytes);
> > +ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
> > +ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
> > +ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t
> offset);
> > +
> > +/* read(2) */
> > +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2,
> abi_long arg3)
> > +{
> > +    abi_long ret;
> > +    void *p;
> > +
> > +    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> > +    if (p == NULL) {
> > +        return -TARGET_EFAULT;
> > +    }
> > +    ret = get_errno(safe_read(arg1, p, arg3));
> > +    unlock_user(p, arg2, ret);
> > +
> > +    return ret;
> > +}
> > +
> > +/* pread(2) */
> > +static inline abi_long do_bsd_pread(void *cpu_env, abi_long arg1,
> > +    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
> abi_long arg6)
> > +{
> > +    abi_long ret;
> > +    void *p;
> > +
> > +    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> > +    if (p == NULL) {
> > +        return -TARGET_EFAULT;
> > +    }
> > +    if (regpairs_aligned(cpu_env) != 0) {
> > +        arg4 = arg5;
> > +        arg5 = arg6;
> > +    }
>
> This would be clearer if you had started labeling from arg0.
>

There's a number of other changes this would force, so I'll defer
it...

Warner


> But either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
> > +    ret = get_errno(safe_pread(arg1, p, arg3, target_arg64(arg4,
> arg5)));
> > +    unlock_user(p, arg2, ret);
> > +
> > +    return ret;
> > +}
> > +
> > +/* readv(2) */
> > +static inline abi_long do_bsd_readv(abi_long arg1, abi_long arg2,
> abi_long arg3)
> > +{
> > +    abi_long ret;
> > +    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 0);
> > +
> > +    if (vec != NULL) {
> > +        ret = get_errno(safe_readv(arg1, vec, arg3));
> > +        unlock_iovec(vec, arg2, arg3, 1);
> > +    } else {
> > +        ret = -host_to_target_errno(errno);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +/* preadv(2) */
> > +static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
> > +    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
> abi_long arg6)
> > +{
> > +    abi_long ret;
> > +    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 1);
> > +
> > +    if (vec != NULL) {
> > +        if (regpairs_aligned(cpu_env) != 0) {
> > +            arg4 = arg5;
> > +            arg5 = arg6;
> > +        }
> > +        ret = get_errno(safe_preadv(arg1, vec, arg3, target_arg64(arg4,
> arg5)));
> > +        unlock_iovec(vec, arg2, arg3, 0);
> > +    } else {
> > +        ret = -host_to_target_errno(errno);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >   #endif /* !BSD_FILE_H_ */
> > diff --git a/bsd-user/freebsd/os-syscall.c
> b/bsd-user/freebsd/os-syscall.c
> > index fcfa6221182..dda79af53de 100644
> > --- a/bsd-user/freebsd/os-syscall.c
> > +++ b/bsd-user/freebsd/os-syscall.c
> > @@ -42,6 +42,14 @@
> >
> >   #include "bsd-file.h"
> >
> > +/* I/O */
> > +safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
> > +safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes,
> off_t,
> > +    offset);
> > +safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int,
> iovcnt);
> > +safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int,
> iovcnt,
> > +    off_t, offset);
> > +
> >   void target_set_brk(abi_ulong new_brk)
> >   {
> >   }
> > @@ -212,6 +220,22 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
> >       }
> >
> >       switch (num) {
> > +
> > +        /*
> > +         * File system calls.
> > +         */
> > +    case TARGET_FREEBSD_NR_read: /* read(2) */
> > +        ret = do_bsd_read(arg1, arg2, arg3);
> > +        break;
> > +
> > +    case TARGET_FREEBSD_NR_pread: /* pread(2) */
> > +        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
> > +        break;
> > +
> > +    case TARGET_FREEBSD_NR_readv: /* readv(2) */
> > +        ret = do_bsd_readv(arg1, arg2, arg3);
> > +        break;
> > +
> >       default:
> >           gemu_log("qemu: unsupported syscall: %d\n", num);
> >           ret = -TARGET_ENOSYS;
>
>

--000000000000ba442205d7003f0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 2:37 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2/1/22 22:14, Warner Losh wrote:<br>
&gt; Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system=
<br>
&gt; call table.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;kevans@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/bsd-file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 79 +++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.c | 24 +++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 103 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h<br>
&gt; index 2f743db38e1..5934cbd5612 100644<br>
&gt; --- a/bsd-user/bsd-file.h<br>
&gt; +++ b/bsd-user/bsd-file.h<br>
&gt; @@ -36,4 +36,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong=
 target_addr, int count,<br>
&gt;=C2=A0 =C2=A0extern void unlock_iovec(struct iovec *vec, abi_ulong targ=
et_addr, int count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int copy);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +ssize_t safe_read(int fd, void *buf, size_t nbytes);<br>
&gt; +ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);<b=
r>
&gt; +ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);<br>
&gt; +ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_=
t offset);<br>
&gt; +<br>
&gt; +/* read(2) */<br>
&gt; +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_=
long arg3)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 void *p;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 p =3D lock_user(VERIFY_WRITE, arg2, arg3, 0);<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D get_errno(safe_read(arg1, p, arg3));<br>
&gt; +=C2=A0 =C2=A0 unlock_user(p, arg2, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* pread(2) */<br>
&gt; +static inline abi_long do_bsd_pread(void *cpu_env, abi_long arg1,<br>
&gt; +=C2=A0 =C2=A0 abi_long arg2, abi_long arg3, abi_long arg4, abi_long a=
rg5, abi_long arg6)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 void *p;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 p =3D lock_user(VERIFY_WRITE, arg2, arg3, 0);<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (regpairs_aligned(cpu_env) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg4 =3D arg5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg5 =3D arg6;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This would be clearer if you had started labeling from arg0.<br></blockquot=
e><div><br></div><div>There&#39;s a number of other changes this would forc=
e, so I&#39;ll defer</div><div>it...</div><div><br></div><div>Warner<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
But either way,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D get_errno(safe_pread(arg1, p, arg3, target_arg6=
4(arg4, arg5)));<br>
&gt; +=C2=A0 =C2=A0 unlock_user(p, arg2, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* readv(2) */<br>
&gt; +static inline abi_long do_bsd_readv(abi_long arg1, abi_long arg2, abi=
_long arg3)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 struct iovec *vec =3D lock_iovec(VERIFY_WRITE, arg2, ar=
g3, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (vec !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_readv(arg1, vec, a=
rg3));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_iovec(vec, arg2, arg3, 1);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -host_to_target_errno(errno);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* preadv(2) */<br>
&gt; +static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,<br=
>
&gt; +=C2=A0 =C2=A0 abi_long arg2, abi_long arg3, abi_long arg4, abi_long a=
rg5, abi_long arg6)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 struct iovec *vec =3D lock_iovec(VERIFY_WRITE, arg2, ar=
g3, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (vec !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (regpairs_aligned(cpu_env) !=3D 0) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg4 =3D arg5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg5 =3D arg6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_preadv(arg1, vec, =
arg3, target_arg64(arg4, arg5)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_iovec(vec, arg2, arg3, 0);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -host_to_target_errno(errno);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif /* !BSD_FILE_H_ */<br>
&gt; diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-sysca=
ll.c<br>
&gt; index fcfa6221182..dda79af53de 100644<br>
&gt; --- a/bsd-user/freebsd/os-syscall.c<br>
&gt; +++ b/bsd-user/freebsd/os-syscall.c<br>
&gt; @@ -42,6 +42,14 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;bsd-file.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* I/O */<br>
&gt; +safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);<b=
r>
&gt; +safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes, o=
ff_t,<br>
&gt; +=C2=A0 =C2=A0 offset);<br>
&gt; +safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int=
, iovcnt);<br>
&gt; +safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, in=
t, iovcnt,<br>
&gt; +=C2=A0 =C2=A0 off_t, offset);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0void target_set_brk(abi_ulong new_brk)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -212,6 +220,22 @@ abi_long do_freebsd_syscall(void *cpu_env, int nu=
m, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (num) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* File system calls.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_read: /* read(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_read(arg1, arg2, arg3);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_pread: /* pread(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_pread(cpu_env, arg1, arg2,=
 arg3, arg4, arg5, arg6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_readv: /* readv(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_readv(arg1, arg2, arg3);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gemu_log(&quot;qemu: unsupport=
ed syscall: %d\n&quot;, num);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_ENOSYS;<br>
<br>
</blockquote></div></div>

--000000000000ba442205d7003f0a--

