Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289D1145BB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 18:20:43 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icunx-0000nU-NP
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 12:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1icuhA-0004Oh-VD
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:13:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1icuh9-0004ox-EK
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:13:40 -0500
Received: from 13.mo4.mail-out.ovh.net ([178.33.251.8]:51983)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1icuh9-0004ea-5Q
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:13:39 -0500
Received: from player786.ha.ovh.net (unknown [10.108.16.209])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id BB96C216AAC
 for <qemu-devel@nongnu.org>; Thu,  5 Dec 2019 18:13:36 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 18365D088B88;
 Thu,  5 Dec 2019 17:13:34 +0000 (UTC)
Date: Thu, 5 Dec 2019 18:13:32 +0100
From: Greg Kurz <groug@kaod.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 08/21] 9pfs: well form error hint helpers
Message-ID: <20191205181332.53d1b8f3@bahia.w3ibm.bluemix.net>
In-Reply-To: <20191205180856.43bf2431@bahia.w3ibm.bluemix.net>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
 <20191205152019.8454-9-vsementsov@virtuozzo.com>
 <20191205180856.43bf2431@bahia.w3ibm.bluemix.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4233383652297578835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekuddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.8
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Dec 2019 18:08:56 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Thu,  5 Dec 2019 18:20:06 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> 
> > Make error_append_security_model_hint and
> > error_append_socket_sockfd_hint hint append helpers well formed:
> > rename errp to errp_in, as it is IN-parameter here (which is unusual
> > for errp).
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> 
> Acked-by: Greg Kurz <groug@kaod.org>
> 

With an updated changelog that no longer mentions errp_in :)

> >  hw/9pfs/9p-local.c | 2 +-
> >  hw/9pfs/9p-proxy.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index 4708c0bd89..ca641390fb 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -1473,7 +1473,7 @@ static void local_cleanup(FsContext *ctx)
> >      g_free(data);
> >  }
> >  
> > -static void error_append_security_model_hint(Error **errp)
> > +static void error_append_security_model_hint(Error *const *errp)
> >  {
> >      error_append_hint(errp, "Valid options are: security_model="
> >                        "[passthrough|mapped-xattr|mapped-file|none]\n");
> > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > index 97ab9c58a5..8136e1342d 100644
> > --- a/hw/9pfs/9p-proxy.c
> > +++ b/hw/9pfs/9p-proxy.c
> > @@ -1114,7 +1114,7 @@ static int connect_namedsocket(const char *path, Error **errp)
> >      return sockfd;
> >  }
> >  
> > -static void error_append_socket_sockfd_hint(Error **errp)
> > +static void error_append_socket_sockfd_hint(Error *const *errp)
> >  {
> >      error_append_hint(errp, "Either specify socket=/some/path where /some/path"
> >                        " points to a listening AF_UNIX socket or sock_fd=fd"
> 


