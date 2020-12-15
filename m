Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52722DB172
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:30:37 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDDg-0001dK-Us
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpDCC-0000eY-Av
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:29:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpDC9-00045i-Q7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608049740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TEwq5JOSCPKHbKZqR2uBuUgmbp9aDAcqbkS5DNAxl0=;
 b=GY+bemC7DW3TXE5eRpOSoMmWElQRT4dTszxN+6okXfc3U9cQPwGWmG0W/V+RbM9DFBVtG4
 +gLG3XVU/QU2xccgB/1+LR3W3KYQunMX7xYUuuCtQT0mYXtqjZB0QXiXaUoPn3k0emMKFN
 bcNNOY5EOQJghA7hVFsZMwedsU5PIfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-T3Kk0TidPsuATY0dzYgD8w-1; Tue, 15 Dec 2020 11:28:56 -0500
X-MC-Unique: T3Kk0TidPsuATY0dzYgD8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27985801FAE;
 Tue, 15 Dec 2020 16:28:53 +0000 (UTC)
Received: from localhost (ovpn-117-148.ams2.redhat.com [10.36.117.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CECE19801;
 Tue, 15 Dec 2020 16:28:52 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:28:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v11 08/13] block/nvme: Make ZNS-related definitions
Message-ID: <20201215162851.GB685059@stefanha-x1.localdomain>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
 <20201208200410.27900-9-dmitry.fomichev@wdc.com>
 <X9Bwlyx3yvRuOaQw@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <X9Bwlyx3yvRuOaQw@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 07:37:11AM +0100, Klaus Jensen wrote:
> CC for Stefan (nvme block driver co-maintainer).
>=20
> On Dec  9 05:04, Dmitry Fomichev wrote:
> > Define values and structures that are needed to support Zoned
> > Namespace Command Set (NVMe TP 4053).
> >=20
> > Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  include/block/nvme.h | 114 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 113 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index 29d826ab19..a9165402d6 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -489,6 +489,9 @@ enum NvmeIoCommands {
> >      NVME_CMD_COMPARE            =3D 0x05,
> >      NVME_CMD_WRITE_ZEROES       =3D 0x08,
> >      NVME_CMD_DSM                =3D 0x09,
> > +    NVME_CMD_ZONE_MGMT_SEND     =3D 0x79,
> > +    NVME_CMD_ZONE_MGMT_RECV     =3D 0x7a,
> > +    NVME_CMD_ZONE_APPEND        =3D 0x7d,
> >  };
> > =20
> >  typedef struct QEMU_PACKED NvmeDeleteQ {
> > @@ -648,9 +651,13 @@ typedef struct QEMU_PACKED NvmeAerResult {
> >      uint8_t resv;
> >  } NvmeAerResult;
> > =20
> > +typedef struct QEMU_PACKED NvmeZonedResult {
> > +    uint64_t slba;
> > +} NvmeZonedResult;
> > +
> >  typedef struct QEMU_PACKED NvmeCqe {
> >      uint32_t    result;
> > -    uint32_t    rsvd;
> > +    uint32_t    dw1;
> >      uint16_t    sq_head;
> >      uint16_t    sq_id;
> >      uint16_t    cid;
> > @@ -679,6 +686,7 @@ enum NvmeStatusCodes {
> >      NVME_INVALID_USE_OF_CMB     =3D 0x0012,
> >      NVME_INVALID_PRP_OFFSET     =3D 0x0013,
> >      NVME_CMD_SET_CMB_REJECTED   =3D 0x002b,
> > +    NVME_INVALID_CMD_SET        =3D 0x002c,
> >      NVME_LBA_RANGE              =3D 0x0080,
> >      NVME_CAP_EXCEEDED           =3D 0x0081,
> >      NVME_NS_NOT_READY           =3D 0x0082,
> > @@ -703,6 +711,14 @@ enum NvmeStatusCodes {
> >      NVME_CONFLICTING_ATTRS      =3D 0x0180,
> >      NVME_INVALID_PROT_INFO      =3D 0x0181,
> >      NVME_WRITE_TO_RO            =3D 0x0182,
> > +    NVME_ZONE_BOUNDARY_ERROR    =3D 0x01b8,
> > +    NVME_ZONE_FULL              =3D 0x01b9,
> > +    NVME_ZONE_READ_ONLY         =3D 0x01ba,
> > +    NVME_ZONE_OFFLINE           =3D 0x01bb,
> > +    NVME_ZONE_INVALID_WRITE     =3D 0x01bc,
> > +    NVME_ZONE_TOO_MANY_ACTIVE   =3D 0x01bd,
> > +    NVME_ZONE_TOO_MANY_OPEN     =3D 0x01be,
> > +    NVME_ZONE_INVAL_TRANSITION  =3D 0x01bf,
> >      NVME_WRITE_FAULT            =3D 0x0280,
> >      NVME_UNRECOVERED_READ       =3D 0x0281,
> >      NVME_E2E_GUARD_ERROR        =3D 0x0282,
> > @@ -888,6 +904,11 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
> >      uint8_t     vs[1024];
> >  } NvmeIdCtrl;
> > =20
> > +typedef struct NvmeIdCtrlZoned {
> > +    uint8_t     zasl;
> > +    uint8_t     rsvd1[4095];
> > +} NvmeIdCtrlZoned;
> > +
> >  enum NvmeIdCtrlOacs {
> >      NVME_OACS_SECURITY  =3D 1 << 0,
> >      NVME_OACS_FORMAT    =3D 1 << 1,
> > @@ -1016,6 +1037,12 @@ typedef struct QEMU_PACKED NvmeLBAF {
> >      uint8_t     rp;
> >  } NvmeLBAF;
> > =20
> > +typedef struct QEMU_PACKED NvmeLBAFE {
> > +    uint64_t    zsze;
> > +    uint8_t     zdes;
> > +    uint8_t     rsvd9[7];
> > +} NvmeLBAFE;
> > +
> >  #define NVME_NSID_BROADCAST 0xffffffff
> > =20
> >  typedef struct QEMU_PACKED NvmeIdNs {
> > @@ -1075,10 +1102,24 @@ enum NvmeNsIdentifierType {
> > =20
> >  enum NvmeCsi {
> >      NVME_CSI_NVM                =3D 0x00,
> > +    NVME_CSI_ZONED              =3D 0x02,
> >  };
> > =20
> >  #define NVME_SET_CSI(vec, csi) (vec |=3D (uint8_t)(1 << (csi)))
> > =20
> > +typedef struct QEMU_PACKED NvmeIdNsZoned {
> > +    uint16_t    zoc;
> > +    uint16_t    ozcs;
> > +    uint32_t    mar;
> > +    uint32_t    mor;
> > +    uint32_t    rrl;
> > +    uint32_t    frl;
> > +    uint8_t     rsvd20[2796];
> > +    NvmeLBAFE   lbafe[16];
> > +    uint8_t     rsvd3072[768];
> > +    uint8_t     vs[256];
> > +} NvmeIdNsZoned;
> > +
> >  /*Deallocate Logical Block Features*/
> >  #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
> >  #define NVME_ID_NS_DLFEAT_WRITE_ZEROES(dlfeat)    ((dlfeat) & 0x08)
> > @@ -1111,10 +1152,76 @@ enum NvmeIdNsDps {
> >      DPS_FIRST_EIGHT =3D 8,
> >  };
> > =20
> > +enum NvmeZoneAttr {
> > +    NVME_ZA_FINISHED_BY_CTLR         =3D 1 << 0,
> > +    NVME_ZA_FINISH_RECOMMENDED       =3D 1 << 1,
> > +    NVME_ZA_RESET_RECOMMENDED        =3D 1 << 2,
> > +    NVME_ZA_ZD_EXT_VALID             =3D 1 << 7,
> > +};
> > +
> > +typedef struct QEMU_PACKED NvmeZoneReportHeader {
> > +    uint64_t    nr_zones;
> > +    uint8_t     rsvd[56];
> > +} NvmeZoneReportHeader;
> > +
> > +enum NvmeZoneReceiveAction {
> > +    NVME_ZONE_REPORT                 =3D 0,
> > +    NVME_ZONE_REPORT_EXTENDED        =3D 1,
> > +};
> > +
> > +enum NvmeZoneReportType {
> > +    NVME_ZONE_REPORT_ALL             =3D 0,
> > +    NVME_ZONE_REPORT_EMPTY           =3D 1,
> > +    NVME_ZONE_REPORT_IMPLICITLY_OPEN =3D 2,
> > +    NVME_ZONE_REPORT_EXPLICITLY_OPEN =3D 3,
> > +    NVME_ZONE_REPORT_CLOSED          =3D 4,
> > +    NVME_ZONE_REPORT_FULL            =3D 5,
> > +    NVME_ZONE_REPORT_READ_ONLY       =3D 6,
> > +    NVME_ZONE_REPORT_OFFLINE         =3D 7,
> > +};
> > +
> > +enum NvmeZoneType {
> > +    NVME_ZONE_TYPE_RESERVED          =3D 0x00,
> > +    NVME_ZONE_TYPE_SEQ_WRITE         =3D 0x02,
> > +};
> > +
> > +enum NvmeZoneSendAction {
> > +    NVME_ZONE_ACTION_RSD             =3D 0x00,
> > +    NVME_ZONE_ACTION_CLOSE           =3D 0x01,
> > +    NVME_ZONE_ACTION_FINISH          =3D 0x02,
> > +    NVME_ZONE_ACTION_OPEN            =3D 0x03,
> > +    NVME_ZONE_ACTION_RESET           =3D 0x04,
> > +    NVME_ZONE_ACTION_OFFLINE         =3D 0x05,
> > +    NVME_ZONE_ACTION_SET_ZD_EXT      =3D 0x10,
> > +};
> > +
> > +typedef struct QEMU_PACKED NvmeZoneDescr {
> > +    uint8_t     zt;
> > +    uint8_t     zs;
> > +    uint8_t     za;
> > +    uint8_t     rsvd3[5];
> > +    uint64_t    zcap;
> > +    uint64_t    zslba;
> > +    uint64_t    wp;
> > +    uint8_t     rsvd32[32];
> > +} NvmeZoneDescr;
> > +
> > +enum NvmeZoneState {
> > +    NVME_ZONE_STATE_RESERVED         =3D 0x00,
> > +    NVME_ZONE_STATE_EMPTY            =3D 0x01,
> > +    NVME_ZONE_STATE_IMPLICITLY_OPEN  =3D 0x02,
> > +    NVME_ZONE_STATE_EXPLICITLY_OPEN  =3D 0x03,
> > +    NVME_ZONE_STATE_CLOSED           =3D 0x04,
> > +    NVME_ZONE_STATE_READ_ONLY        =3D 0x0D,
> > +    NVME_ZONE_STATE_FULL             =3D 0x0E,
> > +    NVME_ZONE_STATE_OFFLINE          =3D 0x0F,
> > +};
> > +
> >  static inline void _nvme_check_size(void)
> >  {
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeBar) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) !=3D 4);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) !=3D 8);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) !=3D 16);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) !=3D 16);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) !=3D 64);
> > @@ -1130,8 +1237,13 @@ static inline void _nvme_check_size(void)
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) !=3D 512);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) !=3D 4096);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) !=3D 4096);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) !=3D 4);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) !=3D 16);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) !=3D 4096);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) !=3D 16);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) !=3D 4);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) !=3D 64);
> >  }
> >  #endif
> > --=20
> > 2.28.0
> >=20
> >=20
>=20
> --=20
> One of us - No more doubt, silence or taboo about mental illness.



Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Y5EMACgkQnKSrs4Gr
c8hu0wf/Se5CTvhk8o3uqmRhQGyriaSKC+Lox1Gdq5Ze0e1v8a2YRv8Y4vWKcSc3
wxs7yDwFN1HvWF6nETWNbB4WtPJTLICNy7fY8h7QOl+kduAIDVSiXB+Ol2HModtM
NqLeh7D6N9X3jNZ/ZWkWH9zlpATzPeH/eaxVz9GYbnuoAInZKQuomX+pjDwzUtOm
itmofNcH6gtHOz0IeNanpjry7rmbqDV2JMFQpCwTdYFamRJlD7EOstLuZhEUknBn
lRc70WUH5BBZcWk/nh5viYVK+7nqn8nrVKm90554msYEnBvmFp+vAoWBArKVHNbm
D8VvDQky1UUYjZHuOzzar8RRk0tWQw==
=/GZ7
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--


