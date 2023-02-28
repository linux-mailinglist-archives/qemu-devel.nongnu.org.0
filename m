Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86C6A563B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwoN-0007yW-C5; Tue, 28 Feb 2023 05:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWwnt-0007xO-8q; Tue, 28 Feb 2023 05:01:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWwnr-0001Dn-4Q; Tue, 28 Feb 2023 05:01:49 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S6B39e028415; Tue, 28 Feb 2023 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=LSXTnurRh+M3S1MJJ1sVwSEPi/01kg3JWcYGDvIeabk=;
 b=mL8MkoDaSAw5XiVI71IjPQ+/rGmYAYPxWEdsL+FemNsRemM3o2rEJTZpsuc6iEW5tLeN
 nxNBI2u65thELlRRofVzfvVqozjs/RQSAnz0/C2+/IRZsyVWVwgaNfSNfHkZMZpKCWkr
 XZY/2MTg72zvZREfz9cDsqtvHZdTyqrVHOyu49E4RVgfbIclA2/lTes11+PE5M+maA6R
 pdYC/qLKcSF8DKMrLyU80+TzUgl9i/xWL+IZYo3NXxhNu0rxzv7qBfGG7umS9sVBArn0
 k8nELC+G2JMIMW589Uss2srhIfr34gL36hE+rsHK+UpO5NbSD8ETI3hLHtz8NO9A+Afq 8Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb72dscy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 10:01:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31S849K0013169; Tue, 28 Feb 2023 10:01:40 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s6jdkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 10:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT9JxH1pFg+UBoofgLdVtAwThaZxVsxAHdXqNYXlQ3zMYVmIeyZhYiAGsBAeyQoiPkVEigcAHQFAsAwLKszM22Vj/oUajaOqLLhgZliBpVDdisvnOEogWpwY3ObaLtFgxX0Lx3rbnHNPvEOu8OKpqR90njwV3/RBXekbxcNjzbctnRXNOXq9voJhbSe9SyozKdaA+ktpqblm1IkshYZuXUOsdl6jMcXn9OIfDe346AGqK6PXU6VbKhQb/PCCivDzfXao1rSuU9+6sFGZqe7eh4Qd/ZMseJgw1tHo1IWfkNLZ8xHEtWemx8YdylTJbcoXM4H622b+WlL6aBdm0hbEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSXTnurRh+M3S1MJJ1sVwSEPi/01kg3JWcYGDvIeabk=;
 b=goubZQJf/M9IZZrI6XJWfbPqqIdyNxpt6OqA04NAa14PAeN8AOt5W7J15JZIs+oFbrVUhygrgQMDIn7Co0oj6iL8niSs+CJFo7U5ZLMoLWFIyVcVP1a0FXE8H3XFUnyIckX4Yc1Qu8mO5DvBawAf0MHWfhhlQftHnFYHchE0nDbJ1OytYafST9whqHeS7PXG8B1wIH6DGA8EfK++IK1GeBFH8nG4IUphjYBBBxdV3qNfmAGUqXP9mkb3H+Fi6R7dKaqm5QmRY5DVHCvoYFbscNa6L2mFPtR6SM816JaeLae92HndCLd2cNzIaYmgXmzGKOruDC42u5fEZdCykVr4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSXTnurRh+M3S1MJJ1sVwSEPi/01kg3JWcYGDvIeabk=;
 b=Q0FD+zRs+gNgopuJTY7/u8+zjPKsqKre3BfkYEKd+MBDJ+wvf1V4xjmUOKhdU9qQCXsuVAh58yrE7hIHHAgVBNoh6f9PkJKQIxEB/Zy3PlZW9jQBHmfpSKHPqDB/PxN4JjZyeju7o3qGB4Mc/6eNC/xwHuGxZ1hw4ifeD7PY0iQ=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 10:01:38 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43%5]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 10:01:38 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Cornelia Huck <cohuck@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Haibo
 Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [RFC PATCH 1/5] linux-headers: [kvm, arm64] add the necessary
 definitions to match host kernel
Thread-Topic: [RFC PATCH 1/5] linux-headers: [kvm, arm64] add the necessary
 definitions to match host kernel
Thread-Index: AQHZSsuP15j9F2Gddk2nqVgo+QFfrK7kIaeA
Date: Tue, 28 Feb 2023 10:01:38 +0000
Message-ID: <558A8282-32E0-4A41-8B1D-00F9FCC80A64@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-2-miguel.luis@oracle.com> <87v8jn3vf0.fsf@redhat.com>
In-Reply-To: <87v8jn3vf0.fsf@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|SA2PR10MB4811:EE_
x-ms-office365-filtering-correlation-id: caf3eb80-b338-41ed-4a8b-08db1972c855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3H3J/6h6vUwxMIUw+wRW5Za4JHGDQMGUZhZuaXrZFOegZEPKmwBrdoV1WxKBks7WgwMxjx9i8rFDf4XWYc7/Gq3ttA1tUa8t/CGFhMMOe/0VukW3+SxCOwb8091x6VZsrTZ6DVLpmqSPf5R4R04x0RyYxSEvcgmjkIobL+RYpC7XHXgyYMQvMNPwGi1VB8Ccjwvg94z8qx7bM5eIH/dr6D9HJ6SRmO7govLwkLTD2zNUtifsglvmhUIIqezc7jEuNSxKv4x92PXOrVconbwsimz/I7I4nQyf4QjCalxI1xbFUbsEpLEtPLDD1DwvVdYaI4+W20K2Pa9LT07Ae/DqIawPP67A4Js5w2QMrtW8w9oJ8XxQ07ZNdFtYa31W0KbrrCix8YKlpl3KdFdC/9QBYoxJ6lXEXwhli+03OOniGmEEYAzucPFafvxr6CQOPYFAPpK1JEN/M080XaYXc/Azb7SEPgqhVjlkE5eJNIUSajS2cU7gTImG7RQ7/GVJpOHGy/K2ag9vA440RoW2gI7E/JatRV4WOsYgexC/DbluVmrn1RA7Qvz0ktCRPxJJFSWhhChwtwFJa/GEYXIXjriL4YYlkWPyCr3bUFNgqBIMaHzJfbZv8Nxzxqdupu1F8CLamaT3glbqnvqCByf82bmq82mkgEmYyi1I1xSDKwqgi26YUCxF+dFCwtdI/wODMxwvaw54WxnFB73iEmqNMtn2EwUXcaALLeqoW+sO6x3aF34=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199018)(36756003)(86362001)(33656002)(66556008)(66476007)(66446008)(66946007)(64756008)(8676002)(5660300002)(6916009)(4326008)(41300700001)(8936002)(2906002)(44832011)(4744005)(38100700002)(38070700005)(122000001)(71200400001)(6486002)(966005)(478600001)(91956017)(54906003)(316002)(76116006)(83380400001)(186003)(2616005)(6512007)(6506007)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YpTx13ZtWCqueClsMMAWdhjdDGhP6X0iReBnljM994n31E1OqibZIk727G0c?=
 =?us-ascii?Q?pbSrWaJlI3h7XQGSXt1JOasqoHlBIjyIITRYO9Z0jS4GgAm6DMhZJNpDO874?=
 =?us-ascii?Q?dg8PnQB3+6Oj91NhgyJhoycFbzD2gpRE06WYuYRqaU1aI4vrRLTIDKsTfkGn?=
 =?us-ascii?Q?3CtYVg+x3+df0/WYr9UJWlBV+eUBlOOQf8g5O4EnhXVOnddO1QBtRPofc2AG?=
 =?us-ascii?Q?EOmjawASVFthJih+V5aUIdWryhW6x2z+r4sRm5/oSGvnm0rHaeznrluqPDoj?=
 =?us-ascii?Q?wHmMc/nw1EFGD88PfmVzXpK2PX/peJMWvU/o230bADIRjFm8FzqjsSRqpH9T?=
 =?us-ascii?Q?LwwoZwq+cuJl6ZbsDEy4tUSm9LPZmhLUw2g6EZ4I+hJ7qXxJrkNUnAxYBeVv?=
 =?us-ascii?Q?sl92At07E/MqFwEq9mprKjOLQjjrXfEUNT4ICPTUK9BFof8jMkh+bnHZMDyU?=
 =?us-ascii?Q?00NqOaHqBzYY2mY52mWtAbPn0xUWN65b35lunrB4aYfi9y8IZG362DJMQLKP?=
 =?us-ascii?Q?gD/4Ug3pU+Z6FLjRz8I5Ak86WjIvC8GtBb0j+Y/ZB6bAaPXqRqztHSKV4vvk?=
 =?us-ascii?Q?r3ZSXB9fP8gledxrIlG+Dlquo50Q3Ql8a21yo2/HaKOVSCSjelqecDnY7ZGm?=
 =?us-ascii?Q?gaW9jWVOoFkoOvR3uej1Ooj1kwXo4V7YrVDkuzQsq8+FkVUpCYLES30fcRYS?=
 =?us-ascii?Q?Iw4vB5ZTY8qMR8Q764cT0N2NVhjOjf6JYno5U35XeRkb0+NydwWX6NFbDMTg?=
 =?us-ascii?Q?mMIMK1B2eSniJlnulOE2VgOe61Cf0l7yrpUNj4aEARmxDoOLKwI/Lf5Jf+Cm?=
 =?us-ascii?Q?L9KPb99UFAc6Um4as406nCSHl6DcZHA4YfXtPjKznVnPqeQqHw95SvECwpUC?=
 =?us-ascii?Q?RDo+dIrGZ01ndz4/z4wwINB7GIxm1paEKp7LfeP+ypMGhSk7+arqPaexSYZW?=
 =?us-ascii?Q?KDEN0S4oW8psiBFsqu2emo0eo2RPCyY6xm+pPCpVDdKkC0sCUKCr9QOuHbdp?=
 =?us-ascii?Q?gR5EnJqjo4K72K5yFxjQaKcO4k3IXX9FOzltQ22+gCUHkbSs0gdAgWL1FBmv?=
 =?us-ascii?Q?t0zT2lQ3ImroTtcqWWzvzjxfmK41jsbzK2pfrB6w14P59MLjCvaa7RKuSp5d?=
 =?us-ascii?Q?lh//vGKxGsi80mH91ruAnPt5LG0bXfCKvYf9RmXR8yFj30ZP1uCnXI4Evkc7?=
 =?us-ascii?Q?aF5DhKnc0ZDRsEoclf9wn8xxH6t9Guw5MrLzvtFTZbNeFDeraWZZYt9FzAFw?=
 =?us-ascii?Q?tecIgg6KLNpa90Cw32+RGiZ4F+m8qcLlSTU/AiyaqHwi6M5QrMbzGmS8vk4S?=
 =?us-ascii?Q?LBhNgfS3NxuKgptw5H+r6qX6yWEeBY6/GhXMVvfywJljk82IFFn28n4Qrbhv?=
 =?us-ascii?Q?maqNqxAqqf7u2f0Dng04hyvXLabGHWbN3lJpVnlIS3h0oiMayR1LQBKMwtKQ?=
 =?us-ascii?Q?gpY3tN0Q34GH5+wEqjYkxSvW7QaBzxt61RV6LrvQuqO1sObinS49I8Tj/ipn?=
 =?us-ascii?Q?OdhKzmuDFZJl6oziSZmq61PuXGJWB2j3lTKEA3X+StgNaGomuHU4LpeceKam?=
 =?us-ascii?Q?KIOt4g0qrw00pXOfVMvJsk0kzc6XmHqLEO1aWPxtNm5bs5+2F4NfEzdy5IXE?=
 =?us-ascii?Q?+vZThsLHT+3i67+KK7O7qB0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B0055DC25B4734299D22F5153AA712C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GzCpPj8p/7WG8f6j/QRjeckB3sIho9YRaYs5mnnLuxUfz3xvouyNkbkb6DMhWmdd/ei07wJjQtHYTMtENcj9qdDrOnHvZiJqG7PP9TWz5Pd50bX1h1jn3cvaSrhVFH8k5LsiX2SIRBgvbF62qOHuJkmYNLeXUuuig8cJ/+uc8gI6DxC75UnnWTGTc0WFW3B4Aoq1fsLo/kjzsCO/+RBW34MfvUeeJF8Y/OZmByv3naSK62rEom7GRmpyBCYOJQYqZIEtSL8eBv8tqx2gw63OigMpO8XDBZi+FFOhZ7g1DN5hg49C1MZZ9aKzJU36fqeawqHEdY8+FcK4+G4hLIscV32lflTT309juqIsjOGSSKdZD6wZCxVl0OsW4uHkALJ0h97tg6jXuKvLvu1MVxzGzDLhwgQdjhiGQY6sRPY6cUxfyiSUOJY6AednywxasUa8OVm2S/Epx8Cfd9btgSLIraY2hP70CutcP5LVOAQga8U0jCgaZehsBraU14M5zg2scCxeQE2OjqR58HzzWUSsdcjdmErR3T75T0ViHhY2H3o0lmYlhjoLVgIPjl6wdtUWQU9Juqg4J4dhQLcNUyVyWmxm0f7cXxJez679uF4ACmYnvqXpsS0C4Dp5giHZk3eFZGKZE5pOa9BDiOre2WgIgaPYjl8U8RgaCNTTTfmbLlfbLKNOWWj+1rerr3rWD0aB+CFucJlx4grVb7HWcx0TBmGeboOh9XUjQiSgVnaZLIMxwmzART3nTNJ2R0jUQr5Kx+mDB7NFWL2K7oIwsFPlEJCpQEJZVrHUmKHv+VMjIm0/tj5ZaLi11Roynmceo4rQMSq/RAPkyeyUGm29fiwOiA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf3eb80-b338-41ed-4a8b-08db1972c855
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 10:01:38.0431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0i9lL8KLQQNS96BQYburJ8iPOIBODJX2Lbv6iHvFbnyLi/HJJBbyMyH/zyTE78fUdTloL1CG9HpOpd8spfheyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_06,2023-02-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302280079
X-Proofpoint-ORIG-GUID: _a4JCe47-DLCejDc2CIp_l7_ZghB371a
X-Proofpoint-GUID: _a4JCe47-DLCejDc2CIp_l7_ZghB371a
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Hi Cornelia,

> On 27 Feb 2023, at 15:49, Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> On Mon, Feb 27 2023, Miguel Luis <miguel.luis@oracle.com> wrote:
>=20
>> From: Haibo Xu <haibo.xu@linaro.org>
>>=20
>> linux-headers define host properties needed for the VMM to interact with
>> KVM, so let's include them *while* they're not available yet on linux
>> upstream since aarch64 nested virtualization is still a work in
>> progress.
>>=20
>> Ref: https://lore.kernel.org/qemu-devel/636b5932e4cf061b6f97516e82d4319c=
1d29b871.1616052889.git.haibo.xu@linaro.org/
>>=20
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> ---
>> linux-headers/asm-arm64/kvm.h | 2 ++
>> linux-headers/linux/kvm.h     | 1 +
>> 2 files changed, 3 insertions(+)
>=20
> Can you please mark this explicitly as a placeholder for a proper
> headers update? Just so that it doesn't get lost :)

Sure yes! Thank you.

Miguel=

