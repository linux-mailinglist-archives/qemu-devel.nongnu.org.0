Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B624A023B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:43:23 +0100 (CET)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDY5Z-0007Lz-4F
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0v-0004DS-2y
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0s-0002f3-A4
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:32 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK47eS025846; 
 Fri, 28 Jan 2022 20:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=NDN46lgDigGtVQFM6Tn+OVhTCsKTbzFfMKlvjVOyERe/nFIlyyIt767nW6eNrECQFIo1
 cWgtiIAEjTDBxVb5/y8ykqZpB+wk8O0AK4iupq8z51vObe/qZcAI3+Uf6Eh6oGvWO8Lc
 81AEl/DWtma20HmUhR4dGAqlk4D3OK7Z4xuxNONgy2ouvPTeKm86ucDGymB4cuhyfygy
 7y/nR6HHPvjqaL3ocRg/G2GsZf/EurQIID2UME0vfHf5faJEdjQZdWfwf+iXtTEcc5FB
 qMq71tCCBdB38yfESmVwJ9FY3qzo4UOFWk7uAvvIX8bZY7Qk3WJ+RUlzDpbtfyYrhc9g Ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duxnp3xtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKPpgU044218;
 Fri, 28 Jan 2022 20:38:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3020.oracle.com with ESMTP id 3dv6e5m6hf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flW23Gkab9d7OV6CJw/6GWxeMhrDcND4uyFUeSbRtcW7JVAPsgrUQ5HAxVwjS1qG+rDs8E/VZaUijf83vKHhH4v1/+M1OochEaMh+AvRZPw8r6llseRUr9ew4fJ7AAba/OxV63jsN5zBbULMOVyjyCxExJPLRQPK2p2k5A03a5i035pSGK7C75tjYNNC6ASMEhITaxoo3214NNK0AIaiGBRNMhJ5qNWqzuSmkRbJTDeI3ghY2OIZGkB7vqcPwz9w3L4gZ6AGZw+U4Hxgv0cqlqP7JIOb6WkPM+HUZrgkOZt7GGoY0OdsdoIsO7Gl5nVDxqR13L9D/4S5nMqifuWXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=ap9C9FGAtHO+Lb+bac8AjSkhOC7bbAOZ3nXNqBY+vhd3XbJEqa+2F1ZTVzxD1KJr4McjvT0sdpUShB0zxr9YQ1pOvgWGhwscej10nrFQQ43tiiRPlm0SDEpfRRMKFHiLQedYIesmsqI3N/Q+sXKgBGTxqgU32oyM238+LxI4coU8wSj8vEUdgEpUKRmBclFmd9eCevcoPhQcrsW4Ov6Q1K1Lp4M3zU5z1Qtxc0nI/A49lfBvST+lB5cj/0wOrt9qqHwMOH5UL6qpnz1acv1wBub/8RPs4Hu8DBy6IOohl88Pi44s3lT2ucriRuwmMpqJkknptmpm0unDyJ1lsSoQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=JU/3gE9VZP8nkOp/HOzkf3NbkSJUiDhJb7vG19aZoqxrFI5Z1w3ZwA55Z9hEY4b7kqgWplt4Z8xDjmuM/l5i4GMtPGEgo995/k+HH86kES+yPPyb6QYUn1Ty4/IRP/nzxPKfZ844nVnXqfk6Fhb5BV6++aI7lmPcN4/I6Q96Qfs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:22 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 02/10] ACPI ERST: specification for ERST support
Date: Fri, 28 Jan 2022 15:38:01 -0500
Message-Id: <1643402289-22216-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe2f325b-f84e-4d14-f5f5-08d9e29e1fe9
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB553023BBE0956681103F569297229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QslmE5qO6asORHLchcTgcInXtftTWG4ZF+xLvu2D1ViepJg7Wh2bEPScWqLzJOfA26rugNndYnGhgKz6InhD8qw238B+dMkhwhI2iy85h2RWqiwT/pMp+xb/zOA24sSocnPk2uwvpbyTFMEDApJZISyxyc9puq4PBfb79ZC1TFNCoI6wNQY8lz/SmLbgJ0gXgrZWRjyi7B8keDsnFbvHYcKHEz0zUxLX2f3lJ75m6qaaRiqSTS3FUB3NhHA23xCPVJyPA3b8iiFW3qXTybEjMAKJgzuOjz2WT0D32B85fbbQBohGRs3KVujweXIDBVEYM2moQKqPSQbV+w2dkxKzTZK7B7VoFuL3QT5H071+jv3JzrNqfEvtIOfjWxlqmLO6IwHCAJo96/NOe3nHJ3G+Eudhb3YXmZLwlcpQk8KLLcwUvHILd44slTiNZiM8rxGrkH5tfimllNVQLYdp7u/7QwDUR5BjzXfmc95FVDlftaVaBgCPK3JLUr32bfuC2lzuNJOm1HV45y2E5YkySFT/q9ezUV6Xc7G+8U18sARIIPfG0jZfQrvqYRI8loYKBh4tvOBxywYbRPReBMXSbR+qjfqBuEGeAVHdAlBU/HSkiTZJQnQsIPp+aUu5/S+NgJDcDNgsvRUaEpVr1ppGerdENisfDj5x4tn+pHhN10d6kaYmFS9Hv4psfw60/bZ5RHohrDREapDdn78C611pkskQdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(83380400001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(45080400002)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bml21rZeXpeWnoaJ4Mht2Si4J0P1Ywzc59g1vTAeC0CKlOyx8F4YItJWNUzo?=
 =?us-ascii?Q?7S+LyXjLWH/pXXp8RsHWdgwXlrTcMnsymdTK32xS+nLTl12nAs9gzGzBMB9F?=
 =?us-ascii?Q?cv4DC5NQrv4dnFCz7xVnMPF5p+taPanvDCnb0fQ58itDtcGjJGiRe+r/JVAs?=
 =?us-ascii?Q?Yzeuyv4wW9k/x8YeyT8XxsgrE5V2n79UOSxgQGaKB7EedX79eFBdVpEGgQ3C?=
 =?us-ascii?Q?0XXyXLX5pFn1R+34oJvLFVp9gIYfhG4AFp+bWwAoSx1wsEwR8M33u4kVZDXy?=
 =?us-ascii?Q?UOJdqRoXlCfrF8wtrMeNgogp2TzckzTfw1LyGd4Fw7nGLEhcllLEm8n53Mh1?=
 =?us-ascii?Q?UQ1MwaZswrt77KVOO9elOXHu0CwaIlD9c6+bdoj00nKxHNEvTyA99FdzHiBr?=
 =?us-ascii?Q?GJZnIqAq9li2toVBqfgaLmY2uklUBHEE7GVUPU/5bH6CR+eh2tmJ5LdCaBkK?=
 =?us-ascii?Q?KShCdAHJRoVjEhx8nC7f1GFKHeevGGhGfUlk8fqrPSsZRs9xIEgBr+XKSugF?=
 =?us-ascii?Q?qnXOX0PZIFE01VvG73ElTvlL3qwQlPr9a5JqbpmYGvDMYcdA75IctXXe+9us?=
 =?us-ascii?Q?/DVhJNDl26zHUezUJyqTujCrW+fnkX6qeMFQl4yHZo5w4mJLeomKWBL/j+Ds?=
 =?us-ascii?Q?ilamHjMdE38jUjFzTjodadKYpn47tHX3Tp8k3evXDb6CdPp+m+Pzbtpbtvha?=
 =?us-ascii?Q?BUe9revzwE5EIUETYT/a71MgMMN9o4Ua40gup2NtI2j1Xa8sNsLPRgLefeLx?=
 =?us-ascii?Q?5wwOJuEHPIR7FoTSfvHUiI1rY12IWj9LLpWwCe/d000U9mhKZJDx8/19uWDG?=
 =?us-ascii?Q?zjmq62wADcYgFMGVxDW5rsfw38M6zQ/UgjfyijPa7ahw9dwj6PeLvulLbt2e?=
 =?us-ascii?Q?NmBXOG3VucfipeJN9hGw9RpOuKdHI09Ybk8Q2vtI+pC5VlN3wxCvEHA+zql4?=
 =?us-ascii?Q?SwDsWW8v/WU/UviHB+hGPvDG0MHTIGE+YjnoY/xWkw9B1SfGOBCckN1Kvv0r?=
 =?us-ascii?Q?/ju1dsIrBxIwO4ERjGlJv+jpOwMNLpFBHG4O3V4AWB6OxuLZOkj9L7WZga+1?=
 =?us-ascii?Q?bRuOn3UmfGWyurnLOoldmVNGYKz1i4iuVWwdjbmgK02627zKPDmLTTOdyTFl?=
 =?us-ascii?Q?7vcx1jZzP/cGPWBeAbQTPFKugMSJ98Wxk/dSBz10RBoR89L7/UgXZXTlI6wO?=
 =?us-ascii?Q?kPUQ7UIqCkqDWuX+JLxJuLVOeKL48Gs9P35z5hNKO2gERxjmECM9Y7gKH+PL?=
 =?us-ascii?Q?Zc17YqiFShgRH17sPsuA0TF+j8qal9jGfvk2O1ysgDo3JavdSmpa7j6ot1sG?=
 =?us-ascii?Q?ZdKB3O+Wbp5Jiac51aCojl9W4j4YK5+4CXT3Ou99YYR+VgGikyPAgnFen88Y?=
 =?us-ascii?Q?6nTj/4t32vpP+CzvZ6wKBfiJzXVR1PqBi+WtL1nRaXnr3u6YgNXD4nZOW4CO?=
 =?us-ascii?Q?j+rD2SkP86wPqndpMqLVoNxQk+vqjKEtwdw7Ovu3ycbJPvrMX9QWbURt/2cU?=
 =?us-ascii?Q?+SNGGPnS6W+XPtvVzaBux3Xc3WOEMJQ8jC2HO6v6kDU5TCeXncX/4zDVOxt3?=
 =?us-ascii?Q?tczTrv4V5s+Uhe5S/KP3mv3f7nrhQC/+zRkZxZyxzpd970xOHD8iNf2sMg+8?=
 =?us-ascii?Q?7P68suMfR6BIpbY06RDdd3UGYsfGgUBX9qzIkcTVPeAPDZy0981KQyJ79MzA?=
 =?us-ascii?Q?LcHU/A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2f325b-f84e-4d14-f5f5-08d9e29e1fe9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:21.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wv5Nn5gBAUMSE/tjqWEynfKQDUl4buC5kx5KBWWDFNL9bgYWmSMGA7xRK9unYZRChlsF9qnoTeuo+PwTynqTvnVYe6f6q/Ph7JB4aHbJUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=361 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280118
X-Proofpoint-GUID: RuzDFV5E1upMLNYAL5ieaDTAFbkFsAYA
X-Proofpoint-ORIG-GUID: RuzDFV5E1upMLNYAL5ieaDTAFbkFsAYA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


