Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203146F2C6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:07:56 +0100 (CET)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNpj-0004pz-Gb
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgM-0007vX-6W
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgI-0002to-ME
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnPUt005463; 
 Thu, 9 Dec 2021 17:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=0e5Rc7n2hcUWJT3di9e1iBinq/5yJvhOjriHw6oQCWOXl66hyiMxIJSSElyKudL/qGOw
 WZLDfc9JZlWysRV83eUI8qSyx95oQeanLaZ04Gs3pw9WvBX7ch5eprsePOEBESd2qZUU
 RVevXTEafqhkcndOpj1DwIPTBso4cSqBsvQJM/bbYtyGN5icmPxatOhfm5xzTdWz/1tf
 zkEvCLwxtgrHX/Yx0Gq/tbE2h+TABU2iSQA0ngA/MSmxqCZsDLNQsd1OjJeU2G0M5w+t
 b2u6csgmfxz0c0QKCZerzV4xj+sAHI5jflcSzv8W9nPhETH4ABdX4TjFcBJKSlLIKbJt Gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctup53sx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpWp9190098;
 Thu, 9 Dec 2021 17:58:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3csc4whm9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B50TsM6Dg5+5LzxBhiIGXXiye7qEa3CsCwjDvivwJZhsLHmLQGobEebp+jbezzid/APTjn2SKRnipKTICOurvUPsXK+ONbB+teKrMh07i8na3Z7q/cD2LUm1wzsb5UNgPCYRpa8hwEmEvfYqoBrDwdTr/O2dt7EKVJNiac6WGNgeRurD6VxtayqSroI00PY0DwOot3afaw2siYEdGJ+q6lfd0EMJ6UAsn77zv0+lRqimuBmAjXaA7DZ13rZeE35YTibVWsU1Llmo7Tgwh9CwBq6CRez0NyhXPPuqa7vCvdoyXTuzTiiHtYpScvpw7tuUctPG9BYPYvuG4YNT6/pOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=aF0OXjVrJ6XqSfukOqsiRVWbkhWBsHPeDLe5+xZlizbWKSnqntnRNIerIZO8CxVvfkomJqUbyAkhOBy24wodcdHGxgzHlcZy82g+hvUGo7PcEtdjKFrL6mCh7PtTbG+yntpN5J8mhOIPTT3HnQK1dJLDQMFVu5kp3opiPomBgOQBfbSBvO2oTghzHjga3R+5/d5kViMNbpyMqj5Bc4ziHRE9BAkkycNpC3HHbMYBvZvRF/Ou8c9EJyd81uEyS0uHgacLqQ8D5V7ErF0ABENuphk2qErgFHHPitdwzWvXpHHuPNt6LQ7cGiWIgWdkxd+0AfdXjLnFc/MIhXnt0VJqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=fExvqteJQlub8/78rU6SixWm7UHzhIBudg4IwXX0vayFxqQwlZS9D7u7cSGQv5yDAhw39GUz2n4vCxnY6ZDGV4fMpupXR36yAMPU7IRUwDev/p9cIX9AZ7R6TLpVwub8JP0NMMPhvnnFy0TzOGh/T+lXyJvGedsAJCDXl4X1LTU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:03 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 02/10] ACPI ERST: specification for ERST support
Date: Thu,  9 Dec 2021 12:57:27 -0500
Message-Id: <1639072655-19271-3-git-send-email-eric.devolder@oracle.com>
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
 Thu, 9 Dec 2021 17:58:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98dac934-c6aa-4af3-a896-08d9bb3d71ef
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5810C2E4216D4D44E39B645197709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qDE/6Y2ThB9T4d5m4p8EFcuDfqp/YiIbzUxeX8OZmYTay5B+gvlmMAKs/xB5TUuBGycIiI/hF1Vr3k084kEwbwseMIFYZ1lP9oKYmKLAuyULUTgCHkh0QUjRLNqdtw8lS+p5Tn7cj7RgjqNSkQ4KpCiBbBQ/q/JfTIOoGmLHS0gx8TXz0F7U4+WFRh3q573Z+bemBseVN8X55Nouk7JHubC28KYs7k+646Irtlc9ovDc1pIYJlI4ZtylgrBO2gax4u8V5WX7R7G4z1c2K4/U4k7H/Vhu9wQSnt1qP7HjpbMPk7TxcJs8UOOqpLspaLW42kQaxGUqetw8UM/Y5EeqCpt/7cwDCDmJhFYcU9DovGOrciBy4Z6AHP+xBLyv1W8+cxJQGWKrDlv8yX4tBl3SjmiEdept/SQFw9xaXXqfclTYSe9XALB59VO4zxykkKMCFYT+chccaEY1i0emnwlMXaFgyAgB6iQqpKoMuXBdWBOMPq5F9U0oiqlHqK8aM7Z/PPkKNkvJrxeUk/n8tfkAeajWKjL0uR9erVKwo6vzZD8JVgJJuxKWfldGnsoMdyxQcAMDrviENQkn+LqpdlV5OvufSHB5e0bvv35UExCgxI7adiBFnOUtjEXPE3wnYjtlMHkyuXQNXzJPQ3X/gCQ6Y44htToGGJxUZFa6fL0YO6WEelioBitXXAlj8hIbewIvTDmQjY9i8m5GotneyXedQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(45080400002)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(52116002)(38350700002)(956004)(83380400001)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I06iD459VPN1kjhGzWF0nxWHCaBwjAIbGC/GB6Ai9UZN27nKg1dugdYb0OjM?=
 =?us-ascii?Q?75KE54X1hmsc5+38sZucXgbZd3yK2NN+o0J2si8uDhnpHCn88YXAUdEp7CAt?=
 =?us-ascii?Q?X8OmKx8K0g/jnCpoppR8FJlTTxbMMgXFOqKnqLlVtRXlXCeb7cL5MnrPkUBv?=
 =?us-ascii?Q?k8csoz363ycf56Rvu4r8jtDVRT9ffHmwn3m40tk+zv0cK824joMNl+xTSQwu?=
 =?us-ascii?Q?XtJoATMY3wwyWfRPY0VWe99E72kwbFM3CyhppdVT7lnRtW1gxMbE4sZ33rJZ?=
 =?us-ascii?Q?h4LrTyEbcybxAX3JK5+uKu1YA6J+mH9tzPNsnWgyTN8W885cu3nRbN/ldOR0?=
 =?us-ascii?Q?W5ZCnSZpA6dhtfu5mLuv5KHUsQDJcEiyZVVCSLlSx6XDi5aTGUjuehLNuxM/?=
 =?us-ascii?Q?B5A861BcHT78lUi2NuHR8AET/rUuMotAVVC0LOsz53iaiQL81C9kXMp39tqi?=
 =?us-ascii?Q?wwX6aXZPCjQdPc1CG6sSQbt7d4/kuiGJoF4SwgK3VGe1EoBRa8LYO2H0/S40?=
 =?us-ascii?Q?kn5XSTQTCtEOje2l69zbPijzOhLKw+Cqwh6XnnLed9m2c/8KuBjlNNjcILnX?=
 =?us-ascii?Q?+//2B1rbaIorHnKvAwC1seJEvRBbjHR8SSpxyOrGuimjmPgnd2kWvnVSXgu5?=
 =?us-ascii?Q?lG+XBYZzXg/HtBUuksjXd4i6RstX1/H9SaX0sJ6y/eUfZEl8AcvO5lsBLRXT?=
 =?us-ascii?Q?ge2P8NtZs7v4tgQxLwToh0ofPzD6ySoP9RHuEDT2VbdLYurKcBwNBt9c4oHx?=
 =?us-ascii?Q?eSDo0WFp1YOrnhaWhHnvlI6RP+0Vq4PInJgTntu2befsr2SxiqXOT9DLFXmy?=
 =?us-ascii?Q?cDTthyi6tkOUqZcArdz4urC62uvjogB5WUGazH+5HS4llP40Xfhi1u1inZrT?=
 =?us-ascii?Q?3zzgj1De4q0U+cpGk3LdrS47U+KmZVdyVxfW7u6IayCnm856/W2R4BQls45n?=
 =?us-ascii?Q?q7GVi4Vis4J7eak1cmkPUVM/mS6nliiivp/4vJ9l3hIgrT1znEobOdpw0rYn?=
 =?us-ascii?Q?lbxCMRthCdfGo2BJns2ALb5mUpUlycHb5lEBspCXYvcibhzqmeabQQJ/4h0E?=
 =?us-ascii?Q?8zMuAsttrAWTmGYI5TzWAoNTUz2922veNpLj5Jlx1jqgFXQmaG3bUchUN+RL?=
 =?us-ascii?Q?AqPlkJmnGWSqr8fjF0NBz6PHMbZZUFQAin57Cf3buAhbr3HdxLt/cjpHbini?=
 =?us-ascii?Q?c2cPp03dYRiYMMyq7cZQFQMy7ucuQqioDyjMbmSuelxws06cCtZx0qyD0Eoy?=
 =?us-ascii?Q?p2Ioxlm9T3ncjUIxmL1dP1x7bgSZ2pbFWhI5Ms1vVpQPrviai3JBMpYRFAvw?=
 =?us-ascii?Q?hOkNX7rEuZz//EHyp2OT1Rhrxinu6TAmLnJmXhRP7+srCaJYxPYmy4rPNfxS?=
 =?us-ascii?Q?elcwAKkznCt8kHEgZCxfjv+irTjgaIKL8vd6QT9dM3fFlRqgxPOmVjki/377?=
 =?us-ascii?Q?mD0x2ARLkotowPN//JHxmdbzeTHVhLyjQXQePO5OVqb0eZybQwMWfrTYLNGa?=
 =?us-ascii?Q?oE4ULLjfkPXWHObvReXcGkehgB5w5xsiqoAuTEKQme1PpVTQyltrnEWIQVKi?=
 =?us-ascii?Q?VyJl0GP7jRs8sYxFI6uU0itCJBXfkFomfFVutnNoH5ZMhHAnADYIu+RFkQDy?=
 =?us-ascii?Q?RrRh0Gd+/N3agXWwMTIyUEoECsz2Hf789TG54wRYkJ98d9F6WP65GD1GAVsb?=
 =?us-ascii?Q?VH8GxQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98dac934-c6aa-4af3-a896-08d9bb3d71ef
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:03.0440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqdATEuCbsX561QxYsL95WPFM51f8SiLl9PEagEHr0AMDX4TNJHbSm5E+rOXdLUjjsjeDqCuFQiNP41bKWsGqRztH5JfghXf7H43EARuGSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=497
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-GUID: 4aEmoYMLVn3qXs1Bf_s8qXdJu8h-Xm9n
X-Proofpoint-ORIG-GUID: 4aEmoYMLVn3qXs1Bf_s8qXdJu8h-Xm9n
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

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst

diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
new file mode 100644
index 0000000..a8a9d22
--- /dev/null
+++ b/docs/specs/acpi_erst.rst
@@ -0,0 +1,200 @@
+ACPI ERST DEVICE
+================
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. This feature is designed for
+storing error records in persistent storage for future reference
+and/or debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines a
+method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this device
+implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
+implemented by most BIOS (since flash memory requires programming
+operations in order to update its contents). Furthermore, as of the
+time of this writing, Linux only supports the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails, and thus kdump fails), pstore may
+contain information available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
+guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
+storage backend for virtual machines (as it is now for bare metal
+machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in particular,
+in direct-boot environments (which would lack UEFI run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available[3].
+
+
+Configuration|Usage
+-------------------
+
+To use ACPI ERST, a memory-backend-file object and acpi-erst device
+can be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
+ -device acpi-erst,memdev=erstnvram
+
+For proper operation, the ACPI ERST device needs a memory-backend-file
+object with the following parameters:
+
+ - id: The id of the memory-backend-file object is used to associate
+   this memory with the acpi-erst device.
+ - size: The size of the ACPI ERST backing storage. This parameter is
+   required.
+ - mem-path: The location of the ACPI ERST backing storage file. This
+   parameter is also required.
+ - share: The share=on parameter is required so that updates to the
+   ERST backing store are written to the file.
+
+and ERST device:
+
+ - memdev: Is the object id of the memory-backend-file.
+ - record_size: Specifies the size of the records (or slots) in the
+   backend storage. Must be a power of two value greater than or
+   equal to 4096 (PAGE_SIZE).
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing the
+programming registers, and the other for accessing the record exchange
+buffer.
+
+BAR0 contains the programming interface consisting of ACTION and VALUE
+64-bit registers.  All ERST actions/operations/side effects happen on
+the write to the ACTION, by design. Any data needed by the action must
+be placed into VALUE prior to writing ACTION.  Reading the VALUE
+simply returns the register contents, which can be updated by a
+previous ACTION.
+
+BAR1 contains the 8KiB record exchange buffer, which is the
+implemented maximum record size.
+
+
+Backend Storage Format
+----------------------
+
+The backend storage is divided into fixed size "slots", 8KiB in
+length, with each slot storing a single record.  Not all slots need to
+be occupied, and they need not be occupied in a contiguous fashion.
+The ability to clear/erase specific records allows for the formation
+of unoccupied slots.
+
+Slot 0 contains a backend storage header that identifies the contents
+as ERST and also facilitates efficient access to the records.
+Depending upon the size of the backend storage, additional slots will
+be designated to be a part of the slot 0 header. For example, at 8KiB,
+the slot 0 header can accomodate 1021 records. Thus a storage size
+of 8MiB (8KiB * 1024) requires an additional slot for use by the
+header. In this scenario, slot 0 and slot 1 form the backend storage
+header, and records can be stored starting at slot 2.
+
+Below is an example layout of the backend storage format (for storage
+size less than 8MiB). The size of the storage is a multiple of 8KiB,
+and contains N number of slots to store records. The example below
+shows two records (in CPER format) in the backend storage, while the
+remaining slots are empty/available.
+
+::
+
+ Slot   Record
+        <------------------ 8KiB -------------------->
+        +--------------------------------------------+
+    0   | storage header                             |
+        +--------------------------------------------+
+    1   | empty/available                            |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+    3   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+
+The storage header consists of some basic information and an array
+of CPER record_id's to efficiently access records in the backend
+storage.
+
+All fields in the header are stored in little endian format.
+
+::
+
+  +--------------------------------------------+
+  | magic                                      | 0x0000
+  +--------------------------------------------+
+  | record_offset        | record_size         | 0x0008
+  +--------------------------------------------+
+  | record_count         | reserved | version  | 0x0010
+  +--------------------------------------------+
+  | record_id[0]                               | 0x0018
+  +--------------------------------------------+
+  | record_id[1]                               | 0x0020
+  +--------------------------------------------+
+  | record_id[...]                             |
+  +--------------------------------------------+
+  | record_id[N]                               | 0x1FF8
+  +--------------------------------------------+
+
+The 'magic' field contains the value 0x524F545354535245.
+
+The 'record_size' field contains the value 0x2000, 8KiB.
+
+The 'record_offset' field points to the first record_id in the array,
+0x0018.
+
+The 'version' field contains 0x0100, the first version.
+
+The 'record_count' field contains the number of valid records in the
+backend storage.
+
+The 'record_id' array fields are the 64-bit record identifiers of the
+CPER record in the corresponding slot. Stated differently, the
+location of a CPER record_id in the record_id[] array provides the
+slot index for the corresponding record in the backend storage.
+
+Note that, for example, with a backend storage less than 8MiB, slot 0
+contains the header, so the record_id[0] will never contain a valid
+CPER record_id. Instead slot 1 is the first available slot and thus
+record_id_[1] may contain a CPER.
+
+A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
+slot is available).
+
+
+References
+----------
+
+[1] "Advanced Configuration and Power Interface Specification",
+    version 4.0, June 2009.
+
+[2] "Unified Extensible Firmware Interface Specification",
+    version 2.1, October 2008.
+
+[3] "Windows Hardware Error Architecture", specfically
+    "Error Record Persistence Mechanism".
-- 
1.8.3.1


