Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC96EB3E8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppydM-0001lp-Dc; Fri, 21 Apr 2023 17:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydE-0001lG-UQ; Fri, 21 Apr 2023 17:49:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydC-00051f-Ef; Fri, 21 Apr 2023 17:49:28 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LKGcmA013525; Fri, 21 Apr 2023 21:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=wj5uOERf6su2KgiWXTLsMv5WeTDi8ZbPAO/UJDQ6FQY=;
 b=SQlbPhVxXDHtWnjodPr8cEztQKI7UG0OpOTiDDkno7UkYeZr80VjLYQdUWR25CcN0xOv
 dzoFCYVua6PNrb11tNbnY9zAab32n9ZQXCQNjovoc5wJRTS9JGt1M4FLshdPCz3E+GgO
 t2nYsF0TG1s8souV86+oup9b3y7xJc6Cib/8FevQqzxFZvQF4+VWsZ+2pP2Z/dIQdOtF
 xW1Ig++jbfcPzY79mfhuXNdsiGxl/PvG6p2xddGOE8B+rkWUnDyXn9Ku9FcLjhSAhzHY
 YN4zJowTqs8YgpRBJp95mIJnbTMJJ4LD8BNnXmSef+LMG2PfFPq/oZmnzy+XnU5KmqhW fA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjh1x9ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:20 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33LLDWJL011198; Fri, 21 Apr 2023 21:49:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc9nwnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQRT9GWoIc8Mgya63OHY9u2cu7XQCGqLuPnHGdcqZh1Q/zQlp3+9HJ7zIrph1tg12xcevu+lJVreB8JqSEDu+8JC/DN85eXlDkFG3GtiWaEJFsRA3ElZaw/V+z0DxuQ1qBNYVIwJDV8QtMJerOzqfbiX3pcKCt9KhX6bnOdx9Xo1kwG51LqLOuUQ0DjjggDySxjMNdvSa4ZG9dvGGC4evAg5Vb4W1ZfAnU3YzCpG5lKff/KtsdUpaNkjMJkrAIrkTbSp3OOxNhgVxV2WK4xeOrPG865vW2YzdRPcdrzgsLfH5WTEMi6+rej8qK6+KnuI7ykyxllA1hPSsTeItk2B+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj5uOERf6su2KgiWXTLsMv5WeTDi8ZbPAO/UJDQ6FQY=;
 b=SWmt8REl8GqbG+FlhswpF7vbUTAm3XGkOBw2mT9cbjt3PqMsM3yDWFcSqGxkGlmnBNjAcfpIqPRCbshw9WjyOhcri3DLhMmJFBNIWf7GACqRw8KTisVFKdUY1EDGpUDU7Jyv0WiS3pUph52WN4o2P0XQRZ/w5QZPWQfMjOhRpAz0/FpR43Jlc/G9zi8ZwoWdSqUqNf8It49C08txkaPk6Hjv/XS5d5LpRj6MRdv6XE60Tz+fBgDcA+UFRs5u+RpcblcI+9OF/SqNbM8nOjTSAxuyBzvU9PeYxMHM2uHLfcCyZh5hpImBWPFtiwV76qVgge+9LoXI1GhJOut235Ke6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wj5uOERf6su2KgiWXTLsMv5WeTDi8ZbPAO/UJDQ6FQY=;
 b=l4S8D7IQTyupR9ZgXGxayjIoabWILkIxeEp219Xb5GjiW7LIYz+iKQgTb4ANwJIFp4UDV6YFiubBCLSIaTIEXYeeY2DfDTYt+a+LdNjlUCynfFBc0w7PgGpU31d6+dxcAnV8E8oX9pP+4C0aUGOJqFeTMpi48hEPK7pTnOY6hj4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH3PR10MB6857.namprd10.prod.outlook.com (2603:10b6:610:14a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:49:09 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Fri, 21 Apr 2023
 21:49:09 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, miguel.luis@oracle.com,
 eric.devolder@oracle.com
Subject: [PATCH v3 0/3] ACPI: i386: bump MADT to revision 5
Date: Fri, 21 Apr 2023 17:48:58 -0400
Message-Id: <20230421214901.2053-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 149199ce-8a41-41c9-3843-08db42b23c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyaJ+4gV887ew43xB24iw6L8E0x9JdVnPlOOVZB4aMbZ+8Dk4coKWOpgEYlYgIAiCdL/i8BNnod618G6MmHhq2COwJSbeWTmI2yAqwNlfRPoiif6DQWfzVBjaWAJOMjxpcyTu96f9q9TiDB7DXcPo6JHm8HDfNTwshZmN0xbLz4gDIypz1GCbVG0+Y2A4DrvBszTq5zCktg+xvtBrvMIkjG8Ho3m1KqR1RtABpgpvizkeHM5Sqd/giLPUKxgoR+ZffpuXNOa6uFQHb9qDmanVg42bBqTCfzEahchgYlSz4sTlEVP2ZE17VPHRCQENOTBIhuwVtlWZsh8LuIU9LZapBEP1Ip+fvyTMIA3YPgd15Hi35EObdAahHrJQUoeDRtlrSm3vx46LdGV/9UUDK+KM1y68RsoBIozI7l6OJGLqExBU8nSvDRgPQ3H9a8AM3xEkmAk2n7HAvtTp/nlaioGkNFJ5+981Rh3Y/wMpTEWX2+6kbSwW2VbHUnL2PQwdCg3WcmxuiEjsmmofNzr/ERrbjTTLGg8+h+KneNJckhmBNPwMDR39aWG6GoOaaJRczFe4+zZ7o3HQf1dOpwuxYOY6sxlU6XDqNTH7tY5C+o+G+8B6dc+7esdl3JMOX+vvk9j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36756003)(86362001)(478600001)(41300700001)(921005)(8676002)(38100700002)(5660300002)(8936002)(2906002)(30864003)(7416002)(4326008)(316002)(66476007)(66556008)(1076003)(6506007)(6512007)(83380400001)(66946007)(26005)(186003)(966005)(107886003)(6666004)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y42Cyq1HiWM9guhbe35ToUG5Rq2/WJzQCZq7zRfbWgVdMCd9G942CVSKbc75?=
 =?us-ascii?Q?rk2WKVOwNVKg5S4ACsMlMJ9Xj8peQD3KHxGRypuABYSMmktQx675BRrvLsHU?=
 =?us-ascii?Q?P0/gCGNf8EwdbgaJfvNvdfgZ222/B377BHbNWoPvDuwkmx79ytEUGl+ulVNf?=
 =?us-ascii?Q?HSnePPgAY/Jhb1H7cGf7CwZs8KtNGfPQGZoGasrECBRj0uI73dx3w8aMQIQD?=
 =?us-ascii?Q?rEMSq/BYfSHGNzaYDWLrF1+CTv9wYeob7JhmKf+usJ1Y+OV9bfzckHkkErIv?=
 =?us-ascii?Q?LAHovtcLM3F1YcifcJJuWJZfOGyb6FVvGjm3aF3IjyA56iiKM9at45Xd7tme?=
 =?us-ascii?Q?11Iop3ehKnKF1vVXjfWZHidAOa3/BVom2c8m/xBvwHpYHaW0watLKWJq3reD?=
 =?us-ascii?Q?dLUQ/DTnh5SHsj4AGVM8BeJ+c+STNk2OKn3cHjrsgvFJi3jq2+YN69KXFWcS?=
 =?us-ascii?Q?YrW7aEtnov+zk4pIrdOX5E5xIeEdvafH3kZmCzGgOAuTxzZpFN8wg0bMKcrf?=
 =?us-ascii?Q?vgm+KlPg3UdBkWnhYUaILDyY4VtIZxZB6PnlEUkmEsdRes8JvYwFlvw7Gvln?=
 =?us-ascii?Q?6hFEOJHcqyXdGe8e8JpAlbqom1uNl0WrQKkFNNDbGG1bqhI7NK+a3XBuTT/5?=
 =?us-ascii?Q?Iw9Xj269aMmhtXxayS4YTJkiHyvSNhJ+T283GB+GZgZjmxVgoom/f3mvV+RB?=
 =?us-ascii?Q?KTSsV0lFgEzljra2UdsGzX7+41pv4Vr9HTPdqmAXtKt2/2xZT+4OMDLVg2OB?=
 =?us-ascii?Q?0HFiFO+oV8yV6AynC4APWBs22g6qvI9dlvDx1ZUcLXZ2lbWW2fjWH9TJoU1E?=
 =?us-ascii?Q?vB31NpUQqSI8O/l7USS0Y8eJd0Ujr4O+7u6c/ISGXojn+cqp60fewI96fQDU?=
 =?us-ascii?Q?2DBwHcsbca+lo9OIZY4tEDAgRm+YYl2L2GjpNosuIQ7bhFCuhlaLvo9hl2yS?=
 =?us-ascii?Q?AUpJKWKjkOJq6P3cD1plDr9FzkoWrbMGTgeLhsxpuyUvDU5vkRfgyaZf+4ik?=
 =?us-ascii?Q?XYOX91Bz/21rz7vpzlf9UyJWQlALISMpnBLWDgucFPSt6eS//E0s2v1G7+KU?=
 =?us-ascii?Q?2gMg9SJnmTopm6BZYboeZP8OgVm3hI4F6es5O/3gqv5tPN39Q0qE0ZIZQBVl?=
 =?us-ascii?Q?5m8PBtaj4+vXzKEgapEgnZpVvIcEQV3lRm+3c65Sj+HnWYxqOoV82yUWB4Yt?=
 =?us-ascii?Q?1RXhKVDpuqoGrznwA5tdJojBG5lsFBYDgJcgevTybsZAejPPKIUOm70eF0ta?=
 =?us-ascii?Q?S4+MnHcSYKywVHUIzWlToWRJ48nt2BJ247Kn+NFa3lN16xFqSiZIk5piGl7/?=
 =?us-ascii?Q?E3u6NtoHHB5LD7TRv7XNj8RehWtgB52L0OApxWKOiW6YmTziwka04kZjRQE2?=
 =?us-ascii?Q?+lNHaAq5YeG1VpKdGlWMaumrPJw4eAc8QBZMU8zy82bhBW3mw6sUNUhLQZX5?=
 =?us-ascii?Q?o59xswyZv3p//alNkV31c7pzzeNMCWJTP/s+c5Rv8LGE/s1caL+YEYqdbo4V?=
 =?us-ascii?Q?aPoCkU6ulD/tSguagTS7DPD8uSkOqGSWdBKuIHi+oVK/Wnxwr65wKB0hmUnK?=
 =?us-ascii?Q?eAJ2MscDUgqTI7EPhVWtZgl6fZs+V9ny6MAk2bty7y+mao4+g/DnYWMZj32X?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aQ0n6NE10n7GtatpJQPkGwUhpvAXDr+2LzoARnUyB8s4QzBUNE1PnmjJWmTVm0dOYlzW9FPsfK+U3ImupSjH32A+MbTEg9z+JkUIxdHbGmaEROy5h+u19SPZTsRwatPACpnFfTl27AleO+oa//QV2UyoiS3S7SjO/aFezbec4F5hxhZDJxT7mv+6NMZf5z11rb7MvXoeLEwCFK28crjLrHyqn4d0LozWc8Er45GHkGAbSWaM7+Sb8t/jhztQMzD9v9zGiHs3PUhMH+ILJ/KFscfVjuZJ1XeSWTK4lJC635JdavTb7trug0JahyZHqq7tAJ0OLfvwnrt49+N6sJfGc2sX5J9MNsIpQ4CtqUOtx4WFGu6SyBHK6kCI5Fnyyl+wcMjRnt+CxlUY79x4AtZuQho9YI50u9XLGBHIYy3St3ifI1dX9g93wEijfgqiYu8h5Wrf9dq8J2emfgapvLLvMEPs1ecDddK8LSTkh5z1Fcaxyr1dLYGpdB0DFB2KHM6a+Dv0vJisKHo9scmcqpkoh0UHHl6KkPf3vqXCGQ8G+Y+RIZAGon5ed4xXDmJEqPTUvVRbLBCBW8eLzpj7u2Ka2VO4DHvdS9e7pfdX/WjYx5wKL+IrCWnBNHHhRESrK1IpCsHFQcObhw6O7QpGjQXJ/JvtGuyi0O/09nfMGalDfEWcqjVmLgYTtEkWLOv4MpmVmcXIh2KPXLRpeyFb8HINhNpaAqkb0XOAP6jcsBGKlmMXTS5oPjpkc7ZumN9G0W3CcWLyQV7y4LRYz/eki/t+Le1YBCCp8lzxK/rqqLMlcVLEdlkS1Qvd1iwozViVFeFt8+bFhWZzVK5JQbGCO+7LmJ8OJPcTE2z0FO/zL/DBpsNrrzjofA04CvBV++QG+kKY2jzVjG4Vtr7bHtie39dc+w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149199ce-8a41-41c9-3843-08db42b23c71
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:49:09.2433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4+dlETtTqL3m41GkUxzAp7Lgq7/qzO8EwOK7oAuTubtbGgX1n7CFT2Ch/fIEBD5//Wq4kOsyMTwJUTsyZcLc3e8o02kLylx+lGbLHsJVWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210190
X-Proofpoint-GUID: VmacHWHlnWMLhymN1WcYyXWp5jARKA8J
X-Proofpoint-ORIG-GUID: VmacHWHlnWMLhymN1WcYyXWp5jARKA8J
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following Linux kernel change broke CPU hotplug for MADT revision
less than 5.

 e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")

Discussion on this topic can be located here:

 https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t

which resulted in the following fixes Linux in 6.3-rc5:

 a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
 fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")

However, as part of the investigation into resolving this breakage, I
learned that i386 QEMU reports revision 1, while technically it
generates revision 3. Aarch64 generates and reports revision 4.

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
6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
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

For i386, the ARM SPE is not applicable.

For the i386 Local APIC flag Online Capable, the spec has certain rules
about this value. And in particuar setting this value now explicitly
indicates a hotpluggable CPU.

So this patch makes the needed changes to move i386 MADT to
revision 5.

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

In terms of testing older operating systems, I did:

- Windows Server 2008.
 By opening Device Manager -> Processors, and watching/counting
 the listed CPUs before and after hot un/plug operations.
 When hot plugging a CPU, the new processor shows in the list;
 one more processor is available after the hotplug.
 When hot unplugging a CPU, Windows refuses, with the message:

  The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
  removable and cannot be ejected or unplugged. 

 This is expected as hot unplug did not work in Windows 2008.

- RHEL 6.9
 Kernel 2.6.32-696.el6.x86_64
 Build Feb 21 2017 
 From dmesg:
 ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
 SMP: Allowing 16 CPUs, 8 hotplug CPUs

 # cat /sys/devices/system/cpu/online
 0-7

 (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0

 CPU 8 got hotplugged
 Booting Node 0 Processor 8 APIC 0x8
 kvm-clock: cpu 8, msr 2830ed00
 Will online and init hotplugged CPU: 8
 microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
 platform microcode: firmware: requesting intel-ucode/06-56-03

 # cat /sys/devices/system/cpu/online
 0-8

 (QEMU) device_del id=cpu8

 Broke affinity for irq 24
 CPU 8 is now offline

 # cat /sys/devices/system/cpu/online
 0-7

 RHEL 6.9
 kernel 2.6.32-696.el6.x86_64
 build Feb 21 2017 

Both of the above 'legacy' operating systems behaved as expected.

Regards,
Eric

---
v3: 21apr2023
 - Dropped ARM patch as there is no compelling need to move to
   MADT revision 5, per Michael Tsirkin.
 - Recoded the flags to be simpler, per Michael, Ani Sinha and
   Miguel Luis.
 - Regenerated the binary tables, as per bios-tables-test.c
   instructions.

v2: 18apr2023
 https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02576.html
 - Code formatting changes per Igor Mammedov
 - Included the steps in bios-tables-test.

v1: 28mar2023
 https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
 - Initial series for ARM and i386 MADT revision bump to 5.
Eric DeVolder (3):
  ACPI: bios-tables-test.c step 2 (allowed-diff entries)
  hw/acpi: i386: bump MADT to revision 5
  ACPI: bios-tables-test.c step 5 (updated expected table binaries)

 hw/i386/acpi-common.c                         |   4 ++--
 tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
 tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
 tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
 15 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.31.1


