Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E184EBB06
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:47:42 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZS7J-0000Q6-4b
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:47:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtm-0007at-Uv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRti-0005NN-G1
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:41 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U3L5Lv013073; 
 Wed, 30 Mar 2022 06:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=D3wScsUPtHx1Nkvc8GMOmB3eklPaOR+YFXHFiKzuiJs=;
 b=b0l3tW0uePau64F4ZW4YZBHnpFkhRb9hRrVU4rJ6UJu4RR5wIBnJNu7h/GYiA1vtntEU
 Yfw6UC/Vvk8cxUXdwuu0SxF7LKrST5ObnJ+0IAZY6nNMKv9+YJIpbm8gS4oNY+gAXFRZ
 HzGAtXOBOQs5xX9rRGMYckQPQ6+nXISOe6akrpC4vyyPUiAq4kV20aufMzxqX+p+5vrF
 OktSqAuPBEO7Lgw416OQ/pnpDvKfIi8m0cjPDfZOm0tQI4qCRMnMwN+LpR9ZQ+Z4OGfd
 L8Fm2rEzex+A41DrSTQuqDLcBTWZChMyC4szZBzOMaiLMoXFcSGQo/vwwpnDGcqI/XOi IA== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb8e8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6IT3n114576;
 Wed, 30 Mar 2022 06:33:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3030.oracle.com with ESMTP id 3f1rv8egk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWbJZi0ScZnZn6BVKsuwGIAwoI0uuW9gZU5oxipOsIWA7tFfwPh9iXCBMkw9kJTZdRGWp6oIHkXpel4OhUKhvDP8OVgSTU5Nv5c0BdaJzG3U26SxuVxXaZzGC/x3vhS7xPAdAJrG2KYjYWptJAE/fBnhza16yXG0HYOB4oj0v//KkwY56xkP+44znd2tkDQYvV94WDZ9CWXfFJKy0S4iOH2SBe4bnSxBdedREFDBTL2FBP5sUxbHhDmCn/gaYsM87Mii5A+EP45n+HB//7OVAyVdtuOCewEqZGRyE5p2EWx1JNph2MDJ/wddHRfxRHVal6/NFhMi7Kv2SDKPPF7x8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3wScsUPtHx1Nkvc8GMOmB3eklPaOR+YFXHFiKzuiJs=;
 b=EdKianlZNIyiH0wILOokEt+QkylQOCwWM7QQloAL1B/H47yZh3ButWFe62DLIIRsuQTVvggkuA9qxmlbbYWB44I4wEaP86/zKS+0TlKzyE/r2fxMMnJoWBUsaPM5MDjbVdEVia75MFqgwo0dFa8UBrNPeoTNir9YZII7bWeA6qPkSXEypDPwymkh2zMDQT00REGltIbVOTlErHqQ5hkR6wvCKhsNoANBOmyUZtr7jHhW1gf7autNrbdi3VgQkwF5Fge1/wOo0g/YqxSO57wEoWiFE8G9a3abyk81AUhJ4Sjy52ka+atIRvkGkfQHrmJVjGVuK2yC/8VtCHVuaG99pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3wScsUPtHx1Nkvc8GMOmB3eklPaOR+YFXHFiKzuiJs=;
 b=zmbJrON1bhkR30WKgHeuQj7F7ZdipP0m1SpZRovsF66wcXtTB7igVHwHWw+TvUdWYGwcqeDr8a03Z5FMF/eIqItNkHkQ83I+H2FSbeBntos2vZq/4czFf5sdM9G/oRkwnMCzuV45LnrlTq9PEoHvQ/sj6z82pwxIfdV/Q0xlkKU=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:31 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:30 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] virtio-net: Fix indentation
Date: Tue, 29 Mar 2022 23:33:12 -0700
Message-Id: <1648621997-22416-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2a6a33-3acd-41c9-8e33-08da121734ab
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3130FA8B2C7E0C12BE90EFCEB11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2tBZch4xGYqBXsiJr/2mW6dWPnRgcTbqVcnBttNc8y2uA3xwY2N4mpWAQl/vmSlJRKqzrUnDboqRw/rhhbL7vACHXKWuuHMvtA+oHbc54WWQkvdV0nfw6ZNMFU+8DCmcw3bbBxOwypcUX1DQ4Lv0ruHj2z1qoFcOI9jT229ajb3syewNvTQJ0l3fMLxgFdo/t+M3QgfUyR0CwmEoYjxF8q2wzIC/zaU6gufGkSrNkNTsBpA5YV/z4jBEvlLQd43Ni1CUsgwUHqBsKLSRsTfagkwNfM2XLcCqsWk2TU4WXkXEF7rKFby6Thl9wSSxBAdU3TnFJOR1nzSGaXnUCmDJW3iw57fIyRwuEFL6F3xbhkCRTbfaCOu8mcOTWgBPxdGx6qP5pKsR2Dv0CdcqTsbvWZGPxASd1VOJEOetydcVd5BHvHtW7RmMHu0ZZXchKMkEe4m8YANK5EhL9oEmMO0Dh8xCZbmQfnpV+qhwxPgXPKGSSwYCHwYNwaBU0NcTiZv27XgFVNRm3mpASSFzsi5LL0eoV7S2R0f9HYFymML4h41VyzDC2ne4d7/7/fipsUwdRgXmrMPJhgKK0YdOVnGM/jh+k2GWPZl5bcSbeq/viLZLhYJGqBsJvmgQwWopkepsMH1iB65VlSKyix3MtZ3dAWmWp0xd/go8fGFipTFtyJLYM4Ovvymf+AvaQXYsWVb1IM/j88SqGP1F7qyB9sgeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(66574015)(86362001)(5660300002)(8936002)(83380400001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEovdVlQMjZaTjZvTGpGMmZuUkhjSjRwZnVNMjZUaVBGaUcycHlBY3ZveElu?=
 =?utf-8?B?SEUzeFZqODl0blFDM2hCRzVhaEVXU1VNTkNFSzQzMjVwNW9Ta0phcWVNT3ZR?=
 =?utf-8?B?WjZFNVRHdXRuWVgwdEI0N2pqbmYremZHdmZNYWhYcjUxR05kQ0cxVWI1TjQ2?=
 =?utf-8?B?eENRaDNFdWhReGtJZjhtNnlZdmJaK21uZnFoajA3c3A0cFN5K0N6NEJpNE52?=
 =?utf-8?B?ekwvL1dPR3YzdHFmUGZQUmJ3YXhkczBobUVYbHNhdjJBd1Q1bDBYdHJYbjdj?=
 =?utf-8?B?TVZ6SldYMnpDaDRYVEVXREdzdElJLzd1QUUvOUJ1eGlJVVVRTlo5YlVDMXFa?=
 =?utf-8?B?L0UrSDZwVFBzYXRDMEVrajU4VEFHT01leDhtKzhTRGJRUlZrbWltRjNPcXc3?=
 =?utf-8?B?Qk9iOEdrcGVUdGxRakNwaU1NdStaaWhVQXd5L0hySkk0VzZTblJxUUhMeE9O?=
 =?utf-8?B?WS9UNlJjeU9lNHdXS1c4YnFXNWU1SjgraUNOQlU4YWRhdmJ0Y0U1QXp0S1pS?=
 =?utf-8?B?T2g1eW02QmQ3blFKSHZiRkw0TVg3SHNMdTcxK2hDWHJOSWhLVEN1aFBzajlS?=
 =?utf-8?B?M3g5UUdzZnJJR1lBODdqR1FlclZtNzZyRjg4YU9mYk5jT2NvZEMrd1FHL0Zl?=
 =?utf-8?B?eVAyNndIWXVINUZqRGV6dkEvZytJYklrWjFIME5UL29vZytjdi9oNElrSjZ3?=
 =?utf-8?B?aHpXNnRiSy8rZG9XZEVFdnQ5L1cxcVJ6SjV1VklJRmVKUWNCckNWU2N3VFRu?=
 =?utf-8?B?NFBhSTRrTVlGTXFubllkdG5IN2VNQnBjMUNQdFlTb1BWeDZibHE2bGY1OC8y?=
 =?utf-8?B?Q1BXR2xTUktKU3RTRG5TSWZkWFoxWE9KYVp3Ty9ZMm9rS1VHZEVYamUzQXRB?=
 =?utf-8?B?NndUQk1EcGhCVlJoQStiTjBJMzNCRGdPLzU3NmJkaVoyR1dOSDFOS3ZOaXNr?=
 =?utf-8?B?ZFlhZDVPb3QwSm9YeS9aRHpzN2g5b01PcmpmdVdGVHJyd2tJYnUvZWRrMDEr?=
 =?utf-8?B?YTl4N3N6Wm4rQWZES3lJWjhnV0dsODJLeE9WUDRLMjQzV01yTForQ2NEd1Qz?=
 =?utf-8?B?ekJ6ekdnMWdIdFJRcURRWmVrc3FEYm9reDcyWVUzMGtCZm1lWDFneUlvREdz?=
 =?utf-8?B?UzhBV1FrNjBWb3FsMUZsUGppZDlkN1lpQnZVc2paTjlNNmhQQ3lEWENleXlr?=
 =?utf-8?B?bnJJUktJNkJRTkpMMEMxM3N3ajFlbTRZNENuWWdzdFBHTjRPMmU0cUR0YWpp?=
 =?utf-8?B?eDdMVTFZTHVyWFRuYXp3Nks5cCtlK0tUV2w3OHBtcmtjNDltZzdhMDZzNldy?=
 =?utf-8?B?ZjZUdUwxUTJoZnRHMkFwcEtXNUtHejZ3UkFpMlUyR0ZhMFhEU1c2cU9QTUpP?=
 =?utf-8?B?TkVXNXRuMVNCMWF5VG9iaGlycUwyRGxxa3g1QVRsRjRzcXhrMWxGNGF5bWds?=
 =?utf-8?B?aHBEZzh6ODRBdnNvWmR3ZG5tTkRuVWZwRHNSSUFPNFhMUkp1dXpsbW0wTm80?=
 =?utf-8?B?dTZza0tqWGVPOHZWNEpvMDRKZ0p4QWhZU3VqUjVORVMxOU1IRjhkZWcrSkVP?=
 =?utf-8?B?WnB2LzM1U1dsK3R2WDVxTHJVbzJZd3BEZHV1aURuN0pmTFFjK1UvRUc3bVRs?=
 =?utf-8?B?amZtZWNXUTZvbCtydURvaUNqNmh0ZjhhcHFiWXROUVVPZ3FYcjVSV2JFbWg3?=
 =?utf-8?B?ZnF5NEJ5ZzUzQStUOUlncnZIWlVSTUtFcTJLQ3UyTmtIODUvUkxXSHBMNjdz?=
 =?utf-8?B?K0Nodk9ZcFl0Zk4rMEV0Q3cxZldmSWUxVjFRb2dERGN1VDRkYkRGVTFabS9T?=
 =?utf-8?B?T1hRbTE5cEluSWxJVS95WVEyTi94bUsrY0ZtRFhDOHhwRFUxeGdLc1hHai9L?=
 =?utf-8?B?Yy9YTFdvY25Vd3hYM2QxS21xWGNacStlaE90OTVTLzkvSXVLMEtxQnVPOGU2?=
 =?utf-8?B?Z01LRlJaRFdoYlpBSlkzSTl2Zk11RXh6NzAyS0lQUURFSnlXdGFQOGpNMDRX?=
 =?utf-8?B?WnVyY2pCZ2dPcG5OSm1FZCtNa2dDSXhiOVpFb3Qwd3BWY2V6RzM2bENaQTZO?=
 =?utf-8?B?emlhajJtSTBiVFhQWlIrVFc3Y09KSG91K1plSTJ3Y3NBdUNJZDdwR3F3UE9Z?=
 =?utf-8?B?MWp4ckFkMjlXdGRjOXhRWDhQNnI2dzIyRDhvV29VNlVhRTlHV21iUjljM1RQ?=
 =?utf-8?B?a2dUNEQxY2RHUzkwclNtd0FKSE4vMFJ2QysyQ1QvcHpOc0FmbHdNSnRGM3hX?=
 =?utf-8?B?R2dudHZmbEozTkRTcEVjdW5DSlJnem9Pb3ViejI1amdyVWNnYXJzRnNBNnJr?=
 =?utf-8?B?ZXJFZVVGd2lEQnQ3MDVOWklnYnpEVDZGU3FVUW1nanBGVjZ1RTZTUXRPaERa?=
 =?utf-8?Q?AeCMN+fB0qbjM3W4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2a6a33-3acd-41c9-8e33-08da121734ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:30.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp4LS30+FUry9gRAoHeULbgoDemv1tRgjWA2t/7ou/3dIR3oNtvxmBuWxT3F+YYL1IPCmKKjaunZ1KJ8mLyj/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300030
X-Proofpoint-GUID: xkkF64dutdAVaHpjx1jFhVJ1i9Myjeju
X-Proofpoint-ORIG-GUID: xkkF64dutdAVaHpjx1jFhVJ1i9Myjeju
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 484b215..ffaf481 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3523,7 +3523,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc = qemu_get_queue(n->nic);
     nc->rxfilter_notify_enabled = 1;
 
-   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
         struct virtio_net_config netcfg = {};
         memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
         vhost_net_set_config(get_vhost_net(nc->peer),
-- 
1.8.3.1


