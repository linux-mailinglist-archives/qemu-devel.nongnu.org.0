Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F70687501
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNS2H-0000EX-1R; Thu, 02 Feb 2023 00:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS2F-0000EM-Cz
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS2D-0003jm-Sk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:23 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124iR6x031898; Thu, 2 Feb 2023 05:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=qQ+toWlq8VhYYQObYsBWfouMXluIYDD4+IWp8hfktLo=;
 b=IuWoOe+nmFwTPEp09xHZN1D9cS/mGZhg1skMhrMzY6p5VtXScV0z5GnV2GKDQmgJ+5sm
 7wmfRrMWHFCwi805aVnqSXV/iK1BKQZCUlUGhENb4uvG+b+VA744+XQR6Gv92noH2ESX
 9mKUeopfs40tdq4vL02FgIklsW4MhibbsImUPJ30VWJzuWqCQ8VsCgLTd5q85raezNGy
 bhT3XIgdG6XZyhuhHhirpOhZmcD5iHWDDmCpuDgEq8rBSi80ur/S93l0gqnUHVk0rZWD
 +od3aZBBIgqLkYwKrPksQlPWDoFLumk+PRCZ/ccTioedxIqhb/HfjJXpb1EFwnmwYb3q fQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfk64af77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:19 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31250Ele025189; Thu, 2 Feb 2023 05:21:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct58hvyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7zO0W/q6UUuisrmqfGMhDH7J6p/w8t1BVx5H/edjLj9FxOmQCjZmVkBv+9z3foesyraf/B9BLkyqrQ+cW9Eg+a8ITEyVe7BLuXUGlYXqHpyrFQjDBqUF0azAMvo16keSXPilcSoCDtSoQEgvA1uDpUPsKB2GW0Z9jmmLLP0KJ7JI51ZAkFGCbkYfIhMSYTUkxrcCx1CIdNZ21fMX7HQk6mfVIbWlS9lKGD58slRBO1xucijw5MQEekGkjBxttFHz6FZLItmdV0yugoA+Z7UFKK7+UkI0Vp1TjHqjgdveHBXYGsbeTq6JqKv6AlMDeTD3D6T2txGCBFzmFLhWBracA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ+toWlq8VhYYQObYsBWfouMXluIYDD4+IWp8hfktLo=;
 b=m0d/DFTJoawq/VJ+p3iUb8u+ur0AY88XQ2RoeXpqOECJAW2zIJT6vp0tC80PCmq8wFl4xGFncAdGsRIC3txQuSqhoh9q3CyCrnhV9ipTW6rleMFPmSOVIIrC72b4Q2XfOzoRSnPrioHYsEJgok+KPomC7RsGIS10rspFtDICvFUNTQsV/r78MGgVW+/stSQmPJMiaYMVClBycF5TzY+5fYCdzUmAbMIVq+9+fQRl70RhfM43EtoWdypVPPPCjpZmPY5WPX9hYNSET7pN+fCcp3rDc+DJt+tqHq2w0e9QNM0ww3g6xHDZEJGmEO38EwpsisIO10SMaHGa6J/cu+ZB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ+toWlq8VhYYQObYsBWfouMXluIYDD4+IWp8hfktLo=;
 b=omzQvcne3JGMfJSFAwyviU3mKkx0GheQBs4HFG6tUqmCvtA6hKNxJ3kmz77XtjhUdeQjUXZ/B2Xuz9PXRF/7ejHh6BDuNTuxNncaSFMZq5Yu1LPq598nxVVEcaJLCPYOiLzTxXb18lb90C03EeJ3IeX2jIkH1n9zXrX7az+bSzc=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by PH0PR10MB5402.namprd10.prod.outlook.com (2603:10b6:510:e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 05:21:17 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730%3]) with mapi id 15.20.6043.016; Thu, 2 Feb 2023
 05:21:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 09/24] vfio-user: define socket send functions
Thread-Topic: [PATCH v1 09/24] vfio-user: define socket send functions
Thread-Index: AQHY86IXF7vYSy+NqkWNFg6NvnqFEq5sC9uAgE+ZOQA=
Date: Thu, 2 Feb 2023 05:21:16 +0000
Message-ID: <BA39375E-A601-4327-BCEE-EEC4D8BDDA8A@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <366a157b3f3f9f94892eb90eee80a7dbf5d8ad12.1667542066.git.john.g.johnson@oracle.com>
 <a26a73b7-3c8e-2a4b-6ffc-76847fc1e6e2@redhat.com>
In-Reply-To: <a26a73b7-3c8e-2a4b-6ffc-76847fc1e6e2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|PH0PR10MB5402:EE_
x-ms-office365-filtering-correlation-id: 38380cdb-8b0d-4ba3-5e42-08db04dd4f3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O9aJa3OIZSAwV6XdVdyePwq2Ws8N0F8fKlzJvItYPNS+M+EaCxabU3iWE48gYfp0EarV23TQZi/R6x1877Sho5eAnn/Uw2rqc06qyQO3ZJEJKC5FQ0tdRLLIeYPuBz3jWZmhmPHF0ZEXFdxbWPAfR/WK8W0haE6G3WTVEL+RXwxTjLNeb+sK14tC4rBVnexcCIaFs59OYNR64XJrKGpB/2sXNV5ADZyHjIqPIB/j51N45oDjhw7plTigSHSkLpSQVNxyeSpXkiIYzceqWC32xGuyx6B9bztMn6ksSIzY16gadHBmLN02Xe1xoc4bcsiXL+e8Kx10oYnPFyWw29vN+83HQxEkDsTZC1WMmWuV89t8k1Xb51byN9cshEKQUmu6mw6VTTvgNFTTcQp7eSi4omiX4G+MJSKID0L/hfCG70rsH6xPxUeTZXCV0nK7OPhE3Id177y8oUvN1FVghWqbW3lwhACUcLpaY1r5ApqcSO/hyL8DgqIbUM0F7xmHS2/4a8cVDi8MiDrc4fAO+c5FoDYh+26o8IzgGQjUDsNMIEuYjuDMpBRifGg+T8OXwDIR7h2IPTnVO9FpsWIkAYZIEjxAj4SL941Yh3UTLtsez4gOoqynawRIG55bJSuxhLGM675kaahzTsvkBEzzZV80VARiOZcsFvr12PzibCaaETFobpk2dsunMK7XEX5brfl8Ytatw4SyVw3aNEG3ZGpRMEWJGEzSXR6LAxx/o9hO024=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199018)(33656002)(6506007)(5660300002)(38070700005)(316002)(6486002)(71200400001)(38100700002)(41300700001)(186003)(2616005)(26005)(6512007)(8936002)(36756003)(66946007)(64756008)(478600001)(6916009)(53546011)(8676002)(86362001)(66556008)(66446008)(122000001)(76116006)(66476007)(4326008)(2906002)(4744005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE5kbVZYVHA3NjZRbXFxcmRNTk9qZlg3MEphUGFMUWJOR0k5U1BuSzR3RUly?=
 =?utf-8?B?KytPUDJWMU1Yc2FBbU1SKzdBMElGeTZ3aUZKam9TV0JhM25SUFF2L1dFNFBK?=
 =?utf-8?B?cjE3Z2UzLzRHM3RLVDNyd1hGMFlGVFRmanc1RW9BdWl5ZllBcWg3MHF4a3Zw?=
 =?utf-8?B?SGtSZnlySG5YTXJMK3E0ZFdiZnhaSXdzUzhLSE14Q2Z0SnpaMFQxNzFCUC9p?=
 =?utf-8?B?cm5TbzZuQmV2ZVBmRkFna0xTRFcxdmRUVVZYZ0ZwVzEvN00vM2srSWQzZ01Q?=
 =?utf-8?B?MDU5eGhzd2ZUbjN3cTFLcWtVOS9jdWdQdUp4ZDk5Y3V6S3FpRzBkKzZoN1dr?=
 =?utf-8?B?ckVaK0E1L0RlM0tVZ3dBQ21wdXRxdDZIc29XRGJvZzhleENranVFS0tZajBP?=
 =?utf-8?B?WnpDNis1YXVkQTlqL25oUlpWNitJUlZoR0h5VVkyVUorMm5PZW14K3VDQXNy?=
 =?utf-8?B?R3Z6aE5zQ3hseTNPWGJIOFVLcXQweEF2UTFsQjlRUjJQWG1BR0MyU3NON1hz?=
 =?utf-8?B?QkZJc2hjWFdvWVluK3dwRCtuOVlReUpMTm85djRXUzhRbEVXL3BkbE90cVAv?=
 =?utf-8?B?YWh6Q1JYZXJVcklUbTdsemUram5Mbi9QY2VndTd3d3dueThmVjk0Um1qcktF?=
 =?utf-8?B?MHZMdy9kbUl6Ti91enpuNkpUd3ZxNEdmTW9EU3N0RkZRNXpjeDRxT2lNdkVv?=
 =?utf-8?B?aEpxZVp2QUNKMHZjaVArKzBveDkzTE5sNnkwM2pUbzl1aHpEdUk4WThXUWlp?=
 =?utf-8?B?QlM3YllUakFzdzRoNGQzNjV5TjJZczZDZFNkWllEcE1UUnU3dGxVclMyZVA2?=
 =?utf-8?B?bGpTUHIrM0Jyc29qWnJPOFJRT3pBNkJqbG9wL2cvZDY2REtkUVB1WHAraUF3?=
 =?utf-8?B?ZTQxMnk3dEkrT1hRVlJCQTJUV3dhNVpYNWpMNlQ0bFNmVmpPdTlNSUJRNGhU?=
 =?utf-8?B?Q2Y4TmxjSXFXS0M3TFZRM1J1cWQ1L2hJV2kyM3pYRWRGVzJSblR2d2k3TnBP?=
 =?utf-8?B?ZFVXZkovMzF0ZDRHRTNpUzFHOHl6UnlhWEgwcHhCQXpzWkIxODFpZE53VVAr?=
 =?utf-8?B?MVl2clpId2ZiVGhiaXZPalJsd1ZMMTJ5TTIvNmlJZmhhUEVjaGxxSUZrOHRJ?=
 =?utf-8?B?bGxxS2ZiamxuU3VGbGcwNTJ6eXptOXhVZGIxaTVKRkJmQUdGVVQwNml1NHEr?=
 =?utf-8?B?OEY2bHhoVzVQK1BGVkorRUhlamRQUjRXMUxlYjFndk9IVzJtaVhMbVBRYVRZ?=
 =?utf-8?B?RkpnelFrc1krMEhTcmlzK2hGeEp6Z3M4OGplSDRhbXAvU25EVFcvRnY0U0R5?=
 =?utf-8?B?cVV1ZDJaUk5zTVkxVXQvWmlzNlRXSjcwS1N6U0xEc1VIVjR2S3dLVkRtQk10?=
 =?utf-8?B?VTBIZFJPNDY5d0gvV3dsSG5wT0xtZFFRZFVwZThkdXRqOS9WSmZJMVlsSFV3?=
 =?utf-8?B?TXB2UEc3OHpIaGhkTmIzV2kzYzNCRTA4Y3lOYjduUnQ1UnBSZ1hJUlIzWGZ6?=
 =?utf-8?B?emY1ZTRuSjJMNDJObHVocFJRQjNZUjU1bkIvZGhYSVcrZWNXZEtzNS9VaVU5?=
 =?utf-8?B?Z0xkcEFsVm4wM1lqUnNWN2ZncVFKL0RHZzZpVnhEcXpTWG9ENTdMVTJNQzlZ?=
 =?utf-8?B?SE1RcFoxZHE3ZTJJYVJSMmpMWkczR2tncWQ2cCs3dTUrOEJCOE5xaUtIUzZ0?=
 =?utf-8?B?ek9LVHNpeVhnTDJLemtoVUV4V3lqVGE4eUY3ZU8vVUhWMUdpY21hd3dNVVVZ?=
 =?utf-8?B?NG5NR2E3b3pIUHFGeWVUVkNyaFZmaHRwZEhmb1YveFhGSGZUMHlEcWcxSzdl?=
 =?utf-8?B?NGhwcUdCYko2dE1PdVcydnhtUlJGR3RsUC9SS1c3VUlJY25kOGVPVnFjNVZ2?=
 =?utf-8?B?cDFrTmVSU2MvYkFaUkNNY3hmQXJPY0ZxQ0JvMFdHRTJGVUhIcSt0SGZpcW5I?=
 =?utf-8?B?OFZxakRGMnZYZHpNT3YwNFU2b21UZVlxMTNNMzEwWEhXdE9BTFhKMzY1STdy?=
 =?utf-8?B?MlVoNXFaV2ZjMDZQdUk5NmJpRXFEeHROMkRkbVVYcGlmaytWeHkzN3IxcTg4?=
 =?utf-8?B?WWY0dFgyRmNHMytLTzJrMXU0MTdDWlJXcTlBeTcvNVpQeGowZStpeVByMCs4?=
 =?utf-8?B?MDY5ZEFNdUNnZDhjYU16b0pyUUpNdGQrdnFJcGFvNUhXZGlOejFRZzllQmI2?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86EAF7950DEA2345BEFBCA95E619981B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JX34EZez9kgG5B0+6jmXFIjX7Zjp8/JXRImX0UMN1dDWLpoBP2Xt+1CYsY0bLc2uGAPvlSENiI8UmteFG2+V7ACCA+IY+gLYArxOVa/em2916J1/LkT+Rik7Uk5P/ohJNWfilfDT4SmZfhObt8drUpZ7j87IxdkxhtLxf7tYkMQ5N3lKMpNi5v9KpWWwBzITC52NlXwGgAt4b+3SEQoYAE3oViR0LXh6mLld/+zp0TJxX1nfjqS7FJpyZq7LWIFkCHapUwfi50zU0z2xbKqwjhFe3aRUhkVqCXHGM9aVmJK4jnHzQfYVQqA8y/KVpH4p2+Md3MuKKhharREhHr1p0dqYMEQOG++fxuduTK2Tx4I4+CKWH9p9ujBijeHUz/McNmhLcm98EPjYnk6FLhrvnuakLKBr29J4iXD/AJjcc/c0FoSsbkrCRkUxiIdwQ9ss/afVro2TtIChwORNAMSKtyxc+UpuNC8KX7b5bA865+wo0BtUZhbU08diVfP+RsCAuR/x9yEQgVIfX/2J5qJN5bOUfrrmjMCk37qPzj3rZgMNC2y6gkyz6APGv9MNxs8zZdSWN5kqszv5z35blXpWxQT6x+pLcnGgQZgT964SraDrMZuxhrqbqCalQbQtd8isjQvk56dDZXlyIph+DR0qlzIDZDQQ8jbSSW2kRCRL65lYaZ9JaktpB4X5VeW7/Qrai5ELj1GOyeWFYbJaVGg6IW8jFrh6c+jEr5ObsjiB3brvgUH/oyHQVj/OUcjIwTiT3aAX8NfPMVy7P1+XjVKlow==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38380cdb-8b0d-4ba3-5e42-08db04dd4f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 05:21:16.6293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZD/TlhOqLtIJOX6sdbv2f8XfqAFN1XZqd8gBvc+ESAINptWKJK1QtBRq09/hfnH35VD7McbT30WXjT6x/xSH03ljurYQrsO5CYQxBfsU21w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5402
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020048
X-Proofpoint-ORIG-GUID: bjtkR-bRWs6INoWyKoQFlmZHbEb_xBKV
X-Proofpoint-GUID: bjtkR-bRWs6INoWyKoQFlmZHbEb_xBKV
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

DQoNCj4gT24gRGVjIDEzLCAyMDIyLCBhdCA1OjQ4IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gDQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBjYXBfZW50cnkgdmVyXzBfMFtd
ID0gew0KPj4gKyAgICB7IFZGSU9fVVNFUl9DQVAsIGNoZWNrX2NhcCB9LA0KPj4gKyAgICB7IE5V
TEwgfQ0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGludCBjYXBzX2NoZWNrKFZGSU9Qcm94eSAq
cHJveHksIGludCBtaW5vciwgY29uc3QgY2hhciAqY2FwcywNCj4gDQo+IHdoYXQgaXMgdGhlIG1p
bm9yIHBhcmFtZXRlciBmb3IgPw0KPiANCg0KCVNvIHdlIGNhbiBtYWtlIGZvcndhcmQgY29tcGF0
aWJsZSBjaGFuZ2VzIHRvIHRoZSBwcm90b2NvbC4NCg0KCQkJCQkJCUpKDQoNCg0K

