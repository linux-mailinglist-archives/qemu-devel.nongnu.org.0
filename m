Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C475F6E77
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:54:07 +0200 (CEST)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWwW-0006SQ-UD
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogWsg-0002jw-Rr
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:50:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogWsb-00074X-TS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:50:06 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296JTSft018329;
 Thu, 6 Oct 2022 19:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=H45QGHBvWLxFLX2Rwm6jszHYqSa+DSC8lc+BuZ8s0WU=;
 b=k7kG2Me289tzVQ0AMY+YfPf14v+UjuGqbT7WZootPBMnMQpWgd5hIf5iZRt3jZYLhCPT
 f3W/1lD33AJM1DTWJ0n/bVUgeq5ntqx6iuFXoUCl0+/ICqObymfK4h74TGcY2hvszkOT
 caZsEp0Wk90UcPQkYoPdjQfU/o6jQD14rvnkqzW9Bk9JGmRbHKXsYo+nLSa6xtmz7hJk
 DFchUnF/gcTI+gLqULTWbUWir0HHKdWeZSt2QvC0kb5CzVPk8ngSK5atVB283yT9YaEc
 Wu7g8MtMq4qPaX6rpl8jMnA9PD1Ac3G6Bjh+u1DdlMIk2Rh7RieFQk7K0GymS48+M2Bq Lg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxdeadbt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 19:49:52 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296HN5tM003047; Thu, 6 Oct 2022 19:49:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0cqgnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 19:49:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiAmXlgvjnV5xZJbNXdrBuyRGgSRzemm6oKiWq/BuWiC1K6chyUeSVNqA3GVGRcW48wZfycQnIB9M2M4UVC8BROg6tnru/sFC6JRjCI6cbat/8jNnjHjMTu5OsawldnWT3INM1KvlWyctEWblMsyr/fDs4d7AYQqNu7cAdZ+KyMrVSNMLNsDbixSO0m/Ot6nywU5DVBkfGOpRRq4+HWocSCv+eyP4b0sixmDKR4vv4qsoGwB0u/V/ySHrPh5ZJmsvA0pXMAfcqLEvGCVlnxJLgcYejJjOIh919vwMy3G2GXb/tAiPvNf+J9jQea/RWPPzfYlEpJ7vKGm0LjcckTJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H45QGHBvWLxFLX2Rwm6jszHYqSa+DSC8lc+BuZ8s0WU=;
 b=B53Fxi72QBTlJCREtgIcMrAjaSnpqp/HwpdGUm7orlBclEpLB4yMm9QvvNk46TGJqPklrSeHi7yYbp5HwMIYWtkKF3+tD7184aP6M1ipA+fnxDT6d7cTLry8JYxIv5mQ90las4TstAF18RHKLXlZ5mxBnZxxyAM4kbax0nlpUdLAb8NTeWGyaawdz824P8vO5CgXK33E8VuRsyDfLxyhsg4d5Wo3ATKgsnjXvyUV0kbmyQSqjSxWk94QX3z5PiFEyVpyQvPKPNWElnqd90gNA9zbMFqXSnUzxKwkph5MmQ7rNHERnjZ6CgtT2h5mgVDUNMbGIx6SA9n0cxftVjStmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H45QGHBvWLxFLX2Rwm6jszHYqSa+DSC8lc+BuZ8s0WU=;
 b=XV0W35k5Xal0I3YvJYh6O00aIbjdLQuCv/2eWpk+ZknHV0nitMnfzukL6V3KzH5KENdKkfgmjWLl8QYbgCmBzPYTopGGHiGxyLsFLbxq8VGInDFwoc6gfJMEySXgVTGhZojSArDWxFfkwthFdRFKBwbqIlQVzwX0pp/+QTwsFEI=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by CY5PR10MB5964.namprd10.prod.outlook.com (2603:10b6:930:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 19:49:49 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 19:49:49 +0000
From: Venu Busireddy <venu.busireddy@oracle.com>
To: venu.busireddy@oracle.com, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data upon
 disk hotplug events.
Date: Thu,  6 Oct 2022 14:49:46 -0500
Message-Id: <20221006194946.24134-1-venu.busireddy@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:303:8f::24) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|CY5PR10MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ea2789-49a4-4a5d-9554-08daa7d3ed6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iyFqP6A9jhj5ECmd/pEVomBPPXOWACezEVtyWUUGAWcfsiLDywvIUjImnBTqDPwy3Vl5oNRHHsI9vj3JBuI8pUpqLNbaRc7cAO4fepz3mtUJNuEjIQLMogcSc7N4UdT1KktwAO0H2Kfu/4LpAbuPwZCLHB74tnV5UeBzzer48KSOeByLDu6/TB+7bFMyZPt6aVt3mqY/EsFDa56qsc7etMF9H0i2G21ITX7uu7/nlGamfny2nf4Dh5ksXO6esayscqfzFZ2+WB1scmaLPvgiI3VqOOhMVXiKcRCzJ/lphdaVoJLPo2ZGUT0Z6vlzW/c81ojxKZGUlMOmH0ByfShXijY6RyFz0eHPTMnesNvILk4bs6tvBTpU0+H3tkO0BzHpHBWZibSTDkvNaOhIHJ89IQHKhdk98naSQbg9XXMlYt7xYXLkJsCBKawDrCUH62Sm2hrfxbpMQTn5HMaJyza15qD3J3AEknrCERZd3czjQPH3PWekfTVZ7qjGqNFBV5+YGG1cE7t37kT6Jj0hLFDXczQXdu0yfFx9LIs9I0NhHRwT6lG9ojri2bXE2kxinkILLhiL+tMgK/hVv1kbsWc7UttdgxotsFGNvS8TYsqIlNXDDP6JobByKLMvB+ZyPD3CIUHykqxUjRQOnG33Xfb2ThqWpPClcx1dV7G+Tx09wlnn1UB4Ue5zljzbRwIvhx1pajpkxfKHgmBh7Cui9HLjmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(26005)(2906002)(38100700002)(186003)(1076003)(478600001)(66946007)(83380400001)(4326008)(44832011)(316002)(8676002)(66476007)(41300700001)(6506007)(8936002)(5660300002)(6512007)(66556008)(6486002)(54906003)(6666004)(2616005)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fhqjJUWubG0ftQ7yFLEBK2fYjpkealS0KO4H/mvBclfiQfbnonXmks3CGn/S?=
 =?us-ascii?Q?E8tnNEYEXSPzlByEE3N1UStQ0hS86pGHTzgSy3AGiPZtKEzAr08UWqYHbElR?=
 =?us-ascii?Q?s56oiN5kOssUyVJs59GYx6ERtYof/eh3nt4ecH6N5Vjf2+k5fmfNVzUFQZBX?=
 =?us-ascii?Q?on8Bt52DDtrBP/TXS/IGFmAxmQ2M8ZV5Dw203p8LeO3/HN6gtBOTJxNCenYj?=
 =?us-ascii?Q?6yFytsneVBowBEH+++5bzgAtZsXQZN9/4SfK2EEXwZtkzQBWoL4n2OGglz4r?=
 =?us-ascii?Q?BXi0OkRmtxaohJweGK56729KJwVBAicQ2mtAH9w/bMesJHcWpbfCjbPBt3c/?=
 =?us-ascii?Q?401S29neusNr72m/H8H+JcqAbyzx++ryWH08mZAzVfFAwAQ3peb0+hsdldgr?=
 =?us-ascii?Q?Dc54L6xRcmibzneaFR77FrxjHfnJvTu2LQbNgl/cgx4YZSoeuDbRJo1qDJiN?=
 =?us-ascii?Q?x8DkoqKVdwnKE3iQb1X1F6xMNOKLbtWdCQTbma4UacA1Yv0cIca07ZBGHqEh?=
 =?us-ascii?Q?uObFYeoANth6en5KbPWJUe7VUETGHZt5AAqWLFfmSNGPuNy9+H6w6Rxj8pBX?=
 =?us-ascii?Q?NAIOE8Oh1dNHRBDX8kf8B8snypGffv7IMRXIEoChurd6UOjO4tNrRbuU4b4U?=
 =?us-ascii?Q?N5Espqav2AzKF3q3yVEtfQO3gGghJKbdKJCQOz/DpaGhLMPEazIJQOwbXlkd?=
 =?us-ascii?Q?ytw51W9yQElKoglxpRvUVKZPly50fUGHBnRsGBJzDOUYYiPtq0Po3trAgoAu?=
 =?us-ascii?Q?i2dfQ5bvRELV08vWRBx2aKUOEFvS67bsP42GuizkD8et1aFkU++dEQUgLb4o?=
 =?us-ascii?Q?CyQML0TexUDQ2mGruZph/t3pqZbsROlcY64Xsk7mcrAEPVuSbCsmc8LVXsb1?=
 =?us-ascii?Q?iZ8pTshZ/ZNNm5XDAKRc2vUVqRWVQCTHF0eMf/1K6G8GT9a6EuLjeEz07Yh9?=
 =?us-ascii?Q?AffEwqnZxAEloKphpPdUwCpEKhWozGqHyvbo6deJ8+riruYBxD78hw5yv1S6?=
 =?us-ascii?Q?jNANfbrlmDsQ1U3sQq72t4SRie45UQSoqqgZf3jomZkHoUmuWcqDm8CmuEEd?=
 =?us-ascii?Q?tNx5s6anaS0x9b02xXghPpHG3I/NoGQPqIOMqaFtAyNt6b4H2kb6E9yQJgL5?=
 =?us-ascii?Q?X6nkEibvnO6VeGs4TUwBRpY/61xK6lWqmj+cUCd0P9+pLxHxtRirWSnsT3ro?=
 =?us-ascii?Q?ULeXwdxwAcvWpjg8DLp4UtBvNwF98zJshOnuE62dClTe8Woh2Uaw0avmxRT9?=
 =?us-ascii?Q?wPM5gFfOuOqs0w96/sNLamrHD6g4exYI0r+/J19DxrJKEwQC88RV1hs0EKZ0?=
 =?us-ascii?Q?gQB3Z/SbC6di7FPB4gaw/+rAr+L49CNkuMJAf+8FLqH+RxwUzMo5vlkHOERU?=
 =?us-ascii?Q?oDUFDFHzzebh/Odr5EhHD1lTEQME8khHPA86rIe2IJepw0tXVOGYN7Y6rd68?=
 =?us-ascii?Q?sYklS+Tbby+zG2InQKGQQ+/LR0ptRQLfYc6EyNDWBxLfbJr6oU2p27m4L5PD?=
 =?us-ascii?Q?zeaFujLY2Y1xnlnglGuoxsMZ6FlCuBqzO8XTeXDbmJtSN6YHC9VQ9l1Y0Xbr?=
 =?us-ascii?Q?TRpUm43R4nC8Ofj27A8rBFqmlW5MsEWzvXmDcq0qcV8PQJYYIt8pkE0C8pce?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IYG6GVP8KeWkmirnvDOCAZd26+LrfUSyUlX6TaWPrMu11mFLjMUMPiWg5dT47DS/0o2Pwun1azKBCfr2gae0ZeuVlcVFzqOP0IageNK8C2DGgzdsuFhTxjtnFWEc8W+TMmZ7rVutxnenomMFgYB3xAqepAjSFNU4n+BwKNbklEbXRh+Srh2espCWPR4l6ltbon5vrdqSnmsivQsbXbzStgG5KpWaKfVB2SmWe+7sQX2IXeSgSjgiKO8NCOPgSi8LsLwl7zBe8HjNmMPagqNrRQpkcoeJEKRHiEd1R4lST4pTV+SnkoovMP/4fTMpHu2NiRcQ/iHBrja5AGrUuT2tzLlaP3xHllhH00Hdax+9a0WteMKJtDTsKqaF2EorDHh7WrVJTW+eUKnil4jPjYnjSlNN86S561+RLF/8TkV3T17v5weV2hTmcE08ci5Bp5ECwVgDltJ88fN4HwSjo6q9ENxfXTwTUcPWnCCgfbeHv2ZDGCGdVU6ccOQi+A07xpJbtA1I7GVuIghpXQ/ffe8JQhHhRNN9UXDRgxxCA+08mRfYIhYeOWqv39LC3VQDVAc88o9YGK0Om79n1Tha5xD+bGDfWsNoQTq5d2E52YYwsUiyiQrf+UxHPdaxc89Jr/dvR3Cik53DvmBfHAHqbVoPE8rlZNkzJoybgd/3RIi3bGTP52nCXwrBuG7uugWhFHQUFWskHnlsJ+Xw9Ofk2o4OxIhYNje+ku+cZU1I+POSGKQMDryg/R7sXvJmcdvjSC+8ucLZHBj4UOfdGwRx4bQM3YlNHEDUV8BA2Fm570UOTzvCInt3MCZDNH1rIcpjYpNole8xFL6+j+n+GqBepsyIFA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ea2789-49a4-4a5d-9554-08daa7d3ed6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 19:49:49.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8TbifZkOVs8At8NyKzJf1pgYhcNQ0cqHN6C4vKKrPRtCazJoI8MMvmgn+oTq7n1NKhgazVsS5rMfcPVyfBMZEFFbE1ll8EOymvRThAOCU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060116
X-Proofpoint-GUID: 5Nbn2ki5Y5G8kcgfvjhbmEkBsB7YZhxy
X-Proofpoint-ORIG-GUID: 5Nbn2ki5Y5G8kcgfvjhbmEkBsB7YZhxy
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Section 5.6.6.3 of VirtIO specification states, "Events will also
be reported via sense codes..." However, no sense data is sent when
VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
are reported (when disk hotplug/hotunplug events occur). SCSI layer
on Solaris depends on this sense data, and hence does not handle disk
hotplug/hotunplug events.

When the disk inventory changes, use the bus unit attention mechanism
to return a CHECK_CONDITION status with sense data of 0x06/0x3F/0x0E
(sense code REPORTED_LUNS_CHANGED).

Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>

v3 -> v4:
    - As suggested by Paolo Bonzini, use the bus unit attention mechanism
      instead of the device unit attention mechanism.

v2 -> v3:
    - Implement the suggestion from Paolo Bonzini <pbonzini@redhat.com>.

v1 -> v2:
    - Send the sense data for VIRTIO_SCSI_EVT_RESET_REMOVED event too.
---
 hw/scsi/scsi-bus.c     | 18 ++++++++++++++++++
 hw/scsi/virtio-scsi.c  |  2 ++
 include/hw/scsi/scsi.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4403717c4aaf..ceceafb2cdf3 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1616,6 +1616,24 @@ static int scsi_ua_precedence(SCSISense sense)
     return (sense.asc << 8) | sense.ascq;
 }
 
+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense)
+{
+    int prec1, prec2;
+    if (sense.key != UNIT_ATTENTION) {
+        return;
+    }
+
+    /*
+     * Override a pre-existing unit attention condition, except for a more
+     * important reset condition.
+     */
+    prec1 = scsi_ua_precedence(bus->unit_attention);
+    prec2 = scsi_ua_precedence(sense);
+    if (prec2 < prec1) {
+        bus->unit_attention = sense;
+    }
+}
+
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense)
 {
     int prec1, prec2;
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 41f2a5630173..cf2721aa46c0 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -956,6 +956,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_RESCAN);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
         virtio_scsi_release(s);
     }
 }
@@ -973,6 +974,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_REMOVED);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
         virtio_scsi_release(s);
     }
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 001103488c23..3b1b3d278ee8 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -186,6 +186,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
                                       BlockdevOnError rerror,
                                       BlockdevOnError werror,
                                       const char *serial, Error **errp);
+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense);
 void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
 void scsi_legacy_handle_cmdline(void);
 

