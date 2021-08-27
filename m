Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD13F9E5C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:56:13 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg5M-0007hy-3a
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg39-00056i-OP
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg36-0006lX-SS
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:55 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGaM4g013604; 
 Fri, 27 Aug 2021 17:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nk/mNJJOF9JR+QEoTONQvGTOCsWn6uIcziEOqnTgdc8=;
 b=CxWrXRPlEVeNnn1Erv87eIWrSutMPPIsKfzejbZh5g+SEURDKCOaxHHtCwkSDC2xAXhj
 e1a24zfYscxcE0xb/jxNSk+NPmyE+O3W5oiQ+z7BOS1bFxWSRfx8Mo5Twp6oaOEOfF5i
 AN5SgLb2thY/ckEmM1jiPscw87iE/LdI2cjQ0QoRiYeCPj2kgEUmhbvWK4FR1eMgOdeA
 b2Ky4MWgJ+FTSCptBp1w3avVuJ7QvF6T8eumgmdpWVtFR7ihdj5NZLcz9Xls99q/MmXU
 86LjFyB2SUbQtKYkGZeSSrotyFJIgERsgka1A5PJlfR6PrqoIf/BW5ZDcvQCSLHjOoqO Ag== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=nk/mNJJOF9JR+QEoTONQvGTOCsWn6uIcziEOqnTgdc8=;
 b=lujw1nIXtYyyZ1TaGWZOR4joHlkDeaO4h76j16Mj7UOsNagdc10QlJgCmDHo1ZYWNEOW
 Zy/91W+CaoQbtAqq1prnGLhsgUSO82tBTbPq9gpvlFh7xWbq5hs164BmF8fNAYGOKpOL
 hV/J93e800ryZ4BBwj6B85GVme8yvIzvj/ZVZNVEJHTy24OxvgOo2HxIEwYe9oCtr9qU
 16zheqKqs+rXlWpGvp/9FqD1cANtkVm+n6MGVGFx4unEpjJ0VErpaDsqJ2AhBUy/NGIx
 3CaIApkqGbLJCcHkVZxRnWcJm0n8MMBBM9jCFSJqHOwbt6gP192Qf5jJfIN7LHlLHhQq rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap552c622-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnnPM173202;
 Fri, 27 Aug 2021 17:53:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3030.oracle.com with ESMTP id 3aq2hupwfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FS13T8FfOLIl71ppGTd+9rBbStcTidcdxplhOuSNr508w8kWTj2bciq14BD4rpPlg8p/7Dc3KcmDs57yq3sLTeo6HjuS6aa8KKPNVsFENUOOecFaiSizGOaJWPZnHU8XfZYUTHMut9elTshpscgDbhhCXcYrpZxclgblubKv9aR0iDVlTrftV5ArhS2//nTW5RH6VSUA4vb0EZF99Rs20hMV+8eDjL/aYNJce2yyaCkDp3A9rjex3p3yyt1R6i1EYraGC7qnbE3Styl2wHtSRReuSLs373oz+1PCE6XjgD/qCYoWm2rq93PGi7Twd2RB2f0ZGIgoapynAF3lPCqlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk/mNJJOF9JR+QEoTONQvGTOCsWn6uIcziEOqnTgdc8=;
 b=f/meBfCnkPgkUh+eYfjylTeiM0EwOhqkzA8m07F5HfH3WbdvYPLYIRnBKOofcZC/4wEmKZpGm3Mjih73APgZpGVVYd3xPZ7GaP3hVGc5MmHV+pEF3GQ5yUzXUYWxRJ5d+5mFF8EDchhzq9bD8HvZ/hCO/UTZ7TsH0LivTIhWbxDN4SKJwb6zJzaKIoGqwo41PYzXkrB28cKEJGKJnXE8oAb1AhFfBLmdko/cBNqnPK7VWHrl6VGjL0Ip7+eEkfBjUuIwu/4BfwaRgPcpwa2+dCKnfnnvh+DCyT0SiaNtWR97FM3LPlVwBB76xpNFqerBzUf2/iZuIsbFEFlM+Bp1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk/mNJJOF9JR+QEoTONQvGTOCsWn6uIcziEOqnTgdc8=;
 b=zXdfwx0503ZLGIZ7+8QtUAdHubbUfaq39KPgNkPbT98vFo3M+B1HdPJYOszFBM7x/FGKNjymxj4Y5Lo9Z2POe4Ytm51j+oSkMBu5yiDBDxoMEOt1ZD8ZZFdM5s8tD/i7PTkVVrOhdGa81vHVgYBwHcGtuBlOGSGJyymIDgV3b2Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 17:53:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:41 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 01/11] vfio-user: build library
Date: Fri, 27 Aug 2021 13:53:20 -0400
Message-Id: <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf924a5-e113-4005-e31d-08d969839ab6
X-MS-TrafficTypeDiagnostic: BLAPR10MB5187:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB51876B71279C0EFEF656CD4390C89@BLAPR10MB5187.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ztO5UyEAZvONA2kNfHk0/vUAx1toL5D3QMZcPmvTTt864/d4Q9YUgQ7hUuRp/9wHfPZfCgN4KwPUNHVCXmfQ0+tyVmU6CcIo002wy6h9qFQvug6nr5PRlkvnye819UvZzGkGWV1LjCMm0FxQq4IcmaSGBW4genbLPjORA0FUIf4E3yyhWlW/jEZTcGXAacHPInRo0NxmlByeVNl1CBMGquG2rxfKsdRFyvz7ExX9at6UyhvcbKxQ1jsDH2bTASp2D5rUA+ayGUcIy5g18la8n946qJAAtDodwYgFolpZ6pacxL8Kjeb7ld0LJkuOKIonrP1O42Ppi6bsyLRvscScMviRJQJ8vdyGowyZA9X4PRn7YU+9OYUlE8gOXtAtcE8161jlgs7bDteMmdCsjsleu1/j+PGpHp/YjQE5g/giv2gm1OiaQegzMU/MY/oQOGkegra8kn9C/7U1TS4IfUQZBGX9Ed8m6yS5igZGUBeStlpPo3gjJT4FeleZA9/ZfWWE3C60sJkaEhBcsmAAPil+YbKmC4pTjgpdnDoYqvE0QlSCkrJQQHKQecUfF+Q3ztjfjVxQ2iQn+XjZ7dHPl7wqtyJuqXpndEC/j2zeo3WXENenntm8kqloEKQLaeR2764ACBxs+ABWboxolpyPax6JKIzQ2AqzFhaXI239OGl1Pt3tsFfGz0IB0gwgAYg4znRW3Vbs28RDRHNOyduqzAO60yFz3ZL1riKynfH0jDooMalCpeSnpUo+s1D1NmqnPaL+K9lYDWtASbhMD868G4wySFklTmVgOwuNevxJLT2bETxTaIrXtF+qgDVCDcnWgcALTqGLGSlZOXwTP9gNuq8dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(2906002)(66946007)(8936002)(7696005)(508600001)(966005)(6486002)(8676002)(6666004)(26005)(52116002)(316002)(5660300002)(186003)(36756003)(6916009)(107886003)(7416002)(4326008)(956004)(2616005)(86362001)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hvc1ex0vagcIJ8+w8vtLlfAW/ckLhpIKovUm+n7fK4PGTcEIHmE4KKLBPWiy?=
 =?us-ascii?Q?ouGMiB7F2y3nclbyg/AFJ5hmMUwpM3PRltRbiQzJlibfs4yCVzIk+T7y4PfS?=
 =?us-ascii?Q?0f6w4ie/w3fTTxW3vZumFvaSLVdWN1KkToEe2kIXWamU7v60i2DpLHjeHlVn?=
 =?us-ascii?Q?IsQ/GX7FB75AEj52Te1aU+kedKJDfCvvys7BUB1u1ArGvt6bUa0lPsZHsg8S?=
 =?us-ascii?Q?GJhaLyOLmLzUsw5/+RueFQHJZuiDUB+2volMopDUhpP39mH8/75mO8AcR9lY?=
 =?us-ascii?Q?xlS9Z3HvUthwrv/wJz3Kk8iowsecrcom/OkqXChxAHob1tWsEmZxkmodD0nd?=
 =?us-ascii?Q?whVZYDgE/sgxwM8Q3RjapH6UrvJJR7Uoq4PI6JuM4EKLhGd++EFGWE4xfjJ3?=
 =?us-ascii?Q?2Do6d3W3xVIpIc4WaKJPgteZzFqinCTZ0kVlw4lHX5wDibG809Vgf89tmUGt?=
 =?us-ascii?Q?WjVNLVk5Wt1pNIRhU+HtkyszomX78IoHZMlKEhR9dFntlBKz193W7B0dXgqd?=
 =?us-ascii?Q?+TwioHaJy8T0gUi/sBjItQafGIeoj+eiPgI76BlBh3NY7OHnAmuxyHsC8/A8?=
 =?us-ascii?Q?XBnPc7W8LIxSIyqO/esHW14GrBY7/qKG7pbtMg6vEIm3Qzav0warRG7jLYI4?=
 =?us-ascii?Q?sdBkVi+Mo/OC1m1uaU3PEAmka5t0IcAAi+ddFHCVrQSzNvjJy5S8mB8MY8Jf?=
 =?us-ascii?Q?lSDNnAHllu5/SQhMJuEpzA5hEQTD0p7CLjFaS9VU/AyZCWnmPLNRXG5SeT4R?=
 =?us-ascii?Q?MijiA7c4L84fVHfKhFrdledSlKsQ3YpK62UyvwBrddGthFZZ3Hh9wb4HbcrX?=
 =?us-ascii?Q?8AdvsiYYqxgi7rEGi7w2y+O6oIwa43+5gW4t1wDgFHEPV9b7JD388s6fbbi9?=
 =?us-ascii?Q?KUc4oNX38AoPmhQCalaatB6CJqfH10P303MakhISgdDj33row+/GISo0ovuU?=
 =?us-ascii?Q?NoM/vhPF35RBZb1L9OceDUQao4oDTNyc479cZb6T/usKp7qY7gzEEs/ejdYM?=
 =?us-ascii?Q?/M4e4dk+EAeAlLxjoOGG8I+SWXB4hJpQ6en8xXm583fER0+ShFw1BXeYZm6l?=
 =?us-ascii?Q?xiC+Qhy7gEPeUmdKRsZ+tMbMKJGTDfyWHTMp9hEseiPkeAQUHwNYI/6bYxFl?=
 =?us-ascii?Q?Gb2qvTBuX9QY4y20gx9SQV2iX8eEVd8zPOukkpdEPUPJkXrd3djVStbu5fy5?=
 =?us-ascii?Q?LM5yphRu9GQWfmiF6f/YXaMMnkQPwpGb447QFo/aRNTx/RqOpwvZvS0DKWo6?=
 =?us-ascii?Q?RA2MVUswhRMhLoG36SRrJRh4Fc6DOnwt+uhU0MsmLl6BgD4kEtWu4Y3p3h6s?=
 =?us-ascii?Q?VolnvUPbGvKLLV7RPZnDponA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf924a5-e113-4005-e31d-08d969839ab6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:41.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeXOfnvcd2J4gjWtM09e145i1QHVGfncypx77kstePWx3R6zHa5S3qe6jEx8CahbyD/EkAFzHfBq8X2bwg2ZTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: A28R2XE6mGqFwO09Qs5f-P-LLxDss7Qk
X-Proofpoint-ORIG-GUID: A28R2XE6mGqFwO09Qs5f-P-LLxDss7Qk
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                | 11 +++++++++++
 meson.build              | 28 ++++++++++++++++++++++++++++
 .gitmodules              |  3 +++
 MAINTAINERS              |  7 +++++++
 hw/remote/meson.build    |  2 ++
 subprojects/libvfio-user |  1 +
 6 files changed, 52 insertions(+)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 9a79a00..794e900 100755
--- a/configure
+++ b/configure
@@ -4291,6 +4291,17 @@ but not implemented on your system"
 fi
 
 ##########################################
+# check for multiprocess
+
+case "$multiprocess" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} libvfio-user"
+    fi
+    ;;
+esac
+
+##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
 
diff --git a/meson.build b/meson.build
index bf63784..2b2d5c2 100644
--- a/meson.build
+++ b/meson.build
@@ -1898,6 +1898,34 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and multiprocess_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  json_c = dependency('json-c', required: false)
+    if not json_c.found()
+      json_c = dependency('libjson-c')
+  endif
+
+  cmake = import('cmake')
+
+  vfiouser_subproj = cmake.subproject('libvfio-user')
+
+  vfiouser_sl = vfiouser_subproj.dependency('vfio-user-static')
+
+  # Although cmake links the json-c library with vfio-user-static
+  # target, that info is not available to meson via cmake.subproject.
+  # As such, we have to separately declare the json-c dependency here.
+  # This appears to be a current limitation of using cmake inside meson.
+  # libvfio-user is planning a switch to meson in the future, which
+  # would address this item automatically.
+  vfiouser = declare_dependency(dependencies: [vfiouser_sl, json_c])
+endif
+
 fdt = not_found
 fdt_opt = get_option('fdt')
 if have_system
diff --git a/.gitmodules b/.gitmodules
index 08b1b48..cfeea7c 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/MAINTAINERS b/MAINTAINERS
index 4039d3c..0c5a18e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3361,6 +3361,13 @@ F: semihosting/
 F: include/semihosting/
 F: tests/tcg/multiarch/arm-compat-semi/
 
+libvfio-user Library
+M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: John Levon <john.levon@nutanix.com>
+T: https://github.com/nutanix/libvfio-user.git
+S: Maintained
+F: subprojects/libvfio-user/*
+
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
 M: Jagannathan Raman <jag.raman@oracle.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574..fb35fb8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000..647c934
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 647c9341d2e06266a710ddd075f69c95dd3b8446
-- 
1.8.3.1


