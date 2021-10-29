Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E060F43FEF1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:02:53 +0200 (CEST)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTPA-0003sD-NZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgTLh-0002aC-S1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:59:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgTLd-0003Sc-96
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:59:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TEHRrS031039; 
 Fri, 29 Oct 2021 14:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cJkbAaOWJRe8Uf59YaAaWcRfkw41Xs5WZDbdvtEZM+c=;
 b=puC8J3PYms86bhErXah7WfTrIU+5KAbFrA3uryiR4LZJCpYYp3UDMzt/EXVvqFOBtrou
 EVuNeGqUIwOGO8oGWuBjmNX7X4XPmwYwaVEjwUMS+TzCN+ITx4P1Eb3mvLZ0t+kPoMGE
 UKJKvYqHsJ/eouZXOOmLeIE54inDdYwyTDdJTzJ2Ok4fAYoHO+mdwPAcm+M+5OkjVfOn
 vsc63GJT8FVUGXDMJbGQw/W1qbHYudLeI6VXWSW/X2uxszpU6KGsdUHFIuwHYJmPJQiH
 XPGtzy8LAYuX5QB76ZvemidSGjTNsMsmGvL6zNXdcAZwtqD4qJFZhr3v/HXjT+9qzenh 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byhy9r9j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:59:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TEbVXG067989;
 Fri, 29 Oct 2021 14:59:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3bx4gd7r53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOZojqxsIWVMsvZjhmyKE84apt/9A3gxB5fLs2KCSVd0uKrJoJOX0KVU0G4O7K+SXSM6zMPrYxjtbIYpKLM4W1SDuYj/QH8exoLa8/M8uMT0PXGdzyD/RbMKSJWEBO1dSHzXNfW5ySmt/2NgZHIy3b2kPhLNovtJ0jImyKhCcSh7Lf94LXS8MPC9T7cWMOZS3xI82ROxgJ07eZaGgFOs3evF+sw6UBcdw1HmVEIt6h8yBU8V1m7EmVnxtwq4K5bKqVY1Q8jWMacBVVI6f0yV+jgazKX2eF4BhSPEhbQhT+Mud33AiDmIXHAr2RSXnWR8/l0qr9hfC9IZmRxhdx3Q8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJkbAaOWJRe8Uf59YaAaWcRfkw41Xs5WZDbdvtEZM+c=;
 b=UHPBfP8NySKxYh/vnucPbtTjDYlGOiJnYIyqWX8dzdKR8oYkKZRIf7HONsB2gOZD2i52DqdkxbAMmZ/0YmoqE1FB3gffVqbY9I+cKbfV9UN0VblTqid53Llhm5N0JOGT7QLzFnN2ST0jwqDfuRQgfUpreN5rGcQdAn/2btU2Di5SuvzIeRGcM1q08U1cPjFOVv9vfsD322fIRy4GYyQ4DQr+5Xx1bgbTBccslkuDQnZ6HV+ikJ4f1kEDBZ+ri712rt5yZhHExCJqqbYffoXeHlu5qUiO1WHk1NfWYg/53ruQmCdVx6qNHeDky42BR28TkdsPCr+PV7kCsYEVzTr9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJkbAaOWJRe8Uf59YaAaWcRfkw41Xs5WZDbdvtEZM+c=;
 b=fj8si2x/FkbrICSWEb1Bhq0HXkOCqKsZlRkaQoMfLLh6qFFCN+t3aQVnnVBacHQJbSZUMcxtFnXxOSNs1ol1C6TIdW/CfxYKmBbhhGdsAGPBR//j5v0BNJbtqKLVOCWBp7occO7HeyaxrDFIAfwf06owbjEcLRObfZF0oPkT9CQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3856.namprd10.prod.outlook.com (2603:10b6:208:1b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 14:59:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 14:59:02 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 04/12] vfio-user: instantiate vfio-user context
Thread-Topic: [PATCH v3 04/12] vfio-user: instantiate vfio-user context
Thread-Index: AQHXvmCI26lNm3C/TEm5ZoPQ+v9PyKvnGpiAgAMTqoA=
Date: Fri, 29 Oct 2021 14:59:02 +0000
Message-ID: <093B71B9-46AF-442D-80A6-49EF27874618@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <82b00867c07020fcf71749627414a80ef6b691cb.1633929457.git.jag.raman@oracle.com>
 <YXl3dzdzNZZZWLOS@stefanha-x1.localdomain>
In-Reply-To: <YXl3dzdzNZZZWLOS@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be4e60f1-c010-4ac3-f560-08d99aeca538
x-ms-traffictypediagnostic: MN2PR10MB3856:
x-microsoft-antispam-prvs: <MN2PR10MB38569D8AAD2885D3B25B114B90879@MN2PR10MB3856.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:281;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b0Ik7ZV0V2c8apIt1o0KMCcTW18mM3XoJ1NI8oA6dD/ukmSRn2XmIUBR/Z512oT9T7oDSOVZoTnEM6By1GJswy334XVnPoXevQOke0I+c3nV9X1JuJbuKb9N14IbIQ/ltVBVHOFih3g05S1oDtuGbr9Ph9rWDVFxyb8JZfysAuuIoczYhnlw9CJS2jGvcrzb9CY6zmul5Ky13xbOBl3BcXdhtKxyYPxXADjHGWaePEzieG2JzoWZHbnltGgyMmy9Fm7qgT/fYc0qATTQLWqQihQwhpmW4zDSbrEetmPq5ZN4Q1+xAvOPZjfQeWD3dKeBKV0i5J2NTbKgVymtI2T/EB5cVSTcvNEeNBrgDWTVi95x8x2pS8HpP7IHv64DIg0ejRR/AHhdHq8MbET1v+0ixRsVQgPrVmaPi4eL03ElswyZmLGv9T9RIGilsKRabPZOlvtpHT5yRpsgR7ZI3T8gHILhuwhdYR986/1ICb/jk2RBkNaRB4E74oKguAJtSjD8zePpwcqiEOrMmKSe1qV/s53Wz6E69m8RJIhu0oiQ4SLOsYIxXlwqYrlocdAoqQC9ov/39Jpsko2F4oKRq4KZpHitaD6RpU709REhuj5A6c3CvEt05wpOG/Ial6ayF1B4OXIgnbacrkZyFqhircBPwB4Faj+NL+JGuteQFbMjxeF+8DyKtilSGVEoYlaFmo9BKdpY+1DWxI8fgFDg6fisZh6dEZWBg7+DE8wgPOGOraOgSeN4d0JllWFOhu5H1kGg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(4326008)(8936002)(7416002)(6916009)(54906003)(316002)(38070700005)(66476007)(66446008)(53546011)(5660300002)(6506007)(66946007)(64756008)(66556008)(76116006)(8676002)(83380400001)(122000001)(2906002)(86362001)(44832011)(2616005)(38100700002)(186003)(71200400001)(33656002)(6512007)(6486002)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODM3QVpSVWtSbVRES2dwYnFySFU1dFBaUVprQ3VBbi9pdU8veHJjUUpTN2RW?=
 =?utf-8?B?MDgzd2VFbzJMYitCN3JJYlo3Y3FvTStQWkZlRmNYZll6aEJ3UE5LazZ6dmtC?=
 =?utf-8?B?NmlHUXFVY01Sb1RxendDc3NYamhlNmNVanMrMm9HdG9BRytkOUpoZDUxczBy?=
 =?utf-8?B?N3MxTS9GcFJ2b25TNWsvL1BiWTc1RlZCaGlINGZkWHAwa1BzdDRlcW1kNDBx?=
 =?utf-8?B?L01mUGhjK3A5WXdZYUxlVERlQWNzTnNvd1VGNXQxZzM1TTdQcnJTU3Nhdmxh?=
 =?utf-8?B?M1E3UXJKZHE2WW5ELzRqUW5aTW5OTTNhSnA1V00rU3lmZGdjOWFZQll4aHF5?=
 =?utf-8?B?TDY4bE5IcXVyZEZLbllPOFZrZkp0MGFudzZYUmhzbjZHZ3FPWUNtZ3RWaUw1?=
 =?utf-8?B?dHREZ016bFZ6VVBScnZ6MlJieCs5ZkdrWDNDK2R4TEVUbHJaT1kvSFlFN3ps?=
 =?utf-8?B?YlRnVWs5ejVGTi9vQ3JqTkVZV3VwSzM1cHlISWRic05HWW02Q3Voalh0MFVy?=
 =?utf-8?B?TjhFUnQ4NlBhZ3JMSHN5S0srazZBWms4Z0VzNC82RGd2cEZxZEt2U2FLNGdw?=
 =?utf-8?B?RGY4cFJBK3Z1N3lUczk1RW5RcnI4MmtOTXFUT1NrNGU2cy93aGc1aUJQSzRs?=
 =?utf-8?B?UDFmc2FrVk9qT0d2VWVMZkg0aVpDdjFWemJ4dzhnMkhRYkdlNmRQbDFvU1dy?=
 =?utf-8?B?VFdrTC9lSWNJY0xYWWpJVG8xL1RvNk5FamUzNmRCT3RGNk5CdTlMTGY3OHBG?=
 =?utf-8?B?WWZsRXBaUjN4TExubHZTZkZyOCs0N1R4OXhCQkFLRjJaRHdNc0lad1RWWFE0?=
 =?utf-8?B?QkU5SnJqUENGRzFSalh1N0NNU01WOVNkNmF3aFFFRGxQY1VGcFFQNlkrUHoy?=
 =?utf-8?B?K2RsR24xRW5CQThMZk9tNXYzQ1E2WmlHTDRoampyOE9hc3RBOURsQlNkUDM1?=
 =?utf-8?B?b3c4VkkrM1VPNDR1eGlveGZnd0hWOXF6K3Z5aXZmZDFVSjJRV1I5bDVzMTIx?=
 =?utf-8?B?TTcwWnpMdnNkL0k0bGlOcFVRZVAyY0FmOGprcVJQc3VQUkJ4Tzdxenp3dmZW?=
 =?utf-8?B?QUtFdXBhQ0RmL2p3dHc4b3A0eVYwcENWNWJCS3JVRHNvUi9mNm9sa2tyck56?=
 =?utf-8?B?VGF0S0FNR3YzQWpJU1VOd0E5dklFV1JrSENnMUkrYTBkUW9MZEtHTTRoRnFK?=
 =?utf-8?B?U2x3MW0rYlhoeXMySXluZmo4ekRWTWNiOVRSUEJCa0cremFmZUtRK1hJRmFa?=
 =?utf-8?B?N2dBT3BRZ1BzKzh4T21KN2FlSmwvOWQ3RVNUeUV3aFNBOFY0d3loRCtKKzRY?=
 =?utf-8?B?Tmlmc0hZNDhtdHNEUzFaY2dUbmF3TmFUZkhlQzZyUzB5eE16a1YvbGMyQkc0?=
 =?utf-8?B?elJsUzR3MVlQMzEwU3l3dVZDb2tFMkJVY1hFMjBxLzFIWjhCaHNWRXVuZXIr?=
 =?utf-8?B?UXBhNEpIWHQrOFB3RVc3bXM1R1VzKy9maXBuTG1VTWdvMDFQUGZPanNKVjcv?=
 =?utf-8?B?RFhxd0hRK1VQa1hGNGpBN3llMUFUSzdxZHVtS1Exb1RzYzZGUG5TR2phVThP?=
 =?utf-8?B?b3lsK0hUc0I3eGJoUXFsd2hRZUhjQnVOS0V5TzlIczBqdFNoZE52TXNLbXBD?=
 =?utf-8?B?aktYZUJuWGxiaXFoMjA4Y1V0ZlpwM2cvc1V4bUtCSTE3Tk5QVFNlcFdENFJv?=
 =?utf-8?B?dHlWY3Z5Uzc0emNpOFdPWkh4VUtkQWRwcW9kZ3pnb3RNU3ZodGJGZTNDWVVJ?=
 =?utf-8?B?MjR3K3NvQ0FlbFNmenpJNzFZVEdVd2xIVFB2M0VTVE4rd0xqcTNEOTJLRnRr?=
 =?utf-8?B?RkcwNzhwREc1eFovNVRaTU8vWnU0bEtDK0U2Wng5QVA1OTZacS81Nk52cVBG?=
 =?utf-8?B?TXRKcHpFMGFiOFozN0dweld4VmVwRmVlSlc3ZTNYYkNYZjVkTkRwUlpuQk9Y?=
 =?utf-8?B?YWUrcDI1cFhvemJCTnFjcmpxOGdVVXhkVktVeEpON0ExbVB3ODNzaW5Obm93?=
 =?utf-8?B?UENwc28wY2dYYjRpMlBsMGI3d0dLKy8zOGZ6dVZxZUVHcWdRczM5S2ZlQTc0?=
 =?utf-8?B?T2RiNGJWWllkZkRlMDlGUng4K1Y2NHNGdUQzYTFrZVJ5YnFuOVVTN1NzcFFz?=
 =?utf-8?B?Zkw5eXdONGxDQXA1blArWW02dURwNlZuZGR5cTkxOUNzU2dyY3JSRkJtRzZZ?=
 =?utf-8?B?TkFZbGl0ZnVJc2FDQUJkbldOZnpEcCs5ZVpzL3N5SUNVMDRNdGlsSXpXY05D?=
 =?utf-8?B?eFdlaUg5ekRMT3lnek5Fby9sam9RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9A164661D7CFB45958585230A8FC8F8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4e60f1-c010-4ac3-f560-08d99aeca538
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 14:59:02.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inynKEZ8RWa9AVCODFpJ/qwkGFa9ENA5Zh6+d67xIkOg9ixi6uRVe3LzXWCof7Y9NEcU1yA5m+MqdzDttt3XcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3856
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290085
X-Proofpoint-ORIG-GUID: MA-eGJhrLKZ4W-EfObgoKzuyrxVXlT7s
X-Proofpoint-GUID: MA-eGJhrLKZ4W-EfObgoKzuyrxVXlT7s
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

DQoNCj4gT24gT2N0IDI3LCAyMDIxLCBhdCAxMTo1OSBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDAx
OjMxOjA5QU0gLTA0MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gQEAgLTk0LDkgKzEw
MSwzMSBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoT2JqZWN0ICpvYmosIGNv
bnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIHRyYWNlX3ZmdV9wcm9wKCJkZXZp
Y2UiLCBzdHIpOw0KPj4gfQ0KPj4gDQo+PiArLyoNCj4+ICsgKiB2ZmlvLXVzZXItc2VydmVyIGRl
cGVuZHMgb24gdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGUgJ3NvY2tldCcgYW5kICdkZXZpY2UnDQo+
PiArICogcHJvcGVydGllcy4gSXQgYWxzbyBkZXBlbmRzIG9uIGRldmljZXMgaW5zdGFudGlhdGVk
IGluIFFFTVUuIFRoZXNlDQo+PiArICogZGVwZW5kZW5jaWVzIGFyZSBub3QgYXZhaWxhYmxlIGR1
cmluZyB0aGUgaW5zdGFuY2VfaW5pdCBwaGFzZSBvZiB0aGlzDQo+PiArICogb2JqZWN0J3MgbGlm
ZS1jeWNsZS4gQXMgc3VjaCwgdGhlIHNlcnZlciBpcyBpbml0aWFsaXplZCBhZnRlciB0aGUNCj4+
ICsgKiBtYWNoaW5lIGlzIHNldHVwLiBtYWNoaW5lX2luaXRfZG9uZV9ub3RpZmllciBub3RpZmll
cyB2ZmlvLXVzZXItc2VydmVyDQo+PiArICogd2hlbiB0aGUgbWFjaGluZSBpcyBzZXR1cCwgYW5k
IHRoZSBkZXBlbmRlbmNpZXMgYXJlIGF2YWlsYWJsZS4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm9p
ZCB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZShOb3RpZmllciAqbm90aWZpZXIsIHZvaWQgKmRhdGEp
DQo+PiArew0KPj4gKyAgICBWZnVPYmplY3QgKm8gPSBjb250YWluZXJfb2Yobm90aWZpZXIsIFZm
dU9iamVjdCwgbWFjaGluZV9kb25lKTsNCj4gDQo+IFdhcyB0aGVyZSBhIGNoZWNrIGZvciBub24t
TlVMTCBvLT5zb2NrZXQgYmVmb3JlIHRoaXM/IE1heWJlIGl0J3Mgbm90DQo+IG5lZWRlZCBiZWNh
dXNlIFFBUEkgdHJlYXRzICdzb2NrZXQnIGFzIGEgcmVxdWlyZWQgZmllbGQgYW5kIHJlZnVzZXMg
dG8NCj4gY3JlYXRlIHRoZSBTb2NrZXRBZGRyZXNzIGlmIGl0J3MgbWlzc2luZz8NCg0KWWVzLCAg
4oCcc29ja2V04oCdIGlzIGEgcmVxdWlyZWQgb3B0aW9uLiBUaGUgc2VydmVyIHdpbGwgbm90IGxh
dW5jaCB3aXRob3V0IHRoYXQgb3B0aW9uLg0KDQpJIGJlbGlldmUgb3B0aW9uYWwgcGFyYW1ldGVy
cyBhcmUgZGVmaW5lZCB3aXRoaW4g4oCYW+KAmCBhbmQg4oCYXeKAmSBicmFjZXMgaW4gIi4vcWFw
aS9xb20uanNvbiINCg0KPiANCj4+ICsNCj4+ICsgICAgby0+dmZ1X2N0eCA9IHZmdV9jcmVhdGVf
Y3R4KFZGVV9UUkFOU19TT0NLLCBvLT5zb2NrZXQtPnUucV91bml4LnBhdGgsIDAsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvLCBWRlVfREVWX1RZUEVfUENJKTsNCj4+ICsg
ICAgaWYgKG8tPnZmdV9jdHggPT0gTlVMTCkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0ZygmZXJy
b3JfYWJvcnQsICJ2ZnU6IEZhaWxlZCB0byBjcmVhdGUgY29udGV4dCAtICVzIiwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgc3RyZXJyb3IoZXJybm8pKTsNCj4gDQo+IFRoZSBlcnJvciByZXBvcnRp
bmcgbmVlZHMgdG8gYmUgc3luY2hyb25vdXMgc28gdGhhdCBob3RwbHVnZ2luZyB3aXRoDQo+IG9i
amVjdC1hZGQgZmFpbHMgaW5zdGVhZCBvZiBzdWNjZWVkaW5nIGFuZCBsZWF2aW5nIGEgZmFpbGVk
IG9iamVjdC4NCg0KT0ssIHdpbGwgbWFrZSB0aGUgY2hhbmdlIGZvciB0aGUgZXJyb3IgcmVwb3J0
aW5nIHRvIGJlIHN5bmNocm9ub3VzLg0KDQo+IA0KPiBJbiB0aGUgc3RhcnR1cCBjYXNlIChub3Qg
aG90cGx1ZykgaXQncyBva2F5IHRvIGFib3J0Lg0KPiANCj4+ICsgICAgICAgIHJldHVybjsNCj4+
ICsgICAgfQ0KPj4gK30NCj4+ICsNCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdChPYmpl
Y3QgKm9iaikNCj4+IHsNCj4+ICAgICBWZnVPYmplY3RDbGFzcyAqayA9IFZGVV9PQkpFQ1RfR0VU
X0NMQVNTKG9iaik7DQo+PiArICAgIFZmdU9iamVjdCAqbyA9IFZGVV9PQkpFQ1Qob2JqKTsNCj4+
IA0KPj4gICAgIGlmICghb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoY3VycmVudF9tYWNoaW5l
KSwgVFlQRV9SRU1PVEVfTUFDSElORSkpIHsNCj4+ICAgICAgICAgZXJyb3Jfc2V0ZygmZXJyb3Jf
YWJvcnQsICJ2ZnU6ICVzIG9ubHkgY29tcGF0aWJsZSB3aXRoICVzIG1hY2hpbmUiLA0KPj4gQEAg
LTExMSw3ICsxNDAsMTIgQEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9pbml0KE9iamVjdCAqb2Jq
KQ0KPj4gICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gDQo+PiArICAgIG8tPnZmdV9jdHgg
PSBOVUxMOw0KPiANCj4gVGhlIG9iamVjdCdzIGZpZWxkcyBhcmUgaW5pdGlhbGl6ZWQgdG8gMCBz
byB0aGlzIGlzbid0IG5lY2Vzc2FyeS4NCg0KR290IGl0Lg0KDQo+IA0KPj4gKw0KPj4gICAgIGst
Pm5yX2RldnMrKzsNCj4+ICsNCj4+ICsgICAgby0+bWFjaGluZV9kb25lLm5vdGlmeSA9IHZmdV9v
YmplY3RfbWFjaGluZV9kb25lOw0KPj4gKyAgICBxZW11X2FkZF9tYWNoaW5lX2luaXRfZG9uZV9u
b3RpZmllcigmby0+bWFjaGluZV9kb25lKTsNCj4gDQo+IFRoZSBub3RpZmllciBpcyBpbnZva2Vk
IGltbWVkaWF0ZWx5IGlmIHRoZSBtYWNoaW5lIGhhcyBhbHJlYWR5IGJlZW4NCj4gaW5pdGlhbGl6
ZWQuIFRoYXQgbWVhbnMgdmZ1X29iamVjdF9tYWNoaW5lX2RvbmUoKSBpcyBjYWxsZWQgYmVmb3Jl
IHRoZQ0KPiBwcm9wZXJ0aWVzICgnc29ja2V0JyBhbmQgJ2RldmljZScpIGhhdmUgYmVlbiBzZXQg
d2hlbiBvYmplY3QtYWRkIGhvdHBsdWcNCj4gaXMgdXNlZC4gSSB0aGluayB0aGlzIG5lZWRzIHRv
IGJlIG1vdmVkIGVsc2V3aGVyZS4NCg0KV2XigJlsbCBjaGVjayB0aGlzIHNjZW5hcmlvIG91dC4g
VGhhbmsgeW91IQ0KDQo+PiB9DQo+PiANCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfZmluYWxp
emUoT2JqZWN0ICpvYmopDQo+PiBAQCAtMTIzLDYgKzE1NywxMCBAQCBzdGF0aWMgdm9pZCB2ZnVf
b2JqZWN0X2ZpbmFsaXplKE9iamVjdCAqb2JqKQ0KPj4gDQo+PiAgICAgZ19mcmVlKG8tPnNvY2tl
dCk7DQo+PiANCj4+ICsgICAgaWYgKG8tPnZmdV9jdHgpIHsNCj4+ICsgICAgICAgIHZmdV9kZXN0
cm95X2N0eChvLT52ZnVfY3R4KTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgIGdfZnJlZShvLT5k
ZXZpY2UpOw0KPj4gDQo+PiAgICAgaWYgKGstPm5yX2RldnMgPT0gMCkgew0KPiANCj4gTWlzc2lu
ZyBxZW11X3JlbW92ZV9tYWNoaW5lX2luaXRfZG9uZV9ub3RpZmllcigpLg0KDQpHb3QgaXQuDQoN
Cg==

