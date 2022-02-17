Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931D4B9AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:13:29 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbup-0005LA-JY
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXk-0003li-Lz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXg-0004Rg-2j
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:34 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4exgZ005355; 
 Thu, 17 Feb 2022 07:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=It9K0rrol0s2cBhpnABxoe+KY87TmuaxFnQOT4MBPQI=;
 b=fggLYx8ht6/QxwIqkCdBZKmlX+zXV7vN7zm69TXUCg0SYWHq4WYoXgtrWXO0Z8+uDJAF
 IkELFnabXyMd1oZH81ZZDQmA5xAHdH3OHVD3bxC/RwsLH3V3z8Ifp3hTvq6udZQwpqnk
 7ZZHOfh2Ib3T0Fd+xWnoMeCO+D5+CS1SVWV4dbOC3nFOY8yXoc2z0w7VLsp54NIrGO2w
 Pwuwc+DGLDIAMplK93ZXoLH9H4wVPsB0VpUYePMU9ytWqxIjyhojgY0TVLPi/VPUZGP2
 rBN6raKbpLJUo2mkW2qxWTqOXd4RGQooRgHfdnQoepuA7vzJdwJ1dQpEeCzwk2tvNaMW 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavqwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7fJOf142804;
 Thu, 17 Feb 2022 07:49:18 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by userp3030.oracle.com with ESMTP id 3e8nkyqrqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzybnItqRNpX7ApFZoqL4/+1IXv7/rnvhTFJX05nhWsLA3gdP0CpI38weqXV5B5eZYc4lXUWpz5AgOHtEE9WiMwXg1ttNIT5izd3m4IK3hrxJLEpC+jmRlNjY+wNYM4IK813nKgpwAxMC8JVvNhTBUnOXsNF/dYGOw1tonlexIAgK+vxcQ+dLbmMIuJEHeaxpsDb3+Th5IQbL9OqmNoy0vrWh6MI3fCxf0sQfvVuKj+uF2JSN9bCSDsnDof/eSKtKtG0Lj/NaGLgpCFu6siBUf9gvw96LKAXRp3FAFQGiXEgeKn/Yjd21uPXtTSbk16dfrBUJp1JJToMsb0FPEDUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It9K0rrol0s2cBhpnABxoe+KY87TmuaxFnQOT4MBPQI=;
 b=WFxWUgb4KFlG8ZnR5EuTgNzwOmfPjBqUKp0GR4DaVts60Ry8Wfp5JdC9p4qVDQ2McwWa5ZyN5VwKKYhqwNk4Fjfz+hqmzBNhPvDu3QEA/PDTo8ZR2qAvuYDlbluMiqV+LSSkLwkAJscb1ont3nVIDnJxu9sz86euFx0BCrfI9WbpFyCQLPX6aV6Mqv7Iu/wDlrZCYQ4/Q36X6qaroDTpqLfqX8bFzzB27qbm3XevMVhMdS2ZN5NIX9aL3/6Pkay8X7HRELeH+f/q5lb69wdddKeIWfm2fzCTHaDkDziVkgImj8fr+jKF6Ue+d0/OYsnpPi/75ZwpSdYlB+A+RztnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It9K0rrol0s2cBhpnABxoe+KY87TmuaxFnQOT4MBPQI=;
 b=mQbGwEXuAIx1SFW78ciVvWqqzvnkcS8fRrx4LK2pdtG/i/yk34rzmRwQ+JBe/YsHVS0oNd2viCP0AP9RifvkYTdkzFnQMEsd9QQb80EvIQgKJU4PxYs30OmaNEdrEd/Xv9clFzrdJcYh0iugebEJHH+MDB5tOkuw2l8bEedOBok=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:16 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/19] tests/avocado: Specify target VM argument to helper
 routines
Date: Thu, 17 Feb 2022 02:48:49 -0500
Message-Id: <d4c13768d29a2e3231d75d4f952c947d33346e95.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab083fcf-8da3-466c-6c98-08d9f1e9ff71
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB30095DA9305D63E05BE8D11890369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZOnw27xeTqpiUPVtecTE9tFpq5XBFg3JbyEMOB2gT2zj7Bf4XQW2uqleJm2MsQd1PzJtvUhlpqRG9U/PLAhSGEgnJnk/4PsRWT7X8uTHvortEmETtp0dk1jOWeRjKG4BJElBin9iiRjDR3QRDLzC2VkJmC2w1ZeUFJI0+a5rSTI7CBviaRJd9QS3bJ4hoBZ3xLujs3WDeMewYx3yRX3BW1djm9hmWrfhFnKhb8pREAMon2vqd9ui57KG/O1CDiChq6HVawIbZKu2XNYeAmbw9zEQnCHC9O9G9Emu19YMsWEkp1SPtHthLvhCds0AAlg2ieY0dZYzD1bxglP9pxmnukZLmfzmirQEJUWhAkOohpyFbhF9XFaX4SY3tqNNTdqhWUCI9Nw0A70jnzcHhigOaFO8j7Pq/myA0Xi+X5lk2NVKRB5MvAlllbF3y+Vsjx0srXn0GX13epjNoENNNhw/x6cuAV/B7bTYHrz2dPjAid560zNLAu2+9vPl3kRUnocrX9ScEhjqqT3axneHP7O3ZFZf+lcceTOsWG+fitOxWHUdP+c8X5UQd/IX0L1Sv9AI3gc5ywShJObU1IlYX+OkdwT4lYUejomOTuoJhBeUAp82PsPdKuDkJNM39YlfQ+r6GXDIlDUiP8z6QFPtNBSQKTJfD4GLF2kqzBkITC3N+m+qJ+XFErQt5sXL3pBFwcqSJqvGie2WIP8xEkI/WBJ1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(83380400001)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0t0ejkrS2x2UDkrSDl4U3d1TVpONlI4cFlHNVFwbFk1cnJ2YlYzY1Vpblpm?=
 =?utf-8?B?S1lYYURnY3QyenZUV0NGOWFtMm9HQzdKVXRObDh1Nm1WcWQ3OEF5VDZYUnRP?=
 =?utf-8?B?blRnbWY5dW9LcTZzV0FXNkZRU1l6RDUrMnNLa3RNTEh6disrL0t5NDdKQm1N?=
 =?utf-8?B?NEV2TXd3RXpvSXd1ZVpNOVpVdUVWb3VGemhpeDNHWFVHelErdDU4NEhxV3dj?=
 =?utf-8?B?eWx0RXhNcTBkTXYwVlA2NzRnVEpwcnd3bWQ5ajBvdklwUnM5LzBUL3VZSG9j?=
 =?utf-8?B?dU1GaE5KN1ZLQktXeHY4N1FhTHRNOEJWcU00VFhXNkt5bTVZT3VkNlorVG9B?=
 =?utf-8?B?WGhhNWoxWjlZKzJaNXhBeHZOdVhmeUlRL1Y3TUI3czRTN1FPU084SFNDcmox?=
 =?utf-8?B?cTZNbm44ZlRtb3JaWURwNklCdkF4Y2N5Nzd1eGs1dVhzcVcvZytybVNIZWpX?=
 =?utf-8?B?SzVIR2xYeldmY0hUMFdSTjNqc3J6S1VxNmhZTnhWMlJ6d2xqQjRSRytXQmdP?=
 =?utf-8?B?clg0ZlFwazhqRzRaRDUvMFNWMEZPeUo0Z3ZpTE0zL09vRW0ybDI1OU9Qa2Fn?=
 =?utf-8?B?R2ZZVXFOcHBsQ1ozWk1VeFdhajltU0RoN3JFYVNhbHpsZkNkZVVtVEp1OStE?=
 =?utf-8?B?bnBwNzU2L2M0UE92RVJpbStZOVhEbDEySld2OTZEWmZEVk0yby92L1VlbEhh?=
 =?utf-8?B?VDRKRDM3SmlGRTNmNTRXS3hHdEU5WGZnQ0F1QnZNQUNSZkVReGo1MUFaMUdk?=
 =?utf-8?B?YWVMaUw0eTJXb29XbmVTSjFSaGNqYjhIKzVQaVdra0pRWXpuZDNKREYvT0RS?=
 =?utf-8?B?Y1VDY3J4RGFCL281N1NiQVJ2aDlDcGttd2pacHpLUTE4eUtscHpwc1M1QVNF?=
 =?utf-8?B?bVAyV0d6akx5dkRYR0d3YmVJQm95c2J1NFk4UUwrRm1lT3ZEU2Ixd3dpVmFu?=
 =?utf-8?B?YVExYnpsV2x3dW1UZElMY3dYTWtRMTA1a0FiZFE3b0xiMDJDbnNYc09xNnVw?=
 =?utf-8?B?REtjZlNUWGpORm1pRUVPZ2RMcXVob1VEeUNPZGVGRkh5OGNBLzZmVnhKV2Q5?=
 =?utf-8?B?WkFOdWIrenpXZmxQTlB2L1Z4TUM3YnY3SU1ZRmI3enhZYU9pTEd1Y3IvZnRR?=
 =?utf-8?B?STlNV01jUlpybnltRHM2eTl0WStIM0h1c1NuSXFySFltTldhUFc3SUo1Z2pu?=
 =?utf-8?B?WWVaNTJ2VmY2a0g2L3BsblBVeDVIT1ZKL1IvQ0NNejIxN2piQXVNcUlqZ1dI?=
 =?utf-8?B?VUVOVitBYThxS2MxMkdxRWErS3Q1eElhSVhtQWdmRXdOWVA5aDNQNk95ZVhL?=
 =?utf-8?B?WkE2T1p4eFJxbTM3eGpSQ0JpL3RaV3Z0OVRFY1VBanlDUHJtZ2xuQzNMNU5o?=
 =?utf-8?B?VDV1VHFwbFMyZEZaNE5hd3VWZ0pPazhFN0JaYlJzT2xEYUNWR2kzYTNJdHVq?=
 =?utf-8?B?b3RSSldzQTB0WVZhalUrMXErZjVlVXpWMUtqMXFJcFN3QjZHWEpuN0NLNW9R?=
 =?utf-8?B?cXUwdWo1VS91aW9XMDBhMGdJcWpGQ1VZM09ERElqSnQxb1RlTXMxN2VQR09Q?=
 =?utf-8?B?TFA5V3lEeFJQLzFMclJEYTJKTnVZRm1jcVBFTnNpWk9GQW9xQnk0Z05kZFFh?=
 =?utf-8?B?RXY2Vm1MdTJmcEE0MklFMU83WFU2SytQQ21wVkU2NktNUlA2dUhUNmM4Qmls?=
 =?utf-8?B?dnoyWFVtSDBiN1pHWllSSnJjSGNsZHc1ZHMxTXAxWnA2NUVPZzBqZ0FpK2xJ?=
 =?utf-8?B?eVBJYU1GcXBqbTlrd0crdVBkbkFCL2twQ09zNWpqV2Z1R25wYUwwSlBXb1Ri?=
 =?utf-8?B?eFN1Mno5YUhLSGFnRys2ckRqNVE4LzJLbkRDaGhsSHZZNkZhMU8xb0M2c3I5?=
 =?utf-8?B?VE9aUWlnbXlpNjlrUndBN1lFMDBSV2dNejVybkJoTEIvTGJhMGxvMSszV3Zn?=
 =?utf-8?B?VDRWT1A2cFV5TW1zZE9oNGo0b2k4TWRuTE1lYVpReFNZemVFeExjUG9DZit0?=
 =?utf-8?B?R0FYRnFoa24rZHFVMTJCLzlrQ0R3Wm9sMmFSWnBhTVF1MUE4WHlPck1sKy8y?=
 =?utf-8?B?NDJNVnZkSzdKK3ZyWUVDb2R3L1BmMEtVZHZqRlJyQzVPRDd3Vlc5NmNqUE9L?=
 =?utf-8?B?TjhNR21ndy9kQVlZb1FIaDVpNFBmcW1jVkIrVUs0QmRNN0FRMVBKK3pUZlpG?=
 =?utf-8?Q?2AdX/wg9cn76h7SS5ItqK84=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab083fcf-8da3-466c-6c98-08d9f1e9ff71
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:16.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9img1T71rUe6m8gq5/Bpg3y28rhoFuXOB7/6jGVlj5CqSOwtLyAvjXr0zVbnIFpnLP+PjlA4ivdaD4u2XhAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: 4cx0ZD7sBDS_f04nS5xAmGDVMvncXoZt
X-Proofpoint-GUID: 4cx0ZD7sBDS_f04nS5xAmGDVMvncXoZt
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..b3fbf77577 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
+def exec_command(test, command, vm=None):
     """
     Send a command to a console (appending CRLF characters), while logging
     the content.
@@ -207,11 +207,14 @@ def exec_command(test, command):
     :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :type command: str
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, None, None, command + '\r')
+    _console_interaction(test, None, None, command + '\r', vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
+                                      success_message, failure_message=None,
+                                      vm=None):
     """
     Send a command to a console (appending CRLF characters), then wait
     for success_message to appear on the console, while logging the.
@@ -223,8 +226,11 @@ def exec_command_and_wait_for_pattern(test, command,
     :param command: the command to send
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, success_message, failure_message, command + '\r')
+    _console_interaction(test, success_message, failure_message, command + '\r',
+                         vm=vm)
 
 class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.20.1


