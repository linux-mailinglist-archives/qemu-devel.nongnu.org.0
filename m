Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5A549F2A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:32:44 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qjs-0007mp-06
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfR-0008Kj-A9
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfN-0001so-GX
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:09 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdXZr027265;
 Mon, 13 Jun 2022 20:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=JoxHVgeQ64hXyYidg5FqzuQdopwTF9sDDSMW1Pc5DxA=;
 b=0Q1LntlIqWf6tX1o2uWWFXWFfU4RqEVIxwe7SPt3AoVaTlKt7PhX7C2vU8k3hncHLuLS
 kOn8OlO2a1p1yzfkpolw+6jEvuey/tUkeNlZKP6cwdGkUUdaTgloSkK4o9QGsynYPLEy
 MtTqm0u/EOA4JjuTbX2S87b2dwK7M17YjhpEp81SWAbIph45B13wj8/oLs91TsgGaqNo
 GuwPm8gecMnogpyPWLeQ9845s0uIwTLw8FMd6c90gpZcyDhkGmLBnclj4KsjqAxvf0Q9
 3QZ2Lkub21GIH3WyD6A2u7F4zehJzReSh8A2d/e25jx3rBMw+Lj32F2avNYWA2rQD7o3 kw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns42qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:03 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5ST007030; Mon, 13 Jun 2022 20:28:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09aj-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj/1tq59Oell83tM4FZIghyumKVSnE1tw+iMimiPpIB2axjz7l4AnBQdvv3XgAga2Oe/uwCxAUFkCb5BNyVIeD4JnxcafmQCK1VsXwEHthEeqzFFRD6+pGSaqz/u239ssOC6aMYdtHZIzfQJ9/lYxdiy5TNJbWRj6cx6Wk/Rm3H17snaVVQEU6Kq65XTtximiqBMs+tv2IaqAzJyzIf2sDKRlqZZYSKtOjT2g9jsV1C4MauoEbVYerWoXR0q0wGBWi6qKe2tG7Tox7ul+AyXeYHy8Xo7eE3DrNAJIkEIPISFggJNwfh5x/7xuZT6qZvqY/bc39oFhIAGXo8uXHu6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoxHVgeQ64hXyYidg5FqzuQdopwTF9sDDSMW1Pc5DxA=;
 b=BJJCwfuWkpSV0ccSNmcQ1jLX7HAxgSu4+zjt9DBfkuYdXCvdPBgFLojeiftdb165UAKpy9jNed6pcdAZsvX3+CNqFcop/LPDnjW7qq2huQDm7qpLeQeOBscGHdimjk0adlTDZMADrBfZJsX8yz7pHsfavM/icfNAf1v4dFLvA+crGxWSR1J1EML/mf//8vbobO3GKEZtyrwN2+6s18/B8HK6ltoTD4Zo534uwRlvI4hxUZZjqZZdKibKCs2zB3LfY9zrfweT/toJLHWT6h+f7BI+kU30Ho/ISlfCTzavT7NYOF0mz9pdHw4FMt+T0SCHhEIRI7+5hMz2pztvcciUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoxHVgeQ64hXyYidg5FqzuQdopwTF9sDDSMW1Pc5DxA=;
 b=eO/wLHTFivwayNnON9SIltJJWgZsovLQUX3zMPbRn4AfzvvBnMYoPJLlEcVNpd+KkGKoYwuU17qj3IlpERi+UTcbsJ7Sy4fiGzCykQXjeyn26UqiPyC5s/wy8SOOXQ0yhFQS1pwLJzhbUFBjujdpbBYTo8CAT+HxkGap4qopOn4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:53 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:53 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 13/14] vfio-user: handle device interrupts
Date: Mon, 13 Jun 2022 16:26:33 -0400
Message-Id: <9523479eaafe050677f4de2af5dd0df18c27cfd9.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36478914-08b6-4708-5c60-08da4d7b314d
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB20456BE172C33249AEE81DBB90AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+p98nS2AYfoBi+s76yO4VGpU20Btq58RmGMpZgjO88/QSrT1ZYzj0ORC7SfHi5+VUsrr0UvKKaQLMxcXvAijc0942wLV7TzY5GK1T3kZoXJflQdRlbKnDrg9qx/RVEjmcI5DNUAxty8+qUdxnDE6Bo1yUlO4tLisgll76Wcqyytt/12nWAIGRG76FCDGBT1jQfOfjAuV53huSISHnAV9PKwklP3GWwj85fwdMvljWpVliBssfEMWEfytlQ3ASOEGKmdK5W/HWG22d3iktcFGd23g4aPIUGn210lM8tyaJxTUVB3VDqENIfMddcKf23A89AWdjh1Im4ta95OkKLlP3nKVGdXV45fhK41VETKluSaSurEDX/wRAb4JbKmA7lJw5P16H26FTEQ7yUAdZqZo0ofLDZE6XVcvSkwvFlr18N66pPfMJjLKbm5yteIGqvDg3ZIIZ1Aa6cHr0nVMGVD+axmqEdFqCyF6sjBe1dVyocmwhJllK8S/HX4z8yhOegQLS6P3FGw2yCG6sn65RMoRaGAOcMC8QtI4U/vVfEWMaDgAsJMnA2gFxf7tOBzhd1fttNsyFqutfwyenz6GNNjkF1fqDn+EGQdK4QKiqN7zzRYNMgoN/OJQ2CdzjoAzMXv0uMMJ6sf9kK3jDAA8E4r87nKPknX+dEBWz3I2VH5CrCusoUqBqbcCbp0TXmqgPPEK4dHtymbBnKz88e4pGpt0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(30864003)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(6666004)(83380400001)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqDwcsals/Dv8XnI4YVi+z4FpTyydpssPsNc0LOpOctsphKzuzfgsX1WRYCx?=
 =?us-ascii?Q?X6l3mwMh4KvGWoAHz89wGAQlGSAxldF9hHlEKy56O2WMS0hWvQ7M+idFuiL6?=
 =?us-ascii?Q?J5HSsfSYdjzPPT+YDJxkih99I3aH8vmBl7GH8z/viwyGqQg9SMX2rCgk7bW4?=
 =?us-ascii?Q?Jtu9kDMSr54A9KHzvotjdnAtGxxgOxVMUBcZjfMWz/OKNlmBCcg4/TRzOn5p?=
 =?us-ascii?Q?LIafEORHCoKfT8lYHMeSz+IwkPcjQDgSzSyyspKj9QpRYIhig4/DwT9Hrxon?=
 =?us-ascii?Q?UpER7u+ZCyKYWJ82zXnZy7nGwW9d14HtvTdygAECRsW/2+5fQDWyUtFeVCNp?=
 =?us-ascii?Q?7n5jpIuE/C72/uoQU/q+o+CJGjL539hE4LiW4bGORafxTQTJmQgZmqgG+AEQ?=
 =?us-ascii?Q?ZKHOu6M93mCLD+kUH5xy6OzGn1X9Ck4yLiHCz6zQvhdfY+fOpr1dWcq1tS13?=
 =?us-ascii?Q?5QbB8zWcaCrpzY3++Md4i1kQAa30NMsU1j2arE6RWrS1bOLUPHe83tTOxPS+?=
 =?us-ascii?Q?CGiGqNrrtcnV8dUw3k/hpKaYawHTazIVt8ynTK9sSSg9bn45ieqXOmhkwrvr?=
 =?us-ascii?Q?cvIrm7lwSk+5CHzg1nbIMV/uKIkDvGA7w5LfP2U0mtvDR9Fe7uD65Kx35AXV?=
 =?us-ascii?Q?BaVul8wo/EEKFn67LetpxrCiM7SistiQTa2FWPYLfN0RYGQvTJX2yFfT/MVU?=
 =?us-ascii?Q?kK48PWtpthYoLIWw3Ou4B4SaiNCMcf3F18WQDZbUxJuNQGmqiwVrnrwdZYrI?=
 =?us-ascii?Q?0MpYtNd0EtWt8qmzy6dQ6XbUvlc752c5GANgHw+RCIPoUFRStftpv5E3Jju2?=
 =?us-ascii?Q?LmvlywfzKkvPWvk9/JN2E/i03K1dpUjNLsgUlc0dYtw9stJ2dIqD9RAn7nl1?=
 =?us-ascii?Q?HMYKshUR+viKI9nejogEAZMbzoKelv5UENvrlsTaFmklzLbMWrUSSp7Kt/on?=
 =?us-ascii?Q?46LzoPZBF8GWBgDA74NlKXW0Qw0zTUGjx9GYYXklCjicX3931zZYhyzNN10R?=
 =?us-ascii?Q?dUVrfm/hIQxNxBmq+KgB/LWK634TxDigTFcFvVcS2UjMXwerkBqlLWWT/aLW?=
 =?us-ascii?Q?+Z2d0CI2CB6SUb0yimW/GXaXe644azxBFOhs/TMvdtnCDRi1ulyr3KXaPSs+?=
 =?us-ascii?Q?hUmJDBMBmlnVZQ/KV5xsxXzB+r/hNsZT3WYlIMRtNGXd0nMc6lbRQmJK7PQQ?=
 =?us-ascii?Q?5e6vZHQAB+MAclJoNIuTectk51BRQx+zOvyCR63NCeifl7devtos+u/Xekd+?=
 =?us-ascii?Q?L5JD1DRe1zXaQWYDqJoyNxI2sjDaQKCHuMIDUBoSMjRzbF3pPvQiLofVloVG?=
 =?us-ascii?Q?Vzh8G1Nw7wHR65I0rblsHEnPTFiZutCqSPO0F8w6uKjALDRTPoyQI7zCfxBc?=
 =?us-ascii?Q?4sILu2Ni920E6DvDqV6PuApAcLhTI93lMdH1d7b+Uxaz7YJscC1BaQ64MytQ?=
 =?us-ascii?Q?BMgEEMzPly2iSaEexO406zFk3bG1gX6CraJokpQB9oawL3E3zjrlTaFyZ1bo?=
 =?us-ascii?Q?YbaJJ+RMW2m37CBHnjtUzXuvxqWiWHAlai9ORxKC5bApqaS8wNyrp2CTLwbf?=
 =?us-ascii?Q?iiPKmd9/SGOwKCBGT5seSbqYrwymYSFMDo7FQv4Tefz7xXhFrfIdp3UPL214?=
 =?us-ascii?Q?+mQhBf8I79eoFVSprW9G3O2eEEOcNGABu3020nasfx8mVY615rb2G8pg+1xZ?=
 =?us-ascii?Q?bdv2NSva6ZBH3Jk2KOQlcWmA9y+hVUQ5HNYqrTCGYkr2AOvtS7HQHguemUrT?=
 =?us-ascii?Q?vwDNsagRNQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36478914-08b6-4708-5c60-08da4d7b314d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:53.6221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8WUx8HDceG+a9dwYZHCYGn+ht5cd/vYi3x+rPsbKv4fMW8paetcCu3SUBgzTNZr8KX7HimFuhpxmpZU1VU+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: 3px6BrBcXPzx819K_ZymSmOFwUmilFPE
X-Proofpoint-ORIG-GUID: 3px6BrBcXPzx819K_ZymSmOFwUmilFPE
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/msi.h              |   1 +
 include/hw/pci/msix.h             |   1 +
 include/hw/pci/pci.h              |  13 +++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  49 +++++++--
 hw/pci/msix.c                     |  35 ++++++-
 hw/pci/pci.c                      |  13 +++
 hw/remote/machine.c               |  14 ++-
 hw/remote/vfio-user-obj.c         | 167 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 13 files changed, 297 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index 4087688486..58aa576215 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -43,6 +43,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector);
 void msi_send_message(PCIDevice *dev, MSIMessage msg);
 void msi_write_config(PCIDevice *dev, uint32_t addr, uint32_t val, int len);
 unsigned int msi_nr_vectors_allocated(const PCIDevice *dev);
+void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 static inline bool msi_present(const PCIDevice *dev)
 {
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..4f1cda0ebe 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -36,6 +36,7 @@ void msix_clr_pending(PCIDevice *dev, int vector);
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
 void msix_unuse_all_vectors(PCIDevice *dev);
+void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 void msix_notify(PCIDevice *dev, unsigned vector);
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..b54b6ef88f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -329,6 +334,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..5c471b9616 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -307,6 +315,39 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     return mask & (1U << vector);
 }
 
+void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
+    bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
+    uint32_t irq_state, vector_mask, pending;
+
+    if (vector > PCI_MSI_VECTORS_MAX) {
+        error_setg(errp, "msi: vector %d not allocated. max vector is %d",
+                   vector, PCI_MSI_VECTORS_MAX);
+        return;
+    }
+
+    vector_mask = (1U << vector);
+
+    irq_state = pci_get_long(dev->config + msi_mask_off(dev, msi64bit));
+
+    if (mask) {
+        irq_state |= vector_mask;
+    } else {
+        irq_state &= ~vector_mask;
+    }
+
+    pci_set_long(dev->config + msi_mask_off(dev, msi64bit), irq_state);
+
+    pending = pci_get_long(dev->config + msi_pending_off(dev, msi64bit));
+    if (!mask && (pending & vector_mask)) {
+        pending &= ~vector_mask;
+        pci_set_long(dev->config + msi_pending_off(dev, msi64bit), pending);
+        msi_notify(dev, vector);
+    }
+}
+
 void msi_notify(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
@@ -334,11 +375,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..1e381a9813 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -131,6 +136,31 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
     }
 }
 
+void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    unsigned offset;
+    bool was_masked;
+
+    if (vector > dev->msix_entries_nr) {
+        error_setg(errp, "msix: vector %d not allocated. max vector is %d",
+                   vector, dev->msix_entries_nr);
+        return;
+    }
+
+    offset = vector * PCI_MSIX_ENTRY_SIZE + PCI_MSIX_ENTRY_VECTOR_CTRL;
+
+    was_masked = msix_is_masked(dev, vector);
+
+    if (mask) {
+        dev->msix_table[offset] |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    } else {
+        dev->msix_table[offset] &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    }
+
+    msix_handle_mask_update(dev, vector, was_masked);
+}
+
 static bool msix_masked(PCIDevice *dev)
 {
     return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
@@ -344,6 +374,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +461,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6e7015329c..2f450f6a72 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -317,6 +317,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1212,6 +1221,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2251,6 +2262,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 645b54343d..75d550daae 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,12 +56,16 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        msi_nonbroken = true;
+
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
 
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+    }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index dd760a99e2..5ecdec06f6 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -96,6 +99,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -520,6 +527,155 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
+}
+
+static void vfu_msix_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                               uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msix_set_mask(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static void vfu_msi_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                              uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msi_set_mask(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                     &vfu_msix_irq_state);
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                     &vfu_msi_irq_state);
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    int bus_num = pci_bus_num(pci_bus);
+    int max_bdf = PCI_BUILD_BDF(bus_num, PCI_DEVFN_MAX - 1);
+
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
+                 max_bdf);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -632,6 +788,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -657,6 +820,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -716,6 +881,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 64f6216379..29a7f36e41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3634,6 +3634,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1


