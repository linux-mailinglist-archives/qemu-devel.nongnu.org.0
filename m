Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABA549F2B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:32:48 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qjv-00088P-Lz
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfc-0008PA-62
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfZ-0001ui-4Y
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdaXw017692;
 Mon, 13 Jun 2022 20:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=ocitA+0U7/osmgIhd3Oy/9r+EFEYBYvrUPmes+4bsWf8iBXvyxXkNGV1UJnmdTsMEfa2
 By5qnrHAimDtDuA4O22hc4fKtGn2cjkgMNIXSfQ4qIdriAuhR/yMf5c6PWSo45AqV8mG
 /FqTQa8Jej/ImurURoeY6QPruBmiM1a4pur1ttG6K+s6Bl3MC3sgq69/9HkNCrS7fGxR
 8ebb7OVihSbxOGrLGprGTX0B5ZSsi9Kck8Zmuh6oAVlhhH5t0E8pLtKfK+xl+cNYL1fS
 ZbfM3HKSLYqKTclBnH+VEtYIeBxkcXEQlmt8+8EjgIIiTbCk482idMeKaCwgqJpK9eOb yg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcm3ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:14 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKFuQ6006771; Mon, 13 Jun 2022 20:28:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqTlPtv1DjiZ6z4qHAcC6WUiqPfMLpzKZmakSfigWSHXSF/WpS7TfhAvRrREwpiXOI+ANd6CenjvNTLtqJsEPQa4LBhaEEHXFss8HNieaiUKbS2/Q7iR/CSsA/qEsNPKqvif4msvsmBpyBmD2w+r9dEGDf0AqXKfURTq6ZZpz6WGbKcUmIIFnuJevqT63L1hTlLVPDp9sow5edJ61UDzjHvMXmAZ9Tg8P6MgiNvVV55iX5cnArABxKwsoeMFa3kM+hojLmjVxaENKqeC7i87yH0QKNAGzt7Csx0+Wm43ic/REBQECMUNg63nLqTc5i4a3rYEtR/vPG5drasad1cb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=ar0H+7xKalNrYUzXA2LxvynXkHD4vEb9Q4lXQwsrw+jxy7ZyBMn8ppQyjm45q0dMKP6PSaJe6Waa5ydC/s26ZhpiScUOVLGNpRID0zZBoENYZ1BZQAQ3TrBVQ3EhEvRR1D6AT2CWnC8z63JXY0ufxttXU9IEU4qVTHpDhKIC+vy+Z5Smpc+cDsbKksQSSWpaV6pupu7/7GXsIfL70WFPis4cpj7Yih6g2BY2sfn97zS4AIahTtoIlyPHDQVvhQqvgubXmto1mH4QjvqR0XJzx0sm0v0aj4oEhGHnoDd6o4oIS6XdefqEtXabT9A2Jb0B0a2JEdTrY5E5ab3we0QfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=OVJkHG7QSKzENz3JRZqlfttPZgIF68G8KX4UQcqEOyyV9Vf0MNxqxS17jpxTTDXla9VQOkTKZUcXeNf9EPhvoPxxFn2ssBnX5S1zX12stx7qOlG+dJyyoOqPdXArSkWEd5HGTY0ykDin/at0+rG3Mc62HLSK7Igz5AdJHxC8byc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:28 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 08/14] vfio-user: run vfio-user context
Date: Mon, 13 Jun 2022 16:26:28 -0400
Message-Id: <e934b0090529d448b6a7972b21dfc3d7421ce494.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d6e609-4667-4de7-4962-08da4d7b22a7
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045B7AB27137C13CB336D6890AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZNjwF3RDlx2At9nChaVkyBAesw3sEqU0BDl+9BnDnzb/wmP9b4LbeAzgU35TBgQ6ybTiLI6jc81xuGNUajnD3erTPdzCGQqWPXq1mr4E4l0JhE+2X4GwO8puAJHlblNU+HlF03hD/X5bdVyjQ3t/BOJNyOL4zbNl7dR2SW70V984ksBeTFeUVioTjWqPTM+mDDy74pRZSzhdbZqqUOJMN/i8X6wwG/es9eL9vosKvdU0QWQmW/6e8QpR5GIcZ7w5Denp0bxNLS45gBEMGcuYbvzDemdv+bTgCvvR72dUH+miPzgxRURssDeRsGgUzaqHsVHjp0ZluVcwDDJO3ER17w1hg7v2RFV6mrWMzmChEwve/23qO0JKIIPwg6ifJYLuo2UdbMBTEf8Lyb9KWPAo1Tg5swmiZ0jovwzEjU7ewOBx41rk9twQ4DEQM+SS5MEpXk4BhFE3SJoHhiWYM1hOCXIOGxu90bP5VWCV3b3pNJjnMYuUgR0fjbbVZqSAyDrwhY5nRmjSYaNmh0oYmLU/FE/iHe7JOttgZk/VaOcfLfoOn1klacYpBhoF+9ZGgFmV6OCrvT5xlU4t+xOCdp8RInCYEj4oyx2flhxOvZfUM89wxnhg+VR4SkhAY3XTAkesiUdYTckxMRAV7aCn3yGxX3J3zp6xQCyWSMQZVzFlNAz3j9GJFcXCMPFlAFkaUdVi+7VJcBlSJQDqQO/G/OxVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(83380400001)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/MZla/qmvtXE4ZGzRF9ep9IuBdhctSixf17IRJ8F4K3KxsYyrgTTPyIdb2sW?=
 =?us-ascii?Q?TxBQJSzqe/+VNqFHOFy4PLYayQznPSetiJumbC8dcXx5mWXPB3Sl5zCGPQfD?=
 =?us-ascii?Q?HZjCGzXcNrrT+Cdzx9aWnPWoj7R+2gTKFk7AGhVTj8Z4qeWXBJUZYFOkavM1?=
 =?us-ascii?Q?DJ0UbFEHjJQYCJWklEqvnwWeytOSBe+6o5Q+JWlr3fOLRSEawf3v+dSJ7b+e?=
 =?us-ascii?Q?IwteJY1IenBZQXnPTTO+1oZ65jTzgR1r+CbM3b58LlrYZAheJIqus5OP7ecW?=
 =?us-ascii?Q?+ysSLI72f6DUu+xjQwO5Y4SgMUvdi8xbsjn/yyPcCU2dikhTgrWLtI7iVzum?=
 =?us-ascii?Q?LIi4rGnUPoIsGBaTLqssfieqd5uVCgjK+2MgzMd5D3WA5RD8+z8lqYgMlueP?=
 =?us-ascii?Q?nemrqLR4fbktYM9TFMfa2coJKRMLIdxSPyNT9cNrditTM+ximf3o0uIRdW90?=
 =?us-ascii?Q?iLMX8UULYtN+RQj2s14VLib3udL+CJ2JzAakcBabJfpaTpTGw8bgxJrZ2zHT?=
 =?us-ascii?Q?r4dW4rYgvPF2fzO369/is5e+q6xs3a9OxWVTfMAsDIMDTOTVz+gKIskUQuAd?=
 =?us-ascii?Q?1cw5gq2wmSkYZxLoZJH9ulTsFyu5ttmqU9VYIXWFv2vGwf3VrjHo4WmLGZlV?=
 =?us-ascii?Q?KOoHTXwcWeXwKN4kk7admAPAzsfLheM2Nus/VJjxNcrIwrIPigppp2Ht2bfk?=
 =?us-ascii?Q?QcPFEnxcC3nl62SgTEOHN9j8UWFesLmXQ8fZ0cXHSwP6K+ExeZnLiJdYENSc?=
 =?us-ascii?Q?92uIdRRTj+BGb0YaSn+INfz1BCuOmzUdn+DV5ZNZBJnbxbysgWMCy/NnJMbj?=
 =?us-ascii?Q?N9lja09/9DKA7xgLJKYskZfVGdZX6qAGv3vVg1Czt6k8JLOMdUBaIf64g5dD?=
 =?us-ascii?Q?P5JCqXvHvuVHBbJSBakJNB0i1B8OS8TovxVYk2hl1/eIBtM0vX8WM3Avo91J?=
 =?us-ascii?Q?wn6BX37c7zQMnOb+01Nvxp5MC5BTGqVBhzBFE3G/jrKcffWlf2nqHuoOO7MS?=
 =?us-ascii?Q?Osr28hTMo3EmYqIGJrx+5t5jFTZ+wpXXq/EUZV+8FN/yuvhVtCoO46P8DA7Q?=
 =?us-ascii?Q?rQgj9SvZ3Xp0OW7PCI3i896UIoaGbSDJrLdCZnT2l8qlVY1DYIxNzTootH/7?=
 =?us-ascii?Q?DJR1FuREv6uzz/B6elU2Iu0nBVcgzz5UPEOSffugXC/AIix+pmxUTXWEFB3C?=
 =?us-ascii?Q?0OzqbUp2zLxivMpl8ObyYTXJFd4iVeDvR/QscRHP5flOtOijptS9bgMzD43r?=
 =?us-ascii?Q?mpQYdKKeofkC9WjvkkKD/NNhjb8SnfY2WmxhxnVoAmEuBJqcg8m9H4e1Iaty?=
 =?us-ascii?Q?5yoVJZuKTVYdIsWwMdBGvEpNKcqWHMvFl7WX1l0Koflsle9yi9kuFoz7vm3N?=
 =?us-ascii?Q?qgwlfTrNVaQPwgQWU8xwKWf32wbQt3ok4BdZwZ0RyjZy8v2SyX8+e4LII3AB?=
 =?us-ascii?Q?05dH8aEsjPHlim7QCgP3YoiwZ/Upj6PMNAhPMoVwWa+/t1bMXSeQWZQE3p2J?=
 =?us-ascii?Q?K/U6uvYQ3vGDyorN8t/2b/61OH1ZfGQKFh+qNDXKRg737eXOq3m4duglOjsI?=
 =?us-ascii?Q?5JqC7MxUVYlve2B1uOkB4akQTlTLcuCKM2gg4Nb1HeyXkfrVLe/ZK4QfqG31?=
 =?us-ascii?Q?wtUxmRMq2yYCyxAuoBCXRVcaicBJw/8K7Him3IPA6OeKfD8j84SNCCg3dQNW?=
 =?us-ascii?Q?96A7gHSQ29si1t/QxgJGHNRmBlANQ/7VFHk+w69JvX1ylj7lMe0kDx+qaxD3?=
 =?us-ascii?Q?Irq0+4sC3A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d6e609-4667-4de7-4962-08da4d7b22a7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:28.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKD2Nf2LsJ3u5M0slKEZl/kbCiV60rfODSEl7mtpXfhXLMwkp54TYI6GCtA+aXE9xL9dJNf9U5iPf/jebiU1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: O8gzUWb-EUAWrE--noMDpyLqWWLrbVmL
X-Proofpoint-GUID: O8gzUWb-EUAWrE--noMDpyLqWWLrbVmL
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/misc.json            |  31 ++++++++++
 hw/remote/vfio-user-obj.c | 118 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 45344483cd..27ef5a2b20 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -553,3 +553,34 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int', 'qom-path': 'str' } }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object. It is the last component
+#          of @vfu-qom-path referenced below
+#
+# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM tree
+#
+# @dev-id: ID of attached PCI device
+#
+# @dev-qom-path: path to attached PCI device in the QOM tree
+#
+# Since: 7.1
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "vfu-id": "vfu1",
+#                "vfu-qom-path": "/objects/vfu1",
+#                "dev-id": "sas1",
+#                "dev-qom-path": "/machine/peripheral/sas1" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
+            'dev-id': 'str', 'dev-qom-path': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 3ca6aa2b45..178bd6f8ed 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -40,11 +43,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -86,6 +92,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -164,6 +172,78 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    const char *vfu_id;
+    char *vfu_path, *pci_dev_path;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                vfu_id = object_get_canonical_path_component(OBJECT(o));
+                vfu_path = object_get_canonical_path(OBJECT(o));
+                g_assert(o->pci_dev);
+                pci_dev_path = object_get_canonical_path(OBJECT(o->pci_dev));
+                 /* o->device is a required property and is non-NULL here */
+                g_assert(o->device);
+                qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
+                                                  o->device, pci_dev_path);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                g_free(vfu_path);
+                g_free(pci_dev_path);
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        (void)qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -184,6 +264,20 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
     }
 }
 
+/**
+ * vfu_object_init_ctx: Create and initialize libvfio-user context. Add
+ *     an unplug blocker for the associated PCI device. Setup a FD handler
+ *     to process incoming messages in the context's socket.
+ *
+ *     The socket and device properties are mandatory, and this function
+ *     will not create the context without them - the setters for these
+ *     properties should call this function when the property is set. The
+ *     machine should also be ready when this function is invoked - it is
+ *     because QEMU objects are initialized before devices, and the
+ *     associated PCI device wouldn't be available at the object
+ *     initialization time. Until these conditions are satisfied, this
+ *     function would return early without performing any task.
+ */
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
@@ -202,7 +296,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -241,6 +336,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -275,6 +385,7 @@ static void vfu_object_init(Object *obj)
         qemu_add_machine_init_done_notifier(&o->machine_done);
     }
 
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -288,6 +399,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_poll_fd != -1) {
+        qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+        o->vfu_poll_fd = -1;
+    }
+
     if (o->vfu_ctx) {
         vfu_destroy_ctx(o->vfu_ctx);
         o->vfu_ctx = NULL;
-- 
2.20.1


