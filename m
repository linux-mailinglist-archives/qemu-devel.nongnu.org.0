Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700D2D3B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 07:42:58 +0100 (CET)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmtBg-0006lv-V2
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 01:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmt6K-0006Bo-7V; Wed, 09 Dec 2020 01:37:24 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:60783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmt6H-0000gi-C9; Wed, 09 Dec 2020 01:37:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5E065802A6;
 Wed,  9 Dec 2020 01:37:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Dec 2020 01:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=bn7DsXDWpe33GB8KgGSK3imTR+q
 qPOpV22BM1L+9Bt0=; b=qhPQFV/5E4K1Hrusa91wYVrMbbDerolcoG8lwgeXENg
 nI2bS2n3gsiCaB+lmrZF/jjEVpB5MWvSYYS65LgBibuGWi2h42hWpJ2Helq+deE8
 yxBSQx9lFoafxz+DI1ei3qFgs70k++oU6fbIk9n5kYXUSMuJy3WrpGzcBOZzVD5N
 TXkWsa+oCOK88A80zf0Gt2n2JVXxbzo5yHHRyOKkH3pfBaW71E6dl3iQc+q/4kMN
 NTDTDMYluFsLO9TsgDrr9TfJNUmroI+7dHlQCJS/Bamyzg4p/6xD2FdpZr+pIMjT
 +oyoeaGD+Pl8kDofHuWzCIhimGVXcJhTqIU7wIjtxag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bn7DsX
 DWpe33GB8KgGSK3imTR+qqPOpV22BM1L+9Bt0=; b=XGHJgDhsVgxgd52FxEH7fY
 vP3Qe7xlEXsrYHK8+/fwIkP/j/OSRd0darf+3XGYzo3AgpyIqxAI7z+Y71+s2gw1
 iIYFyB9tfuyW63HM5R/4qSGb0GWglU0eSQoCXJQxWlfiLPTbnKXSkaXc3fhbDqDU
 mG3YQyTEBbdZ9o9cCe6tx/d6StXuOPp8wzQP7TD74JGT0Fo9qUiOrda+oZ1O2He7
 QmI9e4ctMyjwBaKFZnckiRnbEUkB6/Rb5f//muambysF3qVcfJWwp8IC5WcGOO1Q
 TDCN291fevc+l8BqBiBjKikfABFS6HIK9aYhyP3E70C8EYXkmwHD2lxLfPmF385Q
 ==
X-ME-Sender: <xms:nXDQXz8Op_gHUrrCfAfShV_h1amo-PqMB-rmiIKJ5blVxHA_qvNx8w>
 <xme:nXDQX_vG9wFw6Q7NorZd_4kFkzEiKRuoWyBoqOgYiT0OPF-RaMR_X1UwZP0THaR5z
 4dJwi6hjAR-RRDjlUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejjedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:nXDQXxCTCYSaU5oHL0Ki5jQCYvJJe4h5znNedzur_p4SMC9ZG-NZ9g>
 <xmx:nXDQX_dp14lw56z9_R7J_KplILcjNIeVR9iZSiiuIZ0YbIEpUAKGwg>
 <xmx:nXDQX4PM41f6HudRNY_Dt7njiWuqdUibwhHfKugEbtjkE4QSrKBmoA>
 <xmx:n3DQX6tZO28simRGAkVTxMJbIr0DQFur8py3lk0Ju3nPooUjI7UwxQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 609691080057;
 Wed,  9 Dec 2020 01:37:14 -0500 (EST)
Date: Wed, 9 Dec 2020 07:37:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v11 08/13] block/nvme: Make ZNS-related definitions
Message-ID: <X9Bwlyx3yvRuOaQw@apples.localdomain>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
 <20201208200410.27900-9-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xWrEU/D4joBtGxyA"
Content-Disposition: inline
In-Reply-To: <20201208200410.27900-9-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xWrEU/D4joBtGxyA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

CC for Stefan (nvme block driver co-maintainer).

On Dec  9 05:04, Dmitry Fomichev wrote:
> Define values and structures that are needed to support Zoned
> Namespace Command Set (NVMe TP 4053).
>=20
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  include/block/nvme.h | 114 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 29d826ab19..a9165402d6 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -489,6 +489,9 @@ enum NvmeIoCommands {
>      NVME_CMD_COMPARE            =3D 0x05,
>      NVME_CMD_WRITE_ZEROES       =3D 0x08,
>      NVME_CMD_DSM                =3D 0x09,
> +    NVME_CMD_ZONE_MGMT_SEND     =3D 0x79,
> +    NVME_CMD_ZONE_MGMT_RECV     =3D 0x7a,
> +    NVME_CMD_ZONE_APPEND        =3D 0x7d,
>  };
> =20
>  typedef struct QEMU_PACKED NvmeDeleteQ {
> @@ -648,9 +651,13 @@ typedef struct QEMU_PACKED NvmeAerResult {
>      uint8_t resv;
>  } NvmeAerResult;
> =20
> +typedef struct QEMU_PACKED NvmeZonedResult {
> +    uint64_t slba;
> +} NvmeZonedResult;
> +
>  typedef struct QEMU_PACKED NvmeCqe {
>      uint32_t    result;
> -    uint32_t    rsvd;
> +    uint32_t    dw1;
>      uint16_t    sq_head;
>      uint16_t    sq_id;
>      uint16_t    cid;
> @@ -679,6 +686,7 @@ enum NvmeStatusCodes {
>      NVME_INVALID_USE_OF_CMB     =3D 0x0012,
>      NVME_INVALID_PRP_OFFSET     =3D 0x0013,
>      NVME_CMD_SET_CMB_REJECTED   =3D 0x002b,
> +    NVME_INVALID_CMD_SET        =3D 0x002c,
>      NVME_LBA_RANGE              =3D 0x0080,
>      NVME_CAP_EXCEEDED           =3D 0x0081,
>      NVME_NS_NOT_READY           =3D 0x0082,
> @@ -703,6 +711,14 @@ enum NvmeStatusCodes {
>      NVME_CONFLICTING_ATTRS      =3D 0x0180,
>      NVME_INVALID_PROT_INFO      =3D 0x0181,
>      NVME_WRITE_TO_RO            =3D 0x0182,
> +    NVME_ZONE_BOUNDARY_ERROR    =3D 0x01b8,
> +    NVME_ZONE_FULL              =3D 0x01b9,
> +    NVME_ZONE_READ_ONLY         =3D 0x01ba,
> +    NVME_ZONE_OFFLINE           =3D 0x01bb,
> +    NVME_ZONE_INVALID_WRITE     =3D 0x01bc,
> +    NVME_ZONE_TOO_MANY_ACTIVE   =3D 0x01bd,
> +    NVME_ZONE_TOO_MANY_OPEN     =3D 0x01be,
> +    NVME_ZONE_INVAL_TRANSITION  =3D 0x01bf,
>      NVME_WRITE_FAULT            =3D 0x0280,
>      NVME_UNRECOVERED_READ       =3D 0x0281,
>      NVME_E2E_GUARD_ERROR        =3D 0x0282,
> @@ -888,6 +904,11 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
>      uint8_t     vs[1024];
>  } NvmeIdCtrl;
> =20
> +typedef struct NvmeIdCtrlZoned {
> +    uint8_t     zasl;
> +    uint8_t     rsvd1[4095];
> +} NvmeIdCtrlZoned;
> +
>  enum NvmeIdCtrlOacs {
>      NVME_OACS_SECURITY  =3D 1 << 0,
>      NVME_OACS_FORMAT    =3D 1 << 1,
> @@ -1016,6 +1037,12 @@ typedef struct QEMU_PACKED NvmeLBAF {
>      uint8_t     rp;
>  } NvmeLBAF;
> =20
> +typedef struct QEMU_PACKED NvmeLBAFE {
> +    uint64_t    zsze;
> +    uint8_t     zdes;
> +    uint8_t     rsvd9[7];
> +} NvmeLBAFE;
> +
>  #define NVME_NSID_BROADCAST 0xffffffff
> =20
>  typedef struct QEMU_PACKED NvmeIdNs {
> @@ -1075,10 +1102,24 @@ enum NvmeNsIdentifierType {
> =20
>  enum NvmeCsi {
>      NVME_CSI_NVM                =3D 0x00,
> +    NVME_CSI_ZONED              =3D 0x02,
>  };
> =20
>  #define NVME_SET_CSI(vec, csi) (vec |=3D (uint8_t)(1 << (csi)))
> =20
> +typedef struct QEMU_PACKED NvmeIdNsZoned {
> +    uint16_t    zoc;
> +    uint16_t    ozcs;
> +    uint32_t    mar;
> +    uint32_t    mor;
> +    uint32_t    rrl;
> +    uint32_t    frl;
> +    uint8_t     rsvd20[2796];
> +    NvmeLBAFE   lbafe[16];
> +    uint8_t     rsvd3072[768];
> +    uint8_t     vs[256];
> +} NvmeIdNsZoned;
> +
>  /*Deallocate Logical Block Features*/
>  #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
>  #define NVME_ID_NS_DLFEAT_WRITE_ZEROES(dlfeat)    ((dlfeat) & 0x08)
> @@ -1111,10 +1152,76 @@ enum NvmeIdNsDps {
>      DPS_FIRST_EIGHT =3D 8,
>  };
> =20
> +enum NvmeZoneAttr {
> +    NVME_ZA_FINISHED_BY_CTLR         =3D 1 << 0,
> +    NVME_ZA_FINISH_RECOMMENDED       =3D 1 << 1,
> +    NVME_ZA_RESET_RECOMMENDED        =3D 1 << 2,
> +    NVME_ZA_ZD_EXT_VALID             =3D 1 << 7,
> +};
> +
> +typedef struct QEMU_PACKED NvmeZoneReportHeader {
> +    uint64_t    nr_zones;
> +    uint8_t     rsvd[56];
> +} NvmeZoneReportHeader;
> +
> +enum NvmeZoneReceiveAction {
> +    NVME_ZONE_REPORT                 =3D 0,
> +    NVME_ZONE_REPORT_EXTENDED        =3D 1,
> +};
> +
> +enum NvmeZoneReportType {
> +    NVME_ZONE_REPORT_ALL             =3D 0,
> +    NVME_ZONE_REPORT_EMPTY           =3D 1,
> +    NVME_ZONE_REPORT_IMPLICITLY_OPEN =3D 2,
> +    NVME_ZONE_REPORT_EXPLICITLY_OPEN =3D 3,
> +    NVME_ZONE_REPORT_CLOSED          =3D 4,
> +    NVME_ZONE_REPORT_FULL            =3D 5,
> +    NVME_ZONE_REPORT_READ_ONLY       =3D 6,
> +    NVME_ZONE_REPORT_OFFLINE         =3D 7,
> +};
> +
> +enum NvmeZoneType {
> +    NVME_ZONE_TYPE_RESERVED          =3D 0x00,
> +    NVME_ZONE_TYPE_SEQ_WRITE         =3D 0x02,
> +};
> +
> +enum NvmeZoneSendAction {
> +    NVME_ZONE_ACTION_RSD             =3D 0x00,
> +    NVME_ZONE_ACTION_CLOSE           =3D 0x01,
> +    NVME_ZONE_ACTION_FINISH          =3D 0x02,
> +    NVME_ZONE_ACTION_OPEN            =3D 0x03,
> +    NVME_ZONE_ACTION_RESET           =3D 0x04,
> +    NVME_ZONE_ACTION_OFFLINE         =3D 0x05,
> +    NVME_ZONE_ACTION_SET_ZD_EXT      =3D 0x10,
> +};
> +
> +typedef struct QEMU_PACKED NvmeZoneDescr {
> +    uint8_t     zt;
> +    uint8_t     zs;
> +    uint8_t     za;
> +    uint8_t     rsvd3[5];
> +    uint64_t    zcap;
> +    uint64_t    zslba;
> +    uint64_t    wp;
> +    uint8_t     rsvd32[32];
> +} NvmeZoneDescr;
> +
> +enum NvmeZoneState {
> +    NVME_ZONE_STATE_RESERVED         =3D 0x00,
> +    NVME_ZONE_STATE_EMPTY            =3D 0x01,
> +    NVME_ZONE_STATE_IMPLICITLY_OPEN  =3D 0x02,
> +    NVME_ZONE_STATE_EXPLICITLY_OPEN  =3D 0x03,
> +    NVME_ZONE_STATE_CLOSED           =3D 0x04,
> +    NVME_ZONE_STATE_READ_ONLY        =3D 0x0D,
> +    NVME_ZONE_STATE_FULL             =3D 0x0E,
> +    NVME_ZONE_STATE_OFFLINE          =3D 0x0F,
> +};
> +
>  static inline void _nvme_check_size(void)
>  {
>      QEMU_BUILD_BUG_ON(sizeof(NvmeBar) !=3D 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) !=3D 4);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) !=3D 8);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) !=3D 16);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) !=3D 16);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) !=3D 64);
> @@ -1130,8 +1237,13 @@ static inline void _nvme_check_size(void)
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) !=3D 512);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) !=3D 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) !=3D 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) !=3D 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) !=3D 4);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) !=3D 16);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) !=3D 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) !=3D 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) !=3D 16);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) !=3D 4);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) !=3D 64);
>  }
>  #endif
> --=20
> 2.28.0
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--xWrEU/D4joBtGxyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/QcJYACgkQTeGvMW1P
DemAnAf8DplB96ErzJ0tJsQWUNK4YVXnXlD7Ri9K1QTFvNbsHiyv4Sy3HyDRn+Mn
Bh+pApV594s0rwOFc1aGRj/z+i3CCjpFhx/POI0l/u5CX8oR0BTRuu+K9cCrOdwb
4hrDOkp9y4hM8JM6lyhMw80zWqWZcN4H8leLK4uC1RzWPgf7J0Ab0MyNxEy/yLQf
hBi3y91TxIyITiBYtQAO3olwT1uNbBm0BI6xvVWQ+TuDJP+EhrA8Q3gDzNZfRwxM
QaG+a+slFI/lNtvismzxz0M+tbBJkbw56Ovr4QS/SltPlBdai2HCwQNB+AeD2pEh
FoyZahhYczoAcgT69rLNE5r91ufJWw==
=/An5
-----END PGP SIGNATURE-----

--xWrEU/D4joBtGxyA--

