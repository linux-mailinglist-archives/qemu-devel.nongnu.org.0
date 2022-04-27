Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18505511395
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:38:06 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdBU-0007wk-Qm
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4V-0005HY-TM
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4P-0005va-Ti
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:47 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6q87m003700;
 Wed, 27 Apr 2022 08:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=3ubIVVPx4iMn9LafeJhO9Z/dhWys9TxEAB1Efhtxr7U=;
 b=QJ8ceLQimhsG3sLma8wOmzZDJq6n9avCZfpcEHBy5/QpYAJlqOyAJRznVdAfxgbmVIeK
 E1glnreLdsyaY2zDpFaVqmJqGk9xepFB4h7oiCDuG3TUxOoCH9HT2Xabnl7Ds6hlaIbD
 ZhysHXeWU6cwDPV65+A9kOaMCYD6I1Jz90qlGDsUW75BpmGkVq7VFAnZqROHPEuvGShR
 eDVL46TA1nYnnCU9CsxQ9VQ0ridDYYORv2ZJZ1f0lxebvOPNalI5pu2bdwElbtMdiiVv
 ePwKKGnm/fxpI5iZZaO6HPkquy0luoORGCBWr/8iG4PP6S86BJggd+2Gxl+CQWi70RVF Ug== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4r1ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:42 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8UfW9030459; Wed, 27 Apr 2022 08:30:41 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykf12n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNSC7dCsRT1jtQ+iLH2xHJXiiQXNQXzHiBEgAAX+aC0COzpwKyKrC2e0ja0H98SP4mKekK/DK4Lv8y7PRW70gXxurGi+GUekpMVpqcskhJ1NC807ytHeUHFNCUEuKCaxSW2opyhzJJMOAatuk52ay9qPb26wQDqBtjvgtgFRqjSRKM+F+UDiCl4LbatNz3pkjgIJXP74SrLl5bT9wXSYtu7FclsbghnXmkZCYFIqK8gvxX+iXyPFDy+Y6Qch5fT4yG9V7n9VOQaLWhc2dH1Knsx8hmuVg26CoE+YUAKkodsS+Cf9swKUDi2S8WxS72JoFfq+ySqtYASomn0XgZ6liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ubIVVPx4iMn9LafeJhO9Z/dhWys9TxEAB1Efhtxr7U=;
 b=IjwGQSY92WTofvXrGY/ymARQmef24lIQ8kCyixpryRWL5Angr+O09CpTQjaTBAgz5lpOALMOfgr5NlFHYYE945dcx63o3ysMkS1z4zsYEyyilhmptZVrd9QSVVTnFkw19ttQQOU2yDMbFQWNDDxFJEvR1DgmvpSb74lbFp/IcM3GN2a2tYVvV+1sNbsWudKukpCLQphC07J0xsqdlto6WAWWwCWCR4Wm+GHhc50F4XKlbrMXFd5z/jfDxoB9Stia9XCI6S2TYK1zGOEtNYpHwV8VvCdJD8UNhhM5SHwwVPf/AEtZ/XVBGl1tVHy664tbylCTlSDcBOhzcyJ2hglWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ubIVVPx4iMn9LafeJhO9Z/dhWys9TxEAB1Efhtxr7U=;
 b=AXfgMuY/U2Z0dWM/zyWcvDccqDmsDNJ1RBHkLavgPPePmmSNTQY8nXbjzL+lG18PPYDLkG4e+IqKfWzLuglyfPuS/p9MAVYjptwj8V0DrVKU/H0uAqPhxobRJebEwl3MB5zPysNymutXkwim3RWmgBIFmtqCms58zBvY/qi0iW4=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:33 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:33 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] vhost-vdpa multiqueue fixes
Date: Wed, 27 Apr 2022 01:30:11 -0700
Message-Id: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1abbe08c-4b8e-40d8-8a60-08da282831eb
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB20077300156B32A81D2CFC2DB1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 91H/SYxp3th6oUlAZbAXCAyBN64s6/q2fdMQVsxQfXrZP8Pqwj/TK4u/77m8BeqoHYNC/FSD3yFIVEImMYCVwklXQhWPck6itoOa/8fiTYxELVxqAZ1msYhwpfMi7HsPvoaf9xHqZ3F5sTGOGGoqZ2l96tieCanhAQS0U9OE7i7183X8NZcbaNOFvKPI/EDYhEfkNsEFTjxunNa+Mxpb3kEBKWJLnail048KO87vXF8OvUy0+4bGZAgjHbR1/gHOUPME4Bo8E3Sv2oXyvEO47zzr6TzwJgEvhvpmpcHqePigG8frKRSF8SgEHC1APppO8LDU9kuLbG0vTOuKHAy7I8faTUlRZJO7HsfjuMaqWbWnX8iPp9bBA/Oel7bLIZFw/68zf1r3jc95Hm0/lNfTszd/MI4S+eBbCgGOHcA87uPBXzXvhA+mkKIqIuAvx6k3YWMUY2KfVB7NxwzAxqhf7tKLKOFN5XW/eXBiUpLrEQxPt7T+1wNu2tKxUirLmO4D4k3pTcmUrMjua6LYEUO903ohAj1sXPB0mEg0Bx4ba0MORXNi2r364aIb+cUomHFQNXQQkhP6IVsKMjn8sg3MEv+kzU00SeevhUFApKPeeNKpzlsOuDTP3uUgLLT2Vsd4YvDVINltqWPdM6rvGgxeFUvf6AF3AgjV8xJ3Vi5dKSorl9V+zIWPifgx8kSFQP2jAtj6MQyrofMwaCFEfbF67UMWztEyAMtTlNOKBnRO6TrUkXu8UYqvnX9vM3VNVbERke7FNeGeDkm0zIAPha0SpQGX5a0Kg+F0S/usOYeHK41rjCuaXryKH8YTEidBtWstUmvvvHMWS2VqPSyi9ceP/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(966005)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVh1M20xcTF0VHlRRktCcTR0VkZZaE0yM2ZvUUhoYXFMRUZDcllCZUlOakh4?=
 =?utf-8?B?RDRtV0dWQVVlb1NEaC9kYkRHcCtmdzlMcDVCVE11eXl1NEtFS3d1ODlML0dx?=
 =?utf-8?B?YXAvUkJRS2VQKy9paEEvU0xmK0UvSWo4LzhjR1R1T0p5eUFSZkZlNExNSGZz?=
 =?utf-8?B?MTBxTTRkY1M5L3k4M01YaURJWjdaVkFzbFlFcVlEZlo3WlRvKzFVd2pLNUQz?=
 =?utf-8?B?Wkpjdjk0VVdoS3AxRDRoSTBVL1QwbTFkUFlRREcwVEhURXpmZ0YxRjhNUTMv?=
 =?utf-8?B?Y3hWRlQ3ZXU1MTl2RVNOSS9FSHZiWStzWXBndHU5aE1pWlZsL2k1TFRDOTFN?=
 =?utf-8?B?dHltL3krZnZLT2RhdHRmRWVxbmhoM3RGa2s3Qjh5MnlzUkhwWTBPbzFkcnhF?=
 =?utf-8?B?dEN1UytsNjJLWFFaYW9MaGN6VTVLUjlkd0d1aG5aUEMwYjBmTFJPUGd3RVlp?=
 =?utf-8?B?N0lEQnJ2VVJhUjF0NndtTFJXU2NETXU4UXFCV09Pek9zS1ZFT3QxQ2luNm93?=
 =?utf-8?B?VnorNDVOa2tkUG1zaFFRdUovd1FxbSt4OUhMMFo3WW5yN1IrQUZTS1YzMkhl?=
 =?utf-8?B?bXlaTkU4OHMycTFFL3UrQ0ZZMStyZG04VTBlemJKcTBwRTI0cFArRjhjUDIz?=
 =?utf-8?B?R3JUYzZTeGFIa2Qwa3BOc29LTkZrVWF6MmZEcDNZYXkwMDVuRUdHMkM5a1hy?=
 =?utf-8?B?bDh1UHFGRWNxd3krMVdaYWtvS3kvUmx6UXVxcDhrV0IzY2Fpb0hUUzdsa1Ix?=
 =?utf-8?B?RUlFUUlZT0VsVVYyTHJpOTJOMXcwSE9aTXE2QkNtbzBmbDcveXlNM1QvT1hG?=
 =?utf-8?B?K0cyZjN2cVM2dWw2YUlVR1gxdmxrU0FVUDJ2L3ljOWc3aXRKeTJhTm1obzZ0?=
 =?utf-8?B?SFAvSHh4T1pJLzRISnhEUzk3QnpwL3lCK2RIeGluTDNMTzlsTVFMZm8waTNr?=
 =?utf-8?B?aUE1U2R2dUZiUVBuSDNBd3lFcmtxdk9tVlg3WkJnVFpnWUhuZkhTY2Nqc2pt?=
 =?utf-8?B?cTJVTk0yNmJGOG95NUYzY25vQld0eFdYS3YrZGNTUld5dXpTQXZXTDlid045?=
 =?utf-8?B?bVN6RVkvVnhFTGorSzFGL1pOc29iaXFRTlFzbkxGdUhxUXhNeS8ydXNjR1dI?=
 =?utf-8?B?Vmh2YlpuNndtc3lZWlJCR1RSTTJYTGZvbVladXlzMkZhTnZOZTl4ZmtLTjVO?=
 =?utf-8?B?OVZSclNMQ29zYnFZcFU1V250OTQ4M01DR0ltdU1vTmZZUFJWeUdjWUtqSlVS?=
 =?utf-8?B?TXpzZW9nUmMwTUt2SCt2enE0TDNPTHlrZ3dJcGVkblMraWo5eHhPelJad0xI?=
 =?utf-8?B?VEhlWjFQYVpTRTZmUUNQQ1IvVFM3Vis5SGpSUmt1RVl4eU14ZjhFQUt6Y1ps?=
 =?utf-8?B?SHNoL2lZUTBoYkMrTnJBdEpkWEhpZzl4MmtOaFI3MHdrd2xBQTF2RUx2aDB0?=
 =?utf-8?B?dWUxWGdmZ3d1MW5pS1hxaTJtR0NWODdBVFRDTHRrTGFUWnI5Zy9RQkdHVlZU?=
 =?utf-8?B?d25VeTlTZFlQMjczdk4rZHZ0eWFqMlRodER6bHdRN3JmM3lwUTlVWmtoZWRk?=
 =?utf-8?B?YjEwRFFNdHNWYWdWUjJ3UktyblZrNkdKZElZUndpUDNHSFd0UHM0b05PTHdH?=
 =?utf-8?B?disyQlQyYy9xMGREU3VQeFA5SUQvKy9kN3R3MU5FTktQUnJVeW1DbzNWWk1x?=
 =?utf-8?B?aXRxTXJ2WUtaLzg3d2o5ZFlLcWRtS2hEL3hkWTVKRDFaTDZzMllqSmZFRzF1?=
 =?utf-8?B?TDA2MGV6ZjZGZCtjMDNvcUFPM3ZvNVRaditES1VFdGlnOXdudVFZaStxUVFt?=
 =?utf-8?B?S3NjekxUbnZKRDVhUnFzZlVUaTZRa1NSQnF3dkNTUUZiaVcwZjFURHB4b01m?=
 =?utf-8?B?TmhpRC9Iam9LUnR5cGtGNTNvRU0zV2hqOW5ZMlg0WnQ1VWN1VExsUHkxb0lm?=
 =?utf-8?B?Ri9hMFNzdEo5c0FGSjg5K1JFbmJSNVhFbkZGYUpsa1lTZ043cjFiM1JtK3FP?=
 =?utf-8?B?M3VaMC9haitxZHlXeUJYeGhIUVV3V3BtbVI5MVVtZ2ZiMXVranZSR0x2SHdB?=
 =?utf-8?B?NllOTklhcGhnTE9BMU5BN2h5ekVtVy94anR0MkswWmI0Zy94SVlDVXltVk5I?=
 =?utf-8?B?VEZtaWdseC8yWUkrZS9WQzJQc0l2MTRBa01iLzlwYVcvVVYrVDFORXRZWDZX?=
 =?utf-8?B?ZlFpOHl3UDQ1eTg5NWh1d0s4d3N5VFRtb0JZVjROWElpY3NSdnJDRkc3Z1ZJ?=
 =?utf-8?B?TzMzKzRjTFhyblpNUWZVcExMOWlUUFNsWVc4SzUydjh5TVRMQVRXQzNuOWM4?=
 =?utf-8?B?S0JzcWVTV0F3a04yaTZjcEtzMDNObXdjcThFbmREd2V4Y1dCQStJNGcrVjBE?=
 =?utf-8?Q?n3ZUsw8tpCTqILoo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abbe08c-4b8e-40d8-8a60-08da282831eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:32.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc55BEDa6+LRLVQ2jE9av/eRfC9oDEp1B512FJHPN8gRY1c7uLkrdAKP1rCsFjI7iWZ/3qmxzv5oQP9DClE6UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270056
X-Proofpoint-ORIG-GUID: aWr6mq0xynJIuBobfoBJmUSaMhAmEILv
X-Proofpoint-GUID: aWr6mq0xynJIuBobfoBJmUSaMhAmEILv
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This patch series attempt to fix a few issues in vhost-vdpa multiqueue functionality.

Patch #1 and #2 are the formal submission for RFC patch in:
https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/

Patch #3 through #5 are obviously small bug fixes. Please find the description of
each in the commit log.

The patches #2 to #4 for v1 are taken off from the series. These patches will be
posted separately later on after rework.
https://lore.kernel.org/qemu-devel/CACGkMEuecMSCWdr0P9f=U-8wYAw3M05mmeRo+y6Zmt2TxCUNBg@mail.gmail.com/


Thanks,
-Siwei

---
v2:
  - split off vhost_dev notifier patch from "align ctrl_vq index for non-mq
    guest for vhost_vdpa"
  - change assert to error message
  - rename vhost_vdpa_one_time_request to vhost_vdpa_first_dev for clarity

Si-Wei Liu (5):
  virtio-net: setup vhost_dev and notifiers for cvq only when feature is
    negotiated
  virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
  vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
  vhost-net: fix improper cleanup in vhost_net_start
  vhost-vdpa: backend feature should set only once

 hw/net/vhost_net.c     |  4 +++-
 hw/net/virtio-net.c    | 25 ++++++++++++++++++++++---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 net/vhost-vdpa.c       |  4 +++-
 4 files changed, 43 insertions(+), 13 deletions(-)

-- 
1.8.3.1


