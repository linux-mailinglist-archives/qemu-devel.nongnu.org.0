Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2545186B8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:30:51 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltYA-0002S1-Er
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLe-0000ng-Mf
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLc-0001Qx-4R
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:54 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243ECdiJ004338;
 Tue, 3 May 2022 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=mlCkAwpcRuzDafSgT+t7m0vM+vkwgP/E+WlP+5gnIcg=;
 b=tGEvApXdqOY8INtOV5t7gid5Cmwq+0UJPUpquE5HPOAGzDQ8kRkW8+jQEhRX7sGJs5UX
 FTHJFKvjSgKsKfZYodRNkH3iviRarZL9Me/yC8gcczE3YRzBbhq26lIHPuwuchq3j++H
 twTIb+USlWb9N+pZkWLxtuxk07UOab7GsbF+QTnog2PcOZoyN7PQrj3QuN2/UdpWbkxP
 0ep+94/pWTeSew0K3+ANssVyJIADG1y/6KMe/KC+2PTnlexM3yOytZB2foRG5/R62HqB
 BbqCcKuS0GeaGkTymXFfiPQmc2nBVwSp/NjDIr/c2Ew4Fn0YNwbpJV+o0Th4o1wnFRbK sA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:47 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGPwW002277; Tue, 3 May 2022 14:17:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj2e5uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuYV4saL/Nt3hRPCGXuqxmlrM+YFPzT64wMbLIs5FuB9puLk8wVmwXmawlEcKSXJVV/uACEByh8RbceuZzBB//+LzSgMmAHUr7TjF16QXD6Qh4OmoT18ssbosFB0IRhgcGle5sXt3tdga5UJwONEfFcLY9ntrAlmO/s/wBHOmZQ6HxxNKGYXJepSI7aiJOO65aLPCpsVO8om5hSdxVAd1hgE4lT6Y7tEzcUvm61boIyBK7nNrWsFS6MY8Wt9La9GgRGhiE3b9f8WdAoyQoiRau/nlBbD30WMwCfUnZ4Jg3SY46P89PSMfsHh0wOsWB73Cb81Lci9eFoVsume0fpDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlCkAwpcRuzDafSgT+t7m0vM+vkwgP/E+WlP+5gnIcg=;
 b=hWf5ifH2fIo2tSuavzdHfRFEsaCLHvSq/z+mWQTruGO3+7jl1Qq2CeJkPH9IYjJB0L/76t6zgDRzJebBzFKdDrQMONUvusBGbLACK/UT81ZiXATgexvgsHmgvAXeSVXB45w0hf2jmPS8LqmkZorGk0sub0sI1ZBP7nCF1zFwFqQC1q1VkYj4QAFqnotDy9MfSiegu5GfPBfG3WxPza7AGe0qiQI/9DzXs2CBc+N3ViMzxooPYCY8kYSWWcNcx+o9wnZzp+2gN82HTyFg3EWlvvkNNJIb6aSJUCdE9XnknOpfCjjQPQ9lpPydA4BVybXmB/zj49I1p3A7c4ck2d0/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlCkAwpcRuzDafSgT+t7m0vM+vkwgP/E+WlP+5gnIcg=;
 b=rudI5Z3UocLm9nPfktOmSVtzrwRvhoNgCl/WD4gvHs/Cm3vy5FWHnJuITm2Z9mYtsbQNMWF6lkEnrZep7RqG5sJksJcW6tfCrsVTUDQx/7ruYtlOMbrTnYl2R0sVcfGtrUuKIIA9j4+ms1HfT0Uqecb5QOIWB/MI12kE/ouRJEw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 15/17] vfio-user: handle device interrupts
Date: Tue,  3 May 2022 10:16:56 -0400
Message-Id: <25ab3efc76a9f2b4fedf82f53a4a0cbf8bcd5eb6.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02836736-ff19-4f4a-5bd5-08da2d0fb057
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3358EBB44315C15C001A4DE390C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJDAa5Jn1UXeJvTYI7lE7WGlK3Nqu9dz2hsfUX91QnZv7eDecloXhKfTrqliplJfXPjywJLkHQQ49Xu0yVbcgEQA+z6930vTXwExA9RPpm510v+gje/knctCHkVast12jzfNZFO7WeJ04HLJXOqtUnujpzVQHVfDxmvkxcj3po+O8LYQB8p82ypZitnK91UeElRRcwDk+HA+cHRHYV8WXcofJVqRkvWzOSichIS9dgU0kUv5cpvIiWk8EyEcmlChnt8MhpMy1a/Qkk03jdYVJ9AUtBquBtDOx5FLnrWQjRNP3IciO4V30+kmbBRqt2TuTjxHSy61MjsAyk5ugr0uB9rbwcPamhszXLihPpVX4Ub+Mw+jTsjN/psEA+4SkdzMDrWJQJQfbGvMk8Jv/iE4DE8d9t1lMkOnBIVbfngHMBRP57/xDEELsCFfsFX7D7awFu6kpRo4RtqzS1YxesjNHUAKagZRfr9aTcKBY+0FEyar20DP3/LfDGbdMq0t1bL0PiYvAraE3ZAaXnKS1Theo+O2MzXkv9y7Rz/hwa942G2Q8oznuoabtS+2M+xIxkjSq2/IVz6kMDMqHvjSueWgc5/c67owNRPgR77FTKD+TqWWTsUax3pqS16NCiuPbAXMyeN+3iUoD0cBbrJsnIM3Z+AMsNa5D3k2nQz5W/WUs3AgjRu53pxbwpastDakTHmRhKuC3+kKeLbGiOkKodjsWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(30864003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egDBvlbQaN5W7E+ErZ9j4pu7a8lHN5xYDpNXJb3vBdTmq5bjudZgd26ikK5l?=
 =?us-ascii?Q?S8DdidN6hio8+1h2Rviyk132fbNfdAJouZT5Q1P5KzB3Qj0spq8PRsYGWmvu?=
 =?us-ascii?Q?+9MrvQ4kpKoFlmykQuATS0ifhLcYwQfX6OVHDovTw3GE76uGTnhOxRaFf04K?=
 =?us-ascii?Q?LQTBDZ+FQUXn97BI8YMNQIKdLjmZuONG2z8/dcLMSn8IoyBlOyr+xo+IHw/1?=
 =?us-ascii?Q?V4WwELmeev9yS9Ztph6eIrEx8aTdffmyApN8frVibnBaEBbsBpIAvhhM7HP2?=
 =?us-ascii?Q?m7okhOg0693Y94h9vhdMx0LqzciUGoudNk54KhVQXo82EwcuV90ig2p/FoJl?=
 =?us-ascii?Q?G+LxrcLE3B6tQ9U6AH3MVdlm3SdaBtdeuyeGqPb/YcZVVdcX6ww6XP2U/R6J?=
 =?us-ascii?Q?RKl41xBIP6+z8Gy/7JjGqSHc+emMFmwqY+YjSv4kB47qT4ZDadpGaBd4wx+3?=
 =?us-ascii?Q?5zeN9ElHYki/Q2S1UoCmuX7kovfifTiASftZ4/HMg//tgXGLgBBcum5+/io0?=
 =?us-ascii?Q?CAQgqIlR/kwxZRmSLY13EAbgegZ4ReFI0GKOwoHUzk+1Fplita2F51BNG7+E?=
 =?us-ascii?Q?4z6hu2VoddLYpk4/w48UcTdZQxRjLiIHSE+FvgnEfuXtBvA2JZxLdcMfdzJ9?=
 =?us-ascii?Q?IAoOcwtobPe1mswMZ5I2pLEdXegN3QW4FW0sRmy3HDX7cELc6hwNlp9J8KOC?=
 =?us-ascii?Q?j/MB3P7l8wGl8cYTaMEZRfHWSu2WHZoyMX7a3XA9NElOKgtZbCxDQo5mMOpC?=
 =?us-ascii?Q?9Blsuv0CRb6+/NHTXR3ggMsJrjsi+ntHgGrpku+Od7dXpgQUdbcDQn6zYXqE?=
 =?us-ascii?Q?4m0zrjk5RtihgNmbqKuwkoKDBnoXmHPRJg/u+hLWIxxqrb+2m1LZ5opqD0xS?=
 =?us-ascii?Q?cM1Q67tCgn6DAX8r1kznub819gtF7ZB08iE+PfYeSjb68Hbu+Y1D5C3DcnDy?=
 =?us-ascii?Q?AbEGOPVktP/18EWP46iwCZ/4fvkdcUsUkSAFx6FB9RfvXLkEyAlekHqwdc7L?=
 =?us-ascii?Q?M/nrO9wigx+dMW937Fl8/oGBTEwRNL+fQZQc43buNpL5zN0qoXqtNPtRvS5z?=
 =?us-ascii?Q?kARuh6TA/gIu55ibjldW5s8hsVb2oRAHy+pAMgWS/TKKEDg6zBYqojyydpCr?=
 =?us-ascii?Q?gppD5pZ9CAx/U4psvewpQd9YPGnttFQzCq/wItubiBACO8OdDPVDeyo3Y25p?=
 =?us-ascii?Q?g4MSD13yRnzsNrnlBfciLwBscVchkoYXaqiCOGrHq5uEAtcXorKBE5Q9aR0U?=
 =?us-ascii?Q?WzL4T7bXWN1gxFyGcRisIBLo13bHVZeYYdAY0720XFggNi/+RM4djftPDIYV?=
 =?us-ascii?Q?Vt7XG7OdZ+gxHLBQ+A1ej8fuIR3l87W5hAf6CyibAp8ZsLhTcxMpihibzRr8?=
 =?us-ascii?Q?ZooLrDgf9CsZf5ZyxjY16u6O+s6NNDIjjtmx1gFin/J+s80gZL0rJ95mCdJL?=
 =?us-ascii?Q?fLT8flEbB/E5GmO5+ZY1chSCnNIhMVMci97u9eEeBOjS3xFwi/HYs/VEk/St?=
 =?us-ascii?Q?eirv88aaJSoZOcupuIKm3VhdeLf/HT6NSLnZCnaFGA8tOkv1gSW/0irTetQh?=
 =?us-ascii?Q?4Ght9skKM6Sz2pcU5k1pT7H3BtMQP/537HBkt4sGHASLWUOmFpfgFJrl/+yW?=
 =?us-ascii?Q?wIJTU1yh1yHUYe+aP3l5KRZj/J7oPCDu/fBKu0wM+Pf0NRJmin3HHGX7wxlX?=
 =?us-ascii?Q?WOOaCHoeGT6rNsA1qE9smRzptilmXqry4HLR6V8AtqUXw9ICxlHwns8TUKRM?=
 =?us-ascii?Q?X0XKhc+mvw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02836736-ff19-4f4a-5bd5-08da2d0fb057
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:43.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kX0b86fOyLFFGKUoM1vDcpSB3GYvaA+OKrAUV2dzKhA4Jy6XljnQlwB5VgVMnJWkthXVRqMTyTcvgB9hwEVnWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: Fe5NbwZeFPVQv3unklAe9RXEpm4b_31M
X-Proofpoint-GUID: Fe5NbwZeFPVQv3unklAe9RXEpm4b_31M
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h              |  13 ++++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  16 ++--
 hw/pci/msix.c                     |  10 ++-
 hw/pci/pci.c                      |  13 ++++
 hw/remote/machine.c               |  14 +++-
 hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 11 files changed, 193 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..7595c05c98 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -321,6 +326,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..d556e17a09 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -334,11 +342,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..6f85192d6f 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -344,6 +349,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +436,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e99417e501..f451300ce7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -306,6 +306,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1201,6 +1210,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2235,6 +2246,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 645b54343d..75d550daae 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,12 +56,16 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        msi_nonbroken = true;
+
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
 
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+    }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index f5ca909e68..d351b1daa3 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -96,6 +99,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -518,6 +525,111 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -616,6 +728,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -641,6 +760,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -700,6 +821,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index f257afcf8a..d2e977affb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3600,6 +3600,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1


