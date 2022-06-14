Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF4A54B369
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:38:53 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17gy-0000yS-Fo
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o17fT-0000GL-7o
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:37:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o17fO-000800-RH
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:37:18 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EBYG8P013785;
 Tue, 14 Jun 2022 14:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=WOWQ0W3eN+y12Yq/g3HkAo7swGt4WIaiDUBB/mPetdQ=;
 b=wdVqDFJXjXHDjPfeupB0SgHPkIjv4el5tcLI+edZ8ujwYRhkS8koWwU5TLnXsIw9NF2K
 candBQAppEMQtXEhZi+qtKmJmBt5WJjYFFrNYuOqxnQdKv9nUWn0cBGG1JgYHbzSJ9mj
 V5f5G8sWlGUe7+K8vpIPygU1pmxm82aXczpPmRhvuIO0NBiqWPLDPRFijnBoCgx7pg+l
 Y5/f3sR2hyHGWC2FmFRsyyPc8RNSE66EiYa6qU/LgcSqrkJ9te+m33FlHbVM2OUxoO8b
 q2o7gB2nbFeHxvi0PDL5WuAa344QHlBaIbgN0qz9zdoERj1GEwTKfTEN9V3tDk6qM9G9 gA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcp0ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 14:37:08 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EEb54a008192; Tue, 14 Jun 2022 14:37:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gprbqpxvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 14:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4rG4NFAK9QcyN8oWgMYE7MpYm7exyB2DMI8ijZjgg9sErY5CEwebCqCWlZP6UG4dH3d1pDcEBjKLQWPQZ+blYDnFAc4YTWlQ1WHv1t7V+nt/TloHHOzDQ4xe9IxGXrgr5SLQtV2hEx67/Msuonqeel5ZryYrr6cNF2eHh9NQ/czKfqemsouKvw48w0+Cm+tYIxDKvZ9opFlXDMqpjWKp0g9vrUE3npm37qBnwd6+DfDxG+HRH7G9HaVCOKBJwIkLaUEFR+j1/8+jlt1tIhbHYQ8i4zyJLTAoLNCRRjfTPivCyjW5Ysrw5NSKGb1SYvks8UIXWU2n2AxjVyMNrEVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOWQ0W3eN+y12Yq/g3HkAo7swGt4WIaiDUBB/mPetdQ=;
 b=V9ki+7BWeNAQpXnHw8B/DeR8Aof1plcbkMEWlJZ2PiJT+cjBvjGovCkzXn0AMfbpKAKSxffoVV5M8/r09AjFs7ijTaPL3TXdsjzNz3xgtGrDKh4rnLZIUXA/6wly/daRGHkLA9FyRk7WL2P9jcpcW+EtQVDYejKTtw55yTvIKFWoLqlG3yLC3AIPgUGFdt+XGFXuHv+JahMS8+Sd3AjFrf71Y/db9vLjjuKOCsv4ceQTKN4wuMEsuAbwIGx48dag/49ihrImdvJM2uwrD8qIHEbfrin2AsiQnn8zaSc2nvn3HGldB3KOMeZUHLVWna05SA101pLy37k7mMfptFKEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOWQ0W3eN+y12Yq/g3HkAo7swGt4WIaiDUBB/mPetdQ=;
 b=VKnXdpmgbyIiKLfZhdJRfxshpFWB4GUtxxwzZps25TO/zkCOJaPy+0MSAvjaP5kKqKFxiQ8UNIiMKGC+z3V8SnnMSIk0KrqsZJhT4W/sok4d8R7NkAxd0imOeKROebAR5IrqKBK7QwyU+xbybHLX0qxboZwEKMjkr/zuXHS4uHY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DS7PR10MB5245.namprd10.prod.outlook.com (2603:10b6:5:3a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 14:37:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:37:02 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, "f4bug@amsat.org"
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v12 00/14] vfio-user server in QEMU
Thread-Topic: [PATCH v12 00/14] vfio-user server in QEMU
Thread-Index: AQHYf2PlKFlGqtcM2EOnUjXzK/YUx61Oe6eAgAB9+4A=
Date: Tue, 14 Jun 2022 14:37:02 +0000
Message-ID: <94C1BA50-A498-4A98-A970-2E7C39C97BA6@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
 <YqgzX2K9X9wLMZmC@stefanha-x1.localdomain>
In-Reply-To: <YqgzX2K9X9wLMZmC@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7453e7-0314-4565-09d2-08da4e135884
x-ms-traffictypediagnostic: DS7PR10MB5245:EE_
x-microsoft-antispam-prvs: <DS7PR10MB5245A6479692C460F67181C190AA9@DS7PR10MB5245.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5qKkHNKhLqINSv5cmZumyt0qsCDsFesG6h5l9Lly4zKRNBUsu6w3oREp2WEZFzxvcjWu1+1+SVc0MQZQGblQqxaQUkL6/Jzkpz4QeBZL1pDs62eFKaoK6GZmeFzbzAQXik6BJzglzqH6LEZFd3ST8XyY9GypMvDfDVCgxyJEjKuQZFM8S+IGhfGNSFYpfxNVbP+O/dD80u/aHnEGAipAuW9O+UPe0sNAjdNt6m8v+yMaMsrIO5viQAiwXJG3HEhmCa6ZxzORo5gv4bhLDjzN4sZ2GltERtiEn96AdfbQKZGFifk03rWfZVlO3em7E4SGtpBFoMaFJLek6j8X9mojaLl+a4fKPJdpHayl2OHDMZDjZBUHb2bHE+PSzyvL2Gkj1KvODP9Rm/Yi/EbAKkfGe63FoOvGvFsseydb3Ql49ZqPg/jOqcwLE6y8Afv/kLLnMM+oEKzBwvp4EuOOGOqARJdJs8IE9ZM2CUU8n1RIdMNNwuf+1rccUDTSrAW46uKt0r0OdrvDT5/R3GpWmW23TiKR8XbNSUWJ+Hql1y+bIm47b/44SC9p8v3STiCrU3FVgDDq//7DVZqGKXkIwqF1UcMjoi5mnXWD1CGTfwBj5vua5t2kuFEQPUK+OQhMrq73wdRNsBw8hAiBntM7tYutW2rd+gNbszu1x73nC0HNzQP8hs+hCJXCAaTQs6ahYjWMVBsnOGvSz1CyiiS453pdIKV8T4JUwLnChvlfJzuic01altjCzXaqfmTCVBD7Xix9ApBseqnKUuNZQFBxMr8owP8mL7Me3cbvWFf6bNvvVOz+1VwPKZCscc3cV2UrD+d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(86362001)(7416002)(8936002)(122000001)(6486002)(966005)(5660300002)(107886003)(508600001)(2616005)(38070700005)(54906003)(76116006)(4326008)(71200400001)(66946007)(8676002)(66476007)(66446008)(316002)(66556008)(64756008)(91956017)(2906002)(83380400001)(6916009)(36756003)(33656002)(53546011)(186003)(4744005)(6506007)(44832011)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?55CLbiFCwwxsipB9GjO35t7ORSVC7r2S0ZtHqVThb7J/S15gnQmfp3A99/wc?=
 =?us-ascii?Q?UM/JT7cLN+iTIvNHEfga2v/s4X+Bf+d0Y1QIlTK4PwDQRcLTo7o9/z2tQmD0?=
 =?us-ascii?Q?pVEcSaVorn7XBmYlV/tRS5tM5qjLS2L1+BINyQFy3SuD8rEkJcWW3VFNZS8G?=
 =?us-ascii?Q?5KmtVzfNb5aHUY7N3k7qd5EITr+RJVwHFz0nUlObzQ+pusAR83ZVkxvXY1BX?=
 =?us-ascii?Q?2Ltm9JTyLwEyJ/G9Se8RDsu//xv6n8487RpyvO7wyvyoSGCZUS7//qGUuZpW?=
 =?us-ascii?Q?ZZ00W88CUlYBJAflZu9tj9u7L5aN1aoJSfmRTa/JnZ3yb898E0voKXLCqONJ?=
 =?us-ascii?Q?E99Qi41p2tnjMzR+NMwpJOcrCTjhJMhEm2Bh+ODB8Scwc0apEmXzIVMy3vNU?=
 =?us-ascii?Q?YYQrezwP3Zk8XJ0Z60O259YdUarGSwjLMTS7/E8TQaWVquv4fAFlSFJlfd6b?=
 =?us-ascii?Q?jI4dPQikaHgD1dM5CLJx886ApT2RvXsOlEdk42uHQ2YMb6pdaABb2jiitq7g?=
 =?us-ascii?Q?4Bju/poCqdpfpNJ0Z2FUr2hGk9mdqB15CDXusJG5LMxGlUUx25dWZAy8hx1I?=
 =?us-ascii?Q?kLmrDhOHq1+wl8JpfQra3+JgvG5JSke8Ij1LHGgZqGmxkZhJFvrgIxy4y21K?=
 =?us-ascii?Q?eQmn4lt5xPvzteh+vkxl5KVnqEZusCnKw7SkBGSFZMhIa7N8IkZp55/pfzn6?=
 =?us-ascii?Q?Sl7dnwFCO12dmRjUbc5EVN4Mesf9hVTGae6PbA87NgAW+zGuRCt8iotdr/Oa?=
 =?us-ascii?Q?8QckbEjMo8ub3ye51bBBTnCB10036JvJ6Cmew2aI3ArT99zyCvWBvSOVGw/W?=
 =?us-ascii?Q?DZaNRLbE7dEMgG/8hD/QT1KSzWT/mFClMsn86uuqCTSsRJP8nE24RzQuXGcp?=
 =?us-ascii?Q?01KzXRgl9VHedALVbJ46XXH1LhQiEOdhHJPjFuzCydT8kQ0V7p497bGj30oR?=
 =?us-ascii?Q?s3ER8rjZLpjPagyFdOYUJSbEgVie88p39g5ZTLNjwElRJojzItrZVDSoXHzz?=
 =?us-ascii?Q?Fua4qr3/Wu34OnWfurBqyyw2bF6h9KqAY6BrYUceIkxucWggGOMqhrHlsYwM?=
 =?us-ascii?Q?znlTM5f+dGvtcpKf3eEiH5DfqT31fXplpAJBLrkVj4UQk/IurOCS5whDfPd6?=
 =?us-ascii?Q?SyWuwBLDz1aIND8r4ObiK6UOdybyhTCBnPB8rRhdDZWdH4w8JIC/pFcVo95y?=
 =?us-ascii?Q?gjTiwVw23tOyjoDkmsAtw2kHLr6p/MSaLAPROUKmq7w3qitgAXDeRD4ezMIg?=
 =?us-ascii?Q?7hfgOGXZ1C024dnxURXxsH8dKr9+/E7LPoP9fFF66r688w7QvT6+Fu+DOCXP?=
 =?us-ascii?Q?CtIu5Sax/iVOhsEQa/JRuP1T8iBausqsKxXn8x60xsig4IsCUqvIgeqtwIA0?=
 =?us-ascii?Q?u86XONQY+f3pElgU+RYFZ/YQzJtSdGPjP+Ot/kR/Rd+SyYiZsbrmDjtuySrx?=
 =?us-ascii?Q?K5eVm1/LWU9Xa0R/rWixM5wkZL/pdJh0tENOEfZWGwKNXyao3iu/wAT036Jc?=
 =?us-ascii?Q?Jed+NEPnhqTW/KwqeDgUEuB77kKcpS/OqGi2GdMu+FyhKawHgmwyUud0HakD?=
 =?us-ascii?Q?mTneHfclQwrLNQ2GuxjgisNiu/q6sEVjzX72PmPi7QbbQUJomeHh6dxn9ZVB?=
 =?us-ascii?Q?374KIrCvahiEqxCqPRQt5T8eIHPodIVALXNpb3dDXkQ/IvcDAXEbkZCE5mcx?=
 =?us-ascii?Q?Jwi7zk6SF07cbAu6EENykdwgLmUAfanq5nWVyFfm7W6j2U57KCRH27giSW90?=
 =?us-ascii?Q?+4+GTHgIffaYTGiGVUfgEoV7AowdY/MyRiU+ZgXPP9XOlKzuaXEh?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64BE6F56EEA8C743A730E40A730E1D4B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7453e7-0314-4565-09d2-08da4e135884
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 14:37:02.2427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qB4CNFTyDmyWb7O73kbYrQHVIU5ZDFMWFjY19cu+1PtMptqzrgg3Ybtc3AcEZJSkEBTwLxvzxi48k1kxdQdjHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5245
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_05:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=684 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140057
X-Proofpoint-ORIG-GUID: 8ZwupEiNnzGWWFRj5mVnFhoasGTKYilS
X-Proofpoint-GUID: 8ZwupEiNnzGWWFRj5mVnFhoasGTKYilS
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On Jun 14, 2022, at 3:06 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Mon, Jun 13, 2022 at 04:26:20PM -0400, Jagannathan Raman wrote:
>> This is v12 of the server side changes to enable vfio-user in QEMU.
>>=20
>> Thanks so much for reviewing this series and sharing your feedback.
>>=20
>> We made the following changes in this series:
>> [PATCH v12 13/14] vfio-user: handle device interrupts
>> - Renamed msi_set_irq_state() and msix_set_irq_state() as
>>   msi_set_mask() and msix_set_mask() respectively
>> - Added missing return statement for error case in msi_set_mask()
>=20
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block

Thank you very much, Stefan! :)

>=20
> Stefan


