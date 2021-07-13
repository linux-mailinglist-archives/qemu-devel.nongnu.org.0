Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D163C679E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:49:11 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m36bm-000622-7z
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m36aE-0003xR-Oh; Mon, 12 Jul 2021 20:47:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m36aC-0005BU-ET; Mon, 12 Jul 2021 20:47:34 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D0fN4X019971; Tue, 13 Jul 2021 00:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=PpYj0NShJ4MFJUa7pWD+OofVyv73wfgpbrtB/jWDVD4=;
 b=kUIWLRbd4IqwM+7WAtjOaUDCUyXXPKgVAqu1zU3G9vLILditWSleURwXjzINQea7aaVC
 WJyXGBeCF8ri/JyCMv/mxgUCYBxspqoB8t2rW17HyCj+D2KDStUpbGoHb5sEY4uM+9vA
 pYk7vSfOMo3iVxg4xAKxZeOSCxAn3UiCCXwjrJQwRsduMkV+Bbu1+XnHTMvPrfutGKOC
 2HT87ZVdDzrK5cccOS2lhHp5f+gJDNZcYaR6a06aXaTzXWMpTOCA+okHSFnBmFpy5XA/
 4JgTtvc5dRfy2KnlAHpgWcyovmE/byR5O/nl2Q83TAcjrLn/hiSPus85mb4kiMkVHaLm Qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rnxdhcxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 00:47:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16D0ev9B156275;
 Tue, 13 Jul 2021 00:47:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by userp3020.oracle.com with ESMTP id 39qnavxde6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 00:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYcq6DHovkZ0i6PVu5r0rDKCVy6vlEDALcGfAeDv2VAjESBL42LcVxD9NnamRcg9CYuyM1dg1lx7DVzKgkioKP+iHoIf4FM2C1c4wgVJwPtB4Iz6iVeNYT8EVw2N8LMxZfBig/GE9OscO0R3SJQZrqyYV1kEE1oKb317+knmuQDxB8UoptTzUzIa7ub6eyl7OVBhqM44nkKPKOvYrMfGw0WxN77BHQyiVNEooB7F1pa7Sjq4daWemw2DC5LIQtz+GDdWbQ6+y/y3kmYhIWm8JqKNEoS7g3UUkoAGAfcHzr6ubE0So8DkWiqFdgUtaZEcoiQo+elod24CX2TfE3I3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpYj0NShJ4MFJUa7pWD+OofVyv73wfgpbrtB/jWDVD4=;
 b=VEsXZJCwTTFZqs3Ng8JjuigD7wZ0rG3fArpZNUjE4L7m/3hYVGkvsafDAyITQuv5e71n7Ss9CN6/T6lYCE+GErZzOGzNMDmRXl136p65cucsz4sD3UA7EqongNv8U2tJjq/tq+zz+tgvzYNx8ODppAqv0W2N46gB5mq7LfnOCuPCVQdZ6q9sPzopX9uDikC0B9MfVPFXHL5EsQNiffvkLnSiVN9cgJrAc1qEqirE2At1z8hYWaVy+1rRWT6utuiBkNEW3APRHoGs5T0Lo+cK13eeDHd5SyOo6YnK/fj09qh8Otjk7tpqVKpkFRKN17seybK1dqxVOm1nCZ6nKlYuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpYj0NShJ4MFJUa7pWD+OofVyv73wfgpbrtB/jWDVD4=;
 b=QYhCwBe4lDc2nxLXBQAgSd1VN4YSV0aPzMf8YQa82i34tuSlz5Sz/snJ2gvITBdPEyxhuQ61HmShxuvbSIYK4I5GODlxqVis9J8gwQ3Swv6l45djhBIEuHGjARneld5ScO6S8kUfWWl4Weubc7DOZoy2XNqBMOjjRfWDhKmEJmk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3809.namprd10.prod.outlook.com (2603:10b6:a03:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 00:47:26 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 00:47:26 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH RESEND 1/1] multi-process: fix usage information
Date: Mon, 12 Jul 2021 17:47:18 -0700
Message-Id: <20210713004718.20381-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:806:125::8) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SN7PR04CA0153.namprd04.prod.outlook.com (2603:10b6:806:125::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 00:47:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f7cbd77-739b-4eea-d887-08d94597c897
X-MS-TrafficTypeDiagnostic: BY5PR10MB3809:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB38096BA623CB2BC2F54F9606F0149@BY5PR10MB3809.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: maL15Jm13W3/VDWkPQ3PHSbV2Ej3G182nOaEsfEfkJYf4/E6GNT6lodshT/AQQygrpZtoCgJcDoSvel8CFicghPm/hMIP+2Zty9CcVUSzmZRUJpg2yclDkAbzCscC4376XW7zvH0AnsAzTBD5ticqetkV6MC9O5/0zrXdC3N9W3vahj8WCCe4X+iyoX1Q+Cv1Ig6uXb3yWFOnhS0BpiFnfjyFsZzofGFMyy1es0XLECMZSzRuWGaLee8IwuPuNR0oIzVcAwmRApGWKQLY3jeaazBJBEvJkDN8rypfLmf/XyXm7FhgglFl8yjuppMRT2R5W+yn4pPqHbWFC716LWrYc7LOrTaGvQYAMn9IzCbpdQnCa5iYUQMuOkb/zRhY1wT9sL6Kzfy6A1OU3yJ3qPWEu5J6w3e1yMuBh2+kwxnVp0oV+PUb+ZQnZCPMdEiU9h9Rm878jCZzArDA2yW9mcXafa5vTpJPWFbaemAkFhqzPPEtjXWA7LF9Oc5q+TGkhpC9YcFX7sCSShfvx7dGoXDXzEo+tEP1t1hHhhEfeQoNByd7ifEHVAq0anMMEuJRbZhznMoOI794t4PWbEwA6AViBr8ibeY6r0nHJZsL0oVhFxuB2HGqehIdrrIN5pl8KUePpLyfSvEh7Bu1O1UNsnTGwJ/KgWODzrjBCYl8eU0Ko3yhMjFZMu3MO9GQpj9KEMNWxf43WqZ3+95bopPHr5YkFndOjNJCw5R/TxwQHXW2zVdJ9OlZyEEqKXytiU90WK7lCW9YYVISs3P0Yqy6yB8AJmpuTY9TEB8cv4qhTOxJ0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(376002)(366004)(346002)(396003)(8936002)(6506007)(44832011)(956004)(4326008)(86362001)(186003)(8676002)(2616005)(6666004)(1076003)(26005)(316002)(107886003)(66946007)(5660300002)(36756003)(6512007)(2906002)(478600001)(66556008)(52116002)(66476007)(83380400001)(6486002)(38100700002)(38350700002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/v2JOMRpTnW0jft3rDrDUETt2hl/+4HKyi80sY4Y5UsNGCUBNJF6Wo8ulb4?=
 =?us-ascii?Q?dJdzG78QgMCZtcUenQ/Yl4NTJ+QlX9TiQrSLEEJoEZ6+Q9SnnW1GT+Zncij+?=
 =?us-ascii?Q?JKMFBp4j6Uekbwp8t7Xn2vezciIpc6F9J84VFRg3RnjYfoiFmphARFE8ep0O?=
 =?us-ascii?Q?g3xg+dF6rFs/uT34KZ61rklVlxasF2i7agTawn2xQcnVPPdZEMIJwQxVNNyQ?=
 =?us-ascii?Q?2Po28yZVSVwxvD7bbyY9BH6pTsNd33aw5Le/K4gouuDoGl8U53YtIcOhQbkD?=
 =?us-ascii?Q?Smjedm4PxdHjQFL8SsyUKXc4yg6a/2YTXYYs+TNqU9jW5AMXS4oe5U1CbpnU?=
 =?us-ascii?Q?7Umklsa13cXxYugHpKAJmjRYgZRnnVrFTXMv6a20AbQU7I1HmO2TZdxhaVy3?=
 =?us-ascii?Q?+EU0lsPgVpWhQ+IWa8c9w3GuRuQGRcNu5uedwVIAqBw2AjRCQueNRSYRQksW?=
 =?us-ascii?Q?+37rD+uY4TgnmdCObHCDAgAr4lKTTkwqfMwPMvJy0zmhPk3SQGrwtCU8hnWA?=
 =?us-ascii?Q?Gmbfs3siveF5YWBKCQziJilPfFWHQXMhtlGXu5PNZ+Mb64GtQW614JJtGl+8?=
 =?us-ascii?Q?+aA0tTvj2iKg7FU6KWaIvUuYPYjT+RvVUvh+FwJlkx1nh4MJuX7fVMK9L/6b?=
 =?us-ascii?Q?UqHaKSO1/wBYpf+RjTgjwbWKfCX4Bv1TwgRJ6OTpUjxMnT/OAQmeV3OGq8Nk?=
 =?us-ascii?Q?zhpCMJ8XY5cbkZDm9IndIruW5H1GGrrTpX+bvlpCcRr/k+WCFwyYxEIUEErw?=
 =?us-ascii?Q?S3myNuBwVtYj3HFLdEKKIN5qomiBS3QIXwhXJkl2HX1PCPzwlAupo4/FdmIx?=
 =?us-ascii?Q?7dIyy7o2AUaRaGBHozxjqwe9T4qok13V+vpDTMfOjI1O7NOWdrnRHSGoQCvQ?=
 =?us-ascii?Q?3I/qOFbCvdxbSKqqy9X7F0zXK/4EIsvL7RxCIdDSk00mIlZ/HKyjBtVwC04u?=
 =?us-ascii?Q?EAVgmRSlPQkyF0CCad3ilAc9qqxeMatbgCHdTRXEosWm1XUsLPRw4Ahswjdg?=
 =?us-ascii?Q?5GhQwAgSVjxPKUg75zIt4Rb9B0y5IBc0UAUMhjOlCMoxN+J/BnmuUwUfcyj/?=
 =?us-ascii?Q?LFb5hdL1AiwI+89WFfHFOJ0WaBVpZUqmtr4aPYsv51fIUA4WlhpIFjowfSN7?=
 =?us-ascii?Q?tp80FOrdOpyp3kZTwXlu551saYKVAG03/j1V58gRsnBSqxPtb3EQ9LZ377cl?=
 =?us-ascii?Q?LKZtdFPwW6KE19E4yQI79Haj3qug3DT6xkvYq8hyLbDtCO3WuXPk+DdyvFwc?=
 =?us-ascii?Q?OqBE+l/GvmqG+DYt2w5hXm8Uz3CSrQTJriUi0pun6PeuQCurq4tqUq9AyXdk?=
 =?us-ascii?Q?O9Caaxaw8I8o8Pr0Y6uJErcD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7cbd77-739b-4eea-d887-08d94597c897
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 00:47:25.9727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBxEAlZGj5BBwglJteBj6Nkxb8wMKEPSVdZKsF3PATYxmhbyj5mNCWAL5/eSmqEUXTFizJbOmlFgrV74ZMSUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3809
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130002
X-Proofpoint-GUID: W2_vawXOSC6RWOGQU4wtkxIrG2P1yvZt
X-Proofpoint-ORIG-GUID: W2_vawXOSC6RWOGQU4wtkxIrG2P1yvZt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, jag.raman@oracle.com, mjt@tls.msk.ru,
 laurent@vivier.eu, john.g.johnson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From source code, the 'devid' of x-remote-object should be one of devices
in remote QEMU process.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
---
Resend to be applied as trivial patch.

I have verified by reading the code and playing with below orchestrator.
https://github.com/finallyjustice/sample/blob/master/kvm/multiprocess/orchestrator.py

 docs/system/multi-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
index 46bb0cafc2..210531ee17 100644
--- a/docs/system/multi-process.rst
+++ b/docs/system/multi-process.rst
@@ -45,7 +45,7 @@ Following is a description of command-line used to launch mpqemu.
       -device lsi53c895a,id=lsi0                                         \
       -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
       -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
-      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
 
 * QEMU:
 
-- 
2.17.1


