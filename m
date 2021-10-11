Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5D42863B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:33:59 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZnwk-0004zt-7U
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuS-0002Rs-JL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuQ-0003kb-4F
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:36 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iKQx029456; 
 Mon, 11 Oct 2021 05:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=+HMFnFb74KitebvQX2JcSYGdLbkN2ZwJ2FyL7apubfM=;
 b=srdj7E2jtymzZcmiroHUsVRDCTen0Cw2vhGFWzryOnT5weD9ykiXrDPanFN1zbiFilsb
 ZZxrRJYVDoci3cIAD3/9Z18RY7OWQZdggfo6oFSMIfFBg4S1X0srzPiezVk44p2XoSaF
 apudd7xQcAoT+Cq0+6QA7JAWIFXHPQcAcnC9jmb/ZdW1X5v+dXm+TajIN4SqpmM9OBK+
 WWzd5E5kgJNpN0Gqjta+DS5X5Sv5VqiniptE+6gNS82795IjYOfXlni6Zr4CwXk+2IEC
 O6TD3YK2gqU93Pm8MJFj4qHdoGbKX+ZvEpGypRuGWdNV6A2Of5w1WDwUU/7pmPQEb0Ha ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh1v7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5Ucen104841;
 Mon, 11 Oct 2021 05:31:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 3bmadvqghw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0/KB+z+H0HDVEk11w0lixFZiTUj5uPxf8VYR0qRxDLPT8CPdL7+DRgtSW83awT/kBIWbruKGHfXPbSosKARg7T6iNpQuzjH+sjkODiHCCSnhS4wsgtAqNHUqIxU88U8BN7xlRyCcu2a3sDVyAK+8svCrQ6alA+mgPk4vW53PSr/K/9iJzENRJypsJ/1/6BIIpjf9ObjEaGixT7UIp5kR2guLbijr0yPpOSYg2u//lFPin+fnmpxxgeO1waCE5FwpLSpgx/vKWjN9o/wO/yP6kXkOblQ48/Fw9FTTHRJcDLzCcTYjEUN6bkQulGXWl4w7i6f6DQSgZIQusrKGhNjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HMFnFb74KitebvQX2JcSYGdLbkN2ZwJ2FyL7apubfM=;
 b=D34S2acbqtpjxuqqW6gI166CU1n7IPa85tJBp7Gkr9Ag3LD5R3gJdDXGejJcNXub6up2QAchvyOQohM9yJvxI70LhEVCRXLwnczUReLMxoa1PAHDJgune5E+O6Y+q71l5YCzb4rn81QpjJ0sUui5KJcILrmGTgbrX/pHSYiYj0Tp5eYu96CAIh395ZbFFixCvCzDKgr0CcG+k+3SRIkmQD7JwZ11uEEmuTUhHD4uCDZv8eiOiLMBOkPrLRrz4rLvd5ZP/r7wa3tZHrhPq9qptrLIfsmJqFp8R3ekGzPwHbzqmwwDrevYf6XgGHr0gTDs5tn51CgRZaV9NbxKFrFXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HMFnFb74KitebvQX2JcSYGdLbkN2ZwJ2FyL7apubfM=;
 b=v/S0hhw38Igbwuu5ASPGaHkiMyTQKCFUmraPA3kzgXMlLnyFts5oAT9lNI9erYX6TgyIXkueM8kjmQm2WSFdu0Y8SnV7t2nWXV4TFV6tr6gE659IicnHx9yAqTslO0WbZsD9EVd/q+SL2srWLvFAXN81/oeWnbRM+7Yxu4WGIfY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:24 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] vfio-user server in QEMU
Date: Mon, 11 Oct 2021 01:31:05 -0400
Message-Id: <cover.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38bf524d-27a7-4b16-39f4-08d98c785d60
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3902E1F8D253C07A897BD50D90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEmdX5uzmvMRYu1Xcl1G189zf+j8mo8VjTvbxV60U5mdktjtX1cXZSKjNbkj4P8CCrLqR3CmW3YasrlkA8erN5T5A4gKnBLnDCIS88PJl2M07MOGgYxVsOZTfy9QjA3M/qx4o2RXwggfkMeNOSFIQn0tQX2/qcxswg52Lc6to9lVIWn3fNoTSVMiE6fNffjRZzQKMYlwORzYUBRvA3vTAofQH5ZkhevBfBAUuJdnh7CX+QKfV6QyELpFGMRSy5TxsNeSVFkNaJ64KIi3rzpVs/VSat/GORPcrYsFVRkr/eFHcGHyh/TIMj07ZV7r5mJaOGvRQeP3dbQBPGPb5F+4S/qRhjWabGNaD516pI6JVsmcDYrdJMrrOOMO2Q7RNA81XjHdvYh/t0VrWrAIA5FFoUZciVNHYspTLVgW8IWj33GgiCSPoYDsGgpIIszCG6TmyndOy63qHu7P4KQwPDNZJ936/Kd0nECoXOtCQwyUnYf+dGId4gj4rNAlgMOGeeMwinxmgbhv7vwg5I/vmHgyc/aJ0MA9QDHoHYgyDA9UonELZqihKkQOwHd0fwv890Q9vuk9ZNZCnrX+BlMrhgUF8L5oTQCxOE0kkL3+rC08i4N0OPHjHIXitCsjGsKS7f9OhqnVSI5lVxplqsTRo7VPIVqfEG4yBBCFTvrcESCk1+3Sh+s9W61h0Pb9bkbiiKTREMorpxwDOosVfxDsebF40A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(83380400001)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFKYUdNTXQyK29BYSs2eDhwNHdLRWhNMmtTQWxtZkdTKzJnMGl0UkxpbEpn?=
 =?utf-8?B?NHZlcDhzZ3R4S1pleHErNyt0dmdYUkxJVE1yUHVUZ0Q3NzdVR29qOVpwZklp?=
 =?utf-8?B?cmJrQ05RKyt2YTBjRTlqc1duelFzN2RXUUlNSFN5a0dVVmVtU25mK0hHazho?=
 =?utf-8?B?aGVFNHU2QnJNTDZsVWN5amRoUmdhSFJCMXBvNDA0eGJ5K3BoRnFmTzV3VkF5?=
 =?utf-8?B?cjB0RFdJVmsxU2lDTURWM29oT0p1SVd2cERqYXFqN29paElKNWRLWkdKUE9a?=
 =?utf-8?B?aVRXRURGaWlmT2lCbmRnWFNjTjV2emlpV3pkZnFCNjg2OFhhNFB6WlNXeVZq?=
 =?utf-8?B?NWdBc0dzUnZWN29Ua2pvcHgvSHowM2hVYmNEZGtTQnpPU3NqeXQxaEI5VWox?=
 =?utf-8?B?eG5vZ3dJRmFpYzBjZ2pjd3cvNm1UdExUcDNoa08vN0l6ZnJpeEZhZHVtVVhV?=
 =?utf-8?B?aWZpUitKU0YzVVVreXZQaFQyeVFPNm9MOTZlRm4rRWlkek1uWHFoQUJSZEN5?=
 =?utf-8?B?aXpuZmhYUWVGOFoyUzVYUWxkc0E4NXZ0Snl2amVPWnRYcDc1ZlVRWFBUMjhP?=
 =?utf-8?B?VXJhQkt3eXFOb2ZrVXQzWklGT0pMb2dXeEFDSnc2dzQ4cjhwSWlvV25KT0xU?=
 =?utf-8?B?bCt1RlNEWjh6RXRZNHlWNU01SnZwdTVUb3ZEVUpNYm9WRy9CYWZoZGkreG9O?=
 =?utf-8?B?LzVIcThtbUQ4NG00ZWZNdnlHUGFScUpJQkRMSWJVdko3MWV4c0N6V0VZbDI1?=
 =?utf-8?B?eTAvaEg3b1RuNjJIa2Z1Y3MrUlVQU3JJOElTSXF2bTRzMHptQmF3WnpkQzNm?=
 =?utf-8?B?NGJ1MlhIRXBGVEZqT2ZRUVRFam1TSjdOMUlkMkc5MGtpNHc2cm92U21sSERG?=
 =?utf-8?B?YkxmdDQwSUJEUFM4djZZdWh3UkRWTUdoUngyVUF6ODJGOEJUc2RKKzFyVTRW?=
 =?utf-8?B?K2VrN3ZBZWVmQWRyZ2pqdFpXOUxlMU5JMXo5MzFlMlQyS0dKZ0s2RlRZcjQ3?=
 =?utf-8?B?ZWp1aEsyMUNwQ1A5SE9yZ1hTVmlTZi9LMmsyV3crbnZqNHk3MmFkNmFOckJh?=
 =?utf-8?B?Z1pJNnVvQTNZRTIvWHpiamVhQnhZSzlPNnBmdjRZUTJpdnVZVUxHVGl6RmRh?=
 =?utf-8?B?K0c5K0hpMWNxNjF4YU1XZ3dGc1R0THgrWHpZMWJERWFhYnpaZ0hqMFNySkVB?=
 =?utf-8?B?Ky9kdEIxN0IvRTdWS0VkSS8wZXlGNGY4a2hPanZUNGJWTTQrR25jV3F5aUVX?=
 =?utf-8?B?ZHBIVHRnVzQxQXRyR25nOWc5YmpOa2pnMVB5SlZFV040ekVZaHhobmk0cldw?=
 =?utf-8?B?a2M0UU9BQ2lIOThZQWRUZi83d1kra0JUWjJoYWVUZkgySitjR2U3bmc0cWw2?=
 =?utf-8?B?d2l2bkpZQmE2dlhJd25mck1rY2RlYi9kVjlvbU9JZlZXSWlKMFVkNVZmVERP?=
 =?utf-8?B?VGJBTG1sQ3J5QnhLU2dqNVVnNTdmRFNhTXhGYzl2eDlNRkdub3U5UER3SzJx?=
 =?utf-8?B?RjllL29yM0VBUURBbVh6Sm5KWi8zM2VTUkVjNG5RYXNDeG82TGNoYk5weEIr?=
 =?utf-8?B?VGxrMmJ2VUQyb3pCbGRnZXFmZVlVTjBNRzhFTVlFZmlsazJaN0lQK2Y2K1hI?=
 =?utf-8?B?TTJvTTFmd2FJYndvNlg4UHRBa0dyM3czdzNZalFQMW54WjZ1TU9vb3lwV0hJ?=
 =?utf-8?B?VnJUTGNLOFRBRjNCMCtPcFF1ZG8wQnREdGxxU0xuL1A5YjB6RUtpYWxTQTJz?=
 =?utf-8?Q?80LjV0KKSnoUZunb+idY1mjwjUWOyCAOpulquTg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bf524d-27a7-4b16-39f4-08d98c785d60
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:24.2476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uEcSEapl6iMXUcP5qqhvLu0qS9vk+Hw8C2HfZSoOiLjorMsKwnIQ8wcI/k0AgEQckRpIBo7sJHb+rXmJQOQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: Tfg56cCdbRqHmIDXEmTtQMYZwopkKAYZ
X-Proofpoint-GUID: Tfg56cCdbRqHmIDXEmTtQMYZwopkKAYZ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <cover.1629131628.git.elena.ufimtseva@oracle.com>

Hi,

Thank you very much for reviewing the patches in the previous revision!

We have addressed most of comments from v2.

We are working on MSI-x support (used by PCIe devices such as “nvme”)
and a couple of comments in the migration patches. We hope these two
items will be in the next revision of the patches.

Please the list below for changes since last revision:

[PATCH RFC v3 01/12] configure, meson: override C compiler for cmake
  - New patch in this rev

[PATCH RFC v3 02/12] vfio-user: build library
  - fixed indentation issue
  - dropped separate MAINTAINERS section for submodule. using
    existing section to avoid checkpatch warning

[PATCH RFC v3 03/12] vfio-user: define vfio-user-server object
  - Changed socket parameter type to SocketAddress from str
  - renamed object as vfio-user-server
  - renamed devid option as device
  - Added CONFIG_VFIO_USER_SERVER option

[PATCH RFC v3 04/12] vfio-user: instantiate vfio-user context
  - removed errno.h include
  - documented reason for using a machine init done notifier
  - don’t call vfu_destroy_ctx() if context is not initialized

[PATCH RFC v3 05/12] vfio-user: find and init PCI device
  - registering for PCI Express devices as well. Tested with
    “nvme” device in QEMU.
  - MSI-x is not supported yet, PCI-e devices using INTx
    presently. Will add a patch shortly to address MSI-x

[PATCH RFC v3 06/12] vfio-user: run vfio-user context
  - Removed the separate QemuThread for attach as it was blocking
  - Using qemu_set_fd_handler() for attach’ing context

[PATCH RFC v3 07/12] vfio-user: handle PCI config space accesses
  - Using pci_host_config_read_common/write/common() instead of pci_default_read/write_config()
  - The read_common/write_common() should take care of endianness

[PATCH RFC v3 09/12] vfio-user: handle PCI BAR accesses
  - Added support for 64-bit BARs

[PATCH RFC v3 11/12] vfio-user: register handlers to facilitate migration
  - Fixed size handling in vfu_mig_buf_read()
  - Moved qemu_remote_savevm() from “precopy” phase to “stop_and_copy”
  - Opening “vfu_mig_file” just before use
  - TODO: Working with Nutanix on issues concerning the “resume”
    phase and size of Migration BAR (the size of migration BAR shouldn’t
    matter when using vfu_migration_callbacks_t).

Please share your comments.

Thank you!

Jagannathan Raman (12):
  configure, meson: override C compiler for cmake
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: register handlers to facilitate migration
  vfio-user: acceptance test

 configure                                  |  15 +-
 meson.build                                |  39 +
 qapi/qom.json                              |  20 +-
 include/hw/remote/iohub.h                  |   2 +
 migration/savevm.h                         |   2 +
 hw/remote/iohub.c                          |   5 +
 hw/remote/vfio-user-obj.c                  | 868 +++++++++++++++++++++
 migration/savevm.c                         |  73 ++
 .gitlab-ci.d/buildtest.yml                 |   2 +
 .gitmodules                                |   3 +
 MAINTAINERS                                |   3 +
 hw/remote/Kconfig                          |   5 +
 hw/remote/meson.build                      |   3 +
 hw/remote/trace-events                     |  11 +
 subprojects/libvfio-user                   |   1 +
 tests/acceptance/multiprocess.py           |   2 +
 tests/acceptance/vfio-user.py              |  96 +++
 tests/docker/dockerfiles/centos8.docker    |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 19 files changed, 1151 insertions(+), 3 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/acceptance/vfio-user.py

-- 
2.20.1


