Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2AF47D7EF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:45:07 +0100 (CET)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Xu-0007RV-Dd
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V6-0004Yr-Kk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008KW-DS
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXvVZ014454; 
 Wed, 22 Dec 2021 19:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3yKA6AprYov3Nlf25BWkbonBsDeRkqGT5BmmndmSAR8=;
 b=XvAME8cUS1TQQi1s1AQfNEbOgaaFhTY8E3wVLYGF0LIfdrCeY/zCXoG1KnMfPUN7VGqR
 UVKKJQ9h9kJef4wlZV4tNIzY4fdxXEmw2RfGbC4wmBG4xqsQIxw18p0CQqYKid+Yrurg
 WtwuILWD5ywUvmPCDHcFg/6wTw/zBlPUP4EDPCRCjuvrp7cdGYfPOjqonHIIbwhFsgZW
 ym+ExgWgcWKR6UMxgd7fg7+Yy8ve2dv7rN2rdYPLZBdkxLnZgGskxR2pyoSCQ9oGoKVg
 bfoVroL50e9SenaF6LGd6AjJtDZRNcPyPhq0KA77BJ/NatttqKWi0OI/uVo3KePaknoE bQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46qn0t1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeZ049074;
 Wed, 22 Dec 2021 19:42:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfTT4Mu3qba28KUiEAUx3DIhfR/W1yXGCFQfb3647/0/LNFs56HPO4I4EP/oSQLFayvOK2kWheNztuXa0IWZtCMjh6DvZcviu39ZHS7DhSkqqiyuIpM+Dbwh7/t3cSaYU7GIpChbWq+nNg0wx5O2E54+pij92GEIeTcQvhWaxjt1WJ3X6BGYzCL+RgfxxHzRSH5wezWHHkxQ09FuWyJTtWQR0uuBfHlftFlqpx3N9iz/SCXWyi3S/15/6t1Y7GyICIP0KpwFn6FhSQ6kxyYx5T78D8yEZcUY3VLYi8EQsMnXL1C4EYoQh9YFw7xXnsm5yAd20HSSZdTEniqLslYjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yKA6AprYov3Nlf25BWkbonBsDeRkqGT5BmmndmSAR8=;
 b=O+xj+Ms+vArmVb+T4flEd80/+hFITbf76X/pzygfeY2E8T0ZNgmi4KVTh46Y+Yo9cTfTvEkdBoWA49FtGtXNPTXzguACxGXpIiolZCwWl0rbUfvjZFeNhPZqW21JxPa1CJnSP+CBhlfSVmvnBe9TMvuokBG+QTdctJSBTSbajCr0gNtIW94VyG3z7NIpyr+/P5JEGLCgAe2jOlP15MsB+dtXQwfo9CXaqzH8i3hGz4knFeVnkQKiS4hLvDinCYRyd6P2yqG8q4ibZ1wk6gsyNYuxuy0iquymITQJ5iXZ+Wj7qR8RJ4V9pfvQRDYwe5WTtyJIUQxn+J/3nhSkKskCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yKA6AprYov3Nlf25BWkbonBsDeRkqGT5BmmndmSAR8=;
 b=rbQEY8SoxYoL3eeDQsSGFyTro/zSoJSeRCSYxIeEtxrUeSVXMpyMuo31nbJg/Ii0VlVEVgBSredc999ECpTtEWKBvlDAmSoYnz44z+p7pJNgQenWgZF613kxIfCbSb/rdxkebxG+9/TNucMdHCJoxWuJRk1SCZVMUKgc1jBHm7Q=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:57 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:57 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 06/29] cpr: reboot mode
Date: Wed, 22 Dec 2021 11:05:11 -0800
Message-Id: <1640199934-455149-7-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba04ef0-f93e-4ae7-4d61-08d9c5831d3f
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB28886525661206A3F550AA00F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qkce1zjyO/1odFIPhKSeNHLpNAR/lxji32WUXqVcB4xoxM+p8j50U77tDpeIF0/8+pMYI7Kc5l7cdDXjpQ6Vi0tg76yhk267h1UWHuHWAKi3k0rdWWbCcT3/ZmVlIQ8+5cZJYqQflVkgUL/7RFxvXSd+XV+Fa7Uyjb8wRc1X60BzZWXVAiPiUGdPvJtNf4a/j4RjVuEcVz7AhNyhouZA2MyWy+g6TgqaPfo+FwS1duVwSRFW/w9NHJLPpZ3yvSNf9oYKK8yLF9c3AM/7+vRr8j7ngXO8YFURI0N65tNhhVPORFo0eMvVJIvCOG/tNxF1aKWRaXSLYzD0oazAgM70YSWSxs6IB2fNDIKSd0BwiFJtb8JjtLfXZYlnpQl9BKRT5Qee3aVKzaQxiR9cAVLtI2fiapc3qUsgBHcpL1EPicrxp4kK/zNM9ABG3Q/3X3pTmM/AHUREnrLla5PfZu51wI3lCnXzHN3NiWIulSPlfE0cqaNWD8D3DVFhw3dRL3P5AlXiZ3EpkA/1ISW1ddefYBK7ON/j3aScE1N2l6wqC5yCCdqnSwt0o/GPj4V9QP2FCBVyhBkXdEsGUqdS64p9U7F3q95MpQ1Xs4LRapCiYwkUtl6wHXh+Zeh5LfW+uSQScRuKr9ZPr9+HuamZYNx218AdEI4xJXuqGoTPTAtotipF8i5tP4LrfMlRtI7fxUzbKtQnWWAHNXj0hxzoPH0QlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1GTtWbLSjoEGmq5PyXx39pJrYlg1W8UGaQ60//tjCsjMgZY/NSDLN4b9abwV?=
 =?us-ascii?Q?kj9hf37Pp6TrSbmWdkUcbYiaBa+Dj2xZ8nJ8fT0aEAhHfyHbJAKOBmjMzU62?=
 =?us-ascii?Q?2xtr2D9noZUngTDd0+7HGWPIMo6+Zeez0CcH0pbr40ZQP5fe5uxE4LCmwNOz?=
 =?us-ascii?Q?TDGxQN5bmgSJpNh4gTnunxUnwYvAARg1eMiQnV6W+7EOuF9PPUQR8lo+6qSe?=
 =?us-ascii?Q?feWFgEdg4fNwYDhqeeFhuGThl+sMvGoOXUOOvxmx+VCM4EC0oc5KcflItkmb?=
 =?us-ascii?Q?mjkOUpuV6fRpVm06r4GU01ZYst2g+we1F4ZUOPOy46yR3ZyVuuZ1epSNSfGv?=
 =?us-ascii?Q?BIA3jlkEbgDn2n/dT0zz6aaeBc2/vdBKOhYwQU6FARz42X+W7tMJO/ZE8y2f?=
 =?us-ascii?Q?gydIYbu8ZHuGjScI/IvcKfNI8gJkhCVQCS8e7EobucOiIq5eBRMnewgukO+6?=
 =?us-ascii?Q?27EkE3yYS1YrJ0tB72TRU1fSkVylS8zTad/Uyr6shAYvXTYNlPHVJFONtCaC?=
 =?us-ascii?Q?TU3egn9gbA5Qx99Y8LyAMqwqQJTT20/VPGO8tGUO7CiYoXtXGk6s4+QaqSiS?=
 =?us-ascii?Q?ydP6v3eG+fsTogKx2mGTzD8kO4zcOf8P9oW2vj6ewhQ2mSCm3Jk+d5TngFty?=
 =?us-ascii?Q?suWmmSqBAMJBfq2w3exjanxl5oi6wTfLOC3TJjI8GNn/59zfJUBgE32QOFhc?=
 =?us-ascii?Q?SLZcmJ4SVaUMHFt+Dv+vsbioLt26uZDKTeGhBACyA/cAEDZoulsrKEnK+TQq?=
 =?us-ascii?Q?hDgaeLOLJn7xUvj9/q1HS82dGgXF2DaXg5fHXKi7KYrIWICqSeJfiOmNB4g9?=
 =?us-ascii?Q?bT1KS6Edjj9pOzFKMoUpG+XiE1EH3asX76j2CxnV5a7aEbDjRDqRD3/YQ/pX?=
 =?us-ascii?Q?Hg08VZWtV1VP6446sJwQQzQC+dMMNAR0fc44dOfcPgWwKWw7g2GaB9w1dmbU?=
 =?us-ascii?Q?F6RMsGaOgHDAfgBorxLXBiOjl+IT0fcRYUUg4GqJ1Xcxs81WvnCTINV6qf2x?=
 =?us-ascii?Q?7Mfmqu6GAX0FFwV2X/mfU/suBbZG8QapPS3Du4TshLerJpe72AFUtRogMCya?=
 =?us-ascii?Q?gD+oaGTYxF2scAAEYqNT/dUNX/AadN3YA72kVMIWzaiW/l9yV2WVEHY3Het9?=
 =?us-ascii?Q?saOEC2OqSJKCHmYbSzo/lzB2CDO1yLnV6LNxp2Su0ivudN7fKviB/W5UzZGX?=
 =?us-ascii?Q?o40jJs9w6egm0IkYNivAJWzCdJsg40X2W0SNPpmPp4ZbOdARnyGoWzyVgtN4?=
 =?us-ascii?Q?yqVlSV7GbBbcSTrIfFTIzWsqQW8ZQRPuuPwh4hO5K6gXnMGLGUwhYpT31zQv?=
 =?us-ascii?Q?dOq5QTOeZvBGAep8aYsv5OzixgCwL4V3VzhGK7tRHknTSBg0IWh06OgdZLq6?=
 =?us-ascii?Q?TSjAFruktnsVXV/6OChmNe6V3mMlvY7H56VCU3OLCKrU1IAZokNBuk9+LFYS?=
 =?us-ascii?Q?I64VoyjXqSh/lxXj5Rn64EP/8Bgdw4Mm5dXyF0HElcCBTTc+o6Dy66MFowJ+?=
 =?us-ascii?Q?KUsF45st8lPHThMNy4vYEejlIBwEQfcvDxMxgMTwxYMfDYGFWlMtiS7V8cvx?=
 =?us-ascii?Q?HmgSUlDp1vObNvXCPpptPSzzViv6JM0SEIXOOnwT92jb6RpjAWDDFS26pVYi?=
 =?us-ascii?Q?V3nsTanlifdkCJDcUFuaKnB75J2RE453iD15ZQcpzLuDWXN4KDYv7ldoyI6N?=
 =?us-ascii?Q?hnEcSQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba04ef0-f93e-4ae7-4d61-08d9c5831d3f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:57.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS6WvgSicleAXtscwTxwaEekT3tAj+h8wO4gxdcvkGOGQnNvZTDYGrh1YF1D4i1wmGr8aoj/WUDURqdeXyOkbeyZCGZFzeMfQTdVSLZ8Aq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: w7rtR1OlnOkkU_pQPeGx0KlYe6h3iM13
X-Proofpoint-GUID: w7rtR1OlnOkkU_pQPeGx0KlYe6h3iM13
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Provide the cpr-save and cpr-load functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.

cpr-save supports several modes, the first of which is reboot. In this mode,
the caller invokes cpr-save and then terminates qemu.  The caller may then
update the host kernel and system software and reboot.  The caller resumes
the guest by running qemu with the same arguments as the original process
and invoking cpr-load.  To use this mode, guest ram must be mapped to a
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

cpr-load loads state from the file.  If the VM was running at cpr-save time,
then VM execution resumes.  If the VM was suspended at cpr-save time, then
the caller must issue a system_wakeup command to resume.

cpr-save syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot' ] }
  { 'command': 'cpr-save', 'data': { 'filename': 'str', 'mode': 'CprMode' }}

cpr-load syntax:
  { 'command': 'cpr-load', 'data': { 'filename': 'str' } }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   8 +++
 include/migration/cpr.h |  17 +++++++
 migration/cpr.c         | 128 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |   1 +
 qapi/cpr.json           |  56 +++++++++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 7 files changed, 212 insertions(+)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json

diff --git a/MAINTAINERS b/MAINTAINERS
index dc4b6f7..3c53b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2988,6 +2988,14 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: include/migration/cpr.h
+F: migration/cpr.c
+F: qapi/cpr.json
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..0f27b61
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+#include "qapi/qapi-types-cpr.h"
+
+#define CPR_MODE_NONE ((CprMode)(-1))
+
+static void cpr_set_mode(CprMode mode) {}   /* no-op until a later patch */
+
+#endif
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..ca76124
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,128 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "migration.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "migration/misc.h"
+#include "migration/snapshot.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-cpr.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/replay.h"
+#include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/xen.h"
+
+void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
+{
+    int ret;
+    QEMUFile *f;
+    int flags = O_CREAT | O_WRONLY | O_TRUNC;
+    int saved_vm_running = runstate_is_running();
+
+    if (qemu_check_ram_volatile(errp)) {
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "cpr-save does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "cpr-save does not support replay");
+        return;
+    }
+
+    if (global_state_store()) {
+        error_setg(errp, "Error saving global state");
+        return;
+    }
+
+    f = qemu_file_open(filename, flags, 0600, "cpr-save", errp);
+    if (!f) {
+        return;
+    }
+
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    cpr_set_mode(mode);
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while saving VM state", ret);
+        goto err;
+    }
+
+    return;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+    cpr_set_mode(CPR_MODE_NONE);
+}
+
+void qmp_cpr_load(const char *filename, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cpr-load called for a running VM");
+        return;
+    }
+
+    f = qemu_file_open(filename, O_RDONLY, 0, "cpr-load", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "%s is not a vmstate file", filename);
+        qemu_fclose(f);
+        return;
+    }
+
+    cpr_set_mode(CPR_MODE_REBOOT);
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        goto out;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            /* Force vm_start to be called later. */
+            qemu_system_start_on_wakeup_request();
+        }
+    }
+
+out:
+    cpr_set_mode(CPR_MODE_NONE);
+}
diff --git a/migration/meson.build b/migration/meson.build
index f8714dc..fd59281 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..2edd08e
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,56 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR - CheckPoint and Restart
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cpr-load'ed after a host kexec reboot.
+#
+# Since: 6.2
+##
+{ 'enum': 'CprMode',
+  'data': [ 'reboot' ] }
+
+##
+# @cpr-save:
+#
+# Create a checkpoint of the virtual machine device state in @filename.
+# Unlike snapshot-save, this command completes synchronously, saves state
+# to an ordinary file, and does not save guest RAM or guest block device
+# blocks.  The caller must not modify guest block devices between cpr-save
+# and cpr-load.
+#
+# For reboot mode, all guest RAM objects must be non-volatile across reboot,
+# and created with the share=on parameter.
+#
+# @filename: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-save',
+  'data': { 'filename': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cpr-load:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cpr-save command.
+#
+# @filename: name of checkpoint file
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-load',
+  'data': { 'filename': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c1..8d5515d 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -30,6 +30,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
-- 
1.8.3.1


