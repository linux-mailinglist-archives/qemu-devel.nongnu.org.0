Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FF49560E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:44:03 +0100 (CET)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfDu-0002vn-2h
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAZFP-0003Ik-5l
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:21:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAZFL-00047A-1T
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:21:10 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20KEam6x008546; 
 Thu, 20 Jan 2022 15:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=DRvFD/a2tnW2YoZ/ALUIRS+cdgHz4nK1wm5AyCcQN6s=;
 b=yZPYAfHzbMPxzNnDXKV9Fv/VkrLdJOwrdetg2hduLP2m//jfs0/lgVGroF5mszMQoJyy
 CWHpbgsZKokUwPIJ2oivE5td7Mrfk8MY1ZjrAZ0kUwIM+c++Ch27cQN10LqiWbhUvQHX
 UuAgQlsyQ4QNw/Xud7JB31u4MY/mNzFNVFJfnvYT+nsa1pQeIRfkuug2xUk6k5C2pVKv
 WkwJp8LZYs0Em9cetO+5/E+PKkn6MWmyAGMVhZ5l1C9P0tq9noikeIxK/8WORMPDwZf0
 rJMlGfTJ3OxVU3nYlRAxddDZmVz7HoCF3C0NomYOmBUZpONbdOBqdkd46KyBRyVZ8gS2 qA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc51g99s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 15:20:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KF6gVJ060573;
 Thu, 20 Jan 2022 15:20:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3030.oracle.com with ESMTP id 3dkkd2egpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 15:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEUSZ0E6t3gRxlKwTM4Q2I2BRcNiMuSCgt4q+Wk9hTKNRMGWcMY3if5w4qQWWhxhMGUbRVb0WP6S7+yFrZ+dUPoYKOdnUHabqFqdbT6SK4vXeCrL4AnaRr2+h9yY/3k5ipVF1NBBihv0QJ59fIWUJ1JYvusJ759tFlrz399E6pUzFpZFfVM2Bs7i/cArdxLK+sz5ANt5DzPjYKcd00l1wBriTcK8pKWHPOODVomehifeMxBPrQfW3EEnILcPUchKI6iQkZ56zjLJdRlgXzh98eOX0FYni5HBH+ae8RJ70kuRIzy6svBlL8Ox29dVDj5NblLQc4M0jOifxtF7Tz/BmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRvFD/a2tnW2YoZ/ALUIRS+cdgHz4nK1wm5AyCcQN6s=;
 b=P4/FJQ5S2HjDQ8eZQiDZX3o6MGv+7sYPqXb/Iik/Ie7srW1YloakW8lYRZCxvRjoF5xzKNksrsAPDFcZDUowLNXrzvjrzyNXS28bpvfP3jE5JbXxs0E6aue6Nfl6/ypC3q+1seKoByy8duYeZmRmmKwgI07nD06tjRGOv9I5j/WJ/OhSIbPREvC0TTdZlVJT/JHLNbtpGCaQCJzoRt+Fujpn36ZHfMxmL4x1yiDwB+PXT/0OELgi0FdELi6rwPBMo+BGjG+tZBxiRHcTxBa/L1L0SZe5yOG4q1uukhRTf2/R8+x3/TXSaLOkrmGYqVbH0DIflbiDjRZEkcRAPVYKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRvFD/a2tnW2YoZ/ALUIRS+cdgHz4nK1wm5AyCcQN6s=;
 b=Ynwkewk0bFw3wQMverpTuYaxMvN2JJVsUFWr0UlQdFBL3eg+RBl/RDrLPFRRT0HmiaeYr97vxIk0MQqNoiXufps+SYoRZxMnijEMXk7YeVDbZmtQRZFTXOub+qxV5CrMN10gmM38RMMfKjTIElULeC94dhf8h6xBimf85IC4ol8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA2PR10MB4682.namprd10.prod.outlook.com (2603:10b6:806:110::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 15:20:55 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 15:20:54 +0000
From: Jag Raman <jag.raman@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YA=
Date: Thu, 20 Jan 2022 15:20:54 +0000
Message-ID: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220119190742-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62910d52-3d07-4580-9149-08d9dc2873d6
x-ms-traffictypediagnostic: SA2PR10MB4682:EE_
x-microsoft-antispam-prvs: <SA2PR10MB4682393EE4584E7EAB37AD68905A9@SA2PR10MB4682.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AayN6C9HWADjsYUmJPI6KbD59EA4fwd1mcv8QyoNAZTYNNTOAl9Q/5DU0m4SHh8qSThx4GS9HzA3Y4HMzKly4AlmJzndaGuo2fKJyIxLJJfN9QrY9eQhZ6Ha9NMc33kefacCCzyWL/t9IB7SQo4HngtpoPmsGlXJrvZTRcnHfdUEatKSi7wja3Yb7DmkJrQ3FzjC73U5ehWSNw9Z5S77WkaDc4365ABtufEfMNmF5+IUCyhApKvJIwBp9TQz3sLfx4lwGztgnN7twDD+bWdzpILU9nj/pwJ7KpStV34PZ3APpkCl2mq2vLHBibYCcBWHYNwha6tR9zu6dfkVYR6PLQzet4+nQgU4NMzJY7ehcFxPcEo6HbGrX2+URIxLUqNG5UkYjnjGL1q0L35WQ1067tMa1VYj5UNfmii2OCIyh5VscmFXAVucIrPcimPWvPVG1iOmbq7FP4EayiBzjrlwrd12L/qn60COe0532cFLQJxminPUwbD906sAnsb/n7ezzeNTytDTtP9fBR24MYIPjccOLHhhE6geq9mvBFhWvxGrFrYDhk4rd4ngtZCLg0LCRSGTRkmKkOv9MDZgL9t9ttvlB5IoAwPl/yBbEfnwPKWfp36qq/nKa2NdzZ0ozYT30PTvMF8SCFRFNJZMYCEimhqzCNxkoUC+zgXcKXZSG7jlLB1kH7t5cgkcznkEya3HTNH138ujb/LLopX1ggUUanyv0Mw2d17+5v4yvsbHCYg7/rQijw0Z20KeGqChN3dTtLdxTxM4+YFEl2chjAeVBBrnybQExj3YWxW9P9NTFO9oSEIpZZBN0YrSbE51+uZY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(6486002)(4326008)(186003)(5660300002)(53546011)(44832011)(66476007)(66946007)(316002)(64756008)(66556008)(66446008)(6916009)(508600001)(38070700005)(6512007)(36756003)(76116006)(6506007)(86362001)(8676002)(83380400001)(38100700002)(33656002)(2616005)(122000001)(7416002)(2906002)(8936002)(966005)(54906003)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDY1bXRCeVl1MWRWT0hkKzlkMXZtUUl0eGl0UEQybFVFN3ptNUpMWFlmWUxG?=
 =?utf-8?B?Rzd2Q3RVdnpBUlA1akd6T2phcnVQYTBUOEQ0TUp3NW92RUp3WWlDYXpyelc0?=
 =?utf-8?B?Vlh0RGdHQU11aHhRcE1nTDhWckhJUTB2dU5NdUJSMFZ4ci80S0ZhdUQ3UVZB?=
 =?utf-8?B?Rk9mbUZ2RzU5dUVhd0JreUJrVFlBS3VTZ2NZaUFkcU85bjJMeUpmcVI5TjBJ?=
 =?utf-8?B?RHkrdXJvK29lR3dXRnM2OVRLZjhXT1d5NTRPQ0QyZmpjaWRBNEFmeVVrZlpR?=
 =?utf-8?B?Vzh6dXNDc3JpT2lkNHdrTEtOWFF0dklOUldmSWFvTkZ1OUJObGdlYllPUlNU?=
 =?utf-8?B?VGtwcTlMdExDbmNYWmdlRXpjODd2VEliTWFVVk5kQWdwdTJUTHNzbUV5ZWg1?=
 =?utf-8?B?bTdxSjdnUmh4bzU1SHViNW9WdWhVWXp5SE5BVG1YamZMVmJzYW1yS0w5WmJF?=
 =?utf-8?B?cmR2K3NhZlpVUGRSTFJpVEpOUDRtdXA5eWcvOElmNXNBaW1acUZkUVBjdk9t?=
 =?utf-8?B?WnJoL3hpb3JDL1krQ1FZMU5EV1lUMTdnL3dyeHA3RHNZb0ZESHkvYndNT0Fi?=
 =?utf-8?B?Sis0SStqd0pmMWQwTkFNRzF1ZUJQZEtxemxjdHNwL0JYaDF3NWNOY2Rnd1h5?=
 =?utf-8?B?VVZvZjd5NDdVT2FxRWc2MWxOMEl5RUFUQ0o1aWFlalZQbzFWSkc0SFNBMVpH?=
 =?utf-8?B?cmNXbHFkV2swMmxhVHc2TitzdHNjcVhWeVdETHRrTW9GM2dEM2pmYUhXRFda?=
 =?utf-8?B?Uy9qRnZKa1BqN3Fsb3llRXBNYWhiVUxTM3BLcDVuUFphNVNRTm9CQVBXdEc3?=
 =?utf-8?B?ZU5qemdLRWhISXFhUjBZcGwwLy9vL0lFMTBzZXZseUtONThuclByZDV1bXlw?=
 =?utf-8?B?RkMxWEc1UjdwSnJPUnV5dmxDYlpnNHM1UExLVngwYVdhRVRtSWxOaVQ2c2c4?=
 =?utf-8?B?RFd3OWFSZWFZdU8vNlZnTVNWdHljaVlmNzhNaGJBVW42amE5dmhSTjVRTkJz?=
 =?utf-8?B?dlJ3NnBrUk94RjFCbXVHUFQxcmtWRDlCWm1KMGRJSXhjS0pGR0hVQTF2WG05?=
 =?utf-8?B?OCsrVVYrQzd6ZVNmaW15QktOeDlzaUFhTjEzS1V1Y3RHTUR3aUdrRGl1OUxn?=
 =?utf-8?B?R2ljYS9udDN3YmVzbnh6UXhlNEhXS08wTkxoR0pEeXh6ZnVRM0YrYWRYaDJ5?=
 =?utf-8?B?dmNuV1lEVU5WNVRwenRQUHYrNmNrY3dRd29UNnlxREVnMUpiZkVQWisyU1hu?=
 =?utf-8?B?eVBlSHFGczdtTElHblRsUzAySys1c21wcGpzSXFxbXJhdTR2bWEzTTFnQ3o2?=
 =?utf-8?B?MytYMDU2Syt6QThZOWRnZFUxTVpCcUpoOWVvY1VtZ2ZZVmpOU1JyQmNHb0dQ?=
 =?utf-8?B?Wm4wV0oraDczRFpaU2pDbzdrTFlaMU5KaitadWRTVEFMNlVDenNpOXJFZUhY?=
 =?utf-8?B?blVuWUIraWdFL0Zaa0U4V3dxZzcwL3BKQzNvTkw0aUdRSlQxcjdsTXhWMkxo?=
 =?utf-8?B?bWZCNjVRNmtZajFVQTE0V1QyWS9MemUyN2ZBMmxYZC96VGk5RUZqUUU3THR6?=
 =?utf-8?B?RUxUU3llaklBdXdJQ2FMOUZEcHpxWTZiVHRHUWh5MDhuMDFlSDl6TDJKbko1?=
 =?utf-8?B?U1NzeFZLNXNwdTlFZjhleW41WFMxcnQzQllBQURVSkNBdU1RSi9HOFl1U0RJ?=
 =?utf-8?B?MGFTWHJibGJJUVJOREZmWktHQjFJOXZIU1Q1cDcrKzdrd2JKMmZLNm11NTNm?=
 =?utf-8?B?MGNzbVN3b1ZLQVZDT1dCdVVMc2Q1KzlVaDlYbkIyY3VDUGc0Wk9PelFBZHdJ?=
 =?utf-8?B?U0p3UGlXVnYxTWVuVkw1Z0NwVytOV25XZUZSbDZGaWkrVkJlSnFIN2JIV1Zz?=
 =?utf-8?B?T0oxQmYyUkhrQXQ5aWVkZDh5aXdiWWZzbnFDTVl3TDZZNmNIbVJQR2tQMFV3?=
 =?utf-8?B?Rm1abGswSTFramFSN2EwVWRkcXRNRjRtSk9nOFdlMXZlcm0vNXo1cGtDQzln?=
 =?utf-8?B?bkRBOEVTajEwZEJpeGdSZmtxeU1iMUFvV1dPRkp6WEk3VGlmUEhVb2dFQmdz?=
 =?utf-8?B?V1JxWTlSVVFvMlIzT0VxVWdubUI1Nm5tWTVhTWtlalZPc3ZSWGlwVkV5akEv?=
 =?utf-8?B?Z29aanB0ZVFFSC9OekZBaXBKd3dmY1ZiWjVrRjh0Uk14U05rTmNROEtNdkVx?=
 =?utf-8?B?elVzb05PU2ZmN1E5cVhmR0tBR1l5WkJVcWxEKzNYZUlNQlhtdGVZeU9EaW1T?=
 =?utf-8?B?U0lrbElHa0g2Y3RLcEh1bjQyQ2NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEB26ECCB397C349B890332965A7BD92@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62910d52-3d07-4580-9149-08d9dc2873d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 15:20:54.8630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O86aznijzfBlfp5kTV490Vrh960nTJrlduiqVOPpZJ5SQo82YLQERFmkt+M9nV3iuFwnezxDePRlDopjGSMKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4682
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200080
X-Proofpoint-GUID: 5adOLMzYnq-ECSFPiBJklzpDxcjyFv4K
X-Proofpoint-ORIG-GUID: 5adOLMzYnq-ECSFPiBJklzpDxcjyFv4K
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDE5LCAyMDIyLCBhdCA3OjEyIFBNLCBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgSmFuIDE5LCAyMDIyIGF0IDA0OjQx
OjUyUE0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gQWxsb3cgUENJIGJ1c2Vz
IHRvIGJlIHBhcnQgb2YgaXNvbGF0ZWQgQ1BVIGFkZHJlc3Mgc3BhY2VzLiBUaGlzIGhhcyBhDQo+
PiBuaWNoZSB1c2FnZS4NCj4+IA0KPj4gVFlQRV9SRU1PVEVfTUFDSElORSBhbGxvd3MgbXVsdGlw
bGUgVk1zIHRvIGhvdXNlIHRoZWlyIFBDSSBkZXZpY2VzIGluDQo+PiB0aGUgc2FtZSBtYWNoaW5l
L3NlcnZlci4gVGhpcyB3b3VsZCBjYXVzZSBhZGRyZXNzIHNwYWNlIGNvbGxpc2lvbiBhcw0KPj4g
d2VsbCBhcyBiZSBhIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdHkuIEhhdmluZyBzZXBhcmF0ZSBhZGRy
ZXNzIHNwYWNlcyBmb3INCj4+IGVhY2ggUENJIGJ1cyB3b3VsZCBzb2x2ZSB0aGlzIHByb2JsZW0u
DQo+IA0KPiBGYXNjaW5hdGluZywgYnV0IEkgYW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kLiBhbnkg
ZXhhbXBsZXM/DQoNCkhpIE1pY2hhZWwhDQoNCm11bHRpcHJvY2VzcyBRRU1VIGFuZCB2ZmlvLXVz
ZXIgaW1wbGVtZW50IGEgY2xpZW50LXNlcnZlciBtb2RlbCB0byBhbGxvdw0Kb3V0LW9mLXByb2Nl
c3MgZW11bGF0aW9uIG9mIGRldmljZXMuIFRoZSBjbGllbnQgUUVNVSwgd2hpY2ggbWFrZXMgaW9j
dGxzDQp0byB0aGUga2VybmVsIGFuZCBydW5zIFZDUFVzLCBjb3VsZCBhdHRhY2ggZGV2aWNlcyBy
dW5uaW5nIGluIGEgc2VydmVyDQpRRU1VLiBUaGUgc2VydmVyIFFFTVUgbmVlZHMgYWNjZXNzIHRv
IHBhcnRzIG9mIHRoZSBjbGllbnTigJlzIFJBTSB0bw0KcGVyZm9ybSBETUEuDQoNCkluIHRoZSBj
YXNlIHdoZXJlIG11bHRpcGxlIGNsaWVudHMgYXR0YWNoIGRldmljZXMgdGhhdCBhcmUgcnVubmlu
ZyBvbiB0aGUNCnNhbWUgc2VydmVyLCB3ZSBuZWVkIHRvIGVuc3VyZSB0aGF0IGVhY2ggZGV2aWNl
cyBoYXMgaXNvbGF0ZWQgbWVtb3J5DQpyYW5nZXMuIFRoaXMgZW5zdXJlcyB0aGF0IHRoZSBtZW1v
cnkgc3BhY2Ugb2Ygb25lIGRldmljZSBpcyBub3QgdmlzaWJsZQ0KdG8gb3RoZXIgZGV2aWNlcyBp
biB0aGUgc2FtZSBzZXJ2ZXIuDQogDQo+IA0KPiBJIGFsc28gd29uZGVyIHdoZXRoZXIgdGhpcyBz
cGVjaWFsIHR5cGUgY291bGQgYmUgbW9kZWxsZWQgbGlrZSBhIHNwZWNpYWwNCj4ga2luZCBvZiBp
b21tdSBpbnRlcm5hbGx5Lg0KDQpDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBtb3JlIGRl
dGFpbHMgb24gdGhlIGRlc2lnbj8NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10
c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaW5j
bHVkZS9ody9wY2kvcGNpLmggICAgIHwgIDIgKysNCj4+IGluY2x1ZGUvaHcvcGNpL3BjaV9idXMu
aCB8IDE3ICsrKysrKysrKysrKysrKysrDQo+PiBody9wY2kvcGNpLmMgICAgICAgICAgICAgfCAx
NyArKysrKysrKysrKysrKysrKw0KPj4gaHcvcGNpL3BjaV9icmlkZ2UuYyAgICAgIHwgIDUgKysr
KysNCj4+IDQgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpLmggYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gaW5k
ZXggMDIzYWJjMGY3OS4uOWJiNDQ3MmFiYyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvcGNp
L3BjaS5oDQo+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gQEAgLTM4Nyw2ICszODcs
OCBAQCB2b2lkIHBjaV9kZXZpY2Vfc2F2ZShQQ0lEZXZpY2UgKnMsIFFFTVVGaWxlICpmKTsNCj4+
IGludCBwY2lfZGV2aWNlX2xvYWQoUENJRGV2aWNlICpzLCBRRU1VRmlsZSAqZik7DQo+PiBNZW1v
cnlSZWdpb24gKnBjaV9hZGRyZXNzX3NwYWNlKFBDSURldmljZSAqZGV2KTsNCj4+IE1lbW9yeVJl
Z2lvbiAqcGNpX2FkZHJlc3Nfc3BhY2VfaW8oUENJRGV2aWNlICpkZXYpOw0KPj4gK0FkZHJlc3NT
cGFjZSAqcGNpX2lzb2xfYXNfbWVtKFBDSURldmljZSAqZGV2KTsNCj4+ICtBZGRyZXNzU3BhY2Ug
KnBjaV9pc29sX2FzX2lvKFBDSURldmljZSAqZGV2KTsNCj4+IA0KPj4gLyoNCj4+ICAqIFNob3Vs
ZCBub3Qgbm9ybWFsbHkgYmUgdXNlZCBieSBkZXZpY2VzLiBGb3IgdXNlIGJ5IHNQQVBSIHRhcmdl
dA0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcGNpL3BjaV9idXMuaCBiL2luY2x1ZGUvaHcv
cGNpL3BjaV9idXMuaA0KPj4gaW5kZXggMzQ3NDQwZDQyYy4uZDc4MjU4ZTc5ZSAxMDA2NDQNCj4+
IC0tLSBhL2luY2x1ZGUvaHcvcGNpL3BjaV9idXMuaA0KPj4gKysrIGIvaW5jbHVkZS9ody9wY2kv
cGNpX2J1cy5oDQo+PiBAQCAtMzksOSArMzksMjYgQEAgc3RydWN0IFBDSUJ1cyB7DQo+PiAgICAg
dm9pZCAqaXJxX29wYXF1ZTsNCj4+ICAgICBQQ0lEZXZpY2UgKmRldmljZXNbUENJX1NMT1RfTUFY
ICogUENJX0ZVTkNfTUFYXTsNCj4+ICAgICBQQ0lEZXZpY2UgKnBhcmVudF9kZXY7DQo+PiArDQo+
PiAgICAgTWVtb3J5UmVnaW9uICphZGRyZXNzX3NwYWNlX21lbTsNCj4+ICAgICBNZW1vcnlSZWdp
b24gKmFkZHJlc3Nfc3BhY2VfaW87DQo+PiANCj4+ICsgICAgLyoqDQo+PiArICAgICAqIElzb2xh
dGVkIGFkZHJlc3Mgc3BhY2VzIC0gdGhlc2UgYWxsb3cgdGhlIFBDSSBidXMgdG8gYmUgcGFydA0K
Pj4gKyAgICAgKiBvZiBhbiBpc29sYXRlZCBhZGRyZXNzIHNwYWNlIGFzIG9wcG9zZWQgdG8gdGhl
IGdsb2JhbA0KPj4gKyAgICAgKiBhZGRyZXNzX3NwYWNlX21lbW9yeSAmIGFkZHJlc3Nfc3BhY2Vf
aW8uDQo+IA0KPiBBcmUgeW91IHN1cmUgYWRkcmVzc19zcGFjZV9tZW1vcnkgJiBhZGRyZXNzX3Nw
YWNlX2lvIGFyZQ0KPiBhbHdheXMgZ2xvYmFsPyBldmVuIGluIHRoZSBjYXNlIG9mIGFuIGlvbW11
Pw0KDQpPbiB0aGUgQ1BVIHNpZGUgb2YgdGhlIFJvb3QgQ29tcGxleCwgSSBiZWxpZXZlIGFkZHJl
c3Nfc3BhY2VfbWVtb3J5DQomIGFkZHJlc3Nfc3BhY2VfaW8gYXJlIGdsb2JhbC4NCg0KSW4gdGhl
IHZmaW8tdXNlciBjYXNlLCBkZXZpY2VzIG9uIHRoZSBzYW1lIG1hY2hpbmUgKFRZUEVfUkVNT1RF
X01BQ0hJTkUpDQpjb3VsZCBiZSBhdHRhY2hlZCB0byBkaWZmZXJlbnQgY2xpZW50cyBWTXMuIEVh
Y2ggY2xpZW50IHdvdWxkIGhhdmUgdGhlaXIgb3duIGFkZHJlc3MNCnNwYWNlIGZvciB0aGVpciBD
UFVzLiBXaXRoIGlzb2xhdGVkIGFkZHJlc3Mgc3BhY2VzLCB3ZSBlbnN1cmUgdGhhdCB0aGUgZGV2
aWNlcw0Kc2VlIHRoZSBhZGRyZXNzIHNwYWNlIG9mIHRoZSBDUFVzIHRoZXnigJlyZSBhdHRhY2hl
ZCB0by4NCg0KTm90IHN1cmUgaWYgaXTigJlzIE9LIHRvIHNoYXJlIHdlYmxpbmtzIGluIHRoaXMg
bWFpbGluZyBsaXN0LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdOKAmXMNCm5vdCBwcmVmZXJy
ZWQuIEJ1dCBJ4oCZbSByZWZlcnJpbmcgdG8gdGhlIHRlcm1pbm9sb2d5IHVzZWQgaW4gdGhlIGZv
bGxvd2luZyBibG9jayBkaWFncmFtOg0KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUm9v
dF9jb21wbGV4Iy9tZWRpYS9GaWxlOkV4YW1wbGVfUENJX0V4cHJlc3NfVG9wb2xvZ3kuc3ZnDQoN
Cj4gDQo+PiBUaGlzIGFsbG93cyB0aGUNCj4+ICsgICAgICogYnVzIHRvIGJlIGF0dGFjaGVkIHRv
IENQVXMgZnJvbSBkaWZmZXJlbnQgbWFjaGluZXMuIFRoZQ0KPj4gKyAgICAgKiBmb2xsb3dpbmcg
aXMgbm90IHVzZWQgdXNlZCBjb21tb25seS4NCj4+ICsgICAgICoNCj4+ICsgICAgICogVFlQRV9S
RU1PVEVfTUFDSElORSBhbGxvd3MgZW11bGF0aW5nIGRldmljZXMgZnJvbSBtdWx0aXBsZQ0KPj4g
KyAgICAgKiBWTSBjbGllbnRzLA0KPiANCj4gd2hhdCBhcmUgVk0gY2xpZW50cz8NCg0KSXTigJlz
IHRoZSBjbGllbnQgaW4gdGhlIGNsaWVudCAtIHNlcnZlciBtb2RlbCBleHBsYWluZWQgYWJvdmUu
DQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4+IGFzIHN1Y2ggaXQgbmVlZHMgdGhlIFBD
SSBidXNlcyBpbiB0aGUgc2FtZSBtYWNoaW5lDQo+PiArICAgICAqIHRvIGJlIHBhcnQgb2YgZGlm
ZmVyZW50IENQVSBhZGRyZXNzIHNwYWNlcy4gVGhlIGZvbGxvd2luZyBpcw0KPj4gKyAgICAgKiB1
c2VmdWwgaW4gdGhhdCBzY2VuYXJpby4NCj4+ICsgICAgICoNCj4+ICsgICAgICovDQo+PiArICAg
IEFkZHJlc3NTcGFjZSAqaXNvbF9hc19tZW07DQo+PiArICAgIEFkZHJlc3NTcGFjZSAqaXNvbF9h
c19pbzsNCj4+ICsNCj4+ICAgICBRTElTVF9IRUFEKCwgUENJQnVzKSBjaGlsZDsgLyogdGhpcyB3
aWxsIGJlIHJlcGxhY2VkIGJ5IHFkZXYgbGF0ZXIgKi8NCj4+ICAgICBRTElTVF9FTlRSWShQQ0lC
dXMpIHNpYmxpbmc7LyogdGhpcyB3aWxsIGJlIHJlcGxhY2VkIGJ5IHFkZXYgbGF0ZXIgKi8NCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3BjaS9wY2kuYyBiL2h3L3BjaS9wY2kuYw0KPj4gaW5kZXgg
NWQzMGY5Y2E2MC4uZDVmMWM2YzQyMSAxMDA2NDQNCj4+IC0tLSBhL2h3L3BjaS9wY2kuYw0KPj4g
KysrIGIvaHcvcGNpL3BjaS5jDQo+PiBAQCAtNDQyLDYgKzQ0Miw4IEBAIHN0YXRpYyB2b2lkIHBj
aV9yb290X2J1c19pbnRlcm5hbF9pbml0KFBDSUJ1cyAqYnVzLCBEZXZpY2VTdGF0ZSAqcGFyZW50
LA0KPj4gICAgIGJ1cy0+c2xvdF9yZXNlcnZlZF9tYXNrID0gMHgwOw0KPj4gICAgIGJ1cy0+YWRk
cmVzc19zcGFjZV9tZW0gPSBhZGRyZXNzX3NwYWNlX21lbTsNCj4+ICAgICBidXMtPmFkZHJlc3Nf
c3BhY2VfaW8gPSBhZGRyZXNzX3NwYWNlX2lvOw0KPj4gKyAgICBidXMtPmlzb2xfYXNfbWVtID0g
TlVMTDsNCj4+ICsgICAgYnVzLT5pc29sX2FzX2lvID0gTlVMTDsNCj4+ICAgICBidXMtPmZsYWdz
IHw9IFBDSV9CVVNfSVNfUk9PVDsNCj4+IA0KPj4gICAgIC8qIGhvc3QgYnJpZGdlICovDQo+PiBA
QCAtMjY3Niw2ICsyNjc4LDE2IEBAIE1lbW9yeVJlZ2lvbiAqcGNpX2FkZHJlc3Nfc3BhY2VfaW8o
UENJRGV2aWNlICpkZXYpDQo+PiAgICAgcmV0dXJuIHBjaV9nZXRfYnVzKGRldiktPmFkZHJlc3Nf
c3BhY2VfaW87DQo+PiB9DQo+PiANCj4+ICtBZGRyZXNzU3BhY2UgKnBjaV9pc29sX2FzX21lbShQ
Q0lEZXZpY2UgKmRldikNCj4+ICt7DQo+PiArICAgIHJldHVybiBwY2lfZ2V0X2J1cyhkZXYpLT5p
c29sX2FzX21lbTsNCj4+ICt9DQo+PiArDQo+PiArQWRkcmVzc1NwYWNlICpwY2lfaXNvbF9hc19p
byhQQ0lEZXZpY2UgKmRldikNCj4+ICt7DQo+PiArICAgIHJldHVybiBwY2lfZ2V0X2J1cyhkZXYp
LT5pc29sX2FzX2lvOw0KPj4gK30NCj4+ICsNCj4+IHN0YXRpYyB2b2lkIHBjaV9kZXZpY2VfY2xh
c3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+PiB7DQo+PiAgICAgRGV2
aWNlQ2xhc3MgKmsgPSBERVZJQ0VfQ0xBU1Moa2xhc3MpOw0KPj4gQEAgLTI2OTksNiArMjcxMSw3
IEBAIHN0YXRpYyB2b2lkIHBjaV9kZXZpY2VfY2xhc3NfYmFzZV9pbml0KE9iamVjdENsYXNzICpr
bGFzcywgdm9pZCAqZGF0YSkNCj4+IA0KPj4gQWRkcmVzc1NwYWNlICpwY2lfZGV2aWNlX2lvbW11
X2FkZHJlc3Nfc3BhY2UoUENJRGV2aWNlICpkZXYpDQo+PiB7DQo+PiArICAgIEFkZHJlc3NTcGFj
ZSAqaW9tbXVfYXMgPSBOVUxMOw0KPj4gICAgIFBDSUJ1cyAqYnVzID0gcGNpX2dldF9idXMoZGV2
KTsNCj4+ICAgICBQQ0lCdXMgKmlvbW11X2J1cyA9IGJ1czsNCj4+ICAgICB1aW50OF90IGRldmZu
ID0gZGV2LT5kZXZmbjsNCj4+IEBAIC0yNzQ1LDYgKzI3NTgsMTAgQEAgQWRkcmVzc1NwYWNlICpw
Y2lfZGV2aWNlX2lvbW11X2FkZHJlc3Nfc3BhY2UoUENJRGV2aWNlICpkZXYpDQo+PiAgICAgaWYg
KCFwY2lfYnVzX2J5cGFzc19pb21tdShidXMpICYmIGlvbW11X2J1cyAmJiBpb21tdV9idXMtPmlv
bW11X2ZuKSB7DQo+PiAgICAgICAgIHJldHVybiBpb21tdV9idXMtPmlvbW11X2ZuKGJ1cywgaW9t
bXVfYnVzLT5pb21tdV9vcGFxdWUsIGRldmZuKTsNCj4+ICAgICB9DQo+PiArICAgIGlvbW11X2Fz
ID0gcGNpX2lzb2xfYXNfbWVtKGRldik7DQo+PiArICAgIGlmIChpb21tdV9hcykgew0KPj4gKyAg
ICAgICAgcmV0dXJuIGlvbW11X2FzOw0KPj4gKyAgICB9DQo+PiAgICAgcmV0dXJuICZhZGRyZXNz
X3NwYWNlX21lbW9yeTsNCj4+IH0NCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3BjaS9wY2lfYnJp
ZGdlLmMgYi9ody9wY2kvcGNpX2JyaWRnZS5jDQo+PiBpbmRleCBkYTM0YzhlYmNkLi45ODM2Njc2
OGQyIDEwMDY0NA0KPj4gLS0tIGEvaHcvcGNpL3BjaV9icmlkZ2UuYw0KPj4gKysrIGIvaHcvcGNp
L3BjaV9icmlkZ2UuYw0KPj4gQEAgLTM4Myw2ICszODMsMTEgQEAgdm9pZCBwY2lfYnJpZGdlX2lu
aXRmbihQQ0lEZXZpY2UgKmRldiwgY29uc3QgY2hhciAqdHlwZW5hbWUpDQo+PiAgICAgc2VjX2J1
cy0+YWRkcmVzc19zcGFjZV9pbyA9ICZici0+YWRkcmVzc19zcGFjZV9pbzsNCj4+ICAgICBtZW1v
cnlfcmVnaW9uX2luaXQoJmJyLT5hZGRyZXNzX3NwYWNlX2lvLCBPQkpFQ1QoYnIpLCAicGNpX2Jy
aWRnZV9pbyIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgIDQgKiBHaUIpOw0KPj4gKw0KPj4g
KyAgICAvKiBUaGlzIFBDSSBicmlkZ2UgcHV0cyB0aGUgc2VjX2J1cyBpbiBpdHMgcGFyZW50J3Mg
YWRkcmVzcyBzcGFjZSAqLw0KPj4gKyAgICBzZWNfYnVzLT5pc29sX2FzX21lbSA9IHBjaV9pc29s
X2FzX21lbShkZXYpOw0KPj4gKyAgICBzZWNfYnVzLT5pc29sX2FzX2lvID0gcGNpX2lzb2xfYXNf
aW8oZGV2KTsNCj4+ICsNCj4+ICAgICBici0+d2luZG93cyA9IHBjaV9icmlkZ2VfcmVnaW9uX2lu
aXQoYnIpOw0KPj4gICAgIFFMSVNUX0lOSVQoJnNlY19idXMtPmNoaWxkKTsNCj4+ICAgICBRTElT
VF9JTlNFUlRfSEVBRCgmcGFyZW50LT5jaGlsZCwgc2VjX2J1cywgc2libGluZyk7DQo+PiAtLSAN
Cj4+IDIuMjAuMQ0KDQo=

