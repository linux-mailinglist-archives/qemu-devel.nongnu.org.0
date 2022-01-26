Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7142E49CC66
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:33:39 +0100 (CET)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjMg-0000Ef-7i
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:33:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJC-0005n3-Cg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJA-0000ay-8H
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:01 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9eW8D007704; 
 Wed, 26 Jan 2022 14:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Ox/zOozTjVPpGHAYcAG/U2AEAw7gFnHkk8V6kSYkDuw=;
 b=HLEw1gKYIpGb+zawbN59gLXGIhK+FcSEOVBQfkEaCx23v5/8WD5wscw/8uvTuiJ9tcy1
 LSYWZTDO4vITGw7reFk22Iw7lRCp0blIKKY+FvlG3m4yn78VGTTN8wvmaaAuiOcv8I22
 5PZRnYT/U0x6Y9RnHiYHSc0eRpnULdpe3nfXlO1CcJh2edNb/+bj9p5i3xhOE46/GOsW
 kSnrTIRH+oLHI1STytfIzlW4aB/lctY6Ii6FossUWY9SRxZNmxrr8D0FNdkGYV61tCl5
 DNf9w+wP5gfMdPOAWneiS0MiE2vg+b1HK1NkSyW3njSUVnSa0gLWYRyNrIZyPZAi/S/E 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6501-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEQoxH181401;
 Wed, 26 Jan 2022 14:29:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3dtax8fy4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjjmFLp+D8DnEqhAQxY1VCp2lL3+PgMc4rOFFqZZXeUCH6d1xgvLRIdq85LsqZ1Iitf3+0XnoX9GQpourtHBwG2tTeLc3i3QA04lYGJTGKo5O2rIX1lbvLSKetRbPLICXHPzJ4NF6FiD1oHifDrN+8gH3DGCsLEjUFN43d+ItDkBw8dbWCF82rp7qPb/n3CZ/ipL397V5+8Xxpo0STYHp9K0qAIgQVecBxRK5Sqk3ZzL3NvBcre5JSpQvSrMmli9DEGar9idcLIibxvXrfcgw6yu5GTrCTt+6y1fCQrx+P4RdwtOfKNoUBUU5uiwJYKWRODbktJrr+HWkPGsyT8KbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox/zOozTjVPpGHAYcAG/U2AEAw7gFnHkk8V6kSYkDuw=;
 b=RGoU90uiSK7gryHXoGLeIHnpLYNPkPUZfQAcxP5gmKgkaR6j8o5I5myu2yEKRar4jYlaa63JjhX2tEwexd1nyVwzbgU9yFKWTkMA30mBTSYcRQfilXdZmx+SqlOeb1dM9nHOUa2RJaPqnVz3ospq59mv+jlEO4tlrl4MAKdeeXkYGkltozmvbc1JtiUNRjyp2XjUZXdSvvUcafU9UwRMf081/Y4WB6Zoop0bZ9eOH9bZTDs0NNfDsa5VR38lxnAzQT5qwh9EvjVx9c/WUO4oywsB9H6uOrZTGgWmTO87yEslFbmxbnHIQ6s6F0gEKvEGsAq/Nxa9NGV/RN8yQby86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox/zOozTjVPpGHAYcAG/U2AEAw7gFnHkk8V6kSYkDuw=;
 b=yHyX26NsQuzk0vs3trDHPGoNCVs9ltN0BxVPz0VSWJ7vtieADLA9v3PXcS2AIKGqyiS/NyrMO9jo2CvpAAlSHFvPYFj6kMD0NvsdF8R/drzQ02f23X58LjThlY9+zxEpSDv5P/yqv7kyzeqWy5A9uP9wKd8jPQlHUaqoGpxgmTc=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CH2PR10MB3990.namprd10.prod.outlook.com (2603:10b6:610:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:29:53 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Wed, 26 Jan 2022
 14:29:53 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] vCPU hotunplug related memory leaks
Date: Wed, 26 Jan 2022 08:29:42 -0600
Message-Id: <20220126142946.667782-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbde94df-c07b-4ce7-90a3-08d9e0d8519c
X-MS-TrafficTypeDiagnostic: CH2PR10MB3990:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3990E39202E54BFF45F8D92FF9209@CH2PR10MB3990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2j4FSdAJDSMiPavTHWx2bLGFMGmjJWI/yUbX6q0MdJ3anvjjf2EfYAXTp+OQhlk/UjR3jyMSSLvneJQbkPHMkNBfd1bfquifpNaji+btB7cA6b5GVkvsPI/cvNzrL4CEboiQ+4NcJtr6reDx6BgxKoYifV7YK2Hds1JmJPx4pglNR27UC+Txv1nu6gd0eGOkaVJJNnWAijRxs2Y/55zS/FELMr++lfnaHvORZTZQHnVJoIpHhp0rjPcFzuhw0hjDeSmYw/LJRWFJMGYeJU/Tf4GtADisJBxTSB4oM1JrKz/4YWN5x7CQDv2wz4VIOCOY5/yd1eWD9mJSlEb3IPxyv5O9CoF//UIuNHJKiutSKlRmzUW774zbUVYKyMDz8Ype/tcVFbJcU9X6u+QAxZH+HL6+KzN9bk8F5uNIZQFLB5zDE3JTFOsSBcHx8E6pxG4Olxgi18IRWr+KE/wQtfoy5cmcQUuYUr2U/1hNubYu+ro4BhHAyULoJdTSSyMPkTnkJwISzn0hDkaKjU8zoXUBZ0YIByKl6cSHrP1eVnN07MxtJ2Tvgm+L4sJfDcAcrslSdjHQMViC+UQTFT5YV+kqgBwGHIfQ518mAok6AaK92elVGNRQoj+IsKFmv6kbSEJ8KTv2EZqBVEWbRDHhZiQaiYuNv/xsfd2J5HFgOA4AalSRkLcsBPjLS8JnedZ4416zKEHjcITyiPFDjzYaFoV7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(36756003)(26005)(6486002)(316002)(66476007)(1076003)(186003)(66556008)(6916009)(66946007)(2616005)(107886003)(86362001)(6666004)(6512007)(6506007)(44832011)(52116002)(4744005)(4326008)(8676002)(5660300002)(38100700002)(38350700002)(8936002)(2906002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JPkEymwPc+FVTo2varH4dv8wOgGjKDoK02WoU9GuAPYc2Fu5EdjaSvQt2M1K?=
 =?us-ascii?Q?t9jWL916SeBeodOxituSq9AYmZIAMlrgts+dF3hlJ/DKIn0GHrmGxa/5jKsg?=
 =?us-ascii?Q?OHHGplOXICTSyHNGN0agxgGD20+hPgUIoTm50pqBdZhP4mEXhlSUQ3pHaUL8?=
 =?us-ascii?Q?P6u9L5R4ayO9vmyBYip495LPS1xT8T6W0h0DjJtFIMH1fmWx/eTGd4lfdE1y?=
 =?us-ascii?Q?BsT8E3zhI+t4n9CKXEenLcTAE2wziSgsdnQYiF40W3hhr+MNe7bVvn7mXFIh?=
 =?us-ascii?Q?uhdbXKozjEmPoT7Q8kTAk+Ps3T+9sw0jauBMueS6eYljsxEGlViRIfy1/Isn?=
 =?us-ascii?Q?w0DG2Hz6/es9OEZbEClUF7ci66HdBS0hA6ihnr024QGietKRgVoJfUKG2Qse?=
 =?us-ascii?Q?O18lpFITUrDVnfmF2xxV7RVqS7ec8EB0UswW34lDXgc+0lWwzuVZMHSPO1b3?=
 =?us-ascii?Q?D8Clf6PRRhCQ9irxG8DdjJQnu4uh82YGEb0XfpyC4a5In3kYkydQAS03htFe?=
 =?us-ascii?Q?Mdjxq9IetJxfQqYqNCZ4rLNpnLcmLT8feGsHR79Es2xBCsYENbUv/vEShT4M?=
 =?us-ascii?Q?uqmmIWDqaIRchHET/p0XsdCH3phcJqjGqle467Os/P+LF9C049dL2F6fsCaq?=
 =?us-ascii?Q?fTwiGv3+Ld0Rfr7JfTJFI/xX3axu8C+4ldeaeltSUw4GaCh9xjYz3M/YU8W3?=
 =?us-ascii?Q?y8d0uyuE+k1ff1pLigI8XCGTuq4KdpzvEeoaZu9s2tca/2Uknm7QMJc4JuI9?=
 =?us-ascii?Q?cIDd3GVRBg14H+jVtLsU/8q28Mee7bKzpSXQXygT0hI/cKzZl3E92IULbu8o?=
 =?us-ascii?Q?UlIP0d23qOrx4+Siohp16RwplF7V+B1idVvqkixCx4RfRxmOfNFrUqa2YDVH?=
 =?us-ascii?Q?9qCF+zBOa1QkUDTChwbr4VD7VRNNCYh2zvoUgOS/UZhn8PtFubhCx7nyllrN?=
 =?us-ascii?Q?oqaBwZAM2YB2zNWRnfKACIo24l9/J60BOF5GTRTTkUTY0YbGFY9+acfrO15A?=
 =?us-ascii?Q?dgZzSHqo+a39Ql5uxErIdtOGtwsiu4l1dKF3hG4iPpX6UJyER3U2QtsN0pDC?=
 =?us-ascii?Q?Ifrt7lwrwJm1D1w3rvrggOsVZ5+noo2neDFVDy32w1y0THPfS5HYTVDn8WNJ?=
 =?us-ascii?Q?p1DKhRHJ9mFiGcHBL71B5xeDQGFBPXIhym4xRX0sN0lWaVLNzUNQMUlyKuIm?=
 =?us-ascii?Q?u6HZB+4bWMgBcJEPuDcjiNAdQsp5y1nc7+4gynXeQX93Zhu0FrrHt6m2n9bw?=
 =?us-ascii?Q?j46KR+X76RS48CS6O8T334h8MnrAMJp1q0Yam+4R6U2N4jIyb4bfIpxXJ+tj?=
 =?us-ascii?Q?wFsJMnQynuqZjMsW55Svx67JaIj6JTcykuDhM/s4ITmVD1+qYNglLEhYnYOS?=
 =?us-ascii?Q?B6ETF+eefoGEOB1lBxj29wohNX48sCU43oMc3M+47JxzwO8Zmu3dQ6/1O/to?=
 =?us-ascii?Q?/dbt+WcvLP/6O9yyKZhrdwCE16bH2X1fAWmM3dgDBkSwAJy0J1M1GfuZCV1k?=
 =?us-ascii?Q?4c/Jxr4Ube7zyPOWn58A6UuRVxvZXl42cXgFNon//TcOueMOmLTKPlEmPacg?=
 =?us-ascii?Q?fMtpYw3YtGmEiNhC9gdLDPcdVv8vuelF3gKLsmmVQSVfmq258L0UImgZ+q9V?=
 =?us-ascii?Q?rMK7bguAzO2BcK/0kafrQD4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbde94df-c07b-4ce7-90a3-08d9e0d8519c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:29:53.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkR1VNL11sx7ltp9GQquREy00txsaM5PIPyMoqkcgjskZMfOIqMhPwRmc4ZG/19W4kjjQ7PU35HeRomfd2JhSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=885 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260088
X-Proofpoint-GUID: pjhDZTkhvx7zinWNIXtbfrgEW2wV7jH_
X-Proofpoint-ORIG-GUID: pjhDZTkhvx7zinWNIXtbfrgEW2wV7jH_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series addresses a few vCPU hotunplug related leaks (found with Valgrind).

Mark Kanda (4):
  softmmu/cpus: Free cpu->thread in cpu_remove_sync()
  softmmu/cpus: Free cpu->halt_cond in cpu_remove_sync()
  cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
  i386/cpu: Free env->xsave_buf in x86_cpu_unrealizefn()

 cpu.c             | 1 +
 softmmu/cpus.c    | 2 ++
 target/i386/cpu.c | 2 ++
 3 files changed, 5 insertions(+)

-- 
2.27.0


