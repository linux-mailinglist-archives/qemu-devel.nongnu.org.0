Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18E3E31BD
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:26:43 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Ic-0005XT-2A
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85r-0007UO-EV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85p-0004Gx-CK
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:31 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MAeTU021384; Fri, 6 Aug 2021 22:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZZndjaYMVMsu5cSny0e//bgpuCg91ravSz/nJI9JG5g=;
 b=elICUs+nD2WVd6OSKONsnVcU39Lt5Acg9GSTwMeTZSZnMEOaxXBh2OUMhQYagexGTRIT
 p1BBR7ADgrsYL7RloWFORhDV2oBg0iwAKdMJ64FVgwLiH73XmoC+JaTxfJlPUwm1iIO/
 /u2CgHzqTiuSKGFgr3wQ49UyesJuXp8E+gF/oO0i+eKNFyDyb5rmIhNy2HrUqgQGUbiK
 HUiZfgf0rpkOZQOpVnO+2lp99ETJWz0ieeQWo7Muy1uXKIRWk4o28+LFz81AG0oRPESh
 ZxIcZr4dJffLYIKwDJP1GGrMyP0x8221yYnhG38t+eaxRSfQ9FEUOuIYlwJh815G4DBz NQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZZndjaYMVMsu5cSny0e//bgpuCg91ravSz/nJI9JG5g=;
 b=knZU6m0IJobt4Ioz4LWl4luE+V41084UIgKII8DUwwfl8sxga85DgQGUeRIqBlI4Tu1o
 GsGMz5j3T9no8CKTjj7JQBkUqRBqeglpad4bdkbTRP8aUr+4yDEktEwBvLtceb3hLEM8
 iAPTuj3UGuGgaekDfdzQLlARGH6BlFFL0/hMqD1RmyrkTMaLdFrMGbpLjSU/0DMUl+Px
 Du18fUiLYTCHQAvZqKHdIlTi+IueBk1Jaqwg7eZoH94XJavJlxrx0Mg01HbddVywyGo4
 cvuda66gauY2ZnV3O57am/PzSpLVtUqwxG8tzTbIL8Ob7WiOWiUGmguwcxmyJmZttWhK ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a97hqgrn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBkbb013964;
 Fri, 6 Aug 2021 22:13:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3030.oracle.com with ESMTP id 3a962pfb15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N05oVYABYSbjtd519fujyikHfLq07rrUyWfkAbC07/ohm2Zk2KEbp8SdmUJR058k8yiRvByqT4ogd/JOYqX0pfnwm8CYyYiqnRHvhWxC7G0HxNLTKP8D0q5pZ607fRQ7o6r0hGddNC+rml+QQt/3JSH+RXQM05bNHPYr8LnLhEtqTpYiVdw1Vjn2ONdAfIl4f5edsMkfLpPVeql8NY57PMBFUXO28KR7zXnpry7xG1kvAJDD7eu/AjssflDv4j1gDZvHBvVIb1C7y6LFt2i5PZ0fwrLFsVabp/WZPPjdKA3Ay0FfD5GmbRUOoXRspiZeO/wVHjY4UMCcxjrP4lGBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZndjaYMVMsu5cSny0e//bgpuCg91ravSz/nJI9JG5g=;
 b=HFyy/6ZHlH+2Diged361G9bnc6u+ws6S50W2SeLDXnaxjUU6hU02Gq1K8NSye/KbPjOi9hgi7kJMmHM8wTSPbzFm6eSyrUE4k2LNTwcWBJIAM45Ipq8rrMZJxAGeO7VWFzAfFbEWXJf3EU6DMEDfDjtlcno9OrkWOWN5yBnYfjoHLJndgKdv8655y7YbX7wV4uX8KtOWs2rwXXxuGqkl2lrybYinDBa6OFXQBb2COf51xfY12wYu0LwusieNHEjGU0nqWftUBfP7+8wtVe/RfV5a/dZOA7GvwXEpJekV3Tp5fw5X2X4XRTc8FUXTkh5rHtUzR/UONiEixsB7QDv1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZndjaYMVMsu5cSny0e//bgpuCg91ravSz/nJI9JG5g=;
 b=WwcR4eRzVO30rZY3KNm9RMTXbfdp9RfNNPmRcKqxprV+4OKeXEf/5YZLjaA8PBSg/xknJNDsWS5o2Te9cmmP9haddikruRmruNbUYsZcx7ZIidQwFQo0qrWWO+GvPaYWyLMYyH3yNE7uz2jrfa67Cn2Bsd5ysJRMuDO05hcT0RE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:20 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 15/27] cpr: restart HMP interfaces
Date: Fri,  6 Aug 2021 14:43:49 -0700
Message-Id: <1628286241-217457-16-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b534eb10-3f14-47a9-2b14-08d95927666a
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB412996958B6CD1C6022A9535F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SLG17ujWKK7LdAbl0rFFMP6EvR54Q9Nz93Swmzd35pato9ML7Fxx6HLjfVVcwYKo2VvkXvr3D+kpeGUQxGGlRe9nH73TwCVT1AhpPtl8eCYXuKvvzsX1s6JZqPWsky26KC/1IGse6pPlY51mTOhEjwcsbdnfiwV/3nxRXArgbEhenVUaDqFTdnnsFCncpfpegliFMmeGXv9UD8DLx8qIR+fjMc8bH92IqiFWrtmNPG1+wdBVeCEIJP4z1ASivPN6I5gP2jrq7Iem1ZxYnydhwzttgHaiTOAz0Yi9evqOEJtxKE1o2Jv7/yJG8zm0CPBt/scJsFNCDMSfo3xyXHUWBEbjRAYbiKCqpWeR8hZ5Ylnb/QeU6PxXIBsLA1VLgvvCin1099VYyT7Y/gP5x829ifRlGlTrV/7GDdlgTTlqFLyLpug276uYzy7iS9sM23l/mWw11TnR1ayrP/G3jXwGRxoBLdGL2lb1FlRhNpthP++PKxvoP/OiK3f4yg0U0LRQMUxQ2YKjmHAfrYvFTSah/d7QP4CIKlkYC1c8muvBJ1ADwUTOMItux0KVcw3PcMHORZ9uQuE+M9q9nNKVxf6BR/l90HMqeXOW43uFPIHTcJWi3PpG9oqDmD2ectKWmZpOXkpemR3zi4U6CaDd5zm7WI9msD4/K4d+IlBnSOslffIirJ//tQKsb7p/eldPvwfeS51Q/w6W3LmqfHKAficHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ahKN960MdJK38/AgeM/LUg8QL5ydHY6xYspkjh65n0Ajn1vdwEwhxkCduyJ5?=
 =?us-ascii?Q?wbERl6UNIWppQzWUGDUmpATv9xVeAY7uX6Lfp4yYYKbANTI5xinQ417rTD3d?=
 =?us-ascii?Q?LOfLdrprtWq7k9i/H8QRr9RQDV1JWRyV4aYMvbrl23+zIuH7OCuD4xVGUuuu?=
 =?us-ascii?Q?+gdMVxp+QKjxLCeftwc+Pyzi+oOAGRi2z40v3ngeYjyv57boH8sG8D6dXdim?=
 =?us-ascii?Q?TWS4+1GNZL/gudlRDRSfFd2RqDs1opVE82ozhXInOjC1PdHFyoXhBbgOBKeC?=
 =?us-ascii?Q?iWUPM40L3Pc0h9XRccIeqpE3v/nvu7LP0vK4061H9kpnzmBRbBxkAndW8nUR?=
 =?us-ascii?Q?//Kf1xU9ANeGs9GzPXqR3gqFQ2bCgQba3nMnRmnI1TmLM1qRg2MSEdTI9eFl?=
 =?us-ascii?Q?dIF/Rtk0/5sOx5/PXjwncc2GZFqdvsdPAo9fbq+X9c5FVh/o2rsWU/1+5rLY?=
 =?us-ascii?Q?hOMyAvPACajER30rgLa3uhEEXccuQ9IbcNVl8ivJH5yCUMUggganHQbg2Qap?=
 =?us-ascii?Q?SzD5k5133aE6Q84bqrZ6zoeSGAiHAwGgniRu6SxTeKmoqDw1R335fkzdFvOR?=
 =?us-ascii?Q?rilxZtR7cybMnrnvtFIMtK0k2FRkJkwIXTSRD8EexusJVbfKQ8EGccd6rVGo?=
 =?us-ascii?Q?bvQEwbmJvYMTmpmDxGROcndU08lNOFb99oXqIRipacdte6XMqZafP76VGLHM?=
 =?us-ascii?Q?btBZbfDfFurZh5FeQSVPKGl2IvKwlhqBm71McVEZR+k1n2XI9AL2o7QJjrcE?=
 =?us-ascii?Q?A0Q8CIsaAlxp5iCcyOBHxxxLEvCT38WhoaD0PhdX0Xc4/U9IH0R0nA3BauCD?=
 =?us-ascii?Q?QzrB4gcYxt78mjkVbOzosQ/3rjdshl5/PUdGemxiynkWjr4nrpf4gya714xX?=
 =?us-ascii?Q?F1D9aR27JfKCqTbpHiOjPqaoV+TE4txj8xy7DMXtx1SoRFzdBGoQH4n7xuqs?=
 =?us-ascii?Q?gGn1rOrthFFnLVfnTeYH7Trf3mzGq09MJ/ElSf1Te7X6v5grGTGDdjux3aZl?=
 =?us-ascii?Q?UYAiu98xle806ivrTVi80DW301VBP0RS6OlQWQYo0AxExxSm9NZMxzAPxOYd?=
 =?us-ascii?Q?58d5BiZVkSVqBPbZ8NSB5gu/t5tx2iYSGbSMH3dGac7G7Cb0x/K38Hft47pV?=
 =?us-ascii?Q?PPa/10o6BNoZqaZz9h92YgpCJxwtd6s1+qEgwjcSs78aZxn8kYaXz4QRlBOa?=
 =?us-ascii?Q?MwqZEX78PT0hWDx8u7krmMC9JE2ryZQ8++Y2/WzFuDfydKy8MmlxAcstIDFB?=
 =?us-ascii?Q?RCCc8eZB7/Xo3RQ4xPPIVvcSalF/PnnVEqqbgkrey6aUicaTiD+I2Wk5wMc3?=
 =?us-ascii?Q?4iBjzTT0BcnHjq7vXzq6qNN2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b534eb10-3f14-47a9-2b14-08d95927666a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:20.7735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QfqOZ4dnBNGsaemsMDCgKikuV3pGju/faj/CyGS4WYZJOkogKpej3B2iKRADpYdnuhPxZY7LVm+3FC6Aekb+qFnM+2BUcsXYZ+BIE1QEmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: keKUdeGmSBnMHQhiwn1LA6zy8D2xzK0P
X-Proofpoint-GUID: keKUdeGmSBnMHQhiwn1LA6zy8D2xzK0P
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpr-save <filename> <mode>
  mode may be "restart"

cpr-exec <command>
  Call qmp_cpr_exec().
  Arguments:
    command : command line to execute, with space-separated arguments

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 21 ++++++++++++++++++++-
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 11 +++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 0a45c59..9541871 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -353,7 +353,7 @@ ERST
     {
         .name       = "cpr-save",
         .args_type  = "filename:s,mode:s",
-        .params     = "filename 'reboot'",
+        .params     = "filename 'reboot'|'restart'",
         .help       = "create a checkpoint of the VM in file",
         .cmd        = hmp_cpr_save,
     },
@@ -366,6 +366,25 @@ If *mode* is 'reboot', the checkpoint remains valid after a host kexec
 reboot, and guest ram must be backed by persistent shared memory.  To
 resume from the checkpoint, issue the quit command, reboot the system,
 and issue the cpr-load command.
+
+If *mode* is 'restart', the checkpoint remains valid after restarting qemu
+using a subsequent cpr-exec.  All guest RAM objects must be shared.  The
+share=on property is required for memory created with an explicit -object
+option, and the memfd-alloc machine property is required for memory that is
+implicitly created.  To resume from the checkpoint, issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-exec",
+        .args_type  = "command:S",
+        .params     = "command",
+        .help       = "Restart qemu by directly exec'ing command",
+        .cmd        = hmp_cpr_exec,
+    },
+
+SRST
+``cpr-exec`` *command*
+Restart qemu by directly exec'ing *command*, replacing the qemu process.
 ERST
 
     {
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 01b5df8..90f18fd 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -59,6 +59,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
 void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict);
 void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index da91a0a..99f75a1 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1172,6 +1172,17 @@ out:
     hmp_handle_error(mon, err);
 }
 
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *command = qdict_get_try_str(qdict, "command");
+    strList *args = strList_from_string(command, ' ');
+
+    qmp_cpr_exec(args, &err);
+    qapi_free_strList(args);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_cpr_load(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
1.8.3.1


