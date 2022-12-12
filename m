Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77B64A993
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:34:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qQ6-0004Z8-Kf; Mon, 12 Dec 2022 16:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4qPi-0004YB-Rl
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:33:02 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4qPe-0003xn-K5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:32:40 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGwn7x029937; Mon, 12 Dec 2022 21:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=4x79ImjwBasFOUTBrfXl84i3ZU7wrG0EX5oueL6DzI0=;
 b=vPOIT7p+Bm7R4kuV5Vq/ySf6864IlDbHvVTr7xuKCzOsK2PV7HrajqVM/KOjmeeD1ntg
 WAYJbtkKuWvdZCe1e4lY9tdktGJy/LsdcmXcGvXNM+usDIpKilG3eaOhOfeaG3nVU3en
 tYvcKByDMd/EZNOdxIRcaU0Qtf8mympvJ2TTAoBIEbdjzrsoLa/l0cwwhGbyDhImgAbo
 l38COSAd7mgyLW05GRmt3+PuFX0HbA3rjUT6tgFwYHGyZNM7Y7Fh0gRAaXcmnEcTxbAB
 DuvN4esBf2qF1ZXwNDNwjlxWxXs4e2eu7PYQq3QD1W5sCvggZ6JjECkz9rODEN3D11R8 iA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcj093x0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 21:32:36 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BCKnNmi033004; Mon, 12 Dec 2022 21:32:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgjb6nsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 21:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4cFX2ft60J/8DGbBNfDu5Wp3ba4N4TbGgW95JSb10XMWiLZ9IhqVzllmwXqf2f3p2iyDqNkYYE/iJ0Cfco1b8UHMSjx2TMJL1Epm6HLfb8rwtcvwCuH/F7ldvHTA0KFPCNHoZN8qSfLR4FBdzzOvVgFlaTi5K/4ewQKqd2XcI3n0Qfyou2Lfzpxuw2M3sRcXiDUp1N4sRNX1DTrbWEBW4FKR2oG8lOGP6sku1Xl4nrKbo58wZ5uZndJwXPsNLoxWjcVdstoFptWZvTaK1v4Ajt4n6w/ShD4HJZskIPArEc2kovXBdxIIb8q29nejIzfR01b5TE8XHhRHtI+pCZ/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x79ImjwBasFOUTBrfXl84i3ZU7wrG0EX5oueL6DzI0=;
 b=P1birlnsQzuF8oC5SQzqLbeck5s0IBvPwO8Jdc3uE4KXIo1/xRBs4dc76PGqk6kQawG8qAwNc0XxHtpU1Z1WP4UWYM4/LEGhLeAEAGC9z2QF/9r0M9akW4lWzMqwEZD2baEU6lYsCFII0SjculM4HECuz0C8pfq1XirctuPP/em+4ZCJpAdfHfma+h+tfrcUfUyBVjwyj/oiTXR7mXTpUZ1gHnujY4feymc7/DUDReFfsvoBwWuOvUVnU6M/31WSLxt+1TUiD19gr2CyFxTo91Y5ztI38LH1mLtdEPDIlxKeHL02s2b/VKap6gB270UnVTi8Lf9maishu3hDdsE2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x79ImjwBasFOUTBrfXl84i3ZU7wrG0EX5oueL6DzI0=;
 b=p1b9wjKTOJplICt/3TezjEC346lTEFuTJLQMNjeB7Uau7xGtd4rPypN5OgffduMvoZbnMigf2vP+Qj5xvhSyJESlWY55DZy3S6KPJ5iBPfI/IoSWlQ+gcTBsfEG5uhNBPq3dUQSptxctGq/Isjlp0hvVnn+8ypLdDfqlLqrSfCk=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by SJ0PR10MB4494.namprd10.prod.outlook.com (2603:10b6:a03:2d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 21:32:33 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 21:32:33 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Thread-Topic: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Thread-Index: AQHY86IWgNgFw7KcwUyH35/qW0p7F65qKWWAgADR0wA=
Date: Mon, 12 Dec 2022 21:32:33 +0000
Message-ID: <1B40E0A0-1D57-4349-8ADE-19032AC0BA64@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
 <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
In-Reply-To: <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|SJ0PR10MB4494:EE_
x-ms-office365-filtering-correlation-id: 263115b4-b87f-4fe6-2f8a-08dadc886159
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TZIJZ4t7UIeBz/DVfTNQSxyH/aSWkSre4komQtKyMW6+VlmdyEiU7wh6P5fKygY35Tf66KMPLU9WoxtKY6XKvv22QImt4Mt9jn1bnpekpNPodE7AUpKetFTwtrtSuuhutlbU290qkH7tpQ1xJdchvY3F2K+Cy2Wx2l9f/O8PGSNxGHbX2DzuZoLsby4UDz7opXDukiPebQr+cNyHKatd5Koj8rQvDsokhKQXMP58nAFcnB+8ee4NvNEfRzJmSCaumAM9ZhEZKqeXu8zoYC+cSRyFMC4AKr8hL3P1fT0po4H1PG6MzjXV2PftuUgF7F2+H/Y5/hDFCw/mNdOlL82izoqxrb07keaUOpsA8eVdLqI1RiX2DZXDs3dXCHNYhC5YyTmxK3C2MFXrfSyGYjNGxYFrWA3tAR/NQl1kh6nlEv145XfgQOYM1WCtq2/4KIE7pUZFIzXOW1GahkCiGFPoy3Jh9Vy7etx3XJpJChqDhsspTWUyTtgU3OBX2w1BZzbqxGb2/PVjLhmKEnxsnA1jRZK92/r0G3eSWCp0RWDg+nW3lsdQ1b2y0blau/tiDrqaRS8oXtR884wSdYa/kRFkAIQTryFGkBcBq9zsURuNHeiUu5J00WzNTCNgEb/rXSlBk/xNBi/SQ+DWKh3PzThOP7tD7a3wLIC3fNC84r4SJ2keMcBEaCWzkk/juQCepcSS9YA/y8X89kMh1EjnRUnw1sLmsz8xBaVQPiwg2i2tSfo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(41300700001)(6512007)(26005)(86362001)(478600001)(33656002)(6506007)(53546011)(316002)(6916009)(122000001)(2616005)(76116006)(64756008)(66446008)(66556008)(71200400001)(66476007)(66946007)(4326008)(8676002)(38100700002)(38070700005)(6486002)(186003)(8936002)(2906002)(5660300002)(4744005)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVE2NzMwOXp3YmZDekNVSHFaRHN6SzdIKzhMalQycXQ5bUw1M2ZkdG9aWlVz?=
 =?utf-8?B?YlRQeHBCeG5ST0QzMlY4RDBCYkI1dm13VnRja2lnclBWK3orNTVzVzExVTN6?=
 =?utf-8?B?WUpFUHJ1Y0UwL3JRUSsrOVJpSHRIeEdGTkVYQUFzM0tjYVZpZGtnY0lQYXpi?=
 =?utf-8?B?VWZQbFVrMjgzdXk0NkVMNkRGcTBGaWtpMVBwVVZCN243V1J6a2lSTTFVdzhV?=
 =?utf-8?B?Q1NIaXA4STdvQjNadndoeEIvNEpFNHVJeVp1ZXNKYXNYNmhRaGFwQWh6Mm1P?=
 =?utf-8?B?WkFJWitla2dnSk5yZ09YNjlJYWkyL2hiWE8rWFBBMktJMUpyWnduRE1RaFRD?=
 =?utf-8?B?RElBUDhYNktTeUZnK2F4QXVjNUN3SWJxNHNEN0dSRWxkWkJycTFmVTdKUzFQ?=
 =?utf-8?B?Kyt5WHhWblRXN0hEOGpVVmtGNXhxR2laV2Y4bm9kWjJJbHQ0Q1BXSEFMbytY?=
 =?utf-8?B?K3FwTy9TdWhlK2REeS92VlNNU2M4R0lUSUJoeGJFTWVJNCtNMm9HZVN5Z0tz?=
 =?utf-8?B?TXduSUR4ZmFpZFdKbUJ2bGUrT212dmozaGJIeUI5ZnVSZDRCVlNjcTdydU9V?=
 =?utf-8?B?bnNtR2l2eHpZWWFESTZDeDA2VEJIM3dPVWtxVXNMYnRPalFPSGRSU2tFK1c3?=
 =?utf-8?B?MkJrdXpTeWJSTUMzMlpnRG15MUgxWm9CdkhXWTQ4OEdRNk12OUxtQWhyMGVS?=
 =?utf-8?B?YjZYanJMOTIxVVNxOEQ3Q0t1cXRnakhBN0gxcHVCQklHZDdUK3kwZzE2RU9j?=
 =?utf-8?B?ZmFzSSs1dytKb1BEZExLZUowaW8xbnlpTGRUQk02Q21FYjJCMFY2bmJnWS9O?=
 =?utf-8?B?KzRLaGxxVnZsT3doUk42RmtrKzcweUhzUEZDWStQNCttZWFZK00zanFUQnFF?=
 =?utf-8?B?cUlKT3loRFIxdFN1YWx6NFI4VVYvVDlQRU0xcVU1ZEpxMjBYMlVmbmk1ZkR2?=
 =?utf-8?B?QmYrNWN0b1VCak9YNlFrTjVzRW9BUTQ1TTZBOFdjZ1dobnJqSEhXcWdob2ZT?=
 =?utf-8?B?QUgxZWx6cUJyS044Y3ZJQUZXTWlyWlMrV0s0dXFPQzVyNmhGWmo4cElEL09F?=
 =?utf-8?B?R3F0dnYxcDNIYWp5emtTd3E3MkNPSFF4eVpJdDczZGM2TTlKU0JKWUNITUVW?=
 =?utf-8?B?M0RGK0FPb2xMVlRCMFE1RmJSZFhtRmxKT0NHQWo0TUgrbXpiNVlHejR6MXRs?=
 =?utf-8?B?dTFMaDFzQWhBL2RzL2phdFlBZ1pxdG9RUTI0SWt1K0ZKb21ZNnoyTU85ZzNF?=
 =?utf-8?B?V1BhN2EyY1hOWkNZQmRKZFZYOWJVdE1qLy9QbGZQTVVGZ3ppUHJ5YmhncTQ2?=
 =?utf-8?B?RzNsV2MzVVBsL05GNm1KR1d1QUljRHRuWXpzdW83bmZlNHdTVHhyUGkreG5Q?=
 =?utf-8?B?TTBxQUFWRCtyOGpvRDQ5ckZDQitZalNLRWx2Tjk3bUdxQjRDN3ZaVDFPT0ls?=
 =?utf-8?B?WTQyQkJhQjJCb3oxL3Y4OStBOHFlT20zTVQwY3hsMC9DbndtOFFEQUt4b0tE?=
 =?utf-8?B?S0lIODJJakx0TW9qRFZMZUVNbkc5bm1NTEJnN0xFeHg3NHFTTlI4WkEweHNX?=
 =?utf-8?B?aWUvN3FXNXlrSWdPTVA0WGdHZlRiSHZGd1BWc3pRMUFYTDRuZ05ncnVPb1I2?=
 =?utf-8?B?d21iQkJBZ2lXbTNnV1ExaFFMTVM2VFVOai9hc0JQL25WSjErRmNrNmMydnhp?=
 =?utf-8?B?c0ZVYkZvek9IbTVyaS83MHFEclpxZ0NxckFIQk5QTjE0YVB3NnJWNWtuOVRH?=
 =?utf-8?B?NDZxbHVuNHhneStjYnZFaUk2VmdvM2piWTRVQjlHTkFKaThYYkQ5MjlOdDND?=
 =?utf-8?B?MUZiWi80TENNcWgxSVpOeVFtYjlUSVdYdHlxVGhUOHB0cE41QUh6NHpMbTRZ?=
 =?utf-8?B?STZEMnR5cXFLWUE5OGM0YlFHajZaTWZjOExSUzR6a1dzcEczU0VOT3FMblhn?=
 =?utf-8?B?Q1F2ZXo0ZHRsZXdTaGcrMDZEbktNdHFpL29yL1kvOE9IVFNLMk9IQVJuT0RO?=
 =?utf-8?B?SEU5ZXdBeUljem42aTZtOFQveVBNV0RKMHZmeUFDWTFReW81dnQ3Z2RRMXow?=
 =?utf-8?B?eXpZYkFYam0ySkF3c29ZQzR2bDcyUldnZEVUVFdqRTNxajUzVWJ6WlJPZ0xC?=
 =?utf-8?B?emZ0blRpTTEzV3FpZEZzOE9DREM2MTVJQnpuYk1TQnJOSEthUmd0M2RxbE9R?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D760311972C9F4DB6E00837EB178BAE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263115b4-b87f-4fe6-2f8a-08dadc886159
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 21:32:33.2775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovTQUPLytQrWGEZPoZb6tG2NhUUVeVIZUY9AiTiEmpXC/tTk3C0Yce2/yWzaEZyNwAcWnrsfp2bzUasCP4qqHMQuYZgnJxeueckD9wYr1uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4494
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120187
X-Proofpoint-ORIG-GUID: EuCulV_pFkpcV-asw4Xaq8mWNaS7g215
X-Proofpoint-GUID: EuCulV_pFkpcV-asw4Xaq8mWNaS7g215
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

DQoNCj4gT24gRGVjIDEyLCAyMDIyLCBhdCAxOjAxIEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gDQo+PiArDQo+PiArc3RhdGljIFByb3BlcnR5IHZmaW9fdXNlcl9wY2lfZGV2
X3Byb3BlcnRpZXNbXSA9IHsNCj4+ICsgICAgREVGSU5FX1BST1BfU1RSSU5HKCJzb2NrZXQiLCBW
RklPVXNlclBDSURldmljZSwgc29ja19uYW1lKSwNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBhIGdv
b2QgY2FuZGlkYXRlIGZvciB1c2luZyBhIGNoYXJkZXYuIEl0IGNvdWxkIG9ubHkNCj4gc3VwcG9y
dCBBRl9VTklYIHRvIHN0YXJ0IHdpdGggaWYgZmQgcGFzc2luZyBpcyB0aGUgcmVxdWlyZWQgZmVh
dHVyZS4NCj4gQnV0IGF0IGxlYXN0LCB0aGUgbW9kZWwgd291bGQgYmUgdXNpbmcgYSB3ZWxsIGtu
b3duIGJhY2tlbmQuIEkgdGhpbmsNCj4gdmhvc3QgaGFzIHRoZSBzYW1lIGtpbmQgb2YgY29uc3Ry
YWludHMuDQo+IA0KDQoJSXQgc2hvdWxkIGJlIGEgU29ja2V0QWRkcmVzcywgYnV0IHRoZXJlIGlz
IG5vIGNvbW1hbmQgbGluZQ0KcGFyc2VyIGZvciB0aGF0LiAgVGhlIG5leHQgYmVzdCBvcHRpb24g
d2FzIHRvIG5hbWUgdGhlIHN0cnVjdCBtZW1iZXJzDQppbmRpdmlkdWFsbHksIHNvIGEgc3RyaW5n
IGZvciBhZGRyLnUucV91bml4LnBhdGgNCg0KCQkJCQkJCUpKDQoNCg0K

