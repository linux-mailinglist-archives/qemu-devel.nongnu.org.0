Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB824AD3F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:50:59 +0100 (CET)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMDC-0004ME-25
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpt-0001xK-3Y
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpm-0001vk-J7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:47 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186aMlU012771; 
 Tue, 8 Feb 2022 07:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Ve+EpoYs8Mu771IpCXIT8lQbQO6AkVkSbWXJhE/KJNc=;
 b=QTQSqUFOo5OBADxve1VrIL+QXH+sYulmPgOZyH0iTVJkg1KPSqtCm4d6GNcvQyLX2woz
 8ozjggdQK5wD/9hPBBMRthy7Jhxevm7ItAYdvXq2GsG2F72kyKGIJrHcFb/f2l1HzRX2
 MIq55XOY7V/ahZIKwL4fmJIWh6mA6V2PXnlmjuptvwyVoxsj506jAmG9iEa44HYvuioL
 +Q7qaeVQxsmkb/TvE06Jhf/wCf2cjNpHSxr8ZvAHCvINq7z2e7TNLSaeFk0qvL5KeI7n
 gDfE1Mn4hm76ZmX12RCufvm3BmSgBGR2APzIq5AY0r9fMJ0WQulCB+aIE2zZRj4N6Szb 7w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpggk4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYv093365;
 Tue, 8 Feb 2022 07:22:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ72v0VTIqw1dwnlRb8m5nfntv2R9NrJT64Wy9SEUhkXwi4YQLPiAtV1jdoIh94Gga6mSKXsgNdpD+ipNFEblcD8tC0WBArkliSr0W2kv+cfQQ0QcTT0gP11fIBVzHcXqcdkhC+Xx1m0upus4cBFtJVGwGSefcbYRXDidJWifVkb0/tpy5hqngolwovORDJFduBUQRWkrnumf9fXT/ejX0ERW0YWoB8TbHacdJfYkrl1gkgcqtjr26S2o/kiIi63QjNhyL1m3UCAoTzpfR8Wd5/8c0QWSSljUaKcTJIorNCb7mslggTjrbA8IdY2pwnexCRHDsMhErtDW6ZZWxFksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve+EpoYs8Mu771IpCXIT8lQbQO6AkVkSbWXJhE/KJNc=;
 b=kA89L133VI5bI++wYpRw3Ufqc6UEojcF15KJVhAvMIuD8ThzacyJ1X1MkGGosc0e359iNBB34BiHcwbB2E+qffIwctByrxllCNd2YG6x1/Dqm6xinsJVn81UuiNUcmuWuIA5iWml69R7ZRFmxAIiP+wQ5xL1f4UzOSHO6B3IVEXg3Ja66jGzNyEgPdIGEKAJ0JI38rDhJ0R/Mv0eT1ygonjUp3nvbdT+O0bXxPZAIBhYXrldDyiVtCe616ktAm6sc3Xnq8iOnaALEeshA8iJBkvyVbQSLsCZ/lirsFUIfnT2g0ouvMlERLdYezGwQ7eL2A2bFhZ+0+fZKq7He5ROOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve+EpoYs8Mu771IpCXIT8lQbQO6AkVkSbWXJhE/KJNc=;
 b=hg70T7qYzc1vjJJNLKiBCwFuFsEfa/T8a1DV/SEc4eDAT6MNh2kzB8NtT9qUS9aBbprCDbXubwRiSQIqn6UpUW0tM6XixLtWnfXRot/saVS0vaMRxyIzpYx60hF8aWqdtu5sxYE5xeekWPZ0E7kjh9GWoHv0rpRaOB/u/XaBOl4=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:35 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:35 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 7/8] multiprocess: add ioregionfd memory region in proxy
Date: Mon,  7 Feb 2022 23:22:21 -0800
Message-Id: <b5acd54c9cf394499a10ee1b629eefae6d9404a2.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69b69c4f-ac8d-4379-0ee5-08d9ead3c78e
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608ED86D31E386F896121F58C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZ7wzf+s8YV/rYs/wIH//pgF9eYA6475VfCRt/f+ujMG1EVBGJsjqpv+Ajv3XQBcFT6+Mi1F2WZdfokaGL46q/YTe32mFzbc7jijNZLewpC6MfACrsyKmrgKywfsEVNhuEk/ebKzCCc5cdt5d8fdPrg4dCgyKIHcL3rxXWdTpo/8NNlGfyiW0sTma/xoEhT70GUUgJQADWo+nMEq7piHLMkNG+kkRAC5KsyfnW0OOwd1sDZ7q2z9UqujvGDJjFSNJg0QdS3ILfUDlcjM7E2Q/qhDDvhWjcufKO70Oj1FnkEsnZkttT75th4ZoWGKAaj/iQp07AQeS02En4cwMLpt9m8A7tQqkLhhubPVtypADqKUluQgEbd26OPQ9sRcHPDBMWkeN5HUKwUl2czg/5DLw1Sps3gPz9U3r87RCz2RNCEYi2un3oB/Qd4hec//SP1pEHJGLDROfHofbJqdWjDNpVjWNzblbf9NcczRnKFUkKK3GNNtjzCmcHkwhvHawEVTtBAiktXRlEAeXzjuz/FEFxChEylE9b2qI9MJLDA3V6+aqPkBI5fWV145v1IYZ/27+x2FMkOWjHXNbJQ78QnMjJqRstFqBIom/JEbLD0Ah6oHB33F1c6SgCE13PIeRKz+nETt2DHEq6yonzqzet1nCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+VVDIeiwzjdYxaIssKSWkujOXUf+sX0kvPr6dB596UShpFZFB8W5uFmYFeE?=
 =?us-ascii?Q?NZPRJrff+C2+T3Mq1TBsurMkKNRdpuIN22i81naN5xZ9ZUd2kjuGC/rRiwRD?=
 =?us-ascii?Q?H8Oj0Unky6eDyONlfa+m2wGyBnF/bDiLRwT+dvwlTf+AGslqjfiPuokbrllZ?=
 =?us-ascii?Q?0+Uc1h7HxPmW9P6GjJBbPFXMYkOSkzyHeLEGeYZCnweXxvi903N962zdx9zC?=
 =?us-ascii?Q?zZQxS5HpE3Mw80yR88jpi9piHwubqcSpZdc9DnDnPuZIMc1UIgl+c+MetMfH?=
 =?us-ascii?Q?gjdIcnCGWtUKe/aC3f+6gVYZSuswDGn7I19+7vhZAGD/p8bq5vPJf8DSXVKz?=
 =?us-ascii?Q?O2UokAOIhE83SygxdCOIQyA470R68Zx5DYuNownyDGy189RbCNvwOhyLL5n8?=
 =?us-ascii?Q?0Aez9Xb23vGzJvhbuhkWOgU7uOmSjuQ2OGEmUJX0D1mn6z5cFA0diJFeP9eJ?=
 =?us-ascii?Q?zcka0fCkJhndgdtD6njs8Pw7oiIg1pxN50HLvPceg5CApSxaJIBHMOj5O5C+?=
 =?us-ascii?Q?Nl/IfXEuv9dhV8/juKEBRxf8mt5wxcaSyEEteZAO5Fh61EQGAqlWMZyrnWcv?=
 =?us-ascii?Q?D6zU992Xn/ftJoFkc8ycTagGB1d+qHcV1v37YhkoDd7GEMNA21PkMhl8om9l?=
 =?us-ascii?Q?Qu1144m+Md2Rt+CBGWAuO+d5iSwRwkQYzSMLYlm2J3JKBLAv2oHuxHG2rztP?=
 =?us-ascii?Q?d04SUi83EfUCB9OCcZUApiPnR7XgGV+RxJc5y5qcOwFgofI+Aat8Wk0MOupK?=
 =?us-ascii?Q?nKTeHXol4OlAVqKOz77RvkWnFTYQM20rPX+h3SClR8vVC2db+s6rBCX/XgZc?=
 =?us-ascii?Q?7eoEJr4WeCqHy9glFemyDhUebtmOC+3i19VB/e3C0dHIIL9QHEfi1dAMGHLP?=
 =?us-ascii?Q?v5TLlijPujo5SPLJ3BoFdQEauvJYUBI8JZN9Lz1pX/GaUBj8KQWLx8nxRWHI?=
 =?us-ascii?Q?1BtT2Cz8EG9jwkwCWAW1EYS19jPCcHJWFGEkGlLD0sWJbGqa6OwyJWskLU0X?=
 =?us-ascii?Q?+I5E3uOvMcZ1j/afhnEpu4qrFUMkoFU7SJmxMkzIhmbXXbuHtXir4D6QWYLV?=
 =?us-ascii?Q?VZZD+GDSLKq9pJafPV137OMJVw79I8kw+McRmcaOFcivulnoKiMn0n+eyl3x?=
 =?us-ascii?Q?5E9L5CJIAQVP/AZwN9Mr5pE5Y4p2LxmSJYp03sPygCfhXl7gK8m0YRm02IUl?=
 =?us-ascii?Q?ftcYbezBPvDGVx9AKwfqW7s8VRRc1MgMIAbKPD64dHwUeIytRR2c9DNFakYI?=
 =?us-ascii?Q?dtrfB1TgVlp1lSA06rfy0NlgEy+CaKffmqS3qF/P5LAcvfu1B+rnHBmQ/5D6?=
 =?us-ascii?Q?gt+bOylvULDbRnIbM3VfCZ5G/S65YFKfClgjMO5lp1rqOpGn0vCPsMlrvX15?=
 =?us-ascii?Q?JONkVwxkTPh05iE60tMIHOIVNI9AF1HiHwsKFs3gvcHKLLcaG/gb2VI1vUm8?=
 =?us-ascii?Q?hzl+DAcTt28+OJWxvvuGucfh4+w2cHvU2Zf0oNkMAawLmniBYel8bVSaHjAE?=
 =?us-ascii?Q?oQ+dt2vS90+0QwxP+LTyG8qlQVIrsoIHVE9q3+2RfK8DptQW41IDsWsO7sg8?=
 =?us-ascii?Q?yzvvA0MMDeDUkZ9HjwTgs3/1xL/cTszn1/pzL0Dj8S0Iz2gwtLRZhmQKtJn4?=
 =?us-ascii?Q?ufJ9dsiUeczaPcIXPcUB6ca3ILnv0pc2BvDqJJ/MCBquSI9mnrBDx2IA9Ywf?=
 =?us-ascii?Q?oII1LTLh1w+cMSFj8SbcMqK8AxHmLlYiw1Byb8B/9oQ4DBLMKky8YKJbYFR3?=
 =?us-ascii?Q?s1uQe+DvaA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b69c4f-ac8d-4379-0ee5-08d9ead3c78e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:35.7860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mI63f6tf9JjgcxYSeAvZO4TRq0hKYIdbecjLf8Sa0LI+Ytp4kAdzgZXJCoxo7bwVYMVEESmSG/z0Ew2JxLoGta42uLLbiJ3yD0Ueqm2lzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-GUID: 5CBlmOnHdjcGbkkXvJs0juVm8QVkCcVU
X-Proofpoint-ORIG-GUID: 5CBlmOnHdjcGbkkXvJs0juVm8QVkCcVU
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/proxy.h |  1 +
 hw/remote/proxy.c         | 66 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index 741def71f1..9efef0b935 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -29,6 +29,7 @@ struct PCIProxyDev {
     PCIDevice parent_dev;
     char *fd;
 
+    char *ioregfd;
     /*
      * Mutex used to protect the QIOChannel fd from
      * the concurrent access by the VCPUs since proxy
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index bad164299d..ba1aa20d78 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -146,6 +146,33 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     event_notifier_cleanup(&dev->resample);
 }
 
+static void config_get_ioregionfd_info(PCIProxyDev *pdev, uint32_t reg_num,
+                                       uint32_t *val, bool memory)
+{
+    MPQemuMsg msg = { 0 };
+    Error *local_err = NULL;
+    uint64_t ret = -EINVAL;
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+    msg.cmd = MPQEMU_CMD_BAR_INFO;
+    msg.num_fds = 0;
+    msg.data.u64 = (uint64_t)reg_num & MAKE_64BIT_MASK(0, 32);
+
+    msg.data.u64 |= memory ? (1ULL << 32) : 0;
+    msg.size = sizeof(msg.data.u64);
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        error_report("Error while receiving reply from remote about fd");
+    }
+    if (ret == UINT64_MAX) {
+        error_report("Failed to request bar info for %d", reg_num);
+    }
+
+    *val = (uint32_t)ret;
+}
+
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
                            int len, unsigned int op)
 {
@@ -198,6 +225,7 @@ static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
 
 static Property proxy_properties[] = {
     DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
+    DEFINE_PROP_STRING("ioregfd", PCIProxyDev, ioregfd),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -297,7 +325,7 @@ const MemoryRegionOps proxy_mr_ops = {
 static void probe_pci_info(PCIDevice *dev, Error **errp)
 {
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-    uint32_t orig_val, new_val, base_class, val;
+    uint32_t orig_val, new_val, base_class, val, ioregionfd_bar;
     PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
     DeviceClass *dc = DEVICE_CLASS(pc);
     uint8_t type;
@@ -342,6 +370,9 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
     }
 
     for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        bool init_ioregionfd = false;
+        int fd = -1;
+
         config_op_send(pdev, PCI_BASE_ADDRESS_0 + (4 * i), &orig_val, 4,
                        MPQEMU_CMD_PCI_CFGREAD);
         new_val = 0xffffffff;
@@ -362,9 +393,36 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
             if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
                 pdev->region[i].memory = true;
             }
-            memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
-                                  &proxy_mr_ops, &pdev->region[i],
-                                  name, size);
+#ifdef CONFIG_IOREGIONFD
+            /*
+             * Currently, only one fd per device is supported.
+             * TODO: Drop this limit.
+             */
+            if (pdev->ioregfd) {
+                fd = monitor_fd_param(monitor_cur(), pdev->ioregfd, errp);
+                if (fd == -1) {
+                    error_prepend(errp, "Could not parse ioregionfd fd %s:",
+                                  pdev->ioregfd);
+                }
+
+                config_get_ioregionfd_info(pdev, i, &ioregionfd_bar,
+                                           pdev->region[i].memory);
+                if (ioregionfd_bar == i) {
+                    init_ioregionfd = true;
+                }
+            }
+#endif
+            if (init_ioregionfd) {
+                memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
+                                      NULL, &pdev->region[i],
+                                      name, size);
+                memory_region_add_ioregionfd(&pdev->region[i].mr, 0, size, i,
+                                             fd, false);
+            } else {
+                memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
+                                      &proxy_mr_ops, &pdev->region[i],
+                                      name, size);
+            }
             pci_register_bar(dev, i, type, &pdev->region[i].mr);
         }
     }
-- 
2.25.1


