Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0048BC3E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:14:33 +0100 (CET)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SDf-0006U6-RD
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdb-0000j8-Mc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdX-0005g6-9l
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMTaJb005856
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=bZM6vjf8i+FUvi61G0ohVApA1qERoND/WGnUGA4yg/E=;
 b=PUBJsLsLry2xGcaFJK8v4MRFHLuOWBGUuESqR5lPHsT6kWmgOEhp69LoClJtPoa+Ym4s
 nG4XPfaKlieE+C55o7B/tyWwalhv6eMca9J2aLnD5P4OO3b+b9kZ/FWIYMpXYJdjo5GI
 tu3/V9IDkXGsRyTHJKN6gMhbzssh9mUtc98dCuPlY+KHms5CQdQPNvmE2ses/Rzt3CuX
 MLFcGxRB7iLDL7M5e/kWPcfRJIwBYFOliYKf+zlYjIzeYXqKmgfYeFbpd3VYP/uBYI+9
 b35O/Sa3wprDLv9auDDBYax2e85zvLEgXMVAzs28+pLikrQz1y59cPph5zunsH3Ekan6 vQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBC196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS1/sGhIo3Hm8lgT9LE3SxL8ZalJSXMM4GzirHE+czWcQvmPFZFUuzmRueFFlff8Z86KxVdi29sbeYxaj9u8GJnPTdJAk8dXQNpS8VAiVbgHtt6ZzsGwSgQTnsyshdeYmS2HxMUbLk7raMeed5tlVk3JUlUrRM/KkxGUrYLE3gCV9QCfZVruAvSiV4vcxygm2BV04uh7N8mW3CLeSrVT9Ppo7RCvbvfd34WBl085bWcTk0v4qK5Y2fkPtz0Lzr83jBYJrKsA7I/N7oXDdZuqjvsiwzWdGWVLSFjjj1MNB52PB3HUpsPrcEz/ID2Zo6doNIAfHPRSIMkayjj2RisXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZM6vjf8i+FUvi61G0ohVApA1qERoND/WGnUGA4yg/E=;
 b=i5BP9PFNw2N9epSLkfFIbDE5ukF0iNOwYVm19LmG3inYkzlclDviF7GDjuAAYZRKbbUqLXqIeznHtnT8klpyNBCB4jZvmqprqMxWSPVfA66TTCTwbkTVsAEMUgYpmG0+Ps+jcDa78kX2k5JqcfWjIcfZrF04IA7+Sknjj1KFJIFAmg+WL8GBIdYaiNBpauGW/m2MyofjdqkmqbBTyafBDWQsIgIN6OmMG8hA6Ojx3kdmsi9Nmt/uozR1d99Zhr+ZQ5A33prU+zmljpxXVfzYW17U3JwcGpCCvlFB1YmJylBMafm8y/gHIckzHFLdclaQNaTMjjjFK2b1VODn158vEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZM6vjf8i+FUvi61G0ohVApA1qERoND/WGnUGA4yg/E=;
 b=l03P2QxMW2sJ5mTQkjry+U1stiZ3DlZM4WcODzgM4l2QuWOBGQ4HZEB+YH34zbCDEAhN3vRL5evtxj6sMbqG1SdE7DRjVDUT4+XxXdYz4CAQjMKRl0OZ+x28rh5gjLy3316ilBJ5owPk7GoOR/zTMnFkGomRFg8bsLn/FtqtYKQ=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:05 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:05 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 08/21] vfio-user: define socket receive functions
Date: Tue, 11 Jan 2022 16:43:44 -0800
Message-Id: <a89cfd3195740dfb313d1947c0c7de583e4d0f46.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68dadb37-1048-445e-ca94-08d9d563a871
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742ADD22CAD427A86360C5AB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HFAZZRw+4FJw8a2f9W1qzsHKeQklj027x8GUuFL+zJU2oygPE58jREo3AfVy0N+QoBxuvfulQGJjBM8F36LJko5o+H2LunJ8sEBGP2VlwUJTEd/HJoH4j2A7EH5q5GVXsWKVOsHNNV2m/PaxbHGdNtUAMQk3zNNe8lfGl/EGCvaTSl+Hk/v2Tr5t+h4Bdmhho3wJI9p5pk5GEiCg0DTxGPDXHVj1WW7heZy0s5CzarGWG7w/DH3Sx6WeAyxCNi//7/c7KjtqLiDPhjwLFPBjx8OJviCUYeYMImGyB3GhhFqrkL60bOgJ3/RYfpNxmnsLmiT1rFDDsxkoqpeN+bfEJLVH9WzBBgtpMIA4ClPfpVm5O+ArlnrBP5CBHm+SV0Gs9UFmmNoq7y3Y+2Uwz276jr8t0EE9C3PsmjwbErpMzcKIa+rZKRW4Ot6rSbaeQwcvx0eR7R3Fm/cUwk0/vrzHJV7Ii8dX6bsbU4zRlRg4XcOTHwJdhzaG/yurJadEARj9SPMUKKvuQdKoVtLVp7U6S129ZU4KmRXrdP2ZSZ7EkR7yfumu/OiH4SWLDzU1K67f6k8d+71liuAYJvr1mraRFGTxuMG65B8Hiklcgq5cvA3wbuDTWdnIrrpGqU8YTsFjwP86a+IIvX9suQFWTx5akSBN50pivludKOQm40stf3NvC2eYpE3msPG29X5Cimnn49Ye06WO3I33sysB6QpFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(30864003)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlScEFFT0FzcnViY1J6MzdrWXA3REhiVXlZQmJqNDgwSW5nR3pFSjRsMHFq?=
 =?utf-8?B?NFR2NGxVaURlekZ4QWhocm9ObEJXYTY2bVg2WWhTMVR5emlvbDc5S0NBK0N4?=
 =?utf-8?B?TGc4a2dtdWtTZktyTG5lZDRJdDhtVjNhM0ZnVlR6dnMxVUF1dHd6SC9aS2U5?=
 =?utf-8?B?TGU2czR2ZUhabGtXdXk4bm9oWUhDN1ljdDQzc1FPS1VRd1h0eW41YU1JSlBa?=
 =?utf-8?B?UmpwVFBFK2swd0ZEVmhCNndzYnRCM3IxR3lOMzNkeG13b1QrdTJYTnNWRlg0?=
 =?utf-8?B?S2hIc2NLR3pMMStxSklQdnpyQWdtaXhFVGp1U1VzaVlySWMra1dWQlhTV0dz?=
 =?utf-8?B?ZnVSRnFkL1JhZzJGZHpuRHNaME9lYnYzNWpHRitrbUdxOXBUZTBQUVdodHJ4?=
 =?utf-8?B?L0tqWm14K0NnUHJ5em1UNlo1SisxQXFKbFNlam5FSFFsZThmTkhzQ3djUTJK?=
 =?utf-8?B?c2ZBenA0Rmo2NkYxZ2JOTkhEWjlodWhabE1NeG90OHRPMVJhRmpQWUp3VnJm?=
 =?utf-8?B?OUJUQzU4Q0NzTjJSR3F6c0VqYlNIWXB6QzdwM2p3UnVVZGNJUDZ4b00wVitZ?=
 =?utf-8?B?SkE4ODc3bzBCVUlnaTQ4d2NyK3hWZExRMWt3eDdHakpFZmwxTUhGK1RGUXZs?=
 =?utf-8?B?UEtqaDhUaVZZT1pCYXkzNlE0RlUrTUJtNWU0djFHNVhPb2VZOElBVXNwK2lQ?=
 =?utf-8?B?VitMbE5Ud2J4djBVelIvS3g0MUdQRWowNmYrOU5DZVBjTXNsQlFLR0M1MjRK?=
 =?utf-8?B?STNMcVl4dFVVZ1RwMWpJZVMyOFovb0dpTTBlMWVNclAyWXRlc2NpMVpoa3B5?=
 =?utf-8?B?Q3J0c2pRb2tsV1Mvd1ZiNnBVSHVVcEZIMnBiT2ZMNU5oUXkzdG4wZXRSM1NX?=
 =?utf-8?B?bFl2VldseklxRTRyc3dyWFFERGI4R2RUTUVWWjdLOW45ZlBpWWRuWTF6cGRC?=
 =?utf-8?B?cWd0NTlnSXpEMGpqZEhFY1dTVjhuaEQ0RVRmaXFDSWYxMmljZ2RtOXdLalp6?=
 =?utf-8?B?cVZzZ0F1ZnFsR2tIdmtPbkhrcUowQjlENWN1NkFGZGdHUHh5bjBZRGVqYTdN?=
 =?utf-8?B?eTdZdnZCUXRBQlZHdk5YTndFVXNnQkw3WktvZmhOQ01vSEN0SFVUbFVYdmZ6?=
 =?utf-8?B?T3FSVW90dnJFRGdLbFNwM3dQN3NJbnd3RE8vd0hmR2tWSW5uQk5CZFJPc0tN?=
 =?utf-8?B?RUJqcUpDcUdqaWRBd2lPYWNGMXdSRVZLYWJTdzlzNElGZW8wcDNza2NKUFRJ?=
 =?utf-8?B?dmVnelg0VGtzeDNJdjNmSUlweEo0OE9NUklWRjBXakVnZ05FcTV0b3c2cGZN?=
 =?utf-8?B?V2dST2MwbjdyVzRhTkpEZ0p5ZDRodktGaUFPUEJiM3RJN3JJZDNxcFZYT01i?=
 =?utf-8?B?NDF4Si92eTNZcUlVNmlpMFRoQW51V0QwbXUrV2ROSWRvcXIyZXhMakdpZUYw?=
 =?utf-8?B?MTJrYnovV1VDMnQzbWhYNmpZQS8xc1dNeitWRSt4U1FBVU41dGtPVVp1VjM2?=
 =?utf-8?B?ZkZvYmZiUVlYR2xSRU51cmxEaXFDVlZaY1R1eWRiMEdlQTJwdElXYW83ZWY1?=
 =?utf-8?B?bHY1SjNuOUlzeVBhV2I4WUd3N3FJdzdLTGEwNVNUMHBkY1V2Lyt0ZGpxbWx0?=
 =?utf-8?B?V2tNMC9pOHdwa040cDNNQjM1RElDTWNjc3F5WUlhVGVkNzJoSFk0YXBEZDla?=
 =?utf-8?B?TTFPOHVuRUZYankxWEdFWmpUWWJrbkFxNmY0TnVnYy9HUmZVTnI4WWZLSExv?=
 =?utf-8?B?R3dmZzlzaFk5U3F4SGZwc1FyZ1dlc3BjcmdvcStXZFZ6ZnplQWwyWGlJZERh?=
 =?utf-8?B?Ylprd0xsN0FCZDhvdUc1Rjg2WFdnRDR1NTFhWnpCeFZuZ0tXMVp2aENiL0xn?=
 =?utf-8?B?Q3EvZ0pWWDVqRG5wdWk1L1FEOWJzZDQ1V3F4WmR1MjVoZlZHNkJSdGVrRU03?=
 =?utf-8?B?blZIUm1qb1BZaHUwbHZHQUV1N0hpWm9EU282NkdRd1Z6MC93Z0xNbmJSRjdB?=
 =?utf-8?B?TGxUVVpxQUNvNGs0NjlLU3JBV0ZONDVjZjdnU29PSzJWYitnZjNnNjBOcld5?=
 =?utf-8?B?YWlPNnRXUldOdmFXb09ESnZsbGZqazlwRVl6RzhxRlV1eDRDVGxFM0NydSs1?=
 =?utf-8?B?a3d1bEZGOXByY0dKUjZsckpGalRwZ3VhYzBXbjF6QlAwMGdzZmR6YWl5V1Jh?=
 =?utf-8?B?VVF4Ymk1MEFrbGZQdmI4UlR0Z3dBaTFkRFJNVUU0TkhaWUU4MzM3cENiUGRo?=
 =?utf-8?B?eFRBeHhTQzdLZEV5SE15MUIxaVhnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dadb37-1048-445e-ca94-08d9d563a871
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:05.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5bfcNAJNA+KhTw+yExHaL0xqkmX8kEFnqHmhQG5w4ezugH7CnGonvfBJickrqTVP0gfQonlhTfBOLRxB9TLalsyM0jpx0AuUnT0n+HNh2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: QsoDDXrLTXIN1LEhjWm_AEj0cvQi2OKr
X-Proofpoint-ORIG-GUID: QsoDDXrLTXIN1LEhjWm_AEj0cvQi2OKr
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Add infrastructure needed to receive incoming messages

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  54 ++++++++
 hw/vfio/user.h          |   6 +
 hw/vfio/pci.c           |   6 +
 hw/vfio/user.c          | 327 ++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 5 files changed, 394 insertions(+)
 create mode 100644 hw/vfio/user-protocol.h

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
new file mode 100644
index 0000000..d23877c
--- /dev/null
+++ b/hw/vfio/user-protocol.h
@@ -0,0 +1,54 @@
+#ifndef VFIO_USER_PROTOCOL_H
+#define VFIO_USER_PROTOCOL_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Each message has a standard header that describes the command
+ * being sent, which is almost always a VFIO ioctl().
+ *
+ * The header may be followed by command-specific data, such as the
+ * region and offset info for read and write commands.
+ */
+
+typedef struct {
+    uint16_t id;
+    uint16_t command;
+    uint32_t size;
+    uint32_t flags;
+    uint32_t error_reply;
+} VFIOUserHdr;
+
+/* VFIOUserHdr commands */
+enum vfio_user_command {
+    VFIO_USER_VERSION                   = 1,
+    VFIO_USER_DMA_MAP                   = 2,
+    VFIO_USER_DMA_UNMAP                 = 3,
+    VFIO_USER_DEVICE_GET_INFO           = 4,
+    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
+    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
+    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
+    VFIO_USER_DEVICE_SET_IRQS           = 8,
+    VFIO_USER_REGION_READ               = 9,
+    VFIO_USER_REGION_WRITE              = 10,
+    VFIO_USER_DMA_READ                  = 11,
+    VFIO_USER_DMA_WRITE                 = 12,
+    VFIO_USER_DEVICE_RESET              = 13,
+    VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_MAX,
+};
+
+/* VFIOUserHdr flags */
+#define VFIO_USER_REQUEST       0x0
+#define VFIO_USER_REPLY         0x1
+#define VFIO_USER_TYPE          0xF
+
+#define VFIO_USER_NO_REPLY      0x10
+#define VFIO_USER_ERROR         0x20
+
+#endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index da92862..72eefa7 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -11,6 +11,8 @@
  *
  */
 
+#include "user-protocol.h"
+
 typedef struct {
     int send_fds;
     int recv_fds;
@@ -27,6 +29,7 @@ enum msg_type {
 
 typedef struct VFIOUserMsg {
     QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserHdr *hdr;
     VFIOUserFDs *fds;
     uint32_t rsize;
     uint32_t id;
@@ -74,5 +77,8 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *reqarg);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 9fd7c07..0de915d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3386,6 +3386,11 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
+static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
+{
+
+}
+
 /*
  * Emulated devices don't use host hot reset
  */
@@ -3432,6 +3437,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+    vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index c843f90..e1dfd5d 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -25,10 +25,26 @@
 #include "sysemu/iothread.h"
 #include "user.h"
 
+static uint64_t max_xfer_size;
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds);
+static VFIOUserFDs *vfio_user_getfds(int numfds);
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
 
+static void vfio_user_recv(void *opaque);
+static int vfio_user_recv_one(VFIOProxy *proxy);
+static void vfio_user_cb(void *opaque);
+
+static void vfio_user_request(void *opaque);
+
+static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
+{
+    hdr->flags |= VFIO_USER_ERROR;
+    hdr->error_reply = err;
+}
 
 /*
  * Functions called by main, CPU, or iothread threads
@@ -40,10 +56,261 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
     qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
 }
 
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+
+    msg = QTAILQ_FIRST(&proxy->free);
+    if (msg != NULL) {
+        QTAILQ_REMOVE(&proxy->free, msg, next);
+    } else {
+        msg = g_malloc0(sizeof(*msg));
+        qemu_cond_init(&msg->cv);
+    }
+
+    msg->hdr = hdr;
+    msg->fds = fds;
+    return msg;
+}
+
+/*
+ * Recycle a message list entry to the free list.
+ */
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    if (msg->type == VFIO_MSG_NONE) {
+        error_printf("vfio_user_recycle - freeing free msg\n");
+        return;
+    }
+
+    /* free msg buffer if no one is waiting to consume the reply */
+    if (msg->type == VFIO_MSG_NOWAIT || msg->type == VFIO_MSG_ASYNC) {
+        g_free(msg->hdr);
+        if (msg->fds != NULL) {
+            g_free(msg->fds);
+        }
+    }
+
+    msg->type = VFIO_MSG_NONE;
+    msg->hdr = NULL;
+    msg->fds = NULL;
+    msg->complete = false;
+    QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
+}
+
+static VFIOUserFDs *vfio_user_getfds(int numfds)
+{
+    VFIOUserFDs *fds = g_malloc0(sizeof(*fds) + (numfds * sizeof(int)));
+
+    fds->fds = (int *)((char *)fds + sizeof(*fds));
+
+    return fds;
+}
+
 /*
  * Functions only called by iothread
  */
 
+static void vfio_user_recv(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        while (vfio_user_recv_one(proxy) == 0) {
+            ;
+        }
+    }
+}
+
+/*
+ * Receive and process one incoming message.
+ *
+ * For replies, find matching outgoing request and wake any waiters.
+ * For requests, queue in incoming list and run request BH.
+ */
+static int vfio_user_recv_one(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg = NULL;
+    g_autofree int *fdp = NULL;
+    VFIOUserFDs *reqfds;
+    VFIOUserHdr hdr;
+    struct iovec iov = {
+        .iov_base = &hdr,
+        .iov_len = sizeof(hdr),
+    };
+    bool isreply = false;
+    int i, ret;
+    size_t msgleft, numfds = 0;
+    char *data = NULL;
+    char *buf = NULL;
+    Error *local_err = NULL;
+
+    /*
+     * Read header
+     */
+    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
+                                 &local_err);
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        return ret;
+    }
+    if (ret <= 0) {
+        /* read error or other side closed connection */
+        if (ret == 0) {
+            error_setg(&local_err, "vfio_user_recv server closed socket");
+        } else {
+            error_prepend(&local_err, "vfio_user_recv");
+        }
+        goto fatal;
+    }
+    if (ret < sizeof(msg)) {
+        error_setg(&local_err, "vfio_user_recv short read of header");
+        goto fatal;
+    }
+
+    /*
+     * Validate header
+     */
+    if (hdr.size < sizeof(VFIOUserHdr)) {
+        error_setg(&local_err, "vfio_user_recv bad header size");
+        goto fatal;
+    }
+    switch (hdr.flags & VFIO_USER_TYPE) {
+    case VFIO_USER_REQUEST:
+        isreply = false;
+        break;
+    case VFIO_USER_REPLY:
+        isreply = true;
+        break;
+    default:
+        error_setg(&local_err, "vfio_user_recv unknown message type");
+        goto fatal;
+    }
+
+    /*
+     * For replies, find the matching pending request.
+     * For requests, reap incoming FDs.
+     */
+    if (isreply) {
+        QTAILQ_FOREACH(msg, &proxy->pending, next) {
+            if (hdr.id == msg->id) {
+                break;
+            }
+        }
+        if (msg == NULL) {
+            error_setg(&local_err, "vfio_user_recv unexpected reply");
+            goto err;
+        }
+        QTAILQ_REMOVE(&proxy->pending, msg, next);
+
+        /*
+         * Process any received FDs
+         */
+        if (numfds != 0) {
+            if (msg->fds == NULL || msg->fds->recv_fds < numfds) {
+                error_setg(&local_err, "vfio_user_recv unexpected FDs");
+                goto err;
+            }
+            msg->fds->recv_fds = numfds;
+            memcpy(msg->fds->fds, fdp, numfds * sizeof(int));
+        }
+    } else {
+        if (numfds != 0) {
+            reqfds = vfio_user_getfds(numfds);
+            memcpy(reqfds->fds, fdp, numfds * sizeof(int));
+        } else {
+            reqfds = NULL;
+        }
+    }
+
+    /*
+     * Put the whole message into a single buffer.
+     */
+    if (isreply) {
+        if (hdr.size > msg->rsize) {
+            error_setg(&local_err,
+                       "vfio_user_recv reply larger than recv buffer");
+            goto err;
+        }
+        *msg->hdr = hdr;
+        data = (char *)msg->hdr + sizeof(hdr);
+    } else {
+        if (hdr.size > max_xfer_size) {
+            error_setg(&local_err, "vfio_user_recv request larger than max");
+            goto err;
+        }
+        buf = g_malloc0(hdr.size);
+        memcpy(buf, &hdr, sizeof(hdr));
+        data = buf + sizeof(hdr);
+        msg = vfio_user_getmsg(proxy, (VFIOUserHdr *)buf, reqfds);
+        msg->type = VFIO_MSG_REQ;
+    }
+
+    msgleft = hdr.size - sizeof(hdr);
+    while (msgleft > 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
+
+        /* error or would block */
+        if (ret < 0) {
+            goto fatal;
+        }
+
+        msgleft -= ret;
+        data += ret;
+    }
+
+    /*
+     * Replies signal a waiter, if none just check for errors
+     * and free the message buffer.
+     *
+     * Requests get queued for the BH.
+     */
+    if (isreply) {
+        msg->complete = true;
+        if (msg->type == VFIO_MSG_WAIT) {
+            qemu_cond_signal(&msg->cv);
+        } else {
+            if (hdr.flags & VFIO_USER_ERROR) {
+                error_printf("vfio_user_rcv error reply on async request ");
+                error_printf("command %x error %s\n", hdr.command,
+                             strerror(hdr.error_reply));
+            }
+            /* youngest nowait msg has been ack'd */
+            if (proxy->last_nowait == msg) {
+                proxy->last_nowait = NULL;
+            }
+            vfio_user_recycle(proxy, msg);
+        }
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->incoming, msg, next);
+        qemu_bh_schedule(proxy->req_bh);
+    }
+    return 0;
+
+    /*
+     * fatal means the other side closed or we don't trust the stream
+     * err means this message is corrupt
+     */
+fatal:
+    vfio_user_shutdown(proxy);
+    proxy->state = VFIO_PROXY_ERROR;
+
+err:
+    for (i = 0; i < numfds; i++) {
+        close(fdp[i]);
+    }
+    if (isreply && msg != NULL) {
+        /* force an error to keep sending thread from hanging */
+        vfio_user_set_error(msg->hdr, EINVAL);
+        msg->complete = true;
+        qemu_cond_signal(&msg->cv);
+    }
+    error_report_err(local_err);
+    return -1;
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -59,6 +326,51 @@ static void vfio_user_cb(void *opaque)
  * Functions called by main or CPU threads
  */
 
+/*
+ * Process incoming requests.
+ *
+ * The bus-specific callback has the form:
+ *    request(opaque, msg)
+ * where 'opaque' was specified in vfio_user_set_handler
+ * and 'msg' is the inbound message.
+ *
+ * The callback is responsible for disposing of the message buffer,
+ * usually by re-using it when calling vfio_send_reply or vfio_send_error,
+ * both of which free their message buffer when the reply is sent.
+ *
+ * If the callback uses a new buffer, it needs to free the old one.
+ */
+static void vfio_user_request(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+    VFIOUserMsgQ new, free;
+    VFIOUserMsg *msg, *m1;
+
+    /* reap all incoming */
+    QTAILQ_INIT(&new);
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        QTAILQ_FOREACH_SAFE(msg, &proxy->incoming, next, m1) {
+            QTAILQ_REMOVE(&proxy->pending, msg, next);
+            QTAILQ_INSERT_TAIL(&new, msg, next);
+        }
+    }
+
+    /* process list */
+    QTAILQ_INIT(&free);
+    QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
+        QTAILQ_REMOVE(&new, msg, next);
+        proxy->request(proxy->req_arg, msg);
+        QTAILQ_INSERT_HEAD(&free, msg, next);
+    }
+
+    /* free list */
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        QTAILQ_FOREACH_SAFE(msg, &free, next, m1) {
+            vfio_user_recycle(proxy, msg);
+        }
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -97,6 +409,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     }
 
     proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+    proxy->req_bh = qemu_bh_new(vfio_user_request, proxy);
 
     QTAILQ_INIT(&proxy->outgoing);
     QTAILQ_INIT(&proxy->incoming);
@@ -107,6 +420,18 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     return proxy;
 }
 
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *req_arg)
+{
+    VFIOProxy *proxy = vbasedev->proxy;
+
+    proxy->request = handler;
+    proxy->req_arg = req_arg;
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                   vfio_user_recv, NULL, proxy);
+}
+
 void vfio_user_disconnect(VFIOProxy *proxy)
 {
     VFIOUserMsg *r1, *r2;
@@ -122,6 +447,8 @@ void vfio_user_disconnect(VFIOProxy *proxy)
     }
     object_unref(OBJECT(proxy->ioc));
     proxy->ioc = NULL;
+    qemu_bh_delete(proxy->req_bh);
+    proxy->req_bh = NULL;
 
     proxy->state = VFIO_PROXY_CLOSING;
     QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
diff --git a/MAINTAINERS b/MAINTAINERS
index cfaccbf..bc0ba88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,6 +1909,7 @@ S: Supported
 F: docs/devel/vfio-user.rst
 F: hw/vfio/user.c
 F: hw/vfio/user.h
+F: hw/vfio/user-protocol.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
1.8.3.1


