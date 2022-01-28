Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27F4A0289
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:07:18 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYSj-0000oG-Cw
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0u-0004Cq-R3
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0s-0002f2-CH
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:32 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK3sOu028584; 
 Fri, 28 Jan 2022 20:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=6z6ApmIGvfFIYOMGxNvTmuByGA1Yy50GD+VcRIprtbs=;
 b=hzX4H/NXulu8B2SvcM47vXTw9srid44cltRTYgtedWU8FQUxDVa8RAZszw+cnD6h9Czm
 1uC5XyO84//sLyDzXm/DMQz7DxKv8F53I1MaqaPSsl+cOFn+JdjgbPaV6iGPL+dM6acB
 yj/2qVkIFWbvmC3HzR/v7XabUU8+OQbMIRqR3ALfNrkrD0OI3vj4aFAKLKIAMJnsEpJ/
 DzFI7X7ufrC0F2s47Dz/VGuwwKydPYpxjgFSERyI7qcFIg4Nnhu0009G2SGyFC+VeRdZ
 A8FW4BmC+vcZ7gCVqqTWZ1/dJTwn96byhaBC2th2xW/SsNtlLGCcWqvilCiSViDWqHT+ /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxmea7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKPTpX155655;
 Fri, 28 Jan 2022 20:38:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by aserp3030.oracle.com with ESMTP id 3dr7ypg87p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEPUnbEoctpNEs9EEjs0Hiro8fyR/9c1sXx1t1B3hgC8uFrNLpSZ9WPQfxhuqrG/9ne5Kg5+XXpBY7EzA0ZhynpasW6ZK3QqtFT4tkqFxCzCSiGIK718YvfE/AWu3VR65Ka0P3cuZclqJBNGo3lHY5kkProyN+4abrfnkiXA2hA9CwYEM/1VmQ8I46jMW4Er1kwbkfUFF1Kpv4brehc7Rdbwjd+ee0fl4cM9GTkMoGoqK/t2NMesaKxETwVFpUVSmtZk+e4MKgV9hclkfnP4i8vfysHakye1Dd2EHxibTlwiGr4YXxw6qjiv0k1gL0jqUpd9cW/d/uWlMZDI4e+jJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z6ApmIGvfFIYOMGxNvTmuByGA1Yy50GD+VcRIprtbs=;
 b=F5VJ6tpkMu0DieTn6oq365/ElLR8Op+DiGXN6R/orwttvFCqnMzwhAIcAKI/E1X3yxaxi+sa4Ypxuvhmuy6uoFDQtKwoKuvOTpGUXkk3oMdml68b9WOpre9+H85QhOf5XXXmGYZsLgSjfDpsSQl3imOT4tdYVaU1f6x0VKYCaMEavEIuNBtTc5gqvIhwTqnG4jL9OWumsqJDKr0rvN1tLZuXS+08BSUlOiTs8Ic7L2N5tRbvRBCuGrIYc/iKaHGpu54SBpGEil2lTen+P3uXGhjl/pRBQnZRkhC3sdPhC/kLnpei6N9avcZJA7TtJjzUIvY/llhh0oEtRTP0jKCSbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z6ApmIGvfFIYOMGxNvTmuByGA1Yy50GD+VcRIprtbs=;
 b=hkBY5HxwKxd0rsrQrvvdI5opluscjzT9NUDafLya6gpxwKLbQ2rIJTWdhtflQiHUucyVK4Msk4kSsZLVZCBYc0cYr9N+V2QaCjrERctfCfpRQ1fJhjmhYwRdWgmOP5C1WLGBskkRcLrIzzJx35/vaHeVMI3cWrsWamKLXArd9UQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:18 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Fri, 28 Jan 2022 15:37:59 -0500
Message-Id: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 324e2a64-3544-4162-7579-08d9e29e1d74
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5530D9FDDEC14F2D674B63BD97229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHKf8ffkw82iXaynRjsycVkGU4ZlfRIPdxoK19VqOYMu/e5w5tCFmmkZGslzO8tW3C5rVpEAeLtxPj0BI51oTZsXFQK4VfAAO74BgJPiQdokzDIsptPseVAj7oyBzYBb/GDDIS/jbKv3vH8yzG5jrHQw602qcORa4/0iqxBVclxuognC+SEMN8vVyCuOTarPmdhewfn70EOHIsiT2vw17iZYGIMDwOLo5wRBjbpcqXMYXEQnH/ryM5YDy+DazNgig8ePD+3fWj00Nw9I0aitPnMWbs1V2tRpaWmS2GvW2pb5GVnF6PpFXOgW7V0uA7ADXUzN4YFxXRD+W0FrFdaSEGK6HPTAXrQ84NvnlhPBK/GXeguI8t+cHxPpt4+62ZiqH2Jd01DUVbn1FD2dhCgXJ3aipaoJVV5K3IJ/L400U1Sgw7pf/foZ6K08az28sDpv0/n3Qs9m59wE11hAzwBJluYKm8pJXDyRi3k9BjZtTlWQD0zIAi0mn2H9WEpZwMzFOLtWvGL0u/8UkKtMWiqHpjwkwUCWwM9Cxmkt31Sj/xf5VpRaZBIMS/emSLXwRPbn9eTMc65Do7l8X3MOFqlOIf9I9ZQyMnr/ESx0BbmPmkicz/qUcbCT34ogCVVvPhJpndHoQyTZfjMvTsOkW1BUipsxkQYvWBOL8zlPiXuyjaiFXnc61LuQLfeCIc9ZYt+PPZ+XKrnmnKsY4zx2BCF3BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(83380400001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpInVAPSboTwLxdFV92rS1Jp8Y6LpTmT4ekm4gzVOzdN5WF8k9PktIFSN3Io?=
 =?us-ascii?Q?iZz3K3g+91IujlLmR7buQHVzPkUZYE20x5JnT3dc/3oeR6fiI6ZaoGudurN+?=
 =?us-ascii?Q?78u+r3uUfIhUyqKg/gMjVZaItk4hieRZ0gkP4nXknQgHs1cxzfd0c8OIHk0q?=
 =?us-ascii?Q?KcBEDhGj81PYjaR9C+jfG64Ozg34fZz6v0zOY0AXKd+HnTgBnJpIl0ywX/P8?=
 =?us-ascii?Q?Xu/NsoFPLZ8etH7fLyhAjCS2Jgf1u6T4uJxn1kPyDFSVuvpNR0GBMNQZFGNx?=
 =?us-ascii?Q?fEnLrKu257UNrMPpPrEBh46HMOmxMZte/2XPuH9bfZ76IHzy5EhPvxk29jCt?=
 =?us-ascii?Q?ZikdeKqeIvZWR8zKePu1CA0zpUNX98i3iP84U7UatUdy7Ce6eE3qS/dBY6ca?=
 =?us-ascii?Q?CRVPiTxwm7u7E6hNmEjKjde5gnXhVZjQMxPXFhX0k7Qbqnn3/FMOf+MQKNDW?=
 =?us-ascii?Q?lR4APjCk+VuUJv1vqUMC5qluvKfMTD6Yh3D6cLdvxVPD4+UYfFdyvwtKaJJ/?=
 =?us-ascii?Q?+LWR3p6YWLdTEUzv5l6dXONUwy4d8YXHZG2LReENmK8fqhn1PlVT0cFdP6p1?=
 =?us-ascii?Q?qL2h65E4+brsZIA28PBiIdO8t093y6dYpRwfVSyv8eI2txZsTCjmqiQrtCLb?=
 =?us-ascii?Q?OnsDU2BGvwurJTZvAvAJPmTNSxXvKfPA4SMfk9gP6RYXOyV5jgbJoK7Bot0c?=
 =?us-ascii?Q?PTFEeeZ8SiYNtrE7K6NCdk6tvoE3na2Vn/+TNX/+z3FtOUMhnFnTYNsl8oom?=
 =?us-ascii?Q?xFubx2TSII8NAowqCV0+dxV8ScjMbnwYG3jG6jPqQFsTGgbn6Cwhj2LzJtwB?=
 =?us-ascii?Q?dxTVnyw9eyDBCWvNlAILGrDqjdQ08RxJVTbujwMIoSfiw7A23uHUkcSawk0m?=
 =?us-ascii?Q?yWJETwUVtava4ReXbc6tEQqIbfkwsjW0sYng8Z4NxryZvaDbgauR0XEJ0cG9?=
 =?us-ascii?Q?2pNDCchuX8icEQbB8VuEE+1/gsKmlhcWOsC0Tp4/IV7EslFVJ83D0EAdeF0A?=
 =?us-ascii?Q?ErXqYh3AkXo/yRqDG3v+8sGmx0IYcI5Gg5MgX8/fzNLNf2iaWe2g3sR4anFW?=
 =?us-ascii?Q?hMQkCZN3vlnIRa+iFMCqFyUDQK3jEOHCE1jTP6TS389e/X6s0gz//oi10z1t?=
 =?us-ascii?Q?jnHi8V204S3IRcWP0XzDQqZiVkNjeQke2ZJ4RfbfbqWNvC/vbEVsHBntwhok?=
 =?us-ascii?Q?PHxBjLOuF+Xtxkpho4EOY8n7DCBp18nN3N0kf/VsWGxgn+gj/1WsNPHXlHEA?=
 =?us-ascii?Q?LOXxGaxxmHamVd95bVXqQF/iISdDuetPQRMsfVQjIKJ05ImXSQeroW5+45S4?=
 =?us-ascii?Q?guAwbbR69OJ1qjthnhAq/0NCuob1eLb/Y9isDcQSX44oR2rJqY3u+WITSyRW?=
 =?us-ascii?Q?J07C6zZ4MDLkqDsxPmNlSstLQ6/gKTCZCIhMlbYG5gaSgCws4gOSbkDR7jGW?=
 =?us-ascii?Q?H+tBE8/3zxliNj+gUl2yk/3mwJ4F1FkGsC7lciGExwZMZa2vo6yStzyxnHX1?=
 =?us-ascii?Q?JaHHPkoEj5j6c3SxwtvY9JFd8/OcdY08ExfjtV0U2wzGt/9rUoexsCzkMepG?=
 =?us-ascii?Q?0JJ4TKa9tISUxrqkGcvKe6X9zLxbdk8IIWnjpO+SvijdMiOnIdWMgCrruUYu?=
 =?us-ascii?Q?o40O2GunOlHK4thkVmyuCxVL6/5bHB5BewEAb3C5mUV6B/mjMGyu3eeZXb3G?=
 =?us-ascii?Q?DVIAdg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324e2a64-3544-4162-7579-08d9e29e1d74
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:18.3234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+9/OtxrLm/cae3oLx+hdHTA7Xqn28NV9osRR6kuet0W7N+9nlN7EIUes79bvyqX1uUF3oTC2XgrrE+vxtZWZLkd92jTGOGnphtgwWKKkaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280118
X-Proofpoint-GUID: HpKGsxKsUhsARQQYB-0IBtZAGrinOZFv
X-Proofpoint-ORIG-GUID: HpKGsxKsUhsARQQYB-0IBtZAGrinOZFv
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v15: 28jan2022
 - Changes to build_erst() and ACTION/VALUE context struct
   setup, per Michael.

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
 hw/acpi/erst.c                    | 1055 +++++++++++++++++++++++++++++++++++++
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
 17 files changed, 1560 insertions(+)
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


