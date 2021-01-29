Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A1308AAE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:57:20 +0100 (CET)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X5B-0004YZ-0N
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvB-00079c-LX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:57 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wv8-0005gi-Rd
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:57 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGO5rh130216;
 Fri, 29 Jan 2021 16:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2UwiYzmM+4lWhPCNT4x28nUjt1Et1Or/wTiBdcxsJew=;
 b=GvyDOf6Eo9AbaR28Q9Kl3X+Yc9t23TUennpU9NRwrPCfPhj3oFrxTGxzTSLfKf6Ij0WK
 BzAMUqdiPTa0Lecr3jpJ4XF4cqo2LUvG9Z6bLUXk6Rvrq1jV145KRYXgXJmjEfG0MZ0a
 XWCc+VAQZIAUQY0MHN9a7Xj0+rnsHyeBKdV/XqCtc1R5dJiklJdbNwionHFlZw0deubW
 FCsDbHufbriUNE2XdJpX1G3aVcyfzdpPwn1FbPfJYW/J+VUremOuJJGbMezigkwwN5ww
 CN8JDouCIDSIBaT+jrxYII5Ma31v1gIwqCreCy6O7CD239Igr+DDpKANlBy6rGU3a4OT YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7ra9e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOhYZ083821;
 Fri, 29 Jan 2021 16:46:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3020.oracle.com with ESMTP id 36ceug426b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2i5cMi6y/bG/u8VPggJUT27jHICCV6AzPk+D7n2pMtD1MIWW28FSRiJHvkjUmoOpUQa+HeKVMxMLd5JqP7K+E0+HWd7PscfTdNljuBYiCokNkIGhPg7qO49XlF7DfPd6C/9Z4KQhqJpk/BWseFer3qXkl9tTVWHvNBzRayU8BXWYot2Hkv6l7L6Acnwy8tAj86didzilkasWxIvPjFRY/HtBwhYimFvahz7XVrEcnWKAcYW7xRybL6/qwb0Bu19bvZ4U2KiSzGQZxCQARgzME/jM4ejk1FW/G3JrV2g6ibIewSrYcUmTUVQ4CkT1ysL67TXcxscmzkeyd8d0YFq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UwiYzmM+4lWhPCNT4x28nUjt1Et1Or/wTiBdcxsJew=;
 b=SFxqwIOVHK48KK0uH9InfKOhfDszAAq1Wcx56SXim+jSqEY5t9IKlpiG5AgzsJfD4T86GSrKn6ZFR7EZmQRbx2wY80aOSBXfn7oOikKhODtYByQUa0JPfuCJ9Iv75TN4jCFHIW/aUidNOz5XJi51zZdFIxlCw9zb4IJtHDZFsDqH+D0oFFxebOrnKaHRxzPGYsblDpLBAxr1QnwNwyUPN5wg8qU4mFV0ATrG9MITEwFxPUtizhjKMT35Lc1ubrDDcMVGEaVgSQKk0GOocwCRa7i4e2gGjzWAt9PEBK73JOrspK5InBaerCDzR8xBW+HWqZUA8Nu43awVnLvBnzq6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UwiYzmM+4lWhPCNT4x28nUjt1Et1Or/wTiBdcxsJew=;
 b=TIQkUNPlQW6bTiV+xrJOTEKqvlyOL5E4YuuVgtuH4m+ombuGOOVCg1pxMdPcelXFM/ulj6SNqEKGWd/ONfrGq+pHe1DFK/SFUGSQgeCLWzS01w6d/HbsS3W7m07yLGgRncjq2kVBPkRR0+bfBRcEKv7L4uHxCnY8DKqCkyd0/n0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:37 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:37 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 04/20] multi-process: Add config option for multi-process
 QEMU
Date: Fri, 29 Jan 2021 11:46:05 -0500
Message-Id: <6cc37253e35418ebd7b675a31a3df6e3c7a12dc1.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe17c3c5-39b5-4b63-9e9f-08d8c4757204
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686DDC6A626CB5723F74C1B90B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OyDI6cv36hJpi0GRtd4NqrFtVVE766q0V/ulmhXydVDWrZlbFef9nwB5ANIGLdbPSVqSf7uPkMn/fVXQiBeRbmop1AcJGTTqZ+e9joDPzhY4flDJT/Kguzld067oQRZ5ej0uYyfEgvTvfLrqR5SVeIaN79QL8JacrPjDFhamEtr/vCvYa1zXA8+ReXvAuc4qrqwE1nKK6aoMVX4jzSvgU6R60haiEyOqvB72bMtF+nU7SthammihkdNKEZj6POKEYGSaVedX5k/GdkISiIjA8IO+jRhuy5CSIQxq78WCkm65X8cVFWamxW6eurUlZS21pUxSNFbGiHR3C2iM8o7rIzfVWDBNlG7c0TrFHvyaTjfsQZ+CQJHbQVmFKZt3IRd6OmtYvK5tlx3xx8BMbIJSVboeffpR6aq9gXx7cSOS8H3rFNXjrc5DZFbP9JZJ6qWNHvvYGMiE5nMetKi1mxr/JcDZ9tq9uG7/EIylTaynhl4Xi+MokEOz1CG41w8/H61W968s/rYOluM3Oc9P0us0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8qXUjdMaQeAenVq/jbiPALlpEJPqC6YoHgi7t6yFD6qbul1liN6dxPhpgFY9?=
 =?us-ascii?Q?MVX6OPOnUxpL4ASv61OsHj9OR2Aeqr1P/oWe+wL14cmoas3+Lv+sQ0ZwxD0Z?=
 =?us-ascii?Q?RSc8IfTrsTiyqtm4PpFSO5I+rtaCSXRfvdWciEzwHgCriiErHcbarIMFFBVE?=
 =?us-ascii?Q?iMW2LMYcACj66m9XbKuna8Q7d9XQaX4i9UgNMALbui8/OEQ4ldZhPB2SPiRI?=
 =?us-ascii?Q?AH5dXjczNttBrZVmAgmulWkKEz3U59gIyGWd4luOAkL3qXo7DtRarUX+2+Wc?=
 =?us-ascii?Q?DeJ0TLc5LCCKYJtIgPECcxM/eOmyxHPlXNS99Fli61vNSgEbXwTexTB+umS4?=
 =?us-ascii?Q?9btWklvLO+82QCIMk9llSeC72DxdA58vDLzqSH6pB0CxPmfiVwJkQ88vW9Dy?=
 =?us-ascii?Q?WLLB6LRBjvZ9A8BKtuInms8Wf5na5OFjuqXO60qB8ar5wLeOTwGGq86oiK7e?=
 =?us-ascii?Q?nsMHKSBlII25A0VkUrbn7+tCJA7ZQkjLqujX6m7lzPF1lLVG8cozEiNldINP?=
 =?us-ascii?Q?GSqZ2R1WXOzxWd15wIVAMwg0Euu8821jBD2LU8ykcpR8ZQyck0VsYetAoXK2?=
 =?us-ascii?Q?z57OsqebQZxbqrr/J75GC8MONZyNFwjB8xG1WqCEt81j1XXXeYJBkR+w1IsH?=
 =?us-ascii?Q?oZV1xWMOKZ3B7yXamhnKXLEhC38qwbcKX9lYjoKCDvW42zzKj7jtRWy6obUB?=
 =?us-ascii?Q?M8XHablAwy6FfHiUVWy3O6aVSxPg5VmdjZF6+LcuI4I+PrsL6sXLrOTvyGvE?=
 =?us-ascii?Q?JtZb2LLFegCvn+o4FtahpjHzKFWbsFR/Pab4Lj7XeVGlUYE6YFqZLAXeqwsA?=
 =?us-ascii?Q?MCE0x7Gd0VgGghFhyALw28AKuv2yisFLJklfHd5CoqHUQIMOi+YmKLcySAgL?=
 =?us-ascii?Q?nSLIJCJrZU9EGORma0aHL7x3X0wW/o8dFdWaKniN7l0xe2M4fF5OVYO7QVvt?=
 =?us-ascii?Q?AQf5gAw2kYFSzEcTJZ6R8gWUY2v9+lGYM2O3kLgAhrOqH0eKJmA/A8yT0x/H?=
 =?us-ascii?Q?q+PUR1vTeMFcA2aKPoJkVMMf+wS6DL9G+4mlURox5aYokrbEPNHeCukxwT9k?=
 =?us-ascii?Q?8EdR6JrQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe17c3c5-39b5-4b63-9e9f-08d8c4757204
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:37.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckPillcmLkl0x6gezgflBLxVUKeMtGpqF0iGqhKzOuGeKxp9qIR3V6lYMI/yBDJBCJWoCOE6bv4uqBekJBk+8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configuration options to enable or disable multiprocess QEMU code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure         | 10 ++++++++++
 meson.build       |  4 +++-
 Kconfig.host      |  4 ++++
 hw/Kconfig        |  1 +
 hw/remote/Kconfig |  3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 hw/remote/Kconfig

diff --git a/configure b/configure
index 87de49e..4ce54c3 100755
--- a/configure
+++ b/configure
@@ -461,6 +461,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
+multiprocess="no"
 
 malloc_trim="auto"
 
@@ -806,6 +807,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
+  multiprocess=${default_feature:-yes}
 ;;
 esac
 
@@ -1558,6 +1560,10 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
+  --enable-multiprocess) multiprocess="yes"
+  ;;
+  --disable-multiprocess) multiprocess="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1892,6 +1898,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  multiprocess    Multiprocess QEMU support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6052,6 +6059,9 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
+if test "$multiprocess" = "yes" ; then
+  echo "CONFIG_MULTIPROCESS_ALLOWED=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
diff --git a/meson.build b/meson.build
index a58c6f6..29b1be6 100644
--- a/meson.build
+++ b/meson.build
@@ -1207,7 +1207,8 @@ host_kconfig = \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
-  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
+  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
+  ('CONFIG_MULTIPROCESS_ALLOWED' in config_host ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2576,6 +2577,7 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/Kconfig.host b/Kconfig.host
index a9a55a9..24255ef 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -37,3 +37,7 @@ config VIRTFS
 
 config PVRDMA
     bool
+
+config MULTIPROCESS_ALLOWED
+    bool
+    imply MULTIPROCESS
diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b..525fb52 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -27,6 +27,7 @@ source pci-host/Kconfig
 source pcmcia/Kconfig
 source pci/Kconfig
 source rdma/Kconfig
+source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
new file mode 100644
index 0000000..5484446
--- /dev/null
+++ b/hw/remote/Kconfig
@@ -0,0 +1,3 @@
+config MULTIPROCESS
+    bool
+    depends on PCI && KVM
-- 
1.8.3.1


