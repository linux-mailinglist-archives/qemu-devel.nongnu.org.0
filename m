Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CB53CA00
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 14:29:07 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx6QL-00033e-PM
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 08:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nx6IW-0006cg-Gc
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:21:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nx6IL-0005RL-Av
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:20:53 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 253CIMng019751;
 Fri, 3 Jun 2022 12:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mnd/QzaVSeO4mKX2dWbJTO/SSUIBV91r1ycSOm18bIw=;
 b=hRaKRbpRjqWZODBQFMJopveSMGtz6Ad7st6cXz4xC6N1IKxFWRNYdz4XdcuL5ZrJ0J/N
 0EZwWw/VRg+H81BssGux6jPYVdB7TBSl5nIPVBkEodPNRJYrtd++sx21xkuHQ+7adYtv
 n55g5NzTRJjYJxlZd/g7b7sdsZV81+GQRQjWd8p4vvNfbQnAgCKw3SNC8fXeXDZHKWSZ
 gw1DoBt6oGL2XRf3C807bB2oG4XH8DCh5afMFjm7XwGKq0f8KcVpjjQZaABszl26RkLR
 MppGRP3CGPMfw8DcTjiL1g3AQAvIFisSn5boO7m55xPVKMSncV7Iv73KjVh3EDoVFt24 yQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbc6xctj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 12:20:18 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 253CAt9U001595; Fri, 3 Jun 2022 12:20:17 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gc8knknrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 12:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCIe18RTTSgbY5NtZJkZbzU6M0oCuqWdoDOOLiy7dOj74ZyrM2wAi70mttNqmy+7QSYtvebFJsmQYFrBeiKwXNID43RyQGq/+OrGWBv9+KVzn3mInlv0d5J20hjN135OVGEP8WDtaA1NxP3BPIL0t3XS5FhfMLagwQcXXmtu27/3TzlUYI8aoKWIArLHWjF9/HpK40nd86mgH2X9D5YHwghHa2VQOO/5ndzjGqAE92yvEp36rHVfGusJ47YwB/JqOO4VoFxPrmc0u2g+LxgzhPMtV2TBw3f/1m03wSTA43hVLdb8ktDes0lXV2LnG2VHZtS74st5ZjTRY32EBSsZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnd/QzaVSeO4mKX2dWbJTO/SSUIBV91r1ycSOm18bIw=;
 b=mpp2udQR9SCwNT54t0uxyUmOR1xBU2SV++2n2fFMHHg5xsYwylgjfBLLXFxFMKxtZ6fvubwtcX0eYJv3jm8nxojRHt1FA/8AZQYQovZe1F0RQzqqTcxtF9SW1nsA3UUCWSV95vpSH1jndg94dBRsUNOc4A5EyN11ylghzfuES5rjvHU7IePOnkAwoLM/SwOZ2pi80T7YYak4khVrL5txpPjdKLTwmX6h3eZFB0e6/mIDb04P0qOyUq+Ae0TLagQzIWvNxTAopL5U2pmtEwD2niuV6Ls7lTk4gOsS2QEbK211wK6mC3fA2xhh88m3M7WHoAs+JeQGBadabOelyxN3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnd/QzaVSeO4mKX2dWbJTO/SSUIBV91r1ycSOm18bIw=;
 b=PycYiVFMn+egjHJyBFJdrc74g4eujfDtZo1QmHe69X+0/HGp2e4Y4XtquAtuuouXxHQV5ZA8IPKm55Ro4pBMt31OnZMVhnPQiLqo9P5zkC6tQDzMP0X8clpg/X6NLp45EYBjHwgoG0aZpu3jiXYmgqqj5avLRl/2ttFk6d92aE4=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by SJ0PR10MB4783.namprd10.prod.outlook.com (2603:10b6:a03:2d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 12:20:16 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::dc4c:1040:132e:ee9e]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::dc4c:1040:132e:ee9e%6]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 12:20:15 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Topic: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Index: AQHYb4NRXLWNm4XEYEK4fQNV8ypz460vr36AgAlwOYCAAFZJAIAADqgAgAAL2QCAAULHAIAAB0gAgALO9wA=
Date: Fri, 3 Jun 2022 12:20:15 +0000
Message-ID: <E0F1423C-4FAB-4D00-9AB4-8D6205DE5024@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
 <B3FC4541-1DB2-4C1F-8CB5-01D8771C8803@oracle.com>
 <20220601112658.07f97a9a.alex.williamson@redhat.com>
In-Reply-To: <20220601112658.07f97a9a.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc59ba73-b27f-4b4a-9b78-08da455b6a56
x-ms-traffictypediagnostic: SJ0PR10MB4783:EE_
x-microsoft-antispam-prvs: <SJ0PR10MB4783DBAAD269CBB34F3A6A5CB6A19@SJ0PR10MB4783.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sOaMz+zf+CakjV8vfjLccrNjhgls9VN9qMt5lYc1LTsuSKmek0CYm9+auOq6QCpq+VF5duP/7aC5Fl5KsR00xmNGYhrEUvUG+Tl93VY+kKQsBtUL59ORicXP1iGFxRYOueV9dh5GvDuYs59eZVM3i9lwTIdEp1nrJowzxTGb5nfv4RDY/87Kts6XqP10dGk4lN2IHEgvrobAvMrBn7h75DI9hmyDMk06b6a0GgXtjMRKH30VR/8x0co6EUmwcxpL5z4I8lYxyq62xkskVgsZQfxzxSBoYn0EpMzvrkdSlxp16F63VseqhkYLFdN4Uy5xD4VKrz3raFACA20kfKLPKmDinWfuH1tqgJaDBn0/Yb3ce8kC69ziJNHq4f81mrQxBGiakL/XQlPIWmYTTQa8EvKLkjs3Lm3guijmM2REmxviKadq5t0Vu7XuOfzBz5SYXiTj8nIg1xpWTJ9nasWouKM/9dhCfEfci59RFhbSS8uO6N5+kiniv1TUvlgA75KnSn8LqoVbSA9KeslziZsF0ZzH+Iw2Cw9XHuRoFx8cyU9dbqsKFu0+U5vDy1pD1KeIv5zv4kUnAl6n98MKFwK64vqDPnjJ6uN334KK7bo6ruKpFg9iYFb04EkkUzsV8HjwlN4/WSlMBEUQW3EwR0T4Tq3dZxrrn+ANps/i5VsnfhEQTGsarw0m3Ug5+bfqJEdI1doXp+rXTbLhPMJi33qvUNfJXGgo13IKDvXHjmNp7KE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(6916009)(54906003)(36756003)(38070700005)(122000001)(38100700002)(6486002)(71200400001)(186003)(26005)(2906002)(4326008)(66476007)(91956017)(8676002)(76116006)(66946007)(64756008)(66446008)(66556008)(8936002)(5660300002)(33656002)(508600001)(2616005)(7416002)(107886003)(6512007)(86362001)(6506007)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akJ3SUJvNjFIMVdTeUNtUnl6ZEkrMDZmZDdUdFdIcHBPanhGdWNmd1VsSUlH?=
 =?utf-8?B?WldvOWhGa2xNSnN1bjcxcjBQdlBiVkh0TThzblZPL2ZOVDQvaGxlN0xrRUF2?=
 =?utf-8?B?Uld5RnRVYVF5endaRWNPVkNJQ0lJS2tMRmdhclgveGMrQ2FHaDlWaUxQMTJT?=
 =?utf-8?B?ZXE0dGtyWHRGc1lLQXVRR1JLYUR1N2dJbFgveGt6UElpZGYySGhoMjBuTVB0?=
 =?utf-8?B?bkJZZHo0UlhXYTNSV3dieVdLSVJwNW5BbFRxNTJiQWxveDBHNy9vYm1tYysy?=
 =?utf-8?B?Q2VxMmZlV3poR2tHaVhWUmJOQ2hKelNkZzVhaTl0WGFlZ3ZTc1JNQmoxTktN?=
 =?utf-8?B?Q2xiSXZTZ2ZMSUJ5akM4REJ4VWN6TGJNOTVFc3RaWDhpdUJCS1hyRXRIRU1N?=
 =?utf-8?B?SDh0bEo0MWpWMkpIdGt5bDViem5yQVBmMFZZcUI1Zy9IZVRjRnBMblVhZHhF?=
 =?utf-8?B?M0twQTY0Sm5Bdi9Ka05uWDRwT1gxUG5xWTNMTTFLYnV4ZW1HV3F4SHlnM3Ri?=
 =?utf-8?B?alJSSTlXblowa1p1eHg4bHArSUp3dWVXSkllV3BrelJBbEM5WEduM3RueTc3?=
 =?utf-8?B?QzB0by9zOTJnVWJFRkRCV0ZjZktDOFl2L1dsWk4wYjdOMGdoZ1ZTNXlwVEl4?=
 =?utf-8?B?N3gvZG5ubjVWSE9ya3QvUjRqRXVacHo2dkRvdzZMMlZGZUFyelRTSG54a0c3?=
 =?utf-8?B?NVFUMWpTUmpwL1h4TlkySDE3bWo0Ym12U1FsYVdMM2RYL1pkVmpROVNBMVpm?=
 =?utf-8?B?NFhTVVRYN2o5VVkwUFI1eEJzYVpHOTAva1U5d012WU4xaFRZYXlhcWhBTGR6?=
 =?utf-8?B?SEt6V3R6bEpZNzQ0ZmFuSHhiY1hBYUJzekVrdmh4eXhBWFlBOExKS2tmb1BI?=
 =?utf-8?B?Z0hFNWZQUm9seUVIZ1BJalF4MVlCdEtTVGQ5MGNLVG9nWXBoQWVGZmY0cE5R?=
 =?utf-8?B?blRicFlBaUduUGtoY3FIWTlVNEhnbWhUOEpOcXFZeGUzaVlobjBDY1FZOG11?=
 =?utf-8?B?RW95Nkw3OUdQYmNnVC9RbnFJTlUxUFNMRUFmTzVzU3JKSEZ6cFQ0STgyN2Y3?=
 =?utf-8?B?SjdmTm5rbnc3Lzh1Ly9PUFg1Q1V3RHFpelVHcUdnbUZKNW1WVlZPNEZvRk5I?=
 =?utf-8?B?Y2I1S2x6RXJMRGN5NmlUYVNERkpmVEZzV0R4WG9qZnhBNXAvbWVveEc2SkJp?=
 =?utf-8?B?aStuYlprOC8zWDdnRjNmUFdqNkJ5N3gyd2pJaVIxUnp6dko5RUNLMXN1NTlQ?=
 =?utf-8?B?RjFzOWtORGdTclo2M2NkcDRVNmRRWUVJVnRkSHZDNkVrVy9EbnBIMkxDd21T?=
 =?utf-8?B?MWdzZCtFS1BoNGFVT0l5aDI0SVZlMStZN0dmR3FEbDJzTnBhRUhidkJYbnYz?=
 =?utf-8?B?TkVXVFFrYXdGcVlSRjNFY1BYYnYzZ0dsdE82NlVkbVRTVWgwNWFHblNFL2xs?=
 =?utf-8?B?aXZLekdGUW5MNkppRU9hMXpGVXFGajBhUUQyT3pCNGJMU1lielhMdGdpdW5r?=
 =?utf-8?B?TUdMN1B6a1BWOWcyWXZjMnpJYWorUmkvZUVIZldFQnpTYm9QV3BlZ2dCY01M?=
 =?utf-8?B?MnJIcElEM21NdkdkcjBnUG9Fd0RvSFZWeFoxUlJGRlhMWHgwNWFla0VsRmhO?=
 =?utf-8?B?T24zQ21SSWovR21VT0ZiZ2o4WUNkVTVMMlpGQkJBS2FEREVHdi9rOXU2SzJW?=
 =?utf-8?B?RTduSVl6QTM5VXo5NVl6N0ptSmhvT29qWWoxcDVUSExmcVpmeGpmV1hRM0lO?=
 =?utf-8?B?QktvR1ovUmlqSmlPTDduZHhvWCtUdTRUb0tpa0ZaWVNiZUR4QWlwdzFzQnY5?=
 =?utf-8?B?VzhLLy92Z24rRGsxZ0paYnRiMk5wallVZkxSK3I1Vk9jSVpWR2VyUmtBdzdI?=
 =?utf-8?B?SFpNTG9NcnpBcDVIUnJmYStkU2QyTCtYekNsNXJ5RVl4bHk1NHBQNVRCRUh5?=
 =?utf-8?B?cXRsTmpac3BIZDFKcDM0bG53eXhQQzdGRGRicHNQbEl2Nm1GcHVxMGM4NHR4?=
 =?utf-8?B?K25WV1dOVWpSK3JycCtjQXpMcFdYT2FyTSt5RlVTN2ZPMTUrd1BnYUR1dTZz?=
 =?utf-8?B?MDFHODZUcThqZjFzdmRtSW9GMGtyMExvQWJJbzgzU3dqUXREeno4N1p5TGll?=
 =?utf-8?B?VVlGeWpuQTZMQ09yWVFYT1l5RVh2ejdCUTVQaUpjN3REWXJ2VjhSVEgyVjE3?=
 =?utf-8?B?cmJSTElKNmNpSU16aG1FYkUzU3lyUGV6emdHRS96Qy93QWhoT0VUVEZqQnBJ?=
 =?utf-8?B?SFNvR0xRT0tDRlg1ZHk2Uk13VTdGVlh5VWZvUVlabFd6bnFacHZxLzFqa3M0?=
 =?utf-8?B?N0gzaWZxSEM3ZmdtNVZ1dnBoVC9aVlNMSjlSbmdWYjdNbmtBT3k0c2VSWkVF?=
 =?utf-8?Q?QzaIajOVUUXuEnbs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B04AAB42ED254DB434B7D2A7B2E0E8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc59ba73-b27f-4b4a-9b78-08da455b6a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 12:20:15.4435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMafZ1i7wN8LF95duexb8ah83BlcEoP1cNltoW8kuDdgv9rXYMEpBHT1OjIThuHmZNfNwo1iRXnyvK+H7NJkTdNcfUsY0i1aOVxddis1Lk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4783
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-03_04:2022-06-02,
 2022-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206030053
X-Proofpoint-GUID: 5_Hq8AcY1z-k2y97CqeWnojg1IANLcDi
X-Proofpoint-ORIG-GUID: 5_Hq8AcY1z-k2y97CqeWnojg1IANLcDi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

DQoNCj4gT24gSnVuIDEsIDIwMjIsIGF0IDE6MjYgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAxIEp1biAyMDIyIDE3
OjAwOjU0ICswMDAwDQo+IEphZyBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBIaSBBbGV4LA0KPj4gDQo+PiBKdXN0IHRvIGFkZCBzb21lIG1vcmUgZGV0YWlsLCB0
aGUgZW11bGF0ZWQgUENJIGRldmljZSBpbiBRRU1VIHByZXNlbnRseQ0KPj4gbWFpbnRhaW5zIGEg
TVNJeCB0YWJsZSAoUENJRGV2aWNlLT5tc2l4X3RhYmxlKSBhbmQgUGVuZGluZyBCaXQgQXJyYXku
IEluIHRoZQ0KPj4gcHJlc2VudCBWRklPIFBDSSBkZXZpY2UgaW1wbGVtZW50YXRpb24sIFFFTVUg
bGV2ZXJhZ2VzIHRoZSBzYW1lDQo+PiBNU0l4IHRhYmxlIGZvciBpbnRlcnJ1cHQgbWFza2luZy91
bm1hc2tpbmcuIFRoZSBiYWNrZW5kIFBDSSBkZXZpY2UgKHN1Y2ggYXMNCj4+IHRoZSBwYXNzdGhy
dSBkZXZpY2UpIGFsd2F5cyB0aGlua3MgdGhhdCB0aGUgaW50ZXJydXB0IGlzIHVubWFza2VkIGFu
ZCBsZXRzDQo+PiBRRU1VIG1hbmFnZSBtYXNraW5nLg0KPj4gDQo+PiBXaGVyZWFzIGluIHRoZSB2
ZmlvLXVzZXIgY2FzZSwgdGhlIGNsaWVudCBhZGRpdGlvbmFsbHkgcHVzaGVzIGEgY29weSBvZg0K
Pj4gZW11bGF0ZWQgUENJIGRldmljZeKAmXMgdGFibGUgZG93bnN0cmVhbSB0byB0aGUgcmVtb3Rl
IGRldmljZS4gV2UgZGlkIHRoaXMNCj4+IHRvIGFsbG93IGEgc21hbGwgc2V0IG9mIGRldmljZXMg
KHN1Y2ggYXMgZTEwMDBlKSB0byBjbGVhciB0aGUNCj4+IFBCQSAobXNpeF9jbHJfcGVuZGluZygp
KS4gU2Vjb25kbHksIHRoZSByZW1vdGUgZGV2aWNlIHVzZXMgaXRzIGNvcHkgb2YgdGhlDQo+PiBN
U0l4IHRhYmxlIHRvIGRldGVybWluZSBpZiBpbnRlcnJ1cHQgc2hvdWxkIGJlIHRyaWdnZXJlZCAt
IHRoaXMgd291bGQgcHJldmVudA0KPj4gYW4gaW50ZXJydXB0IGZyb20gYmVpbmcgc2VudCB0byB0
aGUgY2xpZW50IHVubmVjZXNzYXJpbHkgaWYgaXQncyBtYXNrZWQuDQo+PiANCj4+IFdlIGFyZSB3
b25kZXJpbmcgaWYgcHVzaGluZyB0aGUgTVNJeCB0YWJsZSB0byB0aGUgcmVtb3RlIGRldmljZSBh
bmQNCj4+IHJlYWRpbmcgUEJBIGZyb20gaXQgd291bGQgZGl2ZXJnZSBmcm9tIHRoZSBWRklPIHBy
b3RvY29sIHNwZWNpZmljYXRpb24/DQo+PiANCj4+IEZyb20geW91ciBjb21tZW50LCBJIHVuZGVy
c3RhbmQgaXTigJlzIHNpbWlsYXIgdG8gVkZJTyBwcm90b2NvbCBiZWNhdXNlIFZGSU8NCj4+IGNs
aWVudHMgY291bGQgbWFzayBhbiBpbnRlcnJ1cHQgdXNpbmcgVkZJT19ERVZJQ0VfU0VUX0lSUVMg
aW9jdGwgKw0KPj4gVkZJT19JUlFfU0VUX0FDVElPTl9NQVNLIC8gX1VOTUFTSyBmbGFncy4gSSBv
YnNlcnZlZCB0aGF0IFFFTVUgcHJlc2VudGx5DQo+PiBkb2VzIG5vdCB1c2UgdGhpcyBhcHByb2Fj
aCBhbmQgdGhlIGtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IGl0IGZvciBNU0kuDQo+IA0KPiBJIGJl
bGlldmUgdGhlIFNFVF9JUlFTIGlvY3RsIGRlZmluaXRpb24gaXMgcHJlLWVuYWJsZWQgdG8gc3Vw
cG9ydA0KPiBtYXNraW5nIGFuZCB1bm1hc2tpbmcsIHdlJ3ZlIGp1c3QgbGFja2VkIGtlcm5lbCBz
dXBwb3J0IHRvIG1hc2sgYXQgdGhlDQo+IGRldmljZSB3aGljaCBsZWFkcyB0byB0aGUgaHlicmlk
IGFwcHJvYWNoIHdlIGhhdmUgdG9kYXkuICBPdXIgaW50ZW50aW9uDQo+IHdvdWxkIGJlIHRvIHVz
ZSB0aGUgY3VycmVudCB1QVBJLCB0byBwcm92aWRlIHRoYXQgbWFza2luZyBzdXBwb3J0LCBhdA0K
PiB3aGljaCBwb2ludCB3ZSdkIGxlYXZlIHRoZSBQQkEgbWFwcGVkIHRvIHRoZSBkZXZpY2UuDQo+
IA0KDQoJVGhlIHJlYXNvbiBJIGRpZG7igJl0IHVzZSBTRVRfSVJRUyB3YXMgdGhlIGtlcm5lbCBp
bXBsZW1lbnRhdGlvbg0KZGlkbuKAmXQsIGFuZCBJIHdhbnRlZCB0byBhdm9pZCBoYXZpbmcgdGhl
IHR3byBiZWhhdmUgZGlmZmVyZW50bHkuICBJZiB3ZQ0Kd2FudCB0byBnbyBkb3duIHRoZSBtb2Rh
bCBwYXRoLCB0aGVuIGlmIHdlIHVzZSBTRVRfSVJRUyB0byBtYXNrIGludGVycnVwdHMNCmF0IHRo
ZSBzb3VyY2UsIHdlIGRvbuKAmXQgbmVlZCB0byBlbXVsYXRlIG1hc2tpbmcgYnkgY2hhbmdpbmcg
dGhlIGludGVycnVwdA0KZXZlbnRmZCBmcm9tIEtWTSB0byBRRU1VIHdoZW4gdGhlIGludGVycnVw
dCBpcyBtYXNrZWQuICBEbyB5b3Ugd2FudCB0aGF0DQpjaGFuZ2UgYXMgd2VsbD8NCg0KCQkJCQkJ
CQlKSg0KDQo=

