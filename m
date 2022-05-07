Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F151E946
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 20:51:13 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPWK-0000QJ-EV
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 14:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nnPTr-00078I-Ho
 for qemu-devel@nongnu.org; Sat, 07 May 2022 14:48:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nnPTo-0007SS-Lm
 for qemu-devel@nongnu.org; Sat, 07 May 2022 14:48:39 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 247EA9j5019308;
 Sat, 7 May 2022 18:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=nbLpSxvDLUbQJyxAmbzkLLp06m/dfdaIb+TNFJVbuq4=;
 b=IhT5eHcvw28APWT1j0Y7prxEpwonIeKNQrZOCn5oJOWMd79DNy4fwjs6A/Eio4+42AVa
 XlUNwruqZsxfY5tAA9bwjmVuc0nD1TI626fw2feSl841coWtfehuZDpSfWFlev9N34ab
 AsWLuCh6sAbmFQ4XneboChAIHML1jBL1R1s/+Oa86g/KIvUVTwVPUCzjmq/lq7AAYpng
 tsb+aL4ttPiVbjrj9b1Ni1tCW/kScE1fDySDs/CsFFHtrVZjlnpX1t4lgnXzt4WkqPwA
 +fe3ghqUHRtKXKvBWotfuvtZYWTl6GhDrBtf0fCLq27Tw7tZl34mDiZ3WUQoinHalr1a jw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgn9gp7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 18:48:22 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 247IjiXH010106; Sat, 7 May 2022 18:48:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf76w7vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 18:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hM5nCUtH6A1hvdMPItE3T/YIAG23alX26Q9azN8WGLF97+rMWOsfPo7yQHYCUpPt8vsekLD95kg9Zzr7WY5kIJbZ1fyMJkc/I0pzotgnrrLgtyMKqoUdjBWUFy1TVoKSCMGoe8AWGRSQJq4Mxx13s3cJVEOyjbJYj9eByR7DxML27zawtqUI8ysQ4gH0opzTjCT11iCb9tUrzHeRrk0B/86VxYvPeWMTwHmLarcnYZhZ/eoV8CfamQiK9ttlx54FFFNxLGbjlWtbAmLUuR2cDLoOHnxIy6KKfXj4bBU0t1b0GLBAhyBsqvEz43NTSeeeBuRdtzNqww4J5EyjLOLjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbLpSxvDLUbQJyxAmbzkLLp06m/dfdaIb+TNFJVbuq4=;
 b=X6Fcac4DjCL840bA+bFejTDxflgaJ71QyFLvXOQR6YiWp4+1KQd9Xnpk6oyCREwyK4BPv3Yo2BE4FtjU6JB0KAUeltpp9+tOqt0o0RPTZGku9UCpFS/NVIGwZS5iuG98XJnq+gkMI7TpDdKh8k8SfouqSEvZ2XyTtvAQL6LxcuhpOb8SNukmeETF5oXdpN/+d1Td4p3fMgZ5ylpGIgniNnb915lwKC1W8PptuIoMoRG3+iDe6pHSs3QIwJbQsdAGuqSBourUDxXmahSNpEOsTbtD5VqNnYR10xhtPi2aKo36dCi1//uIXU7suYoD6ITzpPS19y4vzL1VwsiwJd1WbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbLpSxvDLUbQJyxAmbzkLLp06m/dfdaIb+TNFJVbuq4=;
 b=a6fz4gIK+92x2Tp49OPDD/+uqRLukqjog/HzINBvVK5mJGEtSKJ6UFWq308ORAukHj4iASYny9xsQnmO5NG9yOCYfxhHfdnQoU8JCGWYqi3j5Wxre+Y3/yTrrBVMr+7sJFhkuX3fD5jDeHf7UcIYGjpsDBXKdg2c4mY/aubh3+0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SJ0PR10MB5766.namprd10.prod.outlook.com (2603:10b6:a03:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 7 May
 2022 18:48:18 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 18:48:17 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
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
Subject: Re: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Topic: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Index: AQHYXviFJ6gKC1s68E+zRCuFWJP0wa0OmjM5gAA9ZQCAARKwwYAAYuaAgAARtrmAAA8OgIAA7PKlgAJsK4A=
Date: Sat, 7 May 2022 18:48:17 +0000
Message-ID: <0CFA5C49-920B-41F2-8DE3-00A8CA6252D4@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 <877d717cd2.fsf@pond.sub.org>
 <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com>
 <87k0b0zamn.fsf@pond.sub.org>
 <A0DB61EE-A8D2-4EBB-82E7-BC5F205C7051@oracle.com>
 <87y1zgqbvq.fsf@pond.sub.org>
 <8BE16BED-9157-42F6-8AD5-4E76B9B14FE7@oracle.com>
 <87h763nrkc.fsf@pond.sub.org>
In-Reply-To: <87h763nrkc.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 551b5c82-1838-46b5-251e-08da305a263a
x-ms-traffictypediagnostic: SJ0PR10MB5766:EE_
x-microsoft-antispam-prvs: <SJ0PR10MB57661F0736E89B0CFE6D66E890C49@SJ0PR10MB5766.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A8XmrV7QRtypZblp4HRGHhR96/KMG58ikZ36p7yKcXkyhmQf0rorQEsbH+tUoAeu9oE8gANpgXkF19xHC5l8J5BHovnUu8k2ggGt/col6M2cyBxwPy0ZYFl94Av1rJubyZnutEtPFNooin/uzMAStK+YQVD5fjesF0Jcc1ao47H+hfovvOb0bbi7abywPQWMg25SpRv5nbbF+19qVj4dajGL+a8xCdu7Zxle0hFCAMxlc529cBStd+YAgl7/o6XPkf1VurD5dsH+50DHJlFI7C4MnJcOUOgwZ9DJO+g9E7aD8IwB7Kh+EHHlB+bQLl7MJ1pXNX/Kql038hrDyAZr1I+q6ULlOWWJ+hCi7TJQ1CDVoHlckhRyI8vbvDsVc3VKxTGu2L/vkyzdh34SBKzJCmPXKmWhXDiQO6m1X8DfeubJ1zA+DKAUx3Q3azTVBebXuArPFBVHf3kmYpWaMAjB0eFj+07r2wEWSnOkNQGOb5wFyD72kc0DsYvoqSN+hN1Ml5N55lK5Zusk4hYemFmTCMmWe0k20FARmmvrrXbWiwkVyDI5wDALmKNuEW+YD6ZYQ/Ti7zbUz7syLqc5sXCH+kxx3V77eGFmW9MvI8dE7sN8XQetThlO04zKYiuDD5nhrDVvbCpMHofviRLNJ3ZfQJszYtyMKmqYx0Z8tQRyS5COwSSR3iUwOT8DgMqLXjYe1+hNTo3Airy6ms3KluC5QhXn4q9SdoH9FBIQtVvuYk0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(36756003)(5660300002)(186003)(107886003)(33656002)(44832011)(66556008)(2906002)(66946007)(7416002)(64756008)(66476007)(83380400001)(8936002)(71200400001)(66446008)(6486002)(508600001)(38070700005)(38100700002)(54906003)(316002)(6916009)(76116006)(86362001)(6512007)(53546011)(91956017)(6506007)(8676002)(4326008)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhkQ2xPTzE1OXk5cVFaNUsrMmhXOGhEZjZCNGhlVEMzaTE0eGt3NEZUTnMr?=
 =?utf-8?B?ZEFNZFlYRFBEeEhONjlheW1ZNkVROUpOeWw5SGdNSzdMREoxbEdXUzdhNUFI?=
 =?utf-8?B?c20zUEZieDhBYjVjZWMrWU9xT3lOTm5yUFJGSWt5WEh2dmpmYVZ1aE5vS2c4?=
 =?utf-8?B?ODlzK3lORyt1SlcyVHlzeGlDN2Q4Tm1STFFWVWY4TWgzcE9WaHFNa0xrdU9z?=
 =?utf-8?B?MHdJQkZNV3YvT25yTFU1cjhwaUE0eVhNR01ZeTFWTldJMmdTdFhiM2Rpa3ZN?=
 =?utf-8?B?Vk1icG9vaFVHV2dadnNDMkNaSE1nNEFqVDJBcXZyN0xtS3RTYjZKNEQ2WERY?=
 =?utf-8?B?MUcxSktvL3g5ZWZidWJ2SDVZL3dUNlZ2dEUxdDVkTEVrWmtHK2s1RUVNdEFS?=
 =?utf-8?B?Qlk2QjBRWWFtVHRvdmg3UVpFNGVKZFB2WEV6VnJCeWRSdDdWa0JQNEVwVVJD?=
 =?utf-8?B?YW10ckEySXQ1Tyt5aXBMcFZBdFhhWlZqR2RvblRVVDBMWi9rdWlianNWZ3JH?=
 =?utf-8?B?Sll1MXU3VzU2cDkrelFwaVgzTDFBbklCNFJFUitjV3dlNEJzcnJqU2FQdkZt?=
 =?utf-8?B?NlVHMDJZSzNvc1dhbXdKUDZNbzFvZWpkWG1JZWp5WERHUm9sUTVRTjZZMitM?=
 =?utf-8?B?bmxUSm0xaTAyeXF3RjFhN1g2eWd4MUU4enRla2ZsQjUydi9vVE5VaUJVeVBw?=
 =?utf-8?B?WTRDT2J3RmYwWXVmRHFWb0FuVEZiN0ZFWHlKWWtjWnJFcWpqV0pZNkQzSDZt?=
 =?utf-8?B?dGcrZ2xUV3p4Vkx3LzNaUThtNFNmcG9kblZHZEpuSE9SQmUrUUNrcmVJU2R4?=
 =?utf-8?B?TzZ4UmpNdjV1Qmh6c2thUFRnN0cxRXg0U0d1U0FTTVNteEs4QUZKSXZyUkRj?=
 =?utf-8?B?amk5Tm5aYyszQ2dyMFZXa2FobGtJSWtwU1dJTExBaytGSGplWG9sK2dHZUY4?=
 =?utf-8?B?UUFwOEF3RkNaVXdLMzE2TDJoRFo5c3RmNFJZQUcycis3RmJhVDRzR0xZTVQ4?=
 =?utf-8?B?cW1iWFo0OXdVUllUSlliMnFYV2lQNktpWWNtNVB5aE41eldPNDk4MEU1aEJB?=
 =?utf-8?B?RzFGVVZhZmlYVmRSTzJxMkJFcS9LRVFRb3JCQ2sxbWt0TmZIaCthSVRvRW1Z?=
 =?utf-8?B?Y0JlYnlIVjFrQWg2aHJ3L1A3UlBxeUtmdW1yNW9KTS82NTBCaUtNMkJEOEVC?=
 =?utf-8?B?dDNxdmp5OVY4Q2hWL3U2NnhRdDJnaWU4MU9sRzJjWnRoWktmY0dDbk1ZOFFU?=
 =?utf-8?B?bFpLWnhRY2U3dm1GUWtodUlSYS9waXJqdXNXbzZOMkZBK2xsRGU2S0Z4eUVh?=
 =?utf-8?B?cGtkdzQyZE5jZWNEWkR3SkhWSW9wV28xSVBERDhTRkVxbUFGTTN5QVA0NS9v?=
 =?utf-8?B?WTV0dFhZazluL1lhNHNGTFpHemFpak0rcy9ieklXQ0w1SkduMENsNkQ4S2cx?=
 =?utf-8?B?c0RyY0RZS1Zqa09YSE9XOUhWWDJGZ0lTNW52TzgxbEY5QjN2bkNtd05rN1FJ?=
 =?utf-8?B?UmdOaUJBQTRONXRZWDZKSFg4aDB2K1JTd1pYYUpzeDlMd2dEdUc0NjVWRTJP?=
 =?utf-8?B?bDUwZ1gyeHZsWlI5YWY2VjNTdkw4dGZnWnliMkJMSXQyNFZGbUN3Y1M2WC9l?=
 =?utf-8?B?cFFGWkk3bFRaUCt4MnhUbzZSRzZ2QWE2ZlFNOE9CUTBZeHMvN1doREhvZXM2?=
 =?utf-8?B?Q09JTC9SaSsyRkx1UXNvK0hYcVRRbzFjWGJJZTBiMUhsWmYwNkI5T1JDSEpl?=
 =?utf-8?B?Z0VXLzFQclNRUS90NjgrbkpVbGt6N1BYRjBNVnBuK04xVUdrbHlyK1dac1Nl?=
 =?utf-8?B?RnFINkNlUzZQSmlsdkFJdUxMUGd2ZEovcXpNcnQ2N2RhZm5GcWJoV0tBTHp4?=
 =?utf-8?B?NTVvekFkU01heGZuUnlOaWU1cWRtaW51MTU3bHdhMktvVUpnclNpaVNRZ1V5?=
 =?utf-8?B?a2l3MFZTTWppamRjc2NHeDlocmVVbTJMSEhaYVRTSjFUdUxuUkg3YmIyQ3o3?=
 =?utf-8?B?cUVjRmRBdVNqWjZ3MzFLbzVxZTZIUFY2c09BZTcxNFRYazI5VWVvRHB2M0VM?=
 =?utf-8?B?cHEweFEzMTZxUUlQTi9KL3VqS2tHbVAwd2x6b0IxdFVQUEZFL1duZ1R2NEsr?=
 =?utf-8?B?QkZyTjI0SThjKzNENEpJc250N3hNNFhpa29ncWticU9JU3NkMUlpSmtJa2FF?=
 =?utf-8?B?akYyRU5aZC9PY1Rzc0tPQ3hFcFFGT0VMT0NhdldreVkwa0c3cUVjS1M3cmdQ?=
 =?utf-8?B?QklFK3JJS2pCT0Y5VWM1R3ErbThjd3k2Z29kUFB1NVpEN0Z3czRWanNtUHM4?=
 =?utf-8?B?a0tBU3dUYko2L1pQTW5uNlpyak9BdE5veUpUWEh6U09COUVreGJjYUh4Q3o0?=
 =?utf-8?Q?YIAZ6WdGkmWHUtKK4DRyqxwCd8BBAzhlAW6Ge?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BBE8AEF75FA224D8A689D95E10DFBA0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551b5c82-1838-46b5-251e-08da305a263a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 18:48:17.2256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oth6X0BbsBYISbuFRuIeGmyhnG1vFAY/YmnlTOkarqVekgwWxFXuM/22URpFlqCN2/W9ACr4mfnv3ccdQI/kng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5766
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-07_06:2022-05-05,
 2022-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070128
X-Proofpoint-GUID: 2aM6blLLGXo8XGHlXMdsEl_T363y2tZ_
X-Proofpoint-ORIG-GUID: 2aM6blLLGXo8XGHlXMdsEl_T363y2tZ_
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

DQoNCj4gT24gTWF5IDYsIDIwMjIsIGF0IDE6NDQgQU0sIE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBKYWcgUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPiB3cml0ZXM6DQo+IA0KPj4+IE9uIE1heSA1LCAyMDIyLCBhdCAxMDo0MiBBTSwgTWFya3Vz
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBKYWcgUmFt
YW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cml0ZXM6DQo+Pj4gDQo+Pj4+PiBPbiBNYXkgNSwg
MjAyMiwgYXQgMzo0NCBBTSwgTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPiB3
cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3Jp
dGVzOg0KPj4+Pj4gDQo+Pj4+Pj4+IE9uIE1heSA0LCAyMDIyLCBhdCA3OjQyIEFNLCBNYXJrdXMg
QXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4g
SmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cml0ZXM6DQo+Pj4+Pj4+
IA0KPj4+Pj4+Pj4gU2V0dXAgYSBoYW5kbGVyIHRvIHJ1biB2ZmlvLXVzZXIgY29udGV4dC4gVGhl
IGNvbnRleHQgaXMgZHJpdmVuIGJ5DQo+Pj4+Pj4+PiBtZXNzYWdlcyB0byB0aGUgZmlsZSBkZXNj
cmlwdG9yIGFzc29jaWF0ZWQgd2l0aCBpdCAtIGdldCB0aGUgZmQgZm9yDQo+Pj4+Pj4+PiB0aGUg
Y29udGV4dCBhbmQgaG9vayB1cCB0aGUgaGFuZGxlciB3aXRoIGl0DQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNs
ZS5jb20+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpv
aG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJh
bWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBTdGVmYW4g
SGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+Pj4gDQo+Pj4gWy4uLl0NCj4+PiANCj4+
Pj4+Pj4+IEBAIC0xNjQsNiArMTcyLDc2IEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3Rfc2V0X2Rl
dmljZShPYmplY3QgKm9iaiwgY29uc3QgY2hhciAqc3RyLCBFcnJvciAqKmVycnApDQo+Pj4+Pj4+
PiB2ZnVfb2JqZWN0X2luaXRfY3R4KG8sIGVycnApOw0KPj4+Pj4+Pj4gfQ0KPj4+Pj4+Pj4gDQo+
Pj4+Pj4+PiArc3RhdGljIHZvaWQgdmZ1X29iamVjdF9jdHhfcnVuKHZvaWQgKm9wYXF1ZSkNCj4+
Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArIFZmdU9iamVjdCAqbyA9IG9wYXF1ZTsNCj4+Pj4+Pj4+ICsg
Y29uc3QgY2hhciAqdmZ1X2lkOw0KPj4+Pj4+Pj4gKyBjaGFyICp2ZnVfcGF0aCwgKnBjaV9kZXZf
cGF0aDsNCj4+Pj4+Pj4+ICsgaW50IHJldCA9IC0xOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyB3
aGlsZSAocmV0ICE9IDApIHsNCj4+Pj4+Pj4+ICsgcmV0ID0gdmZ1X3J1bl9jdHgoby0+dmZ1X2N0
eCk7DQo+Pj4+Pj4+PiArIGlmIChyZXQgPCAwKSB7DQo+Pj4+Pj4+PiArIGlmIChlcnJubyA9PSBF
SU5UUikgew0KPj4+Pj4+Pj4gKyBjb250aW51ZTsNCj4+Pj4+Pj4+ICsgfSBlbHNlIGlmIChlcnJu
byA9PSBFTk9UQ09OTikgew0KPj4+Pj4+Pj4gKyB2ZnVfaWQgPSBvYmplY3RfZ2V0X2Nhbm9uaWNh
bF9wYXRoX2NvbXBvbmVudChPQkpFQ1QobykpOw0KPj4+Pj4+Pj4gKyB2ZnVfcGF0aCA9IG9iamVj
dF9nZXRfY2Fub25pY2FsX3BhdGgoT0JKRUNUKG8pKTsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEhtbS4g
QHZmdV9pZCBpcyBhbHdheXMgdGhlIGxhc3QgY29tcG9uZW50IG9mIEB2ZnVfcGF0aC4gV2h5IGRv
IHdlIG5lZWQNCj4+Pj4+Pj4gdG8gc2VuZCBib3RoPw0KPj4+Pj4+IA0KPj4+Pj4+IHZmdV9pZCBp
cyB0aGUgSUQgdGhhdCB0aGUgdXNlci9PcmNoZXN0cmF0b3IgcGFzc2VkIGFzIGEgY29tbWFuZC1s
aW5lIG9wdGlvbg0KPj4+Pj4+IGR1cmluZyBhZGRpdGlvbi9jcmVhdGlvbi4gU28gaXQgbWFkZSBz
ZW5zZSB0byByZXBvcnQgYmFjayB3aXRoIHRoZSBzYW1lIElEDQo+Pj4+Pj4gdGhhdCB0aGV5IHVz
ZWQuIEJ1dCBJ4oCZbSBPSyB3aXRoIGRyb3BwaW5nIHRoaXMgaWYgdGhhdOKAmXMgd2hhdCB5b3Ug
cHJlZmVyLg0KPj4+Pj4gDQo+Pj4+PiBNYXR0ZXIgb2YgdGFzdGUsIEkgZ3Vlc3MuICBJJ2QgZHJv
cCBpdCBzaW1wbHkgdG8gc2F2ZXMgdXMgdGhlIHRyb3VibGUgb2YNCj4+Pj4+IGRvY3VtZW50aW5n
IGl0Lg0KPj4+Pj4gDQo+Pj4+PiBJZiB3ZSBkZWNpZGUgdG8ga2VlcCBpdCwgdGhlbiBJIHRoaW5r
IHdlIHNob3VsZCBkb2N1bWVudCBpdCdzIGFsd2F5cyB0aGUNCj4+Pj4+IGxhc3QgY29tcG9uZW50
IG9mIEB2ZnVfcGF0aC4NCj4+Pj4+IA0KPj4+Pj4+Pj4gKyBnX2Fzc2VydChvLT5wY2lfZGV2KTsN
Cj4+Pj4+Pj4+ICsgcGNpX2Rldl9wYXRoID0gb2JqZWN0X2dldF9jYW5vbmljYWxfcGF0aChPQkpF
Q1Qoby0+cGNpX2RldikpOw0KPj4+Pj4+Pj4gKyBxYXBpX2V2ZW50X3NlbmRfdmZ1X2NsaWVudF9o
YW5ndXAodmZ1X2lkLCB2ZnVfcGF0aCwNCj4+Pj4+Pj4+ICsgby0+ZGV2aWNlLCBwY2lfZGV2X3Bh
dGgpOw0KPj4+Pj4+PiANCj4+Pj4+Pj4gV2hlcmUgaXMgby0+ZGV2aWNlIHNldD8gSSdtIGFza2lu
ZyBiZWNhdXNlIEkgaXQgbXVzdCBub3QgYmUgbnVsbCBoZXJlLA0KPj4+Pj4+PiBhbmQgdGhhdCdz
IG5vdCBsb2NhbGx5IG9idmlvdXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gWWVhaCwgaXTigJlzIG5vdCBv
YnZpb3VzIGZyb20gdGhpcyBwYXRjaCB0aGF0IG8tPmRldmljZSBpcyBndWFyYW50ZWVkIHRvIGJl
DQo+Pj4+Pj4gbm9uLU5VTEwuIEl04oCZcyBzZXQgYnkgdmZ1X29iamVjdF9zZXRfZGV2aWNlKCku
IFBsZWFzZSBzZWUgdGhlIGZvbGxvd2luZw0KPj4+Pj4+IHBhdGNoZXMgaW4gdGhlIHNlcmllczoN
Cj4+Pj4+PiB2ZmlvLXVzZXI6IGRlZmluZSB2ZmlvLXVzZXItc2VydmVyIG9iamVjdA0KPj4+Pj4+
IHZmaW8tdXNlcjogaW5zdGFudGlhdGUgdmZpby11c2VyIGNvbnRleHQNCj4+Pj4+IA0KPj4+Pj4g
dmZ1X29iamVjdF9zZXRfZGV2aWNlKCkgaXMgYSBRT00gcHJvcGVydHkgc2V0dGVyLiAgSXQgZ2V0
cyBjYWxsZWQgaWYgYW5kDQo+Pj4+PiBvbmx5IGlmIHRoZSBwcm9wZXJ0eSBpcyBzZXQuICBJZiBp
dCdzIG5ldmVyIHNldCwgLT5kZXZpY2UgcmVtYWlucyBudWxsLg0KPj4+Pj4gV2hhdCBlbnN1cmVz
IGl0J3MgYWx3YXlzIHNldD8NCj4+Pj4gDQo+Pj4+IFRoYXTigJlzIGEgZ29vZCBxdWVzdGlvbiAt
IGl04oCZcyBub3Qgb2J2aW91cyBmcm9tIHRoaXMgcGF0Y2guDQo+Pj4+IA0KPj4+PiBUaGUgY29k
ZSB3b3VsZCBub3QgcmVhY2ggaGVyZSBpZiBvLT5kZXZpY2UgaXMgbm90IHNldC4gSWYgby0+ZGV2
aWNlIGlzIE5VTEwsDQo+Pj4+IHZmdV9vYmplY3RfaW5pdF9jdHgoKSB3b3VsZCBiYWlsIG91dCBl
YXJseSB3aXRob3V0IHNldHRpbmcgdXANCj4+Pj4gdmZ1X29iamVjdF9hdHRhY2hfY3R4KCkgYW5k
IHZmdV9vYmplY3RfY3R4X3J1bigpICh0aGlzIGZ1bmN0aW9uKQ0KPj4+PiBoYW5kbGVycy4NCj4+
PiANCj4+PiBZZXM6DQo+Pj4gDQo+Pj4gICBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2luaXRfY3R4
KFZmdU9iamVjdCAqbywgRXJyb3IgKiplcnJwKQ0KPj4+ICAgew0KPj4+ICAgICAgIEVSUlBfR1VB
UkQoKTsNCj4+PiAgICAgICBEZXZpY2VTdGF0ZSAqZGV2ID0gTlVMTDsNCj4+PiAgICAgICB2ZnVf
cGNpX3R5cGVfdCBwY2lfdHlwZSA9IFZGVV9QQ0lfVFlQRV9DT05WRU5USU9OQUw7DQo+Pj4gICAg
ICAgaW50IHJldDsNCj4+PiANCj4+PiAgICAgICBpZiAoby0+dmZ1X2N0eCB8fCAhby0+c29ja2V0
IHx8ICFvLT5kZXZpY2UgfHwNCj4+PiAgICAgICAgICAgICAgICFwaGFzZV9jaGVjayhQSEFTRV9N
QUNISU5FX1JFQURZKSkgew0KPj4+ICAgICAgICAgICByZXR1cm47DQo+Pj4gICAgICAgfQ0KPj4+
IA0KPj4+IEJhaWxzIG91dCB3aXRob3V0IHNldHRpbmcgYW4gZXJyb3IuICBTdXJlIHRoYXQncyBh
cHByb3ByaWF0ZT8NCj4+IA0KPj4gSXTigJlzIG5vdCBhbiBlcnJvciBwZXIgc2UgLSB2ZnVfb2Jq
ZWN0X2luaXRfY3R4KCkgZG9lc27igJl0IHByb2NlZWQNCj4+IGZ1cnRoZXIgaWYgZGV2aWNlL3Nv
Y2tldCBpcyBub3Qgc2V0IG9yIGlmIHRoZSBtYWNoaW5lIGlzIG5vdCByZWFkeS4NCj4+IA0KPj4g
Qm90aCBzb2NrZXQgYW5kIGRldmljZSBhcmUgcmVxdWlyZWQgcHJvcGVydGllcywgc28gdGhleSB3
b3VsZA0KPj4gZXZlbnR1YWxseSBiZSBzZXQgYnkgdmZ1X29iamVjdF9zZXRfc29ja2V0KCkgLw0K
Pj4gdmZ1X29iamVjdF9zZXRfZGV2aWNlKCkgLSBhbmQgdGhlc2Ugc2V0dGVycyBldmVudHVhbGx5
IGtpY2sNCj4+IHZmdV9vYmplY3RfaW5pdF9jdHgoKS4NCj4gDQo+IEVhcmx5IHJldHVybnMgZnJv
bSBhIGZ1bmN0aW9uIHRoYXQgc2V0cyBlcnJvciBvbiBmYWlsdXJlIHRyaWdnZXJzIGJ1Zw0KPiBz
cGlkZXIgc2Vuc2UsIGJlY2F1c2UgZm9yZ2V0dGluZyB0byBzZXQgYW4gZXJyb3Igb24gZmFpbHVy
ZSBpcyBhIGZhaXJseQ0KPiBjb21tb24gbWlzdGFrZS4NCj4gDQo+IFRoZSByb290IG9mIHRoZSBw
cm9ibGVtIGlzIG9mIGNvdXJzZSB0aGF0IHRoZSBmdW5jdGlvbidzIGNvbnRyYWN0IGlzIG5vdA0K
PiBvYnZpb3VzLiAgVGhlIG5hbWUgdmZ1X29iamVjdF9pbml0X2N0eCgpIHN1Z2dlc3RzIGl0IGlu
aXRpYWxpemVzDQo+IHNvbWV0aGluZy4gIEJ1dCBpdCBjbGVhcmx5IGRvZXNuJ3QgdW5sZXNzIGNl
cnRhaW4gY29uZGl0aW9ucyBhcmUgbWV0Lg0KPiBUaGUgcmVhZGVyIGlzIGxlZnQgdG8gd29uZGVy
IHdoZXRoZXIgdGhhdCdzIGEgYnVnLCBvciB3aGV0aGVyIHRoYXQncw0KPiB3aGF0IGl0IGlzIHN1
cHBvc2VkIHRvIGRvLg0KPiANCj4gQSBmdW5jdGlvbiBjb250cmFjdCBzcGVsbGluZyBvdXQgd2hl
biB0aGUgZnVuY3Rpb24gaXMgc3VwcG9zZWQgdG8gZG8NCj4gd2hhdCAoaW5jbHVkaW5nICJub3Ro
aW5nIikgd291bGQgaGVscC4NCg0KU3VyZSwgd2lsbCBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcg
d2hhdCB0aGlzIGZ1bmN0aW9uIGlzDQpzdXBwb3NlZCB0byBkby4NCg0KLS0NCkphZw0KDQo+IA0K
PiBbLi4uXQ0KPiANCg0K

