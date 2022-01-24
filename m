Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DF49869A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:24:35 +0100 (CET)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC350-0005Sb-IX
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0005Rm-Mm
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2y4-0007jj-3A
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:26 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OH5h97005958; 
 Mon, 24 Jan 2022 17:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=v+K1HX0UC/xaeVj/cJZpwEN3MgB7H/znX3ZNDESjihlrmlLdSbH9WP5K3Aa/5hogiev0
 wqU/jtmC/7bXhSJWmF29q1fJiRlUcliDr7OwwkmlYLbtSKUDVB1gwRbFsK71xPnD8S+5
 ObLWrITTyjdxEELWFDYBQacTQ91CjIN67p0ssO+PjU60SAPAVKGZgBK3SyAuNr4RU8yZ
 J1DogT8a34p3HE7SuhYp53ErrSXo/l6iKMlwj7qJrX4bl80LT30zoaIuRJW3fyxQBfCd
 N0VE+Gjd57+tylho0t5mdiupykLHGLeGcIT6EjMMe6/giiioe3lexCK9c3/ujg7xcTfS Jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaa8hax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHAita051734;
 Mon, 24 Jan 2022 17:17:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3020.oracle.com with ESMTP id 3dr9r4djcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEcV6iLxJw4LOURzNEgXbaSgTvsSLF1rNJAbvVTVIoLAXw/lDixL/qRfmsxaBS6NkUca/RjffNIzIzIV/yTY5pfgjVW3On6DBwPC7njPgIZShQ5heZvOM9hD1gLRlDKLEPaKMrVWRNLEPpHWMF4dmvd+VvITqPWY9hXakiXtUkEG147LkWUR28ir+6tLx6KLsNMQWteZtX04URU8Ft8LWzKillKdSqjIqGsezA9zP3tqe2wPIBKUQPeqH0na3Bt35xEXSHYskD7+m26nTpycbZxO4gsiFrdA1XM9jEx5NzlYXJgYA7si21y0i3hU0Xo+XN+NUKVTmOQ5IMg8/lDiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=FafRY/IDsTCObIxnHrPVkLJ6uORVBbN6ORgIumuv+F4MBxo2lmCQZHO5hIDqJyZvxSzauveJ5gW0vVeSpbbTJnEjXb1yvbOi1lvnG+Mo1e2S1hiyH3Q2hclXW0xnSL+lN9iDHiauc35qQ/kgQIiJQQA/fYGTMOpcOg3BrZYluubebl1FLErPOAYiV21JcRcxkSpo6ubnocxD2EMp41SlhcEWC8YbBu3BDcLqh3ebsoNM5w++JzA0fONAi+Kb4IvbyCejYJcEIocYAjBELaK09+by//29D7QJ7PzFyB/IxHEI9rHyntoN7AL8wjWx/1ESqOG7vfEZqrVuUkiqrNAKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=n41DaR331NQnA+z0EkVyBsqMCd/M2n3nQi+9Z3DoWYlXeM3BojP6PAtnIDt/tvrIrHbWc1MWrqX3wx2lVU4QUHM2JNy0C6zvkoxIPTK7WXZmHOhYh+kf8PWvBaoBB/+VtxJfRt9ALSdZVlhsTGsKY6wSVRstt1e58MtkcfF0ue8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:18 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 02/10] ACPI ERST: specification for ERST support
Date: Mon, 24 Jan 2022 12:16:53 -0500
Message-Id: <1643044621-15892-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5377da2f-bbbd-4d2c-88af-08d9df5d5fb7
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB226528E5B3B24E3D62723C74975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVDuLgOihOd8DlvBEvnlCgKL3vH/F2XapzJuxwn41Pt2yMAdM58ngHJtSfYmGxjzsR01D0bPinjWBfdI5w8BfRH1J2PyN6HWMxcYKZWb9kdDQ2YIPkNWsWjpiu6I1tNDn2ikkVLpG7D79ECjFw6lm+J0HEyoJvla54pZCjQ44e767vlCH4Ut76kbrvBgxycmq/Vgz2McNj/BnV71NusHQwlrzFp3b6kfpWe0wPPlHhwFVyOS08yiP2bqcqNQv3PuEeqC37+9HMBwQpcrptmmUPYgmj6CW/0SeZmw+n1is1KXYTMBO/cLFJbt1qHndfH8FBAnKUAbf2dz8BmwFiKyZxqPFFLtrlPn//njl/IBx6j+Mc6jMPSLICldmAz/LvbjeVFney6vPfGCkF05cYzlTykrl0FCLiuYEEmO039adAPFI4poq/p3udx8j/6HPp9tgWPQEXrQ6m9jbWIDKqfC8PR8x5aZD9/ZOHs+btUfZfbV10/E/97XxzbpdDsoKyHgjcQzzbCnYRbzChOPwaq2Xxvs0a7jQ4nFPBU2I9ibP4toNqxnfqaLlbrqd49HGZyExmB7Tbe4da8VuUqAlbHJxBY5BjVACX63mXvfC81JZmeXr2ZPwbvYdQhLhHpqNsGi6JvDoY57ea9ajc7KZmiN+x/XHPuXSTo+GzvkIccMimkZn5L7i+BT5M1m4IubnbUtMj/9kqzenF87bCVl8DKfRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(83380400001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(45080400002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?unGoUUIU10IjzgIK0FAefo3OP9U9mkax78LdW+iLQmaFWakZW9J2ov5O2Der?=
 =?us-ascii?Q?+2daQyB84DISuQrFiK62DNVEtupBVYWFBXS7K0+im8g3dsh06NXX3ENMQIBK?=
 =?us-ascii?Q?hvY84ikIA/F4eracdBd/U2/DFoq62MjmFizhYNO9Y4ksSasAOmJpZoEWZmdh?=
 =?us-ascii?Q?7WVDZb4JAOa1c7lDInnYvCiWfpqu5QBSUL3N1H0mhFe7RxvsKZz/5rKK2SzC?=
 =?us-ascii?Q?fY7TmhQbwyse+7NgncCyoD1DBUe1Ds2Hom7mtijmgk8RKProcbcDqfRj7+Ne?=
 =?us-ascii?Q?Ml552NPrT5h2hnYDaOV3RE7onR0dK8KrLKHzo3wJ6S7oeX3Brz8AZYJcIsWd?=
 =?us-ascii?Q?sK8IstqXVq5d+vKddcmES5mkPKqzmiJCvYyK2YKasPxPD/OlAof/JS88jeXw?=
 =?us-ascii?Q?hvvpX2Pwsnaemm4v9ox92xUu16GfOTKH5Pk6ef0H+U7IOPQn46suGs/CFSdp?=
 =?us-ascii?Q?DUCL3Dur02zi7NiIg3ouLdC2zNbdIHDU+Db/Lm6d7Ugyaf/jFXPHaXVZ6uui?=
 =?us-ascii?Q?nIDykcpdHrD/sBg0twuiN6Nkybb979uxrq9bvk3fTtSeJzFCC0cC04koIzK8?=
 =?us-ascii?Q?neL5TUiSnteiBBLFM7kbDVm1O+LTnjzZKYgu5KwRqPcRCFFWIWKUMorIGixT?=
 =?us-ascii?Q?RG3jUVRLD9RQCQFgE4khOc9BJskEC5VRyHU0l6R5EMTg15xLKp7a6M2GksRV?=
 =?us-ascii?Q?XQz6xzJoxhQPQFohPOZjqCtpK68ZWjMVc985dcSXUfMty+0KUw2+RghA0Hwj?=
 =?us-ascii?Q?c2EWMNL9zcjAKgWM68DR10YG/HDzyTMfUCTbOrWXIj7UrthHMMehGEFzFxu1?=
 =?us-ascii?Q?D2ir8bT5WOB16St8FZA6d7AY9EpgrEK7ITvJ41agDd5dvWtARTwUoHu6tXiI?=
 =?us-ascii?Q?rvXlarxKW7rSDT1c/IIMZUIXrC9lP1szvdT0/Ph28x6oVvVb2PxpH79mu0fp?=
 =?us-ascii?Q?FBwlQcp0Zm6OaxHscswFVQukfWDN9nZZk2kldba0QjlW8Q4ww90vzvB5/O5T?=
 =?us-ascii?Q?G3hli3Mf+8gOvrcpiAksH8FPSVASSUkgX7r0n8y8sCDE+g9FGnhW/MRN6G+c?=
 =?us-ascii?Q?1KFzYwNWW4H7aKyr53pxrEhoe1lSbi6cUCIoaDmcBsJn4twnmcKDHtbuyDew?=
 =?us-ascii?Q?vr+ksXyjwfFvY70JbN2vCJcLAohl6r39FmYCrokTBCz07Lc99l+kbyA1GRxu?=
 =?us-ascii?Q?1iuV1XJ6TRTYvzBZ4spI8xArATSXmb3tsZ2jrlH2QCsLo1A1krB0zKgMP7/p?=
 =?us-ascii?Q?HvDB2qpSpmuK+nT7Zx75qidnwOXbVtQU7XcU00o22YNeFLhf1zBBfHtab/7D?=
 =?us-ascii?Q?rsMx8fi+DmOIBh8WJQp4JeGiZbVLMmgv9wox/drETN/ljEHDAWcwv8E7qqUn?=
 =?us-ascii?Q?jwL8oO2kxEiVR18YHnI5YDTzoAa0vJvHU0aA+Uhmg5OCkNkNCOhxO6ue5Ewr?=
 =?us-ascii?Q?khszXRLUdp766rjDjFbEEJsoDL2U6OpKyOAvwXwfeXiMisPXnbQtwEepKZZ+?=
 =?us-ascii?Q?+Alf+1JmWcjfJ/XFK0vqWuJOe1H6PnC7oD3iwmKNXqIZLfejgkOA6AJb4xyn?=
 =?us-ascii?Q?lWsb0M64D/tr/eFxiRrPke7bqixyt3WW2RgEx3TCtMnwHoMTI6bJWIQKz3i5?=
 =?us-ascii?Q?jEeYcV9Z9XjPljP/fUz7pH1kbQHRs7mUx8UZUHrax/7LB+AifIHy0W0ux+xn?=
 =?us-ascii?Q?3LoTKA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5377da2f-bbbd-4d2c-88af-08d9df5d5fb7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:18.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11LbGcndigRNZODk4q+eY0ipDtALC5ztFDJYxlYjp19QBiA7IMYhv8M2b5zJuKHJ8OX8D2r/SWUL3Ligbhv/4IgMne4s/6qYHEnGPwoijec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=366
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240115
X-Proofpoint-GUID: j2Jkb2rJA_lUau-Ikjjd71dW9EF9pCvI
X-Proofpoint-ORIG-GUID: j2Jkb2rJA_lUau-Ikjjd71dW9EF9pCvI
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst

diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
new file mode 100644
index 0000000..a8a9d22
--- /dev/null
+++ b/docs/specs/acpi_erst.rst
@@ -0,0 +1,200 @@
+ACPI ERST DEVICE
+================
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. This feature is designed for
+storing error records in persistent storage for future reference
+and/or debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines a
+method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this device
+implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
+implemented by most BIOS (since flash memory requires programming
+operations in order to update its contents). Furthermore, as of the
+time of this writing, Linux only supports the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails, and thus kdump fails), pstore may
+contain information available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
+guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
+storage backend for virtual machines (as it is now for bare metal
+machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in particular,
+in direct-boot environments (which would lack UEFI run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available[3].
+
+
+Configuration|Usage
+-------------------
+
+To use ACPI ERST, a memory-backend-file object and acpi-erst device
+can be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
+ -device acpi-erst,memdev=erstnvram
+
+For proper operation, the ACPI ERST device needs a memory-backend-file
+object with the following parameters:
+
+ - id: The id of the memory-backend-file object is used to associate
+   this memory with the acpi-erst device.
+ - size: The size of the ACPI ERST backing storage. This parameter is
+   required.
+ - mem-path: The location of the ACPI ERST backing storage file. This
+   parameter is also required.
+ - share: The share=on parameter is required so that updates to the
+   ERST backing store are written to the file.
+
+and ERST device:
+
+ - memdev: Is the object id of the memory-backend-file.
+ - record_size: Specifies the size of the records (or slots) in the
+   backend storage. Must be a power of two value greater than or
+   equal to 4096 (PAGE_SIZE).
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing the
+programming registers, and the other for accessing the record exchange
+buffer.
+
+BAR0 contains the programming interface consisting of ACTION and VALUE
+64-bit registers.  All ERST actions/operations/side effects happen on
+the write to the ACTION, by design. Any data needed by the action must
+be placed into VALUE prior to writing ACTION.  Reading the VALUE
+simply returns the register contents, which can be updated by a
+previous ACTION.
+
+BAR1 contains the 8KiB record exchange buffer, which is the
+implemented maximum record size.
+
+
+Backend Storage Format
+----------------------
+
+The backend storage is divided into fixed size "slots", 8KiB in
+length, with each slot storing a single record.  Not all slots need to
+be occupied, and they need not be occupied in a contiguous fashion.
+The ability to clear/erase specific records allows for the formation
+of unoccupied slots.
+
+Slot 0 contains a backend storage header that identifies the contents
+as ERST and also facilitates efficient access to the records.
+Depending upon the size of the backend storage, additional slots will
+be designated to be a part of the slot 0 header. For example, at 8KiB,
+the slot 0 header can accomodate 1021 records. Thus a storage size
+of 8MiB (8KiB * 1024) requires an additional slot for use by the
+header. In this scenario, slot 0 and slot 1 form the backend storage
+header, and records can be stored starting at slot 2.
+
+Below is an example layout of the backend storage format (for storage
+size less than 8MiB). The size of the storage is a multiple of 8KiB,
+and contains N number of slots to store records. The example below
+shows two records (in CPER format) in the backend storage, while the
+remaining slots are empty/available.
+
+::
+
+ Slot   Record
+        <------------------ 8KiB -------------------->
+        +--------------------------------------------+
+    0   | storage header                             |
+        +--------------------------------------------+
+    1   | empty/available                            |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+    3   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+
+The storage header consists of some basic information and an array
+of CPER record_id's to efficiently access records in the backend
+storage.
+
+All fields in the header are stored in little endian format.
+
+::
+
+  +--------------------------------------------+
+  | magic                                      | 0x0000
+  +--------------------------------------------+
+  | record_offset        | record_size         | 0x0008
+  +--------------------------------------------+
+  | record_count         | reserved | version  | 0x0010
+  +--------------------------------------------+
+  | record_id[0]                               | 0x0018
+  +--------------------------------------------+
+  | record_id[1]                               | 0x0020
+  +--------------------------------------------+
+  | record_id[...]                             |
+  +--------------------------------------------+
+  | record_id[N]                               | 0x1FF8
+  +--------------------------------------------+
+
+The 'magic' field contains the value 0x524F545354535245.
+
+The 'record_size' field contains the value 0x2000, 8KiB.
+
+The 'record_offset' field points to the first record_id in the array,
+0x0018.
+
+The 'version' field contains 0x0100, the first version.
+
+The 'record_count' field contains the number of valid records in the
+backend storage.
+
+The 'record_id' array fields are the 64-bit record identifiers of the
+CPER record in the corresponding slot. Stated differently, the
+location of a CPER record_id in the record_id[] array provides the
+slot index for the corresponding record in the backend storage.
+
+Note that, for example, with a backend storage less than 8MiB, slot 0
+contains the header, so the record_id[0] will never contain a valid
+CPER record_id. Instead slot 1 is the first available slot and thus
+record_id_[1] may contain a CPER.
+
+A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
+slot is available).
+
+
+References
+----------
+
+[1] "Advanced Configuration and Power Interface Specification",
+    version 4.0, June 2009.
+
+[2] "Unified Extensible Firmware Interface Specification",
+    version 2.1, October 2008.
+
+[3] "Windows Hardware Error Architecture", specfically
+    "Error Record Persistence Mechanism".
-- 
1.8.3.1


