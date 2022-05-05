Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6451C41D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:41:48 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdbv-0005El-6g
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmdXb-0002sp-MJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:37:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmdXY-0003Pt-G4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:37:18 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245DZdFK018740;
 Thu, 5 May 2022 15:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=I9dZ3lWnhtqSpl/CWSmI1oBW9Am+aYcMq477FjyVCWA=;
 b=BsugyLrrxuOora15wKkSqTZGEgVqmsHlTX9FIApxze7MQzkKryssL1lZrUfka44pEZX5
 1tC1DCo0203jUkYeRpGyaLYIS9gRMdK7RzEhfSmiuMTV3JDHc99o8bBudWkGhuPEHhb7
 20vHHdc4PZbfS7Jr2FK4JDzGYsczkFbVL1TPmYutngiG8spc7yFTvWarS6zfq/ZlUe8a
 l0NjUjq+w0ZWFRdILf7ghoRfCJRGwU7zzcxG5yMy0ycChlJNtwj3oiros0HCjwcDL37Y
 qr0d9pFJ1iCYuLKgP/Sp2fP3UDowOLB0QA7UJvPFj10Z5j0ME6ShRIgPDQ9+EAi4SeVQ PQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntbtsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 15:37:00 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245FaYCd021508; Thu, 5 May 2022 15:36:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8y7bp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 15:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWwsQj03roKztPULFvSs9pqMt1wiWNbsCwIevQCSXZDoadhqwdzIg595Ro218ZnvKGXCtq7ChOEBGMZWrEjxCDvDW+6iifT+hu5YaDgosmkEuk7rfeF/pSaNQWJgGrEMAbxLOu/1P0p+dl2VjoGFqRJs8Oo5GFjGeRDIqOwjsaC1dKmzQOKQW6iUzNoc2nL/ul7MisG+igg6u+8APio9d++IIwmtxCBAOTMDrpw91PvC2VordqZqRYMkCGS7yWQNQSPpuwixMKENVV1de2n4PMeeKRsoGFYNuI1fqHU7kadaKag28dm0nAJXrIz0N5NwsgO7riYtMTQxGKEDkMrHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9dZ3lWnhtqSpl/CWSmI1oBW9Am+aYcMq477FjyVCWA=;
 b=byos/GSxCcVqYBobRAxyTbjFXV/d9uZpCAuTpeM6/nGG7DY2DfDdcbOu7yQ7o43cErlR8rtpE4ltQxs36VS82gJhJcIRxiYO4csdEDI6Z463bxx41BQjMTgm94LpJHXDWa+MuqebcrfU2/87DK1R+id3/zHsehpm+EzmE1VZd924p/lCAjDg15YpBiij/BVDk29k8VtQKZz+mkaDDp1k+oINo+BkpGF40th6ZwBnb9UGUCzTLWrUJLSIY/E58I+l2/keB6ydV+/lTbFzhhkiQQrndwrdRF/Opid5co7rEkkmExa4spwRemqUX+V7t6JZRzqEXu/o7eAsOmZKrIsnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9dZ3lWnhtqSpl/CWSmI1oBW9Am+aYcMq477FjyVCWA=;
 b=IladD9V3fuoZighjRw4ggtUKQteeKTj2fKqlxLKjXPezm4+GMc0CM06ysx4pHg64UJyWcfaDsG3q7y9PGhEX1uEbAfWN/a14xCGWzt2KXaB6tP3h2oteytM0BSVoslRhKgO+HJfkVoOqHwF2TAJsDYXHQkkgplLOa35K0A15ijE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3787.namprd10.prod.outlook.com (2603:10b6:5:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 15:36:55 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:36:55 +0000
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
Thread-Index: AQHYXviFJ6gKC1s68E+zRCuFWJP0wa0OmjM5gAA9ZQCAARKwwYAAYuaAgAARtrmAAA8OgA==
Date: Thu, 5 May 2022 15:36:55 +0000
Message-ID: <8BE16BED-9157-42F6-8AD5-4E76B9B14FE7@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 <877d717cd2.fsf@pond.sub.org>
 <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com>
 <87k0b0zamn.fsf@pond.sub.org>
 <A0DB61EE-A8D2-4EBB-82E7-BC5F205C7051@oracle.com>
 <87y1zgqbvq.fsf@pond.sub.org>
In-Reply-To: <87y1zgqbvq.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4ebd119-49d2-4740-d3dd-08da2ead15cf
x-ms-traffictypediagnostic: DM6PR10MB3787:EE_
x-microsoft-antispam-prvs: <DM6PR10MB3787EC7D3BC070C9FAC308A190C29@DM6PR10MB3787.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pa2JG/F6oe2NxiID2U6TTShk77Sm9CzpfDErhUrP06+PVOChBOHsVApNCrDaZV31k/HZ+wYsuV0x+3Gb6Ka/q8bOtMTdZLHzIVqhxHqD8QmPZjmtlS61ppXncycYSFukHuXRvJXUzl/fwSEO94uEDtRamMYx3rpH43CPBnckEHJo6X7r7hiGCFkl+zX7aSXWIrqvlOz2RoJJUsgN76MnKSmxHtl++GAnlHQ4tuWt30mPClbWDpec9DxkcEtl0d1TnXbyHjwwgWM3xjYslbE8B3RGGo2vonEOKa8tES8pxwp9gfDlJaFl26X5kr0+/kJVhqvdJYJ0++xm2BO9ZaRTAEjQH7S90XiUuZ2WyzopihPyNDeI3AAk/SCAl28FfbWC9/+spVbEqYGSyvfVKJ6u0ltJA/SsLPSbP07Tls8xEmTzcDDfAN9uD4r6OdJMnc2kHOqrUyG22ThOGYamtpv4ABI3Y+9oYliwpswXssWlxH/O6S8bwvZdctetCpFM9zSx0LSLFe43zyaaxXeBaau7/xtBYNqFfKv5dZsOb2ENk9ekB8Qx5e9QqPspArcrKGk2DV0JYoBfbgonel5jyyQmj1raBSXq1FGuLjf+UM6gQiLr2Pve2FvWjcQ+LYhsgb/zRsU2UaA6jvosu7UDuuG0VwZX+FMpbr/ROMx/britUlZ34idUYW+Dva9JkoQxdgGwRmiT/YHtIanK128UcJrku+jiHi+KUkZgKICEFAQTsKg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(5660300002)(53546011)(508600001)(2906002)(7416002)(33656002)(6506007)(86362001)(8936002)(6512007)(44832011)(71200400001)(83380400001)(8676002)(66946007)(6916009)(38100700002)(76116006)(186003)(2616005)(4326008)(66556008)(66476007)(66446008)(64756008)(38070700005)(36756003)(91956017)(54906003)(122000001)(316002)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q25WWEhjRGc5aUhLRzluWTZLZWczR0hJbFZnRDFpL3VwTkdpbUpPb2pYWlF2?=
 =?utf-8?B?YVdlWCtoeWZYRjFyWmN0V3NFOThKempsRWRVUXZiQ3ovY0FiTkpYdlhiQVRF?=
 =?utf-8?B?VWdGc3BGZ2poblg2bW9tZmk1YWlQSkFaQVF1eENpbzFHbzd1YUh0VVBicmxI?=
 =?utf-8?B?a3ZzaTV2NG9XaHlJZDlJbHJjOGxLSVJyb0V1YUdpekhWb2pkNG9Kelp0a0xj?=
 =?utf-8?B?QW1sZjVEbVI5ckFwQVE5QmhyVjI2YVU2TnhTZG1LNFc0TWpDaFJDUS9UNlVk?=
 =?utf-8?B?dk1oR1JVSFM0UU5OUmlZOGxNU3dxZzdoUjVnTGNldFdQYTlpMUh2Y3V0Q0pw?=
 =?utf-8?B?eDZvUm1NbjBCNS9ieEVoOFVWaFZORGwzL3RnYXZoTWROZXpXT1k4UTZLajR5?=
 =?utf-8?B?ZzgzYWZJMzVZTHNINlJUUk5ya1p0R1FmbnowMHk4VUlvak5HamtQTEU4bUlI?=
 =?utf-8?B?TkRBL20yRDBkVkVDVDhTZVhya1g0ZkhoMWNwSzEvTFpEUGI5SEoxRkFhYUhs?=
 =?utf-8?B?TWtuWkxZMlFMNzA5MStvZGp6MTFKKzBmMHdaZ2VEeHJNcGt1MktIYUYwbW96?=
 =?utf-8?B?V1J0d3dsMllidE5nNmt2RkY3UmpDUkF1eW14cVlpeVlPWmJwakJ0UVVlckkw?=
 =?utf-8?B?ZTFDSE9QR0k1YjFud0VxdGJHMndjWDFIUE9QK2IvQWNoK0xnOVFpNENMMndy?=
 =?utf-8?B?a0FUK2dIV0tjb3l2K3poWDg5dU42ZkFZSEVCWENnNW1OWndYVVFrU3kxeXRu?=
 =?utf-8?B?TzJIT083Y1JpcFpGYVNoNzlXMm9mYzg3WUhWVjdjZS9WbDZYZzZJdVVEZDVO?=
 =?utf-8?B?dG5id1NURVdVdU0zNFM1UlpUVFBqRkgzR0R2L2FQdXZ5UXZuVTBwbEZ4NGVX?=
 =?utf-8?B?WnRDaGNJdVkrMlhydWZxU0F1U0pIb3NiY1BiVktmQ00wVnB1eHVEV0V3aGdE?=
 =?utf-8?B?VWdhQzhoNlIyWml6WUh0R014RVNPWEtHR3ZORkVablQvdzk3bkEzWUkrQzZT?=
 =?utf-8?B?M093a2JFMS9IVmk0ZVNhclI1WVRuK3E0Y0NXdldITmZiT0R6cDBtZjJOelJY?=
 =?utf-8?B?OExuOUtXb0pDOEVnTlJuK0hlVHhSdU9kZzh2R24wSktkYkQyR0VCdnBraU9k?=
 =?utf-8?B?a1puZzZYeGZWYjlzOUwvMUpVU09UVGxTNDlCTW5zVC9iMTU4U2hxQldvdDlB?=
 =?utf-8?B?UkZnVzlTQmQva1VhdW5ud1dPTUFkQTZoeUVZQTdKNTRhQ1JXN3VyWUtYY1Vw?=
 =?utf-8?B?Sno4anhxdEhYVytHMnl3K1lJdG5tOHVoTWgvNy9XWnYxTml0TFR0NlljcW51?=
 =?utf-8?B?NW9sckEwY1JZRHdtVkpUa1YxM3Z5Rit1NVFxdHFuTmZjeXlSaWs0U1BQemZJ?=
 =?utf-8?B?UTY0dDlNQTJDOXdjM21nRThRK1FBaHoxSW1hUmkxKzQxOWhQWXk3RnZkeU1Z?=
 =?utf-8?B?dHd0MmdXaDdoSGk0YnJYcUZua2Q1NGE5VjlOYk8zWXppU0EzYkFzclhsWHZk?=
 =?utf-8?B?YUFybTQyWU91SmVzdER6QzFrMzdObXBuTGpSbjBvazFVb2h6SzNDcmYyeDlq?=
 =?utf-8?B?b3hYOVE4U0t3NUM0d2F4VVk1NHdVSk1sWUx3aXVFRDEydXhhZTJoeCtBb1o1?=
 =?utf-8?B?OGZIdFJrVWIyRG02WE1xTVVqVVY1c1IvZzlpR1RaUSs2YzdsQm5yMjZWZEph?=
 =?utf-8?B?UzdYOHpKRHVoVVVCVmUxMHhFb3M2TVpVTEFjeG9kdHBsWkxLcXpCYkUwRjFt?=
 =?utf-8?B?ZmcyODVneUppNU13b0l5cTVEQ1BQU3FremR5RlZqODVvTmVuSkFHUmYrYUxM?=
 =?utf-8?B?WldPR0hkN0NTUmxScWVMa1hNSnRCU1NsbVlrRDVNSlNXT0duR0VYNW9VK21N?=
 =?utf-8?B?S3ZoMWlaMVNhcmpkR1pxUEZKRFB4VCt1SmkwS3hmNm9IRW45N1FjWk9kaDUr?=
 =?utf-8?B?YjFMUFV4Q05qa3dJdGRpSk5lQjgveEVzcWJxbno2V29oMG8vWW94VWowaisz?=
 =?utf-8?B?ZHZCWGRueWRyOW1VaXdhdDZPc2JzcnBTSFZGeCs3QWlyY3FUZHVQT0szdDZk?=
 =?utf-8?B?Y2k3VHd6K1Q2WkwrdnViT0Qrd1VGM2hsZ0VxeGcybzJabDg0bjJWc3F6emZt?=
 =?utf-8?B?cTYxcDRabG15WmpCSE9KTXdpY2JaYlVROTNyeTkzbENqNkhRc2R2NGlZKzUv?=
 =?utf-8?B?MEc0ZWVMN0EwL1FuUElmUUQ1M0RRL1crQm5FYit0SEludm11Y0N2WFB0bFh3?=
 =?utf-8?B?aWNQT2dVN2szNUFaa1lpN1F0NXZwdnB1U2MxbGpYbXliS2RVOEdBN25QQmhV?=
 =?utf-8?B?aTREMThoSW90NWNKY2VaREpsdmM2aDhxUUFEb3BxV29MMENQYWpJVm9hTDBn?=
 =?utf-8?Q?oxN2wxf08mVx6T4QNSRYHWd6NQcHRXdgHp4zm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3008F676D0725A4FB703046E4A6AC516@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ebd119-49d2-4740-d3dd-08da2ead15cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 15:36:55.6195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHbSU2/NLDmwncZS98gvzMuxr9CoWncvx8WX5CDGMjFa3otgnirFl4q1OckqGII+MS1xq0rIPjTcfJ0SOAXwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3787
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050111
X-Proofpoint-ORIG-GUID: Jwf-ZbhEyxvRFDVBvJpbpbXhYRXocw9R
X-Proofpoint-GUID: Jwf-ZbhEyxvRFDVBvJpbpbXhYRXocw9R
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

DQoNCj4gT24gTWF5IDUsIDIwMjIsIGF0IDEwOjQyIEFNLCBNYXJrdXMgQXJtYnJ1c3RlciA8YXJt
YnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4gd3JpdGVzOg0KPiANCj4+PiBPbiBNYXkgNSwgMjAyMiwgYXQgMzo0NCBBTSwgTWFya3Vz
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBKYWcgUmFt
YW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cml0ZXM6DQo+Pj4gDQo+Pj4+PiBPbiBNYXkgNCwg
MjAyMiwgYXQgNzo0MiBBTSwgTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPiB3
cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPiB3cml0ZXM6DQo+Pj4+PiANCj4+Pj4+PiBTZXR1cCBhIGhhbmRsZXIgdG8gcnVuIHZmaW8t
dXNlciBjb250ZXh0LiBUaGUgY29udGV4dCBpcyBkcml2ZW4gYnkNCj4+Pj4+PiBtZXNzYWdlcyB0
byB0aGUgZmlsZSBkZXNjcmlwdG9yIGFzc29jaWF0ZWQgd2l0aCBpdCAtIGdldCB0aGUgZmQgZm9y
DQo+Pj4+Pj4gdGhlIGNvbnRleHQgYW5kIGhvb2sgdXAgdGhlIGhhbmRsZXIgd2l0aCBpdA0KPj4+
Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRz
ZXZhQG9yYWNsZS5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpv
aG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRo
YW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+Pj4+IFJldmlld2VkLWJ5OiBTdGVm
YW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+IA0KPiBbLi4uXQ0KPiANCj4+Pj4+
PiBAQCAtMTY0LDYgKzE3Miw3NiBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2Uo
T2JqZWN0ICpvYmosIGNvbnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4+Pj4+IHZmdV9v
YmplY3RfaW5pdF9jdHgobywgZXJycCk7DQo+Pj4+Pj4gfQ0KPj4+Pj4+IA0KPj4+Pj4+ICtzdGF0
aWMgdm9pZCB2ZnVfb2JqZWN0X2N0eF9ydW4odm9pZCAqb3BhcXVlKQ0KPj4+Pj4+ICt7DQo+Pj4+
Pj4gKyBWZnVPYmplY3QgKm8gPSBvcGFxdWU7DQo+Pj4+Pj4gKyBjb25zdCBjaGFyICp2ZnVfaWQ7
DQo+Pj4+Pj4gKyBjaGFyICp2ZnVfcGF0aCwgKnBjaV9kZXZfcGF0aDsNCj4+Pj4+PiArIGludCBy
ZXQgPSAtMTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyB3aGlsZSAocmV0ICE9IDApIHsNCj4+Pj4+PiAr
IHJldCA9IHZmdV9ydW5fY3R4KG8tPnZmdV9jdHgpOw0KPj4+Pj4+ICsgaWYgKHJldCA8IDApIHsN
Cj4+Pj4+PiArIGlmIChlcnJubyA9PSBFSU5UUikgew0KPj4+Pj4+ICsgY29udGludWU7DQo+Pj4+
Pj4gKyB9IGVsc2UgaWYgKGVycm5vID09IEVOT1RDT05OKSB7DQo+Pj4+Pj4gKyB2ZnVfaWQgPSBv
YmplY3RfZ2V0X2Nhbm9uaWNhbF9wYXRoX2NvbXBvbmVudChPQkpFQ1QobykpOw0KPj4+Pj4+ICsg
dmZ1X3BhdGggPSBvYmplY3RfZ2V0X2Nhbm9uaWNhbF9wYXRoKE9CSkVDVChvKSk7DQo+Pj4+PiAN
Cj4+Pj4+IEhtbS4gQHZmdV9pZCBpcyBhbHdheXMgdGhlIGxhc3QgY29tcG9uZW50IG9mIEB2ZnVf
cGF0aC4gV2h5IGRvIHdlIG5lZWQNCj4+Pj4+IHRvIHNlbmQgYm90aD8NCj4+Pj4gDQo+Pj4+IHZm
dV9pZCBpcyB0aGUgSUQgdGhhdCB0aGUgdXNlci9PcmNoZXN0cmF0b3IgcGFzc2VkIGFzIGEgY29t
bWFuZC1saW5lIG9wdGlvbg0KPj4+PiBkdXJpbmcgYWRkaXRpb24vY3JlYXRpb24uIFNvIGl0IG1h
ZGUgc2Vuc2UgdG8gcmVwb3J0IGJhY2sgd2l0aCB0aGUgc2FtZSBJRA0KPj4+PiB0aGF0IHRoZXkg
dXNlZC4gQnV0IEnigJltIE9LIHdpdGggZHJvcHBpbmcgdGhpcyBpZiB0aGF04oCZcyB3aGF0IHlv
dSBwcmVmZXIuDQo+Pj4gDQo+Pj4gTWF0dGVyIG9mIHRhc3RlLCBJIGd1ZXNzLiAgSSdkIGRyb3Ag
aXQgc2ltcGx5IHRvIHNhdmVzIHVzIHRoZSB0cm91YmxlIG9mDQo+Pj4gZG9jdW1lbnRpbmcgaXQu
DQo+Pj4gDQo+Pj4gSWYgd2UgZGVjaWRlIHRvIGtlZXAgaXQsIHRoZW4gSSB0aGluayB3ZSBzaG91
bGQgZG9jdW1lbnQgaXQncyBhbHdheXMgdGhlDQo+Pj4gbGFzdCBjb21wb25lbnQgb2YgQHZmdV9w
YXRoLg0KPj4+IA0KPj4+Pj4+ICsgZ19hc3NlcnQoby0+cGNpX2Rldik7DQo+Pj4+Pj4gKyBwY2lf
ZGV2X3BhdGggPSBvYmplY3RfZ2V0X2Nhbm9uaWNhbF9wYXRoKE9CSkVDVChvLT5wY2lfZGV2KSk7
DQo+Pj4+Pj4gKyBxYXBpX2V2ZW50X3NlbmRfdmZ1X2NsaWVudF9oYW5ndXAodmZ1X2lkLCB2ZnVf
cGF0aCwNCj4+Pj4+PiArIG8tPmRldmljZSwgcGNpX2Rldl9wYXRoKTsNCj4+Pj4+IA0KPj4+Pj4g
V2hlcmUgaXMgby0+ZGV2aWNlIHNldD8gSSdtIGFza2luZyBiZWNhdXNlIEkgaXQgbXVzdCBub3Qg
YmUgbnVsbCBoZXJlLA0KPj4+Pj4gYW5kIHRoYXQncyBub3QgbG9jYWxseSBvYnZpb3VzLg0KPj4+
PiANCj4+Pj4gWWVhaCwgaXTigJlzIG5vdCBvYnZpb3VzIGZyb20gdGhpcyBwYXRjaCB0aGF0IG8t
PmRldmljZSBpcyBndWFyYW50ZWVkIHRvIGJlDQo+Pj4+IG5vbi1OVUxMLiBJdOKAmXMgc2V0IGJ5
IHZmdV9vYmplY3Rfc2V0X2RldmljZSgpLiBQbGVhc2Ugc2VlIHRoZSBmb2xsb3dpbmcNCj4+Pj4g
cGF0Y2hlcyBpbiB0aGUgc2VyaWVzOg0KPj4+PiB2ZmlvLXVzZXI6IGRlZmluZSB2ZmlvLXVzZXIt
c2VydmVyIG9iamVjdA0KPj4+PiB2ZmlvLXVzZXI6IGluc3RhbnRpYXRlIHZmaW8tdXNlciBjb250
ZXh0DQo+Pj4gDQo+Pj4gdmZ1X29iamVjdF9zZXRfZGV2aWNlKCkgaXMgYSBRT00gcHJvcGVydHkg
c2V0dGVyLiAgSXQgZ2V0cyBjYWxsZWQgaWYgYW5kDQo+Pj4gb25seSBpZiB0aGUgcHJvcGVydHkg
aXMgc2V0LiAgSWYgaXQncyBuZXZlciBzZXQsIC0+ZGV2aWNlIHJlbWFpbnMgbnVsbC4NCj4+PiBX
aGF0IGVuc3VyZXMgaXQncyBhbHdheXMgc2V0Pw0KPj4gDQo+PiBUaGF04oCZcyBhIGdvb2QgcXVl
c3Rpb24gLSBpdOKAmXMgbm90IG9idmlvdXMgZnJvbSB0aGlzIHBhdGNoLg0KPj4gDQo+PiBUaGUg
Y29kZSB3b3VsZCBub3QgcmVhY2ggaGVyZSBpZiBvLT5kZXZpY2UgaXMgbm90IHNldC4gSWYgby0+
ZGV2aWNlIGlzIE5VTEwsDQo+PiB2ZnVfb2JqZWN0X2luaXRfY3R4KCkgd291bGQgYmFpbCBvdXQg
ZWFybHkgd2l0aG91dCBzZXR0aW5nIHVwDQo+PiB2ZnVfb2JqZWN0X2F0dGFjaF9jdHgoKSBhbmQg
dmZ1X29iamVjdF9jdHhfcnVuKCkgKHRoaXMgZnVuY3Rpb24pDQo+PiBoYW5kbGVycy4NCj4gDQo+
IFllczoNCj4gDQo+ICAgIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdF9jdHgoVmZ1T2JqZWN0
ICpvLCBFcnJvciAqKmVycnApDQo+ICAgIHsNCj4gICAgICAgIEVSUlBfR1VBUkQoKTsNCj4gICAg
ICAgIERldmljZVN0YXRlICpkZXYgPSBOVUxMOw0KPiAgICAgICAgdmZ1X3BjaV90eXBlX3QgcGNp
X3R5cGUgPSBWRlVfUENJX1RZUEVfQ09OVkVOVElPTkFMOw0KPiAgICAgICAgaW50IHJldDsNCj4g
DQo+ICAgICAgICBpZiAoby0+dmZ1X2N0eCB8fCAhby0+c29ja2V0IHx8ICFvLT5kZXZpY2UgfHwN
Cj4gICAgICAgICAgICAgICAgIXBoYXNlX2NoZWNrKFBIQVNFX01BQ0hJTkVfUkVBRFkpKSB7DQo+
ICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgfQ0KPiANCj4gQmFpbHMgb3V0IHdpdGhvdXQg
c2V0dGluZyBhbiBlcnJvci4gIFN1cmUgdGhhdCdzIGFwcHJvcHJpYXRlPw0KDQpJdOKAmXMgbm90
IGFuIGVycm9yIHBlciBzZSAtIHZmdV9vYmplY3RfaW5pdF9jdHgoKSBkb2VzbuKAmXQgcHJvY2Vl
ZA0KZnVydGhlciBpZiBkZXZpY2Uvc29ja2V0IGlzIG5vdCBzZXQgb3IgaWYgdGhlIG1hY2hpbmUg
aXMgbm90IHJlYWR5Lg0KDQpCb3RoIHNvY2tldCBhbmQgZGV2aWNlIGFyZSByZXF1aXJlZCBwcm9w
ZXJ0aWVzLCBzbyB0aGV5IHdvdWxkDQpldmVudHVhbGx5IGJlIHNldCBieSB2ZnVfb2JqZWN0X3Nl
dF9zb2NrZXQoKSAvDQp2ZnVfb2JqZWN0X3NldF9kZXZpY2UoKSAtIGFuZCB0aGVzZSBzZXR0ZXJz
IGV2ZW50dWFsbHkga2ljaw0KdmZ1X29iamVjdF9pbml0X2N0eCgpLg0KDQo+IA0KPj4gQWxzbywg
ZGV2aWNlIGlzIGEgcmVxdWlyZWQgcGFyYW1ldGVyLiBRRU1VIHdvdWxkIG5vdCBpbml0aWFsaXpl
IHRoaXMgb2JqZWN0DQo+PiB3aXRob3V0IGl0LiBQbGVhc2Ugc2VlIHRoZSBkZWZpbml0aW9uIG9m
IFZmaW9Vc2VyU2VydmVyUHJvcGVydGllcyBpbiB0aGUNCj4+IGZvbGxvd2luZyBwYXRjaCAtIG5v
dGluZyB0aGF0IG9wdGlvbmFsIHBhcmFtZXRlcnMgYXJlIHByZWZpeGVkIHdpdGggYSDigJgq4oCZ
Og0KPj4gW1BBVENIIHY5IDA3LzE3XSB2ZmlvLXVzZXI6IGRlZmluZSB2ZmlvLXVzZXItc2VydmVy
IG9iamVjdC4NCj4+IA0KPj4gTWF5IGJlIHdlIHNob3VsZCBhZGQgYSBjb21tZW50IGhlcmUgdG8g
ZXhwbGFpbiB3aHkgby0+ZGV2aWNlDQo+PiB3b3VsZG7igJl0IGJlIE5VTEw/DQo+IA0KPiBQZXJo
YXBzIGFzc2VydGlvbiB3aXRoIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBpdCBob2xkcy4NCg0K
T0ssIHdpbGwgZG8uDQoNCi0tDQpKYWcNCg0KPiANCj4+IFRoYW5rIHlvdSENCj4gDQo+IFlvdSdy
ZSB3ZWxjb21lIQ0KPiANCg0K

