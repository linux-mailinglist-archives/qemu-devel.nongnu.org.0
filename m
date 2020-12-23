Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6B2E224C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:59:20 +0100 (CET)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCAB-0007y9-EA
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ksC8j-0007Hx-Jc
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:57:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:57896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ksC8g-0005ov-0t
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:57:49 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BNLo91h148488;
 Wed, 23 Dec 2020 21:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=1oHElc0WA1KeK3k+y0ujfLwhAYvnf8jgRLFYj1zzGdk=;
 b=qFJeiZ7JyXYQMer7ORm8KGcEcGlJNhweQi0IGTq7Y9PgTNayt7ez3Pt1tXqfVSOc0ML9
 OBGOhqADR18m321+8j1vLucxzrac8wD/KSVfp34XWpEAnaIQQHVmueyLe44TaOaoEWuY
 NwGMjxNCQuF0YggRa/AIzXTm//ZLxHSqaUPerILoCkMtwyeGzNhtFC2wnYNl/LBWLxnd
 /db7qZ4GIOGSCzlDWVQNjThK2SyGskCVD0rW/sPGfDOEsNYen4Anae4PV7vNCVtWX0zQ
 XWimJ8tjNDB+0+TRI4g20L1MdOJN9si/TaXWPA78evhc/7r7Y1bKuuQWIljfqGMZiQad ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35k0cw9n38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Dec 2020 21:57:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BNLneTK187130;
 Wed, 23 Dec 2020 21:57:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35k0e3ry47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Dec 2020 21:57:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BNLvT0n010891;
 Wed, 23 Dec 2020 21:57:29 GMT
Received: from [10.39.236.66] (/10.39.236.66)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Dec 2020 13:57:29 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v15 08/20] multi-process: add qio channel read function
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAJ+F1CK_Jn5EKnzrPrGMZ4sJruyq34UDpSdV0aAji53JbLh=nQ@mail.gmail.com>
Date: Wed, 23 Dec 2020 16:57:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4A1938D-2535-4FAF-9BDB-E71CB95785F4@oracle.com>
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
 <42569c768066e334186ea8567847d96c8ebb0ad9.1608702853.git.elena.ufimtseva@oracle.com>
 <CAJ+F1CK_Jn5EKnzrPrGMZ4sJruyq34UDpSdV0aAji53JbLh=nQ@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9844
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012230151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9844
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230151
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 23, 2020, at 6:24 AM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
>=20
> Hi
>=20
> On Wed, Dec 23, 2020 at 10:17 AM <elena.ufimtseva@oracle.com> wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>=20
> Adds qio_channel_readv_full_all() to read both data and FDs.
> Refactors existing code to use this function.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h | 25 +++++++++++++
>  io/channel.c         | 85 =
+++++++++++++++++++++++++++++++-------------
>  2 files changed, 85 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 2378567d4b..429ece9a05 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -774,6 +774,31 @@ void qio_channel_set_aio_fd_handler(QIOChannel =
*ioc,
>                                      IOHandler *io_write,
>                                      void *opaque);
>=20
> +/**
> + * qio_channel_readv_full_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data to
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to read
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Behaves like qio_channel_readv_full but will attempt
> + * to read all data specified (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
>=20
> It may also returns -ECANCEL. I am not sure it's a good idea.=20
>=20
> + */
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp);
> +
>  /**
>   * qio_channel_writev_full_all:
>   * @ioc: the channel object
> diff --git a/io/channel.c b/io/channel.c
> index bde1f6d0f4..5edaea1fac 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -91,11 +91,49 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                                const struct iovec *iov,
>                                size_t niov,
>                                Error **errp)
> +{
> +    int ret =3D qio_channel_readv_full_all(ioc, iov, niov, NULL, =
NULL, errp);
> +
> +    if (ret =3D=3D -ECANCELED) {
>=20
>  No io/ functions use -errno return values so far.
>=20
> Maybe the simplest is to use the same return values as read_all_eof:
>  * Returns: 1 if all bytes were read, 0 if end-of-file occurs
>  *          without data, or -1 on error

Hi Marc-Andre,

qio_channel_readv_all_eof() also sets the Error variable when the =
channel
is closed in the middle of reading (partial read).

qio_channel_readv_full_all() needs to return a special value to
qio_channel_readv_all_eof() in the case of partial reads, aside
from '-1' for all other error scenarios. qio_channel_readv_full_all()
returns '-ECANCEL' to identify partial reads.

qio_channel_readv_full_all() could directly set this error variable for =
partial
read scenarios, but then there wouldn't be any difference between the
_full_all() version and _all_eof() version. Is that alright?

Thank you!
=E2=80=94
Jag


>=20
> +        error_prepend(errp,
> +                      "Unexpected end-of-file before all bytes were =
read: ");
> +        ret =3D -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_all(QIOChannel *ioc,
> +                          const struct iovec *iov,
> +                          size_t niov,
> +                          Error **errp)
> +{
> +    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);=20
> +
>=20
> It looks like it would make more sense to call readv_full_all directly =
instead now.
>=20
> +    if (ret =3D=3D 0) {
> +        error_setg(errp,
> +                   "Unexpected end-of-file before all bytes were =
read");
> +        return -1;
> +    }
> +    if (ret =3D=3D 1) {
> +        return 0;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp)
>  {
>      int ret =3D -1;
>      struct iovec *local_iov =3D g_new(struct iovec, niov);
>      struct iovec *local_iov_head =3D local_iov;
>      unsigned int nlocal_iov =3D niov;
> +    int **local_fds =3D fds;
> +    size_t *local_nfds =3D nfds;
>      bool partial =3D false;
>=20
>      nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
> @@ -104,7 +142,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>=20
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len =3D qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len =3D qio_channel_readv_full(ioc, local_iov, nlocal_iov, =
local_fds,
> +                                     local_nfds, errp);
>          if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +151,33 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len =3D=3D 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes =
were read");
> +        }
> +
> +        if (len <=3D 0) {
> +            size_t fd_idx =3D nfds ? *nfds : 0;
> +            if (partial && (len =3D=3D 0)) {
> +                ret =3D -ECANCELED;
>              } else {
> -                ret =3D 0;
> +                ret =3D len;
> +            }
> +
> +            while (fds && fd_idx) {
> +                close(*fds[fd_idx - 1]);
> +                fd_idx--;
> +            }
> +
> +            if (fds) {
> +                g_free(*fds);
>              }
> +
>              goto cleanup;
>          }
>=20
>          partial =3D true;
>          iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds =3D NULL;
> +        local_nfds =3D 0;
>      }
>=20
>      ret =3D 1;
> @@ -135,23 +187,6 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>      return ret;
>  }
>=20
> -int qio_channel_readv_all(QIOChannel *ioc,
> -                          const struct iovec *iov,
> -                          size_t niov,
> -                          Error **errp)
> -{
> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
> -
> -    if (ret =3D=3D 0) {
> -        ret =3D -1;
> -        error_setg(errp,
> -                   "Unexpected end-of-file before all bytes were =
read");
> -    } else if (ret =3D=3D 1) {
> -        ret =3D 0;
> -    }
> -    return ret;
> -}
> -
>  int qio_channel_writev_all(QIOChannel *ioc,
>                             const struct iovec *iov,
>                             size_t niov,
> --=20
> 2.25.GIT
>=20
>=20
>=20
> --=20
> Marc-Andr=C3=A9 Lureau


