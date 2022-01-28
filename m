Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DD4A0245
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:47:54 +0100 (CET)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDY9v-0005y4-LA
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0w-0004GN-AZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0u-0002g5-HS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:33 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK42Ls004922; 
 Fri, 28 Jan 2022 20:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=wO8mr1KJR8NnNEu4cesM6BPPmKCFSZQB105hgmHMp5AH4OHuTVvTqJNQ7ZZMcV8EU9Ms
 hrywJqj3aZiyOhj1Rj0mIwBvQp0Q5YU0VNXyfg3wSvTvNK62yEz6EGHxQwLplfmfeJD3
 GcdvEK27XXthjE+tRgcP8AruFipmM1ZxFYw6ee/CJYwgyiEbTp5/RMeew3aIsG9t9F7c
 B8zrdhssQZ8os9o/ioX6RYSM0YcLUh5HBz1ke+OZIPwp1pBSSx/eLg1fyln6lA/l9MCy
 sSvCK9is3B1UkzmKCsZjhKoZZbMH4ul2PJm7J3zPQjmozq5DlBUZmGsf+CXxGxDDY/5P 9g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvnkch1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKP9ME185731;
 Fri, 28 Jan 2022 20:38:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3030.oracle.com with ESMTP id 3dr726jfgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNeBArSVaahoUDCYcpdsNaC9PNaaUZx6i1Hcs19UjUUHAMLccvB61A5BPUawEMnGvxXpvfR5L0ansnyclwY3+OP9Qye21h7JCIfFX5Lg1znEGL3gtVCnDiUlmeFgE9q8LT7hLjzfTjW/TVFUa/D2Kqbs2rYL9S/UnnH0YQVSDZdKHImeFwIYPX4jmKFh53FVhBed2tgO8W/VlhOtj+ivP2n3i2muIxvhxR142OO2vvveOak7KnMGd+5ERTSgxZmSnOYl0oer0C/wPkschJ86oWwrakBrf8leEOLw8xOT3u5W0ej04bGZ7IQkPrKZA2ZSSIvTq+5gZ8Dxt30mI5y0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=TNJiQkcGVmW8ohBpJdkGLlo9dbUkFqzIri0/HyLxA+EvHsXQUIyhG7Yo02N4wRj1n4AAikpItA85627ktUbVlISWo6i/MiratPde5HQ+bOoueMOODnFIZy+z39/d7dDVCIbtoZo+o2V8u+or4ppFS4pa5NWIB/hEk6yEuHetnf76yCMF7II5+a3HYoaBDTeZ7/0Wtm8asay6u0uBkLrCJOk8RFZ4dugf+YAdbWskk2iTEy2rsPn9E6YnhnVaXRtU96VRDuYCbMyrC9BkepIQQxer2PCXqUPmizs23ccAT2X5AP5hxSItvMmB4uVaeR+2UGA+hJm4x7zke8MpFo9TGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=NPfxVThBm6YbmSRgmXeazCv+aE4jA8mAs3qay08V5vc2Zt0RcHez5duQLpLuwEy0nKv1PxnCwZv9wc/YDOpH1QLhg0nr+K+ofcNlvW4iPaJ7yVxaZMdANIeZKX8REKnssR1Vyrn0YJwHEPMWXqo9VcmuKY095QubLpE3hnhfgMc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:25 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 04/10] ACPI ERST: header file for ERST
Date: Fri, 28 Jan 2022 15:38:03 -0500
Message-Id: <1643402289-22216-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4479d176-9f0e-4f70-32f2-08d9e29e2213
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB553095BE26B258EE9955A1FC97229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AcLIBfeXTxmbkgl8jWIDSZ9jna6VuVxXXYvB53C0lvokMY42cB1CZ4JL5+R7uBrAmBfYPuvia+U+puHnFGRzLqvDtKVZ7Oj9Xdj4Cly3onHU3QaBExn95NN6tbnXmCOaSvneeVCj4f7MGVdDn1V7qUxJwyLAW3Bi+nwROUVqByIEGA6mBqCsMDilT6xqbdb5x0N6+w0aJX8tL/ul4O3nUpGW+g2MfxBhw/YfKmOefDmCKYB3f57xzJtJhSg8Ad0c5tTcjCs8MNZilJJSzjy84+XI641kojRm2Mb7C4HG3FctwmdrKlVxI4EQw54vg0NDd+HSwLBLiC8OB5b+NR8TTvo05A9xDyTGiJTlzqohzVXxyo3IZ+EMliEnbTIj3dO8lCcBV1gW3f9zXaImBSamDi6wkYraRgNcr6w4RmXuAZPuL+W3KAu/vA1XXwVnZ4Nw+3zbIU1ECbdE6zv5aaFjyPrWFXi3iH7noFy9LskqOrrM9iOnyxMIUQMlS9TqIISP8QLuzJbEaiNLvByOO6kyvIJPaLEggj7P5WU0DLvqeUPIOIGB54FToHs/HzcT46K+gXH7HgIJROyWZnOKurujBgNMpx38unSbDUrx+nMmXtg28NP1OG8S1LKMXopukeNoHrnIUbykzT+XaEjoDcw0h1h2intAArDHRdByRFOShionf6lmnMgaJG8s+GHIsGG5tVQqmPy1YQb79WuqTvcYAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(4744005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ij+rkTSw6T+DQsV99vhDWTSKE+0uFI4gkMhR5ilqvOxsDrTxWizRbCazokd6?=
 =?us-ascii?Q?BZLC1K4+xB/i94iFCzCU2doldRhnsf6d6ozQMh6xIN4tvkL2HmAXF78VvQeX?=
 =?us-ascii?Q?3TeCAm+qRp97U+nU5asZ0PzgoJ0amQuJAKqprIVHHh/FMfRgSHtBx5V57pTW?=
 =?us-ascii?Q?IugFUVRgw4yWmX7eGiqnOoz0VX8vc2PUQNooPOrK/VqDCQEdIxXDIxXcUFSm?=
 =?us-ascii?Q?VgxgVdSZ3H8tIZ2+J5v/4KLJ820l7+GFRQVwrFsq/DK7FNb/BmZyIVNfUE8j?=
 =?us-ascii?Q?JYYcCDe3Z8n22akzgCqILQhBx/xs97cHtZPILLbylMEqu84r37/I80Y35sLK?=
 =?us-ascii?Q?LgWYW2WW3Ovc0okJYfEMBikmxrTEIi1j/qFGyHVaZS4gKAo415GHc4BaNenF?=
 =?us-ascii?Q?ex6YOHjoAk5gO1S+OU35K5iSFMftrc2YhtSk5/MKPDO4m+bLAtkHRbNZQEv4?=
 =?us-ascii?Q?S8g40mVakWUOzSRnyY8cS3UQtiMPmHujzT3bE60NW+aLncUM360quWmv1CI+?=
 =?us-ascii?Q?lmKnq3crvbjAJOavJ75ngMx+uzfh8lSR6e5UNrMVYtPtzHBOOf1QlBScmA5Y?=
 =?us-ascii?Q?hggAtJ6u82WLWj82f9eU+zyp7wT5dXRP4tho0MBaLvJ2ZGQYv4uyewII0T+g?=
 =?us-ascii?Q?bOe9m5ikvLUmUe0E8gGotc1ksjAtqW5UrNuHXvyLcszHkjcUG/B0Yo6v96HM?=
 =?us-ascii?Q?BS+mfr/CajApA6NZivflK8RkpSahDm77nUcr4IVkrYAab/CIk3bsgHD0D6YI?=
 =?us-ascii?Q?eBm86Xb2ikUa2C3j7wFgqLn4oMnQRjRVkv3aJFmWMuDIV0Ye15Iw5ZCRR7nv?=
 =?us-ascii?Q?l9iWf67GR4ELpqbVEKDlpSyq/I43SC8E8c9rmBPNVgX5+FIgkzyeKKsPnkZ7?=
 =?us-ascii?Q?OjipApRlWl7TzQpJtWP/abV3HSAar892KnTSBdNSnEZsWVhotr93q0cpRhkx?=
 =?us-ascii?Q?UWWcRXrQtf0OH3omZc/qkTvpb/ZlOkKhdoJPuDogntiUs7xPvXZV7hqU9zwm?=
 =?us-ascii?Q?vi0I12uCv6mSmtQVsTjblvizylFSb+FlfCWEOzcoGkn0QdSxh11XFzX4/sBe?=
 =?us-ascii?Q?x12iJSIVnWo4EnZe0tBOqsR06+KsEHcObah8YMTwrJc2/Dnnu8ILYwOJjPz8?=
 =?us-ascii?Q?YX5RNYVt1V7c+fPl5LoPfbVZx+6mo4eawanANQTGOBXaQn7ed0Jd906rrKgS?=
 =?us-ascii?Q?ZfGTOE1/0aNoGEcKaNi4vLxDEqb2rAGA+jGCxgMqxzfdAOBp6lxLUAW4HPn8?=
 =?us-ascii?Q?0etHKXvpdB/DptWRozgYOHh9YFxfVUaxiEBFKPqGmGzSIrjdsZYTZgioVnwG?=
 =?us-ascii?Q?YZCICPdDw/6nrxdI6nRr4uQTUCgDV0RdvKk8QISpJyYMYWlwY5QVosx24Xx8?=
 =?us-ascii?Q?5iZ52u01Bbhd9SdyvObnkAfsUMdn6SfXGNXaMORSgjCkKGEp51UgBlQTAWMB?=
 =?us-ascii?Q?ReNXC5g4GSyrjs5ZZ9jnHokyj8Rl3xlQm1T5W/5QzHzPcUKVSXpUlWpCll5v?=
 =?us-ascii?Q?HEoh8Uw/8ZjwBqO/HV78hGKD4EkMaKsJzrHzITClnMsFdd+mFG8iiBI8RB+N?=
 =?us-ascii?Q?cLet1pJJA/9UA8xY29Q1sRDH3YNn4qcKn3nnUNt7ehXEkymJwL1yC4RA9a1w?=
 =?us-ascii?Q?Qg28niEumNZtt8fAgsCuUrTMMwZ3CbuQai5gftaYOZkDKuXQRNvCvU2z5R9B?=
 =?us-ascii?Q?aZYTXw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4479d176-9f0e-4f70-32f2-08d9e29e2213
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:25.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEL8CqdNi9DcYBmN3A8B1PsWLgSBVsiZwvrqZumFh/F9s+8dP4iidiP32EXhRRf0ymUM/NDLTifpmZdGCP9ORexAtq2NyEVBQ+YQbvtdk7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280118
X-Proofpoint-GUID: kNcFZ-MeJpdHU1LHGtDMwxFfqDxGQ9Ku
X-Proofpoint-ORIG-GUID: kNcFZ-MeJpdHU1LHGtDMwxFfqDxGQ9Ku
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

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..9d63717
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
1.8.3.1


