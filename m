Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDB3E1EF3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:40:19 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm2E-0000Rw-Q1
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltc-000229-GJ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBlta-0006hQ-ET
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:24 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MBtab011989; Thu, 5 Aug 2021 22:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=ubtnObzL1ayk6ewyorbkbr+ae8kZKnQOv159rTr3dO8=;
 b=vw+prJ8j6IXE88oc65KBsw5v+iBYiHREkOT/eyME7/GQNptggHFOHzpzmjN8Z6bUE5OB
 ZDK8Rb6skKVUtl8vOhf/Tz65+duIoP7OxZ1sU7N3xch1vH09p0iqULoy2ssuAs6XlMc0
 GPzZYMJAGU8q4i9F09vmJ5OpdBygT+LievdlI2MrKnCQYnhazn1/nRHLg4uCGmFwPsYw
 WvuSnnK5URuc1q9adk83x7OHGEmUnaSrSD6MNATwE1znhuZM6qElijr+1/kb9Fb6mRzJ
 t2HEg69SI3O1SfF65dAmPZhGwfO+qkGix902nTlV7UVQpl4AQts4DK8eb1zM1w3+NM1z 2g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=ubtnObzL1ayk6ewyorbkbr+ae8kZKnQOv159rTr3dO8=;
 b=KQkxu+X1olwUiT74S3JPRYz1Haygez7xkWsz4syu1bjZDoVWjqWTcK567q6dFALkiLnV
 i1lK5HZs1Kl/a3NOygJmue1JYT7KV28R8kPOUf/sRmrwmMsvECYX2BvLFmmoIZlhJvPw
 EUr/lP2wnacJAovsgicoSs4iDRoT1GV2n1k/2gy/Own5GNr/K9leY46LindgY54HeqCt
 S7lsVZGjUlHsU601xfT7ov3GAjLVhy8nbR5rETtET6WPQs6X5jhRbiaTP5YonSWiJ7P8
 /mUqQ3ryUGJw02Qj3HMIOZRh2qBfAEPihLyAOnc94bkqXGoJIHkwH765d9NMtQiH8ymK 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7aq0dwkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175M9mfk150466;
 Thu, 5 Aug 2021 22:31:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by userp3020.oracle.com with ESMTP id 3a5ga1217e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXpAKF8tlPlkEv9KlX3xoosmWOnJ0fC0LUHoUCsmXCfaVdrbWLvKytttlbpi51g/hJpIozGUBZuzi31QbHwIwCXTFPnogk+rtFC5ou/1MIw18ZSEESMNuDeECaUlgro4UUR8Hn4m/jAnwfuuCCjlbbOL7yIDbT36zMcy17sGeF2Kf8EMc6ZsKPifrpAoo+Mn6yEl3vqasMiAzSZoA+DIJiqhdQSBO2+j+6uC/tn3HM6ULA7n5gDFRd1XJZH4YFUsT2i1VECeFVulzh8z2dBQotezYBef11oF+IMfPRk975CaXN9hQ5pBWNUo0CqUo/3HOEWUIc8Q5wRENETixk8LFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubtnObzL1ayk6ewyorbkbr+ae8kZKnQOv159rTr3dO8=;
 b=AXqMj+I3mzJN5KQe74LnskrEa+fWrmhzHNouewdot8PNdI3ckzvGMmuX+2ZZvxMoPW4SmEW3i2Q+TpJkNetydYWWZiVRej7IZsd3y1O3sJKeYnb9p1BkQ3bnLtWDvJ9sGnNLJ1z18U1SBimNj7n5KrAsoL9MrmRT7p9dp2vduKw+IOPjV5eI43mbuHrNz54smUzzr4uQnnQqDG3GscS9//TsLoT8I82R5ZxW2DJP26yevYRGvkhxRxIDMpH8aER6THfpkXDPY0X0TwKvj3FhmaVhLM5osozEphOzgby/ElAtObnhBCLEl7sxbTooyMLWeEcVGhk5EMa8XPfLEM/arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubtnObzL1ayk6ewyorbkbr+ae8kZKnQOv159rTr3dO8=;
 b=K5n5Z8NrIY6ErX4WwUfW9NsVHZ/9X7GJeFA8bzt6/t9jr4i0TWc8Bc/6imcVYyt4vAk2TpjHz21yJ6khACvoYD3BOVUHjZ3t4fDicS8YTGahihZ+xCC/GbsK1mSpqeaGL8PQqQrvcRk/9FRXMHLDNOcZyqUfN4I4Dc77nK55aa8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:13 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:13 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Thu,  5 Aug 2021 18:30:29 -0400
Message-Id: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb12246-66a3-476f-984c-08d95860bb32
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB222150E004ABD7DF5EA32D7397F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHWXqXKeA51y9Cv0y4Dv8HaivXtYBeB5wXwxNeMwqNFblea0ORgsosC8NCzS6G4JWqmit3rwq2KkBWbxe5if5gIFdh3fYMyBE3lJgBON5WwdbcUBcdShF/Cvik2VOJNliMphcqoZc2ycswXs7fITesz7LSvi16yQNNMFnP2n8bS8cJAR7sbl728vYjIPcDxCMbhUSDzuaANcjl4K5r1gP2mOPG+GPJBqcOMxQd2dqxR6LYztEJEEk2kogW/W/E54XVLkdOCiLkCCZzQEP1SBE8geZNsG7zJWf8SoSj+Oakt3J8rtHMhMeeVqmi12SFaH+4STl5n/fmnncAoX4JajFPZ+avvK8rnMHy5kZEyRxabGT3dvl9gEs0gyjzKJyZ55/MyIrqeNtcOoju8Tb0Yi5n3BkZT2iAiso6i2spsje6eAgx1duRqbqRVeqJgphhM2SwpBFLQNhqZEJmWMD8S8BMZwrb6uYOTvomO8KBeirbFDvOduoNJ5bM4VGH/6AvzZi9ZtLG5SrhCNw7pK/ZL0G0D14YPiGiI1ZlU45RY0+FBspLjuXLpyOaM0oLVk9n3dYaOuRarYyu14ZSgupAf0qpJB89adoqiAI6CNomxCNISlGRtEjzUDllvymjCIP1SqMVrDCx9fnM6zwjMyTjtS57cZfmRWWTpoox+O2x0ILMRa5L9xhe/kulGb9pth8o8Mq9XQgiac40YJpgLPkGHR4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(83380400001)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UhUzKETmTuUern0pSoGJoKtYb9we856PefJNP7fi8X6V2RU/toxemi4ZEr/p?=
 =?us-ascii?Q?/X7mFpayAwopc45ZQrgtGEzuGMmpKQJmezYibKiH+MaAKf59JysyX+JLxvXl?=
 =?us-ascii?Q?kf69ZDpKn5SLwlHK4jb1KVEjjKSZGOwwVk+9HHCij7x/TpPF04vw/VAY9K1H?=
 =?us-ascii?Q?lr3kYsD4/8t4I2fQGXHd+NvYCyU/3NbBVAGP1ZTNAiGQnTYRzhhvGByN69uz?=
 =?us-ascii?Q?C7CKlp2tJzhNluXe2QsLyO1dXPkdZne4IwxnFEU8Dl4SZCcpxvsSm9Erhojy?=
 =?us-ascii?Q?gOD1lzDVo/KpDbQhvPRWKEVoc0+9cbElqMQMeQofZc2Vb9LFfR1E/XsSdAmu?=
 =?us-ascii?Q?SNKNryWO+vI6HFBD7bOiUepjeTL8JFqh07IX7JSRqpnBxTZoLPHFEouhEQDI?=
 =?us-ascii?Q?9jcZkk1oMLSCJ3Gi6PbOmQzHv1f0CEePUzKn6LyOraqZUcMFYjaHJpZvk6O4?=
 =?us-ascii?Q?AfywqtEwuWmcPMkk8PBvuQTss8qrYB3xveGZ3JOsN74UiQT7DrGvvsU/rhUe?=
 =?us-ascii?Q?vKV5PlxUG/WOaDJ/FIxOPhHmJ8Z2tGlvobnMcAS+DTpjwc24Nols8QOerY6v?=
 =?us-ascii?Q?kIdOpfHbnSPMookY4KXTmQXv/BFcFEMxy3PylNWnv2PrN/CMQ23ayDTruV5R?=
 =?us-ascii?Q?P7DAeevlL9PIe8WolVeNvHaIMjAweh9eG6GPAvdztTXdPIEqCnJmnXfKGOUb?=
 =?us-ascii?Q?YKHMLgiD+64rHGHshMSyG69c1ajy24g5K0MWO3udj+L0U0FOofQ2FQSULmEZ?=
 =?us-ascii?Q?AakTRwQPsLXxDvg2YkvX0bf225EwanOb8EorTpwG7OKsPJolwowIDHlqlieL?=
 =?us-ascii?Q?2kz8lTnA0pzBBCvwee6NfzjQwQzouAaqLcwNLbAFX2sHm3EQgd0wrtPJjrrr?=
 =?us-ascii?Q?PLJrM1ngu7R7RpjyUVTdOwiHvScqJPaedBesqaEx7mfhZW4kPQvLyKfG04xG?=
 =?us-ascii?Q?sd5xm5KPn0hGZqGTNLlDKness+X8r1/61Qg1Le/Y0DCJRzArHQsF5iBR1T0K?=
 =?us-ascii?Q?XhGJ9Z7mtT3hTg+J+3bFmte5lpJOKoqJtK2+tD4Nl9lZ5NOZT1/xnJvbudIO?=
 =?us-ascii?Q?ytgkc2Kt0FgD0Tf0PzfLFR50enwSzQyclrOQ0PoRd396ewswrOm+EzHPAPAO?=
 =?us-ascii?Q?LKVaIkDLFgrFwiOBioSlUoqgxZTUxlbFah+ML/eqIMgPRoxzWK9tJz5Fh3jk?=
 =?us-ascii?Q?wImFxiWL818gZzfpOWZDFn5+3Fr2YYr1k/mcj90cPbob3fpJmyK5pkf+Sjy1?=
 =?us-ascii?Q?qA75yw9Z0LyKKU06s/7uNpMDHhmKv/yA1DmDbB1euybeL/P268yw1/M8y1VC?=
 =?us-ascii?Q?z75zEuT7zHaqYE/tvUJJJuxs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb12246-66a3-476f-984c-08d95860bb32
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:13.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX/szbwFJCfnVTemVkgSJNjYOZaFEO4muTqITX30ap8bHWvboPqHsIcuMJ6inPGxFvcCA6ITjGPCokIT5QBhPirit7FdjKHpXtdBQDm5TmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050130
X-Proofpoint-ORIG-GUID: jFkT4AKdRKqyZidlETZ4iXnCtbS9NAwH
X-Proofpoint-GUID: jFkT4AKdRKqyZidlETZ4iXnCtbS9NAwH
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.txt, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
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
  ACPI ERST: step 6 of bios-tables-test

 docs/specs/acpi_erst.txt          | 147 ++++++
 hw/acpi/erst.c                    | 989 ++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build               |   1 +
 hw/acpi/trace-events              |  15 +
 hw/i386/acpi-build.c              |   9 +
 hw/i386/acpi-microvm.c            |   9 +
 include/hw/acpi/erst.h            |  24 +
 include/hw/pci/pci.h              |   1 +
 tests/data/acpi/microvm/ERST      |   0
 tests/data/acpi/microvm/ERST.pcie | Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT           | Bin 6002 -> 6009 bytes
 tests/data/acpi/pc/ERST           | Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT          | Bin 8289 -> 8306 bytes
 tests/data/acpi/q35/ERST          | Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test.c    |  43 ++
 tests/qtest/erst-test.c           | 167 +++++++
 tests/qtest/meson.build           |   2 +
 17 files changed, 1407 insertions(+)
 create mode 100644 docs/specs/acpi_erst.txt
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


