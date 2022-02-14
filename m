Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC74B551E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:47:02 +0100 (CET)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdZ6-0005wN-KA
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:47:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1nJdWJ-00031H-PR
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1nJdWC-0006yw-LD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644853433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/pWqSYrFnbdgoYRmzb/cyWNWM9OAKs1hpNENREmDcI=;
 b=Z2kRhSPCsWWdNirL8MG3wyhRrml1AM0IbTl8TR03IBLWFfxSZ1s6wZsgXgRB9wWZbPknTB
 wTWXVelXl434YnVyxz+RL1rch9nWRtefXnAi2wU9STifcvLNSliiR2NWtfGwoIv5+OEhRN
 c/meCgia4X5Cz9+PoyXjsCKx7hNzY1Q=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-lWuSn5KSMf2fqftijs8WIg-1; Mon, 14 Feb 2022 10:43:51 -0500
X-MC-Unique: lWuSn5KSMf2fqftijs8WIg-1
Received: by mail-oo1-f70.google.com with SMTP id
 n8-20020a4abd08000000b002eabaaab571so10816326oop.11
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/pWqSYrFnbdgoYRmzb/cyWNWM9OAKs1hpNENREmDcI=;
 b=nto7h9E4kZRpdz2/DzUORBL0d3iVpGrqLUCCNRzwcp+3dEOUVIlAg8cS4Rhq1kXZ1d
 g2ZSrdUNKeZ9E61Wwdy35vqKM2hZWyiFHTQeCji+5C+Eds0kVrwkEttgZEqEPMktiBbL
 RBtaw5sZOJw/I9iZAJBmprbdARp3e3OFOup8sjykfdBp2Y27mp34/19x5FuBERhhQPHN
 xO0Q9Pp/v3m7/uE55VBKkc5JO1gIdZ+FLtA5cQf+GutXwo52oHuXz8aK7IGrTf3rRrZ5
 YzI2tgnVWyzTrIezlCCmcbaBvbPZrMvFyFsDbENCoIJaqCoLLiiv2bIeECJQh0SvDl68
 AGsw==
X-Gm-Message-State: AOAM532RzCOKoKcaxGM3FblWgfcRtGpv86MsIkBw4AxKgrRcy5dgyoLe
 jXMCiEvX+74kaRNvyYOIdi2fuOzpoWZJP6tsOT5feTvqurQ3Yko7ZsniZPJ3qJpvNZHGO4Lg39m
 rR/r4xV51Han5p3az5B7SGlC1c9jyDVo=
X-Received: by 2002:a05:6830:12c1:: with SMTP id
 a1mr135036otq.374.1644853431220; 
 Mon, 14 Feb 2022 07:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGxqNMpwzFuFCIa4KCD4PZ9ZJnbbf4BxL8hkSLmxX9TArZAp71hlDRfYpXhbX9wfQI0JTbLI51gRGFZWIFCY4=
X-Received: by 2002:a05:6830:12c1:: with SMTP id
 a1mr135027otq.374.1644853430964; 
 Mon, 14 Feb 2022 07:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20220214135820.43897-1-groug@kaod.org>
 <20220214135820.43897-2-groug@kaod.org>
In-Reply-To: <20220214135820.43897-2-groug@kaod.org>
From: German Maglione <gmaglione@redhat.com>
Date: Mon, 14 Feb 2022 16:43:15 +0100
Message-ID: <CAJh=p+6ALJA_UazTGoPbmF09AEnecppDvaFVJT2bOK-R6_0WBw@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v5 1/3] virtiofsd: Add support for FUSE_SYNCFS
 request with announce_submounts
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gmaglion@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000075e33405d7fc48c8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gmaglion@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000075e33405d7fc48c8
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 3:00 PM Greg Kurz <groug@kaod.org> wrote:

> Honor the expected behavior of syncfs() to synchronously flush all data
> and metadata to disk on linux systems.
>
> If virtiofsd is started with '-o announce_submounts', the client is
> expected to send a FUSE_SYNCFS request for each individual submount.
> In this case, we just create a new file descriptor on the submount
> inode with lo_inode_open(), call syncfs() on it and close it. The
> intermediary file is needed because O_PATH descriptors aren't
> backed by an actual file and syncfs() would fail with EBADF.
>
> If virtiofsd is started without '-o announce_submounts' or if the
> client doesn't have the FUSE_CAP_SUBMOUNTS capability, the client
> only sends a single FUSE_SYNCFS request for the root inode. The
> server would thus need to track submounts internally and call
> syncfs() on each of them. This will be implemented later.
>
> Note that syncfs() might suffer from a time penalty if the submounts
> are being hammered by some unrelated workload on the host. The only
> solution to prevent that is to avoid shared mounts.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/fuse_lowlevel.c       | 11 +++++++
>  tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++
>  tools/virtiofsd/passthrough_ll.c      | 45 +++++++++++++++++++++++++++
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  4 files changed, 70 insertions(+)
>
> diff --git a/tools/virtiofsd/fuse_lowlevel.c
> b/tools/virtiofsd/fuse_lowlevel.c
> index e4679c73abc2..e02d8b25a5f6 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1876,6 +1876,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t
> nodeid,
>      }
>  }
>
> +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> +                      struct fuse_mbuf_iter *iter)
> +{
> +    if (req->se->op.syncfs) {
> +        req->se->op.syncfs(req, nodeid);
> +    } else {
> +        fuse_reply_err(req, ENOSYS);
> +    }
> +}
> +
>  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>                      struct fuse_mbuf_iter *iter)
>  {
> @@ -2280,6 +2290,7 @@ static struct {
>      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
>      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
>      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
>  };
>
>  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> diff --git a/tools/virtiofsd/fuse_lowlevel.h
> b/tools/virtiofsd/fuse_lowlevel.h
> index c55c0ca2fc1c..b889dae4de0e 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {
>       */
>      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>                    struct fuse_file_info *fi);
> +
> +    /**
> +     * Synchronize file system content
> +     *
> +     * If this request is answered with an error code of ENOSYS,
> +     * this is treated as success and future calls to syncfs() will
> +     * succeed automatically without being sent to the filesystem
> +     * process.
> +     *
> +     * @param req request handle
> +     * @param ino the inode number
> +     */
> +    void (*syncfs)(fuse_req_t req, fuse_ino_t ino);
>  };
>
>  /**
> diff --git a/tools/virtiofsd/passthrough_ll.c
> b/tools/virtiofsd/passthrough_ll.c
> index b3d0674f6d2f..2bf5d40df531 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3357,6 +3357,50 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t
> ino, off_t off, int whence,
>      }
>  }
>
> +static int lo_do_syncfs(struct lo_data *lo, struct lo_inode *inode)
> +{
> +    int fd, ret = 0;
> +
> +    fuse_log(FUSE_LOG_DEBUG, "lo_do_syncfs(ino=%" PRIu64 ")\n",
> +             inode->fuse_ino);
> +
> +    fd = lo_inode_open(lo, inode, O_RDONLY);
> +    if (fd < 0) {
> +        return -fd;
> +    }
> +
> +    if (syncfs(fd) < 0) {
> +        ret = errno;
> +    }
> +
> +    close(fd);
> +    return ret;
> +}
> +
> +static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
> +{
> +    struct lo_data *lo = lo_data(req);
> +    int err;
> +
> +    if (lo->announce_submounts) {
> +        struct lo_inode *inode;
> +
> +        inode = lo_inode(req, ino);
> +        if (!inode) {
> +            fuse_reply_err(req, EBADF);
> +            return;
> +        }
> +
> +        err = lo_do_syncfs(lo, inode);
> +        lo_inode_put(lo, &inode);
> +    } else {
> +        /* Requires the sever to track submounts. Not implemented yet */
> +        err = ENOSYS;
> +    }
>

In the current rust version we don't check if announce_submount is enabled,
with and without it lo_syncfs do the same thing. So, if announce_submount
is not enabled, at least the root shared dir get synced.



> +
> +    fuse_reply_err(req, err);
> +}
> +
>  static void lo_destroy(void *userdata)
>  {
>      struct lo_data *lo = (struct lo_data *)userdata;
> @@ -3417,6 +3461,7 @@ static struct fuse_lowlevel_ops lo_oper = {
>      .copy_file_range = lo_copy_file_range,
>  #endif
>      .lseek = lo_lseek,
> +    .syncfs = lo_syncfs,
>      .destroy = lo_destroy,
>  };
>
> diff --git a/tools/virtiofsd/passthrough_seccomp.c
> b/tools/virtiofsd/passthrough_seccomp.c
> index a3ce9f898d2d..3e9d6181dc69 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -108,6 +108,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
>      SCMP_SYS(symlinkat),
> +    SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>      SCMP_SYS(tgkill),
>      SCMP_SYS(unlinkat),
> --
> 2.34.1
>
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
>
>

-- 
German

--00000000000075e33405d7fc48c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 14, 2022 at 3:00 PM Greg =
Kurz &lt;<a href=3D"mailto:groug@kaod.org">groug@kaod.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Honor the expected=
 behavior of syncfs() to synchronously flush all data<br>
and metadata to disk on linux systems.<br>
<br>
If virtiofsd is started with &#39;-o announce_submounts&#39;, the client is=
<br>
expected to send a FUSE_SYNCFS request for each individual submount.<br>
In this case, we just create a new file descriptor on the submount<br>
inode with lo_inode_open(), call syncfs() on it and close it. The<br>
intermediary file is needed because O_PATH descriptors aren&#39;t<br>
backed by an actual file and syncfs() would fail with EBADF.<br>
<br>
If virtiofsd is started without &#39;-o announce_submounts&#39; or if the<b=
r>
client doesn&#39;t have the FUSE_CAP_SUBMOUNTS capability, the client<br>
only sends a single FUSE_SYNCFS request for the root inode. The<br>
server would thus need to track submounts internally and call<br>
syncfs() on each of them. This will be implemented later.<br>
<br>
Note that syncfs() might suffer from a time penalty if the submounts<br>
are being hammered by some unrelated workload on the host. The only<br>
solution to prevent that is to avoid shared mounts.<br>
<br>
Signed-off-by: Greg Kurz &lt;<a href=3D"mailto:groug@kaod.org" target=3D"_b=
lank">groug@kaod.org</a>&gt;<br>
---<br>
=C2=A0tools/virtiofsd/fuse_lowlevel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++=
+<br>
=C2=A0tools/virtiofsd/fuse_lowlevel.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++++=
++<br>
=C2=A0tools/virtiofsd/passthrough_ll.c=C2=A0 =C2=A0 =C2=A0 | 45 +++++++++++=
++++++++++++++++<br>
=C2=A0tools/virtiofsd/passthrough_seccomp.c |=C2=A0 1 +<br>
=C2=A04 files changed, 70 insertions(+)<br>
<br>
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c<br>
index e4679c73abc2..e02d8b25a5f6 100644<br>
--- a/tools/virtiofsd/fuse_lowlevel.c<br>
+++ b/tools/virtiofsd/fuse_lowlevel.c<br>
@@ -1876,6 +1876,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t node=
id,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct fuse_mbuf_iter *iter)<br>
+{<br>
+=C2=A0 =C2=A0 if (req-&gt;se-&gt;op.syncfs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 req-&gt;se-&gt;op.syncfs(req, nodeid);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fuse_reply_err(req, ENOSYS);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void do_init(fuse_req_t req, fuse_ino_t nodeid,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct fuse_mbuf_iter *iter)<br>
=C2=A0{<br>
@@ -2280,6 +2290,7 @@ static struct {<br>
=C2=A0 =C2=A0 =C2=A0[FUSE_RENAME2] =3D { do_rename2, &quot;RENAME2&quot; },=
<br>
=C2=A0 =C2=A0 =C2=A0[FUSE_COPY_FILE_RANGE] =3D { do_copy_file_range, &quot;=
COPY_FILE_RANGE&quot; },<br>
=C2=A0 =C2=A0 =C2=A0[FUSE_LSEEK] =3D { do_lseek, &quot;LSEEK&quot; },<br>
+=C2=A0 =C2=A0 [FUSE_SYNCFS] =3D { do_syncfs, &quot;SYNCFS&quot; },<br>
=C2=A0};<br>
<br>
=C2=A0#define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))<br>
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h<br>
index c55c0ca2fc1c..b889dae4de0e 100644<br>
--- a/tools/virtiofsd/fuse_lowlevel.h<br>
+++ b/tools/virtiofsd/fuse_lowlevel.h<br>
@@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off=
, int whence,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 fuse_file_info *fi);<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Synchronize file system content<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* If this request is answered with an error code of EN=
OSYS,<br>
+=C2=A0 =C2=A0 =C2=A0* this is treated as success and future calls to syncf=
s() will<br>
+=C2=A0 =C2=A0 =C2=A0* succeed automatically without being sent to the file=
system<br>
+=C2=A0 =C2=A0 =C2=A0* process.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @param req request handle<br>
+=C2=A0 =C2=A0 =C2=A0* @param ino the inode number<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 void (*syncfs)(fuse_req_t req, fuse_ino_t ino);<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c<br>
index b3d0674f6d2f..2bf5d40df531 100644<br>
--- a/tools/virtiofsd/passthrough_ll.c<br>
+++ b/tools/virtiofsd/passthrough_ll.c<br>
@@ -3357,6 +3357,50 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino,=
 off_t off, int whence,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static int lo_do_syncfs(struct lo_data *lo, struct lo_inode *inode)<br>
+{<br>
+=C2=A0 =C2=A0 int fd, ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 fuse_log(FUSE_LOG_DEBUG, &quot;lo_do_syncfs(ino=3D%&quot; PR=
Iu64 &quot;)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inode-&gt;fuse_ino);<br>
+<br>
+=C2=A0 =C2=A0 fd =3D lo_inode_open(lo, inode, O_RDONLY);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -fd;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (syncfs(fd) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D errno;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)<br>
+{<br>
+=C2=A0 =C2=A0 struct lo_data *lo =3D lo_data(req);<br>
+=C2=A0 =C2=A0 int err;<br>
+<br>
+=C2=A0 =C2=A0 if (lo-&gt;announce_submounts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct lo_inode *inode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inode =3D lo_inode(req, ino);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!inode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fuse_reply_err(req, EBADF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D lo_do_syncfs(lo, inode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lo_inode_put(lo, &amp;inode);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Requires the sever to track submounts. Not =
implemented yet */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D ENOSYS;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>In the current rust ve=
rsion we don&#39;t check if announce_submount is enabled,</div><div>with an=
d without it lo_syncfs do the same thing. So, if announce_submount</div><di=
v>is not enabled, at least the root shared dir get synced.<br></div><div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 fuse_reply_err(req, err);<br>
+}<br>
+<br>
=C2=A0static void lo_destroy(void *userdata)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct lo_data *lo =3D (struct lo_data *)userdata;<br>
@@ -3417,6 +3461,7 @@ static struct fuse_lowlevel_ops lo_oper =3D {<br>
=C2=A0 =C2=A0 =C2=A0.copy_file_range =3D lo_copy_file_range,<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0.lseek =3D lo_lseek,<br>
+=C2=A0 =C2=A0 .syncfs =3D lo_syncfs,<br>
=C2=A0 =C2=A0 =C2=A0.destroy =3D lo_destroy,<br>
=C2=A0};<br>
<br>
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passth=
rough_seccomp.c<br>
index a3ce9f898d2d..3e9d6181dc69 100644<br>
--- a/tools/virtiofsd/passthrough_seccomp.c<br>
+++ b/tools/virtiofsd/passthrough_seccomp.c<br>
@@ -108,6 +108,7 @@ static const int syscall_allowlist[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(set_robust_list),<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(setxattr),<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(symlinkat),<br>
+=C2=A0 =C2=A0 SCMP_SYS(syncfs),<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(time), /* Rarely needed, except on static buil=
ds */<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(tgkill),<br>
=C2=A0 =C2=A0 =C2=A0SCMP_SYS(unlinkat),<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
Virtio-fs mailing list<br>
<a href=3D"mailto:Virtio-fs@redhat.com" target=3D"_blank">Virtio-fs@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/virtio-fs" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/vir=
tio-fs</a><br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">German<br></div></div></div>

--00000000000075e33405d7fc48c8--


