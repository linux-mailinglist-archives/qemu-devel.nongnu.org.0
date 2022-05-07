Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1651E39C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:36:08 +0200 (CEST)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnAIg-0006hz-Mk
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABW-0004uT-6Z
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABT-0002TV-H5
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:41 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2471v800024483;
 Sat, 7 May 2022 02:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ViGKnM16jB75iNXNHpW5zLKmY3nCd4zOoNAEzhPK6wE=;
 b=Q4TLxP62L4tXd5VGmG7c1KIHJfckaNpqGMLEjzBwLGgqGXQnPoqubBmLyZFqnfGaAVEN
 x2IT0Ms2ra8Dls4YTqhis0WZzwXgfblb40nfkPcvGHAJml2rpfzyg/CJvaEt1AXozv6Q
 GBU7xjV8f1MjjYKPo9ULHSuPMsEaVaJmJiBH3tcvd/HTzBfm0guT5Bowq+SLKZ8nDECf
 ZSKVqUjwqoFYrB/8XBNQ6QSzMrjuDjXZ+hgD1rTsL4l9HSvFWyZRcOSCNo4M2WzwH+nY
 NskLFr2QnFeoocJVFncxAywBr8te1LkdbonO0ohL1yYfgyH9pquX1jgE607s3gSak58i +A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfj280pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:36 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BQcj024291; Sat, 7 May 2022 02:28:35 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf700tpy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8QilnSLKl+U3ck/4HZSNQi/MX+CCpmZhjhHtWFyE/8J/kzvxi977j6OoVBKrJizpp8gjJ1j1W4AxqnlxyFG5sfO/x3OXr6r3NcCfcwW7jQnAML/yI2XciQWg/ixmb2WVmTqh/PTgFsX7I1vuQvHxYafkKv2jvZm3758qgZTkiqlhA5hvWUyb6UEAr7ds1pOB3/AlEbjVnBLAtcaT3kYv2qaXnktR0IzKZVInGhjZJiWkZLCl4zUfHk2A1l3ylwqBi8GYH6b+T4X3yrc7tpMuhYS+b00HyFesNpKfMo3X0QZfOZZZiqqixBr2Z4x+u3hqUccc04yJ6Irc+2RMAXwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViGKnM16jB75iNXNHpW5zLKmY3nCd4zOoNAEzhPK6wE=;
 b=C8RWe8m/jM3o0L1dScRwjt0VAwQWAL9L27Rn6EvrP+fSPDhsadlQV3Ttdr+TMFePFzLzmWADruJZBqPH9hJ6zgW7DBzCLjEv4vOVSbEFcHLQbXpHWC6mffy1LDJ/f2cnP0cO2erLRBOVVT37hQBDJUVj9J5Zjah9LDzcUM8pbDefGQzqlDPMqoRmf0Lks8hFk0ZiY89bdxIYKc52MqXjbcct5RQf7JNRoT2f5a1lKQzaU0t869mDyFxRS/CDJ46odB5xtk/yxMAaCrY3s0irj93IISRiz5AAQATGID15jRPt2zY5f92ubV/R6Sgtqj5edHkSY5ra5qOTugxYCu2JpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViGKnM16jB75iNXNHpW5zLKmY3nCd4zOoNAEzhPK6wE=;
 b=OEIsWXkapeaAGmF2dqrsbGFsY63h9vZBpxh8s8u44xUln0e2C9d+uerFT6j25s9xjBzpL0+La3Epj1/HMQnLX+PIBwM19YgoYnfrfYWkm3rGU5q9Q7BjhAocBGxCsnSAeDVhFg1yYzO/GOzTPpEqr+Zk9fmOL9yBFMIeW+mlSlk=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:33 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:33 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 5/7] vhost-vdpa: backend feature should set only once
Date: Fri,  6 May 2022 19:28:16 -0700
Message-Id: <1651890498-24478-6-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84b09ae7-9cbb-4999-e5ca-08da2fd1485f
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370FFC6EE2728E9FE884631B1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2wtU9D0Msfzw925pDGpH+Yn6WEbbzLQN8PA2QjBvlj9sfZr7jm3efV5oGH9EwWV4QphGVn5/Krc6vWomr0YloV8nTlNH8gMhiiy/o+zbTvGtZJcxWg1KxhYJt7HvO6PrUVYmpiI2bUMXnKtBR95POm7bvwVY2PlyL1Rtko399dZYorteqxenYpMwAygLgVr0TnZfKtHo9ii9ALtA93jblLWrN84lgdrfVu2mFyYEnWxUizjtlKlu78FjBsCcnwvNpQdTEJdeZAcgnoKS1OEKVspoTqEiR9y/CkyRh9wRr86zDoB6jJh8XnQyCXJbbgczrXE7RjJ5qJXb4dV36DGiEmM2csZnmRw1xEzal5y+V4wD9v9M64u5tAaKvyh0Kx8JSFFdyjNwBQ+xjYOkcszN2XdfpZ/D8tSxRYfBBNOfBHMq0UO7DMV21qqNsVroG6S/PaSR2v6HWusv/eikjF1Njb/ZUQuvbmJDlknHpdNc16O9UmhVAelVDQS09LNLD6CE1YFl7R1Klg78dw5hTkKRO1KapKLTZIC/3gEw7jTTRnCWK5LHYDCfcVmiAL2T6FotbW2l1ABXKgAZ0Z+agidOZS206UgXUB6zGUxoQhX4jlEKMLSDTWxJpBEyEzb3xD+4Jx7SEuZqGrn0sr3eFF1pnHe510bS22fgYaE68F5DoUG0w691M4pjQ61M7EA7uj+/AnfDYJoHICGN5IG8dES5Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhJK3hSZGswYkhqbHNmUzJTQjFGN3d0MHpyeGVIOXRQeENRTWg0UmhIanFv?=
 =?utf-8?B?UnRPeFhPc1lxd2pxVkR4cTdOWDlFUjE4NldXK3NpcWNmVW1RM2ZDRzBxZ1Z3?=
 =?utf-8?B?bUhoRFhDck9sdXp4UFh0ZWNhNjhaNzhrMWRtWUptRDR3Z3ZtV0ZXNUZ5TDdK?=
 =?utf-8?B?eml6OUZMNFMyamZjaVFBSDNnSEptY2djaTkwMUc1andXK0Roa1JFZUlFcWVY?=
 =?utf-8?B?bW50eUREcWpVQURjeEhCR2FmTEhsRGZWZHVmOSt3VWVwdFZwT3ZDVFhTcHVm?=
 =?utf-8?B?SXNnM3JyQjlJalU4ME0ySkNGTEdiNGR6M0ZaMkQvdXBpU2lVK1VzQmdhUGl5?=
 =?utf-8?B?RWtjWFhVNG0yb0xDU1oyZjNPQW5EWTFienhBTVBaVG55K3BWTmFWOXJmNEFv?=
 =?utf-8?B?ZlY0R2poY3dLZnZsZzBvNTFadkloay9ZRVVCMDNlRGJKVmkrZnkvcVdxZzdu?=
 =?utf-8?B?SmJrTEg2VGxwaDl5UWt4TTdiZHFMLzJHL21JM3BORkNEUmlvM2FIUlJ1SExU?=
 =?utf-8?B?em52VVlmOWlXNkxnTG1JOHV0eVZwMkVnY0xqQnUvY2E5MHUzVlAyM3JBK0dY?=
 =?utf-8?B?Y3JkWUhOYTNOVjJSNkVVbDRyZGRUVkRmdWd2YU1XbjI4M096Z0lwRzJwQkxU?=
 =?utf-8?B?cUtkVFhJN1U3ekFaQnFWdXk0N0RURytFZktsQk8za3ovWWJ2ZkMzSlpIMkJ6?=
 =?utf-8?B?UGtHSXNhMTh2bEtoUnJoLzRLai9CY29tTFhwZ3NabXgyQTJsWjN5WnduTjVG?=
 =?utf-8?B?TFNCOUVvSHJGWnMwSUxmZ1dSVDQxWEllOHIrandBZnBSa1NWSlJWZ3REdXBj?=
 =?utf-8?B?NFRFdHVQQzF0d1MyTitkbnVRbmVvR3lheWJZNTc0YUlmc0NOK3UwUHduS0lR?=
 =?utf-8?B?RHJUKzFKblZmL2xHcFV2VWhLLzBnOXlnVWh1WjJpbGQxeGV1Z0F1RVhMeVpw?=
 =?utf-8?B?NlNqRjdVVS9adDR0OVRjZ01sRlhKT0FvU1BwQndCNmhtZVlxWmFUS3Zwd21N?=
 =?utf-8?B?ek1IRmRWWVZ0MkhSb3FmS2VRTUIzTEtYYTd1R2cxc29Cbk5CeEo5N0ZMdDV5?=
 =?utf-8?B?Ymt5UWVwOFZWY3BybTh4dlJ6Z2E1MkVIU2kycDUzNnJra0VtckR3L0Y0WWFL?=
 =?utf-8?B?TFhjZGpCK0VnWmhNUEVSY2daUVd1U1lTVmUvNDAxZXY1RWpqKzVhYjRSa1F5?=
 =?utf-8?B?ZUovUjduQmpIekxwV25TakhYMFBnSStOcDRjWWVDRGljTm1CQ0JnQWRVZCtR?=
 =?utf-8?B?TE1HNlZkRDhKWFdLK2ltZGlCWjJQbERNdDFISDJUb29RMSs2VGhyYk9wcjZX?=
 =?utf-8?B?R1MwTFpaeENwMGVoOXIybmFUWVlRaVFITXI1c3pvaEFQODA4TG5DcmYzRGlv?=
 =?utf-8?B?TE1sT3NITDdZOWpCRmdESnhQMktLWDl3NCt4M0FkS1Rkd050RFNLUm5qVDhT?=
 =?utf-8?B?Vnd3NFB3MVpPSUloQU9QeGhvN2d0TTVoZVNIN0E2MVN6MVFFRkhhNTlrMVhv?=
 =?utf-8?B?Y0dFMXNsYlJmVXhFZ0l3NVN0b3RlazZrcTFqY1RiS28zbXlmRkRNUk8yb1cr?=
 =?utf-8?B?M0JHd2hjaWZucVBsK3BwOVV0eDVXdzhFVXg0bDZTR25YQi9IdmdRWW1xdjZE?=
 =?utf-8?B?Tittc2k0eDl3TUkwMitqUmt3eE1FL1UxWkVralpwS0lmaFZoMWdOcUlJRUhh?=
 =?utf-8?B?NFdHcHVtRnV1WmZMQTRWVmFtelJBaHBnamxpNXJoeG81c1dxNjJJOUhVZXVi?=
 =?utf-8?B?WGNTdlhWVnY1dmY3Umh2eUp4aEJjS2JWdXdkMERlS2NMbW1sTjJpRGxYSXUz?=
 =?utf-8?B?Sms2akhXeTRTOWdBTDlXOUxVcklvTmdDd24xRVJnMjI2cXp5ZFZZSC94bGZB?=
 =?utf-8?B?VlFTSlpZak44a2d2VHJxTEJmR2RsZTlOZnBXUWl3SlhpTUViMDhHcGw2cVF0?=
 =?utf-8?B?Mm4vbmpsSkpkcEI1Vnl2M2xMM1JRdXNoTE82aUtVVVZzMDFFeVM1V2hjZitn?=
 =?utf-8?B?Z0tPclJ3RTJ1OGR6ekkwSE9MdFB0Zjg3SkVEQzBHcG5HODgrakN1VjZpSW9Z?=
 =?utf-8?B?MUVZalRQL3Bqc2hZOFk5OUFKR2daUkxtSmJhaVJsNlhWZ1RPaHZmUm9xMUhu?=
 =?utf-8?B?a1Fjelk1ZnFldVFHSTBhbjJ4N0w5QS9TRElmdW1jM251czAvdVZOdmVWbnJZ?=
 =?utf-8?B?ZWpqeGZnKzZWYTlKRDg3SE9CS3YzKzlKZ3VtOXNhSXlNWGZmL1dTcm8xMGdm?=
 =?utf-8?B?ZW1rYUp4V2ltcG04cGlSYXl3YTlpNnBKczlNd3hnMStKYUVsM0lUVndBSGpl?=
 =?utf-8?B?R01GK2tOVElPZmsvbGl2UDBQak5lTDNYY2ZqVDdMQ0hVTWpacm9vbVkrRWE4?=
 =?utf-8?Q?l18xPs6GiV/gUzpg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b09ae7-9cbb-4999-e5ca-08da2fd1485f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:33.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wpjSQ03HxKptjSa99zGP/9JS1LRak4E8SiKurCGMkZb1lb5wsnAyi3VkzXo9H+I7HXnmaYNsJacN/yXBbY3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: nxf9sqrIIw_LkdQrOxgUPnC1wC6FCfIb
X-Proofpoint-GUID: nxf9sqrIIw_LkdQrOxgUPnC1wC6FCfIb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

The vhost_vdpa_one_time_request() branch in
vhost_vdpa_set_backend_cap() incorrectly sends down
ioctls on vhost_dev with non-zero index. This may
end up with multiple VHOST_SET_BACKEND_FEATURES
ioctl calls sent down on the vhost-vdpa fd that is
shared between all these vhost_dev's.

To fix it, send down ioctl only once via the first
vhost_dev with index 0. Toggle the polarity of the
vhost_vdpa_one_time_request() test should do the
trick.

Fixes: 4d191cfdc7de ("vhost-vdpa: classify one time request")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8adf7c0..6e3dbd9 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_one_time_request(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
-- 
1.8.3.1


