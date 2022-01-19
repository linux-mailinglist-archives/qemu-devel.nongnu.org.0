Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687C54942AD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:58:36 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIyR-0004pS-G6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:58:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIiz-0007dD-46
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIix-0007Hb-Bu
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:36 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJi5UW001468; 
 Wed, 19 Jan 2022 21:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=fAFlWpcE2nyIkXGevE7oHLBXcSi1tOL15jqnjKomxyM=;
 b=TINrm4zOIzO1btZ36J//PDS13z0sgCQongB62eSleNVXVrXhfoAqjhiblGwJlchB+2EF
 vybeoM2r3/oxmMiDr1Kkpft9DfxZpVCU5XpoOpZRgRjlKR+v3YDeoQh8Ppr6OpY2zfDO
 odmH52d1jEtxKYxWn37fQznfoW9TZ5yzwj6pNaq19JfRTJHkoxUVuBwn+UpXCodJnC2N
 e33IKhe3drkHTTseLb15PjA7Y6rW+qXj981T0FDU+IX/8Hx6Z3xq2F89Hq6GwasdOKVh
 +lzneeet2VCI9RRX3wCMx2qPZx6XohK+G2jea2DetKv0ZVZBvgy/BKlAMbxplaiRSJYH Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f6ba0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLauFt147093;
 Wed, 19 Jan 2022 21:42:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb67q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjOh/LZpzbcev+WvuG5SvfyLoZ5hfVgAkwzbgop6yLY8ujhKOtwhjpGzIdnq2aa5zoStbQlgz59am4oLKoLeKwgrAqXmxYYH5nRwPT50xPzsaeezwKCun+7f+634QD51nYUcjjdanWpW6HeYyuqeYj12n7Hh9eLNhUsiC0QLF9P1lwSFybGL/03WKiEbNNpJeYyilvH+W4hYnZoKlaOviyZlD8vNE3Py6s03h5JHJLpJ4i2Qzo4LqN+W+ltxCDFjJ6oFU0axmFK/geyiZi0kFMxu+fV7+87yAShWK2M+gSwgNmm8bb3bvGVXowdPjKd2EEDWr4QsFP8mzoZ70xh+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAFlWpcE2nyIkXGevE7oHLBXcSi1tOL15jqnjKomxyM=;
 b=DWTM655rD0eqREbdivSgZega1wSgQvzny1zsuiFTCDg44liFt+OzPdFWbUSzcUHF4j9ko/CisQNGGTh6kfl3/zHV2OPqKz2b7Es419Jm9R/pum4TqxCBtlxWmiODxXlC0YCKe9ZRBaEJda+kyEoNBFK5a4dzAETe9gI+Imj/WX9gA4lIBziHcUOCdVJbVu82kwz1T8+4kQ5xKfZ+YR5z8H2DoelkEg1kkw7MbltJMFRqD7XmzSw8jsgdkJkIUe9mbZSLVjZISGg2jLwwk6+dxpaxPi34BcjqG1eAiQLhu4M9NeWIh4UF+64pJnhWMaPkeRwpWOaHo3CaqNN0m5g1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAFlWpcE2nyIkXGevE7oHLBXcSi1tOL15jqnjKomxyM=;
 b=BvlTXO+OnJBVyLr8RvOz4O69HQFHJQGueAqBfVMUI8sIdo5otvdp/FkylL5NCMtiM4pqWC8OyN1nde92K8JbuOvcFxNbWJBurZShWd8JhGc6ORGneQposlKmsnbMM3hYIC08hOx7ta54ITaGLqKirXMsOG7BK5XnfGg0Po1Oq4Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:20 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Date: Wed, 19 Jan 2022 16:41:50 -0500
Message-Id: <139b14d9db775e4fc8755f9974c0b5d593a14d3b.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 987f94f5-2960-43d5-3c00-08d9db94921e
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887CEFEBE8EFDD5D2DD06C190599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iQ0ApmeU2ZTho/4dGgmrL+FvFSfYV8NIH+c0qieGAUXSCjf6kbuNMbB3ArafU8Y/jK+0o7hwQxAQfbuoQnGUNq5T7+WaW/kfOuzCDTpY6nsM8861PuCZrA46v4C6SK+7qqz+euKVPp6ZIsm7UarAIU4+Q/AiX0FHodkisYlgXl3wtO8aDGgmMMlcPHXInI3KGEY2JEMP6bpcdFkdyujTYzLnWyCahgqF8CUvKcn5Lh1FK9hxA9SxBBGMlISGWSOMB7iNhTtzJEWRMa9oODUJDT4vdp0uzOvUTKSRAhxBCTiKhKT8tpHJAqfOGPauQFPHD5CMYhZ7XbMnep+r4Hdt4EEyI8+h4wcLZJ9wK2fgssmEKll2dIQZor8NlwGza7n/gHmCNbb/EHKmt+MDVWtuuvE8josGDVHBBOint9WQYzRvPpdVp1x0KXe9U3FLy5INMwmq5C5hqaKgpl0ZLZJMww66EH4lkovV6MzfkZHUxl4I2dsbdvFrtDSibKKMlGP8Zjfg/d85NQRkpljiHMgkYaLnW59fjrhv9x3XN+tEEWcUKdV+lD2obfFO0gK4T3KQpSXDDzSm8SFWHJuHbGrJLtxgw36pSwjJ3mG0Qlr+h9PVw+XY0QElJqscqaSgNXuxTT5vo/8lLHcQ2+7yB00v5VTUTR9VBB5ULVdjjRDudpW+u63jC299RIvpwSlvZd9fD+LIh+FXXy5EFx8p/PaWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?00Zz+BKfCOKqcHfhPHDH1W6/1oRIU0Avkko3fNFgxhHp2kEPkEr4O+c9lUQO?=
 =?us-ascii?Q?OHdR14ais1nTovq4C2YFETw1bOc7MFA18sbtAciwOJxFk1/Aey6orZSbFPSM?=
 =?us-ascii?Q?+ZrHJBsXcnaO/edFhEvTEh95OFtV68zl0FvVwXP2uqbe3lTARL17lMhkxA7K?=
 =?us-ascii?Q?3LWfdr5fTBPzrW2my5SUBnmV8Ds55SeUEn1t5rKBnek7P2CF4YJbP8QHmjZj?=
 =?us-ascii?Q?uGuXjqpQRqbaViNHvxC/mZYEowmJszCFu9zWHdNGhJM0DaVUC3xubYs2NVzI?=
 =?us-ascii?Q?o/BgppiajFOUbEDH7wvqyRa3mJj3a/RwI5z9J0htXNEX1l3dmzQMeWAUKD8M?=
 =?us-ascii?Q?E32DwBDxNXl2lpVE1LmjnsE1ixBBiLaX+e+dE04/7FqdeTwKRGFCegAeT651?=
 =?us-ascii?Q?mLC5fNCVic8G1zUh3e1kZdUelAxBqHF8nqXExipqz/g7T8K/yrPoK4UXYKg+?=
 =?us-ascii?Q?46TGW8RlqQUP6jN/8rghLllhWaYW5tHOGcN/duBIxGyiXL6rhEembGp6Rx3P?=
 =?us-ascii?Q?yn3Pj3Rd47g2r7LKV6qXIfl7fXI2Ce2pBtSGdovu9L9KM05n1gPEevklc/VV?=
 =?us-ascii?Q?5hH/19yppLxIdc+d5CLtVDXw18F2QIAaKiZ/8gw/5Pr21ZL7JMtH5bRwr7tm?=
 =?us-ascii?Q?nzNzEYHjdsQ5WmRV6CgUkXxiC/dPekESt5AAW3zZ7OylrNeRIqw3w7Fg44LM?=
 =?us-ascii?Q?j0v4HV3bbnMubP6RiibpjDB6l2T/FajoDjhWZPJDHgUS7PUOjWRBMbz0sHyP?=
 =?us-ascii?Q?K6Ppl9Nk1m65NiDsAdX0zcJ+NSyEqqeURJG4Rfx0MSLK1UXrucUmq++vaZ4T?=
 =?us-ascii?Q?UT4CTJ1ShDKxbjMN4OaKSfq72O2CxmyJbFo8D4/pz7VMjlwfX2jbt64WVfwb?=
 =?us-ascii?Q?djxjgI1gDcPSqolWWX+VsQ4X9S/GWvV5a4kKW2PryoxYnzxIyf7EBEggcQqs?=
 =?us-ascii?Q?Xp+l7E5+MpJJeC/Q3yJR/2KrmcHNJ175rKnlC9JiKyiN50So3+7yCD9a0YoN?=
 =?us-ascii?Q?SEtxjFXZ6JgRLpucMuXvZn0MddnECDoiCTg6O2TeeOKY1qJ977SGlpVp4QwV?=
 =?us-ascii?Q?5/oPdw2Y80xwJLOTIl6W8kmkP9GUhW7SDUt/6RZZsGY1i9ggTaTquOw7wAjK?=
 =?us-ascii?Q?fFjW6WWFbyXK9oAQ1rK6VyJWLPWBaVZaPH1AE+rjXnpgquqzAU9eP/j9L3EF?=
 =?us-ascii?Q?8sJ1oYFKvDtPRWuFRfYqiX00SnxJjSovXYQUvFrrZJ3Oz7YDkhmCIwxP+OoJ?=
 =?us-ascii?Q?cAwVUMncGYDh27u0+fQahl4XlvXa/oHbFtre/9rsnry2mfOW5TR/6IOSjI3z?=
 =?us-ascii?Q?MOlZGuCFrA7aSf8BSsp9OFMQqBdw5KIKe7t+YzFV3nQsj5B1UtnLBAqOJbD4?=
 =?us-ascii?Q?uPP7S8I7EZU7diB75iV/5wmZ3BdWjsWFuWvxuWwyKz+Qgwg8xUSp8ELFsx+9?=
 =?us-ascii?Q?RifS+n/IxBXlFGO4cS6Il9yqNDb3dNWrcrtBGD2OKRMLS/AHdP6wCNQaC698?=
 =?us-ascii?Q?hNhGTesC37Z6CvedqxL5boOQJBI5YEsBzvgZ6ig/f6670Sfleskt0vNFyK8n?=
 =?us-ascii?Q?Q3k81N7vYaSV6g3JiKlJajR6JsrWKERC3K5AQnKPNvtw+ouaZ0bC+ZTzibYx?=
 =?us-ascii?Q?OacAmPAgJ0r/0SpEr0eXtE8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987f94f5-2960-43d5-3c00-08d9db94921e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:20.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atLTYwWMyMQoi+3hKcVpvQAKWheWzCenRE6XY5uDVgvNAuv1pZCdYm/Cb65GqZWMH5P023Ci4ovr/66sUJutwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: O9RiVqgkV9lWiCk6IDnOyTn8X2r4nmH3
X-Proofpoint-ORIG-GUID: O9RiVqgkV9lWiCk6IDnOyTn8X2r4nmH3
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

The compiler path that cmake gets from meson is corrupted. It results in
the following error:
| -- The C compiler identification is unknown
| CMake Error at CMakeLists.txt:35 (project):
| The CMAKE_C_COMPILER:
| /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
| is not a full path to an existing compiler tool.

Explicitly specify the C compiler for cmake to avoid this error

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index e1a31fb332..6a865f8713 100755
--- a/configure
+++ b/configure
@@ -3747,6 +3747,8 @@ if test "$skip_meson" = no; then
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "[cmake]" >> $cross
+  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.20.1


