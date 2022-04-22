Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4991D50B9FC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:22:34 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuB7-0007x1-Dh
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhu7a-0004ef-0C
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:18:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhu7W-0000g6-NY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:18:52 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23MDivS8019815; 
 Fri, 22 Apr 2022 14:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RjoDgeVgY0j3bn/0seRY3OsuxYOsOFTuWSrLzZNOstU=;
 b=M9MIyEt40QtEBBA0ArKo99gqtVmvtUtn9JZlQb6ZeN6m03L/AMohb8mVoBLaWVJYFdnM
 4AQvNdyS6XRwnJa6ZiMrD+qXOwSlD6RD9XfTc1CkxcrIjk3qJZ/X3xBv653yppFNC4iF
 LCR5k60xKCBsHVl8i/AkvNuSz4VCJ6pJ96szt+j/bYD6wbwTkgyiEnAIanlf7dRNMc2j
 4k3b2kSLYDmjPvs0dWhgvGWuWSq1pxxpkiBpLf+ZTJ+BGfdtLPtt5GT49yzhDNBGHzCe
 W2+acmvB3hC1WozrZj5beTMhMryiF6Jh5Dg9F2rm7XZKnZwZBfNTVrbQO994hoCO9UTS Lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1ex87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 14:18:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23MEBvmD035390; Fri, 22 Apr 2022 14:18:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8dnh87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 14:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2GY5AiAzKC2veGjchtZC+Mo4O7QyLPso1suFpKkK1rqe4jGkP5pNZiMpkAaVYv9+/hNkjnbDu6XPGY1MC0IbfvKPabYYI5UbKcoahP9hFHg4VZCrLnyIvC5n5lVzBMZxLTpVT8da2+xTgCoAilx86+uzAebmsugkjH336XeuSsoSlZiJkHDeRSulnFW++geFTX6KoHAZorn4EfPApljDr9YjUrZYbudQLl2tyiXmzQkQPbF2O2osmMMiq+XiiW93Mq60ysZvC/eeMeV/apIBcugtJPl3Ae7/BXlWeKitXPfxGjbAz7qq57D/FiBY7hKSbfDKuEbFCp2IJ9exRiAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjoDgeVgY0j3bn/0seRY3OsuxYOsOFTuWSrLzZNOstU=;
 b=bCaxcnuCY+MbEGolfsPN2l/oLRKh61zti4zV4/LDUcylCjEoTYfEezMD4AhSXn9cu0lA8DIDmDENfhw9qW+5YKoGKP2Wr3xhQ7dntdxbUlR/E8ghKvtXq+LY6cqNI7VgaWBBpGeZqkePR1Gzl35jkZF/0WeIYshOheQfs7F5MKUy913s4KDiZImHu5+iU2xpbuwezJCfLCe2auyEdHHQgIm+UGe54hB6K/5VOpaiCh5S7h/izSZwbNJ6p48Fgac/lzi83RtkTzEZFoQblFeMSsqUytU7myQs5SrFTc/O96BPyvAe7Efs+yyLLZMnGKiLkRguARhEtl5HAeFu7L1dNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjoDgeVgY0j3bn/0seRY3OsuxYOsOFTuWSrLzZNOstU=;
 b=BhTjTNlYFJFDAGdHG+IU/vcyvyQEZVxufVtCWPu7SijE87R2kf8R3Le4B37a0f9Y20QWKwPiwA1RL7w43arHzeX7BRcgytT2XMGtnaOWT6YMfvLJqPESD9Qpx8nN9FsdkFnc2goneBQXD+ZWxVCQzTlIY4J0yvpkkzu4f4PViW8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3788.namprd10.prod.outlook.com (2603:10b6:5:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 14:18:36 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 14:18:36 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 02/17] qdev: unplug blocker for devices
Thread-Topic: [PATCH v8 02/17] qdev: unplug blocker for devices
Thread-Index: AQHYVC5JrV9q9z74wUKuMqTzHen0oKz6d5I0gAAwaACAAMCDRoAAltqA
Date: Fri, 22 Apr 2022 14:18:36 +0000
Message-ID: <831A2553-EC04-40E8-9752-7A7417FC8225@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
 <875yn2qydl.fsf@pond.sub.org>
 <6BAFA4DE-0D88-40EC-92B6-6228460AB927@oracle.com>
 <87a6cdn1az.fsf@pond.sub.org>
In-Reply-To: <87a6cdn1az.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60d57ce5-9970-49d0-01a3-08da246afd97
x-ms-traffictypediagnostic: DM6PR10MB3788:EE_
x-microsoft-antispam-prvs: <DM6PR10MB378816A4750AEF5B73A2CA4D90F79@DM6PR10MB3788.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2IaL+a2URSFJCXJ8szJwaOQrLZ7PS3FamMM27jOloEF9Mtjc++7i5FKgLx7Oe7OkoA0NsBUx/+ngvgJlBfGuw1BHCBhE/b8jOR9gPJPyNRnVEx9frqKDTgGaRQpMux8gdgorxktQ5pZJbL4Ss9HsN9Zq0b9M1Hfe91WZ96qzfZp2f+lODxYiL0kNUuTZqaeF7UemLmqUwxD+fuZ/iNO+5OUAOxXhnm10y7wlBYzlmIBmkpkF+Gb68ELCAdZNBYQLgEael/pjibsUznteZIcXJJT5U/c5jUKsUgrmhnzvumadBAgEnpwKhNG26AC95FOCumiZKSBDr47003NJrHMvM9HT0TQ/diHdJgk2xMJ1Vt17Dfg+pX4MDej/qswXVfKD0ZN7UNt02DStH/1DV12IuPTYT9pLezWITlzT9tFrZKFed49dk5zeEQ0s8XWLdMEFLYjJL9gs4aG8eGIoQVrJbmudHxT2OSCYGWoYFS61gkKzM3u13SmXcCUfRuSUIUFcxyPda3RFr+FRJeETMwX/inrZqkyiqSO5pap0D/4uhkOYMV3Fquc56M2XR30M38hMs0GhM+Y8MFyO17VTa7nJOD3jkawTdDlRsZLtp80uE983drbgKZKQBu/Ay1a8SXLglLTFYkw8uYT1afmPhZM9pp4779le7lskazHJa2O4Mgpk5yIWC/WXLPh/VnepPO+ubzrew5Il48rXQ+vbush65+DUaVU+OBE0WJKmpcWjcO3x7Rfu3YxRxaZFD6zDWWbw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(64756008)(6486002)(2906002)(508600001)(6512007)(66476007)(66446008)(53546011)(8676002)(86362001)(91956017)(44832011)(4326008)(2616005)(8936002)(107886003)(7416002)(5660300002)(186003)(33656002)(6506007)(66556008)(76116006)(83380400001)(38100700002)(54906003)(38070700005)(6916009)(36756003)(316002)(71200400001)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlJZcUQweGpOS3JMYXA4YmVRN0xIVHZCWnE5SWQxelgvUzVUcTR6YmRCRjc5?=
 =?utf-8?B?d040czZ5UWE5R2hLYVlHd0NjYjhlMVhYd25mTWs1cWtXUlpoWWNTVC9zWWtO?=
 =?utf-8?B?Rlg4RmxFbXdnL0pHL3hBdkZ5YVNDUXBjTVJHWk1FM0JIM0x3YmJDeHR5QVpw?=
 =?utf-8?B?TUZnUHk2VFdRbWtmRWhOcDlZL2xKVzJ1eEFFVGR6UWxFVUhUSW1HNzhsTFJq?=
 =?utf-8?B?QnVpZVorSWY3Ulg0TjNpaHRRQTYxM05VakErQzloWURyeWZpUEE4L0lPd3E5?=
 =?utf-8?B?Z3hWaUFvYUhCWVNtS0RoUGpQa2pMdTZRWjV6QTUwNkE3M0d2ejRRdW9qcCtC?=
 =?utf-8?B?dTRTMmNZUUdRNTd3TlovbFRiUWdOUGg3a3JKODlNTFM4U0NudU5Ga0RXVWhS?=
 =?utf-8?B?VUh4RElqclJPUFlzbzNkTHRDU3M1ZW9OVW43N2FTa2JORi92aEIxREE2Vzh4?=
 =?utf-8?B?SFlQdFVrck5rREM2Q0hJWmdORVdkb0ROM3NMcDJ6S0xxaGFNZHkxenRITW1R?=
 =?utf-8?B?aXg0czJPQmxQaHpYU29ZOGJkUDU0RWtMa1pnZkZGVFRpYlZMSDd6MXRQZ3NK?=
 =?utf-8?B?QXh6clRpQzE4L1NSdml4SyswcCt1aGJoV3kydWF2dUJnNGJuenZKVEdEajkw?=
 =?utf-8?B?aGd1U3JjS3B5TjU0dDFtWmVDSmR6ZVBhRHJBMjdOZVZUREFpUU5ycFJyRnN1?=
 =?utf-8?B?UVk3a3VnK0tyeG0yWmpyRUZIV0UzN0k1dkZNV3g5ZjQwUmxORWlsS0NVYXlN?=
 =?utf-8?B?MWVzaUNHQ2t4NzNXSUtXQ1YrUElyRUIwTWZaV3ZNMEF6MFhpOU9RSDBoR3l6?=
 =?utf-8?B?ZHVQbDYrNDlRMHNXSE1ndVJxamdtcXplbFE3UzgyUDQ1QjUzSFVaTFdUM0ZV?=
 =?utf-8?B?cEYyb0ZWZHFWT2p6Y3ppNDB6VkVFUmZHTkxhZUh6d0ZzSU9xSkhYem14czkw?=
 =?utf-8?B?ejd1TnhtWElvbzZIMXhJcVdtVlhtSndUaWVTRklPbHpGd3MyU2c4T3Y0Szlq?=
 =?utf-8?B?ejIyRTVwNC8yNDJkUHJYSzV1a3FnNDVJWE05WE9tV3Vob0xFMXROSjhQRUxs?=
 =?utf-8?B?OWlEdHM2cGRLRHdSak9nSGlMY1ZLTkdKMkdNSE0vNkRQbmh0Z0tPbnN6SWJn?=
 =?utf-8?B?bTMwZDhJZnc0ZWt2WS9kd2tqUmpiZXUrNkhEM1VBRmhBakcwNkZHQ2dWWkUx?=
 =?utf-8?B?cmR5c0FXUTRGOUtubllaUS9EUHlVdUUrYTVHd1lQN1J2Q3kyY0kzZFNVUGFw?=
 =?utf-8?B?eU8zZ0xxMC9JUHRMcENGMGxabXJZQklCeXFXUUgzUUM5aFNLbm90L25WTG1H?=
 =?utf-8?B?TFlOQS8zWUh5dHhhb0tCSFphR2ZEbnF3eEhTRmdXbEF0dTVvOVhYUHdRUUhk?=
 =?utf-8?B?STdQUnFCNW0vN2QzQmYzM1FXazM1eEdnWU1tZFFUWDcxSXdTcjB0RURFUkN2?=
 =?utf-8?B?czlEcnNWM3pUL0Z5SVhrVHl5eDVEcWhXU1MvOGpNVmVZNGQyTFFzdWJIWC9x?=
 =?utf-8?B?RnFrSGhMQStqK2dMWFp0a0NuYlU1b1lyaE1yc0NTWmlZZjRpWUVRbFVrN2Z6?=
 =?utf-8?B?Q1QrUzBISzFUSkFuRWViSTZvU1JzejB5TzcrUDlLQVoxQ2hOQTlFTEJyNHZp?=
 =?utf-8?B?ZWxTTjBlakxsMDJZdFRMVW9IdkxCR2JZdjJCMCtIWXFVMVRJTDJ2K2xaYlVs?=
 =?utf-8?B?aXV4M2wrejFDaVhGV0dpbzdvbVB5cUZUY2ZQcTlLV0lxbFBTUWtYOWQ0U3FQ?=
 =?utf-8?B?cnBSMUFrZE1VWHhCNHptamlxc21HVndZMm9zaUtmMmVDeWUrT2RFaEkwejRW?=
 =?utf-8?B?L21vS1lyeThnMDNobCtIODFjLzViVEk0TTVnVVg0dG96aTc4WjBCN0UxbzhK?=
 =?utf-8?B?Z3JZOWUzMHFJTEU5dytqNHlhSGFTc1poRUJqcWtTWFo0alJ5Nko3ckF3NWky?=
 =?utf-8?B?V2dJUHFZdUs2cWhTOVJUNmx0ZUhQNE80N2MrUzJxL1gzVE8vbXNVY0wxemxU?=
 =?utf-8?B?NG9ZV1BXUjJRZHNkSTZqWFM0ZWpnUktlM1JKOGxQZ0x0djFNZFBOcUFlTDRF?=
 =?utf-8?B?NDRpRUxHMkNPZW92WWxOdm4rZDVKOUhmMUFHS0lWS21HeFZXVm5DaUtVSkls?=
 =?utf-8?B?Z0JuaFJmbnNiTmJwbXp4Vlg1Mk1ReG40TWdrd3l3cEdTNUJqbkZ6WENVY0RZ?=
 =?utf-8?B?dzcveFpweER2TjBuWi8yZFRoWitVZE1JTysrU25Ma1AzVXdEejNJMFg3KzlZ?=
 =?utf-8?B?ZDVlcHY4YUxVaTRvZTRreHplOVhoNHI1eWRrbkNKd3Bka3dJbW5vQnlwOXpQ?=
 =?utf-8?B?djRoaFNKYk1XekF2R0FrSitmYU5ibm5GNFRKVUV6dVp6VE9BN29zY2dhSjBB?=
 =?utf-8?Q?sCV9uVYp5fg895a8noah7cy7YwCESqfv0cJCW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BE6FA2C01907948B81097E05EFA6D7C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d57ce5-9970-49d0-01a3-08da246afd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:18:36.5386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4gFC7xGXZdy+2cnp9/8PhGoZweHDLuh9IgGKdTItM0FmAT4Xm0i0IUK7IuQqgBXtIeEanyepHirJD0MBOcRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3788
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-22_04:2022-04-22,
 2022-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204220063
X-Proofpoint-ORIG-GUID: ndEQ7T0F78gmUHg7Ggz8nDMfuzzL2t8Y
X-Proofpoint-GUID: ndEQ7T0F78gmUHg7Ggz8nDMfuzzL2t8Y
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDIyLCAyMDIyLCBhdCAxOjE4IEFNLCBNYXJrdXMgQXJtYnJ1c3RlciA8YXJt
YnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4gd3JpdGVzOg0KPiANCj4+PiBPbiBBcHIgMjEsIDIwMjIsIGF0IDEwOjU1IEFNLCBNYXJr
dXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEphZ2Fu
bmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JpdGVzOg0KPj4+IA0KPj4+PiBB
ZGQgYmxvY2tlciB0byBwcmV2ZW50IGhvdC11bnBsdWcgb2YgZGV2aWNlcw0KPj4+IA0KPj4+IFdo
eSBkbyB5b3UgbmVlZCB0aGlzPyAgSSdtIG5vdCBkb3VidGluZyB5b3UgZG8sIEkganVzdCB3YW50
IHRvIHJlYWQgeW91cg0KPj4+IHJlYXNvbnMgaGVyZSA6KQ0KPj4gDQo+PiBIaSBNYXJrdXMsIDop
DQo+PiANCj4+IFRoZSB4LXZmaW8tdXNlci1zZXJ2ZXIgZGVwZW5kcyBvbiBhbiBhdHRhY2hlZCBQ
Q0lEZXZpY2UuIEFzIGxvbmcgYXMgeC12ZmlvLXVzZXItc2VydmVyDQo+PiBpcyB1c2VkLCB3ZSBk
b27igJl0IHdhbnQgdGhlIFBDSURldmljZSB0byBiZSB1bnBsdWdnZWQuIFRoaXMgYmxvY2tlciBw
cmV2ZW50cyBhbiB1c2VyDQo+PiBmcm9tIHJlbW92aW5nIFBDSURldmljZSB3aGlsZSB0aGUgdmZp
by11c2VyIHNlcnZlciBpcyBpbiB1c2UuDQo+IA0KPiBQbGVhc2Ugd29yayB0aGF0IGludG8geW91
ciBjb21taXQgbWVzc2FnZS4gIFBlcmhhcHMgYWxvbmcgdGhlIGxpbmVzIG9mDQo+IA0KPiAgICBP
bmUgb2YgdGhlIG5leHQgY29tbWl0cyB3aWxsIGRvIDxzdHVmZj4uICA8YmFkbmVzcz4gd2lsbCBo
YXBwZW4gd2hlbg0KPiAgICB0aGUgUENJIGRldmljZSBpcyB1bnBsdWdnZWQuICBDcmVhdGUgdGhl
IG1lYW5zIHRvIHByZXZlbnQgdGhhdC4NCg0KT0ssIHdpbGwgZG8uDQoNClRoYW5rIHlvdSENCi0t
DQpKYWcNCg0KPiANCj4+Pj4gU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51
ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24g
PGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0
aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IA0KPj4gSSByZWNhbGwgcmVjZWl2
aW5nIGEg4oCcUmV2aWV3ZWQtYnnigJ0gZnJvbSBTdGVmYW4gcHJldmlvdXNseS4NCj4+IA0KPj4g
SeKAmW0gdmVyeSBzb3JyeSBJIGRpZG7igJl0IGFkZCB0aGF0IGhlcmUuIEnigJlsbCBnbyBvdmVy
IGFsbCB0aGUgcGF0Y2hlcyBvbmNlIGFnYWluIHRvIGNvbmZpcm0gdGhhdA0KPj4gdGhlIOKAnFJl
dmlld2VkLWJ54oCdIHN0YXR1cyByZWZsZWN0cyBhY2N1cmF0ZWx5Lg0KPj4gDQo+Pj4+IC0tLQ0K
Pj4+PiBpbmNsdWRlL2h3L3FkZXYtY29yZS5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4+Pj4gaHcvY29yZS9xZGV2LmMgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKw0KPj4+PiBzb2Z0bW11L3FkZXYtbW9uaXRvci5jIHwgIDQgKysrKw0KPj4+PiAzIGZp
bGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2h3L3FkZXYtY29yZS5oIGIvaW5jbHVkZS9ody9xZGV2LWNvcmUuaA0KPj4+PiBpbmRl
eCA5MmMzZDY1MjA4Li4xYjlmYTI1ZTVjIDEwMDY0NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2h3L3Fk
ZXYtY29yZS5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUvaHcvcWRldi1jb3JlLmgNCj4+Pj4gQEAgLTE5
Myw2ICsxOTMsNyBAQCBzdHJ1Y3QgRGV2aWNlU3RhdGUgew0KPj4+PiAgICBpbnQgaW5zdGFuY2Vf
aWRfYWxpYXM7DQo+Pj4+ICAgIGludCBhbGlhc19yZXF1aXJlZF9mb3JfdmVyc2lvbjsNCj4+Pj4g
ICAgUmVzZXR0YWJsZVN0YXRlIHJlc2V0Ow0KPj4+PiArICAgIEdTTGlzdCAqdW5wbHVnX2Jsb2Nr
ZXJzOw0KPj4+PiB9Ow0KPj4+PiANCj4+Pj4gc3RydWN0IERldmljZUxpc3RlbmVyIHsNCj4+Pj4g
QEAgLTQxOSw2ICs0MjAsMzQgQEAgdm9pZCBxZGV2X3NpbXBsZV9kZXZpY2VfdW5wbHVnX2NiKEhv
dHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4+Pj4gdm9pZCBxZGV2X21hY2hpbmVfY3JlYXRp
b25fZG9uZSh2b2lkKTsNCj4+Pj4gYm9vbCBxZGV2X21hY2hpbmVfbW9kaWZpZWQodm9pZCk7DQo+
Pj4+IA0KPj4+PiArLyoNCj4+Pj4gKyAqIHFkZXZfYWRkX3VucGx1Z19ibG9ja2VyOiBBZGRzIGFu
IHVucGx1ZyBibG9ja2VyIHRvIGEgZGV2aWNlDQo+Pj4+ICsgKg0KPj4+PiArICogQGRldjogRGV2
aWNlIHRvIGJlIGJsb2NrZWQgZnJvbSB1bnBsdWcNCj4+Pj4gKyAqIEByZWFzb246IFJlYXNvbiBm
b3IgYmxvY2tpbmcNCj4+Pj4gKyAqLw0KPj4+PiArdm9pZCBxZGV2X2FkZF91bnBsdWdfYmxvY2tl
cihEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqcmVhc29uKTsNCj4+Pj4gKw0KPj4+PiArLyoNCj4+
Pj4gKyAqIHFkZXZfZGVsX3VucGx1Z19ibG9ja2VyOiBSZW1vdmVzIGFuIHVucGx1ZyBibG9ja2Vy
IGZyb20gYSBkZXZpY2UNCj4+Pj4gKyAqDQo+Pj4+ICsgKiBAZGV2OiBEZXZpY2UgdG8gYmUgdW5i
bG9ja2VkDQo+Pj4+ICsgKiBAcmVhc29uOiBQb2ludGVyIHRvIHRoZSBFcnJvciB1c2VkIHdpdGgg
cWRldl9hZGRfdW5wbHVnX2Jsb2NrZXIuDQo+Pj4+ICsgKiAgICAgICAgICBVc2VkIGFzIGEgaGFu
ZGxlIHRvIGxvb2t1cCB0aGUgYmxvY2tlciBmb3IgZGVsZXRpb24uDQo+Pj4+ICsgKi8NCj4+Pj4g
K3ZvaWQgcWRldl9kZWxfdW5wbHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJl
YXNvbik7DQo+Pj4+ICsNCj4+Pj4gKy8qDQo+Pj4+ICsgKiBxZGV2X3VucGx1Z19ibG9ja2VkOiBD
b25maXJtcyBpZiBhIGRldmljZSBpcyBibG9ja2VkIGZyb20gdW5wbHVnDQo+Pj4+ICsgKg0KPj4+
PiArICogQGRldjogRGV2aWNlIHRvIGJlIHRlc3RlZA0KPj4+PiArICogQHJlYXNvbjogUmV0dXJu
cyBvbmUgb2YgdGhlIHJlYXNvbnMgd2h5IHRoZSBkZXZpY2UgaXMgYmxvY2tlZCwNCj4+Pj4gKyAq
ICAgICAgICAgIGlmIGFueQ0KPj4+PiArICoNCj4+Pj4gKyAqIFJldHVybnM6IHRydWUgaWYgZGV2
aWNlIGlzIGJsb2NrZWQgZnJvbSB1bnBsdWcsIGZhbHNlIG90aGVyd2lzZQ0KPj4+PiArICovDQo+
Pj4+ICtib29sIHFkZXZfdW5wbHVnX2Jsb2NrZWQoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKipl
cnJwKTsNCj4+Pj4gKw0KPj4+PiAvKioNCj4+Pj4gKiBHcGlvUG9sYXJpdHk6IFBvbGFyaXR5IG9m
IGEgR1BJTyBsaW5lDQo+Pj4+ICoNCj4+Pj4gZGlmZiAtLWdpdCBhL2h3L2NvcmUvcWRldi5jIGIv
aHcvY29yZS9xZGV2LmMNCj4+Pj4gaW5kZXggODRmMzAxOTQ0MC4uMDgwNmQ4ZmNhYSAxMDA2NDQN
Cj4+Pj4gLS0tIGEvaHcvY29yZS9xZGV2LmMNCj4+Pj4gKysrIGIvaHcvY29yZS9xZGV2LmMNCj4+
Pj4gQEAgLTQ2OCw2ICs0NjgsMjggQEAgY2hhciAqcWRldl9nZXRfZGV2X3BhdGgoRGV2aWNlU3Rh
dGUgKmRldikNCj4+Pj4gICAgcmV0dXJuIE5VTEw7DQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+ICt2b2lk
IHFkZXZfYWRkX3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRlICpkZXYsIEVycm9yICpyZWFzb24p
DQo+Pj4+ICt7DQo+Pj4+ICsgICAgZGV2LT51bnBsdWdfYmxvY2tlcnMgPSBnX3NsaXN0X3ByZXBl
bmQoZGV2LT51bnBsdWdfYmxvY2tlcnMsIHJlYXNvbik7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4g
K3ZvaWQgcWRldl9kZWxfdW5wbHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJl
YXNvbikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBkZXYtPnVucGx1Z19ibG9ja2VycyA9IGdfc2xpc3Rf
cmVtb3ZlKGRldi0+dW5wbHVnX2Jsb2NrZXJzLCByZWFzb24pOw0KPj4+PiArfQ0KPj4+PiArDQo+
Pj4+ICtib29sIHFkZXZfdW5wbHVnX2Jsb2NrZWQoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKipl
cnJwKQ0KPj4+PiArew0KPj4+PiArICAgIEVSUlBfR1VBUkQoKTsNCj4+Pj4gKw0KPj4+PiArICAg
IGlmIChkZXYtPnVucGx1Z19ibG9ja2Vycykgew0KPj4+PiArICAgICAgICBlcnJvcl9wcm9wYWdh
dGUoZXJycCwgZXJyb3JfY29weShkZXYtPnVucGx1Z19ibG9ja2Vycy0+ZGF0YSkpOw0KPj4+PiAr
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXR1
cm4gZmFsc2U7DQo+Pj4+ICt9DQo+Pj4gDQo+Pj4gVGhpcyBjaXRlcyB0aGUgbW9zdCByZWNlbnRs
eSBhZGRlZCBibG9ja2VyIGFzIHJlYXNvbi4gIFlvdXIgZnVuY3Rpb24NCj4+PiBjb21tZW50IGNv
dmVycyBpdDogIlJldHVybnMgb25lIG9mIHRoZSByZWFzb25zIi4gIE9rYXkuDQo+PiANCj4+IEkg
Y291bGQgY2hhbmdlIHRoZSBjb21tZW50IHRvIHNheSB0aGF0IGl0IHJldHVybnMgdGhlIHJlY2Vu
dGx5IGFkZGVkIHJlYXNvbi4NCj4gDQo+IFVwIHRvIHlvdS4NCj4gDQoNCg==

