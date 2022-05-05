Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80251C41E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:42:01 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdc9-0005hR-0D
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmdXj-0002u0-MM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:37:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmdXg-0003T0-9H
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:37:26 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245F4Ql6026132;
 Thu, 5 May 2022 15:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=c3RTiiXBvF1qdUY8zNuOwFYHcaMKND2+92yvvvmqO/U=;
 b=HWJCMGAc9shWyuW1MR7G7bVGlRBaHY4VERhtYLmMPqlimRoo2fn0xNB5I/X8mfMCAIuR
 85sbO3ujQjokG17lu0VzaEQaFrF1/WMivtn7a5DRWfscVyvexrpz142Xzi9fes2TPKr5
 /mvbXlTKMtKlI9D1O1ngGwjtCvvoG3fhQR/MVF4TUAG/ewmVhfh98RpyqMurHvn0p4iF
 47WbgZ461Vfd9B1CZYmpHa88p+ZundTzChDcDSZb+bmWKKSKVJGGCiX9FJZBrr9r+CVb
 RN8JJBSf8eE26+OlxjepBBlEIMAUuC2yao9WfFxtDCf9XqKo3O/kkMXOSRmrpSXZNRnR qg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbgkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 15:37:14 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245FZaRr027806; Thu, 5 May 2022 15:37:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusagx7ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 15:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvxehegEPPbmD4zf+5HuVf868K/c5y7cadSjH5JftnzKk6sNQYXJkIggnuO/kJIGXz6wbOx1J9Spd5JGG4JXHVXCPXSjPJEjH1s19LRMLPSJRxTDdyHG9t+LmLJErUXeCtb40xoYpvldHTYhFQgbYN9bLXvHkTuJC+3KdSQHY0IDIQkN4qMfhZgQFqi3CcAW6+RfgVbsJam7rl574XpP/l7RPz0BVOg6PACNYv9xtvqnEr4nZGfPV+i8/iym181iJesOTO1yB2LsCfsTTU+vn1aFZd4RjEFFf5A4Ikid5kNvOuvXGn/1Q7BFNpmpr5GQScHTjL1tW1dSmEs5ka35zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3RTiiXBvF1qdUY8zNuOwFYHcaMKND2+92yvvvmqO/U=;
 b=ShkDWDNVMBkfbttGbz5q1YmA0cPpzO7Gu8inrkmOSuSFwz3gH4JmI+3Apbwyw7WBp2ZBzoNbRQpH70y9Qyv/j7iviHrjLiG6hGF/AlN5RKs7BFjQSra3x9dMjIKJQ7M34oIfOtC77YPOVSfQV7usNjgl80p/AbTD6AIzkEjjrNX9qrVJfnKsKkHgv5yKFCmfop9oZ7IRMBiRTeczq8zt7qp71rovAG38r7FkGFBKZydDm0jTwC48mr5RUcl/0HEwvi2sPkdIpXNH+JVGpaIS0mheuxRrhozCArbU4oFEqlqsxwoNTTNC7Sq9r4O+3vsgsEwNR0rV1Ul1u95Xr5frOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3RTiiXBvF1qdUY8zNuOwFYHcaMKND2+92yvvvmqO/U=;
 b=BIXmSRBJL8byRgxJo6dJPNr+mnB12fk9Z1p16BdyKcYV1jO5nPZ6NKXGVDfzCTNyVQ5r99keol7gbb4fz++xSDkRFIrQ/3hDPIWkdfyUSCSuPFcDm/og7D5QmMUQq3brlCUFecqvNapPN3emojW+vnBQBhV9pxJaKnLy0xDJG/Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3787.namprd10.prod.outlook.com (2603:10b6:5:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 15:37:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:37:11 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Thread-Index: AQHYXviB0Av0tOrBtUqoqo2vDlepLK0OmulpgAHMrYCAAAKPAoAAA+EA
Date: Thu, 5 May 2022 15:37:11 +0000
Message-ID: <77C06803-B269-4047-8A93-1FA2690742A6@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
 <871qx97c8s.fsf@pond.sub.org> <YnPpv+7S4PhkfK4R@stefanha-x1.localdomain>
 <877d70qa10.fsf@pond.sub.org>
In-Reply-To: <877d70qa10.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f1ab358-6fdb-4e39-4c5a-08da2ead1f35
x-ms-traffictypediagnostic: DM6PR10MB3787:EE_
x-microsoft-antispam-prvs: <DM6PR10MB378724519CAF9B8C1F08032190C29@DM6PR10MB3787.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yr0+C5WbCVkifDA59WSYqiDu+CWhe9bTeMWgRnTr0zBXJgHx0V6MzUIqwVH9FuM7w7RIYL30cwJlI2oUOlrf3hbLZO02W57vcnA9fruZspDLzv7yI4nH4+Z3K0ywR8Ir/qVq2/7qCGYWRoCcLMJ6BVn8sQ1veRJ0CpIg3DYpdk3BtH92G8sPAjF3NoMxTvz48dlphHy2czSqGhJ/1RpA3n92yl/++I3Ousph26b3S6fuinhzcJ3pI9/BV56/Ayh3LhkSIe1a0ENspuBpc7R7iv473aQH04C6tRPTMFFROAs6BPau3H83UzlmcySJgg/BLOrM3MJaI7pau6rdBZTNdNdJlRbXenCmOvzyPM3hjv6D74DdvzIUIsDP2zywdTI+36UER9PV+hgkTRt2ZtDLiQ0Qin04xYL85x8jih2vJyAW2Waw/s5xPSvT40aSLcKvg9TEu4omaHVAvq76nJpxDoD6TRh5FYTYgONQSJ3RzL4femvKgA38Y88xbW6ILiscGyEdCp/bhI118tUZZeykR7ID/3cXSFU2eVH2fdxHk8jeBtc6plVsSAtOVpDCBflYoRlEic72wwBkiQPYINyjtwRn1Lu7ttx7cuE+kWcCeuGnACg9HMnxgCgv9uYYk5rK+tujcmQbw/a46NvkWGTURQW0CgCFxJpT+Ijkk6t2E+N2jzt9IDQO+GEVEeeyx9ivHVj6Pg3fr1hLrynAwhcsCaT70WgHLH51v7yoKvc4XmfIyi7vt74Mpkc3bG5CHoo9Bz3E7duVKFyGKCnawtLaVqAmx0UxKpAHWaqwSysGUYMrt2etgec9eFvF9rb2IeW6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(5660300002)(53546011)(508600001)(2906002)(7416002)(33656002)(966005)(6506007)(86362001)(8936002)(6512007)(44832011)(71200400001)(83380400001)(8676002)(66946007)(6916009)(38100700002)(76116006)(186003)(2616005)(4326008)(66556008)(66476007)(66446008)(64756008)(38070700005)(36756003)(91956017)(54906003)(122000001)(316002)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JIgbY4DDgqz9RAuoCNzm4SWkK2qKPlTAors05IkByQdo0TMfgqwMp/zf0Ypl?=
 =?us-ascii?Q?5Ec+Sw2Ynp44GQ67BceHPADmstp1ejZbbiRivlbPrE85ArNoatUpkq1BktUv?=
 =?us-ascii?Q?ethvEqNsIbUOJTgOlT1gVYvEJlc45rB+3oIMsxYkhTHhaF46h6pFtzy44Spd?=
 =?us-ascii?Q?pTH44koUbLBZ+gdNzeS0tM7JIzAj7r2oqkeFviZDJWlwrlOECjRURRyM/Upi?=
 =?us-ascii?Q?47Pa//t0pN7sq4zPfUFi4o0DqKk8n26psPQA7wWoeSuB+t0PcIqlw8SeLcx0?=
 =?us-ascii?Q?OeKfPJookBWZiG7n/fLPJ2IODGZ9yJiLcnayu3FhcLnLKzahum4HljOkyLZk?=
 =?us-ascii?Q?ab4nYFkleDdRCU+N8i+EWtCqA2x8ezh/2PsVQo9WT+MDOgmld22cgamy3SI0?=
 =?us-ascii?Q?r4w0UlKlMs0a8asOlSSisUfRmlP26R5jWBmYb1hQIO0yL8ZWPQF5ga9s7TFS?=
 =?us-ascii?Q?Q8cZptrYdBR6VoG6Cx7/hKEeCrhLxt/cYgFmbTzWSFGF2QTTR/YT9ah6w4uz?=
 =?us-ascii?Q?9LGC8OV6TL2inm0P+BjgKOAAb+kNpzsCOy+U3KvWq20/KlWEL6vj8O1EI1yP?=
 =?us-ascii?Q?8lv6esvNuzTQtRwM9eZetxgLBn8cuGEDGBfSs0tNzW6qHHUk4MOApYs0cj6y?=
 =?us-ascii?Q?+Tau+PS50S9p11xMzShqCjsivi7LOclc+hgl5LpQTNi5ytuyyAMMdJANnS4U?=
 =?us-ascii?Q?q+VaVQOlSuDh5goPYOgaWsl6S85bI8if483QPWoOJ8LxSswlFM+WLhNeyjLd?=
 =?us-ascii?Q?vRxtz11PcaV2fdSftkmN8RF8UXnULeqtlCJDuLJIF95V6PFD7cmXVlnAuvoD?=
 =?us-ascii?Q?IH1rmkjiZuTerVhDyFueKC5yvT/4qzD1TfCxCV19jO6pEKJ6EFg/j4/Hf5NM?=
 =?us-ascii?Q?YxDmbK4h66GB+sYS8gtYLwHvn9mFaC+T8lNkR6I4qqRVAxQzlLqfWpDAviro?=
 =?us-ascii?Q?Q7kjDwyf6G+DhtcjKvcEBm6ncN01AbGtICgNSRrGQIvQQJx/qizJ8XtiXH5p?=
 =?us-ascii?Q?GQcAu8D1V13OEi9EXfQsfFWaMzcfhOwGeFPk4jUAPQef2vAx0uvRcAnR68rn?=
 =?us-ascii?Q?HlhVPDn7FOUcVctQjsOEK1F9XUvQoLWiTjsF29G2JmzZQxkK25/+MPj7Gudb?=
 =?us-ascii?Q?0hZ3CXEVqjoYa92UR1VrRtjxN0pcetXwhu7rkzQdEbUYczaEQk2YuebWenn2?=
 =?us-ascii?Q?SwYJFcf8BGExgVsfmZNFZTrr6Dl9+bjKC5+U+vwZa4+NUXX9tzehrC3YcNbY?=
 =?us-ascii?Q?Fnx+qNUpX8aIA4ih5wCx4+GiDrrHh4ja+TPbTKOM9wEx8RpQq2lBXO98e9vc?=
 =?us-ascii?Q?3z27qdeCMvpKaYVnxdrvJHhIu9MGB0MFmOG2QP9+/x/k48y/DiBIWxs+e0zQ?=
 =?us-ascii?Q?lPgBvzdNRFSiXfc3BJhyGKCLo3NPFJpd249lLcHoMoC3534I832PvgC6aPdM?=
 =?us-ascii?Q?Gnn0sxDChrmpNfQCJnBYvgZRJBDgbHfvUxliA7wd2SXXAacr2lEdMUtGGfvN?=
 =?us-ascii?Q?w+m40MG25JhpD/5vrZlJoWM5FBbhG6rxZMxcgyQCMwfU2eKWsRQjvJaFf1QF?=
 =?us-ascii?Q?jLGBJ8+meykvnN6h002Y0cataZshAu5cuLcyUqDbHiY3qMa1in5xvOH48Kme?=
 =?us-ascii?Q?ohaFnL8RdOej0UcBCu8XQFRHMSGoh5dcauuv4tkT9iFTlnsldMmzB4OLc4GY?=
 =?us-ascii?Q?C9lDmkA7NVi3s1zjNemF9qV59KyOx/rdEYV7w08lDZrZbqX/DqcajNFdPItP?=
 =?us-ascii?Q?F4do/67myPcx9zPJF8906xzpMQqn4z79XPgCcWgc48K0E3wcS3d0?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <766312A933DDD843B08A12CE368E768D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1ab358-6fdb-4e39-4c5a-08da2ead1f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 15:37:11.3840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOTD2+YiTY47U/oAmq/XFfDFqSGcVRONI9T1OFppmcQlRZfMb1zCWOisLSj6yJT+Itz3BdvWAlqOi0HNEduR/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3787
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050111
X-Proofpoint-GUID: 2W_JH0_5Tewvven4J-f6oL-C4xQ3nGzQ
X-Proofpoint-ORIG-GUID: 2W_JH0_5Tewvven4J-f6oL-C4xQ3nGzQ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 5, 2022, at 11:22 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
>> On Wed, May 04, 2022 at 01:45:07PM +0200, Markus Armbruster wrote:
>>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>>=20
>>>> Define vfio-user object which is remote process server for QEMU. Setup
>>>> object initialization functions and properties necessary to instantiat=
e
>>>> the object
>>>>=20
>>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>>> ---
>>>> qapi/qom.json               |  20 +++-
>>>> include/hw/remote/machine.h |   2 +
>>>> hw/remote/machine.c         |  27 +++++
>>>> hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
>>>> MAINTAINERS                 |   1 +
>>>> hw/remote/meson.build       |   1 +
>>>> hw/remote/trace-events      |   3 +
>>>> 7 files changed, 262 insertions(+), 2 deletions(-)
>>>> create mode 100644 hw/remote/vfio-user-obj.c
>>>>=20
>>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>>> index eeb5395ff3..582def0522 100644
>>>> --- a/qapi/qom.json
>>>> +++ b/qapi/qom.json
>>>> @@ -703,6 +703,20 @@
>>>> { 'struct': 'RemoteObjectProperties',
>>>>   'data': { 'fd': 'str', 'devid': 'str' } }
>>>>=20
>>>> +##
>>>> +# @VfioUserServerProperties:
>>>> +#
>>>> +# Properties for x-vfio-user-server objects.
>>>> +#
>>>> +# @socket: socket to be used by the libvfio-user library
>>>> +#
>>>> +# @device: the id of the device to be emulated at the server
>>>=20
>>> Suggest "the ID", because "id" is not a word.
>>=20
>> id (noun)
>> 1. In Freudian theory, the division of the psyche that is totally uncons=
cious and serves as the source of instinctual impulses and demands for imme=
diate satisfaction of primitive needs.
>> 2. In Weismann's doctrine of germ-plasm, the substance of inheritance or=
 the bearer , in the germ-plasm, of the hereditary qualities of a single co=
mplete organism.
>> 3. In the somatic idioplasm of the hereditary qualities of a group of ce=
lls or a part of a developing embryo or growing organism.
>> https://duckduckgo.com/?q=3Ddefine+id&ia=3Ddefinition
>>=20
>> :D :D :D
>=20
> I stand corrected!
>=20
> %-)

You guys are funny. :)

>=20


