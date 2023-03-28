Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC06CC74C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:00:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBji-0004iY-Uw; Tue, 28 Mar 2023 11:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjf-0004gv-Hi; Tue, 28 Mar 2023 11:59:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjc-0003KG-Tm; Tue, 28 Mar 2023 11:59:47 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SFxcxq006629; Tue, 28 Mar 2023 15:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=w5hFUttDxdodWsdZPfp4eI9GUaE/uGr5l5DC/zSPRSo=;
 b=A8P5XGnc2UgjwTdk4A8x/aGfslsoqpu3NLKgn9miaE/XqsjLGlJrjlTCiA9K6TbQG29U
 ZmgrsUFOYtKy+DvOng5nj55DX2YGwXzdqMnKtE02fa9JcHz+DI4eMUs8ESyEBuzBR0eg
 h613E+PFPAx07EW2wPDLS67rWZfaKSL/78cgJP6TdAy7NDLLM+fGjDj9CtppFq9reumr
 z5nNsKnFzS9fw8FdAHc25dPK0FfwzIfq7PRlvCac0cpAng/itImiLLdQ9j35nAnRL/V7
 mL70TVQ0KDfliy+fu+xs0QugLTo2K5DraZqke5zDGoARHe3ulN775Bn+7+yP2v2qPyDc UQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm3byg00r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:38 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32SEjKla032875; Tue, 28 Mar 2023 15:59:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdecap5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb/8OFC1ABufS3phlzHe6aPcblhKHeVmZeqVg0xhuOXoRMAovj+GFCsPX5SC7iwkdgyN0Bm2xezHiYxm1BWp8sMzGLRgzu8Lvul7v6/PpwIz797e1hz0r4C7OKpPRxp+BfX4TmSskD1yavWlmVySw9CAqPJyTctpqT9xd5mYM3Y0dFynYI7kc6Q6FARcw5INhBQmzDLbLsScgjhfefkIQRF+WGWjBpKbxwZhGNVq028oYIfNAl/5J9b+J6kZD19FrOIqIZPDCMVUWT9vUoqJlGKZ+DCtR1vXTNv/BZQnIrw6oJprFpP8Sg9mopKW0hZMbwJ4OAVudLtKb1WuO7WdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5hFUttDxdodWsdZPfp4eI9GUaE/uGr5l5DC/zSPRSo=;
 b=hoFI6tSqjVQ5k2BPU43wwypKphXdpfbclm3TL3rGDRBtVvVSVmLVroQ0d0Td48VTv1u7kOSKeUcFg6aTkvbia8W7OUZZ0xH2R7g0nnP6vvDJxIIZdUBp5BrjieYPebtgsp5vIicBI3+ZYUhECC1mkWXVX4HEhZGeI63A8bGw0gq8d0PlkSvjhOu+Sml3v1ceyrJOHeAXotkKSehIdbwallrI/6SOZKwouv7zDOI3n7sx6oEIemJvasm1ZSx43kBF/v3F31Ykt0r+Ot5rSwbXyyxp8kwJZywG1QFA1gWOrzuwVRgzdHIO0zua4lw+mp6raGsvhn7ZiA/0DB6VV1VL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5hFUttDxdodWsdZPfp4eI9GUaE/uGr5l5DC/zSPRSo=;
 b=JnvZb7+6ekdFpfXyZWHSyyQbi12x7s4zNJvIcZdkez8AnaHW6GC9IEQ8GgDg7R05LAqiYyu3iv8ssRm9fLP0fjxXlHY5/nYxFmUei3NcvTKAkKNVEhdwzAZpUKAIcQ74QTSQC4iaqbIxvU3Y/dfVBPbdrnsA/zzgzrQeN7rNYLQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB4985.namprd10.prod.outlook.com (2603:10b6:610:de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:59:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:59:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Date: Tue, 28 Mar 2023 11:59:24 -0400
Message-Id: <20230328155926.2277-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0083.namprd11.prod.outlook.com
 (2603:10b6:806:d2::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a1e143-cbc9-4d57-a82e-08db2fa56c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZKL7VGZzw0xeM88AqDRpRVxpn2aOXBvBSTmJeVJs/4vkENZs2oPnNJrgaT8IK7Fcj+a5DvcZsi1Y8OZFLPcFJBlZstpOpXf6oPacbjs91A+1q4UxQiqb6Ia6lVXCE7G1uUHkCAgpxcvRFE0AC0CZbgFJBZhZuFMUSsz3WLV13EBrGZW0b5a+Kmvxqx7Frgezc5OKpY03lctbNEcMFeORwTL8Hqm6ecKpsf8UhPW7AuNS7Q171Le0ADr5jCy2GMBHTn4fCI9VdFMRRTjXQh9jmHpaxL79nrwmvp46I3uoIQzfiUH2iIWHWFW5r08SrNz4MGfRDCBQgLQb3dpOPZZRx+lZ1E6+GmN8d3ha55IG74NOXo62qRpwwW+v9A8Q9uon62itjXfP2vOYGaXffuGGw/UUSDiYoDIaIbqXMH4etjrXspaje5APaRoiQ+qeK7+NZmJ6x2U4Qwlghg+SCEpd3UbBQHbhxAomtAWH9H0trwbVaks4oReKaryQvB6gT9QoAmTtZIzBCbqivWETaMManR2RPg61ReCXA8aewGoiSB9IcRU1iJ1Yw71airSsLvvWyjeQXy0f170vLoeU7UdvUq8YbDrHiBgv6vuEiWKrRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(6486002)(2616005)(478600001)(6666004)(107886003)(8936002)(1076003)(6512007)(6506007)(26005)(316002)(66476007)(66946007)(8676002)(66556008)(186003)(4326008)(41300700001)(921005)(7416002)(2906002)(36756003)(5660300002)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSOLApm/zNgMNBmV6J0E3b/7Syt1ZAif1U2+r7ki2xuCpzSlszBBiVc+S9x3?=
 =?us-ascii?Q?huwJ2mub2TDudsLsi3274nY/3547LCB11GE+XDdtYAOLXWVWjlXAU7H1yVC/?=
 =?us-ascii?Q?DDuGn3ptZHR/DU3kJdRaVCaGTYTLgSOpscxToRdJWIH+1VCptstdgai59+01?=
 =?us-ascii?Q?8bKJRVSBsBQqTJ5n4aqZKvVe+J0o3xIp8zmZbo9PiS/tZDWYhxJ4RaaaENb+?=
 =?us-ascii?Q?Qy6+pwNE5rlaHb8SJ4qpajn5wZPk/3RFzmYb++5bpQN/Mv5oWeG+TCb0Vpb7?=
 =?us-ascii?Q?wc/cjLoqrYWVeY31ushO5kZyonc02gDxGSP2WZ2uVwGWkUsQQ7uJg9Q7obFP?=
 =?us-ascii?Q?r7zi8s19bnhiCGg1f5U4UXuQHMRCbAUAQb5FysoU7+TLiStkL10u+zdlDpIu?=
 =?us-ascii?Q?4GLpy62bhzCLjMt2lfV904Khq3EpG6l6Kz5ocJgkhAHlFqu0PLhEwUtDpVI2?=
 =?us-ascii?Q?u4XMexLXSK4IKEXvvFBZ9zLk0dye3OnoBZpXvE7gvkqq+MVnmoP3wm+ALPVM?=
 =?us-ascii?Q?h4yvN8oJEFLf3/pVpeO6gXB7WBKc7yNb0cn1XoAY24YAbrKeGEdLSfDecIpN?=
 =?us-ascii?Q?ubLtCyj6vjr1F/c52H1w43dhjM6TTfHj0MQDfFFXfrCUj1f+IL2kb5hiDagI?=
 =?us-ascii?Q?+0EWyp3r7hl1o1xOQBzwXNEnD0JI462NP/zA9aioLizTUhwRGUcJSQd+gdV/?=
 =?us-ascii?Q?bL9MTteOwFESefBvN7pE5stWoCrZ0RXTr77qjWZWtu8fQxeUOY17TPNCrQjk?=
 =?us-ascii?Q?GHB6cpBFWRir/Idi/h8vxKYcyiEPj1oFsclI4p54Ee1IWsKcTvkTJDSrDM/N?=
 =?us-ascii?Q?yuKhQK++4wdZsHlJRCIIRqz0It49i3dtoPqiGP7fE4DoiheBky5hVfLqkwhw?=
 =?us-ascii?Q?UY+GmpszoiCag4qBFCM6fwPOssK/5WmhqeG+M+kvHIgk688+hVzFCS0JuGYO?=
 =?us-ascii?Q?i9s77lcxQ7Ypih/b8OGFwYbq+Zb34xX3HDM5A6n2A3NmbStWWVHnqoHVPi+V?=
 =?us-ascii?Q?nEbwbQj0VPiM6pzVHTpMFqSfuZNjHPpZubICSKtDw4fMmG+6xtTX8zdCDKw7?=
 =?us-ascii?Q?Gx4OM/h1y4Ztp43WDccaWg5JfPtYa12aaQEnAw6JDHZ118CT22nxsC0d778G?=
 =?us-ascii?Q?C2jf1odhGJ3tUySOSfYVVbg4eqTWOOy7UdW5sKeARsMtRsYoiLt+dVB3KwP1?=
 =?us-ascii?Q?8iM232sJeesCsHKlzTeyiyPxXxpQqvRkehOxxNvHcca8yyfhN7jPKDyfIFsZ?=
 =?us-ascii?Q?bRE5cKAAGxnhi0RtRLuq2IysIMrJ2pNjMtPEIJX5E0cYmjxLNnwAd9YqQB0L?=
 =?us-ascii?Q?cfpYWGFtIh8r+/BotXIBO4yb3GkAIBI5vAk8fU4FeO5+SJtAtgxeO6HyybAu?=
 =?us-ascii?Q?pA2cS5jFQDN374ZMn1YO4qbUMhBzUv63exD16nk7OOqJHQtSqM8nH3Ny+CIH?=
 =?us-ascii?Q?Gsdqnwy0iCBtTMUbFp8dJ271j8bvVqgs+zZ9Q65eTNebBmPt2Ru46Qyv/Sv5?=
 =?us-ascii?Q?ZJNVRYlpomL9BRnGKB0u7/Uz17zdvSctncT2iMCt3yWeNCQ4OqaHSVZOk5H2?=
 =?us-ascii?Q?vpNyx//YU7d9Y9sieL/LVRkvjqoZsORmt1oTGRISqshXTpaoWf87ErlBVC9p?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /Xgim4d37rbWMWmWVfpLj1cIplx00JiLMl7ICXxxKAgDOBqPKGX1+Qfjt+qZkXmxaQcVm12cmQYsI5nPgHw3mvCsiufpPQX3TNR4ef8TUK+ANS1DemKVe9ZdYbVFrC2vLCTqaXukza5Pbw2rAXIJZEqLG5nNObb6JeJ/+ykdbkPrpJGE0KPW8FLDpNcGJBlDzJfzagItyzTjLaIImgDqbEUsfCuSM558cNTTGVq3iOD8W3UN+hVNUSuMi7rS49YiSiqNzhSAiCe09MU890pTilSGencAlyNuWfjLiefPr1pfwD2gq3S/UlAnJzbG3WzKepcaTIzgpKeg0Nl8TRjH7TuMoVKdUFq7z+s6GDBKwEeEPtLb7DHk8AMUkWubz9flIZFNcCwexhL4yf18OrzWf6PPele5DnMnaXynTSKFkXE8na47OzndpUJMC/FwmR+MsjXSBE6HQvJPJSDz5pm2nmRu7oyxoSGZ6K01E55OV3NIowG2du6NWuVm5g70yPilizqCv06EshM3DY8uUoX5zw2FEKR/Y9vjwLfggmzCI7ZC4+CPwIRrRncFMb7ibGQVTr5nL0jyVSFfRSuDCbDpB1Ay9xmF4yjMFOOWSerNTb5En4dZIiS1z7G5fiWCj79W4cz8clv5/ZNBBLsi4rbLoGpAAr+kwlWasBEa1toYE3fkV5ghhOm9fB0JL7s00sqYmpoNKnGZ2wDJKCRr2wAuHkW1IiQvagn1VSwTF9xGV6VQE3WZAYeLeM3qo2coInnV3YQtBIYcX92DkxS5XAk6xr5qgVaJ1JfHSwTDK1tC0t5gUSzU0g2A5sxpXXV6ZhFiKda21LZ8y9wjuKrIHjkJb/45aqtOYJp4bcAz3oixWJFe+fl+KrzKQV6entQxyxBoGF0TLUM9oS7Up8HbNxgqHw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a1e143-cbc9-4d57-a82e-08db2fa56c6a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:59:34.2830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3siHt2ey/dhU8koHUf6leCWk3e6xT0dVQWYv3+vfrB8+tSD2LgJexrZkHTWRrZ86ZW9WwkPvfI1oC7AFfIF3TtiMl7h9bl2uNs86tDKDDxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280125
X-Proofpoint-GUID: wkc8zl-oHZtWzDd4k9iswfI7caMysaEm
X-Proofpoint-ORIG-GUID: wkc8zl-oHZtWzDd4k9iswfI7caMysaEm
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following Linux kernel change broke CPU hotplug for MADT revision
less than 5.

 commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")

As part of the investigation into resolving this breakage, I learned
that i386 QEMU reports revision 1, while technically it is at revision 3.
(Arm QEMU reports revision 4, and that is valid/correct.)

ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
flag that the above Linux patch utilizes to denote hot pluggable CPUs.

So in order to bump MADT to the current revision of 5, need to
validate that all MADT table changes between 1 and 5 are present
in QEMU.

Below is a table summarizing the changes to the MADT. This information
gleamed from the ACPI specs on uefi.org.

ACPI    MADT    What
Version Version
1.0             MADT not present
2.0     1       Section 5.2.10.4
3.0     2       Section 5.2.11.4
                 5.2.11.13 Local SAPIC Structure added two new fields:
                  ACPI Processor UID Value
                  ACPI Processor UID String
                 5.2.10.14 Platform Interrupt Sources Structure:
                  Reserved changed to Platform Interrupt Sources Flags
3.0b    2       Section 5.2.11.4
                 Added a section describing guidelines for the ordering of
                 processors in the MADT to support proper boot processor
                 and multi-threaded logical processor operation.
4.0     3       Section 5.2.12
                 Adds Processor Local x2APIC structure type 9
                 Adds Local x2APIC NMI structure type 0xA
5.0     3       Section 5.2.12
6.0     3       Section 5.2.12
6.0a    4       Section 5.2.12
                 Adds ARM GIC structure types 0xB-0xF
6.2a    45      Section 5.2.12   <--- yep it says version 45!
6.2b    5       Section 5.2.12
                 GIC ITS last Reserved offset changed to 16 from 20 (typo)
6.3     5       Section 5.2.12
                 Adds Local APIC Flags Online Capable!
                 Adds GICC SPE Overflow Interrupt field
6.4     5       Section 5.2.12
                 Adds Multiprocessor Wakeup Structure type 0x10
                 (change notes says structure previously misplaced?)
6.5     5       Section 5.2.12

For the MADT revision change 1 -> 2, the spec has a change to the
SAPIC structure. In general, QEMU does not generate/support SAPIC.
So the QEMU i386 MADT revision can safely be moved to 2.

For the MADT revision change 2 -> 3, the spec adds Local x2APIC
structures. QEMU has long supported x2apic ACPI structures. A simple
search of x2apic within QEMU source and hw/i386/acpi-common.c
specifically reveals this. So the QEMU i386 MADT revision can safely
be moved to 3.

For the MADT revision change 3 -> 4, the spec adds support for the ARM
GIC structures. QEMU ARM does in fact generate and report revision 4.
As these will not be used by i386 QEMU, so then the QEMU i386 MADT
revision can safely be moved to 4 as well.

Now for the MADT revision change 4 -> 5, the spec adds the Online
Capable flag to the Local APIC structure, and the ARM GICC SPE
Overflow Interrupt field.

For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
Overflow is not supported, it should be zero.

For the i386 Local APIC flag Online Capable, the spec has certain rules
about this value. And in particuar setting this value now explicitly
indicates a hotpluggable CPU.

So this patch makes the needed changes to move both ARM and i386 MADT
to revision 5. These are not complicated, thankfully.

Without these changes, the information below shows "how" CPU hotplug
breaks with the current upstream Linux kernel 6.3.  For example, a Linux
guest started with:

 qemu-system-x86_64 -smp 30,maxcpus=32 ...

and then attempting to hotplug a CPU:

  (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0

fails with the following:

  APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
  ACPI: Unable to map lapic to logical cpu number
  acpi LNXCPU:1e: Enumeration failure

  # dmesg | grep smpboot
  smpboot: Allowing 30 CPUs, 0 hotplug CPUs
  smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
  smpboot: Max logical packages: 1
  smpboot: Total of 30 processors activated (125708.76 BogoMIPS)

  # iasl -d /sys/firmware/tables/acpi/APIC
  [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
  [004h 0004   4]                 Table Length : 00000170
  [008h 0008   1]                     Revision : 01          <=====
  [009h 0009   1]                     Checksum : 9C
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  ...

  [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
  [115h 0277   1]                       Length : 08
  [116h 0278   1]                 Processor ID : 1D
  [117h 0279   1]                Local Apic ID : 1D
  [118h 0280   4]        Flags (decoded below) : 00000001
                             Processor Enabled : 1          <=====

  [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
  [11Dh 0285   1]                       Length : 08
  [11Eh 0286   1]                 Processor ID : 1E
  [11Fh 0287   1]                Local Apic ID : 1E
  [120h 0288   4]        Flags (decoded below) : 00000000
                             Processor Enabled : 0          <=====

  [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
  [125h 0293   1]                       Length : 08
  [126h 0294   1]                 Processor ID : 1F
  [127h 0295   1]                Local Apic ID : 1F
  [128h 0296   4]        Flags (decoded below) : 00000000
                             Processor Enabled : 0          <=====

The (latest upstream) Linux kernel sees 30 Enabled processors, and
does not consider processors 31 and 32 to be hotpluggable.

With this patch series applied, by bumping MADT to revision 5, the
latest upstream Linux kernel correctly identifies 30 CPUs plus 2
hotpluggable CPUS.

  CPU30 has been hot-added
  smpboot: Booting Node 0 Processor 30 APIC 0x1e
  Will online and init hotplugged CPU: 30

  # dmesg | grep smpboot
  smpboot: Allowing 32 CPUs, 2 hotplug CPUs
  smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
  smpboot: Max logical packages: 2
  smpboot: Total of 30 processors activated (125708.76 BogoMIPS)

  # iasl -d /sys/firmware/tables/acpi/APIC
  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
  [004h 0004 004h]                Table Length : 00000170
  [008h 0008 001h]                    Revision : 05          <=====
  [009h 0009 001h]                    Checksum : 94
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  ...

  [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
  [115h 0277 001h]                      Length : 08
  [116h 0278 001h]                Processor ID : 1D
  [117h 0279 001h]               Local Apic ID : 1D
  [118h 0280 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1          <=====
                        Runtime Online Capable : 0          <=====

  [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
  [11Dh 0285 001h]                      Length : 08
  [11Eh 0286 001h]                Processor ID : 1E
  [11Fh 0287 001h]               Local Apic ID : 1E
  [120h 0288 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0          <=====
                        Runtime Online Capable : 1          <=====

  [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
  [125h 0293 001h]                      Length : 08
  [126h 0294 001h]                Processor ID : 1F
  [127h 0295 001h]               Local Apic ID : 1F
  [128h 0296 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0          <=====
                        Runtime Online Capable : 1          <=====

Regards,
Eric


Eric DeVolder (2):
  hw/acpi: arm: bump MADT to revision 5
  hw/acpi: i386: bump MADT to revision 5

 hw/arm/virt-acpi-build.c |  6 ++++--
 hw/i386/acpi-common.c    | 13 ++++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.31.1


