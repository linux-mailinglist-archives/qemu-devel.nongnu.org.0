Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42DDF058
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 16:50:26 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZ0q-0000Mk-He
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 10:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iMYxt-0006Er-0v
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iMYxq-0000Jp-V1
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:47:20 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iMYxq-0000J9-Os
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:47:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id t16so9193567wrr.1
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QBVqk96yakyIO7lRg5p1MStudpPIX7PizoBwPozLgSI=;
 b=X9b2o53xVGc0hVel6JO3Kh6TizpmqpvnVUpY1dtUmFZbVFhpetF/FtXefe/W/hMbSd
 2O5DdWQmDK1TghYNskh/wHc75wBzDH15WWVqJ82dKl8mCQLE91CVwfL5b3vT0NCyN69k
 8Mh4Y5pufwt0tun5eOKD4ZbNtBrdPgFqCdeGG0eUAwbzwePziZCVO5WaJt0wI+f3RcWc
 PO+VzRNTvxpxz5WivVQTA9MJymuOl2muSsJYyXOOMwzbbV6MscSBT5AEqE2oEujB45t7
 lAHuVXDBKySTrx5fHN+3dVDvRc56OPwjTrRExLyxmxFuJ1jpwdFSykU+RYcWVKskzG8S
 dEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QBVqk96yakyIO7lRg5p1MStudpPIX7PizoBwPozLgSI=;
 b=H1nLh8qqYRu1j5x2H8BRfGXMz/N0pmgCtfV0ZMEj2J2PeZzDpBDgNz5Am8k0gFDgTj
 jkWE+NcJ1YBqkNEYEfAeX54qBqagr+++/AkNTRZ5gKqFjs7ilTWkiaginFhkn5KYn/c5
 YH4TpRXQyx1rlIbKSlo/FnMLyfSdE7gpIFrwDrC8xRsfIlL/dL1WLejBixbapjXmOc1S
 Lecwo8aFwWp5x6mZ4rsFttkzgUM4XzWe5u6VxznhAqj/XkKxevi8cw8GCdnPrnp9IksB
 dJmEa8japiLEe2sNZ9wEtUSBzMJnnIHzMkKHyAB2pISteaGtUXF8RCAoC5PFqIaCubdf
 C0/Q==
X-Gm-Message-State: APjAAAXaYSXQdTBtXeCdgSGnB0OuSuLLG5Z8OdsCj0QlU6LaMTin3Rt+
 ePA0caBxTNURFPNZNB4T82wO7zP849GdBrbAXvQ=
X-Google-Smtp-Source: APXvYqzaQTM5iUyI81GMC3IfqcW5upDO3dvNx3ONQntEPfgaOdLOFkH5DXLlI3K/9W6CBx1yQMpKvG5s5iJsA1dGnQA=
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr14197093wrc.202.1571669234999; 
 Mon, 21 Oct 2019 07:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191021105832.36574-1-dgilbert@redhat.com>
 <20191021105832.36574-12-dgilbert@redhat.com>
In-Reply-To: <20191021105832.36574-12-dgilbert@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 21 Oct 2019 16:47:03 +0200
Message-ID: <CAJ+F1CKqbj-FgfyFTwDwwQgrE-D-UJJd4wHT2KjZ1HmrqHbNRw@mail.gmail.com>
Subject: Re: [PATCH 11/30] virtiofsd: fuse: Make iov_length usable outside
 fuse_lowlevel.c
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 piaojun@huawei.com, Stefan Hajnoczi <stefanha@redhat.com>,
 eguan@linux.alibaba.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Oct 21, 2019 at 1:24 PM Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Similar function already exists in util/iov.c, iov_size()

Perhaps you could link with util/iov.o and others to avoid code duplication=
.


> ---
>  contrib/virtiofsd/fuse_lowlevel.c | 2 +-
>  contrib/virtiofsd/fuse_lowlevel.h | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/virtiofsd/fuse_lowlevel.c b/contrib/virtiofsd/fuse_l=
owlevel.c
> index 5ea113ab49..ff68ec0c9d 100644
> --- a/contrib/virtiofsd/fuse_lowlevel.c
> +++ b/contrib/virtiofsd/fuse_lowlevel.c
> @@ -74,7 +74,7 @@ static void convert_attr(const struct fuse_setattr_in *=
attr, struct stat *stbuf)
>         ST_CTIM_NSEC_SET(stbuf, attr->ctimensec);
>  }
>
> -static size_t iov_length(const struct iovec *iov, size_t count)
> +size_t iov_length(const struct iovec *iov, size_t count)
>  {
>         size_t seg;
>         size_t ret =3D 0;
> diff --git a/contrib/virtiofsd/fuse_lowlevel.h b/contrib/virtiofsd/fuse_l=
owlevel.h
> index 018e7c0be0..84379a4761 100644
> --- a/contrib/virtiofsd/fuse_lowlevel.h
> +++ b/contrib/virtiofsd/fuse_lowlevel.h
> @@ -2000,6 +2000,15 @@ void fuse_session_process_buf(struct fuse_session =
*se,
>   */
>  int fuse_session_receive_buf(struct fuse_session *se, struct fuse_buf *b=
uf);
>
> +/**
> + * General utility to get the length of an iov, not Fuse specific
> + *
> + * @param iov The iovec to get the length of
> + * @param count Number of entries in the iovec
> + * @return the total length of iov in bytes
> + */
> +size_t iov_length(const struct iovec *iov, size_t count);
> +
>  #ifdef __cplusplus
>  }
>  #endif
> --
> 2.23.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

