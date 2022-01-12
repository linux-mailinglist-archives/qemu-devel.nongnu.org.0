Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170E48BC1D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:01:45 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7S1I-0002KI-FZ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdb-0000j6-Jo
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005gG-Oe
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMrYAp025170
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0b3gR6hoVoVW8L3mNtl/IwCtB5oe580IxM/Cd/hGS8M=;
 b=Hl1LUslFj+9VRB9Z0wNxlEZDZ4FZ/3iY+/wpFKOW3aAWvDcpUGLBdjy+8ptHFnWHtQ+V
 4+SWVxjWM/IbM8ODxy+YsNsYp968ugHEP96ZTNNAG6Hx7TOfjt3r+AJU+dlcRuHednLH
 g6Je2F+JOU/RKWAztZ+p/bp+CUChnvj9749veGsnp1v04rkW+lBXqLyCaaduRoU5DzUn
 jTwxvuI+9MLEa+qJgz5PzcfeF8/S48Z+cZ1s3Qo1GIWmgavfH3R6GJv1d6rdvYgxPbPy
 MrpYU9+7/HFQGRmOWta7rEnibkBf2zth3joUXU0OsrgxOkyZeFMkXLeCzylXw24fgsD2 tQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk9crp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBB196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6W01B3er3qNlmsmxjWvHX/+3j8DghRjvslb4BfiFD05Q7LD3fAwdmbA2OV9zl4Sj6I+aRiO1IYC18rL9QKRhlILTy8fu2R+I3YRd1P8/s5uQlfLraA8q4cYd0LU0cDUmjI8WIHu/AoxfluQSmv9qTVIES5T6B0bWvretnMH5Y2aRr7KLAJ6wSC87WqkW3SYsklC0K7dXy4mqWin7j6CizcZq9BZ6H2QZen0TmK/FA1uDlw+508rUtME+Si02895yQSBh4t+E3xWDymrVOockgQ2EoBONzeTC4/FUe4INEQ0qu2uz+isjwvZ2YlV/OGmvH25N4NnR1eqLUAjyX9CIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b3gR6hoVoVW8L3mNtl/IwCtB5oe580IxM/Cd/hGS8M=;
 b=JK8zJOGadPoAXAjy408cgNHM86z4rJgtB1S5Q7ij00yV0zwLCYbw+MOBrEF34OHTuGbaDNtsciejq01s8/Q7hzRGtfnkdze0DvYsMK0uXTxCdrRvgGU1VdsxtDtHXk2GM1pt54B1oyeAmd3tOwwzaXwF08a5z9RmCtuMd6lL3loV0iVMkCZSpjzhQ9X1t93H1BRXTqR64fVWXht98b5eBHPbRf+veh2PUBRaPJ8DJqLeNb05csURfmRqYgHvPvN+qLGHb+bZnvdyYHaYjxCszuhnxa6XWUYiMRrcVLOOLj7xzgDIUnKDyvDeNzuVrJ4BKjVLPoVnLbu8rueto1IQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b3gR6hoVoVW8L3mNtl/IwCtB5oe580IxM/Cd/hGS8M=;
 b=oyCKE7OoTLabsLGP6rif4JzGJZRA9gBnOMg9KoxPTtx7d4dJfNNGlIGjRK4Th2nBuuJkhvgqwm/Hony2pw/iSrzESeCU3PPgphsVMoaAtdbnFq1Fh805hhjegeuOVIoIIGVDMxnebiGptJlFsiEfs+MoCrhGJisQWkgS8y4lKhM=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:05 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:05 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 07/21] vfio-user: connect vfio proxy to remote server
Date: Tue, 11 Jan 2022 16:43:43 -0800
Message-Id: <44372be821c863e3c9a19bc1382e57c443eaf29c.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e914217a-89d0-4beb-1de2-08d9d563a842
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742E27607055287B06F4591B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECraHwzDctX8y4RuK+5F+ofe6SkhfU2xTjOPWYFNvuyNZTuR1U8rAbOFLCFx9l+mDfdv+mYUU1WA1/0COeXTteLASAQvMCgqBdUkiXrZ5EVtyUU3yT2DRRZ/sgNJJujnFIYha80bJiIKHfsH9EC0bzZnMOjdWVYFtVBaSRQozYII62V5yW5KUoevUKw6v/f1Pj8cfRHokNSFozfsdi8A6Ih3+78ZUiaGSaMSMNnW5fCrCDWuXVkxP4GaN40YYEBsnlfed3XxQUtUQ8az3EzFJdVtNDrUVTQhkBc/FNQP/4vC6W+SMiT3U6gePEgPYT1vLrfwj/NuXDtvaveSqwAkxjUWtWkxYBDh57X/rnGuPGWN550ZHw/Y0yZ1UGZVRQzYm0J0p7H2+cagKcWt7E+VfzbSw5dvd7y/bDt0JmowEpokWWCdHRdYd9vSh7Wz/OePm0MDcZfkuocVjyl75DW5s41nHqPD9X7jXKUCKFNaZhntOSTmw4+AmciU6mlh+ri9Y0T7hn7+gOW/iWqeoc/SYUq2EoTyFTshqE8TpOsji3kvKr6xGFDSwIg1JfmYJT6OzrKSkkUe34upK3n4F1MiAg4wSoC4vt0yFYQgcvDMiVfNcgh2KaeVnQ1bQ/A66e2vxFF3Ah6+X/e4T1sdkktpbfcL3U40FGDy23stdNQweN/hmOLm/nSqxdLGw9g7RlppjVIlmwSeLrV38SrAZ0ov7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1yTWxKNkxMUFZPSEZjRWFrOGo2Q1FGS2tMMFVLU0JxNDN4Nmx2dFdSS2pI?=
 =?utf-8?B?RHZxaXprQU9XdnQ0NGoyRFZOcmRXdWlQcUtUZG9HZmlmRHcyYXBLQlZDNUNN?=
 =?utf-8?B?Zm5QajlWL0U0KzM3bjZjbUNyRmxSTXk3aEc4T1p5Zkl3eEdKUzEyTSt2VHRN?=
 =?utf-8?B?blZUSlhQUStIdnNWQjhmaWlkRHZnQU1qQmhpQVl0Tk1tZ090bEViMVZpdm9S?=
 =?utf-8?B?MTUwZjFFOFZOZUhjWWI0TFZiTzl6WUx5ayswOTNyU3l1b2txRDhpa0E4bUxH?=
 =?utf-8?B?WStOQ0lUTSs0UVN1NU50UnRLcTJneWNaR09SRW0zSVNXNVpEbU0yenY1RUJs?=
 =?utf-8?B?VXluQUxKVHRnR0lvMzVmSSt6cDdJa1NlL2UybEJ2dnp5a3VJWHV2UXVxZi9a?=
 =?utf-8?B?TW54V2xneDJoQkNIaC9oZ1NmaDdxMW9SVFJOVEIxUVdxM0dnMndkdWFtS0FK?=
 =?utf-8?B?akpvSUZqbHdBRmNTMVFja3orbExZandlY3Z6ZDZ4bWF5a1JsSXIwR09tb01Q?=
 =?utf-8?B?ZW1LNjVBRWdwdDhSakdLcTM4bWtZWTNzeWtwNk03Y2Z0SE9aZFFpQmMvbUlB?=
 =?utf-8?B?M1RiWlZBdGtrcnYxa21uT0dPeUVDM0hLNE44SncxTm5xVWdQNnlocVgzcmFx?=
 =?utf-8?B?NVY5TWFEdUZ6RUlXK0hlQzBtQnY5U0hyYWNPNmgrekhCNjJ3aWxXeXA3MTdM?=
 =?utf-8?B?QTNlY2djQmhDM29lQU5BYWFhY2FtRDVKZ0l0S05KVnNKTUZZQkRWNWNSK3pU?=
 =?utf-8?B?RkU1TnhnVUkwdkpRNkNYdFZnV0hMMUIycWRhOHphcExvSTk4Qjg3eENKNWtX?=
 =?utf-8?B?ZFBuTWFWckwwRWgzV0ZUUE53RmFrL1c3QXkwbEtrUmhET2NGekIzQTNZU1Ir?=
 =?utf-8?B?bjlkd3BCR0dkR2VWUjN0b1Z0YjlFNnVCYnlxeG5rS3huYjRsa3AzZFVQcFJk?=
 =?utf-8?B?TFhRTWZ4QW9QTXIwQTF1UGsvNGF6YXEvaU9mTkFjMUtxbG1TbkdkR0t5clQw?=
 =?utf-8?B?RkJ0TzFKQStpNjlqUlBkZnJVcXRJdTBCamRJczk2MnZYTFI5VDdQd1J1cEVT?=
 =?utf-8?B?V3dWakpsVGo2RHlhMVIxcTNWclk0bmxmUUxQMDFucVZhblNOZjRocjhtSGNl?=
 =?utf-8?B?NzJyQXRYRUhLWVl5M2pvWVNBdkp1STB0YlBsR2hxcmF5azQxVnBZbHJWcFV3?=
 =?utf-8?B?Zlg2Y1doMWM3SWhXU2FYRytTRWJvT1VvWjhadDZZR2NvR25QK2U0d0xTdUxT?=
 =?utf-8?B?S25JY1paVjVUMzdSSmF3MHBoUlJreVRtaFBlbEFQajcrbE1DSjd3T1BSNTlE?=
 =?utf-8?B?UlNEUCtndDVyREs1aGt6Mi82MXRhV291NGVVdE9BdFdNSXQvN2tsMTFML3VO?=
 =?utf-8?B?cFJQdkpxVHh5SnI4ekxTVzRkT3ZrSW9sVFpmVXNXQ3Q3SmlQSkg0V29qYXpX?=
 =?utf-8?B?c1J0U3Q1b3NKdXJSZGlaWHJDa3dvL2EvM0UwODBlK2RNOVRnTGJrcHQrRWRT?=
 =?utf-8?B?WjNWZnZvZzlKVXVzZ0ZzVXFQZkMrYy8zQVZ2U2x6Rm0xNFNFZjE2R0prWTVC?=
 =?utf-8?B?cTg4WVB1enNRdWlwd0p4RVdkMlp0OURmSk8yaVh0djRCZWI5cno2MUlJWDVZ?=
 =?utf-8?B?TE1obVIzdEF3NlZsekprcWsxUFd0c2haQTB4VmFDR1FQVXpMOWUvWVdCbUIz?=
 =?utf-8?B?SnVhMG5SalJGQXZOeUMxSWtqN1FRaFk1dEhDcmJvcE5xblhkL0ZUK1NuOUNh?=
 =?utf-8?B?MjZCZVBteGxkZXZURGtvU1dyYkZobDB2d3pKaUViQVNWMDBhaGdqenVibm8y?=
 =?utf-8?B?Z1BOd1RsS0VSM2tTRDcrYTJGS3dYZ2tYd0N1K0tySFg2R3Q0RjIrZktkVHds?=
 =?utf-8?B?eXVJRlFXem10TE91eHAvSzg0VUg0bjlnanowRnozd0VOSjJ2SVRqR3FDM0U5?=
 =?utf-8?B?MHptZkZta01UK08yaWx5MmNDYUpoQnVJVm9nM2k0RjNJR054bkZ1SFBrSDNr?=
 =?utf-8?B?NWFrbW9ranVEKzBMbVRQYUlhdE4rclJZNG5rMVo1QXIzaWxRMmlaYm5QZC9r?=
 =?utf-8?B?TVJUbDJMRlJyTUlSOU56Q1VpN3R1VGhVYlp5S2xSempRTjhlaVBVZlNtb2d6?=
 =?utf-8?B?RE13MFQzam5tV29PdEcxamg2V2VVUDhaeklVZUVDa043TmZac0lsWXhOTFZE?=
 =?utf-8?B?ZEtYejJha2ZHMXYvU2ovV3oyQXhUWXZPclRCUThldEZBNWx2VHpraUhtQm9L?=
 =?utf-8?B?REdNNEhzcGtwSTRudGhiYUI5TmFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e914217a-89d0-4beb-1de2-08d9d563a842
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:05.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEXzKXnGpgcX2JVy+sHbE1aHJ+F2sdtDtT94dJHC18r30TF7OxD5i8WkTpI7UyyCNVNeZteOhE9jK9XUQqcIfO7146fcrDb2hEwlufsbF0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: 5cXf_RvFMSEGPWd4memOa5GnRjelpJsH
X-Proofpoint-ORIG-GUID: 5cXf_RvFMSEGPWd4memOa5GnRjelpJsH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

add user.c & user.h files for vfio-user code
add proxy struct to handle comms with remote server

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |  78 +++++++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/pci.c                 |  19 +++++
 hw/vfio/user.c                | 170 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   4 +
 hw/vfio/meson.build           |   1 +
 6 files changed, 274 insertions(+)
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
new file mode 100644
index 0000000..da92862
--- /dev/null
+++ b/hw/vfio/user.h
@@ -0,0 +1,78 @@
+#ifndef VFIO_USER_H
+#define VFIO_USER_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+typedef struct {
+    int send_fds;
+    int recv_fds;
+    int *fds;
+} VFIOUserFDs;
+
+enum msg_type {
+    VFIO_MSG_NONE,
+    VFIO_MSG_ASYNC,
+    VFIO_MSG_WAIT,
+    VFIO_MSG_NOWAIT,
+    VFIO_MSG_REQ,
+};
+
+typedef struct VFIOUserMsg {
+    QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserFDs *fds;
+    uint32_t rsize;
+    uint32_t id;
+    QemuCond cv;
+    bool complete;
+    enum msg_type type;
+} VFIOUserMsg;
+
+
+enum proxy_state {
+    VFIO_PROXY_CONNECTED = 1,
+    VFIO_PROXY_ERROR = 2,
+    VFIO_PROXY_CLOSING = 3,
+    VFIO_PROXY_CLOSED = 4,
+};
+
+typedef QTAILQ_HEAD(VFIOUserMsgQ, VFIOUserMsg) VFIOUserMsgQ;
+
+typedef struct VFIOProxy {
+    QLIST_ENTRY(VFIOProxy) next;
+    char *sockname;
+    struct QIOChannel *ioc;
+    void (*request)(void *opaque, VFIOUserMsg *msg);
+    void *req_arg;
+    int flags;
+    QemuCond close_cv;
+    AioContext *ctx;
+    QEMUBH *req_bh;
+
+    /*
+     * above only changed when BQL is held
+     * below are protected by per-proxy lock
+     */
+    QemuMutex lock;
+    VFIOUserMsgQ free;
+    VFIOUserMsgQ pending;
+    VFIOUserMsgQ incoming;
+    VFIOUserMsgQ outgoing;
+    VFIOUserMsg *last_nowait;
+    enum proxy_state state;
+} VFIOProxy;
+
+/* VFIOProxy flags */
+#define VFIO_PROXY_CLIENT        0x1
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
+void vfio_user_disconnect(VFIOProxy *proxy);
+
+#endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 826cd98..3eb0b19 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -76,6 +76,7 @@ typedef struct VFIOAddressSpace {
 
 struct VFIOGroup;
 typedef struct VFIOContIO VFIOContIO;
+typedef struct VFIOProxy VFIOProxy;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -147,6 +148,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    VFIOProxy *proxy;
     struct vfio_region_info **regions;
 } VFIODevice;
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 6abe474..9fd7c07 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "hw/vfio/user.h"
 
 /* convenience macros for PCI config space */
 #define VDEV_CONFIG_READ(vbasedev, off, size, data) \
@@ -3407,6 +3408,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    SocketAddress addr;
+    VFIOProxy *proxy;
+    Error *err = NULL;
 
     /*
      * TODO: make option parser understand SocketAddress
@@ -3419,6 +3423,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
 
+    memset(&addr, 0, sizeof(addr));
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = udev->sock_name;
+    proxy = vfio_user_connect_dev(&addr, &err);
+    if (!proxy) {
+        error_setg(errp, "Remote proxy not found");
+        return;
+    }
+    vbasedev->proxy = proxy;
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3430,8 +3444,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
 
     vfio_put_device(vdev);
+
+    if (vbasedev->proxy != NULL) {
+        vfio_user_disconnect(vbasedev->proxy);
+    }
 }
 
 static Property vfio_user_pci_dev_properties[] = {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
new file mode 100644
index 0000000..c843f90
--- /dev/null
+++ b/hw/vfio/user.c
@@ -0,0 +1,170 @@
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "hw/hw.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/vfio/vfio.h"
+#include "qemu/sockets.h"
+#include "io/channel.h"
+#include "io/channel-socket.h"
+#include "io/channel-util.h"
+#include "sysemu/iothread.h"
+#include "user.h"
+
+static IOThread *vfio_user_iothread;
+
+static void vfio_user_shutdown(VFIOProxy *proxy);
+
+
+/*
+ * Functions called by main, CPU, or iothread threads
+ */
+
+static void vfio_user_shutdown(VFIOProxy *proxy)
+{
+    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
+}
+
+/*
+ * Functions only called by iothread
+ */
+
+static void vfio_user_cb(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    proxy->state = VFIO_PROXY_CLOSED;
+    qemu_cond_signal(&proxy->close_cv);
+}
+
+
+/*
+ * Functions called by main or CPU threads
+ */
+
+static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
+    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
+{
+    VFIOProxy *proxy;
+    QIOChannelSocket *sioc;
+    QIOChannel *ioc;
+    char *sockname;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfio_user_connect - bad address family");
+        return NULL;
+    }
+    sockname = addr->u.q_unix.path;
+
+    sioc = qio_channel_socket_new();
+    ioc = QIO_CHANNEL(sioc);
+    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
+        object_unref(OBJECT(ioc));
+        return NULL;
+    }
+    qio_channel_set_blocking(ioc, false, NULL);
+
+    proxy = g_malloc0(sizeof(VFIOProxy));
+    proxy->sockname = g_strdup_printf("unix:%s", sockname);
+    proxy->ioc = ioc;
+    proxy->flags = VFIO_PROXY_CLIENT;
+    proxy->state = VFIO_PROXY_CONNECTED;
+
+    qemu_mutex_init(&proxy->lock);
+    qemu_cond_init(&proxy->close_cv);
+
+    if (vfio_user_iothread == NULL) {
+        vfio_user_iothread = iothread_create("VFIO user", errp);
+    }
+
+    proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+
+    QTAILQ_INIT(&proxy->outgoing);
+    QTAILQ_INIT(&proxy->incoming);
+    QTAILQ_INIT(&proxy->free);
+    QTAILQ_INIT(&proxy->pending);
+    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
+
+    return proxy;
+}
+
+void vfio_user_disconnect(VFIOProxy *proxy)
+{
+    VFIOUserMsg *r1, *r2;
+
+    qemu_mutex_lock(&proxy->lock);
+
+    /* our side is quitting */
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        vfio_user_shutdown(proxy);
+        if (!QTAILQ_EMPTY(&proxy->pending)) {
+            error_printf("vfio_user_disconnect: outstanding requests\n");
+        }
+    }
+    object_unref(OBJECT(proxy->ioc));
+    proxy->ioc = NULL;
+
+    proxy->state = VFIO_PROXY_CLOSING;
+    QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->incoming, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->free, r1, next);
+        g_free(r1);
+    }
+
+    /*
+     * Make sure the iothread isn't blocking anywhere
+     * with a ref to this proxy by waiting for a BH
+     * handler to run after the proxy fd handlers were
+     * deleted above.
+     */
+    aio_bh_schedule_oneshot(proxy->ctx, vfio_user_cb, proxy);
+    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
+
+    /* we now hold the only ref to proxy */
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_destroy(&proxy->close_cv);
+    qemu_mutex_destroy(&proxy->lock);
+
+    QLIST_REMOVE(proxy, next);
+    if (QLIST_EMPTY(&vfio_user_sockets)) {
+        iothread_destroy(vfio_user_iothread);
+        vfio_user_iothread = NULL;
+    }
+
+    g_free(proxy->sockname);
+    g_free(proxy);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 1258e11..cfaccbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1903,8 +1903,12 @@ L: qemu-s390x@nongnu.org
 vfio-user
 M: John G Johnson <john.g.johnson@oracle.com>
 M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
+M: Jagannathan Raman <jag.raman@oracle.com>
 S: Supported
 F: docs/devel/vfio-user.rst
+F: hw/vfio/user.c
+F: hw/vfio/user.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..2f86f72 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'pci-quirks.c',
   'pci.c',
 ))
+vfio_ss.add(when: 'CONFIG_VFIO_USER', if_true: files('user.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
-- 
1.8.3.1


