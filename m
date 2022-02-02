Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10D4A6A75
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:13:14 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF653-0006JQ-Bs
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nF4DH-0001ca-AJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:13:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nF4DD-0006JH-N5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:13:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2120Gvoj026579; 
 Wed, 2 Feb 2022 01:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZJoxuH97xL64rZNLMw7n/++K97ZZeoN+2fkUJVCzFdg=;
 b=G5hMndLOxUwuxcAEPpme/O5zIK4ul69/tY4P9JhiZpyAnQ2CzingYw+ppW3afNsg2wyJ
 v99ekSZw6ggmilrw1lbvyRrN7WnZESzsHakmgY+hjJvgNX48g3egZhTH498HjYG7w10S
 4lW/jPpnD3wIrv945Mc3wuA6H0k1toKvPooGUI6MyuHUksJRsyUwuaPsI1oKAPdErjXD
 RJWlvkCa3QXv2dnNfS/mYb49B14p5cxwfQVeyFmjejzjqM2XWhqjqdG9EPw0WOzvqE8e
 AgRMxEMtj4tWcJmfSoSTlbsytVDMhSPQtFgKbA6GcN4//ERMqQe4HuzxKagevQR2fNak aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9vcpm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 01:13:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2121Bgjv184322;
 Wed, 2 Feb 2022 01:13:25 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3030.oracle.com with ESMTP id 3dvumge0n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 01:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLz5fsdjBT3J/YHLO80cJpvS6ti0yfmBYnJBjWYmR0y8c8jcWekoR9+yWjN/wmFMH+rIruMFy/BUnhY43g0FxPAYQWR0kIUlnFDEoMdV5DRp+x9Rnf4LuEjsBlrLiYKhZTyFD7J24Sn9CHanhmYC+VmbuPH6QKgDX2BHYwlczFWINuvGEazw0IVxlcIxPxGT9G1SB2XOQMK9HLvdAcQQyjB/HEqU3zsbGkYqSyNSWc8MJDwIOidEyU0STi4JoRTPnNnbhWYip4t+F/Cb1iCrxRUY9TPl/ho98VTSZKAIKmcEexVM1OFuDWSHqZ3OLtpp4BRe7YnV/lzAv7KFdGV12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJoxuH97xL64rZNLMw7n/++K97ZZeoN+2fkUJVCzFdg=;
 b=dIXHG24bSkQe8/0V34tcIGBJ3QF+l4yJHugrFeGO1DDN5FEY9bXRP7vx8ooUhu1VJ7CGWjyfP1nX3F56kN3LN1Ztqt+44TxYSaowxYImKtTVY2x8z9GBWRXMjlHhbQazgYMRpCN/+2MIJ29WWcaCG2vIy8b34G53fYrwDw5IEkWmtoVaE92WifKVjvUwngR/zYbTrEdfBVTmkRFtaaX3QaHRtP7DbcQu7l2qh4DA/z0bYikCuhcYGi0GPEEtK3jyHnDYMW9iBH+raZHw8SXPUdlfiUFoTAhYSBZ3l9+UxQipLVDtLkMjbqGbR4y/BTzmn+OEeYQMt/WeaXDrHjoRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJoxuH97xL64rZNLMw7n/++K97ZZeoN+2fkUJVCzFdg=;
 b=vl0ELCVGqKLDRY2QAyHycpHlJ372J43x/cYOQ9d8VhomPG/d1J1ha5Y+I4hmhqWFLKp2KlNGQtfSHaUdcw/R52EG34wHO4P5bwVw9dOKj6g3b2gLHevIP7uU+0EgUQi4Cp0Lt+lGA0fmpB0YXjcghapK6KVd/Q6cC3eT1r2B6u0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB4028.namprd10.prod.outlook.com (2603:10b6:5:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 01:13:22 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2%4]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 01:13:22 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgABH8QCAAK30AIAAEm2AgAC9D4CAANfhgIAAx9cAgAUr2oCAASDzgIAAYuuAgABkcYCAABdUAIAAKLiA
Date: Wed, 2 Feb 2022 01:13:22 +0000
Message-ID: <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
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
In-Reply-To: <20220201154736.576e2a7e.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90d11773-9a87-43b6-ccf5-08d9e5e934f3
x-ms-traffictypediagnostic: DM6PR10MB4028:EE_
x-microsoft-antispam-prvs: <DM6PR10MB40280A2B9F2729E27D4C884590279@DM6PR10MB4028.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hGV/G7m8rPGU106Cu/OJJHpRODkNc/RRyAsSygGxDxY3M7zR0kEkMWDMcum6uQUOIEH7XPwLUq7SGaiKpcEcv8vezteYuAfd+OYLq1wOVaH2v7Nw3PsA8VrFn/HTtmrAVQmXr4QUH5MvKZOwhfh4r7Kbf3mngzsfKNWcNTNJl09JzRSuo+xpstKr37QYapPYccMvE45zkc9kBVgEU3nUwPojV1gQQxio0v7EGoDWo1309HNAbtIAYf3K0cKx4aAwGaUeDOi52FzA6H8cczOMRfYo0xp8y+fxuuVBBqiXqxcbF24MHs0umVVQTef1fbiITL3CoG0bp5KTcnKSJZzNxyCn+vzcEfNvaI1PJZebNJaBnrDCyl2dg1SO596AC0wN477YlLsD7UkMY3yKQCQavCXGRVRHCEivuCBM51nhgVJhrQKSlkZGCveJk+LjwssaeGYK+Te89D9TdM9Hba4GNN8K+fVDqwMxgb+1IYXjQYzNoia34cR1i4Imn7D7AkGwccoJvey/x9pjjz4n1p+WVjOsLpqvl8hMxoOWZVmFlEdvu4snyo9G5cZ/tTxMgUbu/h3A/jWdX1m2mwwtI4If9/zyRKVAcSTwAr61nfq0oM7hTIkeljYpyRIClXsGSBQLUIHNNI4fr2L2JIbNn8WT/3TWjRRcowqifGswGYpucLDgKhZtW1xAXbMlzfPVYyfzy9efjdXEpdbMfvmCdIO8GVoxNCNLwbpR1svYfiZPc4vOux5s00+Jr2Qd1o45htvn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(54906003)(8936002)(66476007)(64756008)(122000001)(8676002)(38070700005)(6486002)(76116006)(66946007)(6916009)(91956017)(316002)(2906002)(508600001)(83380400001)(71200400001)(5660300002)(38100700002)(36756003)(4326008)(86362001)(53546011)(6512007)(2616005)(6506007)(7416002)(186003)(44832011)(66556008)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFrOTR1M1RoQkl0UEx4L1p0MDRsTThRbFFRWG5WSVZvKzY4ZC8rVHFkcnZn?=
 =?utf-8?B?OFdheGh2OEE4RFBTbGFvREM4eE1Nc25KOW1GclQ0d0dZN1hxYmJEbWF1MWlt?=
 =?utf-8?B?c2c2OHZhREpTWTRlY0N0Mit4aEROZVE0TDhJeklmRlJYNHdZd0VnZzA3YmNu?=
 =?utf-8?B?RXVGRnpCaHU4Qmx0VzUvS2toZ3hRU1hHeFNYZmxCYUF1bWM3WTkxdHZjaTR0?=
 =?utf-8?B?NTFNcU1XTUJjVUtVeVBHYTBDaEhZL1oxSFE3bHE4YXhQN2RVWTBNYzBGZ2pR?=
 =?utf-8?B?NHZsRDJDaXRnL0pwQUcrSUU0bnJSY0I0Ny95TGc5Y1d6cE9FSi8xbzhDNTNm?=
 =?utf-8?B?VHozdzViNHhaQTA2ZGpWMVowYjcvVFJ0NUhtNUh3MDhNSFJSL3AxWTMxbGUv?=
 =?utf-8?B?bXYxaHBnQ0RQTHlwK1ZNdk1GVWxLNjVFZm1oN3d2MEsvMU1GOTFXbVF0dWtP?=
 =?utf-8?B?dnVUa29kWkZubWVMSVdxelVURTBSZTd6bmo3RmYzSFYrT29HV3B1V3c3TXJw?=
 =?utf-8?B?Z3A0VnR0cGV5ekNxMkJpeXJIbnpLWWNybEZSMzZNSkFEc1NnYkUwNUtaTGpE?=
 =?utf-8?B?VHExOXhYb1YvK1RUdHhybGk5aXV4OStUUjdocFhtaER6OXF1dkN0SnYxUXdk?=
 =?utf-8?B?S1RLOEdIblBvRUY4YzhsdGxWcW5WSzcwb1hwY2lNdmJyK1NTTW0yUUF6Mzha?=
 =?utf-8?B?Zys2Z3BYYlpGV00vUithaFNidW96UDl2Tlh4L0ppSlljT3NBc29wb0RFcUp2?=
 =?utf-8?B?WUJ1cC9yRmZPcjFPNW1adlJjY3R5a0VOUWtNekdlK2tRRTZyNnFaWTVKaXF1?=
 =?utf-8?B?L2s0ZWt0Zy8zQjM5QUhSSEhwdGdoYTUwMVRPT1dBUkJBaWdJcjdCeDU2OE92?=
 =?utf-8?B?ckF0TTQyT2wyWFkvSUxvQUd3UmdvVUdaU1g5L2NtbHpVTTE0bklYR254anNJ?=
 =?utf-8?B?dGpua09qV2hLbCtwZmlpK1NGUnVtVXVqK21EWWhlWm1RN0tNUk1IMzlwSEtu?=
 =?utf-8?B?OXRpTmhWVmdyMmxLQlM2QXNYVnRRdXNuRDZOMTJWak5FQnFDRkxyMmpyb1B3?=
 =?utf-8?B?MFR5S20vQU5WOTNEd1FZZ2JYcmxtdlJtVmhYZCtaSnJGSEdnTnYwT3RVWGsw?=
 =?utf-8?B?NjRxNDBXYTB2SkJ5ZnRiOW03S2FmUWJ4USs3SVNlQWZMQWd2dlY1NUZXRlVX?=
 =?utf-8?B?cG8yMzBEc3Nza0dPWmZwRUNoNlhUYkg1bTdXT3dnUE91QU1rQ2pWMzVLeUs1?=
 =?utf-8?B?SkloeXIyK0lZazR6Rm4xZHErL3hGYVZkVXZRVGs1djdtSm92bFF2MVVwKzFG?=
 =?utf-8?B?R1dGWk5LQXJ2MUNaSnprWWxUdlNqdUFyQ2ZsU2RxRFlRdWZDdDRyeE02ZXF6?=
 =?utf-8?B?WHNsL1l6SVRKOTlCeU94TEJ1T1JFQnZFcm9pNXAzQkpXYjBFNFJmNGh6YTVS?=
 =?utf-8?B?Rnk2b2hlRC8wTHN0d1hHb0puRDdaRWd5RjdhNGV6Sm5wbWczRy93RG5YaUFJ?=
 =?utf-8?B?UC9GYXlIN2dLaFNhY3dWdUh5MGhNYk1PVldHTTMvbVFnSXFPZ25kZmx2amtM?=
 =?utf-8?B?Z3d1ZmNIWUZvRVFxTUlOQjN0SGpmYUdwWDJkc1BBcThkeUtnM0JIODExWjB6?=
 =?utf-8?B?TWpmRGVOOTA2WWNROVB0ekh2Wnlzdm1OZnRiWHB2S0Rvb0JTeHhJM2xwYVpu?=
 =?utf-8?B?NWp6UjNpbGJaYjMwMHZhcTVSUzdldFU5NlNyS1dHeDYwVDdxTFU5UGV5UmZ4?=
 =?utf-8?B?a1dzdmMwV1E0OGx4MVdiN214OUN3Qmt4aXNPNG1LS1Z0c0Rqb0RGOFdOZjBP?=
 =?utf-8?B?NG9DbU90eldZbm03RlVRcmZOdTBUczVEeDZTTUl4OEV0ZlMwdWhTdERiQ2t1?=
 =?utf-8?B?NFB3QnNKRmF2MHRRcUdBY0xvZ2U2ZndsQnUxdFRwLytWTmlpaDVlNXQzanFu?=
 =?utf-8?B?RGg5ZXF0NHJWV0JXT094L0NqQ241SjZBS0IxUURnNThqQktoZjBmNURudVc4?=
 =?utf-8?B?cnIvdHBtcFRjcVJ3SGNHSEg4ZUVMakhPNUNISDNWRHA0NXZzNkJOWVExM21X?=
 =?utf-8?B?NWFZcnJrVDRDMGxJT0grT1dKSkRUbml5Y3RuWktnTnA0NXlJRnZLTlN3U1JX?=
 =?utf-8?B?VEZ0TzE1Y0xiN09DT1NSMjBFY0Zkei9LNXk4cnZaUitwNG5ZU21DRVVocHpD?=
 =?utf-8?B?aDNUWGpaVHo5RTdiM3FKYXJNNm5YWUJSMWFaTnRNcVdJbjhLbHN0K0lzRU5T?=
 =?utf-8?B?S2sxdy94bXRGZy9SMDlMcWtJZ3NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <050DCE82934F3740AE2E55CCBFD029E0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d11773-9a87-43b6-ccf5-08d9e5e934f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 01:13:22.6607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zvbqw84bUgv1T3eOqR9YJ/Oi7nyNRFP/oaN7V/yZL5SqlKCGcVpCKu53WT8cloesRAT3k0E5XNHweOwSqbBAZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4028
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10245
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020003
X-Proofpoint-ORIG-GUID: 9N6NTF6vE-Ljn3F-Brs_RdHpBOeYv1jn
X-Proofpoint-GUID: 9N6NTF6vE-Ljn3F-Brs_RdHpBOeYv1jn
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

DQoNCj4gT24gRmViIDEsIDIwMjIsIGF0IDU6NDcgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAxIEZlYiAyMDIyIDIx
OjI0OjA4ICswMDAwDQo+IEphZyBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+IHdyb3RlOg0K
PiANCj4+PiBPbiBGZWIgMSwgMjAyMiwgYXQgMTA6MjQgQU0sIEFsZXggV2lsbGlhbXNvbiA8YWxl
eC53aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgMSBGZWIg
MjAyMiAwOTozMDozNSArMDAwMA0KPj4+IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4+IE9uIE1vbiwgSmFuIDMxLCAyMDIyIGF0IDA5OjE2OjIz
QU0gLTA3MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZTogIA0KPj4+Pj4gT24gRnJpLCAyOCBKYW4g
MjAyMiAwOToxODowOCArMDAwMA0KPj4+Pj4gU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4+IE9uIFRodSwgSmFuIDI3LCAyMDIyIGF0IDAy
OjIyOjUzUE0gLTA3MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZTogICAgDQo+Pj4+Pj4+IElmIHRo
ZSBnb2FsIGhlcmUgaXMgdG8gcmVzdHJpY3QgRE1BIGJldHdlZW4gZGV2aWNlcywgaWUuIHBlZXIt
dG8tcGVlcg0KPj4+Pj4+PiAocDJwKSwgd2h5IGFyZSB3ZSB0cnlpbmcgdG8gcmUtaW52ZW50IHdo
YXQgYW4gSU9NTVUgYWxyZWFkeSBkb2VzPyAgICAgIA0KPj4+Pj4+IA0KPj4+Pj4+IFRoZSBpc3N1
ZSBEYXZlIHJhaXNlZCBpcyB0aGF0IHZmaW8tdXNlciBzZXJ2ZXJzIHJ1biBpbiBzZXBhcmF0ZQ0K
Pj4+Pj4+IHByb2Nlc3NzZXMgZnJvbSBRRU1VIHdpdGggc2hhcmVkIG1lbW9yeSBhY2Nlc3MgdG8g
UkFNIGJ1dCBubyBkaXJlY3QNCj4+Pj4+PiBhY2Nlc3MgdG8gbm9uLVJBTSBNZW1vcnlSZWdpb25z
LiBUaGUgdmlydGlvZnMgREFYIFdpbmRvdyBCQVIgaXMgb25lDQo+Pj4+Pj4gZXhhbXBsZSBvZiBh
IG5vbi1SQU0gTWVtb3J5UmVnaW9uIHRoYXQgY2FuIGJlIHRoZSBzb3VyY2UvdGFyZ2V0IG9mIERN
QQ0KPj4+Pj4+IHJlcXVlc3RzLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsgSU9NTVVz
IHNvbHZlIHRoaXMgcHJvYmxlbSBidXQgbHVja2lseSB0aGUgdmZpby11c2VyDQo+Pj4+Pj4gcHJv
dG9jb2wgYWxyZWFkeSBoYXMgbWVzc2FnZXMgdGhhdCB2ZmlvLXVzZXIgc2VydmVycyBjYW4gdXNl
IGFzIGENCj4+Pj4+PiBmYWxsYmFjayB3aGVuIERNQSBjYW5ub3QgYmUgY29tcGxldGVkIHRocm91
Z2ggdGhlIHNoYXJlZCBtZW1vcnkgUkFNDQo+Pj4+Pj4gYWNjZXNzZXMuDQo+Pj4+Pj4gDQo+Pj4+
Pj4+IEluDQo+Pj4+Pj4+IGZhY3QsIGl0IHNlZW1zIGxpa2UgYW4gSU9NTVUgZG9lcyB0aGlzIGJl
dHRlciBpbiBwcm92aWRpbmcgYW4gSU9WQQ0KPj4+Pj4+PiBhZGRyZXNzIHNwYWNlIHBlciBCREYu
ICBJcyB0aGUgZHluYW1pYyBtYXBwaW5nIG92ZXJoZWFkIHRvbyBtdWNoPyAgV2hhdA0KPj4+Pj4+
PiBwaHlzaWNhbCBoYXJkd2FyZSBwcm9wZXJ0aWVzIG9yIHNwZWNpZmljYXRpb25zIGNvdWxkIHdl
IGxldmVyYWdlIHRvDQo+Pj4+Pj4+IHJlc3RyaWN0IHAycCBtYXBwaW5ncyB0byBhIGRldmljZT8g
IFNob3VsZCBpdCBiZSBnb3Zlcm5lZCBieSBtYWNoaW5lDQo+Pj4+Pj4+IHR5cGUgdG8gcHJvdmlk
ZSBjb25zaXN0ZW5jeSBiZXR3ZWVuIGRldmljZXM/ICBTaG91bGQgZWFjaCAiaXNvbGF0ZWQiDQo+
Pj4+Pj4+IGJ1cyBiZSBpbiBhIHNlcGFyYXRlIHJvb3QgY29tcGxleD8gIFRoYW5rcywgICAgICAN
Cj4+Pj4+PiANCj4+Pj4+PiBUaGVyZSBpcyBhIHNlcGFyYXRlIGlzc3VlIGluIHRoaXMgcGF0Y2gg
c2VyaWVzIHJlZ2FyZGluZyBpc29sYXRpbmcgdGhlDQo+Pj4+Pj4gYWRkcmVzcyBzcGFjZSB3aGVy
ZSBCQVIgYWNjZXNzZXMgYXJlIG1hZGUgKGkuZS4gdGhlIGdsb2JhbA0KPj4+Pj4+IGFkZHJlc3Nf
c3BhY2VfbWVtb3J5L2lvKS4gV2hlbiBvbmUgcHJvY2VzcyBob3N0cyBtdWx0aXBsZSB2ZmlvLXVz
ZXINCj4+Pj4+PiBzZXJ2ZXIgaW5zdGFuY2VzIChlLmcuIGEgc29mdHdhcmUtZGVmaW5lZCBuZXR3
b3JrIHN3aXRjaCB3aXRoIG11bHRpcGxlDQo+Pj4+Pj4gZXRoZXJuZXQgZGV2aWNlcykgdGhlbiBl
YWNoIGluc3RhbmNlIG5lZWRzIGlzb2xhdGVkIG1lbW9yeSBhbmQgaW8gYWRkcmVzcw0KPj4+Pj4+
IHNwYWNlcyBzbyB0aGF0IHZmaW8tdXNlciBjbGllbnRzIGRvbid0IGNhdXNlIGNvbGxpc2lvbnMg
d2hlbiB0aGV5IG1hcA0KPj4+Pj4+IEJBUnMgdG8gdGhlIHNhbWUgYWRkcmVzcy4NCj4+Pj4+PiAN
Cj4+Pj4+PiBJIHRoaW5rIHRoZSB0aGUgc2VwYXJhdGUgcm9vdCBjb21wbGV4IGlkZWEgaXMgYSBn
b29kIHNvbHV0aW9uLiBUaGlzDQo+Pj4+Pj4gcGF0Y2ggc2VyaWVzIHRha2VzIGEgZGlmZmVyZW50
IGFwcHJvYWNoIGJ5IGFkZGluZyB0aGUgY29uY2VwdCBvZg0KPj4+Pj4+IGlzb2xhdGVkIGFkZHJl
c3Mgc3BhY2VzIGludG8gaHcvcGNpLy4gICAgDQo+Pj4+PiANCj4+Pj4+IFRoaXMgYWxsIHN0aWxs
IHNlZW1zIHByZXR0eSBza2V0Y2h5LCBCQVJzIGNhbm5vdCBvdmVybGFwIHdpdGhpbiB0aGUNCj4+
Pj4+IHNhbWUgdkNQVSBhZGRyZXNzIHNwYWNlLCBwZXJoYXBzIHdpdGggdGhlIGV4Y2VwdGlvbiBv
ZiB3aGVuIHRoZXkncmUNCj4+Pj4+IGJlaW5nIHNpemVkLCBidXQgRE1BIHNob3VsZCBiZSBkaXNh
YmxlZCBkdXJpbmcgc2l6aW5nLg0KPj4+Pj4gDQo+Pj4+PiBEZXZpY2VzIHdpdGhpbiB0aGUgc2Ft
ZSBWTSBjb250ZXh0IHdpdGggaWRlbnRpY2FsIEJBUnMgd291bGQgbmVlZCB0bw0KPj4+Pj4gb3Bl
cmF0ZSBpbiBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMuICBGb3IgZXhhbXBsZSBhIHRyYW5zbGF0
aW9uIG9mZnNldA0KPj4+Pj4gaW4gdGhlIHZDUFUgYWRkcmVzcyBzcGFjZSB3b3VsZCBhbGxvdyB1
bmlxdWUgYWRkcmVzc2luZyB0byB0aGUgZGV2aWNlcywNCj4+Pj4+IHBlcmhhcHMgdXNpbmcgdGhl
IHRyYW5zbGF0aW9uIG9mZnNldCBiaXRzIHRvIGFkZHJlc3MgYSByb290IGNvbXBsZXggYW5kDQo+
Pj4+PiBtYXNraW5nIHRob3NlIGJpdHMgZm9yIGRvd25zdHJlYW0gdHJhbnNhY3Rpb25zLg0KPj4+
Pj4gDQo+Pj4+PiBJbiBnZW5lcmFsLCB0aGUgZGV2aWNlIHNpbXBseSBvcGVyYXRlcyBpbiBhbiBh
ZGRyZXNzIHNwYWNlLCBpZS4gYW4NCj4+Pj4+IElPVkEuICBXaGVuIGEgbWFwcGluZyBpcyBtYWRl
IHdpdGhpbiB0aGF0IGFkZHJlc3Mgc3BhY2UsIHdlIHBlcmZvcm0gYQ0KPj4+Pj4gdHJhbnNsYXRp
b24gYXMgbmVjZXNzYXJ5IHRvIGdlbmVyYXRlIGEgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcy4gIFRo
ZQ0KPj4+Pj4gSU9WQSBpdHNlbGYgaXMgb25seSBtZWFuaW5nZnVsIHdpdGhpbiB0aGUgY29udGV4
dCBvZiB0aGUgYWRkcmVzcyBzcGFjZSwNCj4+Pj4+IHRoZXJlIGlzIG5vIHJlcXVpcmVtZW50IG9y
IGV4cGVjdGF0aW9uIGZvciBpdCB0byBiZSBnbG9iYWxseSB1bmlxdWUuDQo+Pj4+PiANCj4+Pj4+
IElmIHRoZSB2ZmlvLXVzZXIgc2VydmVyIGlzIG1ha2luZyBzb21lIHNvcnQgb2YgcmVxdWlyZW1l
bnQgdGhhdCBJT1ZBcw0KPj4+Pj4gYXJlIHVuaXF1ZSBhY3Jvc3MgYWxsIGRldmljZXMsIHRoYXQg
c2VlbXMgdmVyeSwgdmVyeSB3cm9uZy4gIFRoYW5rcywgICAgDQo+Pj4+IA0KPj4+PiBZZXMsIEJB
UnMgYW5kIElPVkFzIGRvbid0IG5lZWQgdG8gYmUgdW5pcXVlIGFjcm9zcyBhbGwgZGV2aWNlcy4N
Cj4+Pj4gDQo+Pj4+IFRoZSBpc3N1ZSBpcyB0aGF0IHRoZXJlIGNhbiBiZSBhcyBtYW55IGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2VzIGFzDQo+Pj4+IHRoZXJlIGFyZSB2ZmlvLXVzZXIgY2xp
ZW50cyBjb25uZWN0ZWQsIHNvIHBlci1jbGllbnQgaXNvbGF0ZWQgYWRkcmVzcw0KPj4+PiBzcGFj
ZXMgYXJlIHJlcXVpcmVkLiBUaGlzIHBhdGNoIHNlcmllcyBoYXMgYSBzb2x1dGlvbiB0byB0aGF0
IHByb2JsZW0NCj4+Pj4gd2l0aCB0aGUgbmV3IHBjaV9pc29sX2FzX21lbS9pbygpIEFQSS4gIA0K
Pj4+IA0KPj4+IFNvcnJ5LCB0aGlzIHN0aWxsIGRvZXNuJ3QgZm9sbG93IGZvciBtZS4gIEEgc2Vy
dmVyIHRoYXQgaG9zdHMgbXVsdGlwbGUNCj4+PiBkZXZpY2VzIGFjcm9zcyBtYW55IFZNcyAoSSdt
IG5vdCBzdXJlIGlmIHlvdSdyZSByZWZlcnJpbmcgdG8gdGhlIGRldmljZQ0KPj4+IG9yIHRoZSBW
TSBhcyBhIGNsaWVudCkgbmVlZHMgdG8gZGVhbCB3aXRoIGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cyBwZXINCj4+PiBkZXZpY2UuICBUaGUgc2VydmVyIG5lZWRzIHRvIGJlIGFibGUgdG8gdW5pcXVl
bHkgaWRlbnRpZnkgZXZlcnkgRE1BLA0KPj4+IHdoaWNoIG11c3QgYmUgcGFydCBvZiB0aGUgaW50
ZXJmYWNlIHByb3RvY29sLiAgQnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0DQo+Pj4gaW1wb3NlcyBh
IHJlcXVpcmVtZW50IG9mIGFuIGlzb2xhdGVkIGFkZHJlc3Mgc3BhY2UuICBJZiB3ZSB3YW50IHRo
ZQ0KPj4+IGRldmljZSBpc29sYXRlZCBiZWNhdXNlIHdlIGRvbid0IHRydXN0IHRoZSBzZXJ2ZXIs
IHRoYXQncyB3aGVyZSBhbiBJT01NVQ0KPj4+IHByb3ZpZGVzIHBlciBkZXZpY2UgaXNvbGF0aW9u
LiAgV2hhdCBpcyB0aGUgcmVzdHJpY3Rpb24gb2YgdGhlDQo+Pj4gcGVyLWNsaWVudCBpc29sYXRl
ZCBhZGRyZXNzIHNwYWNlIGFuZCB3aHkgZG8gd2UgbmVlZCBpdD8gIFRoZSBzZXJ2ZXINCj4+PiBu
ZWVkaW5nIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2xpZW50cyBpcyBub3QgYSBzdWZmaWNpZW50IGFu
c3dlciB0bw0KPj4+IGltcG9zZSBuZXcgUENJIGJ1cyB0eXBlcyB3aXRoIGFuIGltcGxpY2l0IHJl
c3RyaWN0aW9uIG9uIHRoZSBWTS4gIA0KPj4gDQo+PiBIaSBBbGV4LA0KPj4gDQo+PiBJIGJlbGll
dmUgdGhlcmUgYXJlIHR3byBzZXBhcmF0ZSBwcm9ibGVtcyB3aXRoIHJ1bm5pbmcgUENJIGRldmlj
ZXMgaW4NCj4+IHRoZSB2ZmlvLXVzZXIgc2VydmVyLiBUaGUgZmlyc3Qgb25lIGlzIGNvbmNlcm5p
bmcgbWVtb3J5IGlzb2xhdGlvbiBhbmQNCj4+IHNlY29uZCBvbmUgaXMgdmVjdG9yaW5nIG9mIEJB
UiBhY2Nlc3NlcyAoYXMgZXhwbGFpbmVkIGJlbG93KS4NCj4+IA0KPj4gSW4gb3VyIHByZXZpb3Vz
IHBhdGNoZXMgKHYzKSwgd2UgdXNlZCBhbiBJT01NVSB0byBpc29sYXRlIG1lbW9yeQ0KPj4gc3Bh
Y2VzLiBCdXQgd2Ugc3RpbGwgaGFkIHRyb3VibGUgd2l0aCB0aGUgdmVjdG9yaW5nLiBTbyB3ZSBp
bXBsZW1lbnRlZA0KPj4gc2VwYXJhdGUgYWRkcmVzcyBzcGFjZXMgZm9yIGVhY2ggUENJQnVzIHRv
IHRhY2tsZSBib3RoIHByb2JsZW1zDQo+PiBzaW11bHRhbmVvdXNseSwgYmFzZWQgb24gdGhlIGZl
ZWRiYWNrIHdlIGdvdC4NCj4+IA0KPj4gVGhlIGZvbGxvd2luZyBnaXZlcyBhbiBvdmVydmlldyBv
ZiBpc3N1ZXMgY29uY2VybmluZyB2ZWN0b3Jpbmcgb2YNCj4+IEJBUiBhY2Nlc3Nlcy4NCj4+IA0K
Pj4gVGhlIGRldmljZeKAmXMgQkFSIHJlZ2lvbnMgYXJlIG1hcHBlZCBpbnRvIHRoZSBndWVzdCBw
aHlzaWNhbCBhZGRyZXNzDQo+PiBzcGFjZS4gVGhlIGd1ZXN0IHdyaXRlcyB0aGUgZ3Vlc3QgUEEg
b2YgZWFjaCBCQVIgaW50byB0aGUgZGV2aWNl4oCZcyBCQVINCj4+IHJlZ2lzdGVycy4gVG8gYWNj
ZXNzIHRoZSBCQVIgcmVnaW9ucyBvZiB0aGUgZGV2aWNlLCBRRU1VIHVzZXMNCj4+IGFkZHJlc3Nf
c3BhY2VfcncoKSB3aGljaCB2ZWN0b3JzIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFjY2VzcyB0byB0
aGUNCj4+IGRldmljZSBCQVIgcmVnaW9uIGhhbmRsZXJzLg0KPiANCj4gVGhlIGd1ZXN0IHBoeXNp
Y2FsIGFkZHJlc3Mgd3JpdHRlbiB0byB0aGUgQkFSIGlzIGlycmVsZXZhbnQgZnJvbSB0aGUNCj4g
ZGV2aWNlIHBlcnNwZWN0aXZlLCB0aGlzIG9ubHkgc2VydmVzIHRvIGFzc2lnbiB0aGUgQkFSIGFu
IG9mZnNldCB3aXRoaW4NCj4gdGhlIGFkZHJlc3Nfc3BhY2VfbWVtLCB3aGljaCBpcyB1c2VkIGJ5
IHRoZSB2Q1BVIChhbmQgcG9zc2libHkgb3RoZXINCj4gZGV2aWNlcyBkZXBlbmRpbmcgb24gdGhl
aXIgYWRkcmVzcyBzcGFjZSkuICBUaGVyZSBpcyBubyByZWFzb24gZm9yIHRoZQ0KPiBkZXZpY2Ug
aXRzZWxmIHRvIGNhcmUgYWJvdXQgdGhpcyBhZGRyZXNzLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBl
eHBsYW5hdGlvbiwgQWxleCENCg0KVGhlIGNvbmZ1c2lvbiBhdCBteSBwYXJ0IGlzIHdoZXRoZXIg
d2UgYXJlIGluc2lkZSB0aGUgZGV2aWNlIGFscmVhZHkgd2hlbg0KdGhlIHNlcnZlciByZWNlaXZl
cyBhIHJlcXVlc3QgdG8gYWNjZXNzIEJBUiByZWdpb24gb2YgYSBkZXZpY2UuIEJhc2VkIG9uDQp5
b3VyIGV4cGxhbmF0aW9uLCBJIGdldCB0aGF0IHlvdXIgdmlldyBpcyB0aGUgQkFSIGFjY2VzcyBy
ZXF1ZXN0IGhhcw0KcHJvcGFnYXRlZCBpbnRvIHRoZSBkZXZpY2UgYWxyZWFkeSwgd2hlcmVhcyBJ
IHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbg0KdGhhdCB0aGUgcmVxdWVzdCBpcyBzdGlsbCBvbiB0
aGUgQ1BVIHNpZGUgb2YgdGhlIFBDSSByb290IGNvbXBsZXguDQoNCllvdXIgdmlldyBtYWtlcyBz
ZW5zZSB0byBtZSAtIG9uY2UgdGhlIEJBUiBhY2Nlc3MgcmVxdWVzdCByZWFjaGVzIHRoZQ0KY2xp
ZW50IChvbiB0aGUgb3RoZXIgc2lkZSksIHdlIGNvdWxkIGNvbnNpZGVyIHRoYXQgdGhlIHJlcXVl
c3QgaGFzIHJlYWNoZWQNCnRoZSBkZXZpY2UuDQoNCk9uIGEgc2VwYXJhdGUgbm90ZSwgaWYgZGV2
aWNlcyBkb27igJl0IGNhcmUgYWJvdXQgdGhlIHZhbHVlcyBpbiBCQVINCnJlZ2lzdGVycywgd2h5
IGRvIHRoZSBkZWZhdWx0IFBDSSBjb25maWcgaGFuZGxlcnMgaW50ZXJjZXB0IGFuZCBtYXANCnRo
ZSBCQVIgcmVnaW9uIGludG8gYWRkcmVzc19zcGFjZV9tZW0/DQoocGNpX2RlZmF1bHRfd3JpdGVf
Y29uZmlnKCkgLT4gcGNpX3VwZGF0ZV9tYXBwaW5ncygpKQ0KDQpUaGFuayB5b3UhDQotLQ0KSmFn
DQoNCj4gDQo+PiBUaGUgUENJQnVzIGRhdGEgc3RydWN0dXJlIGFscmVhZHkgaGFzIGFkZHJlc3Nf
c3BhY2VfbWVtIGFuZA0KPj4gYWRkcmVzc19zcGFjZV9pbyB0byBjb250YWluIHRoZSBCQVIgcmVn
aW9ucyBvZiBkZXZpY2VzIGF0dGFjaGVkDQo+PiB0byBpdC4gSSB1bmRlcnN0YW5kIHRoYXQgdGhl
c2UgdHdvIFBDSUJ1cyBtZW1iZXJzIGZvcm0gdGhlDQo+PiBQQ0kgYWRkcmVzcyBzcGFjZS4NCj4g
DQo+IFRoZXNlIGFyZSB0aGUgQ1BVIGFkZHJlc3Mgc3BhY2VzLiAgV2hlbiB0aGVyZSdzIG5vIElP
TU1VLCB0aGUgUENJIGJ1cyBpcw0KPiBpZGVudGl0eSBtYXBwZWQgdG8gdGhlIENQVSBhZGRyZXNz
IHNwYWNlLiAgV2hlbiB0aGVyZSBpcyBhbiBJT01NVSwgdGhlDQo+IGRldmljZSBhZGRyZXNzIHNw
YWNlIGlzIGRldGVybWluZWQgYnkgdGhlIGdyYW51bGFyaXR5IG9mIHRoZSBJT01NVSBhbmQNCj4g
bWF5IGJlIGVudGlyZWx5IHNlcGFyYXRlIGZyb20gYWRkcmVzc19zcGFjZV9tZW0uDQo+IA0KPiBJ
L08gcG9ydCBzcGFjZSBpcyBhbHdheXMgdGhlIGlkZW50aXR5IG1hcHBlZCBDUFUgYWRkcmVzcyBz
cGFjZSB1bmxlc3MNCj4gc3BhcnNlIHRyYW5zbGF0aW9ucyBhcmUgdXNlZCB0byBjcmVhdGUgbXVs
dGlwbGUgSS9PIHBvcnQgc3BhY2VzIChub3QNCj4gaW1wbGVtZW50ZWQpLiAgSS9PIHBvcnQgc3Bh
Y2UgaXMgb25seSBhY2Nlc3NlZCBieSB0aGUgQ1BVLCB0aGVyZSBhcmUgbm8NCj4gZGV2aWNlIGlu
aXRpYXRlZCBJL08gcG9ydCB0cmFuc2FjdGlvbnMsIHNvIHRoZSBhZGRyZXNzIHNwYWNlIHJlbGF0
aXZlDQo+IHRvIHRoZSBkZXZpY2UgaXMgaXJyZWxldmFudC4NCj4gDQo+PiBUeXBpY2FsbHksIHRo
ZSBtYWNoaW5lcyBtYXAgdGhlIFBDSSBhZGRyZXNzIHNwYWNlIGludG8gdGhlIHN5c3RlbSBhZGRy
ZXNzDQo+PiBzcGFjZS4gRm9yIGV4YW1wbGUsIHBjX3BjaV9hc19tYXBwaW5nX2luaXQoKSBkb2Vz
IHRoaXMgZm9yIOKAmHBjJyBtYWNoaW5lIHR5cGVzLg0KPj4gQXMgc3VjaCwgdGhlcmUgaXMgYSAx
OjEgbWFwcGluZyBiZXR3ZWVuIHN5c3RlbSBhZGRyZXNzIHNwYWNlIGFuZCBQQ0kgYWRkcmVzcw0K
Pj4gc3BhY2Ugb2YgdGhlIHJvb3QgYnVzLiBTaW5jZSBhbGwgdGhlIFBDSSBkZXZpY2VzIGluIHRo
ZSBtYWNoaW5lIGFyZSBhc3NpZ25lZCB0bw0KPj4gdGhlIHNhbWUgVk0sIHdlIGNvdWxkIG1hcCB0
aGUgUENJIGFkZHJlc3Mgc3BhY2Ugb2YgYWxsIFBDSSBidXNlcyB0byB0aGUgc2FtZQ0KPj4gc3lz
dGVtIGFkZHJlc3Mgc3BhY2UuDQo+IA0KPiAiVHlwaWNhbGx5IiBvbmx5IGlmIHdlJ3JlIHJlc3Ry
aWN0ZWQgdG8gdGhlICJwYyIsIGllLiBpNDQwRlgsIG1hY2hpbmUNCj4gdHlwZSBzaW5jZSBpdCBk
b2Vzbid0IHN1cHBvcnQgYSB2SU9NTVUuICBUaGVyZSdzIG5vIHJlYXNvbiB0byBmb2N1cyBvbg0K
PiB0aGUgaWRlbnRpdHkgbWFwIGNhc2UgdmVyc3VzIHRoZSB2SU9NTVUgY2FzZS4NCj4gDQo+PiBX
aGVyZWFzIGluIHRoZSBjYXNlIG9mIHZmaW8tdXNlciwgdGhlIGRldmljZXMgcnVubmluZyBpbiB0
aGUgc2VydmVyIGNvdWxkDQo+PiBiZWxvbmcgdG8gZGlmZmVyZW50IFZNcy4gVGhlcmVmb3JlLCBh
bG9uZyB3aXRoIHRoZSBwaHlzaWNhbCBhZGRyZXNzLCB3ZSB3b3VsZA0KPj4gbmVlZCB0byBrbm93
IHRoZSBhZGRyZXNzIHNwYWNlIHRoYXQgdGhlIGRldmljZSBiZWxvbmdzIGZvcg0KPj4gYWRkcmVz
c19zcGFjZV9ydygpIHRvIHN1Y2Nlc3NmdWxseSB2ZWN0b3IgQkFSIGFjY2Vzc2VzIGludG8gdGhl
IFBDSSBkZXZpY2UuDQo+IA0KPiBCdXQgYXMgZmFyIGFzIGRldmljZSBpbml0aWF0ZWQgdHJhbnNh
Y3Rpb25zLCB0aGVyZSBpcyBvbmx5IG9uZSBhZGRyZXNzDQo+IHNwYWNlIGZvciBhIGdpdmVuIGRl
dmljZSwgaXQncyBlaXRoZXIgYWRkcmVzc19zcGFjZV9tZW0gb3Igb25lIHByb3ZpZGVkDQo+IGJ5
IHRoZSB2SU9NTVUgYW5kIHBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZSgpIHRlbGxzIHVz
IHRoYXQNCj4gYWRkcmVzcyBzcGFjZS4gIEZ1cnRoZXJtb3JlLCB0aGUgZGV2aWNlIG5ldmVyIG9w
ZXJhdGVzIG9uIGEgInBoeXNpY2FsDQo+IGFkZHJlc3MiLCBpdCBvbmx5IGV2ZXIgb3BlcmF0ZXMg
b24gYW4gSU9WQSwgaWUuIGFuIG9mZnNldCB3aXRoaW4gdGhlDQo+IGFkZHJlc3Mgc3BhY2UgYXNz
aWduZWQgdG8gdGhlIGRldmljZS4gIFRoZSBJT1ZBIHNob3VsZCBiZSBjb25zaWRlcmVkDQo+IGFy
Yml0cmFyeSByZWxhdGl2ZSB0byBtYXBwaW5ncyBpbiBhbnkgb3RoZXIgYWRkcmVzcyBzcGFjZXMu
DQo+IA0KPiBEZXZpY2UgaW5pdGlhdGVkIHRyYW5zYWN0aW9ucyBvcGVyYXRlIG9uIGFuIElPVkEg
d2l0aGluIHRoZSAoc2luZ2xlKQ0KPiBhZGRyZXNzIHNwYWNlIHRvIHdoaWNoIHRoZSBkZXZpY2Ug
aXMgYXNzaWduZWQuICBBbnkgYXR0ZW1wdCB0byBkbw0KPiBvdGhlcndpc2UgdmlvbGF0ZXMgdGhl
IGlzb2xhdGlvbiBwdXQgaW4gcGxhY2UgYnkgdGhpbmdzIGxpa2UgdklPTU1Vcw0KPiBhbmQgb3Vn
aHQgdG8gYmUgY29uc2lkZXJlZCBhIHNlY3VyaXR5IGNvbmNlcm4sIGVzcGVjaWFsbHkgZm9yIGEg
ZGV2aWNlDQo+IHNlcnZpY2VkIGJ5IGFuIGV4dGVybmFsIHByb2Nlc3MuICBUaGFua3MsDQo+IA0K
PiBBbGV4DQo+IA0KDQo=

