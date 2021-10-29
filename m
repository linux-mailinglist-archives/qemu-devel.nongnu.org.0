Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ABC43FE55
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:20:55 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSkY-0003fO-LC
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgShj-0000wU-0y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:17:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgShc-0001gr-HZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:17:58 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TE8WJ4001182; 
 Fri, 29 Oct 2021 14:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GMkjWCtelw3NcZI+fFPhbxCof9sfGz2Yu+PEd+EfhME=;
 b=Be6kI99XwVpPgBQ59OyjbD85L+FZ9uB77i+Q3dLQd/Lhd6iTGYBIqlnGcTR88nAAjhNw
 Xwi8JajdutKb41Ni3lxcK9/PoFFzIr/nkK54ExD+iOe9W5Nb2CJEJ5qT69cbKkup7xKM
 HZjWDN/2/P6wGjTTje/z9Q52NgSnkTUhUTilJEgsDu3KDiQAxFxwejrKCmHwGtv1Co0Q
 dx4++Yx6GYpaV/MN9Flt9W6fnf96d4HR3aYG2qBNYg7YS2G4hkB1ITbQa5y/ydusYhBt
 yFdcaG2cP5o5j43+NihqHREwZM0Mz7zu9JLJOua2xmGCIetGYJoZmH+9fwk4CLOPD1S9 Fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byj7s0yvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:17:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TEBOAC152863;
 Fri, 29 Oct 2021 14:17:45 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by aserp3030.oracle.com with ESMTP id 3bx4gd623d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI0IRCinAqw6+i+zSL7p3OrLln/cW4Wcb33k/fUV/PBpY0E6x0anFcHvsz42B4xbMM3QzU/PqyWd73QU5q72UfHoEP2zF+VYmWcE3n+RFR95Oqciq0YU/0E396b+1ZmmGbIYqIGl+6ylZJZnLFLRHeskDWmmhk6IX7Cx3fm16juhPMPrz/+7euPRY4lGoSUOwTY/HO7ef85VK11RsJyVvE5q3dEDlbLykWCyyiEzolZ8pL+D9NZk9FdvkjDzmCWTH3I5Zlio6JjztDW0ZmylJ72kEDyN0rGOfsGaOrVqkQEA4SJvmt07hu6T6pEG8aa4gzh4vZq92u/tLwYp7VvbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMkjWCtelw3NcZI+fFPhbxCof9sfGz2Yu+PEd+EfhME=;
 b=X6Nunn3s3Fw9UoWZl+O/7KJgNdT0Dn10sjL1KAD0sSzbaJww+ALH1E7WWLPVPLVV/+avFpAGjZx5eFT3yRIPIEfYmrn9EiVA2TiW+Ed1R/amkigl5Gwz6Xj2S3vxpoAhEXu3yBVnm6d+TctwkqYyHd9u+37wFvqX/7R3+CvIHvCreDfI4hP9lq4KE7EdcUI06RSJOoK8sL9gtn0nGJcifEJKdmW6/jtwaW43jXGsQIY994L7IJtq+y+xCMET6ni5KrfmPTg610IRLOoSJtx+A531GDE/n0frMPAvXqeWq4Q5S7jv6dW4HObvYNMbyelWb2/CbbsIxrhsmGjAZSAcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMkjWCtelw3NcZI+fFPhbxCof9sfGz2Yu+PEd+EfhME=;
 b=kHuoJBuD96wCgl+kdZZY6QYn8Jm0Xin7FkD2ai+evG0Ha54MjVaScC2ghj9qSQZbynLRKcbfvyhF8p42dsvZgE6V6lqN38HpeHkgeNBxUcHwNfHly9QI1DBa4HOF/7zpE8b3sc5JGLfFc1FcpkwlHVdgGs9SGO9PSH5NSqKyYlA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BL0PR10MB2915.namprd10.prod.outlook.com (2603:10b6:208:74::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Fri, 29 Oct
 2021 14:17:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 14:17:43 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 02/12] vfio-user: build library
Thread-Topic: [PATCH v3 02/12] vfio-user: build library
Thread-Index: AQHXvmCI0kSUgleswE6WfiuRhJPVfqvnDqqAgAMUDQA=
Date: Fri, 29 Oct 2021 14:17:43 +0000
Message-ID: <9A1823A8-DA30-4665-93CD-349F058A52CA@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <48b1ca2b5070f3655075e02966c40786028dbfd9.1633929457.git.jag.raman@oracle.com>
 <YXltdeUNi1JPuyB7@stefanha-x1.localdomain>
In-Reply-To: <YXltdeUNi1JPuyB7@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfbf6bfb-b193-42c7-6c51-08d99ae6dfbf
x-ms-traffictypediagnostic: BL0PR10MB2915:
x-microsoft-antispam-prvs: <BL0PR10MB29156DA8A76CCE06FBB8807C90879@BL0PR10MB2915.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huaF4o/PExkQ5GjnhS0dxzpy2Ej6qREFoJfT3LOSEDxSGe/B4X/ZWSLRRH0G8ZBMkE9nRBJ4LplZqWSFyVjS0Vi7mFx06JP3CV1c6dIlZjBtPpB6+sUKs0ZDe3Sikd/uQx3Cf2MPBKB9tt5s0OavDVN5RRC3mIn0StAJWhT0iuhZkrCtbhDZm5HRiKtlIuUo06bGHe18PfX1f64NbfnuFSlJnVXIu6hGyk9ScKZ6UskNrTXnmHkqRSq7t8NXoj6yHBUoZL8yubHQ8zgQMbABO+aUd9bG4/0aivNaQwdND9gO0e+kHamDdsmU0i1k8in/GdNasXzfrcqI9JbxLUWTEMeW7kx2HDV96oUlA2ro4VDDLK9EGZw5yzUGCTXhSkDKPqJEh29xWftxn9epRZ4vssLSGQAJaqjXweUz2r3IRzqdVgNwv0pZbpkdYs7kkPWvCbPPgGdJLrPl1y6OFTuATAqEyxg9v3nWtQG6dCPJhPdXUb3RBpAGW8wiE/052gw4s7F4GyMnGEIvw6kiM3AhQWRzw+/UbyXud5IMjTY8QCRqG+iZ/3tSJ8ocSNko4ptZ3Fdx2vOqlGJG4KSyYpDyZf7pgES4cWEYTO8tgtFvtW8kLhiTfFvFqBdE/KQC5/I0T7cpA1odc6Op/8KNKF0I+Eg0AHA5zZs9SRZsF4Z5VKczaBbeGGJUNKrgcORtuO+6GhF838x3n7mMB75kcj8IcVeECkqgAyuNKJtcgXI0Lb6RHodtvSQPwWvt2GveSdxCqVOo6as0a3msWmx0+b9zze1WnLvyU1LG+y5hJ1co+ivJat5K7J5jycsmHBABAwKc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(66446008)(5660300002)(44832011)(122000001)(508600001)(38100700002)(66946007)(6506007)(6916009)(64756008)(91956017)(76116006)(2906002)(66476007)(4326008)(66556008)(6512007)(6486002)(86362001)(316002)(186003)(8936002)(2616005)(36756003)(7416002)(71200400001)(83380400001)(38070700005)(54906003)(8676002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEJzVERTanZxYWg4S0tVQmtGandKOG8vb1l3VTh3V2c0WnpRdFF3WnBXVmFW?=
 =?utf-8?B?U3BoZTNlMmYyWE40VVpHQTVTa29STlM3MjdMelhLdkJHazQrL2YydE42Ujho?=
 =?utf-8?B?QWo0Y0NXaEVycERUTzU4cDJUQ04wN3NVMkNuY3J2V3lmL1VrUjRrOEpialhL?=
 =?utf-8?B?SENCUWQvZnhycWxvUlBhc1VoWG5lMzNlN3YvVDQ3SkE0djVVYkxYRzRXZCs1?=
 =?utf-8?B?dmN2MlhRb1hNNGJ2MjdwZWhkL21kTUIwdFgyOEdjNU5WSnRIVkJrZXhpYWtF?=
 =?utf-8?B?TmNHMDVnNEVWSjQvbkZDOCtxR1FkQWkrQ0lJYVV6VWlXQ1RNUlRLNE5MTmw5?=
 =?utf-8?B?VzZHSmNiaDArejlxZWdRMVVZdytSRXVSOHJnbHJodUZYc0dCQWp5MFllWnU0?=
 =?utf-8?B?YXNuNWIrT2gwdXgrU1dvQng4TXRiVjhScXIrdXUyOTQybWNtQlVKM0Yybm1j?=
 =?utf-8?B?WHJMbjI5YnBhZ0RiVnBBVFNRTml0ckZGQjhMcnU1SjcvSUpWcHE5R3d5alRE?=
 =?utf-8?B?cEszcXZPNVJhWmkyRGxPaDhKdE8xcFRLS1lCUkZIb0dNUE1LZmV4blhXcmoz?=
 =?utf-8?B?Z0p5NHI1amNudVdKWEliQ0xNY3FUb2F3U3k4aldNak56NHdQVzRzMVByTXda?=
 =?utf-8?B?MjhaVFFYUXZ2dGNwRURyTnRudFEvR0srRmRFQ0toS2dmbGV2Ri9tb2VvV1Rw?=
 =?utf-8?B?cDlGSldXMmYzcitMT25kYXhPOGRhd0tXZFgwM3BTaHVCTjhrN3Fzb29ubjV1?=
 =?utf-8?B?Njg4VFNUS0UyYjdBNFFETnpWYkorTERIdjd5Q29KVHR0VzRPMnp3OWdpcnoz?=
 =?utf-8?B?WXd3UXR5UEdHUkUrYU5BRmM3TkI2SjFMZG5VVmxxYzAwTThwbTdLUmZDWWlB?=
 =?utf-8?B?QStqeXAwdGFPYmFNd2hiOHhFSEZYNHUvUVk0bm5vTXJkZmdSVUxmNnFXVUsr?=
 =?utf-8?B?ZXlFT0ExZ3AySlRnZklXT0NWdy94Z1UyTVFOYThDUFkxU09pNGZXTXJ0L0hR?=
 =?utf-8?B?OFk4L3ZZV0hBS01LeEJGQTNDQkJ0M2txNjcvam9nNmM2Y3FKQkdETUo4bE1Z?=
 =?utf-8?B?eVR5eWwwMjNDeW96b0R6N29zcUZyTzUraldPakFxamVoTFpjUXM4Z1h6K3Ex?=
 =?utf-8?B?VFNpbGJNNzBiY29zbkdYM3laMDNlVFBRSjEzd1hydnU5Q0RGSWpFMlY3MDVV?=
 =?utf-8?B?V0MzS09MbFVYVUJqVURieUlOcW5RNzVIVXUyKzV0SVVCcHVMWGlhdkRPM0Fh?=
 =?utf-8?B?MjN1ODd3d09vTjJWQmsrVGY3NFhrUm0xUUcxeUdvWk4vVkY4Vno5TlFuN2pN?=
 =?utf-8?B?d05BRFJkRThyQlh0RTg5T0EwNHBVOG13b0Vvdm1HYlV1aVk4dGRpUjBZSlND?=
 =?utf-8?B?R0pmRjZWUmk3SU01cXowZXNEblF3SkJKSlhQelJFWUZrc3FLbEI4NHBpYUsz?=
 =?utf-8?B?R2wyMVRBSkp4SkpWQWpuTUVSMjVPRWhJRlNRRGxBOUZhS0dLYjNDNVREUjVG?=
 =?utf-8?B?L3RQL0ZnQk1FdG9tK3YzZkhraUQvMmcybGFjdytuYlVMREs4SVZQZ2V6N3Z2?=
 =?utf-8?B?cERHOFhCZmRROWNKQ3VzU2NpdFFRYlJMRjVyZXNTZzJVd0xldDArcE1SYkhu?=
 =?utf-8?B?MHFIcUh1eEhtSld5aGYydzl0K08zOVJpckE2L1BycGlLQ05GdGRJaXJxM0s2?=
 =?utf-8?B?ODgzeTh5cHZrd0pXaGJuV0lqNDcyWm9WQWE0b204dEJsNHN1OUR0b0UvUzhw?=
 =?utf-8?B?RlFjcm45eGcyOVJSbWtzRVZlUXN2MCtsOU9kSVIvc1k3OVNQNTh4MmRNUHlC?=
 =?utf-8?B?L2xEYXBlMGRJOGNOVlkvSWFEeFlSaEJLT0lGWkVUSXJ1QjJhSzEycm9Oa3lj?=
 =?utf-8?B?MURNdWVTNGpzUHIzVDFQL3VqRWVkQ2ZVekFvUm9MZkN3Y1NaTWJtWWVkdTRX?=
 =?utf-8?B?UngrV3FkTXl6QmpPbWZvVVZtTEN3Zm9UU1R6VlJxN2QvL0M5dGtnMGIyZmpK?=
 =?utf-8?B?Rjg0UENtV0lTZk1WbFlzWFpPejJYWHFBbDN3STE3R2NQTE45anN2STdabFNt?=
 =?utf-8?B?N0hxeXF2ZWJvYVVIbVJCbWdudWJHcitibkRuUlRGZng4V2xRTHlsNlJEQTNS?=
 =?utf-8?B?V2F0d2pCME9rZXh2U2N2Y1RWb0xZeGJWR1AwdEdEeW9GRTU1MlE2dE9iY3Js?=
 =?utf-8?B?R1RGdzFlWE8vVFFWelA0OGhLSTBXVWNCMldFaitpWGdHeE5xZ1l0SlYrcWEx?=
 =?utf-8?B?OXNpSmFKNm9vTDZBYnZCSkE1UW9RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7232090F6825D140BE3EF93572BE2B3D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbf6bfb-b193-42c7-6c51-08d99ae6dfbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 14:17:43.4676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIJBkkckiGm3q0OLSN8QkvTqf4dJgDAt0ebNpcmNDrD2OB2HzSRw4ArOVvSIH4aVwcJ704gpyUFPc0RyFeOL4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2915
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290084
X-Proofpoint-ORIG-GUID: Ewuj_16-3_TLuhEWtPHR5k0Le78UMrwH
X-Proofpoint-GUID: Ewuj_16-3_TLuhEWtPHR5k0Le78UMrwH
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgU3RlZmFuLA0KDQo+IE9uIE9jdCAyNywgMjAyMSwgYXQgMTE6MTcgQU0sIFN0ZWZhbiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE9jdCAxMSwg
MjAyMSBhdCAwMTozMTowN0FNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+IGRp
ZmYgLS1naXQgYS9ody9yZW1vdGUvS2NvbmZpZyBiL2h3L3JlbW90ZS9LY29uZmlnDQo+PiBpbmRl
eCAwOGMxNmUyMzVmLi5mOWU1MTJkNDRhIDEwMDY0NA0KPj4gLS0tIGEvaHcvcmVtb3RlL0tjb25m
aWcNCj4+ICsrKyBiL2h3L3JlbW90ZS9LY29uZmlnDQo+PiBAQCAtMSw0ICsxLDkgQEANCj4+ICtj
b25maWcgVkZJT19VU0VSX1NFUlZFUg0KPj4gKyAgICBib29sDQo+PiArICAgIGRlZmF1bHQgbg0K
PiANCj4gRG9lcyBWRklPX1VTRVJfU0VSVkVSIGRlcGVuZCBvbiBNVUxUSVBST0NFU1M/DQoNClll
cywgVkZJT19VU0VSX1NFUlZFUiBwcmVzZW50bHkgZGVwZW5kcyBvbiBNVUxUSVBST0NFU1MuDQoN
ClRoaXMgaXMgYmVjYXVzZSBpdCBuZWVkcyBzb21lIG9iamVjdCBhbmQgZnVuY3Rpb25zIGltcGxl
bWVudGVkIGJ5IG11bHRpcHJvY2Vzcw0Kc3VjaCBhcyBUWVBFX1JFTU9URV9NQUNISU5FIGFuZCBU
WVBFX1JFTU9URV9QQ0lIT1NULg0KDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2FjY2VwdGFu
Y2UvbXVsdGlwcm9jZXNzLnB5IGIvdGVzdHMvYWNjZXB0YW5jZS9tdWx0aXByb2Nlc3MucHkNCj4+
IGluZGV4IDk2NjI3ZjAyMmEuLjczODNjNmViNTggMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9hY2Nl
cHRhbmNlL211bHRpcHJvY2Vzcy5weQ0KPj4gKysrIGIvdGVzdHMvYWNjZXB0YW5jZS9tdWx0aXBy
b2Nlc3MucHkNCj4+IEBAIC02Nyw2ICs2Nyw3IEBAIGRlZiBkb190ZXN0KHNlbGYsIGtlcm5lbF91
cmwsIGluaXRyZF91cmwsIGtlcm5lbF9jb21tYW5kX2xpbmUsDQo+PiAgICAgZGVmIHRlc3RfbXVs
dGlwcm9jZXNzX3g4Nl82NChzZWxmKToNCj4+ICAgICAgICAgIiIiDQo+PiAgICAgICAgIDphdm9j
YWRvOiB0YWdzPWFyY2g6eDg2XzY0DQo+PiArICAgICAgICA6YXZvY2FkbzogdGFncz1kaXN0cm86
Y2VudG9zDQo+PiAgICAgICAgICIiIg0KPj4gICAgICAgICBrZXJuZWxfdXJsID0gKCdodHRwczov
L2FyY2hpdmVzLmZlZG9yYXByb2plY3Qub3JnL3B1Yi9hcmNoaXZlL2ZlZG9yYScNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAnL2xpbnV4L3JlbGVhc2VzLzMxL0V2ZXJ5dGhpbmcveDg2XzY0L29z
L2ltYWdlcycNCj4+IEBAIC04Miw2ICs4Myw3IEBAIGRlZiB0ZXN0X211bHRpcHJvY2Vzc194ODZf
NjQoc2VsZik6DQo+PiAgICAgZGVmIHRlc3RfbXVsdGlwcm9jZXNzX2FhcmNoNjQoc2VsZik6DQo+
PiAgICAgICAgICIiIg0KPj4gICAgICAgICA6YXZvY2FkbzogdGFncz1hcmNoOmFhcmNoNjQNCj4+
ICsgICAgICAgIDphdm9jYWRvOiB0YWdzPWRpc3Rybzp1YnVudHUNCj4+ICAgICAgICAgIiIiDQo+
PiAgICAgICAgIGtlcm5lbF91cmwgPSAoJ2h0dHBzOi8vYXJjaGl2ZXMuZmVkb3JhcHJvamVjdC5v
cmcvcHViL2FyY2hpdmUvZmVkb3JhJw0KPj4gICAgICAgICAgICAgICAgICAgICAgICcvbGludXgv
cmVsZWFzZXMvMzEvRXZlcnl0aGluZy9hYXJjaDY0L29zL2ltYWdlcycNCj4gDQo+IERpZCB5b3Ug
dGFnIHRoZW0gd2l0aCBkaWZmZXJlbnQgZGlzdHJvcyBpbiBvcmRlciB0byBnZXQgY292ZXJhZ2Ug
b24gYm90aA0KPiBDZW50T1MgYW5kIFVidW50dSAoZXZlbiB0aG91Z2ggdGhhdCdzIG9ydGhvZ29u
YWwgdG8geDg2XzY0IHZzIGFhcmNoNjQpPw0KPiBNYXliZSBhIGNvbW1lbnQgaXMgbmVjZXNzYXJ5
IHNvIGl0J3MgY2xlYXIgd2h5IHRoZXNlIHRhZ3MgYXJlIGluIHBsYWNlDQo+IGJlY2F1c2UgdGhl
IHRlc3QgaXNuJ3QgYWN0dWFsbHkgbGltaXRlZCB0byB0aGF0IGRpc3Ryby4NCg0KT0ssIEnigJls
bCBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4gdGhpcy4NCg0KRm9yIGJhY2tncm91bmQsIHdlIGRp
c2FibGVkIG11bHRpcHJvY2VzcyBieSBkZWZhdWx0IGluIHRoaXMgc2VyaWVzLiBUaGlzIGlzDQpi
ZWNhdXNlLCBub3QgYWxsIGRvY2tlciBpbWFnZXMgaGF2ZSB0aGUganNvbi1jIHBhY2thZ2UgYXZh
aWxhYmxlIHRvIGJ1aWxkDQpsaWJ2ZmlvLXVzZXIgbGlicmFyeS4gU28gd2UgaGFkIHRvIGVuYWJs
ZSBpdCBvbiBzZWxlY3RlZCBkb2NrZXIgaW1hZ2VzIHdoZXJlDQp0aGF0IHBhY2thZ2Ugd291bGQg
YmUgYXZhaWxhYmxlLiBBcyBzdWNoLCB3ZSBhbHNvIGhhZCB0byBsaW1pdCB0aGUgbXVsdGlwcm9j
ZXNzDQphY2NlcHRhbmNlIHRlc3RzIHRvIHRoZSBkaXN0cm9zIHdoaWNoIGhhZCBtdWx0aXByb2Nl
c3MgZW5hYmxlZC4NCg0KR29pbmcgYnkg4oCcLmdpdGxhYi1jaS5kL2J1aWxkdGVzdC55bWzigJ0g
ZmlsZSwgdGhlIGRpc3Ryb3MgdGhhdCBzdXBwb3J0IHg4Nl82NCB0YXJnZXQNCmFyZSBjZW50b3Mg
KGJ1aWxkLXN5c3RlbS1jZW50b3MpIGFuZCBvcGVuc3VzZSAoYnVpbGQtc3lzdGVtLW9wZW5zdXNl
KS4gU28NCndlIHBpY2tlZCBjZW50b3MgZm9yIHg4Nl82NCwgYXMgcnVubmluZyB0aGlzIHRlc3Qg
b24gb3RoZXIgYnVpbGRzIGNvdWxkDQpjYXVzZSBhIGZhaWx1cmUuIExpa2V3aXNlLCB1YnVudHUg
c3VwcG9ydGVkIGFhcmNoNjQuDQoNCi0tDQpKYWcNCg0K

