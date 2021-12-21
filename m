Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925C47BCFC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:37:46 +0100 (CET)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbab-0006T1-4O
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:37:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXs-0004x9-Ce
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXo-0002Ta-S6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:56 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BL8slwl022350; 
 Tue, 21 Dec 2021 09:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3eHPIzT/cXCSLa1M/eQK2C/iJ03RlOMSTVwm3foEiOM=;
 b=ZCUBNx/e4sBvQZI/VJSQ6NC2blDbdNHr+zW0EyhY/A1V5nHsee+HzueUSWdaMeq51g18
 pSauK9Vg/osna3cCYQcSf1MQnk0DY8QU7MuyTClwRjrzoPOrS64o02Z09VoEb9Qi6+LG
 h5jIUU3ditS3RA649Bs3OWL77zLdx2uLEtrS+1lLNrB1FXLyuM1McgtC+CUCe+O60HRn
 rKIN20BX8PUiGqyZEeIf09t/zTZ2abD2KpF7Od/PG/0GyLA/cvc4OFyEGjRCwHJnz858
 39QGFoe9ea6ur0DOndV+KEcyzvj2be4QwnBya8TiimwM3Kn/nya+2ErBcotYMG3kChXt TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2rkujmff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9GwJJ018916;
 Tue, 21 Dec 2021 09:34:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3030.oracle.com with ESMTP id 3d14rv7dgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkGzd/yb3EzPaKdGn3h0v0vUoGAeSKGA2cCH2rbuMeqahW1JePoQRtakSekqSWfzlxvqI1RKFz0CIVEfA5mQMNkmRxAv5dP1lkxql/XR3Kewd21N1R0P96Q6E8P8JCsNT8UBUGdVQe1emkdcO0B5iBe2fyLVazaJrNuG1mBDguGzjHDun40HdzbYx0OrcP93TZt2AQJ+yREWzZUzCjH3GRSqFe/PL1oiuXGObRSf6wTjstbxu0eZP6ObzB1qxPmL6zku/vVx8riXyTFklnufjNbE8RkxTJTjS56ChMvlddIWMk/imavpaeSeSeJDM93uG8QVXYpCuZYRRe7zmF3iRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eHPIzT/cXCSLa1M/eQK2C/iJ03RlOMSTVwm3foEiOM=;
 b=gFZx4aX0xU+92hhw2qMIrNp2VYiuzORW/MJlFMVAAQNWvZKfqPgYNSUIyfGxyHvAt+xFXHWwdiQ63cdX/P0K+NWJeAAL0xF7cUhy5MP82AydawVMGrkmvwaFbJpFDvo1FOsnt6UcwG3Q6th/f9JCAm1zbiMo3gSHFPJh4Jm4mK2KtJqN3LjmHjfNKzSLm4P0OSN9TAlACYMWf0Lpu4lpIjIhyGt1w0x+0boQWXqnCzkVxCu5Y6YjG9If/JwQbuL5eLj8G76CKY+3K/HVKIootR6v3sMd0bl4w11igQkJ/ECxHWGEgO/GYpe342TwHKjHb2v+AVH/hYm3YXYTjIvFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eHPIzT/cXCSLa1M/eQK2C/iJ03RlOMSTVwm3foEiOM=;
 b=r6POFsIsgqFynBSljA9MvMnbW8pmkmtyORRIehhnjWnBucgjwPlolRTQc0OYsvxQYsxApwIIASuCASMZ10iFp4BYZyZudXG3E6EkpZjjhxAwGALlG0r6yXCOVOFpiCf1fPCwHJLPnoWu05iAfVqzIFnjdtW1pLHX9hpeukKPhQU=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR1001MB2267.namprd10.prod.outlook.com (2603:10b6:4:2e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 09:34:48 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:34:48 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] migration: Introduce ram_transferred_add()
Date: Tue, 21 Dec 2021 09:34:40 +0000
Message-Id: <20211221093441.1445590-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211221093441.1445590-1-david.edmondson@oracle.com>
References: <20211221093441.1445590-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::26) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9b8b29-ef9b-451e-9164-08d9c465214e
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2267:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB22676568417206A836FA64C8887C9@DM5PR1001MB2267.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7nUNyQAqME0U69JQ2PqQ0Mv36o3EboRWnKuldT3cY1Oys/C5EhWE+gid5j5y633nW7a7TvJrEq/KMFwVvOz9aQMDlnF2Xw4/Z9GujAD5kJX+CxAz6dEAA10L4CN/s/TxazYMOSctlXFea5ZVQVO3RHujS0KRjiXQapAuK9xAbAp+ICbRlcp8J8J0eWwHLQtWm72wZ/058t/vgP7lug5qFM8XYBw4zTPMfg9AVrqpiN9jJDi7Y//G8L5OLLzT4UWyg6baMIJU4v9p9pDAJEaQzKR4WCkzIU6qucP54w1RON25RbbbkWSXvk4hgQOVqzr4/HN6nhBWMmHEpDRbH3GZXThK9ga2bEZU7JOzFO5chcXaeWRwO5xyI3Une9OLv4pE9SGhcVqwycyiYvNi9W//DzOPjdWY9teAj3o9bA8XGU17UMt8N8fDNuYYM9fhovtzHG+VCbYggI1kCMqU3wDpAN3DbsZkZvQJTl22+waM+MTy+jgn1a+0UHseCFv4hmSa4O8TYAUzIQHhk84Ao45q82emozeSpaQvcXPRhFPFMS5Imd4hqLQLLJA54rYCUhMaDLnxIC3V9VOxrVb35mwDCdyQVxJJfHkb2fIjFAgMf+P0UaeZ4ET2lySHv6Y5T4Ivg7vNW92WvzsRUWF8p9BLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(52116002)(1076003)(83380400001)(54906003)(6512007)(44832011)(186003)(5660300002)(6486002)(86362001)(38100700002)(36756003)(8936002)(508600001)(66556008)(2616005)(6666004)(6916009)(6506007)(2906002)(316002)(4326008)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Q0SDU2TVFiOFZRTzAyckxBdm9zc1d1RVo0ZVdvK25aaWNGQ0xhUzIya0xY?=
 =?utf-8?B?OXF6a2tvUk9QNzVlbTZEUC9leE83Q256QzI1bzlxVDI5SEtGa3NBeTZVT2h6?=
 =?utf-8?B?M3pqODBaK2xPbmJmYkhZWm9YV1JlUXozNFFiVGQ2M2VZZFA5SWk1dU92Mk9W?=
 =?utf-8?B?UEg1bFhtcnYxYmEwcllscVIwYlZiVEFML1AxMUpnQmY2d0l0TjRSaWs1MmFJ?=
 =?utf-8?B?WUx0ZkdKZ0p2TGRoUGVDc21iVTJpenE1OTV6YndpMzlIWHExUnhTd0ZWUEph?=
 =?utf-8?B?SmZ2T0tvWDM0VGNBalp5ZkJJTjgzWVlXMGlZS2FNUFlheGFidGhtcHlMcTk4?=
 =?utf-8?B?bWdUREk3MktFRHlybzlmc1RmazZMbDdVdTVnSHNGWHJJSmdIL2xnNzJoRWRC?=
 =?utf-8?B?cDgzMWlEOEtacmZLM1o4Ly9KaHJHUGp4TEFNN04zSnI0dVpRSWJUVVVjamxH?=
 =?utf-8?B?M2FaL0k1RzMzWVo2Q2ppb3IvOXJJN3ZDa1FzZlBSbFlKRkhFeW5YK3NIUVlG?=
 =?utf-8?B?TE9BQkVDM051SVhZK2t4V21XMmFXZDR2U041bXRPemxkRk1XUyt1QXY2bGdV?=
 =?utf-8?B?dnNPTU8vSnNaTkxhZVd2NjhHOXJCWm1OWG9LWEdYZTA2UFp6UlpNbCtNOEh4?=
 =?utf-8?B?VGNOakpCaW5PVzBRemVtdk9QcHBUVU1ud3RvVVhtaXN2NExqNnRyaXVmNlVZ?=
 =?utf-8?B?MHlpVHIwUWFhY2pockVTUnZiNVFXWis1YjlORnNjSzRXSk5pQ2JOMlZHMktv?=
 =?utf-8?B?d21TeVBOYVE5K0JyeVhORUhuc2R5c2t1M1BDNlR2ZHVpUlRmbmtEcy9HcXY3?=
 =?utf-8?B?Y2NXMUlVR3RVeUIwYUFoRmNpRjFYSnh3d01YakpmcVZLV2xWMmdiTkZxbjVB?=
 =?utf-8?B?cEFzSmhzT3UwNHNrU1MyYXZDaE5IemlZL1VDTUt4VVNnTXgvVzNuWW9sTTkr?=
 =?utf-8?B?emZlaGFtV05QY09vWVUzckFqMlBaU3N3ejVycGxpOWpBcDliS3BoNk9Bb3F6?=
 =?utf-8?B?dkFMYVh3Y3FibVYvSThQRFVhOTAwQTZWRHhSSitzMGRMT2x2YlVzTVYvb0lu?=
 =?utf-8?B?dXBmcnNVdHJDUVplaHVvS21YWFJhSDNYZG1KeTdMZWQyM0RSU3A5eVdCeDhR?=
 =?utf-8?B?dmE4cEVKNVgwUGY0RklGNldXNHdpcU9tbk80aWU5U0orTXpuTXpITjdzWFBP?=
 =?utf-8?B?SFdLUFhGU1VQV2liVUpwNHNzdXRCb1J5ZTBpRmV3SFAyWmdmRmovYjZtU0lV?=
 =?utf-8?B?YUJVVnpIaG5MeDNyWEk2bVR6dURwV0FWTlhPQktjUGlhNzcwSTZtVlBNazE4?=
 =?utf-8?B?WE1PQjdaV3ZaVktoN0N0VUtWeFRsOEUvZzlVN0xzWTB1VEFZeGtpdkFLZmJP?=
 =?utf-8?B?TTRieXc3NG1QNnNqc1NFK2JDb2tqeExDYkJrczUvZGhtLzNHYUsvOFo1SjZX?=
 =?utf-8?B?eHR4K212ZVFUeXdBbzNvVFdkQWZmMEVIUG1jYWs2VXNSTWsrblVnZ3JvUVJD?=
 =?utf-8?B?WUQ4UkMveEIxMFVjR0JyMUJlNngzSnU3MlB0djdaWXJhd1JrTy83TkVTcnZE?=
 =?utf-8?B?TEhuMlU5bWFiNWZQNkxNZmRlejBkNm53UmcveEI2SlFaOGNId2krK2dyMnVE?=
 =?utf-8?B?V0ovS05nYUtISzZkakVSbnMvZ0RtcVVvRzkzNGNxQytCa3NXcGhoUmh5cnBh?=
 =?utf-8?B?bmluMTFWR0M3TnQ4SmVBREkxYngwUjAxZTNxQmdSYWNHQ3AxL3VIOUdRSGcv?=
 =?utf-8?B?Uzg4eVVUdlovbjF6YWV4S0ROVDA1Sk9XSFk2cmUyQU15d01WSi9ZRG9qUHdp?=
 =?utf-8?B?UmZseTR2RCtmRnZZUXV4M244OFRxWjdnOFVPZ3F6elRQZWFyS1AwWCtGV2l5?=
 =?utf-8?B?NlZPNXNLSVFIdTdFemRSMHY3R3VNVzhQbmNZSGY0dHc3K0ZrNE92MDJoQzFk?=
 =?utf-8?B?OGh5VWhEL2tVV2RvazBKai8ycHZnVTdPZjBGblk4SGl2M3Fwb20wUXliZFpr?=
 =?utf-8?B?TlBuQTAvNVFpb25mc25RU3R1ZVBnRm12eE5YRFZNVi9Nb2ltNnlqY29wQ3Rt?=
 =?utf-8?B?R2hZOHBWMTVRNzg3YVRzb2VXRWkzZjBsaHdJb2g5TElva3VSNTVuTjZ1VHg3?=
 =?utf-8?B?QUFFMWpxVFR4R0Z0TU1KV0E5WERaSkFLNGdDSVh2TVdwMTJOV3JyUEd1KzQx?=
 =?utf-8?B?TkJRZUd5YzNuWW04U1NzS3pRTm12ZDdtMXp1T044ZlhFNmxXaU9GS2Y2dWNN?=
 =?utf-8?B?S1N1V245TnNEK2RtTkJYRmhwL3ZqU0hLWUdVaG1PL2dSK2QyMjBNVDViU3lV?=
 =?utf-8?Q?/7ygJpSWHWaVnzDxyy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b8b29-ef9b-451e-9164-08d9c465214e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:34:48.1312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxQXCyr96XH/z2Xp5VyGRXBDZj3s2qD0cUIKUq49HJmCSEhLumnjFKrfxnzEOJxcxLtgG7IZNsTfDHqmBsMcSQ7Rq0K8ypayggIb/IlXaeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2267
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10204
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112210041
X-Proofpoint-ORIG-GUID: jkOiKS1icsaone8YakJcqOj63J98PfMI
X-Proofpoint-GUID: jkOiKS1icsaone8YakJcqOj63J98PfMI
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace direct manipulation of ram_counters.transferred with a
function.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/ram.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..bd53e50a7f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -386,6 +386,11 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
+static void ram_transferred_add(uint64_t bytes)
+{
+    ram_counters.transferred += bytes;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
@@ -767,7 +772,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
      * RAM_SAVE_FLAG_CONTINUE.
      */
     xbzrle_counters.bytes += bytes_xbzrle - 8;
-    ram_counters.transferred += bytes_xbzrle;
+    ram_transferred_add(bytes_xbzrle);
 
     return 1;
 }
@@ -1198,7 +1203,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
 
     if (len) {
         ram_counters.duplicate++;
-        ram_counters.transferred += len;
+        ram_transferred_add(len);
         return 1;
     }
     return -1;
@@ -1234,7 +1239,7 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit) {
-        ram_counters.transferred += bytes_xmit;
+        ram_transferred_add(bytes_xmit);
         *pages = 1;
     }
 
@@ -1265,8 +1270,8 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
 static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
                             uint8_t *buf, bool async)
 {
-    ram_counters.transferred += save_page_header(rs, rs->f, block,
-                                                 offset | RAM_SAVE_FLAG_PAGE);
+    ram_transferred_add(save_page_header(rs, rs->f, block,
+                                         offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
                               migrate_release_ram() &
@@ -1274,7 +1279,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     } else {
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
-    ram_counters.transferred += TARGET_PAGE_SIZE;
+    ram_transferred_add(TARGET_PAGE_SIZE);
     ram_counters.normal++;
     return 1;
 }
@@ -1373,7 +1378,7 @@ exit:
 static void
 update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
-    ram_counters.transferred += bytes_xmit;
+    ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
         ram_counters.duplicate++;
@@ -2298,7 +2303,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
         ram_counters.duplicate += pages;
     } else {
         ram_counters.normal += pages;
-        ram_counters.transferred += size;
+        ram_transferred_add(size);
         qemu_update_position(f, size);
     }
 }
@@ -3133,7 +3138,7 @@ out:
         multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
-        ram_counters.transferred += 8;
+        ram_transferred_add(8);
 
         ret = qemu_file_get_error(f);
     }
-- 
2.33.0


