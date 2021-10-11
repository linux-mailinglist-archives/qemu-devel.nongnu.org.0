Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4F42863C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:34:03 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZnwo-0005Gs-C9
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuW-0002W3-2c
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuT-0004A8-N6
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:39 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iKPX029460; 
 Mon, 11 Oct 2021 05:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=4N50js7COgJacJ+bnhAUaTi1lqqel9ergPc265m+VC4=;
 b=keKKiZ3g8gjvL2pNi+K4QE0mhdBFJ2zxAqd9chOkylw3bEWwfCGYrXOTXE1nw0dtlkod
 lFVgdx05YAPm0lFLwaoVZUUkZo8B0S9oCC1W3jUOrI+0dN2FMmIxAVIDme3roiaF/Wdh
 oZLY+O2pIQAD5/Rw04aZQl5Mq5bayJy1Gt0WPGSOuKl7VjkeOYcELTy5b0P3FKz+IBVU
 sXunc8pjWf0OLK8XiWfTCdg9nn7PDqLf/Z0OuKalNI1mNRf3bIMJNShF+Yfv8GHdCCSA
 aDUu5pTY/UINTHDX3aRla7Q6SKEbctCL4ZM8lGtMDemJOSMnPSl5cnnMNT27lSQGTVEu 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh1v87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V2uH123700;
 Mon, 11 Oct 2021 05:31:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by userp3020.oracle.com with ESMTP id 3bkyv7nt5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMsbcywhgn9sBQ5YuN7hfPoVMDRqt0PIAyueRvF/4adlqDSbDweLEX4GDn2QXpYiBpVSaM3miQ0HcUYBA87loD6l2KDygWJFRnXQJpa1kDagz/2KEcEbjQt9IlLryGdznUbQQ61terycGCBWTwxl9yqzRvKahP4j1ejF8GDyDg4zv5fWA8BMBkClOjAEdhi+IztVNLONxWhQ0d48nfxm/tC89F4nBu00eHe5NLbBxa+a2l79DMBzCFlacqH8httFRGnl+MVnzKImJEiOidMpji3FPEjLW7PzUcwJicD5Yx185tabNHpVsmAJ08pv8hYSpwaAkhCgjiqY43DQMhQgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N50js7COgJacJ+bnhAUaTi1lqqel9ergPc265m+VC4=;
 b=ZUm/5B1WZq5FmxVrHRRtaBKs4Au2Y+8XrlET0Sa61g80+pG1voAOK/xenN9XndAw0gMxHKEp0SLDpalhrKPnfpS3Qa/Lcs6QO0HcLDo+MeoJzxEYc9bn0C/NQN07laTztKnkHxXlV6+W27h6ytX9bAlxhGX+ltOVP541BUqyHEqiRkp9Ow0NKhm3S8crdOI1RxFl68VR+byCQoZoY6pKHZHFjntcq3+LgRpsbhDhgbo0xj933xstAACzoS9OQUiEeo1S/Qk/KQL1z9Nl2/Da3v1pITgn/vrZBHvuAJ+024RVoVZfu1yX7pVrfGljPUT6gIpD+jccKES7nr2L8NsBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N50js7COgJacJ+bnhAUaTi1lqqel9ergPc265m+VC4=;
 b=tigiZGiutM2qQo2nNpF0CwhY22HITqvkbQfnAMF98eYpaOeCC7VgAfwU3j+xcLWolQBmrpmxhVJ5t8miCcQ4fgyNFh+pdsEd6267eaYp/ykaGa/o+OTa4kKqnC+RpN7LlSAYrgxrfeyK7jbq59tdK5uF4EboqfccZXYDWLkeOUQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:30 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] vfio-user: build library
Date: Mon, 11 Oct 2021 01:31:07 -0400
Message-Id: <48b1ca2b5070f3655075e02966c40786028dbfd9.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb52201-5a29-4e18-ef86-08d98c7860c5
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB39022297F21B308112EBCBEA90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dI1E13uZ7sfoweEnCyRRiEbmDlgf8UAYMaiLhmyt0b8Q1m1arrv3Hq5QSe6/bgOuP0bk46kaWHFlDDjc1Xw2lv5sn90O0ftNKKHO3HxDDQ8z497fJUMsvTK80y8pOHUJyQgkIDX4lB4+TOJyGRTHAqokbRB6DMorFkDQHPam023EwE5N7E7p2qnnPBRzVE+pVHWzAvXZErYmOg5ul1SLOc2SaWMGc3Y/nAN5/Zkp2Zkw1rzusKDjnlSDe9eHzRXBB8bEuFNpS06nm4nFxG1dSobk/+vqc5IEV63nHM3Kh/TaleU5dh5NOeXb8aDc+HWMQYrtxz0kW3PYzJAYQ/U7ZcKCVWcBi3N7TN/n5MeIl0gAcdlQkksDaRrpd+RjGhTR3knac291CutPZmqHnj7JCIYs2rUhEHxKxYKHw7sd8FXEshmJMn6Md+R4i5odBq5CckG+Ofc/aEp7XcbdLgRiLfDpN72UwbU/AxHc9sJskViZNlipf3I5Cm/9eV0gbzWtmBCRwRHfsbob4jSY4miyyQ/o18LbRMv4jmaVfSQx7O/8gxkPXw1at5gB0yUBxG5lMg2ZVXCz19n/d512WI2j6QwSpBpqYxX8iICDlZUoqAVnyzBY+Bd7Q2T33k2SBjjY22Aa42Aj49MHRgkMWKNYuHcTjcFtPV+bHSwL1yCWv6n/xwt2RmMncIXSuS9Rx4rhn8y0dFRoUbmlmUFuY6gikgAVx7UX6QWWuRF6f8MN2tfgtU9hc6IBJwo/b2vYOTil1kN4RJyBY2J8Qcu0anpKUaVcVtJNMwFphiH3pUhM2FyfQyUcZgwmcLlrPL99uOgK+BNb1I1L7CZH4kLTHJs5mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(83380400001)(66946007)(36756003)(966005)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lG6mKdfn+fFtC3oreO4NoILKgdXFSjSE6Yr1hCFN4fe+6Qb3xVaRmCZr2tzZ?=
 =?us-ascii?Q?Y+CHdABBchFvt7BSspmbrJ2vMab7VKNblyiDXobB2gJBixug/F7IzMC3O13a?=
 =?us-ascii?Q?U4KhswgPmzFngu5ZgJ60dcA6obyDVlnjn871pxmoQ/vjbRwIP3ujKYw7E/uE?=
 =?us-ascii?Q?sxqhbq3g36ibC51ZZabDnSmXJ8lpVAQpsvUqbOFUE1M8TSzjYo2SBG3jP7ml?=
 =?us-ascii?Q?ydogvJ6z0WSro0kHWd+lCISjK/x23PfyJ3G58MXDOC0y0StXjVP8BGqK6c2r?=
 =?us-ascii?Q?GSkQXKKmbRrEA0ZT0oSEKxV6CmY0bVd9NIOiyY3YFI/b9g1fHIq/KHr2dx9L?=
 =?us-ascii?Q?UK4xtpuQIN+k9sUP16nN/Ejn2V+5ZBveUZEqlGPSey3MhbJXe686AZSBp/Xg?=
 =?us-ascii?Q?L1PVEtUqInH4bEG0TWkkAS3QyXv1bQRiMgOmQrp+bQcwOAGkXzOYjOY/OCJX?=
 =?us-ascii?Q?Iq1ALRHhPIuxHt63Rv/WF2hnubmW5cL9cEZibwANmGeZq2/JU/Vo0jykcNcc?=
 =?us-ascii?Q?toL4lkdatf29XneuzNlAe6UlAaylavXWXvSJM6WcUd01U7w/Tlg/AWxbWxrr?=
 =?us-ascii?Q?EMSnj+F2/KfdfwV7FmbB23pBae8991j9Fo7j4tPClZlIPA8c6Ml8OyXdkoVb?=
 =?us-ascii?Q?YcDIIjVaZ2dilm2fk8W+ozq4d0FESE4u1pccwFg18fnW1kNmfNEgj+aW54B/?=
 =?us-ascii?Q?AY8d4nvG0PF9Rj6qEbAENCXoFmj9bLtitW8EEQAdEGUmejPRgM1zYqgoYvD7?=
 =?us-ascii?Q?h4nrUoKG3S1REY0YPMIcai5yLmVLl7F+jM8Df4mGgJyPEKttI+rqptjdH5bX?=
 =?us-ascii?Q?pow7WR/75mdroQHe9dVSkEcQm9TfBAIdrqendyyYP/CPlkUaY2dpRtJZqBdB?=
 =?us-ascii?Q?rXcGKsSZ/Hr8wtcyYQvllHyE+jyHwIwffe7dRvcIRT9tyZNZCjSsJdQCAznH?=
 =?us-ascii?Q?Bx73lSQnQrRJMHNhFkc6D1ngAiJJbyG34iT34lKqIEWX6fihpc7F1/D4L2w7?=
 =?us-ascii?Q?Jd44rr6MPJz6WAN2fi95A7dKYiRmYBscnexxclVUbHGRaP8WOPYdk3ZGtV4h?=
 =?us-ascii?Q?a5WNM6C3RUlAGXeeQ5Yc/Izyrrfx/LdsnrQeAoVL48YMtcir1at3u0sHmsBn?=
 =?us-ascii?Q?1aSGQZFIaVrsPRKfqPFtVoWEEFOSx7e09Z6l6+wIB1/TxJrilfEyYm/ZBfDK?=
 =?us-ascii?Q?kUUR8VkSiYN5v8SvU7E7MOZzF8hxrCVEQp52PqlgNNZQBAjsMO612q7IwK4U?=
 =?us-ascii?Q?UnSCsa4pkHPfC0OvNb314Vt7fgvSGuyKomUiXyYN9Hu6mchgjmZgIzy7k1Dp?=
 =?us-ascii?Q?u0q+J3Gc0W8ySmnKJw7f4ABa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb52201-5a29-4e18-ef86-08d98c7860c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:29.9213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdTWBYV/z/mRafSgOQ3B5myJdXH4zRwPI4UiaHA9tWA+5n97mSYXKL8d3f2zaTD7oD5hNMBf6Sgcp7alEETqNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: 2S72oCM-XaXI4yGqj4CXiL9ruNGkuqRz
X-Proofpoint-GUID: 2S72oCM-XaXI4yGqj4CXiL9ruNGkuqRz
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

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                                  | 13 +++++++-
 meson.build                                | 39 ++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml                 |  2 ++
 .gitmodules                                |  3 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  5 +++
 hw/remote/meson.build                      |  2 ++
 subprojects/libvfio-user                   |  1 +
 tests/acceptance/multiprocess.py           |  2 ++
 tests/docker/dockerfiles/centos8.docker    |  2 ++
 tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
 11 files changed, 71 insertions(+), 1 deletion(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index e804dfba2f..88fb44f15a 100755
--- a/configure
+++ b/configure
@@ -443,7 +443,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
-multiprocess="auto"
+multiprocess="disabled"
 slirp_smbd="$default_feature"
 
 malloc_trim="auto"
@@ -4284,6 +4284,17 @@ but not implemented on your system"
     fi
 fi
 
+##########################################
+# check for multiprocess
+
+case "$multiprocess" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
diff --git a/meson.build b/meson.build
index 99a0a3e689..5c91305f2d 100644
--- a/meson.build
+++ b/meson.build
@@ -172,6 +172,10 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+# libvfiouser is enabled with multiprocess. Presently, libvfiouser depends on
+# multiprocess code, as such it can't be enabled independently
+libvfiouser_allowed = multiprocess_allowed
+
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
 util = cc.find_library('util', required: false)
@@ -1903,6 +1907,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and libvfiouser_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  json_c = dependency('json-c', required: false)
+  if not json_c.found()
+    json_c = dependency('libjson-c', required: false)
+  endif
+  if not json_c.found()
+    json_c = dependency('libjson-c-dev', required: false)
+  endif
+
+  if not json_c.found()
+    error('Unable to find json-c package')
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
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5c378e35f9..515ae40d1f 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+                    --enable-multiprocess
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -142,6 +143,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
                     --enable-modules --enable-trace-backends=dtrace
+                    --enable-multiprocess
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..cfeea7cf20 100644
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
index 50435b8d2f..661f91a160 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3420,6 +3420,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..f9e512d44a 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -1,4 +1,9 @@
+config VFIO_USER_SERVER
+    bool
+    default n
+
 config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+    select VFIO_USER_SERVER
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..dfea6b533b 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..647c9341d2
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 647c9341d2e06266a710ddd075f69c95dd3b8446
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index 96627f022a..7383c6eb58 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -67,6 +67,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
     def test_multiprocess_x86_64(self):
         """
         :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/x86_64/os/images'
@@ -82,6 +83,7 @@ def test_multiprocess_x86_64(self):
     def test_multiprocess_aarch64(self):
         """
         :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/aarch64/os/images'
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 46398c61ee..646abcda1f 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -12,6 +12,7 @@ ENV PACKAGES \
     capstone-devel \
     ccache \
     clang \
+    cmake \
     ctags \
     cyrus-sasl-devel \
     daxctl-devel \
@@ -32,6 +33,7 @@ ENV PACKAGES \
     gtk3-devel \
     hostname \
     jemalloc-devel \
+    json-c-devel \
     libaio-devel \
     libasan \
     libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 39de63d012..ca4dff0e6b 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     ca-certificates \
     ccache \
     clang \
+    cmake \
     dbus \
     debianutils \
     diffutils \
@@ -44,6 +45,7 @@ ENV PACKAGES \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    libjson-c-dev \
     liblttng-ust-dev \
     liblzo2-dev \
     libncursesw5-dev \
-- 
2.20.1


