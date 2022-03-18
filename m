Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895904DDCE2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:31:22 +0100 (CET)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEZV-0006RS-Jm
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:31:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKr-0003Si-QG
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKo-0004Rw-W3
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdRUd011365; 
 Fri, 18 Mar 2022 15:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ezBEknudV3TKTRsOVWoVgtJhUW0DKvXjQVc3n7inaf4=;
 b=rmQinKE20j1s4+GxZEeT0qZNUD8Q4XNCMr2RHEY4Ii2wj7PP7ZOMJ3Fz6Ik8HkMwumwr
 yyJgpU7LrNUzcw4byMbxLMBm+jet3XAzkWwJIJdR91Ki4rEuj3UxzNqdTz4gXDWCnOGZ
 wDbalhPpshIhcYC4VrjUMy85JNqYqNDw3ZJ5gq5fvRnAG3/IRH5rKDivYHjE0L4SnKJw
 yAFw01Neqd6cqp3+x2TWuJEEQv91QmvrGkHphGh9hU+ikNVCtMxqTnDYxTKzBsrCuEtS
 xHlI2ayhhBWj4r3Gr/s+pDlVb442BFfkdICxfAYAjk2XRBan+iWT916lZaW2ooQ4kr5G 8A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rkvxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFADLc196585;
 Fri, 18 Mar 2022 15:16:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by aserp3020.oracle.com with ESMTP id 3et64mv1dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MopZrVZY3rB8NIR4yqvy7qKF6Qc+lL0kpI9wDB34IBW144Yd3WOhjhSkAB2mukP7l7wdYw1uVxwUANwof8oqN6hnztvqsPMb0JOzpMvEkkgLsZDXoEEh7ldBpvCF435UDtnr0M3wkZVCOTMs0vGM5urtvYkfxjp/H+83vlLgAM06ifg0571h5lp8xMGcmydJpKjQjDwQtVe29a9ANEzqpioRt2O6CeMC6DmFiLLFVMtTgO/omjjmPGCSX8dS+WqjMt7SP/Uq7wqFhCLTB/M0hF1kVKW1lLSY+cG2+VXiZWLOxtRqhlYHfUDEAMSvApyelsDlbLO7VQ5BO8B8SrTnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezBEknudV3TKTRsOVWoVgtJhUW0DKvXjQVc3n7inaf4=;
 b=fKYFTAoURbogF30TFYYUibnXYZ+1Dh0Y6yAf03lcrcdaLdB4KlFlVoyLMj9g/xtbAj+DB14y0Mk6H0l9CTe6qOUoI3phh5jIHi+/AVTlYZr2DVNJyGlgL6p6BTdR9MWK6gqCsy3+BKprz2u3pks/sIghYi/EKYvjT98jYmniGWl1Ax10x1qFGu1E6+xY7uenDPfPY/unu647Dz8us9YvaVsZAXkFwidP0T+icLV2CR/5cwycTiivmsKFRaz7qJoTMF9U4wnEXd842sVCP7FGllXvp6yJC0Iw/48QffGsoZYuVaNSWRHN2oc3On0F92JDnGYsIpgV5Oyx4B1EDS6AqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezBEknudV3TKTRsOVWoVgtJhUW0DKvXjQVc3n7inaf4=;
 b=Fz9DABhRymfLMvqXfC2lubH603E1335M6jl7n7Dqbx7fDZ1FHAS5QJqtiHVaonvbuPytk/K0b//nz59IMZjn+3tlQR8lEBCB+eVvmISz5vIn/7Yzu0ujb10AzICRh30HHh/UqvAlA/QNXkZv/KQdIl2V/iwgnU5FJj1lXPLvZxg=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:02 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:02 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] vCPU hotunplug related memory leaks
Date: Fri, 18 Mar 2022 10:15:50 -0500
Message-Id: <20220318151555.381737-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:3:37::21) To MW5PR10MB5825.namprd10.prod.outlook.com
 (2603:10b6:303:19a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 207e7cb0-7d16-41d1-b868-08da08f236de
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB41741F0AB0A2E8FD4BBCA143F9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHXvThLsIW2xj5zhHy11atyOeFGnpSYGPUIGH0BAEwQrHchnYwgUD0sSD8a0tSwh0MvpJm9GtX8bK6yTrKbA4AiUFY/uQDlKMWw0nxmLBFFQuMAc6RtUdnCxYYBKTDti9wNgDPZJzqqXcpnCwduLKkTpHb+Gj4yDCDBCuhrkzxMMqbl7dkdVJ/PCmt8TC+bPbY0Y+U6paudY7cjfwS0er6pprG63mK9edVBfxm+HJBJ42qX4ct0pXh9MGpNq3/TuwFdRVj1ayVim9PEqQZMoKmphbxTRmkaC5kM2K3AeOgyY62wqTToTTDlSV2ewZdXZSUULHvdJrw7RIHoWILQ1gjZuwbCJq5yobEMYmvQ2ksECxUE74OHj/pYprURTz1cEx3SP7cIzW0HS8eMg+WP6aGExzX4DpAB2WSDfXGPaRevNdAQ3nBLd9V/AWDJPfDx/LHML+5cTGSnvbemGpZkAlInVqhRtauPH2/D6UwiOEA8XlRO0DY0ydAO3J079gj0V3G7bPmjDqnnM+4rhsZKI8oUx+JXou8Ux9sdqT7zJ8pJzQ0yKZKk37B5ksoHDLCYysTBzDty13m8w6db4gISC4r6qG5ycIm89fl4PJGmYy+pANX6poYkvDCBQi8fcoF3HEm479lbNvl5chMdN9ph2mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(107886003)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(4744005)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXLwB1nQO2vN6BQv64boOVDClSwlHa/0bHQBJrwK+oW+c77E3qaK6HWpv2ux?=
 =?us-ascii?Q?IV4IGNQqkk0vQEj2wKdcCMi/XNKs0/78zrpDTuehDIfekFb7ADySEMQPQwqs?=
 =?us-ascii?Q?A9XMElIC/KuBQlMmxEqgBnQFTYyPnDH2ld/z8EvzUAwEDcA2LuC05hAUsbX/?=
 =?us-ascii?Q?tFvcU61S7q7seDE63z8HgCJ8qSAaP3aAnMRqgOyvLv8/d3aCa0fezZtLVEVO?=
 =?us-ascii?Q?oM18It6G32myWgGEuDOn+rOJmDxCC7yKUyNw0QjUQI7hClgq6jP8GF+6ZeMz?=
 =?us-ascii?Q?0NX3RutNZNeo7x5V0g4oXqAKOdynP+Obacl/JZgVHjo9ARjX6SNdQJKuh8Fo?=
 =?us-ascii?Q?xNsj92EnjxOBxseArYIc+JyNgWWrju2maTypbIgF7JUO97sfcNjuWHOr4oD+?=
 =?us-ascii?Q?mzXguJnX8bKKeKgs67Xym89SG5UvHp+bjT/VLGlp3IllX5iJB/te/tvsTRnK?=
 =?us-ascii?Q?aXKcVVdBDCz4Q4/DEe0poM5jdQ075OvkT7hUHfB2j9tiBJg0cnKserbsu/4n?=
 =?us-ascii?Q?I3+OAWzu74vHCde5VCWR/JYFEetHRQ3In20LTOEBgf0C8MS57LYlYcZYylKQ?=
 =?us-ascii?Q?U53zvVSZIwRm8eJUhAjiFbP7AOGglK7tIA63JK5TTp6ES2fdQdX8DrDPseNy?=
 =?us-ascii?Q?hlAu0lDe8hK2TtcuecKkoBuOXfZmDmDmXqTd3lH97b7OtAM2ljMcYl0cp0VA?=
 =?us-ascii?Q?soCuzMgPobPXGtRB3DkOknT6z9sASPJ+0Afs0JmzeVJt93juWBvwogJdN7zz?=
 =?us-ascii?Q?vgXsF1D7OCTpltqGrVhtaalSvPAPpU2ZNni81lIxuaokAF0I4FvTE803pt1s?=
 =?us-ascii?Q?/ou4lQiTArH2xuVX5Of+leawd2fMDl8r6tFt7Nior2NIgP9DNwccwl++IhTX?=
 =?us-ascii?Q?BXfxXsSmDsZ53Ek0ojAcVEKGUqYBJjN0SYfhWSSBx2mnIheCIYMfOoa5jN8h?=
 =?us-ascii?Q?ufhrV4CKAo/uR4gUQ0hm2VzHCx8Jp4xosL9pDs0BZwkEpCvcGSeVufaYZdoG?=
 =?us-ascii?Q?S/lVzvAW0626nC5QPZpSmqK2+p9kBhbABGw3uy1l9j5UUmeTxMD7QZcC4D3E?=
 =?us-ascii?Q?/qJbVTwa4r9yr0QW8ulx9en6Ynd5wGzV5T0UmZB2IZpTnjI0dRsw2mY77bAA?=
 =?us-ascii?Q?rzX8PtIwfXJ15oCadgoIiD2oyon7l9WB9pRA4oxdoC+ozYBkuxiXGQUGy5k8?=
 =?us-ascii?Q?sMkmntvHOz8wgJCLaSgXzbz6FxKs2IiAbFzEfCbKVkCyGO3xWpw/GOCSkcdl?=
 =?us-ascii?Q?9hlr59SijPLiEra9hDEV88cLYOjTcqw1MOEWjvhbZscGruLkmVubzzxXvuvv?=
 =?us-ascii?Q?gdANuqSPelytOmdGR+7WXq6JgRCt8gunqm678fOFFAiJvFfFN6dql7HYRrbG?=
 =?us-ascii?Q?gQvprxmkW3UeQ37S21rep2AmMTds5uuwMyUT+YWrYzTLm2uD9HHlEMsPTSU8?=
 =?us-ascii?Q?sSDUkStiThsb4IxIwcFBaJTTgssmnURJpH1tpA0diununYNVpzjAerWCBCpy?=
 =?us-ascii?Q?zSNQirKGfcjUuxQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207e7cb0-7d16-41d1-b868-08da08f236de
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:02.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUxJMsQa+3CRdVxCTLGqxP7ADyvfJc1X39FY72E+zPMx3ndwTxBBtbw9qywIrNl3nsBRzLK2F+otJ8k8oJpQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=844 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180085
X-Proofpoint-GUID: wQMKiwUhDdHcojqwukcbLMsjJ50sizIH
X-Proofpoint-ORIG-GUID: wQMKiwUhDdHcojqwukcbLMsjJ50sizIH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series addresses a few vCPU hotunplug related leaks (found with Valgrind).

v2: Create AccelOpsClass::destroy_vcpu_thread() for vcpu thread related cleanup
(Philippe)

Mark Kanda (5):
  accel: Introduce AccelOpsClass::destroy_vcpu_thread()
  softmmu/cpus: Free cpu->thread in destroy_vcpu_thread_generic()
  softmmu/cpus: Free cpu->halt_cond in destroy_vcpu_thread_generic()
  cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
  i386/cpu: Free env->xsave_buf in x86_cpu_unrealizefn()

 accel/accel-common.c              | 7 +++++++
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/tcg/tcg-accel-ops.c         | 1 +
 accel/xen/xen-all.c               | 1 +
 cpu.c                             | 1 +
 include/sysemu/accel-ops.h        | 3 +++
 softmmu/cpus.c                    | 3 +++
 target/i386/cpu.c                 | 5 +++++
 target/i386/hax/hax-accel-ops.c   | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 13 files changed, 27 insertions(+)

-- 
2.27.0


