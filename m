Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0E48BC26
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:06:22 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7S5l-0008Fh-Rp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:06:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Re2-0001Hn-Pl
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rds-0005iZ-KW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:35 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMrG6j019928
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=9RW1PZaTezRbBm/wG+ja+GigDIAUAZDrU9I5paPvO04=;
 b=AjVVvajLOVyqOM9DQsqGM9E+DwCSWmD59C9l5DnEF2DNcUJccTzJp4s5n/6788cXrpeb
 nFMBW4BPxymM0jQGAfjM+grFJaplmlP7bmnRt8KMXsTdXrxzHu2ZO5AmNePyw7Cw4AsK
 3Ud2hDHxme1sqFaSrw+jGmmnu0ZI3sG591iG0kLvvovC/cAS8cf2C/qSa22+a7bLWPt+
 jro9zsJ+XLjdZ3BxgCxgHFfjrkYCB5Y+KdaH00XF5xdb8GoZJXIWILn2wowpQYcAmo4d
 XR/hDU42RlA4zbU1eqDtcNuiaErl/rXX9Ekz+ae2QsU0cugt75c36Lg/NfI6T4Ne/3qa 5g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KAjD069368
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3deyqy1gqq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dickoNd0nCSQBEh6qRZqft2vIw7DxmT6aY+u2cigs6FFt9CjeObpvCgXN1pK65+hmzKaZwcOCRFKWqOnIcO+nYvI7eIK1VFIlNJscV1rZJ2uRVGcMCkZ0CtNqg5K+VxQrnDEeiGdR77RHi64JoogL9eDnagi5tVHj/SJAmVhme/IbfLPSint8CgM9EVtxP6mn0rinK+2hMCFYpFkLWrb68/PD+B9crjRBrsGxSOzaLDtIRb4BXbDrTLZO3j0FDC2xmn0s45DUqVnT0oShWYSLBqFbz4kLoYgZRT3lo9fOIVH3HcDcj0r8gJuzTFAH/jbDyCw2amlEoeTVhtY3JxJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RW1PZaTezRbBm/wG+ja+GigDIAUAZDrU9I5paPvO04=;
 b=QMh4CQS2Jla/wGSRBAvW3pb1xfkCIIbnShUBFysRl/0xaoRzKanQUFKEXWPM+JZ6MUlRWMxwiPeGjt+ed6gkEbrrc6Fp8FENWKCStzlzqG31/LHC+iw3wfIja+lwivUhwGKm3VGSnoNkuo1bXuYLRWAI0lH1EVPrlDTQPCVNJ1U/0eut4TR1ugbyPgNPEwAsp44MoAWe/rdkLDAdHg3OA/6Hdh2TbkBDAtBVorkpeqzKwQmVZdSHxYyL4jPvGFE8C67mV1HpAhBH5d3UpNm3sXzwQZKKmXcxRwj+VUmyWYUlnAUtUe+m8iJm4vVN+MQRVBz0y/qpK4H45RZOfHdORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RW1PZaTezRbBm/wG+ja+GigDIAUAZDrU9I5paPvO04=;
 b=oJAXOsMavEqRqGN0zGoeYXV3usGWAxzPikoikmgIS6WJb0M5sV03Hwbf+zU/1SgppBxK0ehoLoZGli/EZImIbQkN02I1eHD/LKqxJLLzMLTG9Ap65rJyyauSCQS6TqAoL3gb/GXdqLQ+gn+KrJ6bWaUeNAvz7teekJcYiSFkXQo=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:09 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 21/21] Only set qemu file error if saving state so the file
 exists
Date: Tue, 11 Jan 2022 16:43:57 -0800
Message-Id: <658c75935969a51090278519800ce729ca54ce81.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0c73d52-7eb1-42ac-241b-08d9d563aae0
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742541D6F5F20B23C7FF321B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCTQOHGQyitT/TlNXb8HUpIQpz/5ZSMfIgaeIP4rHNge3FKq5L5SKcUZJ4WVRF0X7dDd9lIm639c5QWRiZ/3UdZETxfEEX91AXuJ1pIBsHoYYRKWSr4IsLeyBS9DZ5Z6eHrhq1CobzPv13rXgfmPdNZCeWOPudpu4ZrjnSKw4qIkklwEb4yTVYjxTqAAKoZgZD7GS1NcRSc9w/xMD6CHjUgyf8lDtGV5txuOGzW2nAkDKVZQw/NUgLCH5tJJimE4V2Bg/15SkP/DR0iyZLJXUGUezo3pO3Ffftr6VaGGKa5PmpHVHgbUJU7nJuE3J8r5c6ISzGwoOjFdhBXPyse7jtXj11gu5WzsIu6tklAxk0+hXkd54rwGMzT30vN4dMHrVgRmdtW2iDCK0RyeXVvbj1tVBG1ai0mjJcP78N5cOVk1BCTkCvHnUAYfATM/0GBHsc/aWLYhLlZccMzmYv/U4M3fcAvM73qXK/VCSsVm7N4S/9auNtlWvDdKL8hop34Ag/lhsnayPcvMKd0BwDlj/95+JxHhOKnd6TxG3PVZXHZ/DJz1U7iOGmWm2etQ2Q+D+F4PvnjfiTfRojGfPoowiDSQHlcngJMOYVUP4OWnVfTiAa8/92CPUajrImmYJ/ez8QHBQWhkJQ2IxqXyyEv2fjTqQAWaMEgT+4XLCgfzKNquyvFu5aTRSWf+cpcqcCrFaihkiC2wq7nq5F+nXZeb5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(4744005)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YcZyehjsolyR7ZUOFQKyTyzoiZNZ9sjTk8R5dAZ/vSUci7N6kIGUObH3m66K?=
 =?us-ascii?Q?3eOeyGeAV3wAQngdI3Mh6HUGFT2PuleGrsTcJSe74rEjnuhhad44npv/2l7Z?=
 =?us-ascii?Q?kUJOR/HfOShVyYNNOIHrmGwjw/fBjnXljOA7rrFvzbkg2f0cv+11Y1BVGwrK?=
 =?us-ascii?Q?1ufa2+mxZQdHy2d0EU9z3sME01n3nzgN8VX+qdw//f61FaumKdCkcmYJWvij?=
 =?us-ascii?Q?UXIjVJbJTBZBhTdBPYjFw7qQLhTOopc4NZjfMuRgdBoTKD2/jcFHeeI0zpgy?=
 =?us-ascii?Q?6NmTYcydnOLs5ue9xyKxhGrTS0cLhR+4YX+YGrHHo+ZooA5to3l+ih+wF3uc?=
 =?us-ascii?Q?IxpKEtK9rZHTBZ9QjWhAUNRwyiR2M8IlqWUPsrqCNvzvqkI6FAJutkQfLSBn?=
 =?us-ascii?Q?guVVn18wbC3eUXTZMUlqQU2TATg/mHNaWVZcqqEyu4As4NoFlOGpN7jCOLGf?=
 =?us-ascii?Q?G85iyiZJgwdwkRGKG92n9eG5A/QXs6Q7GHBACMq+yn3Bfg4pE2USmAu0uPLm?=
 =?us-ascii?Q?KA0bba4BTJhaSPqRtP5bsJzrcZ4NctHnUm7E5zy0AfxWIiJJesuMuVQWKrXS?=
 =?us-ascii?Q?sBB/kP8whDvuC4HMsawxDbdBTSz4NkUuNd+AiULJ7iBiHFayCLwO3of/nZbh?=
 =?us-ascii?Q?6VtFkRjI2zj7r4iajGHApbOnpTfU/nvRJ3yLu8YqFURLoRnJLFmJte41bgPG?=
 =?us-ascii?Q?xDzseH3JGxj75gRb61As6y6PR9vvl3NU+vl9vVav+g21mMYbRPUAAarbKlZf?=
 =?us-ascii?Q?GakYJVA4uAgVPaDg2L6kvE7c5nHQlcHbOp2Rda5G2J908KMmqHoMb9NufK+F?=
 =?us-ascii?Q?BgJec2LFV8vCAqmBPBaRQvVnXBnI7ZI00VV+u71V05JiihS6biHlWpzbHv6J?=
 =?us-ascii?Q?9DcFnUvt4iLrgmry5TEwYBLm3b2rbdVW6EOqHtPmAOIBXefeISGy3wEMNF23?=
 =?us-ascii?Q?KgV81g23QYPenK8bKvX1diNgPtbVQDrWOjRednxPqf6LIFgLNC+OShDuATnS?=
 =?us-ascii?Q?piGx2kzWc5aqK5SzxXU1pE7iLme/7YlplbmERAw6uPN/w8aHie7XaprNtt1H?=
 =?us-ascii?Q?G7UFq4Nngxxa6bIXL7/fesdjEO4SRMKxo+sRt5JhmDVtsP5KFGUHNaBmmpMV?=
 =?us-ascii?Q?uOO+NshMTs97zLp2z0c941SCIOq8+J3CsIX/xMkBYxMQy6IxQfD4Doa8J25H?=
 =?us-ascii?Q?vWaaWC+ux5AoL3VjnMIyF+/+P6CbRj+zlPlisSACL8yk55KERQEWyumnKV3m?=
 =?us-ascii?Q?8c1o6FUtu5Ye8UWyvus86gy6Wpm/oL7mNq4lEWc5OZb9nik3Obj/Z3oucsR1?=
 =?us-ascii?Q?QIsO/qBbbpJ3zWFL/RBDIHVJ97mcGnWKZOIFmv26yhHzZCVtbfWgjOXfvx5e?=
 =?us-ascii?Q?y+VQV4eWnJuvBl0L6SqU2KlPeiIEt8H713ELwd9C3IkcrxzMgMchQgz20xO0?=
 =?us-ascii?Q?ye8uVjgOVvcFO+LdX9IeolUEEejSWT0uTi2Q1K3zJwbwXlcPzN/HNosntNxV?=
 =?us-ascii?Q?Ltt/TrZ39y9nMykVWBdUrHdriKGjUvGpvWKyGM8liNLI3Z4STNx5gYtGQlz9?=
 =?us-ascii?Q?nTustZM6JWtNagmuiZjmWesOCEuevYTFn7szgPUr8SE0E2f61A/ANzFBMdRQ?=
 =?us-ascii?Q?mOnLVp+4Y0yukv8cFwmsmCaaJyjILfk2nPSf9n5+xv4IN53jPCDekJMhCvXO?=
 =?us-ascii?Q?cJL70A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c73d52-7eb1-42ac-241b-08d9d563aae0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:09.5867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3BrDEdUCkgq2tYpKkt+XBQM0pk4HW2Vs4gsnDWJOVfuJnOIgyyV6y6ML/6W72Q8tkVxV8U7ftnHsTF8ZryDK1IJiXZNkmwMqZ275JUxFjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: AelyXOU9bOqELWdZrszv1CHzLVjA7Mgv
X-Proofpoint-ORIG-GUID: AelyXOU9bOqELWdZrszv1CHzLVjA7Mgv
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index df63f5c..e72241d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -742,7 +742,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
                      (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        if (value != 0) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-- 
1.8.3.1


