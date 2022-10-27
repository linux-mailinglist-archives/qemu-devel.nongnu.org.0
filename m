Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111746102AA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:26:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9RZ-0006Ao-AU; Thu, 27 Oct 2022 16:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1oo9RO-00060k-NB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:25:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1oo9R9-00041I-NJ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:25:26 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RKIq4u006891
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=TJuSmqE+4eFVcoL1mb80VPoQtKpFfJqt5vp95Mr9h7Q=;
 b=hyJXvDe//mOKiZgftRWDmYU8+59lO/q81QvyXIq7JvgLtjF+EXMaRuqVFFro8FDr7x+g
 KuEPmAnJyOIs6Pmst+kjGr3etVhCl1cJYqEhB4RBBqNXGH6y6DnQ7sSU009+HO3VCqIl
 +maEQ5d3DBz06HKDrl3jilaZAuFJJ9H8JgGHZJImiyrrYbwNk8x+N+zi4zHyGwKUZK/P
 4jmODwAaBCFwH+akarGyFlXxoFxAAUS/OXgRpcOu06Djro5Ttbkyh4aM59xhQzan4sgu
 yYbGU1XbrzKzabkemvqB5BOnj02XSa+u+tigx9WIvVflxkRpIZHcRksTUFPRgxbcuKFQ Sg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfb0akace-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:25:09 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29RI5d4V012258
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:25:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagrcmub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVlTNx4v8y8BIQH/jQdMdjHwBQroykj667DQh+kqf3zejA1Y+bCuAOVJUBkd7ohQQUZkims7aDswmROqjlE/u1eWydeaDCu40rAVNY41Z8koPNXUVI4Qw27YjwwoGgnAbK0HDRdBITmKHr9lE41UWvfe/xydeFE0n+hw3ilB/irrPaeg5VT6Yyb9fFVJJobNvim2NL82mFBvj9byUMZRVSHS4jCAnSq9LudjZhOFV9MiIM5HDiKh4gh/ecm8QBG9rp/MgmNVILNzXKPKk3MRNnjXLb3M3A0BB3ckp6yyH8RGKol8zyXEzJuCCNYw60Zl+zF2LTOBnSYPuO6mpqCGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJuSmqE+4eFVcoL1mb80VPoQtKpFfJqt5vp95Mr9h7Q=;
 b=irWjvewXKy0MIspUAEwDgHUiSbd9VHODtcEcAFweNP5LoXheXHsqPFh26UIUE6AKhu9rf8wkRFAuqSpx0yA+C6fJ4UbmbHZsyAgwniaaAf2v+kOsGSrp1dxgvIhR/JFc4aMgCHj7HRWW0OmJcuCLqMO6WG5v92xhcdc6Thdtylq3ghq+QEWhKB16WHWA25+eTc1AomZ+mKYY7QN+REDWR0CVlGCfnYqN9PaHOndcEPq2ZvbYij68E+UyKC+fg+h392ZkjWnuQ37oGKaT0pC9zG8AyWNaOyDliTZDxjaSbChjlzaHOpnDOBQlpcLKrDa7PnsnbKQ2ZpwWxuRKJCmNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJuSmqE+4eFVcoL1mb80VPoQtKpFfJqt5vp95Mr9h7Q=;
 b=x04zl8t+GR2vP5mQo52donUSxCCM/ZZRN2QWxElO1mkwixiN23IY6CqpzSXAKTxfMVGww6N8MuH8xArIOJjPr7m+gqQTIu8VQQXw9EahS6u79GjNoUE7EB7HK/4Y5aNuyeJzmtND6VETgMD07uWFDnL7fPh29aDR+SwnBD36Ou8=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 MN2PR10MB4301.namprd10.prod.outlook.com (2603:10b6:208:1d9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Thu, 27 Oct 2022 20:25:05 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::93cb:bdb:4f3c:de66]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::93cb:bdb:4f3c:de66%7]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 20:25:05 +0000
From: Annie Li <annie.li@oracle.com>
To: qemu-devel@nongnu.org
Cc: annie.li@oracle.com, mark.kanda@oracle.com
Subject: [PATCH 2/2] iotests: Adjust 186.out to account for 'null' node-name
Date: Thu, 27 Oct 2022 16:24:41 -0400
Message-Id: <20221027202441.3250-1-annie.li@oracle.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20221027202332.3229-1-annie.li@oracle.com>
References: <20221027202332.3229-1-annie.li@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0003.prod.exchangelabs.com (2603:10b6:208:10c::16)
 To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_|MN2PR10MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5821acd3-7f49-4fb5-69f3-08dab8595516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YAXV1s3cBpDKfeO19RgNSLhkV8unq2bVDJQufDTSfjbuyxCCKFHDuvZlbZzVwGcKBRB05JUrPY6HBpH6mWpuix4zNKzVQFVVCnjNgYMBUYog+CDf0L4S4cdA8BasIqzs/BTP2K5ZKTnwywDNxvJdvtoo6lQvOVWNJQHuywc3Hgo29DYXhQCrJdgWRfjndPcOImLuGaJwz1JysEegf4aeyhgyhvFyri+UNdao1KG4GIOxevNVRC5HMjybw8To/3w6+D4KxiS5p/n41QhJ9qe7eI7nh8SudDybMw47YER8FXgrKueU9kdsmj14bgGjqjUN1BbLJDts8mtbrb17LnNYsQWXpPHOHTnDGm4t6KxuxjRgR9esBWIAJMVQIkcSuuYnpGrzfX0pwfr2uxpI49eogNadMyWTGbR46O1QnUTH8EEWgQxzM7RNSv92QV4C0vUOI0lERe0Mi7t4OMgfifbVEgGnn5wZJvcA7AxHBmPsYpo5AnR060fKTAiZUlbAhOngRBkKWMX7ESPV/MrRswPM2A/9C+1I3+3dW73PdyiymjCCqYKWqW1ViYW+bN0/9P9LIRqJ6nulhvcd9/eDRssoOFmlRP68F53OkyB8YdAiAgJ5XwesJMqFu05L9c8XWq0GZuxQKBlTA5qmkOO7mjx7rIjwOhKC9R6z1rPLDE28cH2WVCSEIoN2oBl4ppMtgZHrKcMCc7T+keL/AqSaIrsbmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(41300700001)(8936002)(26005)(6512007)(5660300002)(6506007)(2616005)(36756003)(2906002)(83380400001)(1076003)(44832011)(38100700002)(186003)(86362001)(6916009)(478600001)(316002)(6486002)(6666004)(8676002)(4326008)(66556008)(66946007)(107886003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cR5kO6CS5F0PfWIMUbHmbSmMicRCCc0C+NB4g8LHN4muH8NJF3PC8s8+BvCE?=
 =?us-ascii?Q?6C+lhHl3K0BKQ5d1OKEEPf3RQpuEWgZSHK0qxRMjL3C4FYXsXjeSUfH3VfPb?=
 =?us-ascii?Q?u8mg1zA0Se8doQDlTcbh7UkBMHZ1blLFmB46MI+0u0PmzXy7+CTSDFw+XbjB?=
 =?us-ascii?Q?Pq/WDJ7C1EbRq+JM/o52XL1Lsz4oCYdYGZB488POv/rAD1SYcb9QrCFjMNEH?=
 =?us-ascii?Q?efLxdLFWDb2cxtrH5EeHZ2gbRRQ6SXQIqQ6JI9Aif0Si0hWcgzlphx9mqA1M?=
 =?us-ascii?Q?/I/hj2qRjSUqbjozMBcG5pceGWd5RZ1ePv2hEfeexX696rPYJeEmFyViBgdk?=
 =?us-ascii?Q?0Km6wGNYiC+ChC1LJ5PGm/+AIIVT5Hz52mwMzW6Tfv6LaWSZNdKqPB3H8sfy?=
 =?us-ascii?Q?t8SPJI0NqSMobiXs5G2lNkmx9DpZbhZfGoJ1kR/WwlnukNx0Vw4Cej6dYzVb?=
 =?us-ascii?Q?gaL4fio4NVL1yRu910bOL9D495/epZFB8HG4Ci6RGg2mxgldWZyYvCYGS+jj?=
 =?us-ascii?Q?3jQwtLgMGyKTs8iZpyfq1gw+Jvug9muLB+HHG1ym72lfHO5fLg6rQUgWkHXh?=
 =?us-ascii?Q?N5lRkrw2UlwO638DGpH4Iy3555oGpo9XTHd07TUW2ccuC5Izpv8ool4s2l6S?=
 =?us-ascii?Q?552+CxyimG7VjTKmAaV+IRn7K7dmlyn97eZoi7badcY6N7nFz5D+ftmgjaaM?=
 =?us-ascii?Q?mc3P2Fus6K4kaoU+2jsg5IFouOFBne8X9YnWqLCFBvMCkh4SxFgG2Tavk83C?=
 =?us-ascii?Q?D2z3Qw1RvZ+VHesRhokNxNGTiE7E3U/ajZ8CuCpJ4phtQt1phZUyPJlO+vP5?=
 =?us-ascii?Q?A3lytN6vQ5nxu6g58Ybq+XaDN3LFP2rdpdvmusynYo7fDmNQcx/Q1UcEkumR?=
 =?us-ascii?Q?i5rXO8GfIvHBSFYStCZ6sNZADxIORhVgDU07m0vu2I3gQjkD+KQ2xQ6fh1sU?=
 =?us-ascii?Q?mY/f3emLQR1QtvF12v11IW8K3sROReCwmf0uki79FYVvxQNrNOlpw+3DIrdW?=
 =?us-ascii?Q?Up0AfuIdbCVXo7P+uOMQnVOEoEnozdN3o3Aqlvu6GPotqV2Kc6WJ3TeFKSTy?=
 =?us-ascii?Q?DqSxAFcMXL3YaVqA7t3vj8MLVw/z334jsrf9pZ3k3VzpxdEfxAmrUFuC25Ou?=
 =?us-ascii?Q?OTqof0R0RZrquNb+FEjP2rDE18iF/ojEkUKAE1Qdj/3yu4Rbvaw9y2QAlstt?=
 =?us-ascii?Q?faebE9dC+smJwldr8xL3FXgVwYtWLZ9EN/gLMqkNuoGDGredUnqJr3t/S2gc?=
 =?us-ascii?Q?uM2SZ8P+DUapSca31RGLicZAErSajlUNBLRZWPK9w3atQFryeIMuHEg+eKCf?=
 =?us-ascii?Q?Dtx8hqubYnoGwi6wtQEtTGlnDiYBpLaozaDKOj2Y9U/jto90v4WeQ8B8jNlZ?=
 =?us-ascii?Q?ACZ0ny6wN2kffqI4bhaRYY1WyGOT8zKFBpzXQR0SowEpCQK353VEOFGttWcm?=
 =?us-ascii?Q?k+r0DeEfejUTiRVRzljnGEZ8u8fzpJYqXy1VfpbUCsZ6cTxiyAP8Seu6XU2A?=
 =?us-ascii?Q?N2V6+BwdaKDe/qNUlkR5HstngGL+rlaSE521WNl01YAomlZQQLYNGKzC3/tD?=
 =?us-ascii?Q?boKVhRZuBFY4p1tSbzpZ4Ug+2Yig9c+Jze+Q99EC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5821acd3-7f49-4fb5-69f3-08dab8595516
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 20:25:04.9384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1SRaKfIGjXdXHSbl2NOEGTLdKnRJPrb2cS12fEqX5fHNUyNmScHrNJnVXBL5DThN82PhxVbtcg8SSZ9t4W8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4301
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=971
 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270114
X-Proofpoint-GUID: 2WTbn1aA3u3mMiXqCQF5-Pk08x1zrtiv
X-Proofpoint-ORIG-GUID: 2WTbn1aA3u3mMiXqCQF5-Pk08x1zrtiv
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A recent enhancement for setting the block backend name fails test 186 due to a
'null' node-name. This is expected; adjust the expected test output accordingly.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Annie Li <annie.li@oracle.com>
---
 tests/qemu-iotests/186.out | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/qemu-iotests/186.out b/tests/qemu-iotests/186.out
index 01530040e5..27316bba46 100644
--- a/tests/qemu-iotests/186.out
+++ b/tests/qemu-iotests/186.out
@@ -57,7 +57,7 @@ qdev_id: [not inserted]
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
@@ -65,7 +65,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Cache mode:       writeback
 (qemu) quit
@@ -73,7 +73,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
@@ -81,7 +81,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Cache mode:       writeback
 (qemu) quit
@@ -89,7 +89,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
@@ -97,7 +97,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
@@ -105,7 +105,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -114,7 +114,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -123,7 +123,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -132,7 +132,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -141,7 +141,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=null
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -150,7 +150,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
 Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=null,id=qdev_id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
-null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": true, "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -166,7 +166,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Cache mode:       writeback
 (qemu) quit
@@ -178,7 +178,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Cache mode:       writeback
 (qemu) quit
@@ -190,7 +190,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
@@ -202,7 +202,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -215,7 +215,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
@@ -228,7 +228,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
-null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
+null (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Attached to:      qdev_id
     Removable device: not locked, tray closed
     Cache mode:       writeback
-- 
2.34.3


