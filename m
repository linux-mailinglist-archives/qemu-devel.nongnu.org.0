Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3122F633D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:38:03 +0100 (CET)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03lC-0002Pw-RI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l03fx-0007Ui-H3
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:32:37 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:55178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l03fv-0004Oo-At
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:32:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 11642235657;
 Thu, 14 Jan 2021 15:32:32 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 14 Jan
 2021 15:32:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005ba6c027d-1f3c-4063-8e58-8831eb6f4d25,
 0A7C53367AF3A9CD096E542ECC3C8B2C2D100868) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 14 Jan 2021 15:32:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs/proxy: Check return value of proxy_marshal()
Message-ID: <20210114153230.79a6b7af@bahia.lan>
In-Reply-To: <2260349.uzTyekElz3@silver>
References: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
 <2260349.uzTyekElz3@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c5965d7b-567e-4697-bbbd-eb3d560146bb
X-Ovh-Tracer-Id: 6196671615641033181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 14:15:17 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 11. Januar 2021 10:49:56 CET Greg Kurz wrote:
> > This should always successfully write exactly two 32-bit integers.
> > Make it clear with an assert(), like v9fs_receive_status() and
> > v9fs_receive_response() already do when unmarshalling the same
> > header.
> > 
> > Fixes: Coverity CID 1438968
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> What's your workload Greg, are you able to push this through your queue?
> 

I'll take care of the security issue first, likely later today or tomorrow.
It is generally recommended to have separate PRs for CVEs, in order to
ease the backport effort of downstream vendors.

No hurry for this patch though. It isn't even a bug fix : we really can't
get an error at this point since previous calls to proxy_marshal() in this
function obviously succeeded at writing stuff at higher offsets... So this
is really a cosmetic only change to make Coverity happy.

I might be able to send a PR with this next week or the week after I guess.

> It's time that I signup for coverity. I'm doing that now before I forget it  
> again.
> 
> > ---
> >  hw/9pfs/9p-proxy.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > index 6f598a0f111c..4aa4e0a3baa0 100644
> > --- a/hw/9pfs/9p-proxy.c
> > +++ b/hw/9pfs/9p-proxy.c
> > @@ -537,7 +537,8 @@ static int v9fs_request(V9fsProxy *proxy, int type, void
> > *response, ...) }
> > 
> >      /* marshal the header details */
> > -    proxy_marshal(iovec, 0, "dd", header.type, header.size);
> > +    retval = proxy_marshal(iovec, 0, "dd", header.type, header.size);
> > +    assert(retval == 4 * 2);
> >      header.size += PROXY_HDR_SZ;
> > 
> >      retval = qemu_write_full(proxy->sockfd, iovec->iov_base, header.size);
> 
> Best regards,
> Christian Schoenebeck
> 
> 


