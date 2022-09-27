Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AB05EBE4D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:18:26 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6jQ-0002FW-Bv
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1od661-0002Zj-7z; Tue, 27 Sep 2022 04:37:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1od65u-0003EJ-Vf; Tue, 27 Sep 2022 04:37:40 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R8SvW1032591;
 Tue, 27 Sep 2022 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=0gS1Q9eGQjzaCG2OK/U6XkHwQRWE2a3Iu5ja/g7ltCs=;
 b=LcRI+CPz6zkwGLgnhSSG/hOIC8HvCbY83hAFAHAEmtKIyWS2bD/A47wT50rNYroz9/Iq
 BxpPzD6QP/IlLgCESpcHXKIm8OgpBd+V8GSnbqYlWEoWR92ysQMN2VirSXcIF6Nk2Ppt
 AFPnqcRXvLXFy9EGXOR0bzgYdtAffoFygIFAB9lGXaC/214rPCYkkZiV4Ul3h4hnYm8w
 OFMZdHmFwwlP4Y1UYaCa8fbQzvvjhi6wURCwvNoEBBgj53DY0hCVANdE+Jc5QaGgJKJU
 BRUD5nXKR31k/e8YNs/nvSgPKwFPHSP0dQmRk3nZvDQHb2LpAIUWNLv4Y85clGeofQyY sA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jsstpnrya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 08:36:52 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28R7GUiB028219; Tue, 27 Sep 2022 08:36:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtps51h3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 08:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOTnZZ5VERlXZ+ekGmqME9MhHKUPkcuW30YYrTr2X5N/1WEKtK6E44yE8bolvU9XYdKRIEHKhPPGGEzGsyjAAeONhPiLIm1vX0/lhjPcf9t7gTnF+7DsKsFglDrIqr0XSjMdOisYkpTlFFV6Jy6mufuRsj9YoytXx2E+4d25jAUchc6Vk6ZY/DFMbgRHbBX5s6+ltFq0pVFslr6P4pBue1qnF/0KY904Hyz6d0zKorGTnlRC86l0C8PGAucKbc3lC4ET3U8CBDQ8bGBC4bH6Zf7F4DunwvH/89UCoQJfwUwiDFQJYAGjG7GX2OyN3XOHaa5tWkwsWBnWfkb3KDkllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gS1Q9eGQjzaCG2OK/U6XkHwQRWE2a3Iu5ja/g7ltCs=;
 b=AFKuqSBKpZIGpKRhS6um9pXmn6+p5rINhqUrnHiG2bV6FJgZTnOhppPrgSrhHI8thNOkNPpvujWGZUN98LmU98ajiMYZRSZIgDMMNo7uGIloEaWp6ZnbGZlmnxhEyKo7CLcfIIzP0h9pZbADYKLmN5jQ85e3SlcYvtiLjcinxzCpZJxouMqE84EKwBBXjdVZgScA4Oaj7V2nFQPoGhdK5KpKnf9KuV/OhYSMhwSxZsOlmSWbbPf62djiBpbE18R0zBT2YPwSjz+/IIwJW6ekzLuio6US/0k6W002yCETWyOsjgSAtpKXbM56Rj5EEJVOxoY0ZD3iIAEaBy1lALEFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gS1Q9eGQjzaCG2OK/U6XkHwQRWE2a3Iu5ja/g7ltCs=;
 b=u9ak0JWz1RKuwN4b1yVW/ll0e50RyeeIJgIq3/yJjS9Vpkf1+5+bI0Vao1rmMFv8FWYZ4qF9yq1H6YWakjPvcVONC7evnh7XeoiUt6+l/E6NALI8YNhoKdz3XHSjECyP86+RyA4TsNM+TwWRl7fsv3CgyIlQMDGY5mBJNvR45AQ=
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Tue, 27 Sep
 2022 08:36:48 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::e12c:551:61ce:639e]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::e12c:551:61ce:639e%5]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 08:36:48 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: "mst@redhat.com" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, "qemu_oss@crudebyte.com"
 <qemu_oss@crudebyte.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "david@redhat.com" <david@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "arei.gonglei@huawei.com"
 <arei.gonglei@huawei.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "groug@kaod.org" <groug@kaod.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "mathieu.poirier@linaro.org"
 <mathieu.poirier@linaro.org>, "raphael.norwitz@nutanix.com"
 <raphael.norwitz@nutanix.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [PATCH v15 0/6] hmp,qmp: Add commands to introspect virtio devices
Thread-Topic: [PATCH v15 0/6] hmp,qmp: Add commands to introspect virtio
 devices
Thread-Index: AQHYrX2Nyx4pqClgUUK7GFQPk+Vhn63zOMX0
Date: Tue, 27 Sep 2022 08:36:48 +0000
Message-ID: <SA2PR10MB4667615B9DACA84924AFE5E9E8559@SA2PR10MB4667.namprd10.prod.outlook.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR10MB4667:EE_|PH7PR10MB6081:EE_
x-ms-office365-filtering-correlation-id: 8086b9c8-eaf1-4eac-b1f6-08daa0636aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +brF/xdNxvl3G+gtwVXGKKiRtjuM9A+NAZz3+ZItuNL7gByMu0HiriU1OmN/aiaAUXN3MmEHmXyaGKE5tPro+8m948LmvhTWHlmPTXN6z1jRA1HGUKVLbNKiHKzObOt+KfLm3cRACZR3XlG+HiSTBT8yFtq+Yr8eB0cRFlfZhPf/3852jSxWrGflnlaQaXwER30L7/W1XMDGcPoqVpU9aCyJLTuhqcBGwd6gyJwppUCS8w3ZFKo0ST80HBDKEke98PtayJHaL/S6itTEsg1t9Nsq68F8amG2gZSj3RsxXZciYdALroeeyaxUdc+1LhcFtVPPX/991BT8CpCCu+IWuhZknA5jfZxF9R/Uwe1zJccBcz3834K/tgrrCdquBN8wS6yL8HcYsLyGbxyCrqepfSg1UZ2lN2TawhmPYP3/jwrDL7tOx+AsGKf648NwfxQKCkfg+r32D4tQAODUiecI6bR6ibfIF9ol1rrjZc++j3vpaWL9WLnxwxNGQpAimPmqEGkrbgCvSqWQNCA0ty2gLTHglWoladwXv5ULTSnWAMB/V0OvoaKtnHcyFYCzNfYGHAa6y5pIDNkFTfdz2Tp2/Kh29rsgkxE8XfMT9RdtaiOUKr6F7bgY3bYTVBa+15aIapYB9IDg/sjAYiPRSQSgUmq+V4wnohX/TWK1Ai2ht9BeJkn3PkMgesnlsptxKvU12RQLXo/ervTqmgOF3GGLIscPwRRsXQuQ3hy6PAeILUko5ewbXMxqx+azbcSWZz5Va9QgnIPrKS6dm6g7D+aSyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(186003)(2906002)(38100700002)(26005)(5660300002)(52536014)(7416002)(9686003)(8936002)(44832011)(6506007)(7696005)(53546011)(30864003)(33656002)(122000001)(86362001)(38070700005)(83380400001)(55016003)(478600001)(19627405001)(316002)(110136005)(54906003)(71200400001)(76116006)(66476007)(8676002)(41300700001)(64756008)(66946007)(91956017)(4326008)(66446008)(66556008)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D4PKnP3i+rLuqILfj8RnoNGMImaPa3ngEbT5N1bBXGS/YcB6wZDOWeIm2Gm/?=
 =?us-ascii?Q?5bs11DE3eNtm2x5gNvOKy6lv1kUmUV7hIg5h5sWJbErwoueYbJrsMJqm8eed?=
 =?us-ascii?Q?+rMlq2tMs4hIVj1X0CJidQX8Ex2Bh9ypvK+mv9RXU2tvZT5sqmUf6QTzIzVb?=
 =?us-ascii?Q?5suN4fjlst4XYerZsjOcoO1z5CTgP3CbySsT4fRr5VZKp8X7onLFmv6f1hID?=
 =?us-ascii?Q?21wiMO0KhJOfm3izbK71Cb/NTryJwQ1n5WPy4qNjx+SkX2+0Utw/SEjSwl1C?=
 =?us-ascii?Q?TDpnsVZJW3HP6nICDM5nqa8fgxHC+/637ymeH43GJJPSm4fyCn4aV8eFh5K1?=
 =?us-ascii?Q?Zl+sipsJHk9QBwxEh+xsZVbVza+ggjtobD3fTssklAhw3k9qMuowsP9b5fPB?=
 =?us-ascii?Q?2ftmeDxi1RhWtKpCqT/IvRXTHM/3xEQkX9qd8Bfwi54uqooqx5vjO13avmM/?=
 =?us-ascii?Q?kvaPzGuz25gxILsU5JZjHngMQKAzIyXJ7T/jOfQNoRQXg9w0UCA1I5rvH6uh?=
 =?us-ascii?Q?pN85QuZ1tA1nwma83qI5RQvtBKsDhB+gLbb2GBtcpKKWNIO7JOjCSPpTvGzz?=
 =?us-ascii?Q?4F/27106sHl8SZ5SBEwq1H/gFtK/iO9GwZQw3YAObgTR2wnFyL6UexShP/xo?=
 =?us-ascii?Q?ktcserb/nbnynLYpSGOMCI7FOvyXT2cgMKRFkp+j2TUCh9cyYvpaD9Vp+9sv?=
 =?us-ascii?Q?WO20YzRk53Hm9TnMS/8v3DtKOfoAQCuppkkN0781XH9VfP1Vcl6rzP/Gpp9I?=
 =?us-ascii?Q?R/DJFGfkU7VSRvZGzZ7REakG5GygxO59wYnjqJGeSFi2jth8dL6QiGZxW41N?=
 =?us-ascii?Q?tOxfEiDzwZ/TfFpnUS7LsXbQ2nLp11RO2o1XxTsCv8lsO1uHIR2ynYknU5eZ?=
 =?us-ascii?Q?Krj+1Cvn//p5qJH9hG2jdaUUtJXtTEi8CGNmONDOg1OxsPXXjDNKMcCdGAB6?=
 =?us-ascii?Q?LzEfxcmjuIUhU/kKutZWcxPktlcupE9ODLE0URj160Gh/7DRHZAWKhHD6Cn6?=
 =?us-ascii?Q?QH/aioPBoXWjsVQPbtmRjwitIp/zQIXqzC39z+cn81EXslZz+35dyZTr4pZl?=
 =?us-ascii?Q?FYvSGjr3NKSYElUb9vjMN9kYulKcbPH/ikiHy+ixMp0BOwVyaPYsOPSTFSCV?=
 =?us-ascii?Q?xsXvghBUvJcuYUIi/z/Lqz9xmcx/eLZKsW5Ft6HxxFhxiQkqqyObn84FKviq?=
 =?us-ascii?Q?ItiO/oBuRPBwXuI4GJqKXxaKz5fYJkegzvjaO3W5pwmfG4ZCPgw7nJxEErb8?=
 =?us-ascii?Q?B2RyWa+YSdn7A0y98nyvmtm+LG+pII3XHE6PWCV0B5fQocE3/I0BTFMp7YwC?=
 =?us-ascii?Q?F6T74d7LrJQCVqfgrLyfWhtXRCPsmfHzTbQVFplzeFyKP/NpLIEFaUYqA3Tv?=
 =?us-ascii?Q?7MEkhQ8qEjtvPTNoEQjCXWHKXftqb/RXRuuj9nqo52qZPuO4orSeZYlhWF7J?=
 =?us-ascii?Q?NEXENbVSnCL/jUurMTRU8mCiUTJLmioGk+NG4yCoKBbnx3Q+dzyuvSDClpl6?=
 =?us-ascii?Q?TwnbT0a3OaLS8L6NJ14pKuEqm4CXmQR1dvtGlLJAyT6iZbXW1SI6mNcYO4zz?=
 =?us-ascii?Q?QBuSEPquViGYdn0BytEy9Ay/dU8IQZBj7y4eYA1Q?=
Content-Type: multipart/alternative;
 boundary="_000_SA2PR10MB4667615B9DACA84924AFE5E9E8559SA2PR10MB4667namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8086b9c8-eaf1-4eac-b1f6-08daa0636aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 08:36:48.2021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7VdyhrFECRqgy5pWC4IjwhplT3+QBHh+JJ021zxVrYYUALKnUDSofvAtp72zLNUtCOGG5mM8ODnyRsMuBls7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270050
X-Proofpoint-ORIG-GUID: 9E3qnIDlpKkgzmyo4edJUgcqrr1Mj_9Q
X-Proofpoint-GUID: 9E3qnIDlpKkgzmyo4edJUgcqrr1Mj_9Q
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_SA2PR10MB4667615B9DACA84924AFE5E9E8559SA2PR10MB4667namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey Michael, when you get the chance, could you review these patches for me=
? Specifically patch 3/6, as that has the majority of the changes made for =
this series. Thanks!

Jonah
________________________________
From: Jonah Palmer
Sent: Thursday, August 11, 2022 8:26 AM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: mst@redhat.com <mst@redhat.com>; qemu_oss@crudebyte.com <qemu_oss@crude=
byte.com>; kraxel@redhat.com <kraxel@redhat.com>; Si-Wei Liu <si-wei.liu@or=
acle.com>; Joao Martins <joao.m.martins@oracle.com>; eblake@redhat.com <ebl=
ake@redhat.com>; qemu-block@nongnu.org <qemu-block@nongnu.org>; david@redha=
t.com <david@redhat.com>; armbru@redhat.com <armbru@redhat.com>; arei.gongl=
ei@huawei.com <arei.gonglei@huawei.com>; marcandre.lureau@redhat.com <marca=
ndre.lureau@redhat.com>; lvivier@redhat.com <lvivier@redhat.com>; thuth@red=
hat.com <thuth@redhat.com>; michael.roth@amd.com <michael.roth@amd.com>; gr=
oug@kaod.org <groug@kaod.org>; dgilbert@redhat.com <dgilbert@redhat.com>; e=
ric.auger@redhat.com <eric.auger@redhat.com>; stefanha@redhat.com <stefanha=
@redhat.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>; kwolf@redhat.co=
m <kwolf@redhat.com>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.or=
g>; raphael.norwitz@nutanix.com <raphael.norwitz@nutanix.com>; pbonzini@red=
hat.com <pbonzini@redhat.com>
Subject: [PATCH v15 0/6] hmp,qmp: Add commands to introspect virtio devices

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Apr. 1 (v14). Original patches
 are by Laurent Vivier from May 2020.

 I sincerely apologize for the *massive* delay in getting this latest v15
 series out. It was a perferct storm of other more pressing issues, time of=
f,
 and trying to understand why I was seeing this 30 feature bit in my PCI vi=
rtio
 devices. Please see patch 3/6 for more explanation on this issue.

 Rebase from v14 to v15 includes: adding the missing sign-off-by from the p=
oster,
 renaming & moving all virtio device feature map definitions to hw/virtio/v=
irtio.c,
 including brief descriptions for all status & feature bits, a new virtio d=
evice
 feature map defined for virtio-rng, and mappings for virtio/vhost-vsock,
 virtio-iommu, virtio-mem, and virtio transport features updated with their
 newest feature bits. Most of these changes can be found in patch 3/6.

 And again, sorry for the long wait on this.]


1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-query-virtio',
      'returns': ['VirtioInfo'],
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
                 {
                     "name": "virtio-scsi",
                     "path": "/machine/peripheral-anon/device[2]/virtio-bac=
kend"
                 },
                 {
                     "name": "vhost-vsock",
                     "path": "/machine/peripheral/vsock0/virtio-backend"
                 },
                 {
                     "name": "virtio-crypto",
                     "path": "/machine/peripheral/crypto0/virtio-backend"
                 },
                 {
                     "name": "virtio-net",
                     "path": "/machine/peripheral-anon/device[1]/virtio-bac=
kend"
                 },
                 {
                     "name": "virtio-serial",
                     "path": "/machine/peripheral-anon/device[0]/virtio-bac=
kend"
                 }
             ]
           }

2. Display status of a given virtio device

HMP Form:

    info virtio-status <path>

    Example:

        (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
        /machine/peripheral/vsock0/virtio-backend:
          device_name:             vhost-vsock (vhost)
          device_id:               19
          vhost_started:           true
          bus_name:                (null)
          broken:                  false
          disabled:                false
          disable_legacy_check:    false
          started:                 true
          use_started:             true
          start_on_kick:           false
          use_guest_notifier_mask: true
          vm_running:              true
          num_vqs:                 3
          queue_sel:               2
          isr:                     0
          endianness:              little
          status:
         VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found,
                VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device,
                VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete,
                VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready
          Guest features:
                VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled=
,
                VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported=
,
                VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)
          Host features:
                VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled=
,
                VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported=
,
                VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy),
                VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts=
,
                VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of av=
ail. descs. on VQ
                VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol feature=
s negotiation supported
          Backend features:

          VHost:
              nvqs:           2
              vq_index:       0
              max_queues:     0
              n_mem_sections: 4
              n_tmp_sections: 4
              backend_cap:    0
              log_enabled:    false
              log_size:       0
              Features:
                  VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabl=
ed,
                  VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors support=
ed,
                  VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)=
,
                  VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layou=
ts,
                  VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of =
avail. descs. on VQ
                  VHOST_F_LOG_ALL: Logging write descriptors supported
              Acked features:
                  VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabl=
ed,
                  VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors support=
ed,
                  VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)
              Backend features:

              Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": { "path": "/machine/peripheral/vsock0/virtio-back=
end" }
           }
        <- { "return": {
                 "device-endian": "little",
                 "bus-name": "",
                 "disable-legacy-check": false,
                 "name": "vhost-vsock",
                 "started": true,
                 "device-id": 19,
                 "vhost-dev": {
                     "n-tmp-sections": 4,
                     "n-mem-sections": 4,
                     "max-queues": 0,
                     "backend-cap": 0,
                     "log-size": 0,
                     "backend-features": {
                         "dev-features": [
                         ],
                         "transports": [
                         ]
                     },
                     "nvqs": 2,
                     "protocol-features": {
                         "protocols": [
                         ]
                     },
                     "vq-index": 0,
                     "log-enabled": false,
                     "acked-features": {
                         "dev-features": [
                         ],
                         "transports": [
                             "VIRTIO_RING_F_EVENT_IDX: Used & avail. event =
fields enabled",
                             "VIRTIO_RING_F_INDIRECT_DESC: Indirect descrip=
tors supported",
                             "VIRTIO_F_VERSION_1: Device compliant for v1 s=
pec (legacy)"
                         ]
                     },
                     "features": {
                         "dev-features": [
                             "VHOST_F_LOG_ALL: Logging write descriptors su=
pported"
                         ],
                         "transports": [
                             "VIRTIO_RING_F_EVENT_IDX: Used & avail. event =
fields enabled",
                             "VIRTIO_RING_F_INDIRECT_DESC: Indirect descrip=
tors supported",
                             "VIRTIO_F_VERSION_1: Device compliant for v1 s=
pec (legacy)",
                             "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary=
 desc. layouts",
                             "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device =
runs out of avail. descs. on VQ"
                         ]
                     }
                 },
                 "backend-features": {
                     "dev-features": [
                     ],
                     "transports": [
                     ]
                 },
                 "start-on-kick": false,
                 "isr": 0,
                 "broken": false,
                 "status": {
                     "statuses": [
                         "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device =
found",
                         "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with =
device",
                         "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation =
complete",
                         "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready=
"
                     ]
                 },
                 "num-vqs": 3,
                 "guest-features": {
                     "dev-features": [
                     ],
                     "transports": [
                         "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fiel=
ds enabled",
                         "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors=
 supported",
                         "VIRTIO_F_VERSION_1: Device compliant for v1 spec =
(legacy)"
                     ]
                 },
                 "host-features": {
                     "dev-features": [
                         "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protoc=
ol features negotiation supported"
                     ],
                     "transports": [
                         "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fiel=
ds enabled",
                         "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors=
 supported",
                         "VIRTIO_F_VERSION_1: Device compliant for v1 spec =
(legacy)",
                         "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary des=
c. layouts",
                         "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs=
 out of avail. descs. on VQ"
                     ]
                 },
                 "use-guest-notifier-mask": true,
                 "vm-running": true,
                 "queue-sel": 2,
                 "disabled": false,
                 "vhost-started": true,
                 "use-started": true
             }
           }

3. Display status of a given virtio queue

HMP Form:

    info virtio-queue-status <path> <queue>

    Example:

        (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/=
virtio-backend 2
        /machine/peripheral-anon/device[1]/virtio-backend:
          device_name:          virtio-net
          queue_index:          2
          inuse:                0
          used_idx:             15
          signalled_used:       15
          signalled_used_valid: true
          VRing:
            num:          64
            num_default:  64
            align:        4096
            desc:         0x000000011e15c000
            avail:        0x000000011e15c400
            used:         0x000000011e15c4c0

QMP Form:

    { 'command': 'x-query-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/vir=
tio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                 "signalled-used": 15,
                 "inuse": 0,
                 "name": "virtio-net",
                 "vring-align": 4096,
                 "vring-desc": 4814004224,
                 "signalled-used-valid": true,
                 "vring-num-default": 64,
                 "vring-avail": 4814005248,
                 "queue-index": 2,
                 "vring-used": 4814005440,
                 "used-idx": 15,
                 "vring-num": 64
             }
           }

4. Display status of a given vhost queue

HMP Form:

    info virtio-vhost-queue-status <path> <queue>

    Example:

        (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/devi=
ce[1]/virtio-backend 1
        /machine/peripheral-anon/device[1]/virtio-backend:
          device_name:          virtio-net (vhost)
          kick:                 0
          call:                 0
          VRing:
            num:         256
            desc:        0x00007f804df5a000
            desc_phys:   0x000000013315a000
            desc_size:   4096
            avail:       0x00007f804df5b000
            avail_phys:  0x000000013315b000
            avail_size:  518
            used:        0x00007f804df5b240
            used_phys:   0x000000013315b240
            used_size:   2054

QMP Form:

    { 'command': 'x-query-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/vir=
tio-backend",
                            "queue": 1 }
           }
        <- { "return": {
                 "avail-phys": 4803538944,
                 "name": "virtio-net",
                 "used-phys": 4803539520,
                 "avail-size": 518,
                 "desc-size": 4096,
                 "used-size": 2054,
                 "desc": 140186477404160,
                 "num": 256,
                 "call": 0,
                 "avail": 140186477408256,
                 "desc-phys": 4803534848,
                 "used": 140186477408832,
                 "kick": 0
             }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virt=
io-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]=
/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
          device_name: virtio-scsi
          index:   0
          desc:
            descs:
                addr 0x128890000 len 12288 (write),
                addr 0x128880000 len 65536 (write, next),
                addr 0x128870000 len 65536 (write, next),
                addr 0x128860000 len 65536 (write, next),
                addr 0x128850000 len 65536 (write, next),
                addr 0x128840000 len 65536 (write, next),
                addr 0x128830000 len 65536 (write, next),
                addr 0x128820000 len 65536 (write, next),
                addr 0x128810000 len 65536 (write, next),
                addr 0x128800000 len 65536 (write, next),
                addr 0x116bf3000 len 53248 (write, next),
                addr 0x116be3000 len 65536 (write, next),
                addr 0x116bd3000 len 65536 (write, next),
                addr 0x116bc3000 len 65536 (write, next),
                addr 0x116bb3000 len 65536 (write, next),
                addr 0x116ba3000 len 65536 (write, next),
                addr 0x116b93000 len 65536 (write, next),
                addr 0x116b83000 len 65536 (write, next),
                addr 0x116b73000 len 65536 (write, next),
                addr 0x116b63000 len 65536 (write, next),
                addr 0x116b53000 len 65536 (write, next),
                addr 0x126e9763b len 108 (write, next),
                addr 0x9af8dae7222881a2 len 51 (next)
          avail:
            flags: 0
            idx:   600
            ring:  0
          used:
            flags: 0
            idx:   600

QMP Form:

    { 'command': 'x-query-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": { "path": "/machine/peripheral-anon/device[2]/vir=
tio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                 "index": 1,
                 "name": "virtio-scsi",
                 "descs": [
                     {
                         "flags": ["write"],
                         "len": 65536,
                         "addr": 4852740096
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852674560
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852609024
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852543488
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852477952
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852412416
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852346880
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852281344
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852215808
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852150272
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852084736
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852019200
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851953664
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851888128
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851822592
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851757056
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851691520
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851625984
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851560448
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851494912
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 108,
                         "addr": 4801325435
                     },
                     {
                         "flags": ["next"],
                         "len": 51,
                         "addr": 12075758188190198449
                     }
                 ],
                 "avail": {
                     "idx": 922,
                     "flags": 0,
                     "ring": 1
                 },
                 "used": {
                     "idx": 922,
                     "flags": 0
                 }
             }
           }

v15: added missing sign-off in patches
     rebased for upstream (Qemu 7.1)
     minor reformatting to examples in qapi/virtio.json
     virtio device feature maps moved to hw/virtio/virtio.c
     virtio device feature maps renamed (less generic)
     virtio device feature maps now include brief description of feature
     virtio device status map now include brief description of status
     new feature bits added to mappings for virtio/vhost-vsock,
     virtio-iommu, & virtio-mem
     new virtio transport feature bit added to mapping
     new virtio device feature map defined for virtio-rng

v14: move definition of 'gpu_map' to virtio-gpu.c
     add new 'context-init' virtio-gpu feature
     created new feature map 'i2c_map' for vhost-user-i2c
     fixed casting error for cross-Win64 builds

v13: minor text edit in qapi/virtio.json

v12: minor reformatting for monitor/hmp-cmds.c
     use PRI types in virtio hmp monitor printfs

v11: minor reformatting in virtio.json
     added synchronicity check when querying virtio devices

v10: rebased for upstream (Qemu 7.0)
     reformat virtio.json for better consistency
     removed all enums from virtio.json; replaced with string literals
     removed @ndescs from VirtioQueueElement
     removed examples in hmp-commands-info.hx (to fix 'inconsistent
     literal block quoting' error from Sphinx)

v9: rebased for upstream (Qemu 6.3)
    change QMP command prefixes from 'x-debug-virtio' to
    'x-query-virtio'
    add 'unstable' feature to all 'x-query-virtio' prefixed
    QMP commands
    fix odd indentation for qapi/virtio.json
    device features support for virtio-mem
    move HMP sub-commands under 'virtio' top level to 'info'
    top level

v8: add assert in virtio_id_to_name() to make sure we're
    not returning NULL
    minor documentation additions to qapi/virtio.json
    add virtio introspection support for vhost-user-rng

v7: rebased for upstream (Qemu 6.2)
    add ability to map between numberic device ID and
    string device ID (name) for virtio devices
    add get_vhost() callback function for VirtIODevices
    expose more fields of VirtIODevice
    expose fields of vhost devices
    decode vhost user protocol features
    decode VirtIODevice configuration statuses
    vhost support for displaying virtio queue statuses
    vhost support for displaying vhost queue statuses
    expose driver and device areas when introspecting a
    virtio queue element
    changed patch attribution

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-stat=
us
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail=
.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx       |   70 +++
 hw/virtio/meson.build      |    2 +
 hw/virtio/virtio-stub.c    |   42 ++
 hw/virtio/virtio.c         | 1032 ++++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost.h  |    3 +
 include/hw/virtio/virtio.h |    6 +
 include/monitor/hmp.h      |    5 +
 monitor/hmp-cmds.c         |  310 +++++++++++
 qapi/meson.build           |    1 +
 qapi/qapi-schema.json      |    1 +
 qapi/virtio.json           |  954 +++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |    1 +
 12 files changed, 2427 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

--
2.31.1


--_000_SA2PR10MB4667615B9DACA84924AFE5E9E8559SA2PR10MB4667namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Hey Mi=
chael, when you get the chance, could you review these patches for me? Spec=
ifically patch 3/6, as that has the
 majority of the changes made for this series. Thanks!</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Jonah<=
/span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jonah Palmer<br>
<b>Sent:</b> Thursday, August 11, 2022 8:26 AM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> mst@redhat.com &lt;mst@redhat.com&gt;; qemu_oss@crudebyte.com &l=
t;qemu_oss@crudebyte.com&gt;; kraxel@redhat.com &lt;kraxel@redhat.com&gt;; =
Si-Wei Liu &lt;si-wei.liu@oracle.com&gt;; Joao Martins &lt;joao.m.martins@o=
racle.com&gt;; eblake@redhat.com &lt;eblake@redhat.com&gt;; qemu-block@nong=
nu.org
 &lt;qemu-block@nongnu.org&gt;; david@redhat.com &lt;david@redhat.com&gt;; =
armbru@redhat.com &lt;armbru@redhat.com&gt;; arei.gonglei@huawei.com &lt;ar=
ei.gonglei@huawei.com&gt;; marcandre.lureau@redhat.com &lt;marcandre.lureau=
@redhat.com&gt;; lvivier@redhat.com &lt;lvivier@redhat.com&gt;; thuth@redha=
t.com
 &lt;thuth@redhat.com&gt;; michael.roth@amd.com &lt;michael.roth@amd.com&gt=
;; groug@kaod.org &lt;groug@kaod.org&gt;; dgilbert@redhat.com &lt;dgilbert@=
redhat.com&gt;; eric.auger@redhat.com &lt;eric.auger@redhat.com&gt;; stefan=
ha@redhat.com &lt;stefanha@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrov=
sky@oracle.com&gt;;
 kwolf@redhat.com &lt;kwolf@redhat.com&gt;; mathieu.poirier@linaro.org &lt;=
mathieu.poirier@linaro.org&gt;; raphael.norwitz@nutanix.com &lt;raphael.nor=
witz@nutanix.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;<br>
<b>Subject:</b> [PATCH v15 0/6] hmp,qmp: Add commands to introspect virtio =
devices</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This series introduces new QMP/HMP commands to dum=
p the status of a<br>
virtio device at different levels.<br>
<br>
[Jonah: Rebasing from previous patchset from Apr. 1 (v14). Original patches=
<br>
&nbsp;are by Laurent Vivier from May 2020.<br>
<br>
&nbsp;I sincerely apologize for the *massive* delay in getting this latest =
v15<br>
&nbsp;series out. It was a perferct storm of other more pressing issues, ti=
me off,<br>
&nbsp;and trying to understand why I was seeing this 30 feature bit in my P=
CI virtio<br>
&nbsp;devices. Please see patch 3/6 for more explanation on this issue.<br>
<br>
&nbsp;Rebase from v14 to v15 includes: adding the missing sign-off-by from =
the poster,<br>
&nbsp;renaming &amp; moving all virtio device feature map definitions to hw=
/virtio/virtio.c,<br>
&nbsp;including brief descriptions for all status &amp; feature bits, a new=
 virtio device<br>
&nbsp;feature map defined for virtio-rng, and mappings for virtio/vhost-vso=
ck,<br>
&nbsp;virtio-iommu, virtio-mem, and virtio transport features updated with =
their<br>
&nbsp;newest feature bits. Most of these changes can be found in patch 3/6.=
<br>
<br>
&nbsp;And again, sorry for the long wait on this.]<br>
<br>
<br>
1. List available virtio devices in the machine<br>
<br>
HMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; info virtio<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) info virtio<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
2]/virtio-backend [virtio-scsi]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral/vsock0/virti=
o-backend [vhost-vsock]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral/crypto0/virt=
io-backend [virtio-crypto]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
1]/virtio-backend [virtio-net]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
0]/virtio-backend [virtio-serial]<br>
<br>
QMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; { 'command': 'x-query-virtio',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'returns': ['VirtioInfo'],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'features': [ 'unstable' ] }<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; { &quot;execute&quot;: &qu=
ot;x-query-virtio&quot; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;- { &quot;return&quot;: [<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virti=
o-scsi&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;/mach=
ine/peripheral-anon/device[2]/virtio-backend&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;vhost=
-vsock&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;/mach=
ine/peripheral/vsock0/virtio-backend&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virti=
o-crypto&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;/mach=
ine/peripheral/crypto0/virtio-backend&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virti=
o-net&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;/mach=
ine/peripheral-anon/device[1]/virtio-backend&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virti=
o-serial&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;/mach=
ine/peripheral-anon/device[0]/virtio-backend&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
2. Display status of a given virtio device<br>
<br>
HMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; info virtio-status &lt;path&gt;<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) info virtio-status /machi=
ne/peripheral/vsock0/virtio-backend<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral/vsock0/virti=
o-backend:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_name:&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vhost-vsoc=
k (vhost)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_id:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
19<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vhost_started:&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus_name:&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (null)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; broken:&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; false<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disabled:&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; false<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disable_legacy_check=
:&nbsp;&nbsp;&nbsp; false<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; started:&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_started:&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start_on_kick:&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_guest_notifier_m=
ask: true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_running:&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_vqs:&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 3<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; queue_sel:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isr:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endianness:&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; littl=
e<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_CONFIG_S_ACKNOWLEDG=
E: Valid virtio device found,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Guest features:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields ena=
bled,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host features:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields ena=
bled,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy),<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of av=
ail. descs. on VQ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol feature=
s negotiation supported<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Backend features:<br=
>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VHost:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; nvqs:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vq_index:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; max_queues:&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; n_mem_sections: 4<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; n_tmp_sections: 4<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; backend_cap:&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; log_enabled:&nbsp;&nbsp;&nbsp; false<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; log_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Features:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. even=
t fields enabled,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_RING_F_INDIRECT_DESC: Indirect descripto=
rs supported,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_F_VERSION_1: Device compliant for v1 spe=
c (legacy),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary d=
esc. layouts,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device ru=
ns out of avail. descs. on VQ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VHOST_F_LOG_ALL: Logging write descriptors supp=
orted<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Acked features:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. even=
t fields enabled,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_RING_F_INDIRECT_DESC: Indirect descripto=
rs supported,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_F_VERSION_1: Device compliant for v1 spe=
c (legacy)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Backend features:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Protocol features:<br>
<br>
QMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; { 'command': 'x-query-virtio-status',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'data': { 'path': 'str' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'returns': 'VirtioStatus',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'features': [ 'unstable' ] }<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; { &quot;execute&quot;: &qu=
ot;x-query-virtio-status&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral/vsock0/v=
irtio-backend&quot; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;- { &quot;return&quot;: {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;device-endian&quot;: &quot;little&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;bus-name&quot;: &quot;&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;disable-legacy-check&quot;: false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;vhost-vsock&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;started&quot;: true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;device-id&quot;: 19,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vhost-dev&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;n-tmp-sections&quot;: 4=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;n-mem-sections&quot;: 4=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;max-queues&quot;: 0,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;backend-cap&quot;: 0,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;log-size&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;backend-features&quot;:=
 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;dev-features&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;nvqs&quot;: 2,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;protocol-features&quot;=
: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;protocols&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vq-index&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;log-enabled&quot;: fals=
e,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;acked-features&quot;: {=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;dev-features&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event f=
ields enabled&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors =
supported&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_F_VERSION_1: Device compliant for v1 spec (=
legacy)&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;features&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;dev-features&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VHOST_F_LOG_ALL: Logging write descriptors support=
ed&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event f=
ields enabled&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors =
supported&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_F_VERSION_1: Device compliant for v1 spec (=
legacy)&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc=
. layouts&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs =
out of avail. descs. on VQ&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;backend-features&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;dev-features&quot;: [<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;start-on-kick&quot;: false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;isr&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;broken&quot;: false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;statuses&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;num-vqs&quot;: 3,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;guest-features&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;dev-features&quot;: [<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields enabled&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;host-features&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;dev-features&quot;: [<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation s=
upported&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transports&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields enabled&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on =
VQ&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;use-guest-notifier-mask&quot;: true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vm-running&quot;: true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;queue-sel&quot;: 2,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;disabled&quot;: false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vhost-started&quot;: true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;use-started&quot;: true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
3. Display status of a given virtio queue<br>
<br>
HMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; info virtio-queue-status &lt;path&gt; &lt;queue&gt;<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) info virtio-queue-status =
/machine/peripheral-anon/device[1]/virtio-backend 2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
1]/virtio-backend:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_name:&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virtio-net<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; queue_index:&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inuse:&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used_idx:&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signalled_used:&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signalled_used_valid=
: true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VRing:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num:&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_defa=
ult:&nbsp; 64<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; align:&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000011e15c000<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail:&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000011e15c400<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000011e15c4c0<br>
<br>
QMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; { 'command': 'x-query-virtio-queue-status',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'data': { 'path': 'str', 'queue': 'uint16' }=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'returns': 'VirtQueueStatus',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'features': [ 'unstable' ] }<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; { &quot;execute&quot;: &qu=
ot;x-query-virtio-queue-status&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/dev=
ice[1]/virtio-backend&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;queue&quot;: 2 }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;- { &quot;return&quot;: {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;signalled-used&quot;: 15,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;inuse&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virtio-net&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-align&quot;: 4096,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-desc&quot;: 4814004224,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;signalled-used-valid&quot;: true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-num-default&quot;: 64,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-avail&quot;: 4814005248,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;queue-index&quot;: 2,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-used&quot;: 4814005440,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;used-idx&quot;: 15,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;vring-num&quot;: 64<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
4. Display status of a given vhost queue<br>
<br>
HMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; info virtio-vhost-queue-status &lt;path&gt; &lt;queue&gt=
;<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) info virtio-vhost-queue-s=
tatus /machine/peripheral-anon/device[1]/virtio-backend 1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
1]/virtio-backend:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_name:&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virtio-net (vhost)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kick:&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; call:&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VRing:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num:&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00007f804df5a000<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc_phy=
s:&nbsp;&nbsp; 0x000000013315a000<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc_siz=
e:&nbsp;&nbsp; 4096<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail:&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00007f804df5b000<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail_ph=
ys:&nbsp; 0x000000013315b000<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail_si=
ze:&nbsp; 518<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00007f804df5b240<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used_phy=
s:&nbsp;&nbsp; 0x000000013315b240<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used_siz=
e:&nbsp;&nbsp; 2054<br>
<br>
QMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; { 'command': 'x-query-virtio-vhost-queue-status',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'data': { 'path': 'str', 'queue': 'uint16' }=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'returns': 'VirtVhostQueueStatus',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'features': [ 'unstable' ] }<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; { &quot;execute&quot;: &qu=
ot;x-query-virtio-vhost-queue-status&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/dev=
ice[1]/virtio-backend&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;queue&quot;: 1 }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;- { &quot;return&quot;: {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;avail-phys&quot;: 4803538944,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virtio-net&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;used-phys&quot;: 4803539520,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;avail-size&quot;: 518,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;desc-size&quot;: 4096,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;used-size&quot;: 2054,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;desc&quot;: 140186477404160,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;num&quot;: 256,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;call&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;avail&quot;: 140186477408256,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;desc-phys&quot;: 4803534848,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;used&quot;: 140186477408832,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;kick&quot;: 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
5. Display an element of a given virtio queue<br>
<br>
HMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; info virtio-queue-element &lt;path&gt; &lt;queue&gt; [in=
dex]<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dump the information of the head=
 element of the third queue of virtio-scsi:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) info virtio-queue-element=
 /machine/peripheral-anon/device[2]/virtio-backend 2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /machine/peripheral-anon/device[=
2]/virtio-backend:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_name: virtio-=
scsi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index:&nbsp;&nbsp; 0=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; descs:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128890000 len 12288 (write),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128880000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128870000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128860000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128850000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128840000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128830000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128820000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128810000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x128800000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116bf3000 len 53248 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116be3000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116bd3000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116bc3000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116bb3000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116ba3000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116b93000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116b83000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116b73000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116b63000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x116b53000 len 65536 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x126e9763b len 108 (write, next),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr 0x9af8dae7222881a2 len 51 (next)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags: 0=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idx:&nbs=
p;&nbsp; 600<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring:&nb=
sp; 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags: 0=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idx:&nbs=
p;&nbsp; 600<br>
<br>
QMP Form:<br>
<br>
&nbsp;&nbsp;&nbsp; { 'command': 'x-query-virtio-queue-element',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'data': { 'path': 'str', 'queue': 'uint16', =
'*index': 'uint16' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'returns': 'VirtioQueueElement',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'features': [ 'unstable' ] }<br>
<br>
&nbsp;&nbsp;&nbsp; Example:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; { &quot;execute&quot;: &qu=
ot;x-query-virtio-queue-element&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/dev=
ice[2]/virtio-backend&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;queue&quot;: 2 }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;- { &quot;return&quot;: {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;index&quot;: 1,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;virtio-scsi&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;descs&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852740096<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852674560<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852609024<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852543488<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852477952<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852412416<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852346880<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852281344<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852215808<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852150272<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852084736<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4852019200<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851953664<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851888128<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851822592<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851757056<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851691520<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851625984<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851560448<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 65536,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4851494912<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;write&quot;, &quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 108,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 4801325435<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;flags&quot;: [&quot;next&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;len&quot;: 51,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot=
;addr&quot;: 12075758188190198449<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;avail&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;idx&quot;: 922,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;flags&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ring&quot;: 1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;used&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;idx&quot;: 922,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;flags&quot;: 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
v15: added missing sign-off in patches<br>
&nbsp;&nbsp;&nbsp;&nbsp; rebased for upstream (Qemu 7.1)<br>
&nbsp;&nbsp;&nbsp;&nbsp; minor reformatting to examples in qapi/virtio.json=
<br>
&nbsp;&nbsp;&nbsp;&nbsp; virtio device feature maps moved to hw/virtio/virt=
io.c<br>
&nbsp;&nbsp;&nbsp;&nbsp; virtio device feature maps renamed (less generic)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; virtio device feature maps now include brief descr=
iption of feature<br>
&nbsp;&nbsp;&nbsp;&nbsp; virtio device status map now include brief descrip=
tion of status<br>
&nbsp;&nbsp;&nbsp;&nbsp; new feature bits added to mappings for virtio/vhos=
t-vsock,<br>
&nbsp;&nbsp;&nbsp;&nbsp; virtio-iommu, &amp; virtio-mem<br>
&nbsp;&nbsp;&nbsp;&nbsp; new virtio transport feature bit added to mapping<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; new virtio device feature map defined for virtio-r=
ng<br>
<br>
v14: move definition of 'gpu_map' to virtio-gpu.c<br>
&nbsp;&nbsp;&nbsp;&nbsp; add new 'context-init' virtio-gpu feature<br>
&nbsp;&nbsp;&nbsp;&nbsp; created new feature map 'i2c_map' for vhost-user-i=
2c<br>
&nbsp;&nbsp;&nbsp;&nbsp; fixed casting error for cross-Win64 builds<br>
<br>
v13: minor text edit in qapi/virtio.json<br>
<br>
v12: minor reformatting for monitor/hmp-cmds.c<br>
&nbsp;&nbsp;&nbsp;&nbsp; use PRI types in virtio hmp monitor printfs<br>
<br>
v11: minor reformatting in virtio.json<br>
&nbsp;&nbsp;&nbsp;&nbsp; added synchronicity check when querying virtio dev=
ices<br>
<br>
v10: rebased for upstream (Qemu 7.0)<br>
&nbsp;&nbsp;&nbsp;&nbsp; reformat virtio.json for better consistency<br>
&nbsp;&nbsp;&nbsp;&nbsp; removed all enums from virtio.json; replaced with =
string literals<br>
&nbsp;&nbsp;&nbsp;&nbsp; removed @ndescs from VirtioQueueElement<br>
&nbsp;&nbsp;&nbsp;&nbsp; removed examples in hmp-commands-info.hx (to fix '=
inconsistent<br>
&nbsp;&nbsp;&nbsp;&nbsp; literal block quoting' error from Sphinx)<br>
<br>
v9: rebased for upstream (Qemu 6.3)<br>
&nbsp;&nbsp;&nbsp; change QMP command prefixes from 'x-debug-virtio' to<br>
&nbsp;&nbsp;&nbsp; 'x-query-virtio'<br>
&nbsp;&nbsp;&nbsp; add 'unstable' feature to all 'x-query-virtio' prefixed<=
br>
&nbsp;&nbsp;&nbsp; QMP commands<br>
&nbsp;&nbsp;&nbsp; fix odd indentation for qapi/virtio.json<br>
&nbsp;&nbsp;&nbsp; device features support for virtio-mem<br>
&nbsp;&nbsp;&nbsp; move HMP sub-commands under 'virtio' top level to 'info'=
<br>
&nbsp;&nbsp;&nbsp; top level<br>
<br>
v8: add assert in virtio_id_to_name() to make sure we're<br>
&nbsp;&nbsp;&nbsp; not returning NULL<br>
&nbsp;&nbsp;&nbsp; minor documentation additions to qapi/virtio.json<br>
&nbsp;&nbsp;&nbsp; add virtio introspection support for vhost-user-rng<br>
<br>
v7: rebased for upstream (Qemu 6.2)<br>
&nbsp;&nbsp;&nbsp; add ability to map between numberic device ID and<br>
&nbsp;&nbsp;&nbsp; string device ID (name) for virtio devices<br>
&nbsp;&nbsp;&nbsp; add get_vhost() callback function for VirtIODevices<br>
&nbsp;&nbsp;&nbsp; expose more fields of VirtIODevice<br>
&nbsp;&nbsp;&nbsp; expose fields of vhost devices<br>
&nbsp;&nbsp;&nbsp; decode vhost user protocol features<br>
&nbsp;&nbsp;&nbsp; decode VirtIODevice configuration statuses<br>
&nbsp;&nbsp;&nbsp; vhost support for displaying virtio queue statuses<br>
&nbsp;&nbsp;&nbsp; vhost support for displaying vhost queue statuses<br>
&nbsp;&nbsp;&nbsp; expose driver and device areas when introspecting a<br>
&nbsp;&nbsp;&nbsp; virtio queue element<br>
&nbsp;&nbsp;&nbsp; changed patch attribution<br>
<br>
v6: rebased for upstream (Qemu 6.1)<br>
&nbsp;&nbsp;&nbsp; add all virtio/vhost types in same order as<br>
&nbsp;&nbsp;&nbsp; include/standard-headers/linux/virtio_ids.h<br>
&nbsp;&nbsp;&nbsp; use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather=
 than open<br>
&nbsp;&nbsp;&nbsp; coding<br>
<br>
v5: rebased for upstream<br>
&nbsp;&nbsp;&nbsp; add device name, used index, and relative indicies to vi=
rtio queue-status<br>
&nbsp;&nbsp;&nbsp; HMP command<br>
&nbsp;&nbsp;&nbsp; add device name to virtio queue-status QMP command<br>
&nbsp;&nbsp;&nbsp; add new virtio device features<br>
<br>
v4: re-send series as v3 didn't reach qemu-devel<br>
<br>
v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail=
.<br>
&nbsp;&nbsp;&nbsp; Prefix the QMP commands with 'x-debug-'<br>
<br>
v2: introduce VirtioType enum<br>
&nbsp;&nbsp;&nbsp; use an enum for the endianness<br>
&nbsp;&nbsp;&nbsp; change field names to stick to naming convertions (s/_/-=
/)<br>
&nbsp;&nbsp;&nbsp; add a patch to decode feature bits<br>
&nbsp;&nbsp;&nbsp; don't check if the queue is empty to allow display of ol=
d elements<br>
&nbsp;&nbsp;&nbsp; use enum for desc flags<br>
&nbsp;&nbsp;&nbsp; manage indirect desc<br>
&nbsp;&nbsp;&nbsp; decode device features in the HMP command<br>
<br>
Laurent Vivier (6):<br>
&nbsp; qmp: add QMP command x-query-virtio<br>
&nbsp; qmp: add QMP command x-query-virtio-status<br>
&nbsp; qmp: decode feature &amp; status bits in virtio-status<br>
&nbsp; qmp: add QMP commands for virtio/vhost queue-status<br>
&nbsp; qmp: add QMP command x-query-virtio-queue-element<br>
&nbsp; hmp: add virtio commands<br>
<br>
&nbsp;hmp-commands-info.hx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp=
; 70 +++<br>
&nbsp;hw/virtio/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbs=
p; 2 +<br>
&nbsp;hw/virtio/virtio-stub.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 42 ++<br>
&nbsp;hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
1032 ++++++++++++++++++++++++++++++++++++<br>
&nbsp;include/hw/virtio/vhost.h&nbsp; |&nbsp;&nbsp;&nbsp; 3 +<br>
&nbsp;include/hw/virtio/virtio.h |&nbsp;&nbsp;&nbsp; 6 +<br>
&nbsp;include/monitor/hmp.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbs=
p; 5 +<br>
&nbsp;monitor/hmp-cmds.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp; 310 +++++++++++<br>
&nbsp;qapi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp;&nbsp; 1 +<br>
&nbsp;qapi/qapi-schema.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbs=
p; 1 +<br>
&nbsp;qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 954 +++++++++++++++++++++++++++++++++<br>
&nbsp;tests/qtest/qmp-cmd-test.c |&nbsp;&nbsp;&nbsp; 1 +<br>
&nbsp;12 files changed, 2427 insertions(+)<br>
&nbsp;create mode 100644 hw/virtio/virtio-stub.c<br>
&nbsp;create mode 100644 qapi/virtio.json<br>
<br>
-- <br>
2.31.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA2PR10MB4667615B9DACA84924AFE5E9E8559SA2PR10MB4667namp_--

