Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA195EFC0B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:33:22 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxPV-0008J5-DR
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1odvcX-0007vI-3S
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:38:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1odvcT-0001AW-CP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:38:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TFYInM025055;
 Thu, 29 Sep 2022 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=DoMre3bRzfs2L75cTi7vAe64Hfff0VbNqgQu8Knr3F4=;
 b=t9wE829fxNvWLS1kn6u6J258RkyPFo+rTv7O2yywHCGUHLeCDJy6H/RrKSeVPId3gkM4
 z/SdiEBGrkP38vQp2mOn8z61byybOucnXc3evOh8O64kJ1Pf+Whl62yLBcB34GoyFDiS
 aimgjaaGzCu61RI/XF4JNR6bq7LYLX1+mvmMAjNhDmZ2rTmd3u6k2Rn5VhiTcqx5P/wJ
 aNdYJ7yLFAcnqE9KC48kAsi/gnRibte01lUtotjh2MoOF8wc0ny++GfiMjtLXkmQz7ME
 IKdRqlprn11YqBjXYjy2VFPXBEaK3un2WfS5slgRnS9c22RKjgdHAino8ZpJvGqP5bvs sg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jstet5nqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 15:38:29 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28TF3S4m002210; Thu, 29 Sep 2022 15:38:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtps7kwq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 15:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDHpxESGmzTh+c6t4H7YbqXv9m6zPfdpcuG6B1iiGI8OXdv01FCLsX3KFPoYXg19VYifLslXXVf2cTYgLQY3cSdfduFR+vG/xSEAit1i+BBfJHiyuQ+ckKSzMZ0fKnZBeyGFSg2lSxCyY9ZTQcSDatUiEKPvk3QG5VxVyJThdchKN3geIqTvFD5z9rT/NB7qu5jiT2v20iUXjHYTL909uxJ4DNw60f1EgAgMCvZZXeHeuy6kRokKFLaf7poq+NPsOY8ZDEuGXxt+rg/NAWTG9J9Q63bqwMS52/5dniooxKQblzK4Cw5f1TXpM5g6Bjo2lhJhS7+Vv18/gK4z9bQamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoMre3bRzfs2L75cTi7vAe64Hfff0VbNqgQu8Knr3F4=;
 b=HixeaUkS1B0ukntHVF/3tXAf1c9vtIpS5koNnXxe6iLmxQZaeyc2wQtzy903EFnyZU+GZ1T4FL3RlmwCGIc4Plvr+aAid2QnCirEWX4okdt+grf8x4iytk2uIgffa14vJYYxkvYi5pfgCHJDMOnSv4QKO/slTwB0u4lmLUs6HRX5x2LKUGs7Bu621Omkjxq6ZRGItQimDgIl4gpnTnqMt/LwYfUvWofjUESi/vBC+iIN4q1z4+wtjrFZ+0zc4vPiWEPG5n9TpjikRPhp/I5Br+TQpR94da0Ml7ayVKAAggOkaz9fSfntlKTnvndDAbccHMcE7s4/si1HE2BFCwvW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoMre3bRzfs2L75cTi7vAe64Hfff0VbNqgQu8Knr3F4=;
 b=ByjWqMhkFIAl7ZR3rRFdgT3YJKHQ38l7/Le/2MET+oHS1XsDWxWPqzS5OwY9NmKfmf1uBeDjPcUKfxTdl84or8Vf98RpA21BMqH6OQ9cZQ+kaoutZB8I0F/sHt4wQ/C1t/UJXRtlpyIK1RpmPwPn6OFP9GSPC3CHtzMDBhrMZY8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 15:38:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::fb75:60fd:c5d3:899c]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::fb75:60fd:c5d3:899c%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 15:38:24 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, John Johnson
 <john.g.johnson@oracle.com>, John Levon <levon@movementarian.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Thread-Topic: [PATCH 0/1] Update vfio-user module to the latest
Thread-Index: AQHYpg6QCKwouhM1pkGys08s4dAfg62bYSQAgASKmoCAABHUAIADSkMAgCK1KICAMAM3gIAATLeAgACZ/QA=
Date: Thu, 29 Sep 2022 15:38:24 +0000
Message-ID: <CCC2F352-F28B-4701-B2FE-DE71FD3FCCBA@oracle.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com> <Yu+WYmwvr/1fBww+@movementarian.org>
 <abc2219f-9ee6-59aa-fee6-4b0ec29aed2c@redhat.com>
 <29C30B29-B948-4DCF-AB4A-C0CA6E3041A5@oracle.com>
 <4103733d-3bbe-18bd-a9ea-e2f24cbe8d43@redhat.com>
In-Reply-To: <4103733d-3bbe-18bd-a9ea-e2f24cbe8d43@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB4013:EE_|SA1PR10MB5687:EE_
x-ms-office365-filtering-correlation-id: 5a2ce4bb-be79-44b2-a312-08daa230a595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1TYTn+dHB+9ycSPfUXH8WHPQFVFNRxXbverq7hX7u9MUj1uYO8mcAdMdgVSMa9CLVandsHf/dEhsrHaUG4hEaIzGmwiq5HE2jMUS113JZ3A6fJueo0AvNoBZ9My93KiBESW8JPkzRuph15R8gzIAb1NGAD+Ux5yAeHpYWZi7Lv16YccEFvDJcxV6C0LWHDqXD8jxr00+o2fvSBLWZI9GuCybk0Ljh4Hvo5Nsqq+sX8fl5ufiifKGRpGRoQHWONsndEYW0Qca1WxmDiA4us7tAbz0ZAfuS/dwNU0iAKV33XisrLYVzE/gsunkVlRkJ20Y6I7ayzLH4mXd6R18mgCNMtiBMyYmfF3+0Dh4UPLJHXgXmw4L1sJcdEjK9yF+O4irPW6kLwMQ7W8EO26Q93Smh7P4iW58tQ2BfMl9Op7pnH1KBdu6BrlotydYsQ5RrwWXpZXsN5Ogpf+mcDAU9VT6qMIWK8Fo75uvNbn+EjB/8DaUJSVRrHcu2y/UmPgcqbVJgEvKJJUVs3tgrFzXS6pEp8bsRYKK0xbbAQx9b8HofKiVrJCVCBlSr14/INl7Wgvl1hVFEfhfFoDZlWIE7Yz+C4z4HMtE1+unri/GfhbAj4glj9FJFn9LRgGY4TpyHBJEmTzPVwiiWTmVAHd8wQVuzQ8CnmWfP1VfLdxEN+fzBbpTpu+HcjJOsTyDoeG/57wuYMnlHdahaEFWDPSIpdO41A8ztxFIRUtgH98MVPWhKFciL0T4bgU4Gu5xDmPkvFh40mwQVG6UanaA1RKTtTZwEbiMH3ukkWIiXDUOwRJ122ptARSeegkb/MU3M+ErwHpB+eyyQcz01hcNAxlMBUnILQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(6512007)(6486002)(71200400001)(53546011)(6506007)(966005)(83380400001)(2616005)(5660300002)(2906002)(186003)(44832011)(41300700001)(54906003)(64756008)(6916009)(66446008)(66946007)(478600001)(8936002)(66556008)(76116006)(4326008)(8676002)(7416002)(66476007)(91956017)(316002)(38100700002)(86362001)(122000001)(38070700005)(36756003)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2MxVHBUbU5LMUdKODE3SExCd0lUQ2ZpdDdBdENiaUhrMHZRTzRxRUE3cHQv?=
 =?utf-8?B?ZnNKMzVLTmlWYjFEdmw5OHJDZTdFNEFBNmpGMmQxVUI0ZFV6YTltRnV4R1Bt?=
 =?utf-8?B?YlFvR0JDanpxeXFhWVBNYXhlYnFmSHkvUW9pRXJlOFY2cEdGTkpGNmJKZnVD?=
 =?utf-8?B?VnQvb0pnTDlPR3Q2eGRGSWhsN293bUhKbXQvK2UwTjNnOHR5OFlhTm9XVVJ5?=
 =?utf-8?B?bzU2ZEs4TDFiUXJOMWR0M25HZUxsaG1mQnlSUXd2Vm1pa2NDWngwU1V4TXYw?=
 =?utf-8?B?ZVE2OEVsN2FTNkxZZHp0aWtNRERMblN0em9HOHo3aTVaL3AvMFZTdld3dzM3?=
 =?utf-8?B?Y3NzWENCaHJqNWovcGpMZFU2b3NOcXVFZ0dSMkVmTDU5M2ZvV2Nyc2hBVmZu?=
 =?utf-8?B?M3FKQ0JsZEROUm9yTFN5SmRCUHBsVzN4UjZiK0dXNG01dmJmeW84Tnh2cU5X?=
 =?utf-8?B?ZzRMSC9yNi9YSHJPQnZZRGZwckl5ZWtrU2dxbWVrZnpTb012RjA5aXY0L3pj?=
 =?utf-8?B?akJoRmlBbzNEbUFiQVZSSlNta3FxdDF2Yk1jaUgxTWdmOThzdk9NS25hUWNZ?=
 =?utf-8?B?YlJHT0lBZEF2TTBVUHBieHk5bFRPSVpYWldVOGRYdURkaWwxbVlVdldKZm8z?=
 =?utf-8?B?UXVScWpWU2kwTmx6NzY1ZFRCbHlQQUxSU2JaZStuOGdkVlJ4OEJBU1czaHJJ?=
 =?utf-8?B?NUNTdDkwbERBdGF0Q2s3bXpxTEhsNk1RclJlT2hjU2ZHOElWeVNLd2FHMTUv?=
 =?utf-8?B?WmdySmsrVVIrWHNZdm1qZ2p0Nk94NGJlYnRXMWdpbXNMMDRwMDBKQUFmSDh6?=
 =?utf-8?B?Rmd4M3VSeGtDL3N4Tll1Tmx0WG03cFh0blVVNWRoRG1NallNUDRnS04wUGZH?=
 =?utf-8?B?S3dpMnIxUGFQdUZtcHB0T21Bejl4NEpLTFBiNEZrVTlHSkt3azNLOUNGUGNz?=
 =?utf-8?B?VzJtci82bDZITi85UnNjU0M5YnJsUVg4cVRydmU1VzRrQjd0Y0tkSEFnU2pl?=
 =?utf-8?B?ODlvOXpjS1llcUlnbGxyMDNrdWt1dlBXMENicmNpVEYwYXJuMVk4Vm1uWjhO?=
 =?utf-8?B?UjNMM3JydXRkVHRGVG5SaUt5UGk0Ty9reGJUbUVLOHJ3WWpEYXA1WDRacEtG?=
 =?utf-8?B?UjFheFV1bkZkbzZBa2RPT3hNYWtXc3JEV2lhUXdvQm1HYURBOUtzUEpNSnFa?=
 =?utf-8?B?czIyRVppZVBzSDg3b1JFWGlFbHhZWndaRDB6Nlc5OU9XUkJtYk1OWkV3cWwy?=
 =?utf-8?B?UjdUbHk0eU5zbktVMWpJK3p6a3pDMVc3ZlE2VCsyQkxNK3JCQVl0MDhpbUxi?=
 =?utf-8?B?aG53RjBGcENrdk9sQ3N6aW43TUNuSW5EQ2lvQnBpT216RE5keUcyRjdrWnNm?=
 =?utf-8?B?NGhWSGhQSFFQSHgrQnpYdlJyOHJHOTI2L2dXZWNuQzQ0ZnhhUkNQU3dSUEdW?=
 =?utf-8?B?VTJEOEpQR2huU1lHWjVMVisxZnBQUE56eis1TkFISHBIK1MrMFFHZ0I2cnlq?=
 =?utf-8?B?V3paVlpHelFZTWd1V0NwRlVvYWhNV0ZLQ1puYVNTTytnK1Q1cFNHaVhQMHR2?=
 =?utf-8?B?WDBLRk9lOENldXJSc09lOHNUY05KNE95cDFuRlMzSjByWXU5anFYZ29wbGNL?=
 =?utf-8?B?S0t6TUhxdE1HbWxMSC9SQVQ1aHVVZzh1cWVLODZFSlV0dm9DeWg0YlU2RVpP?=
 =?utf-8?B?akhnS3RBMnQyeXlQVUtSdklIQWVhNzFqNys1VnpXL3MxMTBNQUdsZ0xxOFBQ?=
 =?utf-8?B?NFJlTEIrc3d3dDRYd2lUdXJRalpLWmlMaFNKVTNieXBxSVhHUFBPQ2JQRzZ4?=
 =?utf-8?B?V3M2bEMyb3dtbFJkVkZNU1crdGNhSHlsK0wzYVdaaVhvcHBxczhtaVdCbG56?=
 =?utf-8?B?STlWRU9WNzI1UkF0aWkvNkp5d0V5Q3ZoN1h0cGR3YThnV3FSTjhOM3JoaFFC?=
 =?utf-8?B?c09haXhMUDhxeWhVYm5yU0Q5VS9QSFNNdGxUS0w0cHBCdVUzSWJkOXR1Z1Y3?=
 =?utf-8?B?bm9yZEFJK2RVUXVtdk5KVFB5enFUU0lwQlhvaC9UQkcrOVVqSktaeXFpMFJz?=
 =?utf-8?B?NTZpUHhvbWQveDh4SVErVWR0VDlxQ3JXdjNvTzI4ekp4VVp2czVEZHVyYTBB?=
 =?utf-8?B?UVhnbnhQdzBBZjhhU3ZqYWlqY0JMMklGczZYTTM1Z2IyM0ludHhVbTluN2Vs?=
 =?utf-8?Q?ea+aDRMZgOEyLAS9n/KlhFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3884E41C2BC0E4199B01C3369EA6401@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2ce4bb-be79-44b2-a312-08daa230a595
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 15:38:24.6054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSbgPOaOAf2dCwJdSoYOajzYO+pb8HNnOANP84oxrIf5egpLiSmfxPxyJJOurdKmAZq+InUGRzEzW4v89KyMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_08,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290097
X-Proofpoint-GUID: llR_nzwG_kNKR2dXep5LotXlB_lT_7h8
X-Proofpoint-ORIG-GUID: llR_nzwG_kNKR2dXep5LotXlB_lT_7h8
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gU2VwIDI5LCAyMDIyLCBhdCAyOjI3IEFNLCBUaG9tYXMgSHV0aCA8dGh1dGhAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOS8wOS8yMDIyIDAzLjUyLCBKYWcgUmFtYW4gd3Jv
dGU6DQo+Pj4gT24gQXVnIDI5LCAyMDIyLCBhdCA4OjQwIEFNLCBUaG9tYXMgSHV0aCA8dGh1dGhA
cmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMDcvMDgvMjAyMiAxMi4zOSwgSm9obiBM
ZXZvbiB3cm90ZToNCj4+Pj4gT24gRnJpLCBBdWcgMDUsIDIwMjIgYXQgMDk6MjQ6NTZBTSArMDEw
MCwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToNCj4+PiBbLi4uXQ0KPj4+Pj4gSWYgd2UgZG8g
YWRkIHNvbWV0aGluZyBhcyBhIHN1Ym1vZHVsZSBmb3Igc29tZSByZWFzb24sIEknZCBsaWtlIHVz
IHRvDQo+Pj4+PiBzYXkgdXBmcm9udCB0aGF0IHRoaXMgaXMgZm9yIGEgZml4ZWQgdGltZSBwZXJp
b2QgKGllIG1heGltdW0gb2YgMw0KPj4+Pj4gcmVsZWFzZXMgYWthIDEgeWVhcikgb25seSBhZnRl
ciB3aGljaCB3ZSdsbCByZW1vdmUgaXQgbm8gbWF0dGVyIHdoYXQuDQo+Pj4+IEknbSBub3QgY2xl
YXIgb24gdGhlIGNvc3RzIG9mIGhhdmluZyB0aGUgc3VibW9kdWxlOiBjb3VsZCB5b3UgcGxlYXNl
IGV4cGxhaW4gd2h5DQo+Pj4+IGl0J3MgYW4gaXNzdWUgZXhhY3RseT8NCj4+PiANCj4+PiBTb21l
IHJlYXNvbmluZyBjYW4gYmUgZm91bmQgaGVyZToNCj4+PiANCj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9xZW11LWRldmVsL2Q3YTdiMjhmLWE2NjUtMjU2Ny0wZmI2LWUzMWU3ZWNiYjVjOEBy
ZWRoYXQuY29tLw0KPj4+IA0KPj4+PiBJIGNhbiBvbmx5IHRoaW5rIG9mIHRoZSBmbGFreSB0ZXN0
IGlzc3VlIChmb3Igd2hpY2ggSSdtDQo+Pj4+IHNvcnJ5KS4NCj4+PiANCj4+PiBTcGVha2luZyBv
ZiB0aGF0IHRlc3QgaXNzdWUsIHllcywgaXQgd291bGQgYmUgZ29vZCB0byBnZXQgdGhpcyBwYXRj
aCBpbmNsdWRlZCBub3cgYXMgc29vbiBhcyB0aGUgNy4xIHJlbGVhc2UgaGFzIGJlZW4gZG9uZS4g
V2hvJ3MgZ29pbmcgdG8gc2VuZCBhIHB1bGwgcmVxdWVzdCBmb3IgdGhpcz8NCj4+IE5vdyB0aGF0
IFFFTVUgNy4xIGhhcyByZWxlYXNlZCwgY291bGQgd2UgcGxlYXNlIHB1bGwgdGhpcyBwYXRjaCBp
biAtIGp1c3Qgc28gbm8gb25lIGVsc2UgaGFzIGEgYmFkIGV4cGVyaWVuY2Ugd2hlbiB0ZXN0aW5n
Pw0KPiANCj4gWW91IGFyZSBsaXN0ZWQgYXMgbWFpbnRhaW5lciBmb3Igc3VicHJvamVjdHMvbGli
dmZpby11c2VyIGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlLCBzbyBJIGd1ZXNzIHlvdSBzaG91bGQg
anVzdCBnbyBhaGVhZCBhbmQgc2VuZCBhIHB1bGwgcmVxdWVzdCBmb3IgdGhpcz8NCg0KT0ssIHdp
bGwgZG8uDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gVGhvbWFzDQo+IA0KDQo=

