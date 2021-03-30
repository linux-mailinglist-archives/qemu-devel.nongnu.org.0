Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4434E288
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:49:30 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR97w-0004c6-Oy
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lR96X-000461-1m
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:48:01 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:57375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lR96U-0007tz-7t
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:48:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8243C257788;
 Tue, 30 Mar 2021 09:47:54 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 09:47:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002183d69e4-7af1-4725-baad-c22b6c1bd58a,
 ACC3036D4A0BACA70991A0E48D5F19CB1CCAE693) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 30 Mar 2021 09:47:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/8] memory: Allow eventfd add/del without starting a
 transaction
Message-ID: <20210330094749.577da616@bahia.lan>
In-Reply-To: <YGIIdUlzJR7TlhTR@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-2-groug@kaod.org>
 <YGIIdUlzJR7TlhTR@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fVaP.MjuDKroAS/C0jg7.RW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1d490899-6037-45ed-9ea5-a47657961439
X-Ovh-Tracer-Id: 15540233464606923055
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehledguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/fVaP.MjuDKroAS/C0jg7.RW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 18:03:49 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 04:07:28PM +0100, Greg Kurz wrote:
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 5728a681b27d..98ed552e001c 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1848,13 +1848,25 @@ void memory_region_clear_flush_coalesced(Memory=
Region *mr);
> >   * @match_data: whether to match against @data, instead of just @addr
> >   * @data: the data to match against the guest write
> >   * @e: event notifier to be triggered when @addr, @size, and @data all=
 match.
> > + * @transaction: whether to start a transaction for the change
>=20
> "start" is unclear. Does it begin a transaction and return with the
> transaction unfinished? I think instead the function performs the
> eventfd addition within a transaction. It would be nice to clarify this.
>=20

What about:=20

 * @transaction: if true, the eventfd is added within a nested transaction,
 *               if false, it is up to the caller to ensure this is called
 *               within a transaction.

> >   **/
> > -void memory_region_add_eventfd(MemoryRegion *mr,
> > -                               hwaddr addr,
> > -                               unsigned size,
> > -                               bool match_data,
> > -                               uint64_t data,
> > -                               EventNotifier *e);
> > +void memory_region_add_eventfd_full(MemoryRegion *mr,
> > +                                    hwaddr addr,
> > +                                    unsigned size,
> > +                                    bool match_data,
> > +                                    uint64_t data,
> > +                                    EventNotifier *e,
> > +                                    bool transaction);
> > +
> > +static inline void memory_region_add_eventfd(MemoryRegion *mr,
> > +                                             hwaddr addr,
> > +                                             unsigned size,
> > +                                             bool match_data,
> > +                                             uint64_t data,
> > +                                             EventNotifier *e)
> > +{
> > +    memory_region_add_eventfd_full(mr, addr, size, match_data, data, e=
, true);
> > +}
> > =20
> >  /**
> >   * memory_region_del_eventfd: Cancel an eventfd.
> > @@ -1868,13 +1880,25 @@ void memory_region_add_eventfd(MemoryRegion *mr,
> >   * @match_data: whether to match against @data, instead of just @addr
> >   * @data: the data to match against the guest write
> >   * @e: event notifier to be triggered when @addr, @size, and @data all=
 match.
> > + * @transaction: whether to start a transaction for the change
>=20
> Same here.

and:

 * @transaction: if true, the eventfd is cancelled within a nested transact=
ion,
 *               if false, it is up to the caller to ensure this is called
 *               within a transaction.

?

--Sig_/fVaP.MjuDKroAS/C0jg7.RW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBi16UACgkQcdTV5YIv
c9Yr2g//auaZIrw29widDuV06yZ3OVe+k659etmUJoDPjw4O6Zp97VKtlGapAfRT
HHugoNna7J+ywnUg3eizLEbtOGRyyOKV8a4GNBbNdIhVeoQq2gbD+NA+YzkaVOo4
McjapuHw15X4a6h2F6ybHmTHA58i5XD6+g4rcs8Iu/dbhgSbYWrbwUSQgOJcNxIF
JQuky5zWs8lC02UKcf+7hqCqUZ4BaE6qUOq+PEladso28UFR5Gzjdly9tec8QRYk
CWR6MeZMPcJkkHyKwKYv6Nsn6XLTZpJtkuxqtLE5gLKmh1GPSeq0Z87O8QFnqB/o
TXZmHUc35WL6EVQQEWJDMTbt1DijKEBE9/CBy9ArhilauBFvuT72SMb3pmlyMo7V
6h5WxbVUV3zFju6qyFqpovTvj0vdabEr3Iy2IVR4/Od/G5ADKR28q7C+PcnSb4qB
3ZRkl5DKuqJmAiYWvHxhj+eACF6EsJfc0scNZpGmvK8ru/UAge3CR5Zx4aD29BJD
kTmY0EdbOaxdlBsCk7/Z+QhfiS79yoq5clNNa2R6VgTTFUJbCrpVwxd7/Lq8Hyyg
q6IkJy7JN6TUZdAXETnrM9Xn1SYp1f9E0dPlt+L5RmGiFVaWZBKgXbwabFlhI14E
EUT8UzEQhTQC0HY4k2EXnpHmcPt3xQKbmSYOb3CeClU7dMGEREw=
=i6yD
-----END PGP SIGNATURE-----

--Sig_/fVaP.MjuDKroAS/C0jg7.RW--

