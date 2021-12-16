Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47F478000
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:27:11 +0100 (CET)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzDS-00063t-MQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxyMR-0005vO-QR
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:32:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxyMM-0003Lr-DA
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:32:23 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLE4mR009316; 
 Thu, 16 Dec 2021 21:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YPZMq4iVcL8P6VhiK8U7El/Kz9x8HxslQ01E1QgA7iM=;
 b=EF5jav7bKQ8Lp32kp4OlroQU+/BAD07iUtftXCcDBYxTALODrYU4kNHx+xtgbL7zG2y9
 xm3o2W55qll0zkxbklW/ETuZTVeO1KvgBHoac7KK7GiGlPl+5lGjXON/O/28PG86/69g
 DLhDAFCtXu37K/7eDB9mS6vdOlVg8fntzm22mUT22NzUXYpokwhrzvIi7XKKWLHrPCyC
 SFpHDu6gKtAkh/37b5AvHimT6N9eeEOGszJDFyntcx0SOFu/gM8AkVMMXgRTaL5AMlYG
 5W4Mk8EJUYSQA3IQWzyYTarpqvoDgLUZAcDqmyWbujtkhs4O7U3wIxTxVIl1Rf4ro02J Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknp44rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 21:32:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLGE2J120856;
 Thu, 16 Dec 2021 21:32:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 3cyjuaghgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 21:32:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lift2B2W1xxXNR2uxwIZ8mHLee/4F7lghjGsgLhfWqH+nQRRe8OgUyXv4x+P/9GDPKM2iwacXLAdz0g8HI+lQmT+7KUYfgU6k5c8dfnEy02k1PAlSYDLM2NnBr8LhUyKBLEwHPmnTuZm+YmvIP0XWiJP6ZTyoFvt9h8iHM3BCEsgJ4t7aVQO39Fu+9VM51J4+alcbqfdEfA0Gr+FEUN+ZLEuaUunSNJqflFUfzcg7zHTZXCnHP8Ig4SuavyFldl/YZcumo7ZEkB5GepmhiDNrY9zW32sqCQGO88NN/sdTmhgzn3SwRI7Ybysha6jeo5XA8NrIig4x+IS17d3w3LTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPZMq4iVcL8P6VhiK8U7El/Kz9x8HxslQ01E1QgA7iM=;
 b=K3vNMYsQUcl9CgckJA+ZGpPaCH7bcgluw48WYu3VlOkXPKMGBEGW37R0P0pGDmoVqm6eMafBvWF2dR1H4wXoO39zBbmp0tzZkdXRdOanjyn4Bf9uzHAaYexfdLYgHEco1BP+ejY72sDwRcQYTB7Z5jqCLLvcHdGyQUNkx5Fm+WlVSgrCc14r0SxX/LzlQVFMmdi+GLH1EhQtXZ+8MN1UT5xIhtfVAfTbAx03yKAO+lWSV8gxuWQQu5M3RX3akooYyv1HqUvHK4Ptk5dGpRe1c053nTWSUuLKQjWu6IEpPIWNY+Ykt7nkv0+E7fgiq2vf5563G5UF6KeS8htnTp3qFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPZMq4iVcL8P6VhiK8U7El/Kz9x8HxslQ01E1QgA7iM=;
 b=d83tlDga2SIxlsTPxN5ScUCxcW5WdYBgQGOOSDLeioNlKejrAE8niUBWUgRjtFwHDgLoL0d9Cor0TICjJKGEGELFCjkpmNSwRI4irgnNAcYdDya19oHZ0VMQ/vr2FQegWDFRBRnsgderHhb6vqlVwBoqfzcyDeiKhrvwUVeSTuw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5379.namprd10.prod.outlook.com (2603:10b6:208:325::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 21:32:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 21:32:11 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 05/14] vfio-user: instantiate vfio-user context
Thread-Topic: [PATCH v4 05/14] vfio-user: instantiate vfio-user context
Thread-Index: AQHX8YAo8XZPtNBaYEq7LyWMvxUT8aw04xsAgADCqAA=
Date: Thu, 16 Dec 2021 21:32:11 +0000
Message-ID: <B0026FB7-D3C0-4496-B2B6-EBA5269DD270@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <661e4b32da4b2ae7e0027fb483d74b96faff2cb8.1639549843.git.jag.raman@oracle.com>
 <YbsNEI91U7TQVo5Z@stefanha-x1.localdomain>
In-Reply-To: <YbsNEI91U7TQVo5Z@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 673b94cb-a672-4624-5b9f-08d9c0db851e
x-ms-traffictypediagnostic: BLAPR10MB5379:EE_
x-microsoft-antispam-prvs: <BLAPR10MB53790CB7EFB49295E9DFE2BC90779@BLAPR10MB5379.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5/0oUxFblw9AhzKizBP2+26SscZrn0Y3SuBpNmSwjAC791wQr0+9aJw0vZKslubfE4lRblmgWPqqdq/MMQLAe/4tHY8qPqNkiIj/FQ4QUfskafxEoAfKHSTGpu9DT9uh3UQXwjbPMmxNnhdJ9iOqKuelffX3/F3WaEeDfT08o98CkoFFz2DxQ7F/QqA9eFZR94jaQd9VMBDbMt7LpIDe9tZ6uawUgYHimtg50GJ2AdCXLcCHyNOmJsowk72bQcL2JsAc9XkfS7Af3Jxi9fJSPokHd4AgI45kNJ55nT6++EURYdQkNzeulzI5TsdJAAwpLlAzkC2mnraaPvaA6DqxVhz6iG1XusCR9gm+pwtcMmzB01vgVnxf/p/QdxJ4Lu1uEvJjbF0+Ok+4mWO1IH7lJV1SiFBQ5EW8TC0qtkKfyq5XGm3JbycQyt9hA5WH+TBvLnOr8c8Jt2y/bATW610oLRQuAPlE5dtmy5Y7Ys5BMepOgy39n6qYzZS3hrzKMYGjznk+1/deQZV0yN1bjBJSXsdEjYNtNT8nTJHEwWPQ/m/yPX4XOzNHMss3Vv+v6tA0XxSf1Vk/mjkxDJf0NUCkAauD5ve5qKp5mB4ArcweZrj+RPOYPwrC86+/gb0kcWk0GQX/LTb0axeZgTi1/CScAUPr/nz33VIBHRL318nD7tCFkBlkU0TGA3vjyDvvAgvLgNBL0wh7WEPNfUCai8PzLjNyv84nYJXs8tIbukTRExycSCK/fSzH8k2zu+6kBSp6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(186003)(2616005)(38070700005)(5660300002)(71200400001)(122000001)(6916009)(6506007)(316002)(53546011)(66946007)(66446008)(64756008)(7416002)(33656002)(66476007)(66556008)(4744005)(76116006)(91956017)(6486002)(6512007)(86362001)(44832011)(8676002)(54906003)(8936002)(2906002)(38100700002)(508600001)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3Y6rd+TAVliQmxRtm8DXN/QGruZIi51ebkR+EsQZvrwtfj+Qz+YtsMU7YK?=
 =?iso-8859-1?Q?85vIOsf1Mtxz6sibCjQaqHt8mr6nAMhAdslra4dR2bfG4WAwNqBkWApSHv?=
 =?iso-8859-1?Q?blSPx8ZkFsJLKnfr2kKnGoXmtylpDMcUpT8rSJAiVYlQUlgWFWzFxEe4hg?=
 =?iso-8859-1?Q?PGVYrDTGAxH+x8yfwInRGUxWoU2KxTjZQlDidramcxvStKmkcO4rukk1+8?=
 =?iso-8859-1?Q?cpxJI+bOhiQFjVYlratHLxp2LfusIGbrb8beVO6IuzXz+uv+fqPiRX7O+U?=
 =?iso-8859-1?Q?XIqOhGeGA7uu6FBX4gPk/x83ssn6BnpuR2eH8Y58Lv14FXzk4bYcLA1PmQ?=
 =?iso-8859-1?Q?Q/6bpB1FTyaW+1G1RDn4yBc1uyhXxE95P5swtYbupuhHkKB5xbQKtR9Bxy?=
 =?iso-8859-1?Q?dyQU2Wr869dOCte2bcPtDcEb3vI2pASZhkrBOpFatdQ7SVLBbnV4lHpZSW?=
 =?iso-8859-1?Q?QSdpI0k5xJKAnTCCPUH72dlT3yiwlpDz+wWAABuPEKoh1Gm9QBEeosauOv?=
 =?iso-8859-1?Q?SiAL5bJ3NptQyATDr7PPTwRmev8/6o1oZDrTMpRVpEzFBtwvDQcHtYcCOK?=
 =?iso-8859-1?Q?KO5Bvcitp75724DFZmeN1N1ilF/ZnG6j7zE7bI4EEJug+0MFly5w03pwfq?=
 =?iso-8859-1?Q?1RwsGBsDj39zirqOAyuZ7+koXUTyut7OFH8S+DEvwGoQAmfaF+b78gR9En?=
 =?iso-8859-1?Q?ggSCuC0d/SWkq49gw3Xp1EjAxdr7Pfgqj7i5xh+u945H3T6S9gsRq+QMmE?=
 =?iso-8859-1?Q?ubWJCXuXFIR/wA39Zu72kYR/BpJ0Pqf5iIa9ecRNh982JC7AfjJ0SV46bP?=
 =?iso-8859-1?Q?ayhLFzcBQAM5jg492/QMSRDMJhpYK/895SmXi5mbtiCYujUeMF8joI+Bmg?=
 =?iso-8859-1?Q?5QMSLKJkMmRy//N5XVQdce4BvctFyCWDD9yA+7gAzBC6rCRinmBE/Y47xr?=
 =?iso-8859-1?Q?170esQqeZRnOwRm2RERlwi6gmc1xtNzJeCgfKQPMj30d/WHP0O5JUu8NIM?=
 =?iso-8859-1?Q?zTjPoJq1KfvdnIF+Uy1dJTZecwC/kXPnM0NT/P5jBp6fKyH73WXY1KzTpf?=
 =?iso-8859-1?Q?1U+OiScWUnOJQw5q0Ky/uwkSMKM4k1HxrHB+wtNdnKU3HmKcMteMM1IizB?=
 =?iso-8859-1?Q?pdx0x/4F0T2tdaF2AbdILeQ6cgTxC9h2k3wgP/1qPwAOI+7wvrYWZFKEXj?=
 =?iso-8859-1?Q?nrwBYgaXylFAai+sR7cntd0jzdHGZvhi8tJCmQZJcnhHq//uQ5fNXwMSpj?=
 =?iso-8859-1?Q?V9FCzkkcML4D6dtK1pENTks+OpOjeYOWOFz1JT8adY/iKE5giiOw3hitDR?=
 =?iso-8859-1?Q?imR0Z6Nc71/9eFPeUMYbns4S5VKAJ45kywZKcBl9l7MTbcndtD7t4saZAq?=
 =?iso-8859-1?Q?9avE001miJmbxTue6bfn1AkhovBFGJ0hNTct5WyH0v1XpZ1NVC2j1GAx0m?=
 =?iso-8859-1?Q?6snkLTOhahLYgmvQyYHAGV7f3gPBBkykZxVC9KG7O482UCnMY25GBw6fPo?=
 =?iso-8859-1?Q?r2HtN/dpTwYJHJrYYvdxXypZFXO3zkMukabPec3RnzwIC8uwtzOifcSs8V?=
 =?iso-8859-1?Q?+rFjpD+Coy1rdDQ0ULoEQHIGUCT54OFTp/lSeTPMPhPNA71tqIv6HBFL67?=
 =?iso-8859-1?Q?PzqGO8vSvz+tAnja2k7ppKXDimOmx2pUynnLe6ijuRUbKWSzOwomYQ0Gv8?=
 =?iso-8859-1?Q?Z/c2kG9Oa7rP0cQg40jHZi9dqIWE5n9nknQM0pEOCbIGBC6vSkW5+Znm1N?=
 =?iso-8859-1?Q?xgUw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B7C7A4B8A7A32C4DB48533CA70953C49@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673b94cb-a672-4624-5b9f-08d9c0db851e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 21:32:11.2272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeyYjOY5swuFzTqCdG7omis0W7xPleCEffpcNm3v5DALhpo8pgIdaghnbQ9SnfmOpIVLSLIRDNfGsGsDqW4+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5379
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160114
X-Proofpoint-ORIG-GUID: L5TblQ9gCcACPMY2p1kwqHkaazXSCnHh
X-Proofpoint-GUID: L5TblQ9gCcACPMY2p1kwqHkaazXSCnHh
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 16, 2021, at 4:55 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Wed, Dec 15, 2021 at 10:35:29AM -0500, Jagannathan Raman wrote:
>> +static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +
>> +    if (o->vfu_ctx || !o->socket || !o->device ||
>> +            !phase_check(PHASE_MACHINE_READY)) {
>> +        return;
>> +    }
>> +
>> +    if (o->err) {
>> +        error_propagate(errp, o->err);
>=20
> Missing o->err =3D NULL because ownership has been passed to errp.

OK, will do!

Thank you!
--
Jag


