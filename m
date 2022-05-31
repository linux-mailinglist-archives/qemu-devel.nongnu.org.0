Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3A5397ED
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:24:49 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8Q4-0001VS-5c
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1nw8OB-0000ko-SZ
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:22:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1nw8O8-0007tC-Oj
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:22:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VHHJDn002524
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 20:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=SDKl9z3KTq9Cs43c1sXaoU3uS1OrFleMVZdh6vS2u7Y=;
 b=tDNGeHY+/6V56EH8tPhsjRmeBUXOZgiBsYfsAmhFVgVl/0fDqVd1oitd92wyeqi9EXtu
 ImiEz73kGGeaMGe52xVo3NWYlDtjVfpkJWvgJe2+cjUZMvoJQcmL1bzAxZ+SD8Kxi2tT
 Ncf0BvyjnUfPJAncnCuo+JbOVzIiIH+S96a4fqCD9XA+e9SUgwUeoPu3vXug93/1NfWn
 Wryu94bVq+j54K7mNW476jkAcXuBCp11Jbq9Ix/qwp7IQLu4wR72qctft4b361wFlImZ
 3x7ZhnaOBcNX99n3iB7YqJmKnrDGCJF2KA9uqQq6Z8R7ny0+fGZudaFk+X+mkmsm1CUB GQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbgwm5t1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 20:22:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24VKFv0X017566
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 20:22:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8hsrcv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 20:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Agka2zzFn2FWWo4wseq603xGTfCJkTppI+Rkj+lAxGYiiRYdLK6E5JHgIeE9hi2a/D7X6WCA4EDZcBePK8HTfjbt0biPjcXixWTAIqsoQLVzpTls1dI89YpEUsgHn2cfMKe/k5PQZcsSt4CMeHVi9DWHEwlg09TJkBI1TCeSgDVKtQ7QwljW+tCKjKK2ThXx9B1M1dAur9BrFU7JjInMRUiUAQ0acVhrB2j/7e/kjh7GJmVNiL67SpQNdj9O0/bGrn+DHii6sJgEyUtdJ4id8kQ5L3jUvn+GZxraPi5MySntNaHNxco3V4wLImVDu6vlBvHimYPV76dTtqrraBeNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDKl9z3KTq9Cs43c1sXaoU3uS1OrFleMVZdh6vS2u7Y=;
 b=gUEaR3UikoiWQd44lq0IXJGN6QAxOwUWFjj+LhI6IOunuHbJpVMzK7uO40oZdN746Igfd3NuhX0yyysGNwRViwL6BB5GLBKQSILyEdNXTLibZL7DjcrXn8iXXtGss5QrbayoWIH4emDN8UMob5gBGCpXAMc1TGiBXZe34/F1Xtsl1jruW5cPdpVh3GvQefamJHOR6M56uheAKAFrJHhd4ZTZD7gLojmIvqe/ixnd1tFGdZol4/It8EWNx/nL4DxeQ3zeb3zaAnGYtyDATGZFZQLjf2OHujanPeFPWH7OlDWvMu0yez1yruqENimTIbijLhcZXkngz6Hs3PTR0yyuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDKl9z3KTq9Cs43c1sXaoU3uS1OrFleMVZdh6vS2u7Y=;
 b=RzJX573zu+dKYzq4ZcGYzR4Ytjm04HshA9EIixwX5c6TnD1x71EEPYHPqpYvPaLg6DeprLqUVRRDL/ebQrzmutAwDmX+aVuoB2Rt/L/CKv44/Odai/pos0wTOkDpiWWPYibFfIqB+NuFxwbjdo9xw7dD8Hw5zlG5XajP/BVz/Pg=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by CH2PR10MB4167.namprd10.prod.outlook.com (2603:10b6:610:ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:22:39 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::286d:9e89:2450:f0e7]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::286d:9e89:2450:f0e7%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 20:22:38 +0000
From: Venu Busireddy <venu.busireddy@oracle.com>
To: qemu-devel@nongnu.org, venu.busireddy@oracle.com
Subject: [Qemu-devel] [PATCH v1] virtio-scsi: Send "REPORTED LUNS CHANGED"
 sense data upon a disk hotplug.
Date: Tue, 31 May 2022 15:22:37 -0500
Message-Id: <20220531202237.274483-1-venu.busireddy@oracle.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:806:24::35) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f79ca6c-17da-4eaf-c9cb-08da43434ead
X-MS-TrafficTypeDiagnostic: CH2PR10MB4167:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB4167D5F401C54EA792FA3831E6DC9@CH2PR10MB4167.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOMdrjGC+2OcRq8X4JNySauwokY2alsWxxa0rauYEaCqZFNYiie1FQI7wNzacb9d4mnzG3zYe/OA4QFP6aOpP2PEc0/GvyLjcM/Xs+H8hT8n0F6l5ihawAevJ5u9E8ux0IlItgwPKUc51hObsDyR/95o1rmxVhHHFmI24LkU6qAaUV4n4Ot+IHSYLpO2dOkbgunxjnT46TbymLajf3M2kBq1QftulodcMZXFVGzJe60mYMKI7mgasfXclAXHEieZTUfL+fuFMVw3gwwxhIlKQ90eLk4yZFkBrNQ0XLZW1obRw+bLlFv3rhtDkAGPFLlLyc1z1fuOJ3kopwdNdJoVgbADzY1AOeH63mEFQTu4XQdy1r3NbLw67X4e25D5VPZ24kvKKyi/4U/IgN+7nWpUZjBDd0EOzxmxU/3hOScbk3LaxgffVkCHw/PKGOxT6tFTbjJogHrnrkgQF5xUF8nauZvJXTPxwqkU9qMUcyU9R/SBbvOA2/JoTn1LvEXjHqWo3R04qG9w36KMWomXMy71geISKdwdKG7zd38fJw1ced4QjDYwWepCix6QHEOL4pwFbnH/7leazIEIA0Q01bEX6qPVDM8zm4rsbmZa2nJUVw8KeVNeybm7K6qpw2lgdA9MIpInuN0Sf6A7QlOOvVgH2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(83380400001)(38100700002)(508600001)(6506007)(8936002)(5660300002)(66946007)(66556008)(66476007)(86362001)(6486002)(26005)(186003)(36756003)(2616005)(8676002)(6512007)(1076003)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SuHThQZHLH8GMHTLGTZ2MHhNFIfu05IwigbH8LY4MqDQyvRpgOMpkam+31pK?=
 =?us-ascii?Q?ZPEjWGiAtLAJOawjhijQXORq4wRNcxc52n0vEZz4lUGjTFFMpG94q3Tdd7XK?=
 =?us-ascii?Q?0bu+BbLDTN24DzTwaY6jwByDUf6TMwK03bLbDDjsi5seD3VKNRdFsRMT41vl?=
 =?us-ascii?Q?97aifR2vSuwLlHKWjdjtxn9xsLxM0nxft7v8QswxFzzfT3uyeEaGc5HBUQpp?=
 =?us-ascii?Q?tzHVN4kkMlim8vnb3ABIPD3WqfO9pIP6rw/i5q8pQVjb07/KnYzbBWPYE9vO?=
 =?us-ascii?Q?gb/qAJ0q0BPn/cAdVSmZpOp+6qOQFHKfQMvVF2BY6LD+/fYCIz9chPRNC3Y+?=
 =?us-ascii?Q?UZ5yKfEBs9weVJA5HqWl11udvYjfHgTe/Gl6kQS660J9/jpB7AUN14hS8ydr?=
 =?us-ascii?Q?kqJjjcxoZ3C3L6RWB6KWwVtOmVd+TFsDZiWEwIc/3qa6qHdAyDfkg9L6MtzA?=
 =?us-ascii?Q?NG12EGZkcBLrjPi38N67pO+gyBcjR1LRRCWw6zoggsSYqaWa4AWRi8+/IJnt?=
 =?us-ascii?Q?o+qv1T5ea/ynnI5rH6fdOODH/NcLcTzpWUpIj3zpQ/6Zd6JsRGxVsUMewZeQ?=
 =?us-ascii?Q?XWAs3EBWYsowX3l4ANI/i82RAsW/QpjtYa6ftpo3/fkftjM0HISTb5o1xhI0?=
 =?us-ascii?Q?I1uG5X3DbGc4pJ2FD2v2GtRNNZXEf4rIbx6wjkkmUtEyH+hOYY8RBLfkRmng?=
 =?us-ascii?Q?kSWpeNyyj9WB6FWj9u4x/6gJuy5iQsxvKr8HA7eCWHjXiJHWuDjpUydaGRKp?=
 =?us-ascii?Q?3sqABytIa3htOky3+RV5tLnzJM+JryZdOThJTNsUwuDmJm9wkioPoXUuOz1s?=
 =?us-ascii?Q?6qIwmtwkl/VtqErTlEff21F51XXEo/ymPd3UdIv1yKxCHq2VmI4pAliMC7Iq?=
 =?us-ascii?Q?KCIzWqBwGN6BqTEUFXfaJ2wTijQiXDbTbrQrWYltwLFKtEyH11slIU53vGQl?=
 =?us-ascii?Q?TmOGfDkKK5c85+xBi7WxRbIvEui+lVWge05Px2oJxRqwPe0qNWYYJjZGeaBf?=
 =?us-ascii?Q?5cIpbZ9aJElJcl7OZLELfIhFWdQaeVuEHWMqXxhYbRiuZ8MwAuRUs6+2vSHJ?=
 =?us-ascii?Q?DkCOELalpWdGTgiGNkZtjUb34mhV0O+GpsHB74RAY1N2rONKHlSXUervv6Zx?=
 =?us-ascii?Q?rCRWPoYn7/IuwvdbbZuxh0mD/FkHlIdGlPhV9+myf3lAYqMF11MtL/MxCSCE?=
 =?us-ascii?Q?wYH1zDA4IqO4Qi7yNakGHNLl1+jH3LXNrgyqfe+/6GDvPniS7M9SrUFlBVuM?=
 =?us-ascii?Q?zAT/g15YH2qLMutp3NpN0hlrnrxnaqjur12tfMP8Apctx+uPzi9ygOZjKK8a?=
 =?us-ascii?Q?DRzwYaKw+1G72/GbU8EoU78WL3hcKznwV+SOKeyrVO5hAfXw65EaueuJWR+D?=
 =?us-ascii?Q?sVIpazHNpO3hRvMKHjh2POTt7sIsiLBxNeBAvsMMSZ5eP9yQ4iQV7jV/WAjb?=
 =?us-ascii?Q?ndcQUlF7WWTAvs9WU8HMYX4QlqPXlXV+0/A8YrcVc0YS1S0d1D7RUH6wyXUi?=
 =?us-ascii?Q?uAXIekjWYLwt4h7vNxUffY7unzsYIptxpy8PnfAOIdwz4/Qq+FtmSJpU0r/6?=
 =?us-ascii?Q?waWy3mUPAfC1u6I9DXgdNeqaeSTjXCYJFOOH0gSyGtQltbJYtcvvBt5s2emu?=
 =?us-ascii?Q?xSDYKXF0RzE6MKf3V9aFHGqv/5gqEXcB1BoQTUOe0yooUQhcVZSSpddxJJkT?=
 =?us-ascii?Q?Tu2DqLGny5/zueUp+2VFyIjr/icvqY2hBBoDfH6EuJWKriTwpvSVeAHJewTP?=
 =?us-ascii?Q?ShHDeGU7xU15CwKiJ5ueIT63Z45pZQY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f79ca6c-17da-4eaf-c9cb-08da43434ead
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:22:38.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH/Avqoeabe9InYFNcqejPKhvWHrSr2vu/M8ukG+T2egMVgVnuXM6+NeSPbR02uz9EMp3xUpPqbhbXwy/X1ek9BdtvVdijNfoJegwj2AOnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4167
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-05-31_07:2022-05-30,
 2022-05-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310089
X-Proofpoint-GUID: yNiivLQhW3lsdE2gvrmo0_BJkvPPDUwv
X-Proofpoint-ORIG-GUID: yNiivLQhW3lsdE2gvrmo0_BJkvPPDUwv
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
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

When a disk is hotplugged, QEMU reports a VIRTIO_SCSI_EVT_RESET_RESCAN
event, but does not send the "REPORTED LUNS CHANGED" sense data. This
does not conform to Section 5.6.6.3 of the VirtIO specification, which
states "Events will also be reported via sense codes..." SCSI layer on
Solaris depends on this sense data, and hence does not recognize the
hotplugged disks (until a reboot).

As specified in SAM-4, Section 5.14, return a CHECK_CONDITION status with
a sense data of 0x06/0x3F/0x0E, whenever a command other than INQUIRY,
REPORT_LUNS, or REQUEST_SENSE is received.

Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>
---
 hw/scsi/virtio-scsi.c           | 15 ++++++++++++++-
 include/hw/virtio/virtio-scsi.h |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4141dddd517a..7ae1cfa6e584 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -608,7 +608,19 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 
     req->resp.cmd.response = VIRTIO_SCSI_S_OK;
     req->resp.cmd.status = r->status;
-    if (req->resp.cmd.status == GOOD) {
+    if (req->dev->reported_luns_changed &&
+            (req->req.cmd.cdb[0] != INQUIRY) &&
+            (req->req.cmd.cdb[0] != REPORT_LUNS) &&
+            (req->req.cmd.cdb[0] != REQUEST_SENSE)) {
+        req->dev->reported_luns_changed = false;
+        req->resp.cmd.resid = 0;
+        req->resp.cmd.status_qualifier = 0;
+        req->resp.cmd.status = CHECK_CONDITION;
+        sense_len = scsi_build_sense(sense, SENSE_CODE(REPORTED_LUNS_CHANGED));
+        qemu_iovec_from_buf(&req->resp_iov, sizeof(req->resp.cmd),
+                            sense, sense_len);
+        req->resp.cmd.sense_len = virtio_tswap32(vdev, sense_len);
+    } else if (req->resp.cmd.status == GOOD) {
         req->resp.cmd.resid = virtio_tswap32(vdev, resid);
     } else {
         req->resp.cmd.resid = 0;
@@ -956,6 +968,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_RESCAN);
         virtio_scsi_release(s);
+        s->reported_luns_changed = true;
     }
 }
 
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c8695..efbcf9ba069a 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -81,6 +81,7 @@ struct VirtIOSCSI {
     SCSIBus bus;
     int resetting;
     bool events_dropped;
+    bool reported_luns_changed;
 
     /* Fields for dataplane below */
     AioContext *ctx; /* one iothread per virtio-scsi-pci for now */

