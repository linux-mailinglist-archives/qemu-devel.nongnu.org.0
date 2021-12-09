Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5D46F2AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:00:53 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNiu-0002DV-Ql
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:00:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgD-0007nk-UD
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgB-0002t8-SQ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:05 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnBjL019883; 
 Thu, 9 Dec 2021 17:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=6yQcxBN8Ueb0mx7+rLN9Q+Hg7aviJKLAk1ttFXUQmiM=;
 b=h7mMU3OjGJnRVRVANc3tSC0Px7yTC/NIGGjxlLBfetsFwdRYGLE1nzQ5mLSjvveiEdUR
 SO1mkXcZMYR4AfbPUdSKhOZXaciFT9eN3zOZuh48g03CLP6SZflLDgaVAV4Pm1faPA5U
 tnZFUF0+ipNsQT8ekgROohXMksOW9TRydLH4Sss+YuaWhiriWZ1Ca+/T/aPjzgEcI+j/
 oOGYZX3Iq3HRTFcPwbNj3gTV1C92gjpuY94JozDj0qTaCYQAq1AqySITDDr58/fy4wZ/
 tCkl66VufN4zlDGqy2KtmFLOOdh9jvrin/Jckzf3YMXGVhCmmPsby5fXW0TopvjlgW0V dQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96uv0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HonWX119860;
 Thu, 9 Dec 2021 17:58:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 3cr1ssvdbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVqFU1ZTYUQuAeQ7u1JVpgZuFelI+Wl+T1HLQIQpKRYYENiIjlYsz/nLOwhJgtGKgQ8JghXlEDy0GEXnZLVANxB6/rLLbjv85e9iySNPyJMrdzXAQG6hx7s19i2ZS+2LHDoXJGXAVd7kBjUU2WjwOgLcmmYrHUpNyuteYmFxczjHfVhg1VW8owyBoT1l/quAJgMPMgUzVhQGPiH1bUXSKEgv1YkXAaZ1e7ZH0yiS1hzuMK74Bg1cVvDt9ciXS+kae2Aotm79Y3tKCmqNgu1Hhca1sTE7OZZ7qfysWg2f+tLrMgD9vrHaS4QGCuMoweIEXNKDxToEhsOxSY9mzoe0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yQcxBN8Ueb0mx7+rLN9Q+Hg7aviJKLAk1ttFXUQmiM=;
 b=JmZo6Wza+X41QVViJXO3Y3AgAWq5qiUyS+wBsY+pIUFD1uj+2mByMeKozKdr2bywA/8dwRW/yG5NF7RgWRhbMdb2nFE0X148IBNlmYkhaxCAXW81AipSde94uLa38Fo+273jVnkP4jHby+LJqM4PVirm5AHksVaObOK0wlVFic4JJ/8+0yQej+qv8MCENUS9dpUQAORF7TXNI4chzU2cCDfyK64Tp3DmmwH8NgfIJqE89Ocms1oP1jjsNZ9y+VTzMNJVtC/ITyG9tDcBCTUeZS12YibEHq8t4XGKFxk3BdXLijtJrczPsCfLoSUGo6Jw0+74kGVPE75mL4bRFTZKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yQcxBN8Ueb0mx7+rLN9Q+Hg7aviJKLAk1ttFXUQmiM=;
 b=remLe2Ma6Tchx3rdkvIkvUSgHEFKDtUyf/uf8eUBXria7xr+GtW5Vt2bba8cxjRIPaCcqOG5BjcXxnfAjhii/eC6hZjO9QTw8l3sms2HVsNCv/XYTIbAXsc3ZEe9IzGUHVLfzqACiOeRf6+3GrVmQTgEsu91++r9jX6mEqQwMa8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:57:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:57:59 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Thu,  9 Dec 2021 12:57:25 -0500
Message-Id: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:57:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 360bf055-6de5-4f51-7f7e-08d9bb3d6f8f
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5810BBC1879FE0A25EFDE0F497709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +y9ySnknQQqacQ6C0KPLz61X0noYQs/4a71HkKiyrn3MPciDigZDIi5hDBv5IUicERAFjJIsvB14kG0awKV/VXQ9/XDQwuJKb4BXebdohh5B+lMqDZXoWBABR4N+GK7nb9FPk0i/ZNarwfhof9DvdR/W07xpPmLO+c6Ks/rtqwswAKqEY66SsGx+I/iXI28bUvLEFvh6M+XgESLVdUUy7qzj3askbxVNZODj5gux3sNU8y8V+DtV4GNA2PqwJT3lnHnN6BMwOhOAND0bohLKuH6vpnmH9McvrFNudpun96XUSKInkQ3wHgmkUR+iESx7AyPsfjCe4/oUaCmMb+mVgxerU4Eser8rxYdet7YzkuECF40kHOj2OAn5zkCFR22/Ew2ku3vIxXl/b5FS4TExe/Zf9lbseu5SSc5ZIKj1b/NSLXJ7ObYv6e0yg/R+XQgAGtpQQm7gT3Hur7QV7HeWydRXUONZvMWmeIw+HRyAdZYjezWK7tllfIQkw30WiBOZak6CzO5inALJjiSo/QdPjtbRya8Epge420h0b1Ls1GECrXFAy8Hqb5e+3dyCKofQJYXrsNoK3sQm5cz253bQbTnhGwG5C96iwDUCeZqnyGLHn8xea6DOiJd/+k5XiEWI6X1e5PLnra6mIUcZhF8NE1yeWnSgWzH3cGqgbbOUsNcyzca13VvB8d8khacUKlpWHXYI7DEGxRkM1825ecRXbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(52116002)(38350700002)(956004)(83380400001)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77E5A69/7U+4z0MVY/soAj2DNRxQLkmSgby0jUbEN9Yc+PjVSzF8LsN3ZCgu?=
 =?us-ascii?Q?5DRwbrfM9u59O/V1136eJOitq5OubzAl55rfVLOL9ka+3519cDI+vfZQWU/C?=
 =?us-ascii?Q?sxBjoz2VhTLYbANys/MhCM4ZoZzGKIbjQR94kC3+64tNAXilHMJhKNEdcwuh?=
 =?us-ascii?Q?360c7e5uUs4lIdi3oF6sv13ONqmbGmpi5m7aCtgC05rBdbpbSKAdjh9tgMeW?=
 =?us-ascii?Q?JKF2E/y12vek+RYzHV6n50AqkP3+i06ewT3wgbXvKZB3C3FGjSP1lbepa5jc?=
 =?us-ascii?Q?T2zOX2EhAg+OMogCkt98NBrBa1V4Kzy6TnVA3pVtnOdYmxdqRERFCid13NHc?=
 =?us-ascii?Q?N5xtCinh29LAINytPCn8cpqhZjf7fLnKINbB8UhNZYaREEe0ehAZ5JNIB8lV?=
 =?us-ascii?Q?QiYpRgTUjncjZl3oqEcpjgDoEh5ZQwY+aSHa+0+Lo4VMr8MatyqQn4AEFDP1?=
 =?us-ascii?Q?nCPLPf12igK/IcPvxLlaeb/Ijecf+E1rBQ+isdM2bahza8LIchq4oDYb4O4y?=
 =?us-ascii?Q?yn6cU3z6YtTG/0mzyPDF6ymjDz6etSN2SFkweZ12UIRND7lvqUDGTyyt5s46?=
 =?us-ascii?Q?2AGpHZQQwLVgrcFH+NXwEIdRUNHOIOjHDjN6AZMdYMwqzXPjXw1hH4nKTJ/y?=
 =?us-ascii?Q?UNbWGFDmOxJGgogB61rYQLJEBa+9YxBsckOIfGlgp86QljDxzgbFc2flukjX?=
 =?us-ascii?Q?s1EATBDw0J12WxBV+Wtegtt9ie2sHFogHiWVBa2pbkoYTX5XWafH0ImBreMs?=
 =?us-ascii?Q?pdazGhUdO94o1rMSSJeov45QbquRzbfFVKXsBg5vhz+uMAeCwuINP9b7guCQ?=
 =?us-ascii?Q?N0ot+xK/EnpYuRrFlfcwWKpz+cqJlQpiP0lyECHCyTZkzt17re/J3XcrOxZ/?=
 =?us-ascii?Q?ExLk8xC2OLsbihKlm0Tpj9RUaIi+KTlF2JFTl+rWbeIg5IpXigBorLayg0+a?=
 =?us-ascii?Q?MVkc0JvVsvnPJ5PCIeKkba5XwfgM3MPh9YskMnsjgA+8+AERhTHpLQOinmB4?=
 =?us-ascii?Q?7mMBD5Aki4ugOsxV8yoEQwOmcfT9H3ib2Wj5QtEX4w9xNkH2UuhrN6KrW7lO?=
 =?us-ascii?Q?6wyiVeqNhfnQacZSeuk9c//npPBD70uVX66xYYO14BslPxYxbXYGBGUHSfZs?=
 =?us-ascii?Q?2zNaVYzFcSeHA0oZ1Td05sGkb82k6AoPHtfKjybOr9ZMKGOAxl/mAycwWK4K?=
 =?us-ascii?Q?DB+SBNAgRHqYXdgAhSAU5OkW81bmZqqBmubvOiSfhoO7631xoJ9/CsKRFRZF?=
 =?us-ascii?Q?1D4drrxWAxUvxn7bQ3K1IuIBshTM4NRRNCT0IjE5+GXXWpJ1ybzKqySBNMXc?=
 =?us-ascii?Q?HlpIrzpVIrQem22L/ldOrqkoerOpeyfAC8sMt5rl/bwcRPjhuLjs/wt2gogP?=
 =?us-ascii?Q?VWaL5VzwUJPwgYhdpsBsAPBMpoXC5dN+GUV02R8sjvcO1decfjtyUNjuryaH?=
 =?us-ascii?Q?Aoq3E5fpsFVPD99llR7MLCeodv/7tTLrU1SUi+VHi0eNfwqpmoin0aESRfyx?=
 =?us-ascii?Q?4SPVZxASaxf60W1q6Q5KNsV12TDDGudAa83wvse02s0sxH0+6KZzUK7LdZMC?=
 =?us-ascii?Q?ZUG3MPk3w0fGE1v/m+h89WTc5E3jvmgkFr3LaBPWT5WZHGOSAnblVCp6OI9L?=
 =?us-ascii?Q?3qSyq7lax15zTJBOPQIqR998D9i3JS/jOHaiEtV0HvK6RbXS/HeOtvHFoH9c?=
 =?us-ascii?Q?EADcdw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360bf055-6de5-4f51-7f7e-08d9bb3d6f8f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:57:59.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2XJk7vf9cadLXMt1OnWmX0+obovDwqhEQ6BXITH70xNyr4Sg8yPZjdtLKotnUW0/9tROf5hLJbMzar2qCD7ivL+C2IrTpqE2qxPTqAcsR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-GUID: s5B3Ng0gNXvjY6HaBP27cu0DOmyvPmxz
X-Proofpoint-ORIG-GUID: s5B3Ng0gNXvjY6HaBP27cu0DOmyvPmxz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v10: 9dec2021
 - Addressed additional feedback from Ani Sinha

v9: 2dec2021
 - Addressed feedback from Ani Sinha

v8: 15oct2021
 - Added Kconfig option for ERST, per Ani Sinha
 - Fixed patch ordering, per Ani

v7: 7oct2021
 - style improvements, per Igor
 - use of endian accessors for storage header, per Igor
 - a number of optimizations and improvements, per Igor
 - updated spec for header, per Igor
 - updated spec for rst format, per Michael Tsirkin
 - updated spec for new record_size parameter
   Due to changes in the spec, I am not carrying the
   Acked-by from Ani Sinha.
 - changes for and testing of migration to systems with
   differing ERST_RECORD_SIZE

v6: 5aug2021
 - Fixed compile warning/error, per Michael Tsirkin
 - Fixed mingw32 build error, per Michael
 - Converted exchange buffer to MemoryBackend, per Igor
 - Migrated test to PCI, per Igor
 - Significantly reduced amount of copying, per Igor
 - Corrections/enhancements to acpi_erst.txt, per Igor
 - Many misc/other small items, per Igor

v5: 30jun2021
 - Create docs/specs/acpi_erst.txt, per Igor
 - Separate PCI BARs for registers and memory, per Igor
 - Convert debugging to use trace infrastructure, per Igor
 - Various other fixups, per Igor

v4: 11jun2021
 - Converted to a PCI device, per Igor.
 - Updated qtest.
 - Rearranged patches, per Igor.

v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igor Mammedov
 - Did away with use of ACPI packed structures, per Igor Mammedov

v1: 26oct2020
 - initial post

---

Eric DeVolder (10):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: create ACPI ERST table for pc/x86 machines
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test testcase
  ACPI ERST: step 6 of bios-tables-test.c

 docs/specs/acpi_erst.rst          |  200 +++++++
 hw/acpi/Kconfig                   |    6 +
 hw/acpi/erst.c                    | 1087 +++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build               |    1 +
 hw/acpi/trace-events              |   15 +
 hw/i386/acpi-build.c              |   15 +
 hw/i386/acpi-microvm.c            |   15 +
 include/hw/acpi/erst.h            |   24 +
 include/hw/pci/pci.h              |    1 +
 tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst  |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst |  Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test.c    |   56 ++
 tests/qtest/erst-test.c           |  167 ++++++
 tests/qtest/meson.build           |    2 +
 17 files changed, 1589 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


