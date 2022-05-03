Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C25186A5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:27:36 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltV1-00050p-Ri
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLF-0007xK-SR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLD-0001Of-AN
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243B8Mvw029440;
 Tue, 3 May 2022 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=91StVAABZPdaB0Npp+prlgomuvSyaDsx6H3hSLZg2ss=;
 b=Y3Vbxcib4BoM6gaPX3dZ23vknV6zKQMCv2ToNANt+SCCLyMZYo5j6i4noIod4v74KSJ6
 XTTMObJeEhWg+ygpVvckFycG3rsAhrl9r1XC5fJYPli/nQfOfZrU2c8v1D1Ni+TnpM08
 dghVw8y9s0oGomaE7g2JUgSaLQNhHT+eW2adiiS0jkO2Cut7SQBr6Lsqs4awmichTRlS
 P5Jz/WlfxpaZlZuYnrK5rEdBC0JfHpwmxg0YdBfmYs4pGIE2RYRVljDD/eg/delW7aOD
 mQDdl/qUcUKS1O3x4AjzT6HA33iD0xwvsEz0pZOgWQ9zMOgE4/DbXkF8Nb1uYbrPB/az jg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:22 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG2Sb032476; Tue, 3 May 2022 14:17:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd2v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz0BZyXpPf0GuCqS1zfn2jJkqucO8Fc8r+t7+mLAKmVxpDQrlqUvgyEP35e/ExkMGKVqXm9tW+bWFZe/NZJxWA9pb3t69cE0izxOEpdZB0w3YaVuaqbcHMv53Ea1NfuZMhenq8LIGB4MvRXUbmOZ85tAGJgy/fmGAov/M7lB+mQiyUdzoluJfG63ipG/OiTZ69Iv8aiF/2z3/yXfy6A8OaN681izXampsGV/oEuk/WAkscwCgM84sYU/SI7aXOq2VmdarxQ/GQC4TqFHPomUZdKbHyD1lbu/GS58XQCQUdmAiSVCKAnPZcufFlFzF/iEmyOpRW+nzwriFUXi9ChTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91StVAABZPdaB0Npp+prlgomuvSyaDsx6H3hSLZg2ss=;
 b=aq3+OMSnJU4RZbJnrRSTDo7sK3VzarTMReF5gS2CQ3LIH3/LHHxC7uLpqK8lqXNYqEhk3o/2yc3R+yak8NhcQYoeewZHwMPH50f916kKHYNF9Bu0u0K30pUr95ja89HA36EeEph0LsNTgbIwj0IX8p40OegFZRa2PMC/tgykhK4eWSo79636dWQfPeUe+qt0aJYUoMNLpi3FhHv5lIu2ZZWQ7oHbH8MzAO7RSOZBKpH9bu5tYvFhjQ/PsV9YZIqHI41oLzzrnXzRxxj5eD05eZ0A1pACRhYIH3zb6DmiCYZAtVg6W6YT318tRJRGKrHHPZ3rXR+mmJcZyIYdMPEa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91StVAABZPdaB0Npp+prlgomuvSyaDsx6H3hSLZg2ss=;
 b=UavtAYXahdVhS6dawAnfxYEZ+1x0PmH1kVLZweCzqBTK7Jj45/9jI6ZcyfYPOE6MpXN0vYlnd5EfPXppB5CSxZ4UuXu2LuehbPGvMIP2tX8Ro3PmccFCMuQAVkQAVejil0MRUaGMk6qbHoEjURsk6ljztzxGkD6OrMkMcGiQitI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:19 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 06/17] vfio-user: build library
Date: Tue,  3 May 2022 10:16:47 -0400
Message-Id: <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 224cea7a-cb72-4732-3784-08da2d0fa1dc
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33588BCF1A7690795978B84490C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnrZ422vnW1NHpzafeH3id+ruoD5a39NdEFw/tdVG7qUpgKAfr+wfhwz2xmJE2tNchhTK6R2/hbxs6mxeGgguPGcXI9U6i0TdOFM+LIG+Q5xdeXwDKbaSZF5DolojjnBZuICCSCMKiRpo4f2rIz2Q+U1z96I+gBnjPx64x8iKiF/LRZCcNMQyWJ2ogY8m8Nad2JoNBAZxj9zygatEyABG2no40Fwb1mCmxUprzexzFgv/fr2NpqN1f9SCI0+lEKowDdQ6yI0xxPO/F1es4HOp66O7Y3aImZmSHmWAZogjifsS5JutgnpyDPx2Nk5pLGRZRozR7ZvvKqUJ5SHU1OWaqeQlxdw8YUVUB9Lu6DTXP/mGQZ3W1OE7RJe9E9piHv2qSIVaAD+A/XgPSOBuFPgEAQ36BhOqL5W3YtGFFxj4dqZM+7Gi2YPBjplyUqpCxlYeMJNVnF7g83/0gt15rIRSsCu5UyxAkzd7ick090tgU4mXLadB1egcsJp64z5l7rIhGDfTVZCelgukVWCFVncrOCoy538iRuKbw3mGR2uTQsALzkIdQH2fmhvein2n5LHNJblN7YLz1pJNpSKmka9kuoAzi943OFhO+Eo6mBbcCR00Cx2vVhi14v28bS/DE+2oddlDdJ5mvfxubGzmW3x6lGfNyuEKfWcIWLth/VFBxsDIZuhmSNLxIOWGAAFyh/5mkfWdNL35lRLMWDzpbI61N+2YZbJDyycUwGsofwdPiNkAxzO1wcWYzmEu9KDINVLx+HYpOUqTFBTYGmP6Y4ndyrEkm9uEox09MHq4j1Pp4SWfUFKN/i6bzxBDmo27Yyvn4c4GooZLTzsvoST2ixyhjkehlcVX/RqPY2jFa8PJyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(30864003)(2906002)(966005)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQapH3X3t7op6rP2HbtsqNO1luRTE6fndhH82yY7qeQE0WGd+cD6Mm3ryAlK?=
 =?us-ascii?Q?s9Uia2bU3Epr1CWNnjdDY7P5swnNUSByqsSs00MAv6vFjth0/HZtc98NqTWX?=
 =?us-ascii?Q?F8lORStkWsmqnLEYNyFNFisrYe/8GdwwSAV7wiuwKnHqGOGzlNVWVDDfp9ER?=
 =?us-ascii?Q?GkBrfn28NUbn42QmSTi6hPJnE5pL40cVXeVpa9yb5x5FkJO+FkiNX1FHHQUO?=
 =?us-ascii?Q?PGuHx+LGeeVKeGTLh1LfZGUpST+XMfAbUOb3YaluG/tFO/cA4MIYd5eR7q1T?=
 =?us-ascii?Q?jo9ZAp7iycRNQ0ITSL/XpqYIidHgh0ARvBTx+BMEkKOGrUKY/GnJvdNBniQR?=
 =?us-ascii?Q?xA3WV8EQUBmSLWcitrAEcK8OYbl6Lo2nyBbPjuS9TKS+aMOXQcOqpqGwZWkM?=
 =?us-ascii?Q?k2QvvmUJD74cO+XtL54ode6lGVYX/pU/NJFjEhiacC+2lhBD596Igo1jIa4C?=
 =?us-ascii?Q?f30E1kBjvNjDmK+3w9FHvywICPd/tEN2yN1oI25BNoEZpnvZfYjc3gpRNMJj?=
 =?us-ascii?Q?dDFvs1vlcf5MifxeB4MYXyff2t2m5imgz8RGsDHhRusfxUy+PQmmo/AQYTfB?=
 =?us-ascii?Q?pJZmCDOGAGR+o9FlRT44qimRnIO/z3Jq4T2qCHcO2PV/ILQtonrEsMoY6shF?=
 =?us-ascii?Q?jgo6F2NLcFYI8+xzi7Pwwc2P9UuQ8hBgIcK2zEHGF243E8thS3Qgj0+1/HjL?=
 =?us-ascii?Q?Dxfq5A0yvkbXS7oVKj+KSwIig/m8Zzj4J9E7q9UA3jzYVgVSm/4w6WLkKAPu?=
 =?us-ascii?Q?OlzmfrG1GEn4lq+w+dDyxmgzbMoPrnnO5zqho5oGDJnJtJaBrADAh8eCYwCm?=
 =?us-ascii?Q?OU9vzJqb74VrNQwqI5SJwImgz3dr4OZ+yt3T9Yzjt8HK1FGjmUFUcF7xITeZ?=
 =?us-ascii?Q?6u6MKOtTXodED/xyNFk4qhohAFU5wHS/dm08hwL52skVAafvjq8Oi/L+4Wwh?=
 =?us-ascii?Q?54FpAekTmimx9DLM1gvbfdBX3hy7gYunnbiJ2xh4brw3oQmLBmD92EXq6pmf?=
 =?us-ascii?Q?HmsT0HBaI3YH4sIYatoj9DU1y5nUhRqgvuoB1/wn4DATjLX8wz4a/64nD3U4?=
 =?us-ascii?Q?brY8rgtaISYM/Xiy7wl+x1/GWGZ+1ospPn0KrYMCktXDDab/AQTbh7NHiQ3h?=
 =?us-ascii?Q?I43UMRJtjV4oByEkg15GFIGcJSTNFim7FOR5mrL1CTHDJAM7Tm+ceTX1av8x?=
 =?us-ascii?Q?6qkXv+riYMA4C4W1xyElSRDYmxOl6kCIXMGQKqmOzbvewV0LY1qi+nhBxk7F?=
 =?us-ascii?Q?9K59L/b/JLLx4wot1fIy0IYBvnDJ+c5zumv5N1y4yyHdk88fJzUj5K/7GLzN?=
 =?us-ascii?Q?j2b4IVHctOuXxkxHvtfAolFIf5ydtljG6eH7HyTF5mkvJ0Qux87KUg37xBEo?=
 =?us-ascii?Q?1DswN2Da6kn3HzqhH+W+lkJCtoSuFPQuSgtq2h4ajgj7YU8Si+mTkylkpfEi?=
 =?us-ascii?Q?oL2duBQ2bl7d5nfqqLc4K6j2SgKgLPv/ZRaRcqImEERhDoDa7dPCUkJrjisV?=
 =?us-ascii?Q?DfVQRkl4lRE+ICgeYDu8ecLc7bgNZ2QIRrGl89cNjf7qSJ0QczoF79hmpeIN?=
 =?us-ascii?Q?pEYUGrXR/7RKZBR1kode5y1jozOxPJZQJsEvze8FCHBdNzrPDapMeOy3PI+b?=
 =?us-ascii?Q?o9wACpN1i/xp4VFntNMqp6WhbTFKLt4LCSiyT5n2hKSqbFWOcoC4U/Fnuror?=
 =?us-ascii?Q?afmH/qtf7qjHSiOh/ClNqrKT7o+5pLLnghqn3zPIpv2kC1KX18HcfOZu/WKU?=
 =?us-ascii?Q?/COIOwQOcg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224cea7a-cb72-4732-3784-08da2d0fa1dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:19.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47pPyX06opSPoKIQrKy1ukcXXy7d+Z/B48NJ0x2A6hAAMmM91rQ/YepLiDLxizdgq+9qE7uMdd6G3+Eco2umQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: qJjWnRLxC5FBtPkyFwAwuyXCNZPLN_aA
X-Proofpoint-GUID: qJjWnRLxC5FBtPkyFwAwuyXCNZPLN_aA
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

libvfio-user is distributed with BSD 3-Clause license and
json-c with MIT (Expat) license

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure                                  | 20 +++++++++-
 meson.build                                | 44 +++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml                 |  2 +
 .gitmodules                                |  3 ++
 Kconfig.host                               |  4 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  4 ++
 hw/remote/meson.build                      |  2 +
 meson_options.txt                          |  3 ++
 subprojects/libvfio-user                   |  1 +
 tests/docker/dockerfiles/centos8.docker    |  2 +
 tests/docker/dockerfiles/ubuntu2004.docker |  2 +
 12 files changed, 86 insertions(+), 2 deletions(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 7cefab289d..3b096f1b94 100755
--- a/configure
+++ b/configure
@@ -326,6 +326,7 @@ meson=""
 meson_args=""
 ninja=""
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1008,6 +1009,11 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+                             cmake_required="yes"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1226,6 +1232,7 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -2350,6 +2357,17 @@ case "$slirp" in
     ;;
 esac
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2854,7 +2872,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index 1fe7d257ff..55b872b51e 100644
--- a/meson.build
+++ b/meson.build
@@ -298,6 +298,11 @@ have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -2204,7 +2209,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2596,6 +2602,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  json_c = dependency('json-c', required: false)
+  if not json_c.found()
+    json_c = dependency('libjson-c', required: false)
+  endif
+  if not json_c.found()
+    json_c = dependency('libjson-c-dev', required: false)
+  endif
+
+  if not json_c.found()
+    error('Unable to find json-c package')
+  endif
+
+  cmake = import('cmake')
+
+  vfiouser_subproj = cmake.subproject('libvfio-user')
+
+  vfiouser_sl = vfiouser_subproj.dependency('vfio-user-static')
+
+  # Although cmake links the json-c library with vfio-user-static
+  # target, that info is not available to meson via cmake.subproject.
+  # As such, we have to separately declare the json-c dependency here.
+  # This appears to be a current limitation of using cmake inside meson.
+  # libvfio-user is planning a switch to meson in the future, which
+  # would address this item automatically.
+  vfiouser = declare_dependency(dependencies: [vfiouser_sl, json_c])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3708,6 +3749,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aea7ab84c..671a5d8fa4 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+                    --enable-vfio-user-server
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -165,6 +166,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index f4b6a9b401..d66af96dc9 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -67,3 +67,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..f2da8bcf8a 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -45,3 +45,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index 294c88ace9..84b0e019e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3598,6 +3598,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..dfea6b533b 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index af432a4ee6..e1315f9a07 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -95,6 +95,9 @@ option('avx512f', type: 'feature', value: 'disabled',
 option('keyring', type: 'feature', value: 'auto',
        description: 'Linux keyring support')
 
+option('vfio_user_server', type: 'feature', value: 'auto',
+       description: 'vfio-user server support')
+
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
 option('auth_pam', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..030d2f6e79
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 030d2f6e7978b8ca7577b81d4f48e2771bcd8f47
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..300833d8e0 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -23,6 +23,7 @@ RUN dnf update -y && \
         capstone-devel \
         ccache \
         clang \
+        cmake \
         ctags \
         cyrus-sasl-devel \
         daxctl-devel \
@@ -45,6 +46,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index a3b38884e3..7c6131686a 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             ca-certificates \
             ccache \
             clang \
+            cmake \
             dbus \
             debianutils \
             diffutils \
@@ -58,6 +59,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
-- 
2.20.1


