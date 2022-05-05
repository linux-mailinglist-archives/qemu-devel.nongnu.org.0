Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7C51C621
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:30:46 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfJN-0000bN-QA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0l-00063N-Ce
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0f-0002Bo-5Z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245F0uXe026110
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ivSwuHYvoIcC7zPSkKbAaaoFSdZhWtUd40sxVSelbHo=;
 b=rweMy0y+nIo3l6RdP05U0oIu9YCUH3I4lUXprLqQ2RMFw0TY67Jg6IbvzYu2ZwuFHKxs
 uhyorFQAotOvifoPYL02Xdl9I9szNaSxfSWNvnbCDBmC5Cusi4+brquvDXIFidnvHRqS
 9OkOtKSld80uvyGsDeyiHaBpOY/tJgI9iqnpOFpUuHr3yD8XmhyuzzHSVXzrVCD7KzSX
 CzOK/RkV7k1maKdhm+Ex5quU+XXn4H/AdZG40SV4gs+RepD0wQ14ibjJYmq0h/X8OnhW
 zaoL82SGnlRXo56vdQkkico3XmGrpy24BI3xGoLQ6QEsPfEbYTO5ZhqtNFjm3Mtn3rMJ 6w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1PHX001942
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7amqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euOZ33V8JC05KzF7w8sImHBWY/OumeWXoeIil2YOJqLqC1J6NA1n2o8FIbeFPOX7uo28PVHoNIuwVm5Xyw0rIFDMkkYwJKcezVncD/Kj/UcKNjVOj/iXthe2PrQkFOKYyDhy4+eeJoXGPVdt3Pf9+g/Vi5KvZzp6GXEnYwj6NNqrzm3voGkGzHsJGTSgNgyvUcqHJlqHdnzHQxtthmPu9OXSfXi2fiUA/WwtFBuLkXZx74r29jxl1oWRAnLWTwaWoBovnYRq82VtVv2Xe8rQiNgictD8cf7NkUm28zdFIxhQLuOe1PQpUBhy+/eW/ZTrNQr8js6Mglv8yppcxBcAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivSwuHYvoIcC7zPSkKbAaaoFSdZhWtUd40sxVSelbHo=;
 b=V2uCOVG5yRV8tyiXn3cyDJ3xF5DZrxJLTHF0ybIVf2XPS/16D4AqPw0mgjeUVNISHq8PgwBlnzNldTj7UoV0c8hvcijsCjalqHvlAUUthpOOJzz732xbxJ6KNXz9+5BBdy/43BlOeAkO2HgWIhjBZYUMsyju+oMeUuk7aY4IqWpuy0E0NprCJ+putex8CPZwaAlDxs19Wse9mQYRk8tHjBtxD6DAQQx7SMEsuq27KLSFC1SmWl6mzV2kfhrOgBBPib8SBSYm0mdO9Vv70P/GEGlp7+BUJuElwiCMHWtjz6I1qkBLhub2FlQldmf3TbyyzsNade75duj90hVId1sWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivSwuHYvoIcC7zPSkKbAaaoFSdZhWtUd40sxVSelbHo=;
 b=xBE74uQuwLqvb6YgC0ytfeCi0keR3RYwIra1RGPhgUl2cDiMPpM7mUbWRhjmphLVdOYuZ0fhjo6tsRfRPP7W2VWql0t44xaRYqCzzmxPB96LYSqVUsOlURgqSs7FKc4aB34T8wsX2r2Q+choQNyxCkHugld57vWrG5wnFyNiX74=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:19 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:19 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 07/23] vfio-user: connect vfio proxy to remote server
Date: Thu,  5 May 2022 10:19:50 -0700
Message-Id: <90c382c8aa89c1ec14768102e8f2c5a96e63b039.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 798fa9b2-16b7-4286-99de-08da2eba449e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB186780A91B9B638DCF672718B6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZNre4xEAifsuZpu3NHmh34ImTVr26IGDaR96mvZLbCK23trTP3zVlswahn4nbglTLPophkzKPi8Lf+Nb+hg7vZlsHc8xz5oe2dbTwV2uVisKrbiKGubeKCTGwxwPdBqMS57M8OVtx6NyhDmAIYwotygoO8fmjNW/W8H/y8PNp/YerpN/XKdhpsPz5MvRlFCSgklDRHqnWoLS/+CQObyWbWBOMNChWjGqiAImnUutHNwVjxXMOHdYKlt2EBn4CJ3fWTjmmLI5ILVQTtZbD1+1BKWskqomcxZDGVaNT+3gchlSkK5OVJkWeBH+0cLOtuvbaTFyGSPRlXgVHpv9XmI5SjWDkC/cU1bxxl4Y/PMCDc39mUxJmjTDdi57ghSaBTM7NGswSnwfwiYiyDMf/36qGQb8xbDVNMT2JGRPLJUwt2rzZ3yaTsHAoe6W6ApdGE1rB4AJUOeKQrHdS0HQlP785Pa3KmsnwyJPRl3+yfTQ/A1b5nYZIH9+YyPLO7vUZ1EI9T8t18feE+OKhtdpheG82td00m/klO8t8Qg1GSJ1rZ9tjWu8kFVTLm49GQMUcFWUcECaqiZ5F87sBGiWcnXN1EZxFXfnoTilZPfbCZ9+fmvL3153xzxZVDkP7ywf++0dLjk5zSoXKCHBW7qKNT0StiPZ50fp8qjAYDNIL+vZU3cNhbzaYQIxXaxNeXLWpe+k/RTj2G/XTLRKiKFi8aedA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNRVmVyeXkxUWYvNzNnb0N6WDFseWpOY0RrYk1oUWtENTc1UXBRL2haTFA5?=
 =?utf-8?B?V0J0SnBTSmJHcjVZSGw4Z3ZHdDJYczBPcFV6d0ZNSGFKN25uajdNdTFUeSta?=
 =?utf-8?B?Z29tU1Qrd1B4czRZVk5Sb2dxZDQ4Mjd3SGRWZ044WmFxaEU1bzVRNy9sbmZO?=
 =?utf-8?B?VzN0UnV6TW0wKzJNdGJaTVlDVWRLdnRBVDA5L3ZEbGNRVloyRy94VXFRekE5?=
 =?utf-8?B?OUtWc1ZscnNNczk2d0thSVp2Qld2RWdFMno3RDdDRFAwbElmSXYxcUd5TjNC?=
 =?utf-8?B?YThJQ2RtblJiUGN2WGp2ZndGV2hWQitUTnQwRzl3N3V4UzVsUytqQlVySnNo?=
 =?utf-8?B?eHhEWGZiVEROU0Jrak40S0VwYXowN0ZyRzhhS0JIQitScWtTL3lWYXkzL3Z3?=
 =?utf-8?B?Q3MvTmlUM0xCVUEyRVE0NTJjVHQ1S0dVUWwxMDFJUCtaT0xnbmFhQkh3UWtR?=
 =?utf-8?B?ZU5oUGpITDFodFo2eWpPdEhmMXZjT25aOG9naWhSRldpRGVWcUYzcEdSdFFu?=
 =?utf-8?B?a2o4cStRTXFsSlBYWVplZHRrYlJocVBSWWZLclhsRko0R1VUdWdnTWtVRnd5?=
 =?utf-8?B?TnZ0Rklna1FSbkVZNFEvbXJJVnRVaTBqQlVpU204dnB1cWNFRlVLTzlWOXcz?=
 =?utf-8?B?VURhSXhnbEtSK0ZrMFI0RmR6RmZBaUY0ekJJYVQ4N1NwcWZZK0xTNzB5KzY1?=
 =?utf-8?B?SUJma0M4Y1ZrcVdDci9KZ20xTzMwTWlja3hiV2N5VkNFS0RlcGpMVFJZd3Bs?=
 =?utf-8?B?eDk0NFNBUzJ6UWdvWi8rSWo5eWtrNlRodlpjNUdFWTlyRWM4aW81T1B1c1Uw?=
 =?utf-8?B?UDEvVmx5M3dXZTdjK2RsVnJ3UmNQeDlnU0llYVY5NU8xMy80MGpnbW00ZGdT?=
 =?utf-8?B?UzQzQk1RT1hVYWtGbmVqa2UyZEJ2blorR1YycHo4TDBOT2ozZ0g0WTlEOCtH?=
 =?utf-8?B?Z1hIZDFadi95TmkyOHJqb2Y5MkxORzlCNVhQbWs1b2ZaeVVsRnZwSEpwQlZq?=
 =?utf-8?B?VFVBWG15RGwrdU02VEk3RUk0dHAwRkJFOTh3NGJoZDVHZUNDQlI5OHRxbUc1?=
 =?utf-8?B?cC9rcU5EdXZ5UFJ6YkxkVzF6WTQ3MEFueHNHbFBnUHlQZTM3cHRmVGU3UDky?=
 =?utf-8?B?NmRtZTRjclBrS2s3N3JhVmFBZEwzMms3ZDZnSkFXQVpNZER3VjB0VktaR0Nn?=
 =?utf-8?B?OXZjbFJHV0hlMGRmMzVEdXlMVFRyNTlHOTlUV2F5bHJ5bTJFZ1JhVyt4SHl6?=
 =?utf-8?B?dWM1ZFJpZmdTYlcrRlVpYzNoMXROeW4vZTRCSk5wSDAwVVFGeUNUYTIzdkV2?=
 =?utf-8?B?QnRUWXd3WGZicXRpdjIrWkFDbXhEVnF4dFdCT0RkT0hZVzlUUGZuN0ZxVGxl?=
 =?utf-8?B?MzY1UGlyd1pZQk9GbjBpUEVocnFhbDlZc0hKRGhmbUJKUGhKdThSZFpVcVp0?=
 =?utf-8?B?SzdneE5uWWlma1ZvN0pkK3FWRE5nS3dPdXJ6NmkrYUNQOVNDaVExb1pYN2tp?=
 =?utf-8?B?L0VnRE9wYko3OGhWM2diWkk5elM2Ym92ZExiZkZNdFlvUlhlN2Z6aWhQbmhj?=
 =?utf-8?B?d2gxMTVxV2lId1FQVnphNmhNY290NS9hQ1F6WWZlU3Z4V0ZOd0lyaXU4dnFo?=
 =?utf-8?B?a0hJdTJNRUc1ZEZVWVpDbVc5TEErSVRvK05NakxVbFk5VzBEd1Z2SVlzV2Ev?=
 =?utf-8?B?NktlYmNpcjJZcDh2SWZmV2FoRFFaV294Z2VVc0ZiNm1GTXRaeklzRlVUMzc2?=
 =?utf-8?B?Y0o0QjNZellSc1hubFlrY1ozdXBYN2xoRjBhUWFDUlU5dGt5dmRCSmUxTUs0?=
 =?utf-8?B?K1BDdnhqZHNWeEEzakdTSlluMmRaNU1sbXd5R1dDQXlBZnl6ZmJ1RFhIbUZJ?=
 =?utf-8?B?V2V3WXIzZnFGN3lLdVF1ZTJ4V1o0WlV4aDZwdkFLUmhlaHhZY1JHVE93a0lJ?=
 =?utf-8?B?bHY5UXhraW1IalZ5Mzl6dHJNeW5sbC92VXJtTmo1RjV2Szk5L1Z0clc1NmZ0?=
 =?utf-8?B?a1pYbmlBU3RCTzNOMmlmeUQvcXZmU1hDTHU0YWVQZVhBMjlqRjRNYmlCbGVu?=
 =?utf-8?B?WStBbkFFQnUwaFJkdC9hTFlzSUszMnBvK0NYSEFFelZGUnhXSG1TazBMRXdh?=
 =?utf-8?B?TWozSzQ1ZEdsRTZ6RDVXcFdTRXlEYWpETmRDMDNrMU5lQzJDSWRpS2M5Rnpy?=
 =?utf-8?B?MTNyOWt4UXd1VkRlQkhwQytmczJBZ1BoU0xyVVpHck9oS25QZU5sUFViTmVT?=
 =?utf-8?B?OTI5QVlQVC9KdDJCdnErbUw2dE82Q1ZmOXdCVnFUQ3I0VjJyK3dscy9oVkUy?=
 =?utf-8?B?d1pvSERpUVFjdDc5MzEzVUVUbTlKTlQ0dVZBRlNaVFZXcDYxNGZwUzRDNU1N?=
 =?utf-8?Q?5WAqiLXlrpyEiLDE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798fa9b2-16b7-4286-99de-08da2eba449e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:17.7323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBEO00x74dZ8OmdlVIvz1UAIcML/rfDu3vZUMum1SYLinGFKVyeFpT87WA2hrR/Oy491E5thCqeJceRhNwjKMDD3pgWM+aL0tRBTX3pmdgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: JOXO_afqcR93hY8Qxew8vjqy9KgguAHM
X-Proofpoint-ORIG-GUID: JOXO_afqcR93hY8Qxew8vjqy9KgguAHM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add user.c & user.h files for vfio-user code
add proxy struct to handle comms with remote server

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |  78 +++++++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/pci.c                 |  19 +++++
 hw/vfio/user.c                | 170 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   4 +
 hw/vfio/meson.build           |   1 +
 6 files changed, 274 insertions(+)
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
new file mode 100644
index 0000000..da92862
--- /dev/null
+++ b/hw/vfio/user.h
@@ -0,0 +1,78 @@
+#ifndef VFIO_USER_H
+#define VFIO_USER_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+typedef struct {
+    int send_fds;
+    int recv_fds;
+    int *fds;
+} VFIOUserFDs;
+
+enum msg_type {
+    VFIO_MSG_NONE,
+    VFIO_MSG_ASYNC,
+    VFIO_MSG_WAIT,
+    VFIO_MSG_NOWAIT,
+    VFIO_MSG_REQ,
+};
+
+typedef struct VFIOUserMsg {
+    QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserFDs *fds;
+    uint32_t rsize;
+    uint32_t id;
+    QemuCond cv;
+    bool complete;
+    enum msg_type type;
+} VFIOUserMsg;
+
+
+enum proxy_state {
+    VFIO_PROXY_CONNECTED = 1,
+    VFIO_PROXY_ERROR = 2,
+    VFIO_PROXY_CLOSING = 3,
+    VFIO_PROXY_CLOSED = 4,
+};
+
+typedef QTAILQ_HEAD(VFIOUserMsgQ, VFIOUserMsg) VFIOUserMsgQ;
+
+typedef struct VFIOProxy {
+    QLIST_ENTRY(VFIOProxy) next;
+    char *sockname;
+    struct QIOChannel *ioc;
+    void (*request)(void *opaque, VFIOUserMsg *msg);
+    void *req_arg;
+    int flags;
+    QemuCond close_cv;
+    AioContext *ctx;
+    QEMUBH *req_bh;
+
+    /*
+     * above only changed when BQL is held
+     * below are protected by per-proxy lock
+     */
+    QemuMutex lock;
+    VFIOUserMsgQ free;
+    VFIOUserMsgQ pending;
+    VFIOUserMsgQ incoming;
+    VFIOUserMsgQ outgoing;
+    VFIOUserMsg *last_nowait;
+    enum proxy_state state;
+} VFIOProxy;
+
+/* VFIOProxy flags */
+#define VFIO_PROXY_CLIENT        0x1
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
+void vfio_user_disconnect(VFIOProxy *proxy);
+
+#endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 826cd98..3eb0b19 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -76,6 +76,7 @@ typedef struct VFIOAddressSpace {
 
 struct VFIOGroup;
 typedef struct VFIOContIO VFIOContIO;
+typedef struct VFIOProxy VFIOProxy;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -147,6 +148,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    VFIOProxy *proxy;
     struct vfio_region_info **regions;
 } VFIODevice;
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index be8fe1d..8f65074 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "hw/vfio/user.h"
 
 /* convenience macros for PCI config space */
 #define VDEV_CONFIG_READ(vbasedev, off, size, data) \
@@ -3408,6 +3409,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    SocketAddress addr;
+    VFIOProxy *proxy;
+    Error *err = NULL;
 
     /*
      * TODO: make option parser understand SocketAddress
@@ -3420,6 +3424,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
 
+    memset(&addr, 0, sizeof(addr));
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = udev->sock_name;
+    proxy = vfio_user_connect_dev(&addr, &err);
+    if (!proxy) {
+        error_setg(errp, "Remote proxy not found");
+        return;
+    }
+    vbasedev->proxy = proxy;
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3431,8 +3445,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
 
     vfio_put_device(vdev);
+
+    if (vbasedev->proxy != NULL) {
+        vfio_user_disconnect(vbasedev->proxy);
+    }
 }
 
 static Property vfio_user_pci_dev_properties[] = {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
new file mode 100644
index 0000000..c843f90
--- /dev/null
+++ b/hw/vfio/user.c
@@ -0,0 +1,170 @@
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "hw/hw.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/vfio/vfio.h"
+#include "qemu/sockets.h"
+#include "io/channel.h"
+#include "io/channel-socket.h"
+#include "io/channel-util.h"
+#include "sysemu/iothread.h"
+#include "user.h"
+
+static IOThread *vfio_user_iothread;
+
+static void vfio_user_shutdown(VFIOProxy *proxy);
+
+
+/*
+ * Functions called by main, CPU, or iothread threads
+ */
+
+static void vfio_user_shutdown(VFIOProxy *proxy)
+{
+    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
+}
+
+/*
+ * Functions only called by iothread
+ */
+
+static void vfio_user_cb(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    proxy->state = VFIO_PROXY_CLOSED;
+    qemu_cond_signal(&proxy->close_cv);
+}
+
+
+/*
+ * Functions called by main or CPU threads
+ */
+
+static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
+    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
+{
+    VFIOProxy *proxy;
+    QIOChannelSocket *sioc;
+    QIOChannel *ioc;
+    char *sockname;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfio_user_connect - bad address family");
+        return NULL;
+    }
+    sockname = addr->u.q_unix.path;
+
+    sioc = qio_channel_socket_new();
+    ioc = QIO_CHANNEL(sioc);
+    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
+        object_unref(OBJECT(ioc));
+        return NULL;
+    }
+    qio_channel_set_blocking(ioc, false, NULL);
+
+    proxy = g_malloc0(sizeof(VFIOProxy));
+    proxy->sockname = g_strdup_printf("unix:%s", sockname);
+    proxy->ioc = ioc;
+    proxy->flags = VFIO_PROXY_CLIENT;
+    proxy->state = VFIO_PROXY_CONNECTED;
+
+    qemu_mutex_init(&proxy->lock);
+    qemu_cond_init(&proxy->close_cv);
+
+    if (vfio_user_iothread == NULL) {
+        vfio_user_iothread = iothread_create("VFIO user", errp);
+    }
+
+    proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+
+    QTAILQ_INIT(&proxy->outgoing);
+    QTAILQ_INIT(&proxy->incoming);
+    QTAILQ_INIT(&proxy->free);
+    QTAILQ_INIT(&proxy->pending);
+    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
+
+    return proxy;
+}
+
+void vfio_user_disconnect(VFIOProxy *proxy)
+{
+    VFIOUserMsg *r1, *r2;
+
+    qemu_mutex_lock(&proxy->lock);
+
+    /* our side is quitting */
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        vfio_user_shutdown(proxy);
+        if (!QTAILQ_EMPTY(&proxy->pending)) {
+            error_printf("vfio_user_disconnect: outstanding requests\n");
+        }
+    }
+    object_unref(OBJECT(proxy->ioc));
+    proxy->ioc = NULL;
+
+    proxy->state = VFIO_PROXY_CLOSING;
+    QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->incoming, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->free, r1, next);
+        g_free(r1);
+    }
+
+    /*
+     * Make sure the iothread isn't blocking anywhere
+     * with a ref to this proxy by waiting for a BH
+     * handler to run after the proxy fd handlers were
+     * deleted above.
+     */
+    aio_bh_schedule_oneshot(proxy->ctx, vfio_user_cb, proxy);
+    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
+
+    /* we now hold the only ref to proxy */
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_destroy(&proxy->close_cv);
+    qemu_mutex_destroy(&proxy->lock);
+
+    QLIST_REMOVE(proxy, next);
+    if (QLIST_EMPTY(&vfio_user_sockets)) {
+        iothread_destroy(vfio_user_iothread);
+        vfio_user_iothread = NULL;
+    }
+
+    g_free(proxy->sockname);
+    g_free(proxy);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 8117241..cd44f91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1958,8 +1958,12 @@ L: qemu-s390x@nongnu.org
 vfio-user
 M: John G Johnson <john.g.johnson@oracle.com>
 M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
+M: Jagannathan Raman <jag.raman@oracle.com>
 S: Supported
 F: docs/devel/vfio-user.rst
+F: hw/vfio/user.c
+F: hw/vfio/user.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..2f86f72 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'pci-quirks.c',
   'pci.c',
 ))
+vfio_ss.add(when: 'CONFIG_VFIO_USER', if_true: files('user.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
-- 
1.8.3.1


