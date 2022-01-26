Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8D49CFC1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:32:02 +0100 (CET)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClDF-0008Ox-VX
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAD-0005yR-G4
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAA-00031U-QM
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:52 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFodYl024356; 
 Wed, 26 Jan 2022 16:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=HXaRUt2mh+2L9t/cSaJsiI9ON3mvFNB283/zYmKbPwA=;
 b=Nv3aKlxtn8G4pZakKm34cPdgRrrwHXHErcmw14rutkBCqxB6duYOwgldaVRF3Nyj/Cj5
 PwYiix/kttJu9fQprSlpkRY1ImeEr3noBSskeSNHfEvP9o+eOvXo9My1BfAcYW0Z9Xj+
 ldbHQinAVkfT1k8TjtLHDePsFuKeIXQ26AUfbhmhurg44OTfv6u49HluTcifIjpbClh7
 VBGbFfRfSJpKVM5epXJ65rFc0xLYvSD2k2F9ad1kazzA6RlkY1RnwStc5MKUv3B3/nix
 OSpv6mgTQtJsN0M8kjiX3vKcKFpvQ/Bnj8utYjBnT5sXkyDcdm9+aQsHs38VlEkeWtxL ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6g5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAo5U183856;
 Wed, 26 Jan 2022 16:28:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3dtax8qphk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaYLVHvBZHqn3rs3wPzXcHvzuBvlEewKG/N61oIn1GYxP++H0P8pgjvLlyYuJFfFrUb1hyBTADNLSAXP/KS/ZNOJRBlO30cwmtrrdxZXLmnMt0m/mF2a0g4S9ytIlPPEup405TTFcH8NiUDrH3WOscoB8o/+nnUSuA+04zjWj4cuiApbS/6j7xduB/XypcmLq6FSjn9h8AbceDSo39oJIa2Xgp7Us1lz8YK8VjKOFBsaGnjPIb3vih+6qWwOTFL4k92hx7QeScHk1/6EHBmaLbZiM5IA5iVH/0PWn7dg1nSHLabNymeM+bNK3j2UFA1OwgpL21+lRvG8QHIyB6BdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXaRUt2mh+2L9t/cSaJsiI9ON3mvFNB283/zYmKbPwA=;
 b=ce3U/nmVFo6dFwwJksSAoGhWcJxF+qAOnrXjieZ/7OZQqr1Jui0zq5R2/fOhiyQ0qJHgojTJqR7zIAs0HV8PP1O0cbo9BnMs+QhOuHOZaePm1Kv5nPHrXN2m5CILB3BxfyBPgErY67/eyVLfYkfm0ZzukLohCB1pMI6+EL1pQajg4xPClT9GPv89e8BTfcAuWHmzGh2yuMpRaCV9EM1zzqrWZ8iFR7x1rlmc1M1fofueB83FAo9i4CJreF63dNyl6SWYsos3IPfx1PYhitOPH+Y7J0eOdAy697fIp5h/NA1vXGLJgjkr+9Qe6xSqAgCuboyJ+qMSbTMXNAiY2mFctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXaRUt2mh+2L9t/cSaJsiI9ON3mvFNB283/zYmKbPwA=;
 b=jVMbQQ3E30SsowNK6VcCY1Lp+eYyr/JV4kWnYYwgmEh2b5NXH/CPjM4WsnWvirNl6AI6cz8i+gl4TPgwdm0g36PJhiBfuFP8GhngNYr3iTjc3CVLsr934BZSsLxqC7FNuzyr8PwZ1aasL8OQpXWjkPlMEhQcxNz1cxj5u9ipiV8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN6PR10MB1571.namprd10.prod.outlook.com (2603:10b6:404:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:45 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:45 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Wed, 26 Jan 2022 11:28:24 -0500
Message-Id: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 403f9437-dd98-40fe-bd86-08d9e0e8ec4e
X-MS-TrafficTypeDiagnostic: BN6PR10MB1571:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1571AC8163C240C2F82DD95A97209@BN6PR10MB1571.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYhJAb73OTuUnzHTfosx1JdlCBWht4PHn5494gY+Sq03LgtOZx3plGGUMVU0Br6v7GrhgmsxcH4HZY2EEjeshe6QL679u4S2ApSBxVPee6dqGhxg0kS6Ghwqwk9SpzX4xr/E5RlYhQdt0lt8TzNNRLh2KPjSl6GYdumzb4BfNDbCaMNKOQsX35JFmMIY6LmOXHd3KGf0tYF3IJNN/uZVRGYPztPJmNbfTamEbK9Fg39C9v8/MiAb8+iLaRx+ADYkL8KmA5TTFUHpo+vsuyh5yQKjc0g2rPVOs3k7308KGf1sI+MdkFEIYCpCmPN7ULkljnrDqx7CFQDTbvjTXvi0fYfyH53i4n8e0KemF+m6ZBUi4WLv/uEkXO3L8Vd617iKIvfQnc+S0s3idiXl/EqxpW2QPp8IWE05qBL2a1q/pytchLlX7u85a/QwEPpxJlk3XgmNtrZaYfOZUIVLK5SWe5eVjJBlJyw/RvfKzd789ybOD0NnIhAG0K5mqhflUyCwvC9ZDu7evlWHs88dIMAWDvcOY1Ecg3kd54cr7AZPHY2sR7auV7Cf0o9reu1GB+npCsIOAvfrW+wnL0/dvfzEWGc0Q/I2wPcCdg7bwI7cfEq5B23DnKn9bfRTZC1RyVAPxyYqYllC6XVtvnJIf2oPOZWLinqlmfyNSI+Wjy7eY+FePdetxNmc5TOWL56ebpf0FvTp+Rxh7yT98QzDg/Pdbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(66946007)(2616005)(6486002)(36756003)(2906002)(52116002)(6506007)(508600001)(5660300002)(6666004)(66556008)(4326008)(8676002)(8936002)(6916009)(26005)(107886003)(316002)(66476007)(83380400001)(186003)(38100700002)(38350700002)(86362001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a2wPvcHFFFTyuKwSoLISt8zmrGWin2KAdq4Y4iSnKOTiYr0Q/pvpW5Re3YNi?=
 =?us-ascii?Q?JvFW9VENhbUyx3+a8fao/nBwEyk4q/IpKK6K7xkyISKpNGjxrUmjbItnSLQU?=
 =?us-ascii?Q?ipAI1h10lAe+tr6u4mySgGGc6ub50dUr3rFVm0AlXexGJQD6gW076wXY0eRL?=
 =?us-ascii?Q?UGNe0tOZNJmrPZV9F73Znx2+MV7KW4m2Cgl0e5VvQ2MZuTOIvU50/J40GuUb?=
 =?us-ascii?Q?bpD99L4stXWQPK3M15f5s8Peqp9oXh+rjoPkedIzdu/+lEnpilEgDOQQZUWO?=
 =?us-ascii?Q?NMI6LKgPzErwo4DFfmXornp6ZNsLugd9wHdUhnVZfQMHgb9tirYBD7uAWaLe?=
 =?us-ascii?Q?JzLYJYTaSMAbdrBLCtJe8y4KDadB6ec0KC93inDIz8aHqVklOoqo5Yh/xoRf?=
 =?us-ascii?Q?0JWUjpW01wKZM5SQfxaBICb+ssXsBCpfvYMIX8s8foLWQpuVaBC8BzaWcBnF?=
 =?us-ascii?Q?4fDaYbpoQSiVTaY/5vV3E+Zf8Jje7bv4riOWHiIGdeeqbZczUPGDduTmvAM8?=
 =?us-ascii?Q?cGM58AHR582LomjywGbjSJckHpAcUC9B6by3GEg+3/3ULMJp1FxfgHm+HGa5?=
 =?us-ascii?Q?X+JoVtV7XSowLAUi5UFGLu5ugC06Usx7pWkQiOo1JpbwcQCMbF5KxVdYSjGe?=
 =?us-ascii?Q?F1gJzDWxXVpTYriJ7AaUTpziAuwtLjl0NoNTpAWoKs5xFsCYWzO3FuUcgPwt?=
 =?us-ascii?Q?3brDr7B/dtcxVT/UxxY3QyRfdJAZWMg/5sSx9qzY3Je4cmbBPJWn+N6LfaAw?=
 =?us-ascii?Q?wbxnBC2VXCROPH9sScqse1DbrED7COVXTbDIRsyL1LKu4psVlYYb2jTSXj7P?=
 =?us-ascii?Q?CE1SGl5z3YWHoe8y3+u6oKKauSxEYcBppcB6mp2SDV4axRt3LtL3eal4jE2/?=
 =?us-ascii?Q?u6wbVyupDy3l6S4vT1/7Itw7hCilouUr4u7lH1mAVrpjV2V5oKxE7csQGAOR?=
 =?us-ascii?Q?28B/gSqgspzQvCwlErPwO3k1lT29trrFGyhRI2xOlB9lN6SIZI57j2yalwXR?=
 =?us-ascii?Q?VsjYcC0BwcjNg5+LIafu9MIRRjYl4Gp+jr1ASJcVHXIsUKk7j+4FvuDdYK35?=
 =?us-ascii?Q?MaSlZwzJp/shCS00+2pJkyOK/DfZaW3AzeRVWG2z1/+gpn6BPHrxjA0vs4Yi?=
 =?us-ascii?Q?fj5bltOw2OYy5sN5/lOqxGXou5aW8Lx7m9FbaQ6EmKjBFi2bQaB4wiS/Ekxf?=
 =?us-ascii?Q?PBe4OYVwzcx+el7FlwZfPy3jOFsw8inrZG0F+sW2AiKMo46rob3aq1GhjiZe?=
 =?us-ascii?Q?V624Pdvb2XA4f/e4yHKkKdJ4w8iuFb6xYFydcrKNgpJS4JFD9bf/+stZlLSh?=
 =?us-ascii?Q?lZS0N+Rdzcpq8Y8ql15CN11eLzAW92EOQukO0nOLmQ2W/MEetQ7McJ+KRg2L?=
 =?us-ascii?Q?tRrxQEchzGsG2bZIN/z9uADBULeczSojCIrF+1cWk0KVqTFvEQk9hzZqAx8e?=
 =?us-ascii?Q?nsLfc7eJP1bMDj5BFO7CTdE4J74+XcqFYW//ed3kTXVobRZui+nM6g1OwTOu?=
 =?us-ascii?Q?yJBI0cG84PxKp2TV+KLV9Oq4W8OMKmD/8najm79hyEDG5V2gTXAZkYksNvPr?=
 =?us-ascii?Q?RZWVH5U6L3+7X8f1zGFvkCrOa/Hmcpc3dWMIxf9ZzaKUgGcVMt1vhCUWoCZl?=
 =?us-ascii?Q?vpPgEm8cNqqnNGZf/mHd2Ij6qLfiPhnAt7DcH9KW7SUfBnlWVyle/e9T31f/?=
 =?us-ascii?Q?ZJOtiQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403f9437-dd98-40fe-bd86-08d9e0e8ec4e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:45.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gsZh/KOHO0M19fiDYmBxrjdfOHeEpTnuj/FIm/mozP1JBdUIzC0Loez3ruCIgXq0jR4M1ZGFaH8vWId7mqLgOQu16Ig067SPsMMhVx9lYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1571
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: PDCwgygmJr0qDkF5t-myRT-L3sbjnrVm
X-Proofpoint-ORIG-GUID: PDCwgygmJr0qDkF5t-myRT-L3sbjnrVm
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v14: 26jan2022
 - Changed build_erst() to utilize a context structure for
   generating accesses to ACTION and VALUE, per Michael Tsirkin.
 - Other simplification per Ani Sinha.

v13: 24jan2022
 - v12 erroneously omitted step 6 of bios-tables-test.c, this
   has step 6 included.
 - No other changes to v12.

v12: 10jan2022
 - Converted macros in build_erst() to uppert to follow coding
   style, as pointed out by Michael Tsirkin.
 - And few items to help further simplify build_erst().

v11: 15dec2021
 - Simplified build_erst() via feedback from Michael Tsirkin
 - Addressed additional feedback from Ani Sinha

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
 hw/acpi/erst.c                    | 1069 +++++++++++++++++++++++++++++++++++++
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
 tests/qtest/bios-tables-test.c    |   54 ++
 tests/qtest/erst-test.c           |  172 ++++++
 tests/qtest/meson.build           |    2 +
 17 files changed, 1574 insertions(+)
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


