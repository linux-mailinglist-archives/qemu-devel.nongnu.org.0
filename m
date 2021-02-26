Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07932645A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:49:39 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeQz-0007Sj-Oh
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lFePk-00072c-De
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:48:20 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:52138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lFePh-00049r-Ns
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:48:19 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QEiQkA072321;
 Fri, 26 Feb 2021 14:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=DCq8aGrcKF6vwm8KRzgqWAeI+nZbjIN5Ng3Tae+qfeA=;
 b=gn+ntyN0Fd21vl9NiXSEfyhLKn2aDFTX/gQ8NwfZfSd0e/+mFP4PLnIzGob88vg1vqQs
 apwjLLCuy/9pLV6Bc8EhwrOMc2ThHEB/kzx2hmUjNX+ZTBPxPgO0Z+ZRA9bB9H+ArJac
 IGV4l2Q/qPHcQNoNOdNURNaizTnQWlPM7yjSGHf8hezWr3aBZXFNEuod6Nda1LTfoQPs
 gY08dLyJiLJ527nijkIzacFV4vuQIg7WjxpzjaATbXlTHPCnhdMzmUE5iOVzMhxIRlnc
 hcu5ePP478xeU84mynd74XefjyP71xoPFqvt1fm57PhT8fIw+2Z7GabYMGbrMwxql69+ jA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36vr62cj0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 14:48:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QEYkf1049129;
 Fri, 26 Feb 2021 14:48:14 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
 by aserp3020.oracle.com with ESMTP id 36ucb3g617-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 14:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPNA4gvYCMnEQcjI3+wmrMIyNXiBptOAvUFMz7UfG/e+73pXOt5dgFIqaoCCXpHVa+/hSjk9UXKY0WtpWIf7Edvw1Tqk1RZCQDs9uQAeQTvpL2ayodszWeSitWf0NBU7+7m0Lyxbg6Zp3TSrH7JiZJSwXIwYwG0EMGDhHAjcwHLZncx6yyckFyrHQ/qHv2B++RTA2D4ip2WVcGTw8N8O9swQiAcbL3zS9C2PY4EZDaiqd2zKgtWH7DygQywNiClJqx3p835gRIy2rokjSBnoumlExJnIDBq1wqfsxEX2M0OhCkqnFBkpGuG0DHztzAJJB0r+nPqNTkPBZovjNQvUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCq8aGrcKF6vwm8KRzgqWAeI+nZbjIN5Ng3Tae+qfeA=;
 b=Ps7IOjo5kfWT8OuBmOmpbA+gMkMsI7lEYc/r7n6xNIplxYt/E+2SP1uGDRQbavFpQPx7lED8tpcmJrP42kmZ+hI2Cx2ZwFST77JZbSFxiQg6DhyQ3g18usq2Od69U03j622Cb9wFg/Rk8h8hktQxActiRQMzojYcr8GPvBjEGuG5ng1Uxx+Tm169FeiEvqFomc6pqr4Ub1Axw2tTjobSjDLK4FPo6bmL/fVWykiteFK31VSm5KIh0y0SnU8LyiUiuOdjNkPYFprUVVEn3a3K66aUyqzh0EhxxKNVqUNUh1eNbPpveYZo4Jjm3Z/wBQSS0NRM+uCG5N1EX+UKIGLTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCq8aGrcKF6vwm8KRzgqWAeI+nZbjIN5Ng3Tae+qfeA=;
 b=rs3uKaIze8rpqOmV9ifMEq+zZNLJ2XiJ1rAPTCI5SvWXM5UxoS24TkwhzV/pMVVmxzEeWKQvWMKgMJ5c3UQGAxn2B6GEDjyti6vO8CPtWuo8JTbVAZQm2SYt3hNacPkjOMNBFAkOWXrA0Eh98MyGiFp7AbMoCDAE7a4ZUuwcWqw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BL0PR10MB2915.namprd10.prod.outlook.com (2603:10b6:208:74::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 14:48:12 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471%6]) with mapi id 15.20.3868.035; Fri, 26 Feb 2021
 14:48:12 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] docs: replace master/slave with more accurate wording
Thread-Topic: [PATCH 0/3] docs: replace master/slave with more accurate wording
Thread-Index: AQHXDEx8UpDf+B8iGU+iD+oi43iw2apqhDWA
Date: Fri, 26 Feb 2021 14:48:12 +0000
Message-ID: <E822F51A-1555-4274-A755-43376260841A@oracle.com>
References: <20210226143413.188046-1-pbonzini@redhat.com>
In-Reply-To: <20210226143413.188046-1-pbonzini@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:f9a6:a78a:2be:8da7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 769303bf-7dd2-4007-014f-08d8da658ab2
x-ms-traffictypediagnostic: BL0PR10MB2915:
x-microsoft-antispam-prvs: <BL0PR10MB2915E50C01001E0F75301B9A909D9@BL0PR10MB2915.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtb0Br9wsQeEE+07w276x+Tx70BySB7zS9SdsmOUx+9qsZs79HSycuwjQeKyeXtuGn63ltoCymxMabX03zzBhcLfbFZq6/GEyjNE7JBUIiKEqyo8JbJdZLOnfbbkiyZs5CPcVRDMu1fa1KSObfjMVLPObJaaoBGs38Vq3UEPd+o//q7zlcCs3j0bfHeXvQnRQpYzNMmD1bC/N2UDU7ovmzv9vFVeufnDE/ngOJw+UtgAf0MiAh0nrdm47k8mLxr2GS8FQSUuX/KyX5PJEF7CKNXyCYY1UgyOghqaC+VmTRhxMDBKVBq/eBTs01hBlzkjtSflMyV+T3EgCRUTsKjujZZsJ1LWmBT6szSWKVg3QCREyhAapxfmQ9f2DUCBk53qPqz7LsFjgkITVjyXeGOdwSGpl5C3kpk3BM5nNA0ajJqpuj7vnbh39f1kGbmicsGH4OyF9xlK/3gRiEDMovK+RdQ/KrvmTw/Q8Jhwkb/7H9NP7AsH9kN4K/pQDoxLxUh8QEnj7RV26+zYPLMTgLLNzg9oGQEP4RcYzqqMFkd6eiuFfb+pqLyGxXlkhZVNsJvxphf8PCidDKdH/xjlGIzZvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(346002)(396003)(136003)(478600001)(44832011)(8676002)(66946007)(8936002)(64756008)(71200400001)(66446008)(83380400001)(6506007)(2616005)(86362001)(33656002)(36756003)(4744005)(6916009)(66476007)(66556008)(6512007)(53546011)(76116006)(2906002)(316002)(186003)(5660300002)(91956017)(4326008)(54906003)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TEZNQWhmeUdxSEdsM3o0UWdHMFFKam03Rkk3b2xFV2Z2NGRCaWtwTXJPSG8y?=
 =?utf-8?B?L01CdFpKNEN5bXYxbkhqZVJaK3dFVUZoTXhpOTVtcDdDVHYvQzZpcUdNQ1JC?=
 =?utf-8?B?dllaTGJTVnQydlY4ay9vN3dyZFBXQnY2Y0krKzhZMUxCWEFrdGV2UEFTUGgv?=
 =?utf-8?B?VnRtTmZsRWlnUjJneFZXQVVRZ3Q2bkRBcWVlUXhsVlFNeXZKRGhTR1lQK2F5?=
 =?utf-8?B?Q25Cb0NoVVpza2JaQW4raThxZDRyZ0VsU0M0ZjN5YjN2eVJYcDdha3Z4aHFI?=
 =?utf-8?B?NGVITUJ1cHc5a0pteVZsZ2pMWFByM3p2S0hpRVM4ZG16MmREUmpHSnFDMWhz?=
 =?utf-8?B?c1Ivc0Z2TjJoMVo2bElNSjR6eHc2eE8yMHQxZDZVT0ZNZGZjUTh1MFgrNTM0?=
 =?utf-8?B?aXk1cmZCVTY4bWo5NGY1aThxWVU1VXZCdEFTR0ZCNXVGK3cvckFqWk9QTE1G?=
 =?utf-8?B?Y1diY2hPcUxtOHZYeW8rKzZqTUkwZGdUbVIzS05tSDhPVkNpZnF5TmQ4N2tT?=
 =?utf-8?B?OVlZTklCMFJ3TXBjeU1tRTFlZjFmRWJ6SzliYkVMTXFIM2s5QmNLNkdZTjRk?=
 =?utf-8?B?YUtudDlsc3pJR0N6Zm4ydGFwcXZlZEhEMEozcDZ3ME9kY0FCVlVId3pnT2ZF?=
 =?utf-8?B?aDZvNXV4aW01NW5mQ1UyMnQzWkUwakZRNzJSM24zcC80d2ErWkNRZ3pEWEVH?=
 =?utf-8?B?dlM3Mi9RV3dJTCtYU2ZGTUFoa3Jmb0g3SlFBWFhMa0NsMUQydUl3a2l2Q01V?=
 =?utf-8?B?bTEraEpieVdMWU1SY0ZDZlpxQ2txSDZLVHdJZkhObjhuWFYreXlsVy9PSlBj?=
 =?utf-8?B?VThHV3RZem5za1FMNVdYQWdFRExxbHp2cFlBWXQzcmF3WmYzTU9Kd0liOHlV?=
 =?utf-8?B?M1VWRGVEWjBQY3FLQ21Ba3lacXRkdTQrUzI2R1JJS2MxYmNwMGt0Szl4VUtF?=
 =?utf-8?B?dW13OTdBVVd5ZFFtdDVmL1pieHR5eTlBbTJXMWZyRVgrYUxMTzFxTEtVdWYz?=
 =?utf-8?B?cm9nOVNzNFZ2UHcxWTdaZmZSMERPNkRKc2diNjEwMCtzWGt6V1RXTjdPMGlp?=
 =?utf-8?B?bWZJNXQ5VUhwMjdFcXdndVlKdGdvWk10dkc2TVpQSlRMRzk1dFJvUVIzckVm?=
 =?utf-8?B?R1Frc0hFc3ZRbWJsOUVJdk1Xdy9jK3pGdDhtT3lGZXBMN2tHTUs4Y3pzMWxC?=
 =?utf-8?B?d0lMMkczc1BadllxRUd4dDRLNGZlSjNSTEUwU1REVVRMajJ5VFFQQmlBM1lM?=
 =?utf-8?B?WFk2SStwKzVldHJwMFpnVTQ4b05tbkt6R2VaRURJZTVaT083N2w2RXZCN1Jw?=
 =?utf-8?B?VVBSVWdjM3REbWR2QlE4L0RIRFB0ajFnK1JySTdZNStvdkgxZm1GUmlpUXd6?=
 =?utf-8?B?TVVrT3N1VmxyL0NwZ2NtTitxL05rU2E0dEhJUFRWR2ZLZGJaNFExMzE4QmJY?=
 =?utf-8?B?dEZIOWc5UkRBRjZydDNOU3BUMWxUZjJ0QVdST3FGMnlKb2ozN0prdlZFd2dB?=
 =?utf-8?B?TzVhV0x0emdWKzNrbmpnM3VxY2FVaTJkWVRjUmpFbzJYRjhvSllsT0lnRDlS?=
 =?utf-8?B?UTVob05OSHFVZGFaclludE1RRUJsdmhybUZ4Y2xDYUZrNndjdDFaZkU2S0Iy?=
 =?utf-8?B?V01lRjhHV3R1QU9vRnhoN0VjcngzSkpQWEZ6UWVMRmFqTjdDTlBla0tsQ20w?=
 =?utf-8?B?b3VWeEZiQzZ1WjFuUkhzNE1JbnRJZUVOOHBQdGt3d2tqY2NDQktFY3R2UDM5?=
 =?utf-8?B?NWt2cUIxS0NTMGxPeWZPbWsvN2p1STRrODhCZ3VRSXlZdm1nMDU5TVVBWEsx?=
 =?utf-8?B?czJRQmlvYkFQbEtMUW84UjRySWV1cThJYmorcDJ4K2FBaVNwcVJ2VXFXbjFn?=
 =?utf-8?Q?3mcTIh4H03n3r?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E94252BD9771D1449535790ED720A5D3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769303bf-7dd2-4007-014f-08d8da658ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 14:48:12.4689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKYWrcrOtWCIRFYPs59xcupFG26MFw0q2n4GoVV58+p3+HJcZ42lSj22CzsINVyq436Mb6h+dAzRHeBS6lz/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2915
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260114
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260114
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "mst@redhat.com" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDI2LCAyMDIxLCBhdCA5OjM0IEFNLCBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IFVzdWFsbHkgZnJvbnQtZW5kL2JhY2stZW5kIGFy
ZSB1c2VkIGZvciB0aGUgdHdvIHZob3N0IHNpZGVzIHJhdGhlciB0aGFuDQo+IG1hc3Rlci9zbGF2
ZS4gIFVzZSB0aGVtIGluIHRoZSBkb2N1bWVudGF0aW9uIGFzIHRoZXkgaWRlbnRpZnkgbW9yZQ0K
PiBjbGVhcmx5IHdoYXQgaXMgZ29pbmcgb24gKHBsdXMsIHRoZSBkb2N1bWVudGF0aW9uIHdhcyBz
b21ldGltZXMgdXNpbmcNCj4gY2xpZW50L3NlcnZlciBpbnN0ZWFkKS4NCj4gDQo+IEphZywgd291
bGQgeW91IG1pbmQgZG9pbmcgdGhlIHNhbWUgZm9yIG11bHRpcHJvY2VzcyB0b28/DQoNCkhpIFBh
b2xvLA0KDQpTdXJlLCBJ4oCZbGwgY2hhbmdlIHRoZSByZWZlcmVuY2VzIHRvIG1hc3Rlci9zbGF2
ZSB0ZXJtaW5vbG9neSBmb3IgbXVsdGlwcm9jZXNzLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoN
Cj4gDQo+IFBhb2xvDQo+IA0KPiBQYW9sbyBCb256aW5pICgzKToNCj4gIGRvY3M6IHZob3N0LXVz
ZXI6IGNsZWFuIHVwIHJlcXVlc3QvcmVwbHkgZGVzY3JpcHRpb24NCj4gIGRvY3M6IHZob3N0LXVz
ZXI6IHJld3JpdGUgc2VjdGlvbiBvbiByaW5nIHN0YXRlIG1hY2hpbmUNCj4gIGRvY3M6IHZob3N0
LXVzZXI6IHJlcGxhY2UgbWFzdGVyL3NsYXZlIHdpdGggZnJvbnQtZW5kL2JhY2stZW5kDQo+IA0K
PiBkb2NzL2ludGVyb3Avdmhvc3QtdXNlci1ncHUucnN0IHwgIDEwICstDQo+IGRvY3MvaW50ZXJv
cC92aG9zdC11c2VyLnJzdCAgICAgfCA1MzcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAyODUgaW5zZXJ0aW9ucygrKSwgMjYyIGRlbGV0aW9ucygt
KQ0KPiANCj4gLS0gDQo+IDIuMjYuMg0KPiANCg0K

