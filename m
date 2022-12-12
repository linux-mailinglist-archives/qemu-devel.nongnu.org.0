Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C864A8B6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pPr-0000jF-F5; Mon, 12 Dec 2022 15:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pPp-0000h4-NZ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:28:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pPo-00083F-5m
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:28:45 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGwoxW029983; Mon, 12 Dec 2022 20:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=zl8NRo56Zw9u1LrXWc9sdtdfXUqY6i+1bJ45FiM8pyc=;
 b=EGJsVbuEbIWiKV8OBlfkYszHFIMZ82fodcaKftlz7Zg+5mq+bwlpyxe/7LjhtnMKUjMy
 tZm2bruoLHyGGHBSyrfjEU1drIZY2mCELvcO98bbIxwDO09ZywuEM6h23WnrcK8seYRN
 iRppeHbBAz1sIQR/mhgLdfozqUz2INogd+y0Fvjpr1t5ITwGWnFaNDkOr8e2v1b38ahJ
 kTckMZTb+zVentfkjYvTP/+HTiJc2GjEJMCg2N9iGKMLbj17eXffK5PJPJJomAnn4KeP
 lcVO2PU/7/FyBChUVNE/8jjKzY3BVJ6BzJEyiZamjTDpiEZVxoqj4ttRnIn0yinsQtxo wA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcj093spf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:28:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BCK8q95032977; Mon, 12 Dec 2022 20:28:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgjb45fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is+T/nlU/LN6AenXgbMOZEjX7w/yWfUl6/oNhSnzAKNXJfFXWkhJuVvNsPLeOkV6NFvOeAunF0pb9KAXZy/VtXKdJ8EmYQx66Q/+DxtRrCfVMvVMjwz+SiHXWoTBG4ORDQe3iznqeNMfqLr/be1/arf6D9YcgWBxhb/E6liZp9+aX/UoJGPt2hIsPX25FqNMC9MkVwb3hFBlv6eZOlsv/GH1M82WnDltYORB0lFDAqwxSV9L+QbLwlyV1O7UFTzMlZqGie7AeWxFSYPWRk9SKG2bSfj4semzMmXFivpt5HQMLfUqv0v9munPSJ0Zos7I2tnRdQaxhtWhsV1sIQpJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl8NRo56Zw9u1LrXWc9sdtdfXUqY6i+1bJ45FiM8pyc=;
 b=ehe+dEht3waJm1ZDrZK+tg2GoaB1VWperQK7gpaNjJgzD9ZK2ykAWNexTJJhWRE39Ire28PauLztzPr6GWwicyK2/RNXQa2zV72bRWSRjsxkUQ2A7fNz+u4YezbidY/cKgVmK0YsAuau1naHIhCmmLd1npHsqi6KvBhxCxP99ATQUKMqFOEMZgXrC4XlJETWcJgSm8ek/1+ebDOBMHekrdv+o8evKzk4rJQZ3mVW38LHIUYq7nfNZFTRCaKG/6vZxAQdeb0aRUyLoKrj9gLtIyaBLb5K1e3RqoN7M1ZiLV2oIDFkjUnA3rF0OUYNH5zTqVJDGhnw3XE/CG+joYisIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl8NRo56Zw9u1LrXWc9sdtdfXUqY6i+1bJ45FiM8pyc=;
 b=rP2Jj5T2bGL8IzdUtLS6ROFK8+JLYuOBwxYYDkUPpT8WWPEVjmDRXQyQ5mTlSyOTx5V0Rr5M5uOoRukz8m5oQM4lQxyiWJQ5H13QWuwT+7OrpPBSrqIisgA16eJExUy2ZwYDJjh9VcPa4DKTQw2rx8XaX54pxVL61R3pJP4wRXs=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by IA1PR10MB6832.namprd10.prod.outlook.com (2603:10b6:208:424::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 20:28:37 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 20:28:37 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <levon@movementarian.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Topic: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Index: AQHY86IbZmOj4+Y5z0Gyi+NUEacgdK5mAF4AgATo/QA=
Date: Mon, 12 Dec 2022 20:28:37 +0000
Message-ID: <1B906179-9AE7-4423-B3E1-15BD139F77C5@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
 <Y5NwhKLJjDUZ3p1k@movementarian.org>
In-Reply-To: <Y5NwhKLJjDUZ3p1k@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|IA1PR10MB6832:EE_
x-ms-office365-filtering-correlation-id: 84dae545-92ee-4657-e85c-08dadc7f72d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19TOKG0iBNm2OVaZe+ywl23UnO4G9uEkdCXSmjnZyO2YCxEedMc57WyA/+/slmow4jcBS6u9m5IBN53ujE4Q36wXkrtmTdhWWMJbab31tCncxTtviSquvdNcYLEorvigiZckFe4/GyMJxiwx61/Gfs5pROKGk0r3jmAC37AfhB1K4mJMCvzzID3ImMNxaM2qZsz9GVO4kKPA2EhwBx3jAj1uvAInA7WHdBfSVmt8coU6YtsHBhFHH0BhJLf49i08LDvczNK+sJJcTv+eMZRHy9icmZRPBvMZ6VO/t9SnXfj344xlw3gYFDRJieIly9GZtx+PYDNVMaUoFoMPLR1T+HXf7RLBYNIgZELkAKBrtSxyq7w/UfIuXqt5hGr3AjIjUBra9fiEOA8YrJbhUbQUWenruhN9RIz/J/KNIpdc28ehNBOvtoJJ/mxIs0AOhANPnBi53QttAOVaHacFNJjTs6mofUkR8FUwUgq392I7PV+tmcAyl7ThQRwkxKVV8zVLw56G8CsnHrfoQSqafiRGICGwxj3MYK1ESzbX0WS6mrpJq7BrVqwMu0gxb/zSAH9OA4UXArZ/b/TQpDspnCguUAQnHgPMP3kqxkrxR8bEiVFK5H5OYsMP+3gpd8u0u4uyN520C4KddCgzuOF5Jz6B9zYtYlOdMMhLcaPJUC+/DlWCnauAu2YU84702Hf3PC9pXzQ7siOScqBewd/VKL7aUyqyMt0SXnkErBBnHmoHVZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(38070700005)(38100700002)(122000001)(33656002)(6486002)(86362001)(6916009)(316002)(71200400001)(478600001)(5660300002)(66446008)(2906002)(8936002)(76116006)(66476007)(66946007)(64756008)(66556008)(41300700001)(4744005)(4326008)(83380400001)(8676002)(6506007)(53546011)(186003)(6512007)(26005)(2616005)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JxcejwR5wPjSeM9h666oTDT6rPzZXw4MyJR2UIbiDKZAUnJ8308sBjC9y7E/?=
 =?us-ascii?Q?6aVFhaP+1CAdBBZeaQfcaJrA65OV2lhfituo1Fbyg6mhU5mNzfTedCG65lpt?=
 =?us-ascii?Q?7Tj6QCjqM0yS4ibQKX+Jz4jVxv0DwdaYgSZE6oGMQDQtPFIkV/MIlAuwJ5Xb?=
 =?us-ascii?Q?6andLlvyLPMZdqN4V6hUTaaYQ1xf0OQiPrjNlkRLyDWEUkvzr6LT3T/7DgQ2?=
 =?us-ascii?Q?WV44J338pw3xntaetafaOILyKqT+h0ALZF0ZuE+VfVpN6F0ltLyyPAxFMO+R?=
 =?us-ascii?Q?efmicSkic6oO7SE/4Tlst2Q5/MXC7AMsVTnbKnNAMc8mmQ3S43InJWzBLzaw?=
 =?us-ascii?Q?wJlHDMbdxvTdcfEWQr3V05SQ5uNpZR6+bFp8bzjV/jX3JlpE/dq+tVPW8TG7?=
 =?us-ascii?Q?Mp7njCSApPoeHC/T4YVqmEqEpThx2U4dGEGCct7z2BoKb2KPNOnDC7XuGwH2?=
 =?us-ascii?Q?Lk3JKyR9MphNFir2OA9fRcRk7WvNIgt4Hl3xOE09KVGE7X3M0GcL5gDSsSRq?=
 =?us-ascii?Q?REvx9MMKQNoEiv01StTGYZSZME5Mn/fR0eQeItTSWjhjEFEpjLOmY4Jav6Md?=
 =?us-ascii?Q?MtMRg4fbRcFREZIKQ0GpR4WH3iN/0MylxUKI7PfEUjv5DNL2xRDDhzf/mH1M?=
 =?us-ascii?Q?exEiqFR5hTygoAE/NedUFnw5wGPPBco+EloTql129ERbAvYpYrzY1WklKdss?=
 =?us-ascii?Q?OXf7LW/d0IeZg7S3CePHa7WQKTYTo6SAL2ijYMRiO/ujPjMAT7RasgesFHLb?=
 =?us-ascii?Q?sWQiAIqaFbuW7dPgHkL/47EHoBSFz57joPz2+yqbGvIa3BemadPc9sOfHUCl?=
 =?us-ascii?Q?OPFgX3ZEWq1Wky8aNzXrZoxG7c2rc1UP0GDnEbCo7ucN/HKLYQy0VVgUEnXZ?=
 =?us-ascii?Q?5rnomuvNqQDYOdRmnWfPjd49DHO8Hfi1M26fNZyCgxy2SJLWpfDXbSy46ReW?=
 =?us-ascii?Q?Wc+lxVY9VEH2EwWTCK85dWZFB1Ij2vwC/erzLIWoD4oh/sUfLqErFKYxhuvw?=
 =?us-ascii?Q?les6RsXGsVwHajmfMAxRMFtbfVu45WURyqiSg9gGEY8erNbZ+XSg6AHTJ95f?=
 =?us-ascii?Q?FyacKSM2lOwWsoPPyXZUlopaHU2MNO+Ss96taunpF45T2F2E4i0rdqaHm5Gz?=
 =?us-ascii?Q?epXsuA97E1V3iPJkW7R42qcekcZLL6+lXqyhY5QRAhKwBwCJTawLIXi5hzWs?=
 =?us-ascii?Q?ts/ADVpf7ZrqRzNn3lJSGCCBz2WmKGMfjQSSTBt7gYx5j0EGUPhXJEuFUba9?=
 =?us-ascii?Q?/ls68SdNO9U9rLrAv9hHNLZxZ8lbcXj6qSbVxmOxni8444tuatfTuxgUows4?=
 =?us-ascii?Q?jlAGWc7/2+JZWIghUe+42jIqXsgQ3AbrFretTrYS05IeAuxa5yBJtxtzguVc?=
 =?us-ascii?Q?KrNkxcEB/5aXF1HDFDO6d96VpT1CcrCpboq9v0AVFK7JcHx7r1MaMnS6RTjM?=
 =?us-ascii?Q?yCJfU1k5ZbzgTyxb3r2c+iVh6XYinkoNmLcsLzKk1xtPQTjpUvT2xxWbDzWt?=
 =?us-ascii?Q?209V0TxZSV7nq8jJ+9hDBsAz8qOOIgS3Z+XKdpKouREBU2NIAeNaBQmVdrvD?=
 =?us-ascii?Q?As6u7R2pEy2BZbVUM0mPq113JtSdrOcTDuAJ0FG8a4o8NYlH1OChXFCdGeFo?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3418FC3485EB44F91A1589C3C7F1FEF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dae545-92ee-4657-e85c-08dadc7f72d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 20:28:37.1481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogoWQgcU7Cp5SEYOPNqppq3QO7Q9khVkSGOEsqr//8xFT69q5pBaiYrXs6JwvDkwYfkDMfLoXqw2Szv4Jei1puWD5sy4XXoCjquJqxp+nBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6832
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120181
X-Proofpoint-ORIG-GUID: L-V1avErN_2QcVk25K-QyTiDeCQr2JNL
X-Proofpoint-GUID: L-V1avErN_2QcVk25K-QyTiDeCQr2JNL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On Dec 9, 2022, at 9:29 AM, John Levon <levon@movementarian.org> wrote:
>=20
> On Tue, Nov 08, 2022 at 03:13:36PM -0800, John Johnson wrote:
>=20
>> +static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
>> +                                     struct vfio_irq_info *irq)
>> +{
>> +    int ret;
>> +
>> +    ret =3D vfio_user_get_irq_info(vbasedev->proxy, irq);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    if (irq->index > vbasedev->num_irqs) {
>> +        return -EINVAL;
>> +    }
>=20
> Why are we validating ->index *after* requesting the info? Seems a bit we=
ird?
>=20

	That check is to validate the server return content (to the extent we can)=
.

							JJ


