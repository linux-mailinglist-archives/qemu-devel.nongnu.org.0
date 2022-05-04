Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F751A24E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:36:04 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG6l-0001HX-Ut
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmFyb-00033b-7u
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:27:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmFyX-0007jI-Ex
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:27:35 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244ENv5b018680;
 Wed, 4 May 2022 14:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=V6FbHMbFjPB2PEyCW+5BfhYkZN89lFV9+bkdZEwr/Yg=;
 b=oPycsnE+QVNy9+9twhZlByg5kjbn7JMxsl3lggs4p+OokZYa9HVsKONJeAOEtOoIPQJS
 j+KuwkOW55NbUzy0JXv+sUcvKjnCaAcsE1JyRIYYiK8JuBMf059C+W52ABq7uhk6u7WT
 TPnOGPD7/NXwk8a0FWr8MRtXhDNC+bgESPdnAoXwou97Eluttn8feTvPhURjwWUzjyw4
 bsfprp3wHPL2phiEdCFM3xIvSxOKE6vdWAZah47ycONLcklEUlQBGlpGwHolWvvJNfr3
 r/NVWmc5cDoYdxRWOGfPsXsI44A1yLaszNdhDbuIHnIAlSbR/ctQs3CIrHtDdjE63AYA Sg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwnt8mc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 14:26:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 244EAtpY018179; Wed, 4 May 2022 14:26:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj9jhm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 14:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2vRPk1Owi/qWP3+iF2U9cR1ItqWFAxpp4CeI/TSESTjVRQ9C9LVF79KswS6JdouWwAdetuEELGma3aGF87VQDZcR39eVpDEFNUzeZcdi+o9Vur5ep6ruqYREQ1UbdyqVKa4ZlrHulcK8ecY+ICIDYcASzXPbRkf/dMl8BF8Sb61LzTKj5beSG5alO/KHA0zge9d9V/reVOH1sJ8ViG/yrbvgnBBSOIHajA4YaZ33NQCc3A2nV354qKYdd0QosipTXWPBtj55snCUH7W1B/N74StgkCufRLGdvWHJEIDkPdigmNJfJUTvRN8bQRiFDl6JMutAkwFVhEsfAVWhYr/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6FbHMbFjPB2PEyCW+5BfhYkZN89lFV9+bkdZEwr/Yg=;
 b=VqSZovQgPh+pHAIimthbvEFAh57cdx1sx8igZDajp+5VhlYf6t4AQ+OjJT0oW/6hLMr9a8AflBFpUn1xGA6aA7wekyrDxjvEf1LzWRCpGgcZz2L3iUxZLH5I0GqBVk7WdljQuqygA3PLorjuRY2/tKGTx1OOug9SnnCr5iSvpQYtXAUEsLJoiM7YS5NsnFzZ+lWblmk1abOnqHY9ReiXFk0p7Q5djqDCorgex/G7TCZpVzzq3IVzZYxrq22af3+gvO4da9ttRWRxQ1pyMy+F8QzsVrVZcld21Q6aYJs20d/bwRhmYCCBsitJbP1qOvBnjsab9vgoQQNJOdVpU/EPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6FbHMbFjPB2PEyCW+5BfhYkZN89lFV9+bkdZEwr/Yg=;
 b=lxKRU4VDsoIlxdArqDO5mU3FUwcJ9vn6RkmddJnl+IZRf/re6HBSMvBRG2pzzaasO7NTph8/rC12uLAEag/m2n6CfeBewvxk/k93ufgp+yotFIFWimWgvjZCe9TloYIfC02Q1hYX+tqaUDKw4QBnV5HH7V+T9QCH5/xikJ2hUU0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 14:26:21 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 14:26:21 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
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
Subject: Re: [PATCH v9 00/17] vfio-user server in QEMU
Thread-Topic: [PATCH v9 00/17] vfio-user server in QEMU
Thread-Index: AQHYXvh2CIcfDijGck2HmjNKM7GP160OmKd0gAAvQAA=
Date: Wed, 4 May 2022 14:26:21 +0000
Message-ID: <9BA58418-7B64-469E-81F8-886EB17C7796@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <87a6bx7cma.fsf@pond.sub.org>
In-Reply-To: <87a6bx7cma.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 827fb86c-33a1-40e5-b211-08da2dda0f7d
x-ms-traffictypediagnostic: MN2PR10MB4173:EE_
x-microsoft-antispam-prvs: <MN2PR10MB4173FA4B403570920E253F9590C39@MN2PR10MB4173.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sFvwXPuDJjqsrbIRd817eR3JfTJZF2L4+aJw19mYcQtxSKa6y68t1Qk0gS8pdYX/wf1dO+LnVktd9wfwy5gro1CdOJHTRBt7ww2n+ldKtO2ZXk/XhPsNQZ1NLDrqnegUW/fRC8fo6VANQHphnN1eOsNQk8ZOhug6PBQtcHGJVaeEfubFcXPmJfEfH7/HExnhrNFWKiMsNkKpq8lYAmcor2wXBV4RMyU45aaTfbPbJqWMTIpXioKyNtFk5T7zpT2NMbY7V4xMTmTbKZxDfDTUVSbMOvNpWxuVa+qguN0QxWXPsRB+xlw3r4xe/AlREO6+KBlCCSsrtLwedA8NZo20UB8jTUZyw81pRJYemJ4je7Ow6jH+WUIvHmjDBNZVLr4Pq81Zr0JdFAy3017ch9g5DnlSylzsj/DjnMknwd5LRKOWuIeLvhKRwuLeX/edGcjMzeLnEytqcC61ALdOuT6giddM9TrxP7s636mSmAC7p7mldPJG/vzObQHu40gibEc835VZuVGFo1jadOQjb23m89RxNfYotAVo3ZY3qpCRyvB3PKm1kxex10LJpG1jyrPYl2BJOkU07Rvn2G/wQPXgRcsKOSS7Mg36/NXeVDe7yo3UxXGds1ukEHX+2neubk61pPlyFj1rcuYURVuPGVMU7PuBnk77EJ3E2yLILwDaFZBRhcuRNMYOvZ+EoGMoAOf1jf8FyYfA68VhI7VAM3IyoraDT4lNYWz7dgwxSQTZaCihPh+EkQ32msK12cCKBAsghnnpoNFxLdbYR1WNZcKsFmVoOTi/XZ7mOFm6BLbeE2MbgBWlyqF+fEgLmaYUBtob
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(316002)(4744005)(107886003)(86362001)(8936002)(2616005)(7416002)(54906003)(6916009)(33656002)(186003)(44832011)(36756003)(71200400001)(6506007)(53546011)(2906002)(122000001)(38100700002)(38070700005)(66946007)(66476007)(64756008)(6512007)(66446008)(66556008)(4326008)(76116006)(508600001)(966005)(8676002)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zm8um8a5tTwjbuBw/pIJaKrDYr9J5qIpNtubMc6bsvawLZ1WSwHidxiZ/7?=
 =?iso-8859-1?Q?E4F+HafIqdXz4ip+iPYSgQlHrKVK5/wNitAciQj66PjHgDYgi11Fhm3nNU?=
 =?iso-8859-1?Q?h6pF6Z5UC0d9cyjtRockR3G2JCTFEkLrFTuoqOv64sZHMAhSGPEZ5Sb/j+?=
 =?iso-8859-1?Q?mN/JYEdnV1yv3gdTt/uZ+qscxMjpNL9CVS1F0FgLZ0U3LWirXViLSur5+/?=
 =?iso-8859-1?Q?zXew28d+ai/A/VHWJJRINEOaKRCSY9jkh++ixMWWS5zHHfdUD1G99Cq0jF?=
 =?iso-8859-1?Q?f9yENN4E+rpN/CuSLbk9mQ32IgXC/14o/F8yUq7YVnlwd6QKZjyq1i0hdj?=
 =?iso-8859-1?Q?Xt3jI40+eWn0JhspMeuwTLYr0r4LzRVm8kZHWEU0BxTLt4NP8goorph/YA?=
 =?iso-8859-1?Q?B8tBKSObHijofS5azGGVhr3hC+yGHYyW61q3iWvcvk9qeyCC0V1fKgnt7v?=
 =?iso-8859-1?Q?V3ubL7iMn1KMmsryhFT8RHawBXYNOSq6ppkcCo+m0i482cBBd7PwiZGmrf?=
 =?iso-8859-1?Q?46Nd4FmeaJ2S349cwXNNSaQ1hSjd8Aai/+1o5ZWmxTvhVLox7bBkFQyhev?=
 =?iso-8859-1?Q?+G4d3tz6bpeZcwu5zJNFc6+7/b+AVyyqjNGdzjiyUKN2pogr2Hl9yy504E?=
 =?iso-8859-1?Q?vm3RyBLy66YAB+avxLhO5jRPztQeXKJUcOMcQM1Sjwt3wh5ajm2UiODBOT?=
 =?iso-8859-1?Q?y9haexuya5+N/ui2c40zdG9Fx9zfyGUCZ6Y+E/GIjwW86anhkDykubh5LJ?=
 =?iso-8859-1?Q?t7vM4S6EXAdTSs2BBLBHItMxxKjkVYlMwW9B9dtzHQHqyfX1y/BDhV1MEP?=
 =?iso-8859-1?Q?o6l13QEXyZ2sqgyBbdsTcjqauTcsF378elLL0lUDgLpQ1jNDSo8bPBU0IW?=
 =?iso-8859-1?Q?QaeW2BOUBT72Gc6RQJQbgg2hd2989vPwjBtLvrtamUsp6m7HyZv4tYbBYm?=
 =?iso-8859-1?Q?eUrvG13D4t1w1aID5uEJaYsCNLte4ycwUCuZTAzFr7Ztmh3aAoSzCgt7+A?=
 =?iso-8859-1?Q?E3yAcjxBT/HM7hvSchDME4eIM0ADiBtkpb7pkUd3QosGe8twBkB3qZBW0v?=
 =?iso-8859-1?Q?b3NGgJbWc+x352IB4cpsv4ItVlmyooh7Zwqhw5SP9kkFgcYOWQ23z/Lo+C?=
 =?iso-8859-1?Q?d7VrOsrOnHKSn9TSJhzooqC8dL3Bzsp1GmNzS19/yHyk+g52zNDwnnAaQe?=
 =?iso-8859-1?Q?PKvaOnJmN1HZ4XJhIM/77lQLZyDrhUyznzKPZsTULzBtS16a1NEz05MWan?=
 =?iso-8859-1?Q?ulMDQgaV/7BieWJhptO627obj/+/JIORCd5u9cq+MkLuIykPcO+Za9xhj4?=
 =?iso-8859-1?Q?ZQS8b6ZCBOo9Otg6su3ErFkEFbjcrvM2YCfnfIwH8fn5CBkXwZiDWsrjZg?=
 =?iso-8859-1?Q?I9PC6lwGQEg9LDL9do6mzlTSrkDZVdlm+0FWpKPOheE544Gjt7hi+TyLlq?=
 =?iso-8859-1?Q?Y6eZ2Ryq7Du5U7OPNfxOGi0pdfK1tQRtekbpVY/Y3fn4O/5rEsbGaFxtBo?=
 =?iso-8859-1?Q?haYL2TixvaaIzEEgxAE6X1YU30kHNBEcLFHYue9ZxY0f8rZcrnDg5toVg/?=
 =?iso-8859-1?Q?0N8h2hGld2bLDoOYPVJpl/YEufQFGiYrTQXDi6B2vHt/WYjcA88h82F+UF?=
 =?iso-8859-1?Q?izNnve6PiKmwyVEJWiySyJZTx0LGaonhUCzbhPg2tnY9bL1T178ZxyWuWM?=
 =?iso-8859-1?Q?TKDFVmfwXfyde2DJNprQtU6/q0tmCQ8eBp5Gm2ndJbGjMEw71lRgfWZpcv?=
 =?iso-8859-1?Q?DkxcD8MshdNpG+OJC+KGxIxwu2/eiOzyqSngUNiTpRe4a2LOKyPRZcOtIP?=
 =?iso-8859-1?Q?wIPa8XL5HogDL1boSqVSwJfoMGjLnngG4u7TOQgNa43wdeT919Py?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5980E93B336CB644BB9B8D493EE217E2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827fb86c-33a1-40e5-b211-08da2dda0f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 14:26:21.2206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/D6e5s7cwFnRc4maEa/taglH4HYc3AAik0WVbZpetr2gBAEBlkdd3edLxWrOEdofRqdIjHd85Pk8Pm0egZy5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-04_04:2022-05-04,
 2022-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205040091
X-Proofpoint-ORIG-GUID: 2B630gRzK9a0hnz-weNRmVrQYL4X3Uwv
X-Proofpoint-GUID: 2B630gRzK9a0hnz-weNRmVrQYL4X3Uwv
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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



> On May 4, 2022, at 7:37 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Does not apply for me.  What's your base?

The base I used is f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65.

The patchew tool says it was able to apply the patches:
https://patchew.org/QEMU/cover.1651586203.git.jag.raman@oracle.com/

The client side changes required are still under review. But the
following repo has this series applied on top of the client:
repo URL: https://github.com/oracle/qemu
branch: vfio-user-v5client-v9server

Thank you!
--
Jag

>=20


