Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4063346F2C8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:08:00 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNpn-0004xr-C9
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgT-00088z-Mk
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:22 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgQ-0002vO-FH
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:20 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9Hfjvi028298; 
 Thu, 9 Dec 2021 17:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=UV2OHrtAqK070qYO+KjN8z6SovMmC82NEbwQcjBFMRo=;
 b=VYPiwS4Gba0F91FRaaBk62DxS/zlGiwyDqMRdMyQ/qv8K2Pv3FZxtuMHk4YAZ9kmJGc1
 pGNEogzOQYj3ghP5yKU7xWxin0EkZT2g0hOgybuUkogXlw/+R6Z2BBL+k2iZnwPnVNmY
 2U/axNmhBxoFL57HejHbkBpAm22RXWR4LQMH6dv2ap5wppE1uD2J+SPSj789aHGY2mYi
 2aZf5lHdJotNHF7s2KtPXzZ/h2EYUbOCNd8bzbTI4xLt8doLkN+iUCuTsMxqqcWn5Wwg
 bXgaldQ8tmN0OnlgibToEw19i0BynnH+sePxRkcRtrzBOw3sKqPjArkG7v20SjbXAhUq 5Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctse1m2un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpIh6078905;
 Thu, 9 Dec 2021 17:58:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3030.oracle.com with ESMTP id 3cqwf2j2ed-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgdYSz6nZAe3dIeZzhOxgPfLRoiU/SbHcqLD8oMY9RBSHirL0YJoRGcQ+qYUvWQnOe9iGeewf55lEDk3eogyFzXa5/BEK2BtWwmOfCVBp+6h/cw7dEBw75g5NuC1aVml5uEJu3UEu4oXYHb7F+569LgZdAWvJag6VyaHpMKamsdKdXcK5f3lHWIcV3BPSl6Km4aF6i8+hkVvHnCeqhwcjIly18AIqWJ2hrinijykMzbO1vSLfUCREe7VxkIvr6JCFjO84fXX7ohizxIXB3rnqgGzreOM2Z0zxIKQ+dMcwGiZvz6g5kgDOb/997hshjQ++eCxFOIWiVLev3acGI1G2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UV2OHrtAqK070qYO+KjN8z6SovMmC82NEbwQcjBFMRo=;
 b=MmGhhXTKAWqvY653TH2m9yRMkP3J5hdTbyydWRoY3xmcNF/4T25hZ7cRTYeI2joMmlbv2o3K1SKTFAe1bYjlKQUc/rwDY6BUjq7PF0Deqqpe1yia+uxMIB3lcynwfjft/DHXvllQsq1tdEjZ8tb8IyUP3a2BmRBJ8ImjJt160TZo7a7OqHNEUaPCQynQ057J67FoOuipZP7XPqVDnb7ZzAiR7VWoCks89D44nOzl5k7WdQiaOjrB4nJcQFhR7FmMcypxsE74I/ZsMisEn6w3lZaRr/wImIGGYwkX/6Bn3cTEtNnTVSi7NsBKR/gLKG0+BgInfMk1VbRk2t0XPEGtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV2OHrtAqK070qYO+KjN8z6SovMmC82NEbwQcjBFMRo=;
 b=D0BslANr+a6VZ8Ju0zX/mLGclztzGu/1O0oFn9kNvJDY1DAE0H0M9RcRNoMsJPkxBUFCPqccj8z0/glgCglonEl7+bRUxMBXq9L2DFodSNv9n4GT5gj64fyDQdB/D00wxO2uTyAtlCjvKuTcSkq8I0GPcEWJInC+yLuCPtAstxU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:11 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:11 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Date: Thu,  9 Dec 2021 12:57:31 -0500
Message-Id: <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03f5ea39-679b-47d4-09c5-08d9bb3d76c8
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5810F03ABA0C833B3338DD8697709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05f0oMhFkIhkdHXwmWZ6/SEIyTmxmul5teJdm10pH4U/54UAy11JRlv0u1dD4o8NKsD7Mr0GQJek3nmdBGngnaOwdN4+Rkm/tKDvaelG6bIAPXd9wuAGfz3Uc86uOoF8urWDCHLoKj/M0niy3f1fIG/q6uVCw63f6uMqXkkkmIjxYYHcEa+G3OImYMCOLzC8ryYPq6AU8nYweb6xW7rw9rs8ElHEAkXrdYr6fHf1Oz7F/+QHpGv1wGNCpTylbGH9xsLblBoyKgzTbS+vjmWBYHEH3Y92BV2SQKY58OdoHTNecuoOdgVRKHoEsqA81OdgvgwxkLnEEsaORuYRz52WSh9y2kh3dlga2N3Q/e03nnWZOJsMu+ploRRl6nYVVpC24T5i2i53203xcf5E3fmFFoXys9Zam6XhlBsFPh+mwk6WWJcJ6huESfLCLmCcf5D9yBpHzrVj05G/g23pwXfnAN6ZfhfgeA55Fdjq2DbkrFy4/du2r/bCHY8UNCOZJDKh8xV8Gg4vtjTnKOQuEr5t6GsLy9dIN1cHiM2468o1362/3K0GJRf5vmY4vNbGVGf+p9nz6kwltI81SHSZptL2JOxz0iD2abg8L1NOy+ns89EOwbUv9Tb/PXQSHRciFJkTyBUsmKx9tqWzW80YF4f3N9/C0K+YUnjDzo96fOhhdLE2UoOLdRH28UkU/rvxLnw6NT/MzuIuRMyZHGRk4D4G3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(52116002)(38350700002)(956004)(83380400001)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FcCG/gwTQ75y4Jx+njrDYWv79CW/3KyzuUVfzm+UiuwgkEKjwKhwyjLKkz6n?=
 =?us-ascii?Q?mG5bIXxmBFwqtkXbY+joxkL7BFSBQ9mf3SOtfPVCXEni7xjIz/bkN3jl9Tt/?=
 =?us-ascii?Q?I091oqPweYGCG4CLQWLEBHr2RQ0mh7Rk0Njs92HK4qXbC9YzU104bVO/5a7o?=
 =?us-ascii?Q?DRKappeR6hOdHVqi6FYvVLtqIkkyBZrKGgT4jrZ+tFoTgyAjPxZmZPkryWQB?=
 =?us-ascii?Q?30AXAXkXJneRzJjPVSAKiHYw+sEqk2suCMS86wmOmxNIdpOz3KSQUAxg3GdR?=
 =?us-ascii?Q?+lLDTXYJIPrzoz26w2B5Od5Z+kVG5o61s6vXp7rFM9H9c15PLIwfGJiFMyvo?=
 =?us-ascii?Q?wdKb5TdkIFBrx+0f3VcrX5QCpAGAJhk6VYKLSMDT/DjkoP5K0s4BGs+BgQSO?=
 =?us-ascii?Q?IGiI4xKAAe6/Fx8+DIiM52jy2kho5GMjLFJkcs2CB5sKqLFm5fCoXorn0O8m?=
 =?us-ascii?Q?0P2VcPs0bZpMjC2shu+iG0VWyIzfzrK/xkAIIKhw6Lkn8H/RROYfzQnK5ttB?=
 =?us-ascii?Q?ko1w1bwyN+HaYtWMoCwYtQ09RoB4Hw4w+RjaPlCjSLLO+2NB1wL9pyfPWImE?=
 =?us-ascii?Q?Bo7y96wSL2SxAw2gEsHRzrtR3y+E7RNSvzRHc/ZvN05NCYC4MO8+w7Ua13nh?=
 =?us-ascii?Q?LrM7yEUPY40r0J+MSVhIaX8I6+8MXZbnJlf0XHgA3FQj7paOzvLvQssGn9l5?=
 =?us-ascii?Q?v5jCNKWY7vXD+Is3jYDYLaihGblv0ZkpDKvolGg+wqzWR8ePh3GIzxFTmx1Y?=
 =?us-ascii?Q?9xQzqFWtZxxQ8EswltsnkVWZiq8dW6Mi8+Bs+/hGSQcS3rG0B4AUY+8aUp6Y?=
 =?us-ascii?Q?X3P2P+9lk7G7m0nlwvmxSaPAvVFCeXIg0gbaOF9UGnDQPCHNY6ivRGaNO3qN?=
 =?us-ascii?Q?8awT5JFdCMTeg17QD630A9RebRgoiD6FLXKZmPPF19pjBIvDEkS2usF05tFl?=
 =?us-ascii?Q?EYRx/GYJC6tW80J1PI0Ea6F6VXiTgYvX2++EFYJn1PX2UAPBFKvv7+ivlK93?=
 =?us-ascii?Q?fGHR5HBpDs74ySO2TRcODzMyMc9+pUs72h1B1M/iP/AQXjp/r9u0gCur9b+I?=
 =?us-ascii?Q?RaTLQgJNoJzNuZJKgtoX54D3MK9Is6JjLKWDWbkob+tqjXlLc1CH86lq4RcH?=
 =?us-ascii?Q?uDJ6mWJgb0EHKC+/w9gvlOD3LlnHpENuD7aX2qcNa0bRqOxvBkeXofeSVNNJ?=
 =?us-ascii?Q?04MqMh3J3u5XaXSc915JCYHsza2iOxdHs9gP/756BjKiheWMcE/zAwGELMIY?=
 =?us-ascii?Q?0fzooDbyrJ8fZF+n3bzy366PmkAyO4ee3w46jUg5lPg4CNF4iEJpkETfoJLA?=
 =?us-ascii?Q?GyG4QzEVK61Km7k44m5nfKFMy11YjQMJW+5msSZ0gKXDnz+lcv0HYvSvMYh+?=
 =?us-ascii?Q?T9/rLsuQ9rLCTVyy9V/HJGZq6SWhS5J7JXgocLnYlk8qIaKCLLkCqv2j/3Rt?=
 =?us-ascii?Q?yYtF8VUMyruRD9zy/bdwj7veCg7n3i9hvqRtv9dQ6DCg/wtvJU+XyUB7tXwa?=
 =?us-ascii?Q?DzxO8qtWMz+poztVmoP8jnbimZLCC8gLFFLw92oKlEzALcSYtMM3RIZ3FRE6?=
 =?us-ascii?Q?EFWiKqSMTvOBGjEZHzES/kE5Adiup2qlpFLiLhVCaXudwC4WcuCEVeK7NFWO?=
 =?us-ascii?Q?ej/gIGykS9zzGTg0kISojvAjLxQtIYYtN6CqWNw4MK6g4Lcw6JmQcBPrUl18?=
 =?us-ascii?Q?BKGd4Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f5ea39-679b-47d4-09c5-08d9bb3d76c8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:11.0949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tug66eRT0quwENsBWCk4RgmzkkOzWX+M7PlqpcbEmk1ScFbj5FLK6VPmB3YHLx5QGhuJfs39PJIrz0x1C9NbPHcTg7Nh1hzLZtp8P/mWs8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-GUID: GmO0MmgL0Js4DPD5Ie-A9XFmapQhBlpm
X-Proofpoint-ORIG-GUID: GmO0MmgL0Js4DPD5Ie-A9XFmapQhBlpm
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index 81f5435..753425a 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+/*******************************************************************/
+/*******************************************************************/
+
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction_entry(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t register_bit_width,
+    uint64_t register_address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+
+    /* Serialization Action */
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(table_data, instruction         , 1);
+    /* Flags */
+    build_append_int_noprefix(table_data, flags               , 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = register_bit_width;
+    gas.bit_offset = 0;
+    switch (register_bit_width) {
+    case 8:
+        gas.access_width = 1;
+        break;
+    case 16:
+        gas.access_width = 2;
+        break;
+    case 32:
+        gas.access_width = 3;
+        break;
+    case 64:
+        gas.access_width = 4;
+        break;
+    default:
+        gas.access_width = 0;
+        break;
+    }
+    gas.address = register_address;
+    build_append_gas_from_struct(table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* Mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    GArray *table_instruction_data;
+    unsigned action;
+    pcibus_t bar0, bar1;
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    trace_acpi_erst_pci_bar_0(bar0);
+    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
+    trace_acpi_erst_pci_bar_1(bar1);
+
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 32,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER_VALUE , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 64,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    /* Serialization Header */
+    acpi_table_begin(&table, table_data);
+
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    acpi_table_end(linker, &table);
+}
+
 /*******************************************************************/
 /*******************************************************************/
 static int erst_post_load(void *opaque, int version_id)
-- 
1.8.3.1


