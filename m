Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E7532DB8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:42:45 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWgF-00040D-B6
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVO-0008Ik-Gi
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:31 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVM-0003Z0-3y
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:30 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFETSv009629;
 Tue, 24 May 2022 15:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=DH8Elj0BsRu9v/C7IDK76GSZTh9yRKpXnqnoY2xHMv8=;
 b=pYgzRZGoIkDvHkXGXO4tIu7j1nu2ZAmAKWOg8OG9UkQZtwqwsqpGxXpR5/2tJlxVRYEi
 1C4vstS0sY3s3N3rQhmhqOO781HSEflNDYDXKY2GjPIO3z6wq1cIscvGpMYXBO88Pkl3
 dZPmHCQ9B8a74lNcJmWHVDcPWEMT8zZXFRD2r4Rlfv+AyBZO/k2Nles+mTeqDmElO2fu
 rn73PSkvi12GzpcDNlSgbilSUmm9lOOwInVhgUoO/onf1PucqH7d5MVshmj39+d9OjEX
 6E5jiza2M0MzTwrFx6j4jOF1+duBtndPFVSDjooJ/mgkQ7wKN5OXSeTj1sOkOKicssl7 Xw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmtxrjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:21 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFGJmQ025923; Tue, 24 May 2022 15:31:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8drc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftAHHqD9n4WFzEbbK1SC/1xsetOFQkVTP75jqJrknSIOovX/TqBJ68e66OSWzqmAqFYs1LWF0G/YZ+DEQR1Dauc0ZP+80pDyR1kSnuhy7MSwPzhKTNHtcGNHiwC8nHPLX6a1mHTZ9bDHxd1ZW9IUEJFp1d8ZmX+I3aSImGFIXuvG/bKDYwyqVSiREd+6SqPFowyuLnaRQj0YHrNm7hKrKnU9A9a9WyIY1uSoi7YYZUHs3Nce026IbLcvOjAvd9+RHkjgUCMUAdkhPgeJmowINhW7dUQ6zI7fBo605H/2GARgZQsWteiy2iDCoJrXNOwZn6R0Aez1dLiEDEnJ+Dy+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH8Elj0BsRu9v/C7IDK76GSZTh9yRKpXnqnoY2xHMv8=;
 b=Iy2FlCY8vyMQiT3oMCp2mSjuOScliG3TD71/oRCsy2GotR/Iyewl+urc/uFx9UvWk5bRRcp54i7I81RQHgZ4iITmVwjgPVKBJW+i/a1MzNRcjh4Nri4wGINfjOWWOmom2ftFnMZ8JPsl911jEaVMRj1Vdxzq8Le6zxaujefgJXKjXBWmxYWCkICvLJWnMqZgOURh382RfCBgedtJZrVu+CSnAd04CgFoD84dJCm5IJQUHYA4ZUTmEl6vGqAhA2JWmcacrIQ1QHiQRr1Jm0joggI4aWnE8TY/M1xi3dw0apyRXijCkfXti/9Yh8zXw2ZONrgvXsLhXJKFld0pXLPZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH8Elj0BsRu9v/C7IDK76GSZTh9yRKpXnqnoY2xHMv8=;
 b=qMjZykBBxLxmNIzGb9wze8SMBMcEPh1gSWYSJ5Tq1ghAbcceSHdVnfC7Tnm7zIkfmc7Zmwarv3NLPOB/4layZhcNIARys7fI19CvwvQbVEp0xqGQLuk3QS9r7OiBWYFVVJD9Nza8ojUjcJ9YOmelEGDmnx/KVx3CEmHuK/iw5Z0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:17 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 12/14] vfio-user: handle PCI BAR accesses
Date: Tue, 24 May 2022 11:30:31 -0400
Message-Id: <f85445f41bbb77e53f558b66b3ef064d9d80ccdd.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9335400c-9013-41ef-9744-08da3d9a71d9
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117D95CE557EBB36124693390D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJVQkeFtolSMDeVxjTsvOa+CfsrcuDG1prT+SG3vsFV7QnUjEKBcfjJTqANGoIG5bUsUEAR8yc3kljCr8ELWtu0iEdMkHnI3o4n/FYPM1lL0/SJumTAnpoDmcXymFIbcEw1nWmNpetLyq1vBw0uzqaQ8aMSfQfbuFg4aqMpxq1DPT6nZWQMfWkHchFT+XInlYJTwKH2Yz29zbbfDRctSklPVsHYQRLzxwcbX/v6H04QNuYNcd//igVrjwztbYLsxWhFU/htxn6NdEy/MqqKbPDEFoKZvhZKyEdTvhntIgOCrDAmUmf/bdbDE4FH/dS4U8DypNgfj4S8nIQAhUJlNoY3SW8fwXP8sbjPaK1hJ/BrZxjwdlqA7PCqtp/xixeXtNBIXBZ0s2M9LlTJRb+g1nU/DEpvMGhCN5s3+UGNGfrYsWMP/vioTv2sswk9DgLG/Ojhi5fes5ObFaXqDXutQ9y1NIsYP5+H9RjUsHyH6LPbZaLTBazD9XOhnfrp9Bpa8W+bFofh/pvFa6cWOu3D6+Dhp7cQOw3zEVBES/Lqksp1sh+e4dUdq13yxXVmapEgmA0ivlORWtx6WPU7HJ5GWnZbDnBXhcYYvLXfEgIJmuQeTlx33/U6imDt3pB8f0mz1p4dCVmAXCvc2oryFpJz+4R3ctYEx2A+KziDSR2FsQLvzZhyCTtgJYV0H/6lpcr2s+G8LQ0Cdq3OgnKJ56dOO8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JJj7SOGX2nHCmZgL7SfrM47wuxxLEtbc00kGnnOsHVmNN3JcvcyxKMWB+uL?=
 =?us-ascii?Q?FWo+ZP7fjc9ufsnGoTfgzp+wjwy0kkLztxmNUA5kQmjZCzslyeWORl3j9SCy?=
 =?us-ascii?Q?+pTFggAnLyWU6AS2p1Cbvsx53HZkxnvADsOvRYkRJTAKPeMDOwxsIcUl6/yo?=
 =?us-ascii?Q?IJOl4X3k+xn5p6cdaD6pd81EWN/mkkYEXuunWV1mg+50Zws2gJje+Cf0riVY?=
 =?us-ascii?Q?qY8zHFoo89NjpZXbQxpvDPeSjC+kia826DNkieRgwfnluImnMCUlWYrYXnpD?=
 =?us-ascii?Q?83PaBaAg+OqEHlWCiYSoaVPunUS4NMAymuC947hLWxOofIOxN2tcr1E0ri3M?=
 =?us-ascii?Q?2uCaqYeb3qp7FyKskr96qKgRENkQds2SWZaqrfjkf5ZybUEfNnd5f9eSI6dY?=
 =?us-ascii?Q?/UsW5ur5mwCifPtIijFxPcrZ0qw79mBFHbb4Xu1oxSimHcAzq/sVCe058k4g?=
 =?us-ascii?Q?nodybBllas1JtEsJmPAtQFHlXUXzCooHQI6dZy3yj3Iw0Rv8sWsLBweSxgG4?=
 =?us-ascii?Q?33ODeqKx/ZIrCSoklO5YbE02Nsttr5yez77G3qBxxpZ87tAIOpGjftmC7riK?=
 =?us-ascii?Q?9pfAgfT7dxy757MsJzJYIULdHRCLh1NMIEM0ZtjuqnrffTGjFec0svQ8cxT1?=
 =?us-ascii?Q?dJ0/I7sMs0xRQA0e/vJcpAOfeHwi+reu5hSKs2kJ7pSlUYr6dtRuKKMhyEds?=
 =?us-ascii?Q?AVWrqHS1+bf7n6xE9jPA3V46gtEnE2a3JA+ouWE7VuCVEujOpFr2rmwjjoWC?=
 =?us-ascii?Q?gWtNenXddHC6o4D+QFd1TapCt9I6mhrLrYtXdoE43ar6mv1bIHDQzIG+V6vC?=
 =?us-ascii?Q?+9+SOi5yCo3fnUZu+A257ARJ2BmzKtWToG3Ij9Vv0ooTVSXMWss6Q4pBwrd6?=
 =?us-ascii?Q?3iomW+1nDMipPoi2c3Wz0+F61EmvK8YraduNBsBX6qYquBqD/SBko3pKm4tM?=
 =?us-ascii?Q?bhaAYIcbL54cb7OxgukKAnDVby6dFVRwl7/k40oLTzV3ZrY9J8MeUBEDf5F/?=
 =?us-ascii?Q?w/HPu05M4N4IxvsVGVk7DpTwIngQlGpnPSOLYigpQjAerykx8Fs5Mgc3fgR8?=
 =?us-ascii?Q?R2nroAE/jKaZlLsRbF/PZ3ZJAvPcLvDlt3MK7mU18OF7cQZCIsYrIOplPBht?=
 =?us-ascii?Q?oQxaI5q2a6mocvIrPTe3x2XizFyV91Qdqxu5YrALsaa3q2rAH0FdPd7c/lzP?=
 =?us-ascii?Q?+bP9+253r2j7RQmAw/gJo0FK13EHlpzUPPtz19s2xA2vklkTL7dL1Fzbe9cg?=
 =?us-ascii?Q?oataf7UoXjuZc5RCRL97RtxnpxXh8JD1lc76lFZ515KiGg35diRS4Fkj/JwF?=
 =?us-ascii?Q?AuyF3kXpWIOGvRYlfR3pYgTKW+4r+4MVpIG1KKnVGHflnse/ICc0bn9pYyrz?=
 =?us-ascii?Q?xVnwCS6fpAb/nsodMs6TCIOxac0ilLYkOclqRJzBhg05ikNUT7ntFCs+78Cp?=
 =?us-ascii?Q?hb/PFP3FsSFBsdiWEsZMteblURB2c3cjd3rzOm389czx1krtznueXnnQ3bjT?=
 =?us-ascii?Q?6w/72lq6VmyVY9/DrJ40U59H9CucO4NM457TAszxc8c+nFojR88QF+RtfTJc?=
 =?us-ascii?Q?DqcOigp9TN1cEfLOrAUCEDmIIhya5VLVi96T+fx+JNV9EZF7EU4DGzNW4Gdy?=
 =?us-ascii?Q?kIZQjXlpnNNSKVS/ujyuJjxKUdCfhU7Eht2zku9Cb/G8wlv1jPCj6I4D4kKz?=
 =?us-ascii?Q?oA0kTUslOxlC3Bfn46fj5bIdrk+zKZPHeMrSLWWdj0YDajaWwkXHS65igYzj?=
 =?us-ascii?Q?DQsL6bS9BQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9335400c-9013-41ef-9744-08da3d9a71d9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:17.3345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsjPY+KGxCZheHpP5YMw2KPU7XBxFOJfNbKwNoBJlKBQCMGZDsViTFiqXXTrCHJ8AJoCFijUkZVXUrRd2WWPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240079
X-Proofpoint-GUID: 4yGIGeY6Al0NH9gWrUVPBfHuz1PyCVWd
X-Proofpoint-ORIG-GUID: 4yGIGeY6Al0NH9gWrUVPBfHuz1PyCVWd
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

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 190 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 203 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1c19451bc..a6a0f4d8ad 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
+bool prepare_mmio_access(MemoryRegion *mr);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 8d208f1294..ee28a93782 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -52,6 +52,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -332,6 +333,193 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *buf, hwaddr offset,
+                            hwaddr size, const bool is_write)
+{
+    uint8_t *ptr = buf;
+    bool release_lock = false;
+    uint8_t *ram_ptr = NULL;
+    MemTxResult result;
+    int access_size;
+    uint64_t val;
+
+    if (memory_access_is_direct(mr, is_write)) {
+        /**
+         * Some devices expose a PCI expansion ROM, which could be buffer
+         * based as compared to other regions which are primarily based on
+         * MemoryRegionOps. memory_region_find() would already check
+         * for buffer overflow, we don't need to repeat it here.
+         */
+        ram_ptr = memory_region_get_ram_ptr(mr);
+
+        if (is_write) {
+            memcpy((ram_ptr + offset), buf, size);
+        } else {
+            memcpy(buf, (ram_ptr + offset), size);
+        }
+
+        return 0;
+    }
+
+    while (size) {
+        /**
+         * The read/write logic used below is similar to the ones in
+         * flatview_read/write_continue()
+         */
+        release_lock = prepare_mmio_access(mr);
+
+        access_size = memory_access_size(mr, size, offset);
+
+        if (is_write) {
+            val = ldn_he_p(ptr, access_size);
+
+            result = memory_region_dispatch_write(mr, offset, val,
+                                                  size_memop(access_size),
+                                                  MEMTXATTRS_UNSPECIFIED);
+        } else {
+            result = memory_region_dispatch_read(mr, offset, &val,
+                                                 size_memop(access_size),
+                                                 MEMTXATTRS_UNSPECIFIED);
+
+            stn_he_p(ptr, access_size, val);
+        }
+
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+            release_lock = false;
+        }
+
+        if (result != MEMTX_OK) {
+            return -1;
+        }
+
+        size -= access_size;
+        ptr += access_size;
+        offset += access_size;
+    }
+
+    return 0;
+}
+
+static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
+                                hwaddr bar_offset, char * const buf,
+                                hwaddr len, const bool is_write)
+{
+    MemoryRegionSection section = { 0 };
+    uint8_t *ptr = (uint8_t *)buf;
+    MemoryRegion *section_mr = NULL;
+    uint64_t section_size;
+    hwaddr section_offset;
+    hwaddr size = 0;
+
+    while (len) {
+        section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
+                                     bar_offset, len);
+
+        if (!section.mr) {
+            warn_report("vfu: invalid address 0x%"PRIx64"", bar_offset);
+            return size;
+        }
+
+        section_mr = section.mr;
+        section_offset = section.offset_within_region;
+        section_size = int128_get64(section.size);
+
+        if (is_write && section_mr->readonly) {
+            warn_report("vfu: attempting to write to readonly region in "
+                        "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
+                        pci_bar, bar_offset,
+                        (bar_offset + section_size));
+            memory_region_unref(section_mr);
+            return size;
+        }
+
+        if (vfu_object_mr_rw(section_mr, ptr, section_offset,
+                             section_size, is_write)) {
+            warn_report("vfu: failed to %s "
+                        "[0x%"PRIx64" - 0x%"PRIx64"] in bar %d",
+                        is_write ? "write to" : "read from", bar_offset,
+                        (bar_offset + section_size), pci_bar);
+            memory_region_unref(section_mr);
+            return size;
+        }
+
+        size += section_size;
+        bar_offset += section_size;
+        ptr += section_size;
+        len -= section_size;
+
+        memory_region_unref(section_mr);
+    }
+
+    return size;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,                      \
+                                 buf, count, is_write);                        \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+VFU_OBJECT_BAR_HANDLER(6)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+    &vfu_object_bar6_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int flags = VFU_REGION_FLAG_RW;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        if ((i == VFU_PCI_DEV_ROM_REGION_IDX) ||
+            pdev->io_regions[i].memory->readonly) {
+            flags &= ~VFU_REGION_FLAG_WRITE;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         flags, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -442,6 +630,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841eed0..fb16be57a6 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2719,7 +2719,7 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
     invalidate_and_set_dirty(mr, addr, size);
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -2746,7 +2746,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
     return l;
 }
 
-static bool prepare_mmio_access(MemoryRegion *mr)
+bool prepare_mmio_access(MemoryRegion *mr)
 {
     bool release_lock = false;
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 25df19fd5a..447ffe8178 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
     return buf;
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 
         /*
          *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
-         *  memory_access_size to identify the number of bytes that it is safe
-         *  to write without accidentally writing to another MemoryRegion.
+         *  fuzz_memory_access_size to identify the number of bytes that it
+         *  is safe to write without accidentally writing to another
+         *  MemoryRegion.
          */
         if (!memory_region_is_ram(mr1)) {
-            l = memory_access_size(mr1, l, addr1);
+            l = fuzz_memory_access_size(mr1, l, addr1);
         }
         if (memory_region_is_ram(mr1) ||
             memory_region_is_romd(mr1) ||
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1


