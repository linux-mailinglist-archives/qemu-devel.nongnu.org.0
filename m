Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D34C78C3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:24:34 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOldJ-0002ti-FN
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlbu-00028q-Hl
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:23:06 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlbs-0003MD-JE
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:23:06 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJHkD010133; 
 Mon, 28 Feb 2022 19:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iHTxSW/9i+JHiB8spq06Q+dclgFfXT8X8ujspiAqxxw=;
 b=rJmwbHFXA25bAfMkTcNZkhFMB8PNSAGv7zRKn6bCwHuDOU1fiv2zcl0PkMjXZyZvN+t1
 emM8Ak8V0Tva/8LXh0TZhHUhRJpeCnaDq4y4YNw31AsYoZ1Ohktj80crXS07erkEdP2B
 mzX48QJ+0MbJsOq/mWQcmC3kAOmu45q4iSNB760D0hmAC4JzJXTT8HIXUPH3HvEGXbFD
 bUPIZUar5Ekt1kAWRd80f130jSakcNcjeACwNxcgcC/1Y4p6bUTB20qHTERL1il9wj3j
 Uf8Nl7Q4EL57mpvpuEWWZFvoZFHSvPJ8DrCvnBNqZzRYgFT5vRS8avliYFtKs0vhI+sa BA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh1k40mhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:22:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJGA03183304;
 Mon, 28 Feb 2022 19:22:53 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by userp3030.oracle.com with ESMTP id 3ef9aw03wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B00AM7VKuiscvlBtrN0TZoAjgKJ23GAWY6yri5RCQHTgXt5MX1wB985HnlMTD56Wi6jWINGSp018d8su9kMkQQ8UXZk6K5dD17Xt5R8PRjhkmcBBaxG43OT74QcA64YirWVcQE24mAgPWlRmsFDt4he2XIVfUI7x1/1qmSLl8MEfOiYDJuP/5nNsWpTXUSVMbVF7l8M2/nS/aRaTycIav+WRKlVgRK7//oRTlXsxpegFGow+8cXYlALFAWTxs8y2ROGryI2UfbaNR5c5Pq2JMLzrNJP+OHb0koVEibytyt1L/4wEDlkHZ/5kzBYcLuIe45iti8x5/Bq0YO1IzMH3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHTxSW/9i+JHiB8spq06Q+dclgFfXT8X8ujspiAqxxw=;
 b=LWQazzF7MuD0TZVwfLz5I6JV/bke3sx4/LOsWUzK4cHtbj5IMKU8eChZ/NkLnXBWIMpnaQw+cNksVf4EO+lO7Xs4zA6fGMY6lKXIa7iej2OzsIXMjroFTkhVeuIzD0J2wBGh1jt3Npxm0FsfCuFbHaNaGKNibjGcd67IkFj+3LlCnc8YG8bpxDj9EYiPrgZnVGiLtV0B81cStbn9nw6UHrvFf/LrCqMinUax06EtRuSHbW7EMaTwegAudTl6tByVFX8Q4WCGX9l1JuRqLJ4bqjFbVEdtpzzQbo4kY1xjZeXUWjYBaAERA+G4wj5M9SLCXQazbET4qzNZDj4qvsJlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHTxSW/9i+JHiB8spq06Q+dclgFfXT8X8ujspiAqxxw=;
 b=kUE7Flz5UyxtA3Wq7P9ej2v0a7iF0iKHLdVrHqgfkosihE9rUuYRvvaR60KmgHDR5bDHNtF+X1HcK4T5p2CCLJ26dZKj1X578/5I9C1c47NGpOoThh/WixdwP8YRZfeEG3qe1x/azZGVqOaA10liTZoANLzdplFQPD5IozSv5Yo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CH0PR10MB5354.namprd10.prod.outlook.com (2603:10b6:610:df::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:22:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:22:50 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 10/19] vfio-user: run vfio-user context
Thread-Topic: [PATCH v6 10/19] vfio-user: run vfio-user context
Thread-Index: AQHYI8roZZ103Xf1P0CtKqubVsMP0qyke60AgATt4oA=
Date: Mon, 28 Feb 2022 19:22:50 +0000
Message-ID: <4BA9706D-FB75-4885-B483-B1D1DA273405@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
 <20220225160622.e7nwnsdkhcsfc4gf@redhat.com>
In-Reply-To: <20220225160622.e7nwnsdkhcsfc4gf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc73eb5e-e6fb-4f80-123b-08d9faefb607
x-ms-traffictypediagnostic: CH0PR10MB5354:EE_
x-microsoft-antispam-prvs: <CH0PR10MB5354C3D84DB875A30E4948B090019@CH0PR10MB5354.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u0m/Xf4EsPlb3a2Uj8ZFul19S3XouN1DT393IAKVTEEIa8s0+wQd0NC9XLF1DvgDKOCcH47nWXQ3ZbacYl+Tg+wgaOHGiU56f/UmHiGcF6Lmn47LsFBZounGgkqTGlwcfPlu7HKSmbVV4RvSfKGGSiTlyFtzYpD0w+eEovr9ckjnZnSKcleGNq3aDWDK5RHEB9iKk1ku1WnerUsz/XCyeh33+cVeR5maRhZJo08oAnclSeKpCMlcV44jJ0zjgpvMgQQnc/7R2kOultJ5s6zGGajuT/zP+B4JZOV6BkXrDcAFYDd5uDNz/Gi/XJhyJQRM8j0jcI+B3wiFErYoFVij2yKF+Y3TpP6txPLEfzzKRpG/SRs5oRWqZJOnW265KbTSB74mi21a+xxIc/BkTmr+BsAEnhCHkzU6cofuXJPgNjqxVqI7SsiysainmwKC8bYS+Qq939W/dbSJGwj+DCdGc8ey6nYITm/u9RKJWfiogGZBRxivLtRJVTOqe1+QtJezvxYZEQtqZBSnOAJD9hyzugdGUGOtDHiPeFP3WIRpmMvJWpVGv3X2UTH5xI/3qiOpahM566yuszh6q/Y4IBHd2o26XRhi210VvEnkNzQURpmuWqhmTKgukng0MFze4ogYu9NpqBJEuEuquVfnNtLjB//0ehoUortx5iLvEJog3tOVTe2oR+75D6EweHrnYwORg3iBwVN8Rw72JIIlPD/cqUAj6H6k6mqQWImIITKqKbKIQVaFzHddZasGbdfmrf4wd7T1vgm84rqVHl77wbUNz/unSZW7tAaCCyA+ge5xxJ3jvRXSiTG9Z1sJjCoHs48bhTFzcLLWRtTHA1zflvxLyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6486002)(53546011)(36756003)(6506007)(33656002)(38100700002)(83380400001)(71200400001)(508600001)(122000001)(54906003)(6916009)(40140700001)(8936002)(107886003)(2616005)(316002)(44832011)(6512007)(86362001)(7416002)(5660300002)(38070700005)(186003)(66446008)(8676002)(64756008)(66556008)(76116006)(66946007)(66476007)(91956017)(2906002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dGx4IgvSoDQZL9HIS7KDJW3U1zyw/Dtmx3GYkbBLp3nZihyqufniFrCNer0G?=
 =?us-ascii?Q?SuPHU4+Hr3c5HIGAYAo5Aq5k0QYKYHRqjg7iqiFwLCTrl2DJVDjJPR5i5ZDs?=
 =?us-ascii?Q?it7zywaZddywxaAq/YYO9+edEpwG1fFbntlfrG5xJztxy0uq81hgif5zd8BH?=
 =?us-ascii?Q?Nm9a6T+Jr8qZln4B62P89+Sryw803gwkAh5IDt5FIFq0gQXiY2zaX+oNgxwr?=
 =?us-ascii?Q?6hKRvfLa3+mr+b+tCEvuN4SjgBVqUyyQobqTS0xo4MwGLcpfXgtmx2J3XtL+?=
 =?us-ascii?Q?nmqhVrh7Z6pexJf5leI5asL90YgotU+hVfasbuv38hyVV+xcrZwuxhLfm/vg?=
 =?us-ascii?Q?/A76FLv1qKAgBU9c5a7tpqAvRF/SNdp2VXc7Z/JGYG6Dk3RMksWmfVHXVCNO?=
 =?us-ascii?Q?7HLlzIR+jI4H7eQVSZWF4/3CCEDmpoCkymPYoLW1ST569lElARS3O0bi4Yap?=
 =?us-ascii?Q?LCmjTYCKk4oLGicIc9akpQFL3dsnE/sGccau4wteqWc0JpQZDJu0vS08yBFb?=
 =?us-ascii?Q?cpvJ9CLmz+Ek/7lgwdnICEBGJuYzZ1wL24oUeMY+wpqCyKmAQttpJIRvbhP5?=
 =?us-ascii?Q?fVsdLtc4byYtbwahx6RmUIfpZk504Kc3yyKy7yuaR4alVlXu+ElyFUwZdgyT?=
 =?us-ascii?Q?4U0lQCZrWfRcwetRNY3z3cbhdArQGzVh8ZZVKyIAMiqmxjhFvRBwTmb7pd+1?=
 =?us-ascii?Q?fC019QA03IScGNMbAbC29Il3hMH/swl0zWGAqTAEKRl22WFWEgPky1KuXXxi?=
 =?us-ascii?Q?I6yz7/1TZQRWAB2wGLCpJqSzbVADZi4s5Zh74NVpte+j7FHU1tOzxb5O0Vj/?=
 =?us-ascii?Q?BDp9eGayfZkbbMXYBQGevZlmhDRPtcrSxHKfJYZFaRg+z6LusquNPLMsv/ko?=
 =?us-ascii?Q?KB/q04TtlMdYYHoO0slLZDXsNIkDL62NWhGfzJVsydhIZ7LV+EeUPSnhVQhp?=
 =?us-ascii?Q?WH7ZAZBPswZyu4jWiGTNNTCvqPcjlhuqP9zWWKksCy1MuSDR5W5PPIJhUFsj?=
 =?us-ascii?Q?34k70FvyzAJ/JFlTM2BGyxs1scB1Pn8Fx33gbL+GFQJtIJ0pD0uiwghjUfs0?=
 =?us-ascii?Q?tDcJyLBnGKHQ1dRgwm4k+ly2tgDDtlVENHWPw1bm0w8H6oMthiXBA3sHZgmw?=
 =?us-ascii?Q?+r100GWUm+zUmajp2ZCYZpywJL4ldMILB+l0+cTYRuPU3bplmI+V0d3Dvwan?=
 =?us-ascii?Q?9mrzOO3x2xxafcB9PsODXtQFCQNv3xPyKeK5kaVao5eaJXY1nCaYWZJU9fhE?=
 =?us-ascii?Q?chhmOb1sNLGhi8s7POOSpdpOebJdqGvSRetViiYOsmO1130UWdmbBEEcmeNb?=
 =?us-ascii?Q?3PUzANJ/OoKZnj7hmF8uBrVI+SQw58/pn80vvJmjeDJJx1ya2gQTxZrMuz6e?=
 =?us-ascii?Q?2Tu/HjWn2RHxAXsgeg1uSEtF6rj4Pk/1KDu2tpObvTaQ0QxDQiLQ9UzrYjq8?=
 =?us-ascii?Q?wLg1RvOalw2fzZIBUI36F14WJgkFtVsUaaAvjrkx053ERu2vpqdEnoz4+EuC?=
 =?us-ascii?Q?T6uc94Zi7dermSiwu+LvcVmvfoXwK0AnGRj3oe4mCi4WuRB6ZQFyBKbN9ayV?=
 =?us-ascii?Q?bEgbnNsvuB7uLZmT7OO/r4cIYArm1ovHg+UWSrSmntCR25rhvFmX+z+7XsWg?=
 =?us-ascii?Q?PeMNZCqmhPF9btpd5McuGWMg9qati6Te29MOxK43GZHfsX/UtLTTUe8u63E1?=
 =?us-ascii?Q?qr9L6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61A29B42BAEFB340A672BCCC32ADC2E2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc73eb5e-e6fb-4f80-123b-08d9faefb607
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:22:50.6117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUi3z8vCJVL7+IJFsUVQCJ0EsSCy0qwEOQSvrRwUTB+WOLTYq5Is0c7UwJ/buNWFNwXknR+r22dw25+vXzHtng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5354
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280095
X-Proofpoint-ORIG-GUID: MAd06lwlRRhZZAEFUQkv9Scq7e8spIbK
X-Proofpoint-GUID: MAd06lwlRRhZZAEFUQkv9Scq7e8spIbK
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 25, 2022, at 11:06 AM, Eric Blake <eblake@redhat.com> wrote:
>=20
> On Thu, Feb 17, 2022 at 02:48:57AM -0500, Jagannathan Raman wrote:
>> Setup a handler to run vfio-user context. The context is driven by
>> messages to the file descriptor associated with it - get the fd for
>> the context and hook up the handler with it
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> qapi/misc.json            | 23 ++++++++++
>> hw/remote/vfio-user-obj.c | 96 ++++++++++++++++++++++++++++++++++++++-
>> 2 files changed, 118 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/qapi/misc.json b/qapi/misc.json
>> index e8054f415b..9d7f12ab04 100644
>> --- a/qapi/misc.json
>> +++ b/qapi/misc.json
>> @@ -527,3 +527,26 @@
>>  'data': { '*option': 'str' },
>>  'returns': ['CommandLineOptionInfo'],
>>  'allow-preconfig': true }
>> +
>> +##
>> +# @VFU_CLIENT_HANGUP:
>> +#
>> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
>> +# communication channel
>> +#
>> +# @id: ID of the TYPE_VFIO_USER_SERVER object
>> +#
>> +# @device: ID of attached PCI device
>> +#
>> +# Since: 6.3
>=20
> 7.0

OK, got it. Looks like the next release version is 7.0:
https://gitlab.com/qemu-project/qemu/-/milestones

Thank you!
--
Jag

>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>=20


