Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B781458D63
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:27:35 +0100 (CET)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ty-0008Vj-4s
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mp7Lt-0008FX-GV
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:19:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mp7Lq-0004Rj-Ge
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:19:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMB6iA5019920; 
 Mon, 22 Nov 2021 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=DwvrCk+xfbxqAobmJ81CSn2qSbgGVmc6cC+Fad/Wjr8=;
 b=G46IpiwH/hmAvQH1xNguGfNr3Por2qTPI+iPlDk+fwJFsCAl2aYXS9kIjgajuLjLSktL
 Qd3lgQdVJT6nFN19JaE7oRAz5sV6AOu27K8zk13zp0BSWK+H+HrmFM1BC5kyfdCj0tn3
 oKlTq4I14CBEXKtMJ0WlZuqg7pefSBc168S3mvmJqQH8qxyCIw+jmHr2IurXPM3mYi9m
 1Mx/VP33oel6VHkx+T9eaFrqp9kEKvMvYVligx6Z63TOyi6S7OzGW5ZNjosIHfvrorxi
 ZeoyBZ8j/LF7h1/OI01175Qz5nFeIL2CmUdnoav+4R94amxvJKhSKzMxoGTXC4kmmR0s xQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg55fsdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 11:19:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMBAid4053509;
 Mon, 22 Nov 2021 11:19:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 3ceq2cefqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 11:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRTVt3/n1bsEyFU0PbGsJhSb5gM3F4RohMErVaF5/qAYi3tlEY4NXHzC0jrW9o61YRPqgwLlm6rMFDcdjnsi5NYELx+1TZQ6PcPKo16+lwHEuHg6FF6PQi5WQRgkdTMMPnK4wECf00qWcCiQ2upP/H9MxnWHIzo2UufV0z84JbDH+E2r+nlQX+8NzKQVnnx4QdHanq6Kd336/YaUe0dQPVW4d/eLxXICIm1Gz5qP2o9nFxfA9KsXA2vbbglYtT0HGrziesP+T8GqCSYVolImrI4mMjPZ3g1KWJlHzoItjhK9g0qQa7vKl3BQsxWexp77LTHVMZHiGUMWbcNsKBN+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwvrCk+xfbxqAobmJ81CSn2qSbgGVmc6cC+Fad/Wjr8=;
 b=RmzlwxG2/CPC0f2I+PB8fPb5Ty6GyxiIbLZ1b/WfiTDgPI7/dmoVm+pZEzJ0UivISeR4H+STEfJNY5fjlo/h3JzKDuMoo1P6uAm2I8QNV63HvoEQpang41zogf96gpob6Sg2TTLfRlKVQ2d94ahcDsYMaCxvGoIhftWn8P4tM3Hf0gr6ZJTgu8zGX4iUoJUtaodSZ9zjXgl8Rg+ter0BCEN4s91CJa4sfq2n4DMeC9fPjytIPoI785e3KkZRnkTY6Gqs+tHrUwewzvAjrn4vqLlYRYjlPvkas8BfpHsFSGUMES9zPVBUrC+W5DJ/9vxfdPSz/ZNe/BiYdrqDnePuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwvrCk+xfbxqAobmJ81CSn2qSbgGVmc6cC+Fad/Wjr8=;
 b=GwORIcIsRArLcp/lR8wTbm4bOTsLQJNZ1iwL7JJ42hd3vWXF+AvJfIJ3SvoRSp2R04oucgInY4uwU6+Yp59TAzMBi/mrYVBLr4vGMsdeKIHXEx9kXk3AJvUP+gvIU6U/DlBCb8Gc2CSBBYk84zWmsPfFKXySvtUH7yJArn3xlD0=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 11:19:05 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%6]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 11:19:05 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2] qom/object: Ignore global properties with empty
 name
In-Reply-To: <20211119113229.350338-1-philmd@redhat.com>
References: <20211119113229.350338-1-philmd@redhat.com>
Date: Mon, 22 Nov 2021 11:19:01 +0000
Message-ID: <m25yskigka.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6PR07CA0098.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::12) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB6PR07CA0098.eurprd07.prod.outlook.com (2603:10a6:6:2c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.13 via Frontend Transport; Mon, 22 Nov 2021 11:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99b0615-a420-49c1-6eed-08d9ada9e52a
X-MS-TrafficTypeDiagnostic: MN2PR10MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR10MB43342527954E7829FD0FC174F49F9@MN2PR10MB4334.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLAj8GB8hI5QNB1npTHZv+UyP262H0/kJ4v4fE4p90wGdHb9BvYcEHRiWu1w62RlJJcvjScLdP838T9mRBziMrqQvCUwIuD0X60CDTn48cat+aCqTIuYnmeImaaLSNZ21bEFbd98EfNZg/uPbdd+zHJmTZqc69nCfTmQXZ61od6TABy7K0J8voW9cPWAdlQH8OLbl6TaIGgpJVk3wRNFagbDsfq2j2PGpanYQRTPEJ8fJ4q1jXnBjADkd0B8dYF58BAdAEPq65GgZmOOFOHshLP6h/645gdDFhRZeSB8EXe1faZiT/IzBVtSa/AMhO+3mr+6xAKxhp+uqh4vlyRdEKZaYYvns4utToXfEkUUFsHGWFe+wAWGIzu1gqZOmZOXDuva7ohp8e17AOzrBV7ih/Id/zyyf10DpRpxNVz4BPPtnDjsZ2isd53ab+eP/WrmFIBZrIDVDtojUDqQdx4b2ZnzywMRNxED1L1L4/GYc+5ZTwZZibW2lQnxF8PKF2/XWS1KDBpLmuLDLjHHHd0NM/fc/Kq4YEpAxk7Kv1hGJU1h4BrLVtI1rdtxv6mg/e8fUbP5kuqYuRuvENEj/T1vpIc41WQieXHvuYMgLgFKASGKoYWAfYjdjOoScHfjuW3od0TR/RcBiBGXcrw3FmBL9GMpWOhvL1DCtcHEaWsLRQqdHd73lzXfsBCN9thKnn72/a05lqUnmHs4emMFs5Jucodf+brVZFk9VbQH/C41CIItWvq1VrVU6D4mXfxNCdjX719GtzQ5+PCoTjYVjoHY4mANRkiHw4vntP2/ZidUb/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(508600001)(66476007)(8676002)(66946007)(66556008)(966005)(38350700002)(38100700002)(2616005)(956004)(52116002)(44832011)(6666004)(8936002)(7696005)(5660300002)(316002)(4326008)(54906003)(86362001)(4001150100001)(8886007)(36756003)(55016002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjVRVXpxR3AyRDlZMGhKUnladzhBaUEzV2pBUGViakNFMS9jNXVrNjd4dytT?=
 =?utf-8?B?UlFFTW1TV09yckZJUHhldTZSWU5OdTFKUWxrNlNDSEp5WHYvVGRNMzV6bHdj?=
 =?utf-8?B?ancrTHhQVXVBQWFwNDJiUmZIaW5Pbk5WNEJyWE1sUUQrYkR3RFpSYTBkTXRD?=
 =?utf-8?B?VWc2NWQ0RHJseWhPNjZyMjRTdDcxWng4cld3NEZpMUdERlRKL01CWkFFQTAz?=
 =?utf-8?B?ZWV1Ym9saVpMbXB5VlVwNHpaOWw0Z0tBdXh1Yk9UMDJWYWRVT0JWSTdOcU1M?=
 =?utf-8?B?TTlob0xzQWNCYmp5Smt2emo0QXQ3d0cybWEwdkxDMmpvbnU2S3JXYjFqRGlZ?=
 =?utf-8?B?bGR4VVRkS1dEQnljY3lrVTF2Z3VFd2xMTjlmUXArN1RFMEtRSUF4YVowTnpm?=
 =?utf-8?B?eVRwZmo2T2ZuWjVCZVRuNklTK2g1Yy9BSlFkRUJZa0M2NjZLbmlEV0hsSDNq?=
 =?utf-8?B?WDFGRXpHWWZXUjJmTjJ1ekYrUGxGMkk1LzdqZjZ1NHg3VWVET2tBeFBLWlUz?=
 =?utf-8?B?Z0tTUWEzbGlQM0V5aXpzM1NUTnUydVoyRFVhYTVDcGlXUVhqZG5kMHpScXF6?=
 =?utf-8?B?YnR5UUM4cW44VzZ3cXorNGhKTWRFa2thR0FUUkhkcW12LzhKWFBFaHZiN0I5?=
 =?utf-8?B?bmMwODFDeTZuQTR0SXpVaUlOVlltN1ZCeE11QmUzR1JhQ1MzNzF3V1BrU3Bi?=
 =?utf-8?B?cjhTaDhOSnl5SzJRZzg5OUc4bVFkQ1FZY09EUTBCMHlzNDNyMUZCWDUzZDBT?=
 =?utf-8?B?MkZQbHQyN2ZCaWd0WHZlNndSS3JKZ2dndUtIditzRDV2ZmVWeHBWSFlrb1dm?=
 =?utf-8?B?WXczUXNQTnNmZHhPejNHSlB2LzJuUzVIQkhNQXNaM2R1SXdWSzZ1UmRYR3d2?=
 =?utf-8?B?Z09oZHlkZld1VFRQK0hWMWQyNnNEdUtSZ0FuT0VYRkdGa0U0QW5DR3NCRHpL?=
 =?utf-8?B?aTZmV2gxYXpBeVNnczRSRDFhYUM0WVk1aFJzWEhSZHNpSFkzdmFUSy9DckdU?=
 =?utf-8?B?MFUzNjdPYWhXVHJHdlBFamJLQjJnczZ4Q0RVQVBYZ3c5WjlKNG92UG9KZWN5?=
 =?utf-8?B?SVZCRDhHYVFTSGlBWDdudStuNEpWQkF5ejFBMzJsZFpPd3VFaHFINjJXdHRE?=
 =?utf-8?B?TDUwc0RmQ0ZSdkUyRXJhdkxWRGoxY3lSdUozdzN4QlBZZ0FuaWRlS2lnUTgw?=
 =?utf-8?B?eTJHU1p2T0RPZ1d6cVhZVWsxUlplSG84ZDMyZmxnMXNybTBUWkk2aTF3WXl4?=
 =?utf-8?B?TEIzSE83SXFNQUdoMVkrU21sSm1Id2RydTcyTVFaUzdlZVFjYW5pa3c3NzIr?=
 =?utf-8?B?Ui9mMmlzUkNrNm53REEwaEJ3NURCenRJVG14cno2OFlKN0pFNm1OM1hXKzVt?=
 =?utf-8?B?ZFJ3dlFpUHdUY0k3TExEVlpzb0RSY3ZTRUNDOFdGdnVSOWhHNW01Y1BOa25O?=
 =?utf-8?B?dFRBSmlIYno1K1VmY3R1cnQvRU5Hcy82ZzBmcFM2dnJiemxPRUh6SUNVdmt4?=
 =?utf-8?B?R0RNbXhhMGt2aXF6b05HUFhNRHlpeGQwN0J4aXJJNnNRMnBPYTNTQko2dGNT?=
 =?utf-8?B?UkdMU21rZnNNTyt5S0pTOWlIUGMvUlNpNmtnOGxmdk52d09ObWUrUUEycEFo?=
 =?utf-8?B?YklKaHhVektGaFduYnVpalJkMnBlNmk1bGE1YVgwL21JN2NLd2U4L1ZGY0E2?=
 =?utf-8?B?UHI5N3dkZDhHcTJYbHVOKzZoZHJoR2RvY2FlUjdkblR2M2JXWVBBWDlNY0tr?=
 =?utf-8?B?QytxWVhrSTFrei9zQnoxZWFkNURkamRKVzlZMVBWY1NKUTNjaG9KTjBaTmc0?=
 =?utf-8?B?cFpzWDdwcGV1NFRZTXo3cGh0SnZqT1M2eVlqOWZQN3hRSEp6NXNLZldBcmR1?=
 =?utf-8?B?WGtGZ0NycjlQaGlmU0FJdHFmNUF2aUxYazUxYVRIZnM4cnY1eXdqdy80RTJv?=
 =?utf-8?B?WWtPQ3BFeHU4cGw2MXNDTUM3QXhGdGNlNUwyTFcxNitqMG50Q0ZuK24xUitS?=
 =?utf-8?B?UFZydU1QOU1uM0pBOTIzMzVha0pNZ1l5Vk1SRGpDUWZrQWUvVFYxY0x0SEQy?=
 =?utf-8?B?emJXZGM3SHdUSEJtSUx6dUtNNXl3dDJHZU0zTGpxNVFWTzVVOS9JUm9xWi9h?=
 =?utf-8?B?VEpJeXdIOVdhQnNja0k3ZjRncVZVNXFUNndFRVAwT3VncnE3dVZBQld0Q004?=
 =?utf-8?Q?EMyJOctaclJuIC3G9GL6x3c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99b0615-a420-49c1-6eed-08d9ada9e52a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 11:19:05.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6z3IOFI06TGS4L1clq2/X9b4NNnWHz9aRqhMpsHZKNVty3ytA1xQEGBcFc1xEXQFLlIkv434q9JcVayyWXZSRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220059
X-Proofpoint-ORIG-GUID: 1CzxyHRW5TR1MbwLFn4xylC03g7IvyAE
X-Proofpoint-GUID: 1CzxyHRW5TR1MbwLFn4xylC03g7IvyAE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-11-19 at 12:32:29 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> When using -global, properties might have empty name/value.
>
> This fixes this legitimate use case:
>
>   $ qemu-system-x86_64 -global driver=3Disa-fdc
>   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>   string_input_visitor_new: Assertion `str' failed.
>   Aborted (core dumped)
>
>   (gdb) bt
>   #4  0x0000555555f6b8d5 in string_input_visitor_new (str=3D0x0) at qapi/=
string-input-visitor.c:394
>   #5  0x0000555555dd0f8d in object_property_parse (obj=3D0x555556f33400, =
name=3D0x0, string=3D0x0, errp=3D0x7fffffffc9c8) at qom/object.c:1641
>   #6  0x0000555555dce131 in object_apply_global_props (obj=3D0x555556f334=
00, props=3D0x555556737360, errp=3D0x555556611760 <error_fatal>) at qom/obj=
ect.c:411
>   #7  0x0000555555dc5ee2 in qdev_prop_set_globals (dev=3D0x555556f33400) =
at hw/core/qdev-properties.c:790
>   #8  0x0000555555dc89e8 in device_post_init (obj=3D0x555556f33400) at hw=
/core/qdev.c:697
>   #9  0x0000555555dce02b in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x55555672bd20) at qom/object.c:383
>   #10 0x0000555555dce059 in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x5555566e9090) at qom/object.c:387
>   #11 0x0000555555dce059 in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x5555566df730) at qom/object.c:387
>   #12 0x0000555555dce566 in object_initialize_with_type (obj=3D0x555556f3=
3400, size=3D848, type=3D0x5555566df730) at qom/object.c:519
>   #13 0x0000555555dcec78 in object_new_with_type (type=3D0x5555566df730) =
at qom/object.c:733
>   #14 0x0000555555dceccf in object_new (typename=3D0x5555560fcf81 "isa-fd=
c") at qom/object.c:748
>   #15 0x0000555555dc75fe in qdev_new (name=3D0x5555560fcf81 "isa-fdc") at=
 hw/core/qdev.c:153
>   #16 0x00005555559eec58 in isa_new (name=3D0x5555560fcf81 "isa-fdc") at =
hw/isa/isa-bus.c:166
>   #17 0x0000555555bd3607 in pc_superio_init (isa_bus=3D0x5555566b42e0, cr=
eate_fdctrl=3Dtrue, no_vmport=3Dfalse) at hw/i386/pc.c:1026
>   (gdb) fr 6
>   #6  0x0000555555dce131 in object_apply_global_props (obj=3D0x555556f334=
00, props=3D0x555556737360, errp=3D0x555556611760 <error_fatal>) at qom/obj=
ect.c:411
>   411             if (!object_property_parse(obj, p->property, p->value, =
&err)) {
>   (gdb) p *p
>   $1 =3D {driver =3D 0x555556738250 "isa-fdc", property =3D 0x0, value =
=3D 0x0, used =3D true, optional =3D false}
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  qom/object.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qom/object.c b/qom/object.c
> index 4f0677cca9e..45fa8561df6 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -401,6 +401,9 @@ bool object_apply_global_props(Object *obj, const GPt=
rArray *props,
>          GlobalProperty *p =3D g_ptr_array_index(props, i);
>          Error *err =3D NULL;
> =20
> +        if (!p->property) {
> +            continue;
> +        }
>          if (object_dynamic_cast(obj, p->driver) =3D=3D NULL) {
>              continue;
>          }
> --=20
> 2.31.1

