Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C64C3CE3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:07:32 +0100 (CET)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRtD-000073-Ne
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nNRpo-0005vF-PE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:04:00 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nNRpl-0002vR-1N
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:04:00 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OM8psC006290; 
 Fri, 25 Feb 2022 04:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=PULhjbjOY3KBvj1aIaykWAVA3mZGbmJC4RtT5uTrfKU=;
 b=RqIVbPzeMZYqZf8OlysKQ6y+df7/wg9S0lUJuVVnAoxFOBCh//y/VF36icC3lyJWeWF4
 ADhRzpTScQUqshaKwZJ2NtY15PDZLlV8yoHDEN3JP4t6OUhkuZFtLDhl9QmVKdSB/2zu
 K427iaerzUjD5eUswr+/xgqUnWLiUHwGaC1LhTP7eMFxFs6hbIQnqr4f3W9KwowUTyI+
 1IUqwMHYZQUBdE5tC40D3f4u9a7fhfUy6ONpLmUuKnFBdZQ3vvzEnbIEBioQzRM4HqsZ
 EYENNXqoaOpZfHyrz7eFg98OHuoeyJApNNG4rkdH6euuQ4Wlx9z605nIifc9RQ683YMc wA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6f115c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 04:03:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21P3v0Z3017944;
 Fri, 25 Feb 2022 04:03:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by aserp3030.oracle.com with ESMTP id 3eapkm6bkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 04:03:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG6ApEPMoQykzxaZT5wLw3qy6AK8wEkY+F+isANcvld6zqAvumU7EwIqWzpfA4e4tTwUulS2eabghpPlbu7qk2TSmXRP7sfo0kmb0wDp8y9/MNTm+J9ZeO8QsxH2MjOoeFPH74b9wrHahBdnf58mbrFr+yqA+UNOtNX45PutSUvIFavsxfWdd1NIBPqn0n1EV5e13knq8PDz1UqF5/idlJRNqIz3KsIIBrqD4PiaIItNICtaRd4S2e5X3Hc8od9ur3H2ZVo8PeouL+ltNOcZ8mUsi1sEfuCUMQqVhHPxqQiSGtkSR4IYF7CFof/26KGL8CF2dLYwtmgee+689o8zMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PULhjbjOY3KBvj1aIaykWAVA3mZGbmJC4RtT5uTrfKU=;
 b=iaIaQSwsuGs38ZgGZmtK7dGGYUqyzcFK/6SroJfc4IWv7vNbNopT/lu/CaaSp7RaYIX0jwfFRSWQ7tF+QDfQWL5DxrNjCv6tSfkmzLN1oT8kCwreHjKOXfmszfrp4oAtaT5MP/hNwdlJISuZeQlChj7FA5rp+ogRm6iFYAyYovHyv+TXmXulcH4SSsLSd6uzDNZJZCZJPoQSwVIKVQZSpmjH1HLpkdT1U0U/MWJbYksJMDtpn1U4bZmutLXHce9UeSlEs5V6B3zqcbBIEicC4kB0/R0l+Js1f8wSI2wVrGWZY9/WYhHBAiSd85SyKv3N51iNscwHUNMPdHvHhJCYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PULhjbjOY3KBvj1aIaykWAVA3mZGbmJC4RtT5uTrfKU=;
 b=BEBkr9x++HiFK3oFO1wrL6t/T9o0NbeWe/h3f5GdTltdJ792PdElXPQ+ftSJZBVBDpOfGm/9vjBR/9dIEfdXolD0YjZ3oA4wZVEd0VxJwJEtpCrRk0F1BbwEiOi52Vi8ujuWrkxRz7CZA+f3+aLXtFpJdsqInBgHcspjJKBQcDQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CH0PR10MB4969.namprd10.prod.outlook.com (2603:10b6:610:c8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 25 Feb
 2022 04:03:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 04:03:39 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENACAAI9eAIAAK1gAgAK56gCAA9cogIADECaAgACqxIA=
Date: Fri, 25 Feb 2022 04:03:39 +0000
Message-ID: <1399787E-BB5C-48A3-A848-44520EA52A1C@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
 <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
 <e5e88bcb-6573-709f-5c17-229cde3a0a5f@redhat.com>
In-Reply-To: <e5e88bcb-6573-709f-5c17-229cde3a0a5f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c49a4cc-30c1-48aa-b107-08d9f813cdfe
x-ms-traffictypediagnostic: CH0PR10MB4969:EE_
x-microsoft-antispam-prvs: <CH0PR10MB4969921E1F46FB0E2ECD47A5903E9@CH0PR10MB4969.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MBqKGnp+7WFML947xiXPwHcMHQ+vBkJxg6RZPmXwYefldOa0xphFD8heqLcGsozm+Hs0FKo0Gy89bwF2T8eGV9t0WYBeePGODFa/pEyI0LG3cyMCY3Sa1td7lbWOzzfcUZfHMHKeGLBE9u95c6gnmwzKcrhnwdeQQAYHRKhbKACZEKnf26/jUsYNevcfGYdbHH9Yqd8ri5cOShcyYUKOtj8xRzgIYNzXlg3ZJ1+ZOaN7o8RWG5xgeN06uu9JBCcdCuTUFF8dyDOLDukR18wA7vAgGQuQnpHgDfXsd2FAWTphKTYEnGYhjvajddqfivIaN28rWT9CufkxF/M9JCxx8V6nl2KGAky20hujILUbp5afnmPzqCe1wy9yPsbChyb2YGhedMrYywNOY88OXtc7HwP+uVHuXDCPMEY6tpiXttdvFx7gq/o/5XfGj6HeLlPArqnwCvSZiZO32gi2+DmLGn6aV38vFystp+Rw3o5SVVFAyMj13KVdlY3uHOf7DFJWqbAHNLm6PKIORN+EmYA+d7T24OgrKva1dCyiSWQiZ9Mzm1YzZXvDYJWtRxC66TSnv5ZDov1+RhgO7rD0zVuMpm/TyP6j1ajjph+p0i14hVp5QEjBWXv5JiIY25Hb//xFlW1k0JhyPHTrCkwQMcBeDQ5vW260PdvUE4NNHowYdP9m0unmhQKCW9nTU5NgAq/H7mFicKxGxFsfsty8oqI0Wm2Cpwra+L7QEsj9cZLGoreIIUbzcUGKHF1Z5rsg8K/vQKUC21A+Cqi2WAgqvh4eOFkY4vZFmi++WZ131EB/PoEWKT/y6/qqdk7ssRe14Y4k24/QkdKnyMZt8JRDAl5Y2SldF5NM0nHuj4qnsuz97rU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(186003)(8676002)(36756003)(4744005)(2906002)(44832011)(33656002)(91956017)(508600001)(71200400001)(6506007)(38070700005)(8936002)(7416002)(53546011)(6512007)(6486002)(966005)(54906003)(122000001)(6916009)(66476007)(66446008)(64756008)(66556008)(5660300002)(66946007)(2616005)(316002)(76116006)(38100700002)(86362001)(10126625002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHMrU3lRS08rMXNiNjJCZmQrOC94U0lhdlg3UUhWSDU4eC8xcDN2YnIxWXZT?=
 =?utf-8?B?ZU02T2FjVEJFbGcrek5TRitKWFFBOEozWGlJYWFjam1wOFVBTU1BWmNFN29i?=
 =?utf-8?B?UnJmREtsaDI2Z1JUaHhhbWhtU3VudjJRdzBuOE13SWVPN3VPZnhLbW9ZcFdk?=
 =?utf-8?B?VzFaSGRMTEp3QVVJMVZYMXU5Z0FLNmVvVU5Ib2J0VnU0YU9JVU1JL2xjYkFy?=
 =?utf-8?B?d2VIcUFlaGJjSndKUk1tNWZQQXo4UEpHeUZrZHgxWHRVLzMvZGdMUC9Ud2Fu?=
 =?utf-8?B?ekl1UDRVaENNT1ZPOEZCSVprQnRvMzdlRGRkU0lyY0pEekNjZVd2bU1xbUZS?=
 =?utf-8?B?RlRQWk1TTGtYc05oVmdxcXFuQlIrdEhKZFQ5dUp1Q2FINGwvWDVIaERhSjR0?=
 =?utf-8?B?a251UmdDc1ZqaFE2S0RCLzdJK1lMQmlMemJhMXhicTlsOWluaUhxT21WQmVv?=
 =?utf-8?B?T3J6a1BUalpsckVycXlYTUNtcWd5SU5Xa0p1KzZtS0N0WDkrTkthSVRYb2Z6?=
 =?utf-8?B?dndzUk43bUNnVm52eFFncGVjZ3JFS3V0eXJJeHhPTFRMZVY4dHU3VmpXT1Nj?=
 =?utf-8?B?aFpsaFJ4RHBkV0NxakdzRU9JNVB6TzVQTTEyVHY0b0grNm05ZTBzT243a2N3?=
 =?utf-8?B?bzhWamtxWkt3M0pLdjRNNThQenFIZzBoRjFnSmtiNzgyaThSTGZYTVNJMnQ4?=
 =?utf-8?B?U21FTnhlcGViWW5rV24rNkFoN1dENE93R1Z5K2ZZeGovbVd1QUlxeEQ1UlZ5?=
 =?utf-8?B?MVk4NjZOY1k0SDlJdjNWamxRVnlpc2tEZ2QwRHdpT0xuTDIrV1RicldDa21m?=
 =?utf-8?B?emdacWoxckZzWTlza1pyd0RBaFVEckQ0OE1OQ0tHRmRYV1VGeG5Bdk5UVkRY?=
 =?utf-8?B?YlQ1NWFCKzN1ZzJmZDhSYUdjSnltVms3Z2NyVndKZWdHRG1paUNNWVFjdElu?=
 =?utf-8?B?TlNuWUtEMGdLc0V1ZEhHdnordTkrSXE4NW5oL240ZzdmL1l3NFgvK3dRZzhi?=
 =?utf-8?B?bDJVcTYwa3hCWmorWU5qenhaV2JKdnBGN0pmWFBPTWFxV2dPUktPbUlIZDly?=
 =?utf-8?B?cUJncSs4cWN6ektSNXR2S0xic2lwbWNydy9DekZ5bDVxazNlaGRpWGZzYzRC?=
 =?utf-8?B?SlBZTStJWWpGQTV6U2ZRZFAzWFhzL21RREdkV1Vid0Vtd0Uyc2tqQzg4RHB0?=
 =?utf-8?B?RWhDRUR6OUNSTDdrMUNIRzdmd2c5YzZiUmZaaEpwR1BlLzNPTmdiYTNaam9n?=
 =?utf-8?B?SFltMUhBTWdqeWVmRGhFQnNLLzVPM2E5aVdtK1NqWlJKOUU3aGYwNDA4ZWYr?=
 =?utf-8?B?K0NYcGZ0dzROYmkvREZYcmZWQisyZ202MU16NlhvZXBUdFpLWGd4WU5GREJK?=
 =?utf-8?B?dW5Dd3VneGtBanlHTFRDL3dTMUQrek1TUmEyVDhGMVBYMk9OQUllRGlPQmRy?=
 =?utf-8?B?eFJXZnZ1TU1ka3E3MmY1eWtXN3hrRlZaeWZxZXVOZjgzdWJUUFVTR3NkdTdD?=
 =?utf-8?B?UEtlUGdvS3NlSUZNUnFZRDIxdDZvbjVwcXJWWFVCNWFDeEg5TW1MOHl3Mldh?=
 =?utf-8?B?RnlqU1hDOFo3OEp5RU9UUS93L0Z4VjhRT2Y0YVVOUVYrY3dHUFhWWGVMV01K?=
 =?utf-8?B?RlJuaGc1WnVNSFhmUTBBZzdkbEFPQldxMWo1QkVvd3oyVW5kS2RjUVRERHRZ?=
 =?utf-8?B?TnRCcWRmbHRuRlRkNmhzT1h5ZlVwcnJFelowQmlvT0UyaWNuRGZ6eWdIdXAw?=
 =?utf-8?B?TnBuN3VMS2w3c3lUZEMrOVNXWUdRRHo1M1VVL1R3eXV4KzN0QU1meFZnTjlZ?=
 =?utf-8?B?akJpcDhyRFBacHN1RVI1cE5JaWFLRmVjeHk3VDFCVE9DbzRTci9yVGlhWThR?=
 =?utf-8?B?RU5UMDhNZ2FzOUtIcVQrTCswTHpDdkNEMWg5SWZ0bXpYTTJGK01namU3cjlP?=
 =?utf-8?B?cVc0ZXhiRk84NEpSM1ovUWw1YkIrSU9HSmZGS3VhTXlZTGhnVzAxZzZzNzhB?=
 =?utf-8?B?cm5FY1pFSlVXenE1dENZMXdOdHlKdjEveExtbGNBOGdjdWhsSHY2aVo1ZTlR?=
 =?utf-8?B?NFltRUtkR1hESEQyUVB3ZUFrQzhlakc1RFM1WHJBSEcwb0EzL0cwVjhtWmw3?=
 =?utf-8?B?Tk9talJPMjYzOER0YkYwaW1jbUFFREZ4TlFrUmFLdEpZSGFteE1FaWJBQUJD?=
 =?utf-8?B?M05lTnk4bnRBVjBuTTR1anlyWGpTM0E3Z3VPb2pmdEFGamFUNkgrZ085TFd6?=
 =?utf-8?B?MFpqMXBMVy9tdFlwN3FKZnRnWTRBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <890314A792199E49A26759E7F79F4AB2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c49a4cc-30c1-48aa-b107-08d9f813cdfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 04:03:39.2786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDkwUZaM9xGkxQaYZbUkEK0GqpDX8VA1Rl1vrkQ0oEWUYfdSKm8CKvBDbpu3C/ffpC2LIMOLHwryTHT4/HVgKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4969
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250019
X-Proofpoint-GUID: NEZ4rLo32gs3tGBNRGYfqIwqugRpHihx
X-Proofpoint-ORIG-GUID: NEZ4rLo32gs3tGBNRGYfqIwqugRpHihx
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDI0LCAyMDIyLCBhdCAxMjo1MiBQTSwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyLzIyLzIyIDIwOjA1LCBKYWcgUmFtYW4g
d3JvdGU6DQo+Pj4gLSAgICAgICAgICAgIGRlZmF1bHRzW3ByZWZpeCArICdDT01QSUxFUiddID0g
ZXhlX2xpc3QNCj4+PiArICAgICAgICAgICAgZGVmYXVsdHNbZid7cHJlZml4fUNPTVBJTEVSJ10g
PSBbZXhlX2xpc3RbMF1dDQo+Pj4gKyAgICAgICAgICAgIGZvciBpIGluIHJhbmdlKDEsIGxlbihl
eGVfbGlzdCkpOg0KPj4+ICsgICAgICAgICAgICAgICAgZGVmYXVsdHNbZid7cHJlZml4fUNPTVBJ
TEVSX0FSR3tpfSddID0gW2V4ZV9saXN0W2ldXQ0KPj4+ICsNCj4+PiAgICAgICAgICAgICBpZiBj
b21wX29iai5nZXRfaWQoKSA9PSAnY2xhbmctY2wnOg0KPj4+ICAgICAgICAgICAgICAgICBkZWZh
dWx0c1snQ01BS0VfTElOS0VSJ10gPSBjb21wX29iai5nZXRfbGlua2VyX2V4ZWxpc3QoKQ0KPj4g
VGhpcyBmaXggd29ya3MgYXQgbXkgZW5kLg0KPiANCj4gV291bGQgeW91IHBsZWFzZSBjaGVjayB0
aGF0IC1tNjQgYW5kIC1tY3gxNiBhcmUgcGFzc2VkIGluZGVlZCB0byB0aGUgY29tcGlsZXI/DQoN
CkhpIFBhb2xvLA0KDQpZZXMsIEnigJltIGFibGUgdG8gc2VlIHRoYXQgLW02NCBhbmQgLW1jeDE2
IGFyZSBwYXNzZWQgdG8gdGhlIGNvbXBpbGVyLg0KDQojIGNhdCAuL3N1YnByb2plY3RzL2xpYnZm
aW8tdXNlci9fX0NNYWtlX2J1aWxkL0NNYWtlTWVzb25Ub29sY2hhaW5GaWxlLmNtYWtlDQrigKYN
CnNldChDTUFLRV9DX0NPTVBJTEVSICIvb3B0L3JoL2RldnRvb2xzZXQtOS9yb290L3Vzci9iaW4v
Y2MiKQ0Kc2V0KENNQUtFX0NfQ09NUElMRVJfQVJHMSAiLW02NCIpDQpzZXQoQ01BS0VfQ19DT01Q
SUxFUl9BUkcyICItbWN4MTYiKQ0K4oCmDQoNCkZ1bGwgbG9nIGhlcmU6IGh0dHBzOi8vcGFzdGVi
aW4uY29tL1BFd05TV01uDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gUGFvbG8NCg0K

