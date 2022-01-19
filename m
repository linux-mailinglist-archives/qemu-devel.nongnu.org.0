Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B84942A7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:54:42 +0100 (CET)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIuf-0000Xj-6W
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjJ-0007wK-Bw
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjF-0007Kr-Is
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:55 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJoQcx014084; 
 Wed, 19 Jan 2022 21:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=4Bq5s7R9Ty2xTz6t1ZUOESmPw7pq+NWqDU3uwgIIbNo=;
 b=uogk5pJzM97wmHb1BouVUbt4QK/Iewa6DUKisnmslXBwih3hqjAs6st9VPp7cFpOWe/Y
 DzBh4nSl9tBLgyy5tVGgmee/hjhZucfiRp8ZJUyVXHjBb4dGo4HANwbK2JYhqHpPCkqu
 dZWUkJ64Y+iGPGDy8ZZvePdBiOXNRQOVgogwY2NrlJ8L3jPazqHq9/EQVnaf9s73bHBW
 exuekzeFcezabcx4R23C6w/BIfU81TXJ3SS8KjoWDqz2hChRYXPyh5MSi60aTSauxE5p
 kLJGlr7+XOb9jd0fvTYHdEGhp3C39RCibmRT6IJrh1JlBY6PhvizDowjig+9vYBnuIU4 ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc51e69x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaSKk030864;
 Wed, 19 Jan 2022 21:42:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3020.oracle.com with ESMTP id 3dkp36kfbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcMTTS2ZcenVUxAAJW4pXrGKlxTkKVwe9n3WeseLfU9lt2l1O0w+5m9KbfiCLf53xWfNmjI984GAiNNHGPzA7iPLOgoR250e5nZ7hW2cEtZOQsVCsY/UXmI4pP9I5E+1y53fJ+69v3FLLZs0tRIuivaAbmYlf1N8vHKbrq28Oy1UdadbS0+1tZoLgHuXFT7HrmR6db7mpCzJyJ/Zz16behyZSmVu/qVjd9pu6Dz8FkkycSc3NNsoI4+Vs6vPzhLgmkTSSuB+5ILNVNOcJ2a97bElcEO3b70I4qxVLiD+gaZyNZBbkc/pt/yBl5fAGdfhfuaQdNwactHuhdF5Rv+vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bq5s7R9Ty2xTz6t1ZUOESmPw7pq+NWqDU3uwgIIbNo=;
 b=kR5XdtlQLEqJyYMIdU46jXFc/b3vw1vJ2He/QavYyO9xLk3+Jd0DyWQw5lCJRvPlyNawwmLB85Dy9tjONlbirivwM70EXn1dPo5wzmS7v+d7z+5y5X7Phg6UZDGh05zor89wrBrutJebGj2Vo1j06bnmVme/Hny/dVtgp28s86ZtdDogC3Lqi4PhplrmH0Ia2Z1/wUUSLnEeKnyP9zUHpGvy1zjC9Ciqm+i49cHRPAa1RYyx9bTxBA2sOH0uQshFy1rhfeFwrYl8TO1GCanae+qH0I1iMUGFHAXXbnPFr6BntDP8CWh/zPN/4tDqfcCK3Q0B8mE4GYuoPXC2KQcFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bq5s7R9Ty2xTz6t1ZUOESmPw7pq+NWqDU3uwgIIbNo=;
 b=JG9g0W2fXTgOFfC77H/Th3cryroEM6FjtBAsuJRXbSx2IVT8KDyLC7kyGgfUz8iavO3n8tXviH6A5dM9Rl0oWLI7O7SqsGLjX5hASDoAsqzLvftvE99+wOMNZDXhx0nwQK4zPvcmqpfM4duE+MPc6sIQ4Pvgr5MM306pzLhcmag=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:45 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:45 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/18] vfio-user: build library
Date: Wed, 19 Jan 2022 16:41:57 -0500
Message-Id: <54084e1623dc160201e630fda88a305bc686b1e4.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff46297b-cb86-49a8-0d57-08d9db94a0c9
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58871D4DC856314152A67CB190599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71DyQM3jLe026PzeTFlKWuVqsjSI3iLbV2tgiY9rPnvkKaBAVMG5gNVDSTjTGTH9Uujr6spgHGqipDX6qR4lm63rULA38vFYtelspXsVI8OgC8Kmo0kSq9xza7UC4/1LbDcA4lHEZkWhT7Wz5YWT8CYP+imevWn36CSRc5qqEIg7mrcx37W6hJ2XMHBf9iDy/SlBj3AYWSPRdMCHx2jmIbwCTzr6uEdhIwf2on3henKpVjG4D4iYpdNcana4LsqKnJMow87Semi8BLkkFvrvUIM8GZZtmLAwqkB1Pn/syqKdxCq0zsDj3VKvanRCtTn4mxyKKBsa56XK4t5umu7kLKSDEIhuPBFFsWzdFSB51MRqOKgoNxx74AlGM0shExAM7W7gkK/YtW77r0mIGSYLMJGykkYVBNtE/seqw1F/WPyWUecEUgHPmCUt9he5OoAdqxI0H+LP6z2h/ccoLSziYiY6pfSG5z2knTsZexUQ8pI8aTKD5D8Z8vdTsZUpSRMmY3u8pn1csW/q8/d6y2fWX/Nut65S8Y8ix2CdjjNq/r6fcd3HBLwuvDvIW5tl4wY9uCycs3iV0pOjUh1WedL2ShMs+adT9aoyFyYOzW5qd3UbElJqNU17aDF4O8XVprwJp6m3h7P2rlKe5TXKF6pXZi1snn8NmSsj7/kOT5xChGDgg8wz9ipHe3NlptbW0xBEv3g6diZi8QUF+KqL7TpAVwu3owA7qCwdOaBvFF+HA1XYUJeOnvVLm+6VhfCmOuY3nhe8VfWMebORpuxDX+vTfJhMOKH5AjpGaGqquhfcTIIAfiUIHvzp4YboyvjHBN/zNHixxrkr6jQjfhPkCg5nA/1IQjOz7ScRW7qFwQt0MrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(30864003)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(966005)(52116002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHqoLj8DCN1HyiY0UyJsOwJAtjMmIU2Y+GBOuc12W6H1COqA0fQcO5AKOyOb?=
 =?us-ascii?Q?JVGH2S0Spabwa3TfBwiiNxBYQ9bBXm00g7bg9/wDVyYk7TfWRmFIEWz0+FOW?=
 =?us-ascii?Q?aAOuJ1G5tr9DbWv4wSfSVXHt6k1XmtkfqEcnv3OB0yxvs4CXmisJhZTZ/Oiy?=
 =?us-ascii?Q?cIJKtGw2z1QqNsJOHGHvf3Aucdr3gYJO23zE5sSYI87YNVGBdNY9qhRYm6Xl?=
 =?us-ascii?Q?6NNYfDoTt9o9H7WEpnXadwbgFHe5s4CMj6RsqMnqMJsCRvhdshCkOcVR5OCf?=
 =?us-ascii?Q?VE5NP8KEW+qM0NedAMreHz2s/K3VFf97xBk9NvwwB42ApsOUQ3YsWE9xTK/h?=
 =?us-ascii?Q?dy9rzHKyJvFZEN4yTGKwTOfCb2g95VwhZZuRzGC3ZdIItVlC9BVDXep9V8qJ?=
 =?us-ascii?Q?aUxXlkGs/b6x9HXht4UU7CpfMdMO1QRQNlFQbMWMYjVfzDRCWNAnutCvNEoB?=
 =?us-ascii?Q?EHVq0nyaw+Mm6BndGhNuvzdpNjmxaH+oi3MPcXG4uTjj+q0uJt8El1zEJJbJ?=
 =?us-ascii?Q?KsuOeiqL4ZcMLRrswv+uCvFo4Cu6gAIEElqEjn93L9QIx1UjPAExfET0vIzp?=
 =?us-ascii?Q?X2tVAe/m2LdZgA6AErRNVN30FvNuYI2sBf3ps95gdQUiTdOxcIOZiR2Eflbr?=
 =?us-ascii?Q?zCuabZadMD4N1ukxKqWu3YnTx3fwndwn8l9/F8z5YIfCY5uTESbBd56fsnmC?=
 =?us-ascii?Q?aFkzv3X9bmrdkKFgtc+L2sWxBx79FXnDhZUCVtjDOtzybsPhnshTMsFLe6uv?=
 =?us-ascii?Q?qkXBAoiseN/pYyx2C04BMafMnau72Lt8vn3AhzcGMG4J7ONhjlRkYd0y2/2W?=
 =?us-ascii?Q?9vKzaYFrBJbpqfKSPWdIWpp7dyDmbnkv6LPxxHgnbV+eCgykUKt8QfBiufsC?=
 =?us-ascii?Q?DRXhwpy/HfzOOnXSI9qLJylmQ8xB/TUuYQiqKBIS+nUe/9hLW1Rsp06+vHRG?=
 =?us-ascii?Q?7kk0Vt9VZNYUNynhn38mQgB3336JSqFPQYjCilNmXnKrP51+u71NF2yTX6C+?=
 =?us-ascii?Q?bWDKYDjFz9izR7KfUQLGB9a8Eo8c5hQ4O0hKugzO/qXx5G7L5n1S/wqP5mn0?=
 =?us-ascii?Q?g8CE0KalUgA4GfE+ZGPXYJRSOYOSJSbJFaPzmNz2CbUPrCQC25VU6DI3FnW+?=
 =?us-ascii?Q?p2Nl3MtFNVySFyX87ryWcYMbUxqLk/DWFSK4A9t80R7Tt1aj2rEOxbXBt9VP?=
 =?us-ascii?Q?7/P6/E3Y0e5ryZkIj3GDhTpmzbsdgKvz9njIHYzSp9nL88+54P28KSboYXey?=
 =?us-ascii?Q?e82SozFyNbRAymn/QgGJjY32jzcdDZ3IdGHaPhGZNf1JRZnLwjZ27iVWpH1z?=
 =?us-ascii?Q?d2/Pzq2O3TsHAPKidcyzThQwmHdUFddggm//0d3y+ANB72npWD36Hk7cpzos?=
 =?us-ascii?Q?2Bf5lW1AA2zviTejVdSNz9/xF2Q6QwRaxKLOBrhI+D0YfC0BOuY8ekaSSGWH?=
 =?us-ascii?Q?Xp944fs2y10TSUCp+mWKWWCo5ARWIj+Y9+zkLKOizvysrOC0+SeTzzbApwC2?=
 =?us-ascii?Q?izpwYsKZoUeFpZq3BaCLpdw719yC/GfvhRkatxhrDZAv3/wkjrI3FXoESZtM?=
 =?us-ascii?Q?5vwCOKI8JKLcUjrLKbg73zGsOJDmAe+VbKw+CleRtUmFniJekl/boNQioJyZ?=
 =?us-ascii?Q?4CAm+dSOmOXatKD/7ZWuSm0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff46297b-cb86-49a8-0d57-08d9db94a0c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:45.0371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r34TZ5ljoU8zA3OLpwKwld+t/cGn95Xumz0tBWs9pNCfRamqaH8lBKumIvbTIFpLJbhDFcfbbz//aM1yQlB1RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: wXKcuJMgeE4v78yDzROEutI4AsbGlpVP
X-Proofpoint-ORIG-GUID: wXKcuJMgeE4v78yDzROEutI4AsbGlpVP
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                                  | 19 +++++++++-
 meson.build                                | 44 +++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml                 |  2 +
 .gitmodules                                |  3 ++
 Kconfig.host                               |  4 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  4 ++
 hw/remote/meson.build                      |  2 +
 meson_options.txt                          |  2 +
 subprojects/libvfio-user                   |  1 +
 tests/docker/dockerfiles/centos8.docker    |  2 +
 tests/docker/dockerfiles/ubuntu2004.docker |  2 +
 12 files changed, 84 insertions(+), 2 deletions(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 6a865f8713..c8035de952 100755
--- a/configure
+++ b/configure
@@ -356,6 +356,7 @@ ninja=""
 gio="$default_feature"
 skip_meson=no
 slirp_smbd="$default_feature"
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1172,6 +1173,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1439,6 +1444,7 @@ cat << EOF
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3121,6 +3127,17 @@ but not implemented on your system"
     fi
 fi
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
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
@@ -3811,7 +3828,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index 333c61deba..15c2567543 100644
--- a/meson.build
+++ b/meson.build
@@ -274,6 +274,11 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -1877,7 +1882,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2266,6 +2272,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and vfio_user_server_allowed
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
@@ -3368,6 +3409,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f2a3c8f5b..07c36fb15d 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+                    --enable-vfio-user-server
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -165,6 +166,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..4ae2a165d9 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -67,3 +67,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = http://gitlab.com/libvirt/libvirt-ci
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..f2da8bcf8a 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -45,3 +45,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fd74c4642..8d7bebc74a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3486,6 +3486,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
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
 
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..7f02794d4b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,8 @@ option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
+option('vfio_user_server', type: 'feature', value: 'auto',
+       description: 'vfio-user server support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..7056525da5
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 7056525da5399d00831e90bed4aedb4b8442c9b2
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b..f8dff989de 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -23,6 +23,7 @@ RUN dnf update -y && \
         capstone-devel \
         ccache \
         clang \
+        cmake \
         ctags \
         cyrus-sasl-devel \
         daxctl-devel \
@@ -45,6 +46,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 4e562dfdcd..d16a73dec8 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             ca-certificates \
             ccache \
             clang \
+            cmake \
             dbus \
             debianutils \
             diffutils \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
-- 
2.20.1


