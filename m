Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E63BED57
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:46:35 +0200 (CEST)
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Bd4-00038a-Sb
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BLO-0002RE-QK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:28:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BLM-00070O-6w
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:28:18 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCO7D011975; Wed, 7 Jul 2021 17:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3JbDIQloszK837SdSLbPFEpydMxjEf5gwezDmSwYyKs=;
 b=JUe/uZyc95MdmENgeX2cFd7Mi7Ju62dRgyA2286trQmc2mStXhL7RZUG8cx3njjKBbVW
 Cq/xw66FeJ/BlQHflTFJE8Way+4eGOU+5spKKtNsxI42d4CfUJUz/0t5I4BMpdsfQ2tN
 YsKoDNWSfKgY7wxjxRRxg8co/Q/QygJYDoydRBgXZs5RyEYtCTjvK2Nj7Yk9TzXnpv8G
 Zzwhy+SvmQjQ/JpR4qsAaJ+4rRm80ygWbx7UAbTLevQy+8UqMyDEAI6q0c4coKYbYsrG
 o2Nw/1/EXxH+CoVDpiR1kvQb9fLOrrJb43c5gw8hDxMS2NmTfXviiJ8rUKM6F8OnGCfJ Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39nbsxrqms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9YV026110;
 Wed, 7 Jul 2021 17:27:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 39jd13ub9h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ17BK8qVTbPbi3xB85YP2Njp6NOvFBXm1wjVQYashrdqtA65s6o8PEz5E4tx+DurwBNDqUkAP2eBa17VSBsNlIfd46wY4FxAmLVtwpHXiuKweU8vmZnQnNNBRGUB/B8OtxD9UsB3kODG6QEH6PQde6LuktnBRmy3hKuu7nJ6jGg7kHWkgPawD9pdK0YqBDnCY3piVeS3gqIKJoZdpgRUafVj2QNixvDxtP0e2lmXcmPBIYcD7G5W9C3D9cXutz7JXqN6kxeZJ2iJwQl+evQvSUlhjF4A+yU3tZ/UDDuEpuGYwQCBmM38CUYonH5cd8hFXl24D8w9zIFHC/0o0AkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JbDIQloszK837SdSLbPFEpydMxjEf5gwezDmSwYyKs=;
 b=W3M0Se+PZ75hQNGkXQf/6eRRfO4cBBj25kGIOOUOdhTnp0C180kwVQ1rKbM7UUGrADiC3bwuqDOsS7R3EfCVQCvQr9IGvhKgqzb5GjfG9ZGzPnk6BLcwn1SuOOnfPaXDWrm8wmD4oTa4pjjPdlsdVvsfN8IewPfMh4W2KRzHXDPz6o5VN3YyBClMu+zzBJ3PSVmd/JpuL6mUtPucN1xPKgisFXT48+NHsQci9JEl00yFMNEJTiiyczhC7cauyrYqgVBpLtjOJY0bejw+al0SX/Q+GYl7pUuYIFIhLJsOonxr1/PzScG9auwcl4zkvtz6jU+OPg7P7kNlVmDyAaUcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JbDIQloszK837SdSLbPFEpydMxjEf5gwezDmSwYyKs=;
 b=KhPZY+ETURrlXhcMEzdGwFseE7BW6c27LgefEi0WLcYhLn7/GQhPMxvlGQXlegWtkGMUnb5061fVgv3aVk6mtmbIKHZfkQ7NB/ua/QZd6OymBEw0ps3Qs/gZOLqScbzhxUOtN3a3rfUFgAgfqPas1nfr/UipxXsGZYyet9hr3b8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:08 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 02/25] cpr: reboot mode
Date: Wed,  7 Jul 2021 10:20:11 -0700
Message-Id: <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a42ab4a0-1782-45b1-ef8c-08d9416c725e
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB410434C28B4C1BA5650B1DA4F91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVtE898PObJTscGa5mOw/U8eT6/eOjuOzPcX+QVeBsQuFt3fugOrm7a9XEOioGIWaI/AD9RuPag6tIqdbebGvh2j1/HNVn7Nu9PLOKCufxQgWxmSUsANzTzrGEDixSDjy2+hZ+K2ghw+ICq0PR7GnqCirViR0LedpHO6mF7ppKHuzcoZahztevDISxJs5WVxS+KKU6s1ZMg4MlmMUWm1Ylnrl2N1AEcGRm6od8YW5Z9RTg3wImxJ4o5pRZ8mdqfKS4vbzkn8ETYXQb0JutCkVi+UwugWcDuPgjoVuPH01zPrGUhCKLOlH5P9+ZU6Vfz0MdLC2v/giv1SbbqV84pXk2NTRLsphe4XLMKu6bxUTr0K0UG807OLH4jd6q1HmC6EJ/0TUJWnIcfvFcBII/9i8OKROYwheLFWTxplBUsPodin4xuIUTghWVxa75s4XwRL/6pHvAoUOuLcUG7lOYrUDdyLcSh/lw0wa3ecZvWeeaCVmbM+3z9iRVJkzVfL6QBoMhrhYxNOC09oiVWA89GRlx6lRpuh0E0qsvxxhs4MOJl51jDUhIKroJxpMw7mTsa11KTWJ7UgSAHidkNDajbtgeqLuPjb30K+29wc8NK7vX/O0yo80PdxkfIBQ09/0aA2RyQt6zjDGdcBIpWKyK342kX++wJIyC6V21+h5jekMbLtddb+jNBlMHs+jGD0xL6MXvMgg9QRwmCM0AtRmi71iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbNmfMJP7jVZPjdUUAvVRS5dqeGDw6RD+sLH2pw6ancppbtjVqc5B6uX3ku9?=
 =?us-ascii?Q?LPrUOKskOyzz0MqHWdkTVHa1EFSQ//8zXnr5X3+F99v4iI1Gkt+hiUPJdETz?=
 =?us-ascii?Q?L1Ri1+tTQy96KFzgzHO5B2BcmXSHRe28jldSOszly7G/KJAB66S9W/Xcq3nG?=
 =?us-ascii?Q?SrZmr30jUTCc/j/y7dDU6u03FFmCquhXZqm5ybB+14/v4/0m0kiWYG3N7tWc?=
 =?us-ascii?Q?IpZtRXdXDHFFQLLtM+/m0Tp/59Yy80TIjgFKK4EbY0cN4fa+E3FDOresgcea?=
 =?us-ascii?Q?ZZI29hWc2ojmZ7eSV4s/X5mmph2jVZqiLzRqtZ2nlDkchTw9jYDaqfvME5ha?=
 =?us-ascii?Q?u1EZhjUOb4RAEDE7AFiEPiqk8Qk1qdUhKZp6hA1rBncCGFTcSDeX+F2EjMib?=
 =?us-ascii?Q?yB0AeLuB5HDgQP/+PWs7gUP3f1qLXWLTAF8FM5H75+MzI7UnNX8Xs8ek4BEm?=
 =?us-ascii?Q?udYw65dlpPXGawlh2Nqz9EDKIU9R+EOztzNry4pOghsTKlkHaSCtDXFJst+c?=
 =?us-ascii?Q?pv4HBjReS6RO7m63eUR/xknCPvszoFoIHTm4StjmDa6n8nHQRnbM0soD0CJK?=
 =?us-ascii?Q?frbGAq5EWI7L9GQnWFI9PKfey4BpG024PgXV1sDr8Kdlvxhl7/mpY/f0jY+4?=
 =?us-ascii?Q?uROjlYZ33c64Gm6RjJCnFjFSewzXq2RwM8hszi4dctrG/iDfxOu+4lRtmPNi?=
 =?us-ascii?Q?Amyda6x3egiTbCFS9vMjrLUWgosGU9Tp0IR1ChDA4q+YLW6p7cFVnOQI+vmN?=
 =?us-ascii?Q?CSrJCYBYeZwh/vE0vF7mhzvdpDfmdWgpRufJ26rFLPPzqRn3gcKUoKTGyUt4?=
 =?us-ascii?Q?0ovFexolJ6DrE6ygtTpiqY99tcCyiWfTBpPA7VLWhpIqRQO7pEQdWyZiZQJB?=
 =?us-ascii?Q?wvmhyI8p9V3IKaKfkGCv0NCn8P9HMShjfcDByrl8gZL8DocnG1N1bKgf++h3?=
 =?us-ascii?Q?Stfe9YEOxHLA0YhuVRvphWRkvjvcKWhrT90vYiPqo4osvkTCu+v9+wNnyb9H?=
 =?us-ascii?Q?g5P4YSPzdl9Sz0xD4E9dlqsf5N8HIFTojL4/QDNFCfdAhQkyj4d07P6+kgxV?=
 =?us-ascii?Q?TxP25NpPt2za5/MLLp4QjsQZh8fqBS8znsEiB2Zp77HOskc0kg7pAyDnFDn3?=
 =?us-ascii?Q?BxxLpNN3oTt4O6MY1Pjy618Eb/fySJaSyM1HnPbThnHgYgCRRuCRMBNiVjiJ?=
 =?us-ascii?Q?9uwv5LBxvJlRxQfZoSa5Syzzl1vTS9fYV8huDb3VvtLhUcanM0+1B2hSlwI1?=
 =?us-ascii?Q?0EqfNwL2RwitIHUcrCbjmi9u9I0DKmQo17EmWQ2maSFbUs97xPP9w4v1Jpd7?=
 =?us-ascii?Q?EoX4fIiKMQO33R8ZpKVnLBc9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42ab4a0-1782-45b1-ef8c-08d9416c725e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:08.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSC4l8s2SVK1tH4dWlcpYzIjjU/bBPa5JbnXDMadNGqalzQ/MEAICMeUtL2xJJGyFWfPmzZz89xG5TEjp6QSAI5iVE65u6sUZsHM0kCECd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: sxzMU8EvaLQtDPUozjq4wLcOi8Mz0Nea
X-Proofpoint-GUID: sxzMU8EvaLQtDPUozjq4wLcOi8Mz0Nea
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave and cprload functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports any
type of guest image and block device, but the caller must not modify guest
block devices between cprsave and cprload.

cprsave supports several modes, the first of which is reboot.  In this mode,
the caller invokes cprsave and then terminates qemu.  The caller may then
update the host kernel and system software and reboot.  The caller resumes
the guest by running qemu with the same arguments as the original process
and invoking cprload.  To use this mode, guest ram must be mapped to a
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

cprload loads state from the file.  If the VM was running at cprsave time,
then VM execution resumes.  If the VM was suspended at cprsave time, then
the caller must issue a system_wakeup command to resume.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS               |   7 +++
 include/migration/cpr.h   |  17 ++++++
 include/sysemu/runstate.h |   1 +
 migration/cpr.c           | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build     |   1 +
 migration/savevm.h        |   2 +
 softmmu/runstate.c        |  21 ++++++-
 7 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e..c3573aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2858,6 +2858,13 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: include/migration/cpr.h
+F: migration/cpr.c
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..bffee19
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
+void cprsave(const char *file, CprMode mode, Error **errp);
+void cprexec(strList *args, Error **errp);
+void cprload(const char *file, Error **errp);
+
+#endif
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691..ed4b735 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
 bool qemu_wakeup_suspend_enabled(void);
+void qemu_system_start_on_wake_request(void);
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..c5bad8a
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,149 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "migration.h"
+#include "migration/snapshot.h"
+#include "chardev/char.h"
+#include "migration/misc.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/replay.h"
+#include "sysemu/xen.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
+
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                              const char *name, Error **errp)
+{
+    QIOChannelFile *fioc;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
+        return 0;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return 0;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    object_unref(OBJECT(fioc));
+    return f;
+}
+
+void cprsave(const char *file, CprMode mode, Error **errp)
+{
+    int ret;
+    QEMUFile *f;
+    int saved_vm_running = runstate_is_running();
+
+    if (mode == CPR_MODE_REBOOT && qemu_ram_volatile(errp)) {
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "error: cprsave does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "error: cprsave does not support replay");
+        return;
+    }
+
+    f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsave", errp);
+    if (!f) {
+        return;
+    }
+
+    if (global_state_store()) {
+        error_setg(errp, "Error saving global state");
+        qemu_fclose(f);
+        return;
+    }
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while saving VM state", ret);
+        goto err;
+    }
+
+    goto done;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+done:
+    return;
+}
+
+void cprload(const char *file, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cprload called for a running VM");
+        return;
+    }
+
+    f = qf_file_open(file, O_RDONLY, 0, "cprload", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "error: %s is not a vmstate file", file);
+        return;
+    }
+
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        return;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            qemu_system_start_on_wake_request();
+        }
+    }
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
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342..ce5d710 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                       const char *name, Error **errp);
 
 #endif
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b73..7fe4967 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
@@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
     }
 }
 
+static bool start_on_wake_requested;
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
@@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
     notifier_list_add(&suspend_notifiers, notifier);
 }
 
+void qemu_system_start_on_wake_request(void)
+{
+    start_on_wake_requested = true;
+}
+
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
 {
     trace_system_wakeup_request(reason);
@@ -574,7 +582,18 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    /*
+     * Must call vm_start if it has never been called, to invoke the state
+     * change callbacks for the first time.
+     */
+    if (start_on_wake_requested) {
+        start_on_wake_requested = false;
+        vm_start();
+    } else {
+        runstate_set(RUN_STATE_RUNNING);
+    }
+
     wakeup_reason = reason;
     qemu_notify_event();
 }
-- 
1.8.3.1


