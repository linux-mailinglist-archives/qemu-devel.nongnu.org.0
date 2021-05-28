Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE73946E6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:17:20 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh2t-0003mE-Q6
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0H-0001Z3-Nx
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0F-0007NU-4R
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:37 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIEUf2026672; Fri, 28 May 2021 18:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=8fzkOCLXq27M0e0RiI4UMFPhthy8IJhTs3hVbn8Ui94=;
 b=M5aPV7u9hbzVCY2fcRTENTdhgRhyyISeWVP2TaYNcI6tBz4Zl0zPyEqadMj3FDSsYMbh
 BCcdagXZQd7KLyzFNu3VRjpTwFXhfe3NZThzCqyr2wIMpc48AdI//RWnEO9tKJIPn1JU
 Kv0Rw3ox7nb2G9emkPSlOyAC456KoPS1Fz9scw7N80R6LI8Jvl7Keair5aToEzVhk8/Z
 6fAG5z8oru+1WddyCYslnFMAoa84qKxqSUjVT7P9/rRu10RAZNVxqnq/jJF4m/z5Xjpd
 vKMz16Fj2JxIx9YAbsuMh7rUXXOOk0vrAcIBSno20L8gG7tBqxgpqucLOUxpRCFZmmeY vQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u325g1qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:30 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIANNU098628;
 Fri, 28 May 2021 18:14:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by userp3020.oracle.com with ESMTP id 38qbqvpqc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgDrcmfbwRlJn5JfkkMmZOk3wi8SZgvUXU6qpY0P4j1YIehUsHxE/QFZGiRw6iNguhtCkynKUJsUH+RTHMBd8exN0AHGvqT3VEJZw2KhNc/isgkhRP42j6jj+tnR9TSt2aCYFqd0GByM74KeWOzPkQaJ6/tnBXDwTCndc9+1UH5QnBTvkdc8ndf56dweu+iGt10P45kYNwlldFF6eNjVpJWQwetp6W1y1nITTv83YePMDBzgJ0c5IsO+P/Cbfjj91pqH6YEnpGL+ujXmttd+463YvfKzTlbATS3HIJNO2HYr1tKVSrbfSLuBfVtWeCiTJbsqJZQP6wP/JoPdjbz8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fzkOCLXq27M0e0RiI4UMFPhthy8IJhTs3hVbn8Ui94=;
 b=JdzyFZdbXmg8zPtnmOWrKXQvW4vxeQ/1NpYOBpSLDTJx9UkIAMDDT5zuYA0J/zXWnQ7kMI1gE/SqfKEr3ixKKpefTH1UTNQFJUjdOeVMLtpn0o65WLl6zrRZc9VR/UeJbIbYpfJf9T99ogsXWP/a+NbTAAtR8vA4e/zkX40MGPOmwJI8AHQCgofQaZ/xvK4O2174fkjUBXKicimikhnZogmNs7iVr2GOdMCqr0meXAx9sKKgrpC4Nk3Ao4q7QwAnOQN0ePTg06bk43ob+JwOLzuz+gvYxqEvlDlIgkSxt/7IXWcp+6XAFT4ExM/BtR1LHHnKIp8WRxGu5zh/zuB4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fzkOCLXq27M0e0RiI4UMFPhthy8IJhTs3hVbn8Ui94=;
 b=iXJZbe6s74o3EW5VupDJP6ZygosWaZOGBzPKka947L78ux42+9QINwnzfgPGkrjLJFb520rM4qsJjw/KH24yatJkXIj8p52ITJqHlLnRsg2WvOnYn5WmIQ5ZS5t0swQhpT7rFHa6ibn+WiXGGpUKp7+XuzovXO2XzIaVAP4fniw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Fri, 28 May 2021 14:14:12 -0400
Message-Id: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SN7PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:806:126::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 18:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f60bc645-0c11-435f-dbaf-08d922046d3b
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB20454E56C72E56A7ADD7934897229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +N5fr5uIVZwc8CYCsmTfPk+FSKsczAbWFOjzKffQRvUuUTtEOdVi2O/58q6QAQ7j25pYN7yWloQs+HsPq4MBHu70wDXIy0r2TR15h85OdK2NmhejzNgvWAse9y1qDPDlwu96RKrz22L5KCWfARwhx1E8gbv6yf5DENFBPUBM079MDeULEw3WcqZQhIQ2/4oSKbWD9kmulwEDJXoP3ALmt7PbDVJbTb//3xZhGWxuYZ1Yj09AdL9e4v2qQ2pXLkVQ5vHrQMA4Be5HzIXD0edzhHzUMHdgzA0c736bYCK9yw/2FWjMEXLvS67fnHHHGgh+RDlDBbx0ZVJd/3Q9FOuKWDz/WaazVXe9W++vP03jUwjzmkjsa/VUFyXRTB80c8SHZ34e5g90hsqHMtVzS/9Jr/QxJko/v5Z0pqSyGc8TmRDOWuCA2M/sKRNsW5IvR+eJ4Pbr3xo2p8mPRFxUOlAc213hORTo+tmObwC+oQElW3egzAitjGiPlOWjj4IaA8swFZWQzS4JMIIqD4BomG7fKInFdqLricH0f0SIAi88mk8kfl7Wf/DUQTo8YAAwfjTqAU6hG8kv06pp6Kk2p2BVx61OGGLFyxRwHBLRud7/xUnr6iID9OJ4UIHmDYtBLoMj8PlOI+7OxWphctMfkVMBfuwLR7n7O7aOtjJ1vFz3nG1O9Dg5PxuZDvf8WAANLiZ505ss365tRkPPfAh/+xL0EeRV1OucRY4PXwvS+5u6RSnH177BI5T0GDyYhHWxsq8gW6aVyhgZHkKs2GVu5x10Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(66556008)(16526019)(45080400002)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(966005)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZH5VEiipexnC83aUVIu8oJCvMimfUhMF3AucAK3vI7Ile00RtNQvfhaMEfaW?=
 =?us-ascii?Q?/NscT6a/AO9UQA6uO37vdlNu6Op8AAhLKg1bDWLlPMp/gZucEYhq8Z7CGbuZ?=
 =?us-ascii?Q?qiHP4CY4S1+M5tzNiEdWw029Qlr6owRKo40MMkWNw9jSINqNDC7PNn+Mhpid?=
 =?us-ascii?Q?oe+V0ZYljhw9xVn/lXtFvlDB3kIZPQ9CdNFsSVwc7jjw06kU4HDf1293Mi4X?=
 =?us-ascii?Q?XgDBzxeqNHAMCtgYin77QpDbTQ5/gfFm5HUgE4Xltj8exuMXi3QKhz+BwlW3?=
 =?us-ascii?Q?mTnpbtFq58f98nvSqXMsthTJHrwUY3YorTCKtpUfYrdkpZ3pfGQ2Rqz6Rx2E?=
 =?us-ascii?Q?O6gRl7n5DJNzZPEROMP08Ii772jcctiB+Tpi2sqWUP+Xc/Q1DXf8gHJPG3i4?=
 =?us-ascii?Q?3Q+b/w4Ydk7xb2EGL1A0sAcuiMmzA6z9NWsCd2NTrRBdyqkUirmJNWKHKubs?=
 =?us-ascii?Q?jd5rWQfwZLB/mHKDK0M0KpdLTjGIQ1QlMTLzIMWqfRmwYRzwzozfz1n/gInL?=
 =?us-ascii?Q?i2Wq2J+D310Yz5xTX4C9j0QqJpzC21nsrflilhLlnQaUjNbOVvNUm54taNfF?=
 =?us-ascii?Q?LkVgn1dXzOGykKoDeYH50plZNWd8LpB2HPn41xScFyEpGLKtpbDt29H203lz?=
 =?us-ascii?Q?UqqecQoNZ8g7QynpTsh/tlfezUSAZNXmB1kRwjOXqSEm1OzNA8Xbpgi7rPv9?=
 =?us-ascii?Q?Aru8Cp7G4Cm8vdDK7Gn4+0V//A7dR4EWi4YrUJAx74aY3Un291fBWpJXX0Ne?=
 =?us-ascii?Q?/onY3AzWo/Jv7sBFB70v1Vruxscp5UzfmyD0kgsZWa+Qnid+BU8Ief69WB7j?=
 =?us-ascii?Q?u05kIJsAzTY7JWLsjMMZjjmiEl7XMrWMA5h/sdKAcOxj/oLEEdY5cU9rOB0M?=
 =?us-ascii?Q?Zeqdl8+C48gbM7J9jPueKDNOPGZfyIMYJ0d9+AgiINm6MMikOiSPmEoVV4tS?=
 =?us-ascii?Q?uyr6Rt9vuJMvdbvSsoKDh/2tOYOnbD+ChOjf75CAKVacrjKgrzUi1v2v4ta2?=
 =?us-ascii?Q?i/Jxs7ebW6QocrqkXTtk9yAqS/cN+djR1Yj+a/dt4CUl+Ynh4frRiARt/m3W?=
 =?us-ascii?Q?uyFio40zBg7a5TgP5Z9mm0S+uSGGdGzyfhsKYzjuMhLK5SZUod5hbvMX7n9k?=
 =?us-ascii?Q?qz7ZRwbpzmV5z195kYbk16yUApFXT1KQT6aVOOmtsUXAJyi0pmtT+5Jz+P0J?=
 =?us-ascii?Q?3KrbK5BtrKyfqW1Ud4BT9vZNY7FMPvdJqRsPsCvsObrix20RLl8LnJHw7V62?=
 =?us-ascii?Q?yj7iCGYxlFilPgInUU+kjaRND84y5OWrWZ2VkDsqe8gIFRIyfdfSMUwmPbyz?=
 =?us-ascii?Q?BbMWZEfQ2qhDPZelavxNbWeV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60bc645-0c11-435f-dbaf-08d922046d3b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:25.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/J8J96jzBY+UCmwgQb0HQT7bij18D5EMaetdn232CcJkPqkAgpCHAM7xk9zTutBFI4xl9BVCQ9yoJXU14WjqlaEaTPmV5zNSLP5UamFnaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: 3qPonnODC5pHGyiuijcpO-TWkmph6GZj
X-Proofpoint-GUID: 3qPonnODC5pHGyiuijcpO-TWkmph6GZj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NOTE: Also, I wanted to push this v3 for review while alerting
that I will be on holiday through June 8 (possibly a few days
later).

NOTE: The patches are arranged such that each can be applied
in order and not break the build (except the 0001 patch). Igor
has hinted at changing this, but I'm unsure how else to
re-arrange these patches accordingly.

NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live
migration to a completely different host does not behave 
properly (it loses the ERST contents because the file is not
present on the new host). This still needs to be worked out.
Other than live migration, this patchset fully works.

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

Linux uses the persistent storage filesystem, pstore, to record
information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
independent of, and runs before, kdump.  In certain scenarios (ie.
hosts/guests with root filesystems on NFS/iSCSI where networking
software and/or hardware fails), pstore may contain the only
information available for post-mortem debugging.

Two common storage backends for the pstore filesystem are ACPI ERST
and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
currently supported in QEMU, and UEFI is not utilized in all guests.
By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
viable pstore storage backend for virtual machines (as it is now for
bare metal machines).

Enabling support for ACPI ERST facilitates a consistent method to
capture kernel panic information in a wide range of guests: from
resource-constrained microvms to very large guests, and in
particular, in direct-boot environments (which would lack UEFI
run-time services).

Note that Microsoft Windows also utilizes the ACPI ERST for certain
crash information, if available.

The ACPI ERST persistent storage is contained within a single backing
file, with a default size of 64KiB. The size and filename of the
backing file can be obtained from QEMU parameters.

The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
(APEI)", and specifically subsection "Error Serialization", outlines
a method for storing error records into persistent storage.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igo Mammedov
 - Did away with use of ACPI packed structures, per Igo Mammedov

v1: 26oct2020
 - initial post

---
 hw/acpi/erst.c         | 909 +++++++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build    |   1 +
 hw/i386/acpi-build.c   |   4 +
 include/hw/acpi/erst.h |  97 ++++++
 4 files changed, 1011 insertions(+)
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h


Eric DeVolder (7):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: include ERST feature in build of ACPI support
  ACPI ERST: create ERST device for pc/x86 machines.
  ACPI ERST: qtest for ERST
  ACPI ERST: step 6 of bios-tables-test.c

 hw/acpi/erst.c               | 902 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build          |   1 +
 hw/i386/acpi-build.c         |   7 +
 hw/i386/pc.c                 |  31 ++
 include/hw/acpi/erst.h       |  82 ++++
 include/hw/i386/pc.h         |   1 +
 tests/data/acpi/microvm/ERST |   0
 tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
 tests/qtest/erst-test.c      | 106 +++++
 tests/qtest/meson.build      |   2 +
 11 files changed, 1132 insertions(+)
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


