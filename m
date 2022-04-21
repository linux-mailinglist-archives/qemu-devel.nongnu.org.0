Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A243050A7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:13:40 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbJD-0000y5-PO
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhayf-0007yO-2H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:52:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhaya-0006dv-VV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:52:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LHYlMY019231; 
 Thu, 21 Apr 2022 17:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yzsG/9K8B3Dqdgy+XrghZZECiTLRbKTFOh7nLT+x7F8=;
 b=EATnv5Gtm9EeJe/bIDPgU/y2DO+22P/rC6oP/MZm8jqnvG305PMqNIdBqoOp6ecMdsw/
 Y2UexKJazaGENSHI4oGV8nGGZN5hCUjM+CFPS69xH9RsHJ90xsIaESIp8dH60EmSeUS8
 ikHzEhPcFhjYbaKa1Ha2a4+FbG7MCUMW5Cq4NnwbOytza33xy31FtvuuKt0Y3/uBluIw
 2fCVWbWiDDFeWKtzxfhUhmBi0VC/5AsJZAIV8iOtz3xPdDjwLXrWxRIp44WMLV7wqBG+
 vEKXTjsTHZtgh6JD4UEbJr65ZVRIa8craqR0iTfhil1eLyN+Zk0Rno24s3yNWOubD1mS Fw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2vrqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 17:52:18 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23LHmDnl009877; Thu, 21 Apr 2022 17:52:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8ccccy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 17:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRkPty1SLobSqvpBfav61Z9q+mk+1NuTojHDyBbPRaTT8ddGveF6JoLKPE4dXqfpzVIHl3XBAAZOUcbptI1Of9W3Jw2/9srPHrXdEwKrZOduQLnvVxc8cAT3gqAOVAqpZOm1nZDWGRLURPzByP/BYnPze+jSvut+MT27aVa8U6fjlu5HFuUpupmplmrJGEXib9+7x0US5cdEZTB31AqM8dji7FOHQkdd9RofqHgIa4zI4ddJKt8KGa77247yba++/Y23LllLLrz4WYWG4zsF8c0Uhcw4oZevWVwQ3BfjPwCVifRDYla/b/Iyy6PhtL3Rs3U3jTyG4OPn/Yzq1sCgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzsG/9K8B3Dqdgy+XrghZZECiTLRbKTFOh7nLT+x7F8=;
 b=elKjYwagkvPclCAQRGqppyDqKkZNOgIQTPREhCcRJDScruW5b/X3tJ8DDfWsAEO4+5IAwyAtqYaJ6TV1kGiqwKjDr5hoGMmAeNSBY8cxqTaahjrOySKxOFbOPZZ/Bvu/fZ7MOZPmN0nUIzj3woXlIO40h0TnpUzcXW4YamtH1OI/bq3N9RDmT8guInSgj0s6hVhqqrGyuj9pxFYvF2hjiQl7tI1GZ1wmdAw29xODPRP2zFJtblJzVrofamFaqH2s6L7WsP35LXNefgHazuV1ZevFGan8zBnS2er9HJtx0TGBKDVjY3tjqRIIBdcK9EN3BCgfIfjIOVbADUXM/ls8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzsG/9K8B3Dqdgy+XrghZZECiTLRbKTFOh7nLT+x7F8=;
 b=CcZkEb57a/06dS/a9uCIhKP5UCXWpNtZWbBjcdXraa5kVSIVBEhPgJhg401Ttt4KD/iQF2e0mk2jJ7cmtvZB6Zi9Drps/uVTwhkxatQQDUVIPEhSxgQoy7reKYW6XxljBOvaYQiMctrLiZ8sBMRaYGapNJeWL6vh0W5hFD/cVDI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1679.namprd10.prod.outlook.com (2603:10b6:301:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 17:52:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 17:52:14 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 10/17] vfio-user: run vfio-user context
Thread-Topic: [PATCH v8 10/17] vfio-user: run vfio-user context
Thread-Index: AQHYVC5ctuPlcUcl1kCQDV6z6tqbVqz6eHnogAAwOAA=
Date: Thu, 21 Apr 2022 17:52:14 +0000
Message-ID: <4781D386-AF48-43C9-ADC0-7DAF2DB52F11@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
 <87zgkepjn5.fsf@pond.sub.org>
In-Reply-To: <87zgkepjn5.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9ac797b-71b4-4753-762f-08da23bfab27
x-ms-traffictypediagnostic: MWHPR10MB1679:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1679073CB46B223D29E53A7890F49@MWHPR10MB1679.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kl1+/kHBm27nyPvrSyJNTfSA9TytEucEFzq4Wc8FdRPTqsLHHtDgMVGs+Ai/1N4bq42DBWUtuulT0qhx7v7DZjTTcFsVeNBdkHO6+JR9OgvIpxSEYpP+UieOGEHfJunKTtf1qQqeEWSVwOwkRaIJpWlGUAXIIxTHJFdVytq+WkiqFzM/bK0OZDdri2YD1JK14EyjdC9MGLPjXxyaGzhwVd78HfM4Ye28FoWCVQh7nRIODE3WTwhQr781rkffBmu/ckZRAwJxPUWEKJtK8byb0smAtlofk65hjPFKsvk7I5ty386WZzHqf9hM7bL5Vsuhzn+5UouODz0beXHWe/n7Gah141z2nIqbMQGiRB7JMKIodDy/fbgsr52IaYMrz3Ib2KW7cEA3YFBMlcSUrb4bnvHhDWDdGBh+IjPWXZ0kz0dDaYs3JxF1wVeh5qpji9B4CKfNH/gSsvudWoD/5no+ZFG5oq6ln4zDwjlC/BGlinRj75xpyMw4fkJoypxXEx8tBbZLsjBBB9meeLkwyeFrQAmqyIUg8uAore3kE4eMuQliNpV03jYn/Sl9BbXL0/elH9ebCgE/zrxmqqj+s6a34uSqiA5nbwpy0lBvHOtFh+WFrQc1PLzxR6pPtZ7EQ8jL3HEXkS7FmLLKzRpjOKku+fuz1ZEx4GU6mFTNb/nPfjsrYIOPQxJkgKPqMXGyRVGVeYcbZQmponeoaxGcPGR58gm6scRwCqlp+YUHheTHh3ZEh16wGCTjkUlB8n4YsHI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(66946007)(33656002)(107886003)(8676002)(66476007)(2906002)(38070700005)(2616005)(83380400001)(44832011)(8936002)(36756003)(5660300002)(186003)(71200400001)(316002)(64756008)(66446008)(76116006)(86362001)(54906003)(6512007)(38100700002)(6916009)(91956017)(6486002)(508600001)(122000001)(6506007)(66556008)(4326008)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzNTNEpsM2JkaGJONmpvNUxqTWRGOUxDcUVRVE9abGRNay8wbWtETnZ5L3Rw?=
 =?utf-8?B?VVpnSlhpY0VXZUxlR2x3YWw1aWJoUDVRWG50K1NQLzRTU1MxTmV5WWYzT2o1?=
 =?utf-8?B?T2FERTVTb0xUYmZhUFAwZ1FCRzQvMnVMVHhvc2Yxdjl2WEpVc2F3MDlHaUpG?=
 =?utf-8?B?cnh2NjdtcFZGUkYyZ0tOOFp1aTF4TTljK3lPZHNYOTBLeEZSTzgyVXRvc2U2?=
 =?utf-8?B?amhQTFlxN2ZmM3VNM0hTbFRFUmZFZ3ppSXdqbjlXd3N5dXFQczFUR2xtVkUr?=
 =?utf-8?B?a3NDMTI5RFQ1ek5RUmRCODQ1WGY1bzdpTnJQY1B5MTNnRThKcEJpaU5JeFdz?=
 =?utf-8?B?a3FGVVgybFQ2TzJ1eEVWQUl0UGtHMGpZU2c0SDRndWJDdVZsd25SQ3U0YVJ4?=
 =?utf-8?B?dzdaZ3pMeWdLZkc4ZndIdnNxSVlHL3NjYjN2YzBkcDhqQjZsSnlEK2NUbENI?=
 =?utf-8?B?UFhOU3FpdThOYWk4c0kzMndkNisveVRFMVRKYTUwNGk0V2tNTkVzMUt5YU9t?=
 =?utf-8?B?dDExMkNTQjUxcGRTeGVveHZzMVpxSnUzOHQ2TmJBN2xxdCtNUnBKcWxGQWcv?=
 =?utf-8?B?ZUNBMDhZTDFXVlNmOFVZa3luWE4yNXBBT0dBTWwrelA2b1FFa1ZETDhTS2lM?=
 =?utf-8?B?TThjdUtROE4yMXFoNDdGVTZnMlp3aE1VVzlrNTZRSnVmOHByME1NYm9OSkFD?=
 =?utf-8?B?UHQ1Z0RCUEo4QklLaWNxN0JZalRyRjBZNmxtU29QU0VBMlp3NkFqQ0xhd3lj?=
 =?utf-8?B?UUREckdtYVBaRkt5UHByRU0veXAyWHUxdXBiZmdjaFUrTTZ4aDBmZDMxemMy?=
 =?utf-8?B?V3pKMTkvUG5KWGc1SkF1TVUrOXNpaTNHZHpDNVR1eW1NQjZnQkNIS2RGMThP?=
 =?utf-8?B?WWY3ekFyUngvYVNBeGt3SWd2SkhLV3BCZmVRb1I3SVBwc0xzT3l2aDNpMEJK?=
 =?utf-8?B?bGt5Q2Q4aVNuc3lqSVJuMnc2Tjl3QStLb054UUdtNFVxTFNCbVZJUkI3b3l4?=
 =?utf-8?B?SlAvVVJNbjBiZ0o4aG0yWUcwWnBnUlVFTDNWYXkxV3VER0I4MWplTEZtVlZZ?=
 =?utf-8?B?VUt6c0FPU0VNUjQyRXVIK1UyOUhGYy9UMmRWVWt6bGZnS2RkRUpjNkExeHVt?=
 =?utf-8?B?V3BmbUNPMEc1RUtYVEQvZ2kyMnllY25RcFE0S2wvdXRUMU1LQTJ3dXI0NURT?=
 =?utf-8?B?UXRPbGFIRm5jTFRLR2w0dlVYa2lxeCtxaTU4Wm0rdkszSGUyWUUxR2pKMW1h?=
 =?utf-8?B?WUcxTjBKYkF4cXRxUWlnZkh2WG9aanAvaHJWeU0wcEVYTFBBVWZFR3pVY2Ur?=
 =?utf-8?B?SWtIME9md2t3Y1JGeUVCMWRHb1JrMXZKMU94UkFBaG9XMVI4QUpaL2lqVmgv?=
 =?utf-8?B?YzVpSmN5a1JveVBNdndGWXlDV09tbHR5cVBjcnQvTUtZU3p1R25JRWwyUG1S?=
 =?utf-8?B?bVQzZU5jVUVmdElyZlljUk9JWE9uL2k0YzJHbW9SczAyQTFFak9aYStMRHVz?=
 =?utf-8?B?RnlIeHV3bDF3UktINEJtQkE2YmwyNkFZdDgyUHhPVHhJdU55NlFtUStzWldP?=
 =?utf-8?B?ODE0T3BBK0ovOWlvVmFVN01mT3FvVTh1NHM0emZKSXhQMFhwaU1yTnZlYUlM?=
 =?utf-8?B?bnJDWXozcURsQ2p6VURFSkhMeFNRY2dKSEw0ZStHcmJsQ1FPWWE2T0FxMFkv?=
 =?utf-8?B?bmp3NVJTTUxxcW9NOEhYOHVONXBQYlJWT0NaQmNRVndvWWZpV05yNUgrWWQ5?=
 =?utf-8?B?ZVVGT0IzSEZFNTZ6V25WclpkbWxCYTBzNXY5S1FBcEJ2cm1TejdvbU45cUty?=
 =?utf-8?B?N2ZpWkxmSmxaY2o1dUU5d29WYmx6NGxBcldFcG90K3Y2dG5mVVNDTkFtYlBB?=
 =?utf-8?B?QVZXeWMzZTZDT29RaHNqQkpDZGE5NjlaNVhPOVJ0S0g0cEE3c2FvYTVrNEll?=
 =?utf-8?B?TVZTODVjQWlyYXBYZ1RtWTkwTGZqQnJONUJ2TjhXejRHY1QzcmpHUWp1OWFR?=
 =?utf-8?B?WDVxaFk1NTVSRVNjTHRWWlZPNThNN1ZPU29TQWtJQ25CL09jUEFGa1l3enpU?=
 =?utf-8?B?QmNEbWwwQ3pYNGFOejB3VFg1K2gyVlpMR1ZTanNkNVgxS1h0YnpNdXJBN2x2?=
 =?utf-8?B?c3NYbVNBRzdraFdOWFJtTzZSQWFRb0VyQU9WeTBpc3JlaHIvemNWZmtCTzhO?=
 =?utf-8?B?VzB6U1I3Z1Qzajh5bVRjemdHMit2QmZWSXZ2M1RuYmsrb1ZTY0NtbkFtci80?=
 =?utf-8?B?QVVUU2VzTzNqQlc0aXRHSzFiS091MGpPaHFJRy9QYktjRjYvTHNtMStzOGVG?=
 =?utf-8?B?YWpwNWlSOWl2ejdUMDFzQk9TUjBBT1FPVkw1Q1Z6MVhSdEZJMEx2eTNxVjJz?=
 =?utf-8?Q?o+dBbg+XLVN/1OXAukfPICLQRvM2peinWrjxE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9391FA20266890408C9BFB9CA4321E15@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ac797b-71b4-4753-762f-08da23bfab27
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:52:14.3406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1jRn36knv3fmzzTWWaqMYlLNsnLB2QS+V7RTQS4unNvlWQNa/yW6jXOlGvTR+2jC35g8zWXtKHXZLpuC1/EFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1679
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-21_03:2022-04-21,
 2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210094
X-Proofpoint-GUID: srnh1DRUbKPbk7jiGzCRlNrKhWTGcdFc
X-Proofpoint-ORIG-GUID: srnh1DRUbKPbk7jiGzCRlNrKhWTGcdFc
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDIxLCAyMDIyLCBhdCAxMDo1OSBBTSwgTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFt
YW5Ab3JhY2xlLmNvbT4gd3JpdGVzOg0KPiANCj4+IFNldHVwIGEgaGFuZGxlciB0byBydW4gdmZp
by11c2VyIGNvbnRleHQuIFRoZSBjb250ZXh0IGlzIGRyaXZlbiBieQ0KPj4gbWVzc2FnZXMgdG8g
dGhlIGZpbGUgZGVzY3JpcHRvciBhc3NvY2lhdGVkIHdpdGggaXQgLSBnZXQgdGhlIGZkIGZvcg0K
Pj4gdGhlIGNvbnRleHQgYW5kIGhvb2sgdXAgdGhlIGhhbmRsZXIgd2l0aCBpdA0KPj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNs
ZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9y
YWNsZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPg0KPj4gLS0tDQo+PiBxYXBpL21pc2MuanNvbiAgICAgICAgICAgIHwgMjMgKysrKysr
KysrKw0KPj4gaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYyB8IDk1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvcWFwaS9taXNjLmpzb24g
Yi9xYXBpL21pc2MuanNvbg0KPj4gaW5kZXggYjgzY2MzOTAyOS4uZjNjYzRhNDg1NCAxMDA2NDQN
Cj4+IC0tLSBhL3FhcGkvbWlzYy5qc29uDQo+PiArKysgYi9xYXBpL21pc2MuanNvbg0KPj4gQEAg
LTU1MywzICs1NTMsMjYgQEANCj4+ICMjDQo+PiB7ICdldmVudCc6ICdSVENfQ0hBTkdFJywNCj4+
ICAgJ2RhdGEnOiB7ICdvZmZzZXQnOiAnaW50JywgJ3FvbS1wYXRoJzogJ3N0cicgfSB9DQo+PiAr
DQo+PiArIyMNCj4+ICsjIEBWRlVfQ0xJRU5UX0hBTkdVUDoNCj4+ICsjDQo+PiArIyBFbWl0dGVk
IHdoZW4gdGhlIGNsaWVudCBvZiBhIFRZUEVfVkZJT19VU0VSX1NFUlZFUiBjbG9zZXMgdGhlDQo+
PiArIyBjb21tdW5pY2F0aW9uIGNoYW5uZWwNCj4+ICsjDQo+PiArIyBAaWQ6IElEIG9mIHRoZSBU
WVBFX1ZGSU9fVVNFUl9TRVJWRVIgb2JqZWN0DQo+PiArIw0KPj4gKyMgQGRldmljZTogSUQgb2Yg
YXR0YWNoZWQgUENJIGRldmljZQ0KPiANCj4gSXMgdGhpcyB0aGUgSUQgc2V0IHdpdGggLWRldmlj
ZSBpZD0uLi4gYW5kIHN1Y2g/DQoNClllcywgdGhhdCBpcyBjb3JyZWN0LiBJdOKAmXMgdGhlIElE
IHNldCB3aXRoIHRoZSDigJwtZGV2aWNlIGlkPeKApuKAnSBvcHRpb24vDQoNClRoYW5rIHlvdSEN
Ci0tDQpKYWcNCg0KPiANCj4+ICsjDQo+PiArIyBTaW5jZTogNy4xDQo+PiArIw0KPj4gKyMgRXhh
bXBsZToNCj4+ICsjDQo+PiArIyA8LSB7ICJldmVudCI6ICJWRlVfQ0xJRU5UX0hBTkdVUCIsDQo+
PiArIyAgICAgICJkYXRhIjogeyAiaWQiOiAidmZ1MSIsDQo+PiArIyAgICAgICAgICAgICAgICAi
ZGV2aWNlIjogImxzaTEiIH0sDQo+PiArIyAgICAgICJ0aW1lc3RhbXAiOiB7ICJzZWNvbmRzIjog
MTI2NTA0NDIzMCwgIm1pY3Jvc2Vjb25kcyI6IDQ1MDQ4NiB9IH0NCj4+ICsjDQo+PiArIyMNCj4+
ICt7ICdldmVudCc6ICdWRlVfQ0xJRU5UX0hBTkdVUCcsDQo+PiArICAnZGF0YSc6IHsgJ2lkJzog
J3N0cicsICdkZXZpY2UnOiAnc3RyJyB9IH0NCj4gDQoNCg==

