Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC39507C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:35:38 +0200 (CEST)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwRc-0005yH-2f
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwPD-0004Zi-4N
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:33:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwP9-0001vp-O0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:33:06 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHlWki020622; 
 Tue, 19 Apr 2022 20:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=2ObySc9s7AzeET/PoCL/c1Syx8RaQLXgtgvnCaWuWcg=;
 b=hI1QSoQD8XRiOUMP8zegzuxHSqSWqCTAgyT4bXjcBAfhQag6a6849VYHaQhHjBhxNohO
 +8HeLKRLWjmHu3je0aI5WuE/63RiYOPClEPQukfEmXQ99MvlRhBhimZphWaHS0sEZPFK
 MNDsyInGrEw/lr6tJ20sRZwgTGBIhxPvu95jq6QxuzzSt7LEPPu9dJ3UXDS1r754t2tM
 yB8/mwZ+ypKENrO2txpgw0RkQIdj5gMsjSy5ShvRxeYBbI+PsBDXtUCuO0ZZ5u52wB0q
 CgsZcizoU+DTH5qnVL8TCjtPBCUP1zAlFW1fy/ZvKpyAO8McxUaus1XLQXZNbnQD6S6Q 3Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd17925-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKaixN019972; Tue, 19 Apr 2022 20:44:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm892mqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSEhwnWHgWJ22antD+JNmy9wRKiogSftRP1L0SatKjUFyUMQL01MWjbY57wUC5QEURe3CZ6QpRQVWpq2V0To3iARUPSXUDLZ9wWC2FdfRJTB1c/w99ftLipS6TAZd16GGYMGSmIvnTF0sUfWy/qNYZGLQa41czdWfmph+1I5fNyRrPyuIyt8smwa8ugS0Br2n8Ox58qe4junB15q1t9FZTRN2ndsji5w0/iO85Qw3YeW3R9FMHSgsxjEHeHpVFkM05U1qUoYMyYCReBlRL1F5rBzj8OoMpZMCLKK+MqKaEN9J68T9gQC4k4s0LMXxq29xyPqrqhptNjjXfArNdU3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ObySc9s7AzeET/PoCL/c1Syx8RaQLXgtgvnCaWuWcg=;
 b=L+IoowMADcVyzBoS4Agg4ua/GAcwIxDaDNF8h7/FD+dhijwbu7d5BYhTLteGR/PcFhruogeNCiMSoHSSJUAwaAyulTPN/Geeg7zK1T8bTvHhbw0+L8o9OzlJysuAypyCEqjhIpU2TR+YYZkbq+pVnqIFgrw60HH63ePG2J9bvEta5ILchBg7QJX80RsXVzPXBYf4ZBNL21fAvCle7XgnmUqoHEpncZ4emWaSx59QzdNSPCSN5YkTxQUzi/Jxmur7rZMQOByrW45vHS8XgjPk8GGQrWjh0w3daFNuOJEsoID9EDIXFEi661Lh4Nh9mWKdOs/vS7bw1xOTEqnJGjmfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ObySc9s7AzeET/PoCL/c1Syx8RaQLXgtgvnCaWuWcg=;
 b=bYGfEl5kEuVD2dCkK8qwOp1tGoQw+VJMQbr3FD0FgHulEjgaq7OjaYimbe8rWhjL+Klz8DPGj9Ysx8rMUWW5vl8F0uby0AWW+qxKyBpJMnRsYo0GiMeplNndGfVdrtqw6kDARKfXaPMv3q+qACmkUr6GFzn9ee2ey/2QV/gTIHw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:30 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/17] vfio-user server in QEMU
Date: Tue, 19 Apr 2022 16:44:05 -0400
Message-Id: <cover.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e83700f1-1dc6-4a94-c21f-08da224566c8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998F39FF49B38E4B0D1C91A90F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7w2K3icaTsDAzGB8yz7YaQT7K1aKZGldvXkaaFKCcUAPdWZhj+TZ2ydBPSFksRrL+UlEPQescjXA8zvxGg4apVV4kHb0KB52ynjkoQRtE6vx548hv1DRYE5tJq8QK6cOn0xcUpcXA8NsxZwvbUuwq0U5cRlPp03OghzU/5IrQQ+xRUvw0IpNDbleYVajnpmpe75P1WRAYO+eciKlkU+bLncAjMOUwGyBSmhKugr8D2eae/E0yR+Oq4+6GfmN3bMK4HR4Nmqrjm3dD1hb8Er2Wzn8UYs7QdOCvgnShHADW9OxawFIPWGfrdcZppq4ns1dC+P9P4AK1a40vSxk08HGD82xuLqAmdLs8ts9zS9qxIAnY3CJrcebWHoaqevnjyubMUuFzoEYK9DlfGIH/K1OwqzvEcfNFgwLCJYMYLAaG0Rpn+uDmT+RSoR5JueETmkiw5kNlCbs0sVMFbx9o2pqgP/gNeKC19FQnFl1PU9i/tZU9jFtPsslxiJU83AAmLvVS5ytu/XRsw5CsLC5FT1GbAp5UlX+1oW4ytH4qMFb8950NiS55GgE/X+VA3Ncp6IA5bZ7xhebVsguDxH7bEem1cQoQM95p1GUFICgW4IMl+EHLyTU7tRprIukGbOAZILnn2GC/BWVIfB/9fwSc6HyXIAAL2i1uVZGrChkzFzzWTm+qI/C4BL0ybPyjs/nQVQLz+Pqg5+ndlghewlgAtmiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZoQ3FYSkxaU1Z3U3RTUU1wYjZNSVhqYmxhV0hSRkNsTjRvVHVjVXdYMDk4?=
 =?utf-8?B?WVY1TG0zaHpPYlZQRTgveGR5aXZZSkpKMGp6blc5aVJwbmFiZ0NveUxNNWZE?=
 =?utf-8?B?MUVLT2o4dVFhQW0rcFFOcnBRMFZSRlFhM1J2VlB4RmpQWUVkREUwS3lCZ1Vw?=
 =?utf-8?B?Vk9IclNsWnZFNDlmK1pxMXA3OHUydUswMEhFQWxmNWxsV3hsY3lNdStUdGkz?=
 =?utf-8?B?bEpmd1Z3Ynh1ZFpBTHdGUzRvRHBFWmFmdStMNWlPaU5HamVBZjBaL3U4eHNI?=
 =?utf-8?B?dkVyR3AzM2Fla1pTTDExYWluMjlyYzV6cVQybkZaV2ZRWkJpMis1MWxmOERH?=
 =?utf-8?B?bFB6MjgxaW41eUljaVFXZThBWldJb01XRnlWYmgvc2ZtbmpUNTVPNld6WWhI?=
 =?utf-8?B?NzEwSnhHRjBiZFB3czk2b0FxMDAwSWlRM2FzYTJ3c2o5VXltUjhuLzVlWVpu?=
 =?utf-8?B?WFhGdlovVDZYbVdCNnE5SXdZcTVGWXN1Yi9ZNlFrb3FJMS8yTmpvMFZVQm9Y?=
 =?utf-8?B?RFNSOHdjZ2hVYUlMNHhRZjNZTGdZOGtpek15Z2gxQnc4NzNFOEhpMkt0ZmpC?=
 =?utf-8?B?c0RjNWZjZERxYkxpdG9jS0hoTUhuTUd1enZDS0ZQejdGeUJOZTU4Q0pQKzhx?=
 =?utf-8?B?ZmNYMkJPaXVFc2dXQjRaVEpJbXNPQy9JVWNIZ2NBYnh3WFRlVTZNOHNmMUFX?=
 =?utf-8?B?cWhVSDNFNGhkZTRWSTRPOG51dUY5TkU3TExQdzNoSk5BcDJlTllrZG5pUDF2?=
 =?utf-8?B?RG9iMjgrdWRseENTNWtvcW9uL0JmRjJObXQyVUxYYUI1cmVIUlNwa3ZkUVIy?=
 =?utf-8?B?dHQ5ZzloU0hEQ2pjZmRPalZUeWpzbWtjR0daVVd4WEtCWEEvNDBQMElNYUlm?=
 =?utf-8?B?aHdHZUpCQWJxWjVab280ZW05Zm0yMWFuM3lRR2FLVXpWelUyV3ZoNHRRYmNY?=
 =?utf-8?B?QkNjelNpWDBiNGM2S1dlaGEveExuSkpJR0IvV1Y0Z1FSNTkyK0pMVjZJWlV3?=
 =?utf-8?B?Q2c3OGhEdTlJSktQb3NudVdTL2VYdXM3eEFnMmpTam54aWFLTlh3SDN5aHQw?=
 =?utf-8?B?RU5iZ0NCY1JRS3lkSmd3dFVGRWN2WHJ6UWtuejgzaFk3UDZPVGdqak9aUjVG?=
 =?utf-8?B?UmF1R2Q0WjRrRXR6clJOSER1VDZFdG45NnoreDF0bW0xR3BLVkdhWjl1dW9H?=
 =?utf-8?B?VTQzS2R6RVdkbytoaHNBeVlhUHIyOUV1cmwwOHkxNFl6TDVrV0h0cGVsYnZv?=
 =?utf-8?B?TStsWVAzVDZJZE40TTExNUhRazZYVUJUQkRDMDZ1cDlxRUlUZ25RT2RMa0VZ?=
 =?utf-8?B?VHA2bm5nUWNvaGl5UngxQWUySXhBQUZIZ3hVVGVabU1jVHZZczJ4Z2xtMmtO?=
 =?utf-8?B?MVhRNzJnQlpCQWVPSkVSbVpFZmE1S0xhcHA4VUR5b2ovZDBWTGRVeXF1SnVw?=
 =?utf-8?B?U0tuYzZ3V2duWHZKb05KU3hucmZsTFR4NFNMaWUxbXBuZFFWSGNyZExRdjl3?=
 =?utf-8?B?MUhuTHFYdm9HTVljMDFxTTVnc0hIRnJ5bTlWQ0tERGtTZXMrRXEwVUh4dTVE?=
 =?utf-8?B?a3FCTm5OUFEzZFJXcHNIVmVDMFVHTi9mUjFaSFRJcStOVVN6R2MyTHBWOG13?=
 =?utf-8?B?cGtmS0JkUlRYRGlrNWYyeVN4L1NRUjY3N2ppL09uT0tJaEwra1BuWk1pcDdY?=
 =?utf-8?B?M2FKemJpQmtGVk80c3hnMHNndWZjdSsvdHNtVElTSVN4aE5ib0NFU1pCUnAr?=
 =?utf-8?B?WXlyNzh2T3QyRklaZkNXQ3RZb3ZkaFlQUGROelQ3bGFSYUUza0lmWWtqQ3VL?=
 =?utf-8?B?bWhYR3o5NVFaVnk4ZDNDTUIxSHJuTi9sTDYwSmt4T3hESyt1S2RWdkFiOWtl?=
 =?utf-8?B?dWl0Yk0vRWx6T28rU2lSNDNmYzBQcy9ublUwTTh1d0hSMnhJTnI0RnRZTFcr?=
 =?utf-8?B?YXR0aWhrWWl5RXlQdnpjYmovZ3BjQVBOSVhHcS8yVmR0ZHNuS0t1UTEvL3o4?=
 =?utf-8?B?cVdwOTBTZFFYT2hwSDBHTG91RDZxSmtwcS9mMUYxdkE3OGRKWG10V1hES2JC?=
 =?utf-8?B?ZTBKbXRoUUlFMWpPR0doS3dmMWs5L1FKdzBrQndvOGhrYmxzbkdwKzEwNndZ?=
 =?utf-8?B?ODJIcUN0QUg2VElZZjNHa0xGTHNONlNCOEpabEU1d1ViM2QrOVhiQnVtL0ls?=
 =?utf-8?B?dDE2aXdvdFdYR09tTlhTNjlsY0xvdnNJcUpmQ1h6TDc3U3FqUWNXTDlkZFR0?=
 =?utf-8?B?ell0U2d1QnJFVjRJVDVSSDFxMWF5OTNXU3pBMnN3a2REc1RFVE5qK1ROL1Nl?=
 =?utf-8?B?NnFtanpKVjJnZEh0ZTZPeHZZc3hCVFRUVUw4RUZhYUdUSS9XSFVYdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83700f1-1dc6-4a94-c21f-08da224566c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:30.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzJ1pqeTC7Db45UlvZbJYzMkQ7yqEoSwF0ZFX+D1DzvUpwseYkgwY95wnyCCvvyP9OZRI7ywy7SdMyNNFHiVyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=827 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: otvynC0POfiXzWot2HzkUL7tMLNkBKKK
X-Proofpoint-GUID: otvynC0POfiXzWot2HzkUL7tMLNkBKKK
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v8 of the server side changes to enable vfio-user in QEMU.

Thank you very much for reviewing the last revision of this series!

We've made the following changes in this revision:

[PATCH v8 06/17] vfio-user: build library
  - updated libvfio-user to the latest

[PATCH v8 07/17] vfio-user: define vfio-user-server object
  - changed auto_shutdown to a per-instance property than
    a per-class property

[PATCH v8 12/17] vfio-user: IOMMU support for remote device
  - lock mutex while looking up hash table
  - removed global hash table - added RemoteIommu object to
    house this variable
  - added unplug handler to remove per-device IOMMU entry
    when a PCIDevice is unplugged

[PATCH v8 14/17] vfio-user: handle PCI BAR accesses
  - refactored vfu_object_bar_rw()
  - vfu_object_bar_rw() handles short sections returned by
    memory_region_find()

[PATCH v8 15/17] vfio-user: handle device interrupts
  - removed callbacks for msi_notify() and msix_notify()
  - added callbacks for msi_send_message() and
    msi(x)_get_message() operations

Thank you!

Jagannathan Raman (17):
  tests/avocado: Specify target VM argument to helper routines
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  configure: require cmake 3.19 or newer
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device
  vfio-user: avocado tests for vfio-user

 configure                                  |  36 +-
 meson.build                                |  44 +-
 qapi/misc.json                             |  23 +
 qapi/qom.json                              |  20 +-
 include/exec/memory.h                      |   3 +
 include/hw/pci/pci.h                       |  13 +
 include/hw/qdev-core.h                     |  29 +
 include/hw/remote/iommu.h                  |  40 +
 include/hw/remote/machine.h                |   4 +
 include/hw/remote/vfio-user-obj.h          |   6 +
 hw/core/qdev.c                             |  24 +
 hw/pci/msi.c                               |  16 +-
 hw/pci/msix.c                              |  10 +-
 hw/pci/pci.c                               |  13 +
 hw/remote/iommu.c                          | 114 +++
 hw/remote/machine.c                        |  88 +-
 hw/remote/vfio-user-obj.c                  | 891 +++++++++++++++++++++
 softmmu/physmem.c                          |   4 +-
 softmmu/qdev-monitor.c                     |   4 +
 stubs/vfio-user-obj.c                      |   6 +
 tests/qtest/fuzz/generic_fuzz.c            |   9 +-
 .gitlab-ci.d/buildtest.yml                 |   2 +
 .gitmodules                                |   3 +
 Kconfig.host                               |   4 +
 MAINTAINERS                                |   6 +
 hw/remote/Kconfig                          |   4 +
 hw/remote/meson.build                      |   4 +
 hw/remote/trace-events                     |  11 +
 meson_options.txt                          |   3 +
 stubs/meson.build                          |   1 +
 subprojects/libvfio-user                   |   1 +
 tests/avocado/avocado_qemu/__init__.py     |  14 +-
 tests/avocado/vfio-user.py                 | 164 ++++
 tests/docker/dockerfiles/centos8.docker    |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 35 files changed, 1594 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


