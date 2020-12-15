Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7A2DB558
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 21:44:35 +0100 (CET)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpHBR-000347-7A
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 15:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kpHAH-00027D-Kv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:43:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kpHAE-0006e0-SN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:43:20 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFKYGAT164423;
 Tue, 15 Dec 2020 20:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=el3xUsWLfmsfaU8YHjs9MBCbeVcjQXsyJ/oQaiznMjg=;
 b=zUqA/NJl13ECaf0C4IWTg7cMXcXUt4vZ1Rop5MeVEKH5IXRHRZgq8443Sjpx3gRGvgHg
 /4TM9zX4b2JaVspXkh9DK90ANofXNdxPtkLjNiPRMsQHE6lJKWFkw3sR5bZbjOrbPEjQ
 Ajk1eanlTVMtO2qiZQnkHCMfr8dVh5TrSgxYFwIYAxwFemj5w1mtDj+bdd9ZW9/OqLrd
 HPyrDUqwobp+d/jVOYrQi99zkT5MI72JUiUmXvtweAO9Ek3u6jS3qv/PWtmKgn379NGd
 Lv9I3vSJsVoHMfxlAg/GoH+eyBrmLCZT8UBfWs3xSnbnedilC7Ay3mng9uG6rc5XMc/2 +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35cn9rcqx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 20:42:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFKZCk5135339;
 Tue, 15 Dec 2020 20:42:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7enjc8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 20:42:54 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BFKgp6I016779;
 Tue, 15 Dec 2020 20:42:52 GMT
Received: from heatpipe (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 12:42:45 -0800
Date: Tue, 15 Dec 2020 12:42:41 -0800
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v13 07/19] multi-process: add qio channel function to
 transmit data and fds
Message-ID: <20201215204241.GA17643@heatpipe>
References: <cover.1607922214.git.jag.raman@oracle.com>
 <a366c7f80a862b4f32445f8334e2f36767b102a3.1607922214.git.jag.raman@oracle.com>
 <CAJ+F1CJLKJR5UirK106zKn5bM8rr1cDZyQwZ66QdMJLS-k_zBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJLKJR5UirK106zKn5bM8rr1cDZyQwZ66QdMJLS-k_zBA@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150138
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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

On Tue, Dec 15, 2020 at 02:49:22PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman <jag.raman@oracle.com>
> wrote:
> 
> > From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >
> > Adds QIO channel functions that transmit and receive iovs along with fds.
> >
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/io/channel.h | 50 +++++++++++++++++++++++++++++++++++++++++
> >  io/channel.c         | 63
> > +++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 112 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/io/channel.h b/include/io/channel.h
> > index 4d6fe45..c2d9836 100644
> > --- a/include/io/channel.h
> > +++ b/include/io/channel.h
> > @@ -774,4 +774,54 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
> >                                      IOHandler *io_write,
> >                                      void *opaque);
> >
> > +/**
> > + * qio_channel_readv_full_all:
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to read data to
> > + * @niov: the length of the @iov array
> > + * @fds: an array of file handles to read
> > + * @nfds: number of file handles in @fds
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + *
> > + * Behaves like qio_channel_readvv_full but will attempt
> > + * to read all data specified (file handles and memory regions).
> > + * The function will wait for all requested data
> > + * to be read, yielding from the current coroutine
> > + * if required.
> > + *
> > + * Returns: 0 if all bytes were read, or -1 on error
> > + */
> > +
> > +int qio_channel_readv_full_all(QIOChannel *ioc,
> > +                                const struct iovec *iov,
> > +                                size_t niov,
> > +                                int **fds, size_t *nfds,
> > +                                Error **errp);
> > +
> > +/**
> > + * qio_channel_writev_full_all:
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to write data from
> > + * @niov: the length of the @iov array
> > + * @fds: an array of file handles to send
> > + * @nfds: number of file handles in @fds
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + *
> > + * Behaves like qio_channel_writev_full but will attempt
> > + * to send all data passed (file handles and memory regions).
> > + * The function will wait for all requested data
> > + * to be written, yielding from the current coroutine
> > + * if required.
> > + *
> > + * Returns: 0 if all bytes were written, or -1 on error
> > + */
> > +
> > +int qio_channel_writev_full_all(QIOChannel *ioc,
> > +                           const struct iovec *iov,
> > +                           size_t niov,
> > +                           int *fds, size_t nfds,
> > +                           Error **errp);
> > +
> >  #endif /* QIO_CHANNEL_H */
> > diff --git a/io/channel.c b/io/channel.c
> > index 93d449d..13b0e7a 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
> > @@ -152,15 +152,72 @@ int qio_channel_readv_all(QIOChannel *ioc,
> >      return ret;
> >  }
> >
> > +int qio_channel_readv_full_all(QIOChannel *ioc,
> > +                                const struct iovec *iov,
> > +                                size_t niov,
> > +                                int **fds, size_t *nfds,
> > +                                Error **errp)
> > +{
> > +    int ret = -1;
> > +    struct iovec *local_iov = g_new(struct iovec, niov);
> > +    struct iovec *local_iov_head = local_iov;
> > +    unsigned int nlocal_iov = niov;
> > +    int **local_fds = fds;
> > +    size_t *local_nfds = nfds;
> > +
> > +    nlocal_iov = iov_copy(local_iov, nlocal_iov,
> > +                          iov, niov,
> > +                          0, iov_size(iov, niov));
> > +
> > +    while (nlocal_iov > 0) {
> > +        ssize_t len;
> > +        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov,
> > local_fds,
> > +                                     local_nfds, errp);
> > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > +            if (qemu_in_coroutine()) {
> > +                qio_channel_yield(ioc, G_IO_OUT);
> > +            } else {
> > +                qio_channel_wait(ioc, G_IO_OUT);
> > +            }
> > +            continue;
> > +        }
> > +        if (len <= 0) {
> > +            ret = len;
> > +            goto cleanup;
> > +        }
> > +
> > +        iov_discard_front(&local_iov, &nlocal_iov, len);
> > +
> > +        local_fds = NULL;
> > +        local_nfds = 0;
> > +    }
> > +
> > +    ret = 1;
> > + cleanup:
> > +    g_free(local_iov_head);
> > +    return ret;
> > +}
> > +
> >
> 
> I suggest to adapt the code so qio_channel_readv_all_eof() calls
> qio_channel_readv_full_all().
> 
> You may want to split this patch in 2 parts: the read and write parts.
> 
>

Thank you Marc-Andre, will do.

Elena
> >  int qio_channel_writev_all(QIOChannel *ioc,
> >                             const struct iovec *iov,
> >                             size_t niov,
> >                             Error **errp)
> >  {
> > +    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
> > +}
> > +
> > +int qio_channel_writev_full_all(QIOChannel *ioc,
> > +                                const struct iovec *iov,
> > +                                size_t niov,
> > +                                int *fds, size_t nfds,
> > +                                Error **errp)
> > +{
> >      int ret = -1;
> >      struct iovec *local_iov = g_new(struct iovec, niov);
> >      struct iovec *local_iov_head = local_iov;
> >      unsigned int nlocal_iov = niov;
> > +    int *local_fds = fds;
> > +    size_t local_nfds = nfds;
> >
> >      nlocal_iov = iov_copy(local_iov, nlocal_iov,
> >                            iov, niov,
> > @@ -168,7 +225,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
> >
> >      while (nlocal_iov > 0) {
> >          ssize_t len;
> > -        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
> > +        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov,
> > local_fds,
> > +                                      local_nfds, errp);
> >          if (len == QIO_CHANNEL_ERR_BLOCK) {
> >              if (qemu_in_coroutine()) {
> >                  qio_channel_yield(ioc, G_IO_OUT);
> > @@ -182,6 +240,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
> >          }
> >
> >          iov_discard_front(&local_iov, &nlocal_iov, len);
> > +
> > +        local_fds = NULL;
> > +        local_nfds = 0;
> >      }
> >
> >      ret = 0;
> > --
> > 1.8.3.1
> >
> >
> 
> -- 
> Marc-André Lureau

