Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A95A46E3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:13:24 +0200 (CEST)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbli-0001WI-SQ
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbf3-0003Jr-9o
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 06:06:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbez-0004r5-MN
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 06:06:27 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T7AMv1020657;
 Mon, 29 Aug 2022 10:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=A1UTHa41jR8USx79bmrawGVR6tGB929jfh+H3o4ffeU=;
 b=myjmEoXZEREinDuQ5sFPMAkoyEmaUDC9mGr/G2EpjiagTMmMK1nbVmZtxjMpS1W/DgcR
 J75j82Occ6/RJfU5Av8cKFiQLVYTVVnDbpHvwSctIQPuEFxeVf9A4ed4id7AxnwwZzni
 RTAAkNrHjn3RoPq3XW8V2vUuRonxZGdnNjvw5pss1jhk7OuE0oTYmUX/eC6chCiKAZqe
 3clpm7Az6poyszcHfaPhBOuD8tXSG/f2MGT8oIYmJXEd/odCdxRTS/rzpMiDOq0mGWa7
 amh+nR12+XA40GGlxNb8M1igqWwOy2rPagMN5YPhHSGK8huzslxfYS/KkaYh3S6GXS1s HA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79pbtxs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:06:21 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27T89eGL005246; Mon, 29 Aug 2022 10:06:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q2310n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTPxJBwrw900DBmZubDBU246JgnOXA0VC3HnmrlRu7+PFxci1VzBLw0GnARKsuoAEC8mFU8HaF2DlGPPA4QXgeGP2UGAyaiyy2v4LzhD7qSv/jas4r0jVifDDVy/Gthxm89RTX+NN+TaIG8up/CAbQTBDZ1tFtOc+rH/Mpdq815wPTHpahuKvLRKGKGnwtQTQAlfWaEwaOPZAT4bu/czVGCof9Mu5+8/eojihrXavfu35dzTaPyc9zYagaeWIlvNXjQ5HgB/XpK6I6ykB/IddEgyI6E8DGBWWQQ8qn/qur6Koy2vaRinEc0O5m/f/RMnBbxs3Qurio55V7yS4oJIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1UTHa41jR8USx79bmrawGVR6tGB929jfh+H3o4ffeU=;
 b=hR0+kYk4aveRYjtlhm6SceagYRB7DjzZbOez3Sp4ZP/XFEuiq02KsvkwM0PhTho4ydjs2lOzTVugeVs//aeIpdme5sUGC+bYMUre5xn6DavbrDjjCBLAIns80nKVK3s7R8YMqAHGYUUQ0Tt2/A5Lfax3zZXonofhLJdDkcwD9C5DNBnQBKNwZHSzXosE5fIzTqce9CqSHciFJL/+9PMoSAJ4wnIjTAlMB+ZTWrn1dfDqpn5CbWrOTgiM9LCj/1Xckc2nLieMnL4z18iLYlMYhgqv8QCeHui+AZxtsPA4RHIKi/6hJaWB6zBcoKwuhmeXMiVCvo2757SPzUwWNRY70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1UTHa41jR8USx79bmrawGVR6tGB929jfh+H3o4ffeU=;
 b=z1keS9aCKVW7u0ku+w0IKtqtEUg4bhxSj9yXpzi03qMz+zUH3GqSVIXu9ncgII0yA9/9kUkYhBNzoaszgaGW9Yeh0+e0YIF427ltn7WnTFyGI86/7cwHA25Sau79COJVj9k/owYem9nAdnT8ET6HbDLvDj3j9WOot+AzCtTmb4M=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:06:18 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:06:18 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, armbru@redhat.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org, f4bug@amsat.org
Subject: [PATCH 1/2] error-report: make real_time_iso8601() non-static
Date: Mon, 29 Aug 2022 03:06:21 -0700
Message-Id: <20220829100622.1554-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR14CA0050.namprd14.prod.outlook.com
 (2603:10b6:5:18f::27) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13fc9c8a-250a-476e-91b3-08da89a61d5b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3fakjWzDlyfFGT0qtGhHwxqu7yTvaxQm9255NY1r2A+SdYAnDxtEeJbMEQQcUISwrhHvHEsd4dnCczMc4fBI+DitsITA+tzit7yoWamzG/YABlulO0mTTF8q85aYXtrpIOCCvraHdTadRvDUId+H9nOye3cubUv+8L+ANQJeug1qw4WMHAhHFgQa5MjG1bG5T6RrQJKkSV4O+CjS89cbfQ7yBJUNQXc0zs5XVFpAjOchGf6tA7sEG7t7rPFh8Ie+gjhz3P9SlrhHiUwFDYajxnH6rd/54gGIgvUIT84vg+d1KxK80qn5w9MuNB0JHCcXpUqID/Bv01mE6pWPbDjASYOa01L2hWm3+qT0Vg5xoXSoSlt6mziwkElPVB06d8HXRQ700uDjN4X7BVduKtxfFhfEVLy6GTwh7qaVvEYMaf5LensyLZMoSAB1PcjVJcVplkTsLMM7Do3Ixh3FST/tNT0LkpTRU60p7w/D41bQDsIxR7IOMzqVTvcdGT8H/bwv5rLiVucbSvrEkZ4It/4sWXl8iU28RSL2qgP4w+O1YRhwUgNy/7dNSFWuXfvfRZpeeEg7DLVUOpfDtmHfb1IkPPMg4kTqxx7LTR/yaxujV7YvHM98NlDRlkNdBdvA/sjZMnqRU8luJq97h4Lh1Pq8k7HnZYY0ZMqDkZekqEaW+OsGhwbu4ukD23jptCm5mF56ZtcmEyRoezuyuv0PpRabg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(346002)(136003)(39860400002)(2906002)(6512007)(38100700002)(26005)(44832011)(6666004)(6506007)(2616005)(186003)(1076003)(83380400001)(6916009)(8676002)(66946007)(4326008)(66476007)(66556008)(6486002)(316002)(41300700001)(36756003)(8936002)(5660300002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dm7NYoax4JLzBa1eaLmFB/AKTH6oxOQGqpqetREjtdhg3QWbpxi0gKSKZfK9?=
 =?us-ascii?Q?ZFMrubIkxo+JsMiy3NQXYk9k+v+GxnM3Ru4VeI1nIw2oqAS9BuXYVvownoZk?=
 =?us-ascii?Q?l6BNPZtQNNciylIVKhGUDjdInt/IThaD/hqOKp5qNfaNoFecRms+Wzz5IJRT?=
 =?us-ascii?Q?3dvW1/l4Xwm82c74t44/3//PdRuF4y+1jnU5qPO3WHLPoUEmRzKkzME1Dr6u?=
 =?us-ascii?Q?EnMh1fzy+BlnCvsCYmfbv1k/EXNnr+neYCxBLSFGkZ70yvu7NlAjp+ijHu76?=
 =?us-ascii?Q?xinjWxYN5j2bm4Nk8eekZwIAPHgFj7sVspNq5+qj9xVmiYu3IZYe4Il5XTJZ?=
 =?us-ascii?Q?TFSpWoHrVLnT01bAfFQyTZ8WhT+f4i5RhAGHuqB0ZRGH7zblmxw92C9DBy14?=
 =?us-ascii?Q?WYuS4jEdCbuIPdSaVPz/zRVyKfvSCKB93FYgo6eK6Y+juK9jef/2QXcPUbqf?=
 =?us-ascii?Q?PBXM48HKw0TUUEcGwvC3244hHqctNCsDuRp+yVJK8y9p2D6RNYpYrqmmj3ID?=
 =?us-ascii?Q?ojGWBTGYksS6A4s+0oy8koI1vR8DSCXkxOe3SNN8FfeLcGl1MnfaWwWTHoyJ?=
 =?us-ascii?Q?50qJdMW8oG3ZztgOQTOt074NnR1EWw8dnDPn0EpwlsxYPh1ed8X5ZP3TCjXG?=
 =?us-ascii?Q?mKxvVIvWyfI9uLn9yse9maoX9mKPY8XBni6pTKwgrFGaBlHvGtVYNcug25+4?=
 =?us-ascii?Q?q55zy83LkiIY+yodFNPz8eJqWlWJmsOZKknuJCYUGgAOdg5S0WZUForsv2mS?=
 =?us-ascii?Q?dfGji9hRCGdZjo1jqaDCI4zy4xCfh0+n7u87223IDloDOr2Ao4oHAvt9kYpV?=
 =?us-ascii?Q?WREVzmCki0k6Xr1uEN/e/PAmR/X/LOeHaIxdEsLVBg9o54D0atEQ70PGEdc/?=
 =?us-ascii?Q?lhAMxJ7djmkDcyM5Kby8VDwzbMPpMxmgT7lUat5Nnq1O9SLu6NJ6EsEJeiFw?=
 =?us-ascii?Q?xQaxYysfj5Meyvs9o6SIPik5E2jHTIvwaukzap1DGuKbjj0lF2QIUlSOnwHw?=
 =?us-ascii?Q?6Ve4DrecVGmxSf7q4E2B5BiIciNs9wiBzp2OKmfHsetmB3ZDuidyHjBKriYU?=
 =?us-ascii?Q?Mm0OAcYcPS+vvkoQvgFWD0C8NubbQMEUBlhnBnefavLtFs37ePzOw3Fer3RM?=
 =?us-ascii?Q?OTTZL+1WwAMt8h0jnDHX6H3huS6Szyy1TqkPKfWbEdN8Mascg+c9TdANiDU6?=
 =?us-ascii?Q?w1WhRYR2yK0fXN4HFqZNjbK5vO3CkvmIe1R8EQteol8dYyb/Xf+YkFcTP3ra?=
 =?us-ascii?Q?H7dz2k8bft3gC8c2XosUEt4/jDlSRro7Vfy1GkCcfkG/17p1siqoKIRAQqav?=
 =?us-ascii?Q?oUM1SxaDQAVVxwKFT66JTFIXXJdv9iXdtUq+hqi28nwZXQMi/+rsPyZQ5kQI?=
 =?us-ascii?Q?MMAwR5Bs6W2R7HYc3HcfqtcPD8OBdG30O6RMfNttK1hCMbZtzNQrAayIuGV9?=
 =?us-ascii?Q?6SF6DONV5pGevhI0yWiY3RF4fOCRGyLhrkApnSFXT+M8HSzkkmG6jKbxILxw?=
 =?us-ascii?Q?yRXsijM2sEUbI38kCW/YNK6uuJlfWbKffEVk3BZ05gtYf2N1IIuQ8AT4wJLK?=
 =?us-ascii?Q?/IdxALBGitl1k51ZZbox/aahH/gKHx0OzkSgSzzBNqqv04ZcuqXI3sWtiMtg?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fc9c8a-250a-476e-91b3-08da89a61d5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:06:18.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MAXB2CD+TcneUt8pMSxOCOD2J55Eqs2YOwZmJCScICbaFzwkmzq29PF3rxeU/d9YEa4aaOXixt5vV/ACecjYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290050
X-Proofpoint-ORIG-GUID: PEgZ-YMZAKFx3v7KxiQZf3k_8c4XXVl7
X-Proofpoint-GUID: PEgZ-YMZAKFx3v7KxiQZf3k_8c4XXVl7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

To make real_time_iso8601() a non-static function so that it can be used by
other files later.

No functional change.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 include/qemu/error-report.h | 2 ++
 util/error-report.c         | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 3ae2357..cc73b99 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -30,6 +30,8 @@ void loc_set_none(void);
 void loc_set_cmdline(char **argv, int idx, int cnt);
 void loc_set_file(const char *fname, int lno);
 
+char *real_time_iso8601(void);
+
 int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
diff --git a/util/error-report.c b/util/error-report.c
index 5edb2e6..63862cd 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -169,8 +169,7 @@ static void print_loc(void)
     }
 }
 
-static char *
-real_time_iso8601(void)
+char *real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
     g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
-- 
1.8.3.1


