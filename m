Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3383790DE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:34:49 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6zg-0002Ib-62
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lg6yB-0001Kv-Kl
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:33:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lg6y9-0005F9-BT
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:33:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AEScij168990
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 14:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=eBPJQzdVqKoFbvLjN90j9xOg2gZ4raNZfKsC69JZMkI=;
 b=xk+6oXGHPpnnDk9AP3ekGk9/i4VIaJH2J8zEXqIi6o/6b62CRtiKDSlME+gyhiDLI2mO
 YFE63fPLusOQpXbHgcZuBqP8M39iYfQ1/vb3shUD6qxGzg/JhxtDaT6SHHOqNnIq8Eej
 xs2wY/t6RKxN7J9oNJbMP9BIuJvPrD0HOW0RCpj2kOgsVfSkhEv+tQmzmWd8hAvYb93L
 zg6EXrFWMslrd3BCJaXOHF9rXBPFF5xhGy679lP3NDGo8Jbj2a8dETWAlLEZOa42/yfM
 Lt/UohShQoo7hPylCsGAYihx8eCKWF38FSlcVaF/Ed2tou/gu0Neotx0jS8AqPiAS9vT cQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38dk9nbdrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 14:33:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AEUdNC024577
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 14:33:06 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3020.oracle.com with ESMTP id 38djf6tyj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 14:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8Wa1TnsNXdhD6tXrYkTDEVoxpLPDdOv+pqoTg93Yu/qIwmCvfQZQZbZ2Jbs7AmtjPvksTV84T2kzHSGZebLZ/Aq6WdugYsEafPhCVukzPyAL6kIFIvCUrMKI/WtFQP7/1vKdGucbFNcHLEarki8qMk51K/Gsa88sPnsOqa2tWv3gZ5t3IiuY0PjpvHHJb3jypJH4W7oUNcB6XREwy5e3Vqab960H7qaFa8kkIo+W5fGRmRk9GA3kEXAxsRZ1jf3RNgfndtMdL+dehLmDRfxtH6Ef8OOWURj2I21Zero+9Frb3BKoOKA3FeCS94SRl17AQQivQY0FvU0BBpH7cDk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBPJQzdVqKoFbvLjN90j9xOg2gZ4raNZfKsC69JZMkI=;
 b=LFQRNxq7ZKPcrM6NRgZ9K8TA+1TKacmtXzoYVQidx7aQKVJRGC2bE+nnRQwHzgdNss2b1roWY9/5nwIPaBfeIhmRoo1+QsiJtYAc7kLkHsexFKOOkcdR6BynY80QWDv1MQSCWfIJM4u5d9L75uKfb4rtR2aS4fFHZeSs0FQGIj+M0vwxgiPQ0qscIkhPNsITKmQSU5DoBAxZBcIi1IrfCq0Pgv3WxC5Xg23K64wqrQ+JEFm1g96PcDpahaXjar7FADkPTOjDJoji/BzbeHYjVoW284eK6ANDyeAZVq3npAwR8wiXUw09KFhIgwu5QNRbYp35pI6pvziik2czeOGrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBPJQzdVqKoFbvLjN90j9xOg2gZ4raNZfKsC69JZMkI=;
 b=ree3HwxImzWD2dgOzANIK2ruJmks/ovQqVsAXvw53Tz3hub5tJDqkHj+n/7dddHyXD4rS/YebXIy9G0P/+YSg4pNdxBANIG10XIpGg7Kpp7UylGTxmU9o2DEOlzy/czWu27gKFcffF7SKmtABz2OOOBo8ryn+b/n/KYhOoIm4Ao=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3838.namprd10.prod.outlook.com (2603:10b6:208:1b8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 14:33:04 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246%6]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 14:33:04 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 1/1] multi-process: fix usage information
Thread-Topic: [PATCH 1/1] multi-process: fix usage information
Thread-Index: AQHXQ9MjWsCKD1i7C0CepRrK3fl5q6rcyx6A
Date: Mon, 10 May 2021 14:33:04 +0000
Message-ID: <2E3658B8-DE76-46CB-8E2F-E344637F5E6B@oracle.com>
References: <20210508062632.9039-1-dongli.zhang@oracle.com>
In-Reply-To: <20210508062632.9039-1-dongli.zhang@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-originating-ip: [2601:18c:d07f:b000:70ac:1d9c:d38c:6398]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f56da2b3-6783-4d76-520c-08d913c0857a
x-ms-traffictypediagnostic: MN2PR10MB3838:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB38385CE3EC51EC1E3A874E1D90549@MN2PR10MB3838.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3RgHvORngj7xek2Stipjcx2+gMRfb93UNtWdh41iiNt6O4ygXyW8huUlR0bHYbESCBGmbDZylQdFyRmfPgcQQIE0VLDUa5PXCuQTq5bz1xu5phlK5EJDljVm929Ex09DkwjO4IsWCZT/O1e0OLsRgwnCC8j35NZdCGI3hTniT+Rxi8RMjY14PkVuI8Uax2TFj/Bxrm0ERx3CP77iBUsvqEkxz7qhC/vId80HVoRdsP3oXUmHaK2q5TqByKiz1afgie8AUfCcUMofD4zl4BDBdSDUGM6s3085cSe1tax5nJEM9v4SKs1/S9/27fvTwMrM5pEUu0th1+Sv/1aLpRe0kDFKPO+gg2n1otF3YksuhTXM+eRNfsrb0t+oUbMV5tsUms9tFI01KCHCEomBX8bAGqJhHafKmsR339p9UGFq2WPSrp3xrWF5CYUM4o7X737lyU2enOWUTMNuSnTtLdO4mi2YV8Uwg497G6ecE4veTOYGZcdqqZkO60TlNQgfVcn+ytrzgPJdg7qcYjovJIErnJWG6/bWJWui34vnep6up1f/7cnfRr1bcMQVPIytIyoGFlgjMoVHU/EYS7tUB0IVkabUlatnMSKM46l8SSMBUcJ4kd2sty074sLrP+zXubT/WQtX3BVKl8uO2wcsOtgha0LKCUhd7/CSznXb2jNuOiXXA5rWJI/dzEDYbbyZC+BQ53QLZ8ZZtSQQ1tgNOo5cW2pmV9QjcWj7vub2kPPdgvY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(498600001)(53546011)(186003)(38100700002)(122000001)(5660300002)(2906002)(6486002)(6512007)(86362001)(6506007)(966005)(107886003)(36756003)(91956017)(54906003)(76116006)(66946007)(66556008)(37006003)(71200400001)(66476007)(66446008)(6862004)(2616005)(64756008)(33656002)(83380400001)(44832011)(8936002)(4326008)(6636002)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pvFMl3U37R7z9L9Ohc7pLnh56Jw06537YgvXzhkzEcNPzBwAbEAYV2no6Bx6?=
 =?us-ascii?Q?JGR0M1mjQ4sdyYzXTd5WWm/lOErILwkkf7+6RTdBGwlISm/3ij3pwN1u/8Kb?=
 =?us-ascii?Q?VQ60R4gUDOh09yva0TTVk6BPwYwqXvXboqz5/PDSjJGlA95BEIt7prA3aLfH?=
 =?us-ascii?Q?aYnYDKj+9QMU0t1hpTxJPu9I9rmjnQb2vn/Jyh0HN4eocswJL0XjtjL1WiEP?=
 =?us-ascii?Q?bkDcrF4pBvsS6yQ60iAJIslikTBx3wSf5zM831P9SWyDQ7h6s1n78OL4x7fa?=
 =?us-ascii?Q?qnU25eV8kN3bbCyoVgyBEd2jwTAGYxkoHXDqCh85y/6eVT2i31ZHgVIJnz0Y?=
 =?us-ascii?Q?FseZlVFiqCH5QPL/8UFKK7BofviWA5x1X/sJ1/6YQnvJ9dB06gQ652vs0omA?=
 =?us-ascii?Q?9Y77g+05Fkun2cqG74pD9JHxgFEeXHs7vOxtiolTMf5Z3T5wJHGeUFZK/oTK?=
 =?us-ascii?Q?xhO5bkSecgUX8O+/e+u3RBjiIeqdG1ix1KiIddKIyYr0SgJCj4y+dzETwplW?=
 =?us-ascii?Q?P/yGs6JKIAQguNBr5BYurQ7K78Y6qez21UY3y5kwbqDTrLuDqB+PEqZbTUTm?=
 =?us-ascii?Q?XRh5qAue5tVrDzq/skaapdO7/MjRF74XkIf41S9zSXhn7ICM71Qxc8M3cIh5?=
 =?us-ascii?Q?KkAQqBKDieafKp8Y0ouTNlsw5oL/pGD+7yeT5molLoDqjOHJtbkrCd1n6U62?=
 =?us-ascii?Q?+A7Ay7WKGwcpXWxkVpS7WQfOn13b56bNVZZjtkWzKyE4LLALnCuf5QqSxnUs?=
 =?us-ascii?Q?u53sPdsIuquSnA/Oxfu1HW9k5S0jChB21lzn2hKHWjjQYxzg7Er6en/tsLGu?=
 =?us-ascii?Q?6uZrH0cs8cqVrZ70imVPIHgt21VhAya7T1yWYUJrYa0/tivgltZtZL6w7WbZ?=
 =?us-ascii?Q?U2TcMdyfYVdATB8HF8k+6yNs6Yj5EyFD+8gEV7Knndt7V75oWPfOqD7b9sly?=
 =?us-ascii?Q?TkHWlzn4SO92vVQP8b+GP9Qn27w7bxQUHH+x9EeN7nZkXMUNFelRnMDfEZNQ?=
 =?us-ascii?Q?V4U3PHrwrXCfsyjuaXY9lYTRgYSB65rQsXZjE0eYtj/ZmQOvxn3iWSs8IxPU?=
 =?us-ascii?Q?EZXTAFQIifhOad+6GUaA/EJ+7gWRDen5a895Cafdv9J3dsSJIrKFE6Czjrcq?=
 =?us-ascii?Q?tB+IrWkTwOlYgiBomRo65iKOjiCvq/lnPRn5yzwA1hXCqHlEpIpcuYRNRgm1?=
 =?us-ascii?Q?VSry5W2AKgsOAkO452SLDyUzI7E1rd3BTeYNEs7QzuzclUa5cJ5z2EMTsibk?=
 =?us-ascii?Q?+nfRzINt6FOfpm64/9JHqKhseFiUsPlcqtWQK/4xLy5bhhSNizTKifE8z6Bt?=
 =?us-ascii?Q?fyRWC3vKu3+BIHKCRs4TrnVFVNGslifu4UOL1W9v6peD2/HEMxKgdOHKXSXs?=
 =?us-ascii?Q?NvhS62gm2NxlVpgUBHnKizRseRs0?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A21346AE5A06E742BACC2DAD6D329628@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56da2b3-6783-4d76-520c-08d913c0857a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 14:33:04.1521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/DDALTEzuLnb1BdGdQF/7OIJCA6OLm0x1HWjHk3JRdVQJ3Hn0s4ySmyp23RAtqe38XYvtpqt/713M9d1CE7Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3838
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100105
X-Proofpoint-ORIG-GUID: z7kSunAyUofeSGi1G7I6klplFYxI3erA
X-Proofpoint-GUID: z7kSunAyUofeSGi1G7I6klplFYxI3erA
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100105
Received-SPF: pass client-ip=156.151.31.85; envelope-from=jag.raman@oracle.com;
 helo=userp2120.oracle.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 8, 2021, at 2:26 AM, Dongli Zhang <dongli.zhang@oracle.com> wrote:
>=20
> From source code, the 'devid' of x-remote-object should be one of devices
> in remote QEMU process.
>=20
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>

> ---
> I have verified by reading the code and playing with below orchestrator.
> https://github.com/finallyjustice/sample/blob/master/kvm/multiprocess/orc=
hestrator.py
>=20
> docs/system/multi-process.rst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rs=
t
> index 46bb0cafc2..210531ee17 100644
> --- a/docs/system/multi-process.rst
> +++ b/docs/system/multi-process.rst
> @@ -45,7 +45,7 @@ Following is a description of command-line used to laun=
ch mpqemu.
>       -device lsi53c895a,id=3Dlsi0                                       =
  \
>       -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2       =
    \
>       -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi-=
id=3D0  \
> -      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,
> +      -object x-remote-object,id=3Drobj1,devid=3Dlsi0,fd=3D4,
>=20
> * QEMU:
>=20
> --=20
> 2.17.1
>=20


