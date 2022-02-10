Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADFB4B017F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 01:13:53 +0100 (CET)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHx5r-0008RI-OH
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 19:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nHx10-000715-7s
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:08:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nHx0w-0000F8-RF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:08:49 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219KSAk1020152; 
 Thu, 10 Feb 2022 00:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=v/wNZ3oZXsMpwHefxtbu7O2SjcrMy0v2aPgLmhWPAzU=;
 b=n9zxgwli7yiGRfKa12KXMRBkiSN7tSaLFaf8H70cIqjR4WdRi9Q9xpPcLrZuIuMWVc2u
 yBxd5tLHfQdDkqaOjmCTHD22xeEBihw+yz9KhijccfwQF8g2mgdFysJzrirZHiHkqb2P
 YB9JyIpzQCLsxZBg2ZMVyCwHjuI0eow7+BgJThM65bjOUaTjhqCUE38VdIt8gxBmCE1f
 C579jbSSXRBouWCO2NQNCzAo0pB4ra+ch+VRXSbqitjX4aUVT3nBgbOn2XgVbLnsqt5D
 3acEjrTp9/5r5/gglaTZYw0ACaxvSFMsgZVhO16q8Q1Q+U9RXy6RAn8XIu2XrGaiuCO/ WA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e366wyfkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 00:08:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21A01dkB142598;
 Thu, 10 Feb 2022 00:08:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by aserp3020.oracle.com with ESMTP id 3e1h296m9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 00:08:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKNG9lyoNGEzoiXc0Fo+gSkAdR2W33d5J7pPUQUtvXwv3+mnV5MqtV19Yvw970ALKfmGgQpFMez03fESUHMs24jgkHo2tP2MDgrkjkm1xL3U6SkRZuJKqOT6VnsGenTmmWc2i0hE/Uiq6g/g81OydtF+u+5+LiTaX0CitpRkmTaFRVYcePJOkrdg6sct6POMY+jnvgKO/74KEoObIf/HpMFq5xMUGnr4DplxNbc/Z85QP3CWc5LZhGGCJVX0np/PDjXJRzmXWfX4HQ8cU7osoAnVa+DfnJZs/yC3d51T+GdxrkFs3sh+zaDOi5Srv3M5DTgGZE53u0nONWhvg1EJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/wNZ3oZXsMpwHefxtbu7O2SjcrMy0v2aPgLmhWPAzU=;
 b=KAcnapsphOmGCUtjRZmQdwFXpTp+3XNlq2fsFXXAzQPr/EDIj/41O8R0Ft3acwmCQwqkcybx8UsooKZZWogWi1tprZLBAxDVRR6kRUcH9NNA6OU4WYqZoDKgmYtRjJcZNLn5ukSZ+MwIoSYfulXxPg2YJNaDtqGwdygER72QON62Hx3wQhGmDlMoqiNQQAFIpXiHWg2YIpd2Ch3fIL0gUJcSFKpCzhWZM/RRSjcklRTpmAyC//GU3Bk2CIJ4MO5rZvWyZu47Mmf7tSgfKG5DlLMEr/UCkUKs5UbU9KLmpUcgTWBbji/CNID1nk/98Ce2waqER9S8XmIOILK36vDIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/wNZ3oZXsMpwHefxtbu7O2SjcrMy0v2aPgLmhWPAzU=;
 b=a0hu+KhsnOQdT6wtqXUw5etxtgQuttwIKpPpJnPxIipVaMJWIfGP+9+vrwdJ+x4q5dHAaFb9dJ/HMiFwyE+zLfmiQXeIIt3t+UeDuGhwRGtS1ozpCIMCN4y3b/Ei2ebz9ciIwDOoElPOsw3rpz62itseuUlF2aB9ROZJWxwIW5s=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CH0PR10MB5049.namprd10.prod.outlook.com (2603:10b6:610:c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 00:08:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe%5]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 00:08:28 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgABH8QCAAK30AIAAEm2AgAC9D4CAANfhgIAAx9cAgAUr2oCAASDzgIAAYuuAgABkcYCAABdUAIAAKLiAgABI+gCADDeJgA==
Date: Thu, 10 Feb 2022 00:08:27 +0000
Message-ID: <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm> <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain> <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
In-Reply-To: <20220201223432.4f58518f.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed71719-3867-4fd5-6731-08d9ec2976d0
x-ms-traffictypediagnostic: CH0PR10MB5049:EE_
x-microsoft-antispam-prvs: <CH0PR10MB5049B5C17D15D01AD7FB9D52902F9@CH0PR10MB5049.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PjK0wOaPKP7KeIrNl3Sdq3Ya9rmHnOFplCnLXua1Bpb1ANkGt78SCvcHlj2w+iZFtDjvii3igcANokpDSiH7z0uxDcTqH+AZmL93AKCnUbEPAgV61hXX/nO8CknUmfON/NmvUHsrWybcKu2+XvG3pcMO4VNDhElURnWGJ0DkDF01gVW4tH3CGWRfh8b2gLAH7WA7qoQlPoXfs3rfEbibVg2PuM4wN8fUIhcbIAJWHM3A6bHIHXm2wrg2N+c1zY1aDnv0mRh9LdHGRequ4tBQcsfY+P8eEiJ45k8CW/lgh6c0yKP8VobJ8Sk5+ebRZLZp/JSyhWKVfy/fuMBn116renRyGiwUt4ukKGjctz23LwZOtkgzPRxiTKvG0uhTwnTRaIhZ3yOsVPRCZRK/+0fTtA+qSNzvJC2ayewpahz9lp8r7KxOkdhARgF8V9YTQ4HKBnv5EAyJRCnxeG+EZUUwOC297Xj8YNh9v4DsSq4xBrwsaJNjt9TzwDQgAKdQyWsV00c4B5IEKy2ApYXT/oT39zCbkCt3PCvSss7V3YCjiwBhOW1gB+10NAFW5tB+HZTjFjqDF7ocAqgN9SzmcNEPx+NjgqklwiGaozzRdeI+T3kA3IG6JGozkFqc8hv3cyDS5GSS1RPNq2WXBXYKqPtse5EGONydfj4ifw50KwV9/JYMdcCjKypRnJ3Lsj6KP376logptIeVLCHX5H9k0zaokBAbGb4llmPyZZ8RBN1163boD277YQb0kIZq+T9e9Kxo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(91956017)(4326008)(86362001)(6486002)(6506007)(508600001)(8936002)(83380400001)(53546011)(38100700002)(8676002)(54906003)(122000001)(6512007)(76116006)(316002)(66556008)(66476007)(66446008)(64756008)(6916009)(38070700005)(71200400001)(66946007)(5660300002)(44832011)(186003)(30864003)(2906002)(2616005)(33656002)(36756003)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1ZkVXArWSsvL21CTml4KzJUMkV3ekdoRVkyR1FNb2owS2t5ay95VjJzVXlo?=
 =?utf-8?B?cGQ3ZEVwRHFKYjlCZnk3MjlHTkRONFdPRlphRldGNFFTMFNGZ2tjZ2F2YW1j?=
 =?utf-8?B?SlNHam5OSFdkN1ZsblZnay91UHdxYUVUTmRrUk9vQis1ZzhJK2p1ODNMT0tX?=
 =?utf-8?B?cndRM1pVMmlXQ2xsUWtqV1hSbzUzV2IyeHAxaHp0ZzJnVXRzS2UzMGhQOUNX?=
 =?utf-8?B?Y1k2dzJEZmJuWnNqbFZZbkEwWFFBRjJEMkswM3VqbE5EMzlSTTBCOGduVTBu?=
 =?utf-8?B?NzVMbjZnOEdEdER5S2hUcmlzYll5ejg4M2JobGlIT28ydkRRVGt6YjR4TkNs?=
 =?utf-8?B?Q05nV3NTeGQ2bHN0bUJ1Vno3MDJZVHp5U2laZ0lkMUVmUGlweTUwaDJOYTRi?=
 =?utf-8?B?SlN0MGpZRTB4QkppQ00vVkFnQ052TmZPTThreUVEWlRFT3IrdEY5dXFGSUxP?=
 =?utf-8?B?aXBxV0ZZU1lZNS9RNzZDODEzWDdMMXIvaVMxWU5uakczZ0lTc0JwMHFzMXgy?=
 =?utf-8?B?dmhmY0Voc01uK24weFgydzB2K1dVK01vL29hWEk0a2VFSy91ajg4YUtXdHZL?=
 =?utf-8?B?ZCtzTjIzbTh0aWZldVNLQ1R5ZUZQY3Y2cUpZbTg5L2RiZ1k2U1RFTjQ2ZEdK?=
 =?utf-8?B?ai9OdnBaTHN2cW9OdDJNd2d4SXgySzNYcVRtRHROZnM0NWliaUtLTnBzSHR4?=
 =?utf-8?B?eFQ4TFRUVmoyaytCY0xVVVRRQ2hUS1lzQTU5blBpZWNmZXRkZThDMWdmbXp2?=
 =?utf-8?B?bm4zR0l1Wmo5dVpKK2ZtQm5abHFOL2t6OGx5bmF2UitwK2FsTy9PYnZtd0dm?=
 =?utf-8?B?WGFTOXlsbmJyS0xrSXpSU2VwMzZkVTVoblZjN29wQ1kxeVhoMjJlL3J1SFBs?=
 =?utf-8?B?dHNyQ056dDdQQzgzeTl2MEJIbmhBbEQ2VXRTd3k3dTBUOGd6SmZ0TndFOC9o?=
 =?utf-8?B?OVBVa1JpT2FMRUxWVkl3TktvLzhZbXJHUUtiUkJtMzVURlNDcmZiQjFWMTU5?=
 =?utf-8?B?WmhmdGF1a202aXlLTHZnWnRkUVZpTHllV3Q5YWhYQzdvMWpjcnRjYVRMeXRx?=
 =?utf-8?B?QldhR2ZSTTFQUnd6bkxqSy9pemRhYnRsaFB3dEZNUWtqSWZiam5qeElKK3dB?=
 =?utf-8?B?bjYrTEZENDBHSVJUVlllTVF4TVh4TlF5ekFic0JyNG5sUnhnck12bytxUTZk?=
 =?utf-8?B?NDRvQmFyRSt6N1Zza3VtWmxIbTFnakNSanBvWXBwaDMwMGVHb2FWM21mRDZU?=
 =?utf-8?B?YWZRenRSK1EzMUxsZUJiblVkRFc5b1ZmcFpCd3hUdnR0ejRhY0cwcUdHK3BM?=
 =?utf-8?B?UnhwMkU2UWJJdWI5N1VabVV1bXJjSlpuRS9ISGhJcmtraVRsUjJOVWlMMHEy?=
 =?utf-8?B?VEdRb0ZhaDdhS05yZnMzYWhhOHZHNDdscDJCcS9PMExSN0ZBNUl5T1Byb0Rq?=
 =?utf-8?B?bSs1QWQxdzBTR2p4T0dudVV6emF4UFc3R2ZXYUlmWFlXK0M4c0NuL0VZclkz?=
 =?utf-8?B?SGw5LzcrS2pYVEFhWm1UZ3ZaMFlwSVNSSzBRbU5Vd3Y2ak9XUUZRNmZTdmll?=
 =?utf-8?B?N1kvbEVNT0pta0ZPaHNTRnlqUlRHYndWY0VqWUd0RkUvNDVPQ01KQjRtNW05?=
 =?utf-8?B?dlZKUUxNUWFRbzZ3aXRtK3B5cFhuNmRtaWNSUlc0SFg3a3YxdmpacVh5WVh6?=
 =?utf-8?B?SjNxOFlMcUlVeDJscXUvUVpvQ3QyRU0xZEFrQ0lrZlVUbXFlVE1HTDBYZGs2?=
 =?utf-8?B?U1p6T29hdlJmUDBTN1ppWmNvd0t4eWg3VlMvRDgzWGQ5U1NqUGwrTW9LQVFG?=
 =?utf-8?B?dXRmbm5ZWWFjVmtFR0VjMmRIMFdxU3lFUlhKS0VCMGErYXYxdmx6bWI4SHlN?=
 =?utf-8?B?WDh3L21GR2NiaTUwRlFMOHpBT21sR2RmT3NxTUJ4UUx4ZGZTVDdEdmNtblRR?=
 =?utf-8?B?Szkrc3Bmc2IzYmJzU3NBSUNMZTl1V3JOTVk3U0hRdkhQOEx2aE41VmIxOUx2?=
 =?utf-8?B?UHNWVFE5WGU0UXo0aTc2Rmo4QTBOdmZPMGRMNElFMElEUmIxVDFXbENWYUlh?=
 =?utf-8?B?Zzd0UHVZWTRUWlJFUWZHM0NBZElBbm5oY0hUTTFsMFRTQ25GblNYK2xhWnl5?=
 =?utf-8?B?TWptbCtrVlpEeUptdVhPN2ZiazVOZFkwZHkxaFBqYUJMMmN1QlBUSHhBWWcy?=
 =?utf-8?B?STE2RVRTQ2NSNUtGaFplMTNyc2ZuUFF4MDZMTXJZZjVkQjdCejRpYWFkNC8x?=
 =?utf-8?B?cGVhRFBNQVBNeXI1b1VSM25aMXJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <393C5AA088632C40ABD23CF2A0F54DEC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed71719-3867-4fd5-6731-08d9ec2976d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 00:08:27.9725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sBl8A/Lm7QhcHIHagNi5LKQuaI9Q72QO36e8z2lsXPhw0slArM6uGnWplMo8g3VPswdldm01f5Nc6misXNWpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5049
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090124
X-Proofpoint-GUID: HtljmEem0e05BEKNIHEryzT_8V2yyfdZ
X-Proofpoint-ORIG-GUID: HtljmEem0e05BEKNIHEryzT_8V2yyfdZ
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDIsIDIwMjIsIGF0IDEyOjM0IEFNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMiBGZWIgMjAyMiAw
MToxMzoyMiArMDAwMA0KPiBKYWcgUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cm90ZToN
Cj4gDQo+Pj4gT24gRmViIDEsIDIwMjIsIGF0IDU6NDcgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxl
eC53aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgMSBGZWIg
MjAyMiAyMToyNDowOCArMDAwMA0KPj4+IEphZyBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+
IHdyb3RlOg0KPj4+IA0KPj4+Pj4gT24gRmViIDEsIDIwMjIsIGF0IDEwOjI0IEFNLCBBbGV4IFdp
bGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+
Pj4gT24gVHVlLCAxIEZlYiAyMDIyIDA5OjMwOjM1ICswMDAwDQo+Pj4+PiBTdGVmYW4gSGFqbm9j
emkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+Pj4gT24gTW9uLCBK
YW4gMzEsIDIwMjIgYXQgMDk6MTY6MjNBTSAtMDcwMCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOiAg
ICANCj4+Pj4+Pj4gT24gRnJpLCAyOCBKYW4gMjAyMiAwOToxODowOCArMDAwMA0KPj4+Pj4+PiBT
dGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4+PiANCj4+
Pj4+Pj4+IE9uIFRodSwgSmFuIDI3LCAyMDIyIGF0IDAyOjIyOjUzUE0gLTA3MDAsIEFsZXggV2ls
bGlhbXNvbiB3cm90ZTogICAgICANCj4+Pj4+Pj4+PiBJZiB0aGUgZ29hbCBoZXJlIGlzIHRvIHJl
c3RyaWN0IERNQSBiZXR3ZWVuIGRldmljZXMsIGllLiBwZWVyLXRvLXBlZXINCj4+Pj4+Pj4+PiAo
cDJwKSwgd2h5IGFyZSB3ZSB0cnlpbmcgdG8gcmUtaW52ZW50IHdoYXQgYW4gSU9NTVUgYWxyZWFk
eSBkb2VzPyAgICAgICAgDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRoZSBpc3N1ZSBEYXZlIHJhaXNl
ZCBpcyB0aGF0IHZmaW8tdXNlciBzZXJ2ZXJzIHJ1biBpbiBzZXBhcmF0ZQ0KPj4+Pj4+Pj4gcHJv
Y2Vzc3NlcyBmcm9tIFFFTVUgd2l0aCBzaGFyZWQgbWVtb3J5IGFjY2VzcyB0byBSQU0gYnV0IG5v
IGRpcmVjdA0KPj4+Pj4+Pj4gYWNjZXNzIHRvIG5vbi1SQU0gTWVtb3J5UmVnaW9ucy4gVGhlIHZp
cnRpb2ZzIERBWCBXaW5kb3cgQkFSIGlzIG9uZQ0KPj4+Pj4+Pj4gZXhhbXBsZSBvZiBhIG5vbi1S
QU0gTWVtb3J5UmVnaW9uIHRoYXQgY2FuIGJlIHRoZSBzb3VyY2UvdGFyZ2V0IG9mIERNQQ0KPj4+
Pj4+Pj4gcmVxdWVzdHMuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEkgZG9uJ3QgdGhpbmsgSU9NTVVz
IHNvbHZlIHRoaXMgcHJvYmxlbSBidXQgbHVja2lseSB0aGUgdmZpby11c2VyDQo+Pj4+Pj4+PiBw
cm90b2NvbCBhbHJlYWR5IGhhcyBtZXNzYWdlcyB0aGF0IHZmaW8tdXNlciBzZXJ2ZXJzIGNhbiB1
c2UgYXMgYQ0KPj4+Pj4+Pj4gZmFsbGJhY2sgd2hlbiBETUEgY2Fubm90IGJlIGNvbXBsZXRlZCB0
aHJvdWdoIHRoZSBzaGFyZWQgbWVtb3J5IFJBTQ0KPj4+Pj4+Pj4gYWNjZXNzZXMuDQo+Pj4+Pj4+
PiANCj4+Pj4+Pj4+PiBJbg0KPj4+Pj4+Pj4+IGZhY3QsIGl0IHNlZW1zIGxpa2UgYW4gSU9NTVUg
ZG9lcyB0aGlzIGJldHRlciBpbiBwcm92aWRpbmcgYW4gSU9WQQ0KPj4+Pj4+Pj4+IGFkZHJlc3Mg
c3BhY2UgcGVyIEJERi4gIElzIHRoZSBkeW5hbWljIG1hcHBpbmcgb3ZlcmhlYWQgdG9vIG11Y2g/
ICBXaGF0DQo+Pj4+Pj4+Pj4gcGh5c2ljYWwgaGFyZHdhcmUgcHJvcGVydGllcyBvciBzcGVjaWZp
Y2F0aW9ucyBjb3VsZCB3ZSBsZXZlcmFnZSB0bw0KPj4+Pj4+Pj4+IHJlc3RyaWN0IHAycCBtYXBw
aW5ncyB0byBhIGRldmljZT8gIFNob3VsZCBpdCBiZSBnb3Zlcm5lZCBieSBtYWNoaW5lDQo+Pj4+
Pj4+Pj4gdHlwZSB0byBwcm92aWRlIGNvbnNpc3RlbmN5IGJldHdlZW4gZGV2aWNlcz8gIFNob3Vs
ZCBlYWNoICJpc29sYXRlZCINCj4+Pj4+Pj4+PiBidXMgYmUgaW4gYSBzZXBhcmF0ZSByb290IGNv
bXBsZXg/ICBUaGFua3MsICAgICAgICANCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gVGhlcmUgaXMgYSBz
ZXBhcmF0ZSBpc3N1ZSBpbiB0aGlzIHBhdGNoIHNlcmllcyByZWdhcmRpbmcgaXNvbGF0aW5nIHRo
ZQ0KPj4+Pj4+Pj4gYWRkcmVzcyBzcGFjZSB3aGVyZSBCQVIgYWNjZXNzZXMgYXJlIG1hZGUgKGku
ZS4gdGhlIGdsb2JhbA0KPj4+Pj4+Pj4gYWRkcmVzc19zcGFjZV9tZW1vcnkvaW8pLiBXaGVuIG9u
ZSBwcm9jZXNzIGhvc3RzIG11bHRpcGxlIHZmaW8tdXNlcg0KPj4+Pj4+Pj4gc2VydmVyIGluc3Rh
bmNlcyAoZS5nLiBhIHNvZnR3YXJlLWRlZmluZWQgbmV0d29yayBzd2l0Y2ggd2l0aCBtdWx0aXBs
ZQ0KPj4+Pj4+Pj4gZXRoZXJuZXQgZGV2aWNlcykgdGhlbiBlYWNoIGluc3RhbmNlIG5lZWRzIGlz
b2xhdGVkIG1lbW9yeSBhbmQgaW8gYWRkcmVzcw0KPj4+Pj4+Pj4gc3BhY2VzIHNvIHRoYXQgdmZp
by11c2VyIGNsaWVudHMgZG9uJ3QgY2F1c2UgY29sbGlzaW9ucyB3aGVuIHRoZXkgbWFwDQo+Pj4+
Pj4+PiBCQVJzIHRvIHRoZSBzYW1lIGFkZHJlc3MuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEkgdGhp
bmsgdGhlIHRoZSBzZXBhcmF0ZSByb290IGNvbXBsZXggaWRlYSBpcyBhIGdvb2Qgc29sdXRpb24u
IFRoaXMNCj4+Pj4+Pj4+IHBhdGNoIHNlcmllcyB0YWtlcyBhIGRpZmZlcmVudCBhcHByb2FjaCBi
eSBhZGRpbmcgdGhlIGNvbmNlcHQgb2YNCj4+Pj4+Pj4+IGlzb2xhdGVkIGFkZHJlc3Mgc3BhY2Vz
IGludG8gaHcvcGNpLy4gICAgICANCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRoaXMgYWxsIHN0aWxsIHNl
ZW1zIHByZXR0eSBza2V0Y2h5LCBCQVJzIGNhbm5vdCBvdmVybGFwIHdpdGhpbiB0aGUNCj4+Pj4+
Pj4gc2FtZSB2Q1BVIGFkZHJlc3Mgc3BhY2UsIHBlcmhhcHMgd2l0aCB0aGUgZXhjZXB0aW9uIG9m
IHdoZW4gdGhleSdyZQ0KPj4+Pj4+PiBiZWluZyBzaXplZCwgYnV0IERNQSBzaG91bGQgYmUgZGlz
YWJsZWQgZHVyaW5nIHNpemluZy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IERldmljZXMgd2l0aGluIHRo
ZSBzYW1lIFZNIGNvbnRleHQgd2l0aCBpZGVudGljYWwgQkFScyB3b3VsZCBuZWVkIHRvDQo+Pj4+
Pj4+IG9wZXJhdGUgaW4gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzLiAgRm9yIGV4YW1wbGUgYSB0
cmFuc2xhdGlvbiBvZmZzZXQNCj4+Pj4+Pj4gaW4gdGhlIHZDUFUgYWRkcmVzcyBzcGFjZSB3b3Vs
ZCBhbGxvdyB1bmlxdWUgYWRkcmVzc2luZyB0byB0aGUgZGV2aWNlcywNCj4+Pj4+Pj4gcGVyaGFw
cyB1c2luZyB0aGUgdHJhbnNsYXRpb24gb2Zmc2V0IGJpdHMgdG8gYWRkcmVzcyBhIHJvb3QgY29t
cGxleCBhbmQNCj4+Pj4+Pj4gbWFza2luZyB0aG9zZSBiaXRzIGZvciBkb3duc3RyZWFtIHRyYW5z
YWN0aW9ucy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEluIGdlbmVyYWwsIHRoZSBkZXZpY2Ugc2ltcGx5
IG9wZXJhdGVzIGluIGFuIGFkZHJlc3Mgc3BhY2UsIGllLiBhbg0KPj4+Pj4+PiBJT1ZBLiAgV2hl
biBhIG1hcHBpbmcgaXMgbWFkZSB3aXRoaW4gdGhhdCBhZGRyZXNzIHNwYWNlLCB3ZSBwZXJmb3Jt
IGENCj4+Pj4+Pj4gdHJhbnNsYXRpb24gYXMgbmVjZXNzYXJ5IHRvIGdlbmVyYXRlIGEgZ3Vlc3Qg
cGh5c2ljYWwgYWRkcmVzcy4gIFRoZQ0KPj4+Pj4+PiBJT1ZBIGl0c2VsZiBpcyBvbmx5IG1lYW5p
bmdmdWwgd2l0aGluIHRoZSBjb250ZXh0IG9mIHRoZSBhZGRyZXNzIHNwYWNlLA0KPj4+Pj4+PiB0
aGVyZSBpcyBubyByZXF1aXJlbWVudCBvciBleHBlY3RhdGlvbiBmb3IgaXQgdG8gYmUgZ2xvYmFs
bHkgdW5pcXVlLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSWYgdGhlIHZmaW8tdXNlciBzZXJ2ZXIgaXMg
bWFraW5nIHNvbWUgc29ydCBvZiByZXF1aXJlbWVudCB0aGF0IElPVkFzDQo+Pj4+Pj4+IGFyZSB1
bmlxdWUgYWNyb3NzIGFsbCBkZXZpY2VzLCB0aGF0IHNlZW1zIHZlcnksIHZlcnkgd3JvbmcuICBU
aGFua3MsICAgICAgDQo+Pj4+Pj4gDQo+Pj4+Pj4gWWVzLCBCQVJzIGFuZCBJT1ZBcyBkb24ndCBu
ZWVkIHRvIGJlIHVuaXF1ZSBhY3Jvc3MgYWxsIGRldmljZXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhl
IGlzc3VlIGlzIHRoYXQgdGhlcmUgY2FuIGJlIGFzIG1hbnkgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVz
cyBzcGFjZXMgYXMNCj4+Pj4+PiB0aGVyZSBhcmUgdmZpby11c2VyIGNsaWVudHMgY29ubmVjdGVk
LCBzbyBwZXItY2xpZW50IGlzb2xhdGVkIGFkZHJlc3MNCj4+Pj4+PiBzcGFjZXMgYXJlIHJlcXVp
cmVkLiBUaGlzIHBhdGNoIHNlcmllcyBoYXMgYSBzb2x1dGlvbiB0byB0aGF0IHByb2JsZW0NCj4+
Pj4+PiB3aXRoIHRoZSBuZXcgcGNpX2lzb2xfYXNfbWVtL2lvKCkgQVBJLiAgICANCj4+Pj4+IA0K
Pj4+Pj4gU29ycnksIHRoaXMgc3RpbGwgZG9lc24ndCBmb2xsb3cgZm9yIG1lLiAgQSBzZXJ2ZXIg
dGhhdCBob3N0cyBtdWx0aXBsZQ0KPj4+Pj4gZGV2aWNlcyBhY3Jvc3MgbWFueSBWTXMgKEknbSBu
b3Qgc3VyZSBpZiB5b3UncmUgcmVmZXJyaW5nIHRvIHRoZSBkZXZpY2UNCj4+Pj4+IG9yIHRoZSBW
TSBhcyBhIGNsaWVudCkgbmVlZHMgdG8gZGVhbCB3aXRoIGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cyBwZXINCj4+Pj4+IGRldmljZS4gIFRoZSBzZXJ2ZXIgbmVlZHMgdG8gYmUgYWJsZSB0byB1bmlx
dWVseSBpZGVudGlmeSBldmVyeSBETUEsDQo+Pj4+PiB3aGljaCBtdXN0IGJlIHBhcnQgb2YgdGhl
IGludGVyZmFjZSBwcm90b2NvbC4gIEJ1dCBJIGRvbid0IHNlZSBob3cgdGhhdA0KPj4+Pj4gaW1w
b3NlcyBhIHJlcXVpcmVtZW50IG9mIGFuIGlzb2xhdGVkIGFkZHJlc3Mgc3BhY2UuICBJZiB3ZSB3
YW50IHRoZQ0KPj4+Pj4gZGV2aWNlIGlzb2xhdGVkIGJlY2F1c2Ugd2UgZG9uJ3QgdHJ1c3QgdGhl
IHNlcnZlciwgdGhhdCdzIHdoZXJlIGFuIElPTU1VDQo+Pj4+PiBwcm92aWRlcyBwZXIgZGV2aWNl
IGlzb2xhdGlvbi4gIFdoYXQgaXMgdGhlIHJlc3RyaWN0aW9uIG9mIHRoZQ0KPj4+Pj4gcGVyLWNs
aWVudCBpc29sYXRlZCBhZGRyZXNzIHNwYWNlIGFuZCB3aHkgZG8gd2UgbmVlZCBpdD8gIFRoZSBz
ZXJ2ZXINCj4+Pj4+IG5lZWRpbmcgdG8gc3VwcG9ydCBtdWx0aXBsZSBjbGllbnRzIGlzIG5vdCBh
IHN1ZmZpY2llbnQgYW5zd2VyIHRvDQo+Pj4+PiBpbXBvc2UgbmV3IFBDSSBidXMgdHlwZXMgd2l0
aCBhbiBpbXBsaWNpdCByZXN0cmljdGlvbiBvbiB0aGUgVk0uICAgIA0KPj4+PiANCj4+Pj4gSGkg
QWxleCwNCj4+Pj4gDQo+Pj4+IEkgYmVsaWV2ZSB0aGVyZSBhcmUgdHdvIHNlcGFyYXRlIHByb2Js
ZW1zIHdpdGggcnVubmluZyBQQ0kgZGV2aWNlcyBpbg0KPj4+PiB0aGUgdmZpby11c2VyIHNlcnZl
ci4gVGhlIGZpcnN0IG9uZSBpcyBjb25jZXJuaW5nIG1lbW9yeSBpc29sYXRpb24gYW5kDQo+Pj4+
IHNlY29uZCBvbmUgaXMgdmVjdG9yaW5nIG9mIEJBUiBhY2Nlc3NlcyAoYXMgZXhwbGFpbmVkIGJl
bG93KS4NCj4+Pj4gDQo+Pj4+IEluIG91ciBwcmV2aW91cyBwYXRjaGVzICh2MyksIHdlIHVzZWQg
YW4gSU9NTVUgdG8gaXNvbGF0ZSBtZW1vcnkNCj4+Pj4gc3BhY2VzLiBCdXQgd2Ugc3RpbGwgaGFk
IHRyb3VibGUgd2l0aCB0aGUgdmVjdG9yaW5nLiBTbyB3ZSBpbXBsZW1lbnRlZA0KPj4+PiBzZXBh
cmF0ZSBhZGRyZXNzIHNwYWNlcyBmb3IgZWFjaCBQQ0lCdXMgdG8gdGFja2xlIGJvdGggcHJvYmxl
bXMNCj4+Pj4gc2ltdWx0YW5lb3VzbHksIGJhc2VkIG9uIHRoZSBmZWVkYmFjayB3ZSBnb3QuDQo+
Pj4+IA0KPj4+PiBUaGUgZm9sbG93aW5nIGdpdmVzIGFuIG92ZXJ2aWV3IG9mIGlzc3VlcyBjb25j
ZXJuaW5nIHZlY3RvcmluZyBvZg0KPj4+PiBCQVIgYWNjZXNzZXMuDQo+Pj4+IA0KPj4+PiBUaGUg
ZGV2aWNl4oCZcyBCQVIgcmVnaW9ucyBhcmUgbWFwcGVkIGludG8gdGhlIGd1ZXN0IHBoeXNpY2Fs
IGFkZHJlc3MNCj4+Pj4gc3BhY2UuIFRoZSBndWVzdCB3cml0ZXMgdGhlIGd1ZXN0IFBBIG9mIGVh
Y2ggQkFSIGludG8gdGhlIGRldmljZeKAmXMgQkFSDQo+Pj4+IHJlZ2lzdGVycy4gVG8gYWNjZXNz
IHRoZSBCQVIgcmVnaW9ucyBvZiB0aGUgZGV2aWNlLCBRRU1VIHVzZXMNCj4+Pj4gYWRkcmVzc19z
cGFjZV9ydygpIHdoaWNoIHZlY3RvcnMgdGhlIHBoeXNpY2FsIGFkZHJlc3MgYWNjZXNzIHRvIHRo
ZQ0KPj4+PiBkZXZpY2UgQkFSIHJlZ2lvbiBoYW5kbGVycy4gIA0KPj4+IA0KPj4+IFRoZSBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzIHdyaXR0ZW4gdG8gdGhlIEJBUiBpcyBpcnJlbGV2YW50IGZyb20g
dGhlDQo+Pj4gZGV2aWNlIHBlcnNwZWN0aXZlLCB0aGlzIG9ubHkgc2VydmVzIHRvIGFzc2lnbiB0
aGUgQkFSIGFuIG9mZnNldCB3aXRoaW4NCj4+PiB0aGUgYWRkcmVzc19zcGFjZV9tZW0sIHdoaWNo
IGlzIHVzZWQgYnkgdGhlIHZDUFUgKGFuZCBwb3NzaWJseSBvdGhlcg0KPj4+IGRldmljZXMgZGVw
ZW5kaW5nIG9uIHRoZWlyIGFkZHJlc3Mgc3BhY2UpLiAgVGhlcmUgaXMgbm8gcmVhc29uIGZvciB0
aGUNCj4+PiBkZXZpY2UgaXRzZWxmIHRvIGNhcmUgYWJvdXQgdGhpcyBhZGRyZXNzLiAgDQo+PiAN
Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uLCBBbGV4IQ0KPj4gDQo+PiBUaGUgY29u
ZnVzaW9uIGF0IG15IHBhcnQgaXMgd2hldGhlciB3ZSBhcmUgaW5zaWRlIHRoZSBkZXZpY2UgYWxy
ZWFkeSB3aGVuDQo+PiB0aGUgc2VydmVyIHJlY2VpdmVzIGEgcmVxdWVzdCB0byBhY2Nlc3MgQkFS
IHJlZ2lvbiBvZiBhIGRldmljZS4gQmFzZWQgb24NCj4+IHlvdXIgZXhwbGFuYXRpb24sIEkgZ2V0
IHRoYXQgeW91ciB2aWV3IGlzIHRoZSBCQVIgYWNjZXNzIHJlcXVlc3QgaGFzDQo+PiBwcm9wYWdh
dGVkIGludG8gdGhlIGRldmljZSBhbHJlYWR5LCB3aGVyZWFzIEkgd2FzIHVuZGVyIHRoZSBpbXBy
ZXNzaW9uDQo+PiB0aGF0IHRoZSByZXF1ZXN0IGlzIHN0aWxsIG9uIHRoZSBDUFUgc2lkZSBvZiB0
aGUgUENJIHJvb3QgY29tcGxleC4NCj4gDQo+IElmIHlvdSBhcmUgZ2V0dGluZyBhbiBhY2Nlc3Mg
dGhyb3VnaCB5b3VyIE1lbW9yeVJlZ2lvbk9wcywgYWxsIHRoZQ0KPiB0cmFuc2xhdGlvbnMgaGF2
ZSBiZWVuIG1hZGUsIHlvdSBzaW1wbHkgbmVlZCB0byB1c2UgdGhlIGh3YWRkciBhcyB0aGUNCj4g
b2Zmc2V0IGludG8gdGhlIE1lbW9yeVJlZ2lvbiBmb3IgdGhlIGFjY2Vzcy4gIFBlcmZvcm0gdGhl
IHJlYWQvd3JpdGUgdG8NCj4geW91ciBkZXZpY2UsIG5vIGZ1cnRoZXIgdHJhbnNsYXRpb25zIHJl
cXVpcmVkLg0KPiANCj4+IFlvdXIgdmlldyBtYWtlcyBzZW5zZSB0byBtZSAtIG9uY2UgdGhlIEJB
UiBhY2Nlc3MgcmVxdWVzdCByZWFjaGVzIHRoZQ0KPj4gY2xpZW50IChvbiB0aGUgb3RoZXIgc2lk
ZSksIHdlIGNvdWxkIGNvbnNpZGVyIHRoYXQgdGhlIHJlcXVlc3QgaGFzIHJlYWNoZWQNCj4+IHRo
ZSBkZXZpY2UuDQo+PiANCj4+IE9uIGEgc2VwYXJhdGUgbm90ZSwgaWYgZGV2aWNlcyBkb27igJl0
IGNhcmUgYWJvdXQgdGhlIHZhbHVlcyBpbiBCQVINCj4+IHJlZ2lzdGVycywgd2h5IGRvIHRoZSBk
ZWZhdWx0IFBDSSBjb25maWcgaGFuZGxlcnMgaW50ZXJjZXB0IGFuZCBtYXANCj4+IHRoZSBCQVIg
cmVnaW9uIGludG8gYWRkcmVzc19zcGFjZV9tZW0/DQo+PiAocGNpX2RlZmF1bHRfd3JpdGVfY29u
ZmlnKCkgLT4gcGNpX3VwZGF0ZV9tYXBwaW5ncygpKQ0KPiANCj4gVGhpcyBpcyB0aGUgcGFydCB0
aGF0J3MgYWN0dWFsbHkgcGxhY2luZyB0aGUgQkFSIE1lbW9yeVJlZ2lvbiBhcyBhDQo+IHN1Yi1y
ZWdpb24gaW50byB0aGUgdkNQVSBhZGRyZXNzIHNwYWNlLiAgSSB0aGluayBpZiB5b3UgdHJhY2sg
aXQsDQo+IHlvdSdsbCBzZWUgUENJRGV2aWNlLmlvX3JlZ2lvbnNbaV0uYWRkcmVzc19zcGFjZSBp
cyBhY3R1YWxseQ0KPiBzeXN0ZW1fbWVtb3J5LCB3aGljaCBpcyB1c2VkIHRvIGluaXRpYWxpemUg
YWRkcmVzc19zcGFjZV9zeXN0ZW0uDQo+IA0KPiBUaGUgbWFjaGluZSBhc3NlbWJsZXMgUENJIGRl
dmljZXMgb250byBidXNlcyBhcyBpbnN0cnVjdGVkIGJ5IHRoZQ0KPiBjb21tYW5kIGxpbmUgb3Ig
aG90IHBsdWcgb3BlcmF0aW9ucy4gIEl0J3MgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZQ0KPiBn
dWVzdCBmaXJtd2FyZSBhbmQgZ3Vlc3QgT1MgdG8gcHJvYmUgdGhvc2UgZGV2aWNlcywgc2l6ZSB0
aGUgQkFScywgYW5kDQo+IHBsYWNlIHRoZSBCQVJzIGludG8gdGhlIG1lbW9yeSBoaWVyYXJjaHkg
b2YgdGhlIFBDSSBidXMsIGllLiBzeXN0ZW0NCj4gbWVtb3J5LiAgVGhlIEJBUnMgYXJlIG5lY2Vz
c2FyaWx5IGluIHRoZSAiZ3Vlc3QgcGh5c2ljYWwgbWVtb3J5IiBmb3INCj4gdkNQVSBhY2Nlc3Ms
IGJ1dCBpdCdzIGVzc2VudGlhbGx5IG9ubHkgY29pbmNpZGVudGFsIHRoYXQgUENJIGRldmljZXMN
Cj4gbWlnaHQgYmUgaW4gYW4gYWRkcmVzcyBzcGFjZSB0aGF0IHByb3ZpZGVzIGEgbWFwcGluZyB0
byB0aGVpciBvd24gQkFSLg0KPiBUaGVyZSdzIG5vIHJlYXNvbiB0byBldmVyIHVzZSBpdC4NCj4g
DQo+IEluIHRoZSB2SU9NTVUgY2FzZSwgd2UgY2FuJ3Qga25vdyB0aGF0IHRoZSBkZXZpY2UgYWRk
cmVzcyBzcGFjZQ0KPiBpbmNsdWRlcyB0aG9zZSBCQVIgbWFwcGluZ3Mgb3IgaWYgdGhleSBkbywg
dGhhdCB0aGV5J3JlIGlkZW50aXR5IG1hcHBlZA0KPiB0byB0aGUgcGh5c2ljYWwgYWRkcmVzcy4g
IERldmljZXMgcmVhbGx5IG5lZWQgdG8gbm90IGluZmVyIGFueXRoaW5nDQo+IGFib3V0IGFuIGFk
ZHJlc3MuICBUaGluayBhYm91dCByZWFsIGhhcmR3YXJlLCBhIGRldmljZSBpcyB0b2xkIGJ5DQo+
IGRyaXZlciBwcm9ncmFtbWluZyB0byBwZXJmb3JtIGEgRE1BIG9wZXJhdGlvbi4gIFRoZSBkZXZp
Y2UgZG9lc24ndCBrbm93DQo+IHRoZSB0YXJnZXQgb2YgdGhhdCBvcGVyYXRpb24sIGl0J3MgdGhl
IGd1ZXN0IGRyaXZlcidzIHJlc3BvbnNpYmlsaXR5IHRvDQo+IG1ha2Ugc3VyZSB0aGUgSU9WQSB3
aXRoaW4gdGhlIGRldmljZSBhZGRyZXNzIHNwYWNlIGlzIHZhbGlkIGFuZCBtYXBzIHRvDQo+IHRo
ZSBkZXNpcmVkIHRhcmdldC4gIFRoYW5rcywNCg0KVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24s
IEFsZXguIFRoYW5rcyB0byBldmVyeW9uZSBlbHNlIGluIHRoZSB0aHJlYWQgd2hvDQpoZWxwZWQg
dG8gY2xhcmlmeSB0aGlzIHByb2JsZW0uDQoNCldlIGhhdmUgaW1wbGVtZW50ZWQgdGhlIG1lbW9y
eSBpc29sYXRpb24gYmFzZWQgb24gdGhlIGRpc2N1c3Npb24gaW4gdGhlDQp0aHJlYWQuIFdlIHdp
bGwgc2VuZCB0aGUgcGF0Y2hlcyBvdXQgc2hvcnRseS4NCg0KRGV2aWNlcyBzdWNoIGFzIOKAnG5h
bWUiIGFuZCDigJxlMTAwMOKAnSB3b3JrZWQgZmluZS4gQnV0IEnigJlkIGxpa2UgdG8gbm90ZSB0
aGF0DQp0aGUgTFNJIGRldmljZSAoVFlQRV9MU0k1M0M4OTVBKSBoYWQgc29tZSBwcm9ibGVtcyAt
IGl0IGRvZXNu4oCZdCBzZWVtDQp0byBiZSBJT01NVSBhd2FyZS4gSW4gTFNJ4oCZcyBjYXNlLCB0
aGUga2VybmVsIGRyaXZlciBpcyBhc2tpbmcgdGhlIGRldmljZSB0bw0KcmVhZCBpbnN0cnVjdGlv
bnMgZnJvbSB0aGUgQ1BVIFZBIChsc2lfZXhlY3V0ZV9zY3JpcHQoKSAtPiByZWFkX2R3b3JkKCkp
LA0Kd2hpY2ggaXMgZm9yYmlkZGVuIHdoZW4gSU9NTVUgaXMgZW5hYmxlZC4gU3BlY2lmaWNhbGx5
LCB0aGUgZHJpdmVyIGlzIGFza2luZw0KdGhlIGRldmljZSB0byBhY2Nlc3Mgb3RoZXIgQkFSIHJl
Z2lvbnMgYnkgdXNpbmcgdGhlIEJBUiBhZGRyZXNzIHByb2dyYW1tZWQNCmluIHRoZSBQQ0kgY29u
ZmlnIHNwYWNlLiBUaGlzIGhhcHBlbnMgZXZlbiB3aXRob3V0IHZmaW8tdXNlciBwYXRjaGVzLiBG
b3IgZXhhbXBsZSwNCndlIGNvdWxkIGVuYWJsZSBJT01NVSB1c2luZyDigJwtZGV2aWNlIGludGVs
LWlvbW114oCdIFFFTVUgb3B0aW9uIGFuZCBhbHNvDQphZGRpbmcgdGhlIGZvbGxvd2luZyB0byB0
aGUga2VybmVsIGNvbW1hbmQtbGluZTog4oCcaW50ZWxfaW9tbXU9b24gaW9tbXU9bm9wdOKAnS4N
CkluIHRoaXMgY2FzZSwgd2UgY291bGQgc2VlIGFuIElPTU1VIGZhdWx0Lg0KDQpVbmZvcnR1bmF0
ZWx5LCB3ZSBzdGFydGVkIG9mZiBvdXIgcHJvamVjdCB3aXRoIHRoZSBMU0kgZGV2aWNlLiBTbyB0
aGF0IGxlYWQgdG8gYWxsIHRoZQ0KY29uZnVzaW9uIGFib3V0IHdoYXQgaXMgZXhwZWN0ZWQgYXQg
dGhlIHNlcnZlciBlbmQgaW4tdGVybXMgb2YNCnZlY3RvcmluZy9hZGRyZXNzLXRyYW5zbGF0aW9u
LiBJdCBnYXZlIGFuIGltcHJlc3Npb24gYXMgaWYgdGhlIHJlcXVlc3Qgd2FzIHN0aWxsIG9uDQp0
aGUgQ1BVIHNpZGUgb2YgdGhlIFBDSSByb290IGNvbXBsZXgsIGJ1dCB0aGUgYWN0dWFsIHByb2Js
ZW0gd2FzIHdpdGggdGhlDQpkZXZpY2UgZHJpdmVyIGl0c2VsZi4NCg0KSeKAmW0gd29uZGVyaW5n
IGhvdyB0byBkZWFsIHdpdGggdGhpcyBwcm9ibGVtLiBXb3VsZCBpdCBiZSBPSyBpZiB3ZSBtYXBw
ZWQgdGhlDQpkZXZpY2XigJlzIEJBUiBpbnRvIHRoZSBJT1ZBLCBhdCB0aGUgc2FtZSBDUFUgVkEg
cHJvZ3JhbW1lZCBpbiB0aGUgQkFSIHJlZ2lzdGVycz8NClRoaXMgd291bGQgaGVscCBkZXZpY2Vz
IHN1Y2ggYXMgTFNJIHRvIGNpcmN1bXZlbnQgdGhpcyBwcm9ibGVtLiBPbmUgcHJvYmxlbQ0Kd2l0
aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgaGFzIHRoZSBwb3RlbnRpYWwgdG8gY29sbGlkZSB3
aXRoIGFub3RoZXIgbGVnaXRpbWF0ZQ0KSU9WQSBhZGRyZXNzLiBLaW5kbHkgc2hhcmUgeW91ciB0
aG91Z2h0IG9uIHRoaXMuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gQWxleA0KPiAN
Cg0K

