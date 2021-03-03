Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B658032B5FE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:46:25 +0100 (CET)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHN9E-000244-P1
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHN7g-0001IM-Kh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:44:48 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHN7e-0006EU-H0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:44:48 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1238hdnL102042;
 Wed, 3 Mar 2021 08:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=x+2lG1i6YZ9zVG78kZR1z9mVM7V4XKP/oe7Q2poKTGw=;
 b=F9Z5OoCh92U02QJ2CzUWsojiWsCS4iibbFfmhzzAYQ4RBZFaNUi6uPS66hzgFjuj3Fum
 rLPTUDjwvAMI2Oakmv0mQ+Mu/ceYMAbFvlGtidONgxhapXucQsKSJg4UCDIldxBZ4/NH
 Ei+qFaiDLmIAimuW29CCuMolmubW/NBCm24SELPCLQPSUxymAN+n+4gbyrP8mrtI+7mf
 muJze7Ic70qQTSfo84wb3Zpx7sk3FAMTtbXyiv//6G9surHWYeMzuU8W8row7F74dgdU
 OSOvh27N0Jn16pBFHTtUT/ue/8ONvhTOgZ0BCq9DTzaBqVTOmH3kn3CBJCE/doq4QUwB Ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 371hhc3wjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 08:44:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1238f0KH115892;
 Wed, 3 Mar 2021 08:44:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 37000y51gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 08:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU3sImuO6Y8KcsIpaB9uwBrVpFbeTJkBUfxXhfcdC0sjmNEdwMpLeqgOZLzYZe/VkSboM9axgQZth4FSG3+ovbb44fceIgwpIJH6zf4s1dcU0hMargFva8eQoP8z6CkqIfkbnrRqKs4yuiKlURza8QSYhnTUAQ2iRjejsUEQZV1bK8c6j97fj5s12f3sTogEGbh4EvrgPbL0RjAE+RP5lr+BOEy2IPYJDsbg73eU5CW7kgs0OvN1yOffJ43sXIA+Y+6omNEbs/YjsXuwJtxnh8YYX103aOwMWUKssC6RQHKltLqNGGoQxYlat/O0FgTNstIsKBMRAxXdWvTwYT8PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+2lG1i6YZ9zVG78kZR1z9mVM7V4XKP/oe7Q2poKTGw=;
 b=H9/95Z9itF83PQTefJnoWINIhN69xRrG/vaEjZArYZbQlLXA2PmjBDUZSUB3A6h+rnGNMCWvnFE/JUSBdS6SvEvior0mrnvqIx+FPYqsIMcUoNKG+TPhdTyAHDf+51RBBx20zKf3hZPgZX/iOjAkeO6IC2NBeF8Y4D124FKTBkwQwMNrUvJNsCjsZH09vkJ40DGZt29eFpsj9teS6zsHDOwlf/qriXzdfrrlDr7UcwFRWDoPQp90zF0VJPULDdmOIG2Ngc8HGPRjkLmfTqg/Q2/4VCbc8Ofaa4xz37V8Qxsbtr002WXciy51iF85JMTxaI5XoHLhpyhqaEvZ9VMYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+2lG1i6YZ9zVG78kZR1z9mVM7V4XKP/oe7Q2poKTGw=;
 b=dBerxXAa3lrPI5g05X3Yb9QLrtfYZLvVTxxvdTu1mzlh4MJIWXLVBf+5s6Vyy+KfhsFvXO+ULrEU8f+o3X7EuBYQ7ptwwzIzuvaRzuzu2K0NAjDBia3Wh96z3uyP5c/lFW6/iQ8MFxgqkJXQ+Hh0RVA9oAp9P+gwLIpfj3Mwodo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 08:44:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471%6]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 08:44:30 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Topic: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Index: AQHXD/wRtkqMtsSwEEuAanyZjyyT1apx8uCA
Date: Wed, 3 Mar 2021 08:44:30 +0000
Message-ID: <DFCB6E6C-99E7-41FF-9A11-B23C8F217EEE@oracle.com>
References: <20210303070639.1430-1-yuzenghui@huawei.com>
In-Reply-To: <20210303070639.1430-1-yuzenghui@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:9dd:70b4:51fd:d8c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bf54b24-a856-4e70-bb32-08d8de208fcb
x-ms-traffictypediagnostic: BLAPR10MB5171:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB5171415AACCB5BF57487DC0E90989@BLAPR10MB5171.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aeniKpVhqulzZEAbD0rKUEyWiKsKUB3g6FuWU/5Ib4Qwg5rOwi01WE3TPytbAhpp95ExDqLNdCZ8+LgTg7Obhjb2vgI7j0D6o2DFikhyZiuZLUdG0ZIbwIYXL5hPBqM2oodyr/uxC9P0nVkrnhghhyHpHcOVv2ZqUI/1huhfugYuYDhJ2b0TBHka4bQMuUV6V1UboeJbCiCCNO3AAyqZZLAUEgkNj78nZu3Lktqkpf+rGoKZRl2BMAKxshIX6q3Pg8MVjmfhghEOWbre+ZwX9S35ec6klTpkA9qHFsb8dfaqOA3cuhna7xd6KMZTAf9cq5/YYZOqHt6OLbf+b0TCMgA7kxApoC/m6wOMSQmmzLKPYq77XZHwGoH3ddHr37w27gqB7Gkg/yI+eSjmB6nPOb4Uh0BtzQFcKpvTtFDON0My+sChPPMq4ZK0floSmllC0FxWk6li9bfnvaO0Rt7W0wAGXTPs0fVpbIZv9Zde9l6QVQzCxmebu/zZUNHYnxe8jKtWChU0+xUMB/huk46BWCegCvi544Et7IN+9P901mdg6J0Vf1VgDqs9KSJ0dim+E7PGaWmLV0XVdjdFx4BYBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39860400002)(396003)(346002)(478600001)(6506007)(53546011)(44832011)(2616005)(66446008)(71200400001)(5660300002)(66946007)(64756008)(66476007)(91956017)(76116006)(33656002)(83380400001)(36756003)(66556008)(4326008)(54906003)(86362001)(6916009)(6486002)(316002)(8936002)(186003)(8676002)(6512007)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DzLzG9hTLWVfzK7vmZW1HQyftyb8KK86q6PT5hNvhWl0Tu1DrI9UimWBlreY?=
 =?us-ascii?Q?AZVi3uxCtg0C4Bi8ULYnlS3WYdpe9X3XbG5nxTI9g+elTNogZp39pGaBMDyW?=
 =?us-ascii?Q?iYBqQdNtbHtuBXCW4vx6X8lubtHiviZRrUAMSXBI7TKB5hjDLgU6rMdgY6CP?=
 =?us-ascii?Q?E91oYvcE8EvgmGjaiuBKa8RiMiJDLczZlvdyJLlZ1fBX8Xu13hhAozDB/hV1?=
 =?us-ascii?Q?X3Gbcq2tIdy7zEzuQHCIsOvq0n5O6aghvhvIK1Pk9RywgNasV03DOR6ft/ie?=
 =?us-ascii?Q?hs28qNGMLoG1o0UKCdiigVLnkaxO2faDmQgRFHAEDNy1LTlysrKXU5WgxmaC?=
 =?us-ascii?Q?bqxP9/osqrTCXg5xkpP2HS8BRcbYHzfUTxI9Qw0tKSvLfhKk65/iKr83oZWE?=
 =?us-ascii?Q?8nTfaliax+VN4/esP1zEV0YvVvpBE40xcybbMy4kmTeiMwwB+RUG+E+Xz0T+?=
 =?us-ascii?Q?jb5m1j1uVoM3YZiA/EVnDvz5nWrMZPG/5hsSYinlYCHkuEwa0tLPAsAE7YRh?=
 =?us-ascii?Q?ffobUqyZNBh6oLO5evxTISybX2aZmnAUlMSfETrEh5gbLj1cuLBiJXlJqPGn?=
 =?us-ascii?Q?QI7d+0hcz2NKg6qwL8ivO3WugUBDeRh65YvDCte3FenlyO2PHzRo9kOUAk6v?=
 =?us-ascii?Q?cgimvKCiviZOSYq6/B77yl6uPmJ39yfyEH5eJXDD5LXj4RDpSV4ZjEY4y/Vv?=
 =?us-ascii?Q?H4sciAPqUO/aRRk4LBM8YQT7NeiVaEEs7pPrvFDBVfU3hfaOSUolY0A/RLyH?=
 =?us-ascii?Q?qMhNR3m9mboINwMZkjX8I5Ev4Ecm0pUiXAeHky7us60o2dEIiCH53Z5oApmE?=
 =?us-ascii?Q?tvgVkwM3Mawsrza6qGHI++UQ1phddGYEVG7bBMFP9FX//9gp5Fz/+4skvfB2?=
 =?us-ascii?Q?sJSj6a3PjkV8HCOqvHtnt7LHdmmDB6FWkUpZRGJBg9bEcUT27Y2SghsqlKWJ?=
 =?us-ascii?Q?+URkzMbftnxMrP7BOGM5TU7QQBzc09VlQPpKWuUjyqB50wRA4XMtc60DmKU7?=
 =?us-ascii?Q?nyGq2ea+1moebsKix7b90EFe9rPB9xCeAnuPbBvPOpbnIGAOL0Mgj3QxeJlr?=
 =?us-ascii?Q?J4s2ce6rBi0YuuGpq/u8FGc/YJc5OBVlINL3VfaajFqKsavdnBBGu6im/EMO?=
 =?us-ascii?Q?d0+v6zpVwCR1FKYRWOY++KFFyGSIUa3mAQkVJckidmGpc2F+6KnRfI77IEY0?=
 =?us-ascii?Q?eKyICI0e/mXvE2ir2G0RfIFaS7z8FRroYec/nOBQaz36eMFiuSvYwVKZz6cV?=
 =?us-ascii?Q?h8j/FTkeLMJqiNCQlRzeDcRfOzSAVyGmegO1w75CQLH3ejNtdApXg59Xih16?=
 =?us-ascii?Q?IQ0+l6LygTdERSN1+Z+Phtcxz+X11gqNLCvRwbtUYwXoP4tDByc9DvaKiCVB?=
 =?us-ascii?Q?T92fno+Tl+7sm1YPKKY+K42kdQEO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1D8E276FA1B8A4F8068E64D91FD20C1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf54b24-a856-4e70-bb32-08d8de208fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 08:44:30.4919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+cvwnNsFV0YDTKl4aj0IF2sV1Jx4MXffL5PIQGn+0/T8gwg6JEvgl26jDtDwf9Mddd4VMiE+vSaX4wlPBmLBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030066
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030067
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Mar 3, 2021, at 2:06 AM, Zenghui Yu <yuzenghui@huawei.com> wrote:
>=20
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
>=20
> * Variables declared with g_auto* MUST always be initialized,
>  otherwise the cleanup function will use uninitialized stack memory
>=20
> Initialize @name properly to get rid of the compilation error:
>=20
> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>   g_free (*pp);
>   ^~~~~~~~~~~~
> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>             g_autofree char *name;
>                              ^~~~
>=20
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
> hw/remote/memory.c | 3 +--
> hw/remote/proxy.c  | 3 +--
> 2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..f5f735c15a 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -43,9 +43,8 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **err=
p)
>     remote_sysmem_reset();
>=20
>     for (region =3D 0; region < msg->num_fds; region++) {
> -        g_autofree char *name;
> +        g_autofree char *name =3D g_strdup_printf("remote-mem-%u", suffi=
x++);
>         subregion =3D g_new(MemoryRegion, 1);
> -        name =3D g_strdup_printf("remote-mem-%u", suffix++);
>         memory_region_init_ram_from_fd(subregion, NULL,
>                                        name, sysmem_info->sizes[region],
>                                        true, msg->fds[region],
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 4fa4be079d..6dda705fc2 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -347,13 +347,12 @@ static void probe_pci_info(PCIDevice *dev, Error **=
errp)
>                    PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEM=
ORY;
>=20
>         if (size) {
> -            g_autofree char *name;
> +            g_autofree char *name =3D g_strdup_printf("bar-region-%d", i=
);
>             pdev->region[i].dev =3D pdev;
>             pdev->region[i].present =3D true;
>             if (type =3D=3D PCI_BASE_ADDRESS_SPACE_MEMORY) {
>                 pdev->region[i].memory =3D true;
>             }
> -            name =3D g_strdup_printf("bar-region-%d", i);
>             memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
>                                   &proxy_mr_ops, &pdev->region[i],
>                                   name, size);
> --=20
> 2.19.1

Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
>=20


