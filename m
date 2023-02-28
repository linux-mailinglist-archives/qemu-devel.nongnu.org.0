Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BF6A590D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWz91-00012C-VH; Tue, 28 Feb 2023 07:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWz8z-00011l-E1; Tue, 28 Feb 2023 07:31:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWz8x-0001bc-P3; Tue, 28 Feb 2023 07:31:45 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S6007S016289; Tue, 28 Feb 2023 12:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ruXbZVUVTtxDXM3mqekCoZfUj7AY113sCciEWvc29qw=;
 b=c2pmw94EpN4NO7a0y/RxSz7nOdSjh4tV8rK0/ZfAsHmJq/dQ3WbzdRq8uP1mytRr9JZP
 a/HNGUA3MY5jd6ElcCbjTihkzIeoMEywBl0SXqSI1qFKNYDc6drvADm/uDaTT4Z3cjJo
 f5epWwEJRIM1wJpiQ3r3c+6on/T98XzbeGmImVhDBP6D+elsH063XSXjaITdvZVKUPJn
 Io01Jh8f78+YsCTFGJ6aOhWdQBv/slv4dqXw6xhgG7VkGRo2iO53q3X4UzTceDQFY1XJ
 gOY3akt2oaX7vSPv4ivjDZHnihDGLTQ6EdembDpTe8ESVsr87znbVFqUOhwV8ABrhtvb rQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba266ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:31:38 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SC4ZUM028689; Tue, 28 Feb 2023 12:31:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8scs91e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwc1YRPt/7LH4c2B94tNTHqlSh37FR3oG6a98cxf8xVq2hz7YPFOsucwNnZmveK3fi7Dp0je89U+KB7GEnjIzXRHA+JDh5YuT+Ir0UcKERsZmKdjR7378qts3fz35E6y6OupIAPQ61sBlikIwXGV+H55Aej9Vct1y9uYvzhLrmU8Jc0h9dGn3g1Ea/lHckUSqEujh36CREP079mXArXmdbzLMcZSXdeg9vaXto7ADZWcSQd80hqnIrMhCXpUCmeDXz+v9vicUDk1aD5CiNULp2btq1zFk+9oKUYwvHLKW8Y4Z25kx1GzeYPknFs4Y7LoK9wKSy3UzNQdVMmkHaWIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruXbZVUVTtxDXM3mqekCoZfUj7AY113sCciEWvc29qw=;
 b=lvI8yQSnBfkKDjvEDrmBDzQEFa3zg9AiB2SVBXnolva4KCetQ+MJlxrQdWZUH6QxjYkkz627A1q8brJYt6BGLJj1BPlMGm3j8zVt6Vj+j8Zv2n8iMTiFTiPze3DF+0PWfM/lxS+yJ4UG4PiHcPZUwAWHiJMFDYe6QRhKyCNEvPzc7VJrDy64HTci22g9itA0b4leLeeRjXPxkYqgFSzX8RL5BNqfTIaJDnZoIsppSeRAw7lp5jIgsbYpzLEffTk1mF082TTB0IAOBibCOj0UG2pi6AVsuD2SsSOnu7Hz309HHTVInU1StJsbKAsfyREKGco+bpJ0g/A7X3cmxISSVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruXbZVUVTtxDXM3mqekCoZfUj7AY113sCciEWvc29qw=;
 b=NSdeBn3IZkbaauY30yLJLGaxLhYhR9F6l6BXjJsdEU28EHCjbkz26PSyPi5kyIOHZVQr5pwe3HiyQcTYGjxBq4wieXI5/axoVThdH7esBWXtNSoI8+kGbrcCpaYJ2bdLPysKz/6fSeRfjWE+n+4balsGvI0vEjYfQ3cSVClEdhg=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ2PR10MB7038.namprd10.prod.outlook.com (2603:10b6:a03:4c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 12:31:36 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43%5]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 12:31:36 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Haibo Xu
 <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [RFC PATCH 5/5] arm/virt: provide virtualization extensions to
 the guest
Thread-Topic: [RFC PATCH 5/5] arm/virt: provide virtualization extensions to
 the guest
Thread-Index: AQHZSsnPKfMfN0eQvEyMjuEHExLXVK7jLUWAgAEeTIA=
Date: Tue, 28 Feb 2023 12:31:36 +0000
Message-ID: <FE42F707-E978-4CF2-9B14-78F952EC03AB@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-6-miguel.luis@oracle.com>
 <dd842c9d-4e01-d256-70d2-892818cb133a@linaro.org>
In-Reply-To: <dd842c9d-4e01-d256-70d2-892818cb133a@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|SJ2PR10MB7038:EE_
x-ms-office365-filtering-correlation-id: 8482c829-41f0-4268-18f8-08db1987bba6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kfreo/ZuGYGYv7d6WO1bk3OOc6rZkXux6oXuRWtN99uSWpEmoqyYTJwBNnT6NJWcrhNLknsQBl4IxYBzTJJ/RmVqXMWvP6B1s2wqgJjI6N4h9k+ykrDkWt0MSmBwta0dPiQCSiTXnHtOpRpl3CgwxN7H6Y/nluKNq1u4l/bUqGmasaGuFPLhNKU74VDgCAQisN9vM301222hfNfrzvoB7qDNnyUJX45tU7gXR7XjgQ7/w7ONFduN9W1YDl7lFtjkao8xY5/7dXUO6nuA6T72KafW6oNBWGtd0v4Gpx22rWyMOhKByIGkutecBjFxJGkvr3lhlaNGGGrU7nAaKcdLoq3BuNxnXXVI4AeQWGREhtZxiKT6AZPngU61riAI9nbkWdtXCjRx9pTd1Qe6CgMecBsn4KSBKWjCE+q+C9StTytxvtI6BmGZKks/t8zcCvYTxirBYfjM2Ev/nmsbKwjhUwXSj9jh/bvlJCJ+/SA7AlF7A7tADT5dZwPP619D0llcyXy6gcdhVFbBfza/HA6spc5HDFNIuapolC6SjmtL1/jFaH+s3Z7rakahkMMb8PFRhBxK2zKM0jnZd18LakZZJIX1Eku+3pQKKEtarE2mxntDljk1inwu2yHKqdTIvrAs2FvFu/NHNnvPfy8x4hLvWrop9WcyjaXejnBATm+wqmOy8BmulOpuScr20upwNCccHiW8qRnUkzk33/w+M+tDOD2dn5m0T4flQOkqIY8+ZVk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199018)(36756003)(33656002)(83380400001)(478600001)(6512007)(53546011)(6486002)(6506007)(2616005)(41300700001)(186003)(71200400001)(86362001)(76116006)(91956017)(66946007)(6916009)(66476007)(66446008)(64756008)(8676002)(8936002)(2906002)(66556008)(4326008)(7416002)(5660300002)(44832011)(38100700002)(4744005)(122000001)(316002)(38070700005)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/rnXFnMl1c14K1GYFpV9urYOFNCmiqCRb77dmMETIAsGnvDu9/GudYxW/5aB?=
 =?us-ascii?Q?PF1yc4rI3pM7VbWTOO2+fH+c7LH88eKaWGS9g2qpJ7o8QCt0oofCDYTewHvo?=
 =?us-ascii?Q?U64UgXN46VuTJz8GnIBB2VbZrStQKu5N2isnLSHbbhyrdCGvmnW205r8mQ0A?=
 =?us-ascii?Q?9pOmjveUIhe73wGpNa9M5a83mT1xovYQuvRV7O3rDNVtCTKkjATkhe6Rf9kp?=
 =?us-ascii?Q?nT4D/RJSo+N/1eAFVplu7GI8EzTloafXjcDT9n6zVMslvNoiQP3GqE7gkule?=
 =?us-ascii?Q?BsgmaOPXR5S7KDuVzUprrx83O4mBWt3RBaaPaGJNjLttnODYLit0OnSQbJsD?=
 =?us-ascii?Q?OE3EKbofL9onGB03/lfwtQe06f7i7Pf4jChkJKjkjCDj3XmlhQUHRsxwhp+J?=
 =?us-ascii?Q?4jBaLpyBJPA3faGUDx+u9cGakVHQrfjFDyueRScjNjKDdZtEtf73estTaNEg?=
 =?us-ascii?Q?q2NQoM5RLUKGRoEwPaFJwD6/UPT3255zucj1r5KcPS41Ob2jWng8G7HTuG9s?=
 =?us-ascii?Q?wIwhEqKluBAZOPT5UMmixSB0xELHlIOBI2mXyTgq6AXZlAsAGcO5GpVFLdtl?=
 =?us-ascii?Q?akVtGVD9krjVnEkA1Bc8jbKED8rA3O2B73ECjZfjRWJ3+/0ssUt4txhKzF6z?=
 =?us-ascii?Q?X/cOk2vBQyXwNm/vxTUBJnWi5k8LMV9coORxUfkt6hmrgdrCr0ChivGohbI7?=
 =?us-ascii?Q?vzvj23HJ9J9gfHYYMva6LEIIVB1tGZ6ez+HEfwAR2AmGXDiW8sLMu1JQuWvV?=
 =?us-ascii?Q?vDXLdKfK5MHY9wWu8l//WcAOIjNCWx4dcfYQsdnmkWxQG/WtovftggSLFAVs?=
 =?us-ascii?Q?MRQVr/u52TSuNX4Ev75N5lR08rHFLF0+po/inOUbLuQB/eiFRTrQOlj/q5MK?=
 =?us-ascii?Q?STCUq5yzVbdMMsNzWWwRie9A4qDsJ07KY7z/u9FzezDznjR553ool7HSoCWZ?=
 =?us-ascii?Q?ExXZQWRulQmO2VaeftIe7iz1RS/KclumgBqJtl0AFPyrvm1l3EtCWpLJTrXO?=
 =?us-ascii?Q?LNhYRbFnk2UhxJiLjrQ3cnxv7DD2zxOomE1z2RHNraz4jAIb2blgIg+C9uMD?=
 =?us-ascii?Q?NTp5HF+GEmp1QKTj+OdjL4h9flEj6ZVItLKX8Yt20qk1hdpknzdosuVwGbAo?=
 =?us-ascii?Q?dm4fpCEWdnEeBqNnQJj9LX3pRVIWt7Q2+RKl+QvoPYa7iR8z0wcykV2EkRGJ?=
 =?us-ascii?Q?nNGJqKecXGnFdjbS3O9kPv3ii6Vus3yEY+DtbTmGJPFk8NXKxk0tH6MHonf9?=
 =?us-ascii?Q?Zuwsdt+kpdiagqqzXREvNgbPAniLqUSrsuC6NRNQCVWTcTupPPPzBYDi7I6v?=
 =?us-ascii?Q?TV3USGuqLi1VulbJ48wRAGIF/iXF7giIXahrdl82yRXTJWM0UFO5If7ZVEmY?=
 =?us-ascii?Q?VAWM2hgDbBv4xvZRpgFhq9kNrf7caXCsd/ZN2gA9doZLTQnCuz3UnRfTJwJZ?=
 =?us-ascii?Q?GLtGiVPZi3zjS886HWI5qrWZlJuivGHPD2o7hNbvezBbxcCmFPjGaAMDBt9N?=
 =?us-ascii?Q?htk9g+PmaAcpk49wrlfkujk2tG4YrEs6+9Rm0IEueNYeEjoZVHZDULHEFxil?=
 =?us-ascii?Q?+EiOwid5epbYiX3p7eDxKMFr/WVJ7nvTycmO3gME2qKG3zMifhj9Fje8a376?=
 =?us-ascii?Q?TgBUKfwg3xPg7ejNGAvOBtA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CBB468B7F6E91944BD8A4BD57C2A1973@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: elWKr9GRwWUWJlEQgC2nADFHU7pocvc59n6OLkMp0VOZEAif3RsPN2OvmVPfqC0qMMtdq6/KqbW7Un904PlA7XHjUXfJZV23RP3EFd1YJLac55fXDWqatfxBwtE0LSx4GDRA1KI0FmHDTOZs5A41KF/2ItdS5iBak/0mDB8O21e07dpElvjZ/lw37dytfmQbJrH1v6PzUJkxKj6bl2pqBaFB7ytgL4L7QnUX6ZHvomDuFM2BcCipu2BDAjnFffi7j+Rz262/ogS5ni3A/QlrRwfNMi8o4kFz+czjOGI5AjH3kjQAb3RYcTdt1LkPz1PAJtyJ/O8s75oGEMnMjXPlU8ZycRoBtDJmo76E0/y3zm6npjXrPmGqP9ukkdaCoWdJ3BI+aW8n68O0QMVOaFHKv4GjuAXvjDF6ilTbL3bQ+9mebk4egBPJLO0ezJh81K4tMfmVB0oewEgfr5Ad7S9kGRkQ5KAdem0CpvhuEEsh1GFHQzwWxz2wrC2MSxtnA2B/mZrtzDh/UAagckuuFbv7q69QALCOgLAG8ei13kHwr7rx666JBRgsezWa5RPqv0CQHE3KLTv/A+Tj7oScl5Pk/F4nvu41NKWZkkOHywEGTZ2tFIiCxWZNnGay5bvv9PkG5GPF1nZC2WGXNO9ovaWRwq9wESFIniNI+dtS/4QEKAxPUKRvr8liFpJAqrK3Ykm992zZzyP1KuKClfsM9IoukilhzIpUFC34CD8C8Y050w/jsK27W+QjTGvDT5MEDCkOvBQjAcpAd2na5+H+1EQFIPTKJ0dlvNx95hYM0D3OZl+ZW15Ftt0Pwv+V0KO1xQ6PY1RMpMq7Taeq5OeR0mpjQQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8482c829-41f0-4268-18f8-08db1987bba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 12:31:36.1936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1aFL+jU/1KsF1dNj+zQ2S+spRCpKU74GQ61p/1r5miQjA4AQ9siDFILqG/XPYC2ojqIruaVYP6r/s/SOGECFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_08,2023-02-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=722
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280100
X-Proofpoint-GUID: h6H1U_hNpzZkt4uczW2De7clz_bBKwNG
X-Proofpoint-ORIG-GUID: h6H1U_hNpzZkt4uczW2De7clz_bBKwNG
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

Hi Richard,

> On 27 Feb 2023, at 18:26, Richard Henderson <richard.henderson@linaro.org=
> wrote:
>=20
> On 2/27/23 06:37, Miguel Luis wrote:
>> -    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
>> +    if (vms->virt && (kvm_enabled() || hvf_enabled())
>> +        && !kvm_arm_el2_supported()) {
>=20
> The ordering of the tests isn't right -- shouldn't test kvm_arm_* for hvf=
.
>=20
>    virt && ((kvm && !kvm_el2) || hvf)
>=20

Agree. It will be fixed on the next version.

Thank you!
Miguel

>=20
> r~


