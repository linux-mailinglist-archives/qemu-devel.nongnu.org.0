Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED47532DF4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:58:30 +0200 (CEST)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWvV-0006X6-3v
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV9-000887-Iu
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV6-0003Qa-5x
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:15 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFKeGP018506;
 Tue, 24 May 2022 15:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=j8vynFuMKk+VtVYki2MYIQ22Ib/yp/L8kwk9dzLMwE4=;
 b=VSKZfoWTKLvHB8Kr1zBUc7E4AjHsBQ788fib9x0YQWvqMTNhGYCmXdVjZFJwRw2DLaFa
 CIFQFInNbautekDhPw1LvIeTFAduEGl2EyBjuVfZ3Dsm5o+9Wfzq7lUGzj8IZIpcM4Jr
 32h19Iy+P/1aeyfU8YTDsd1+bvu48oEdNV5rkTgpPPLlRGy9r5g0qagLnpE/F7vyiet+
 Gh7ehic6UGqP6cC6E0eTlAGL02qCc8gnpFJPTAQOWDOL5X1wf3flDXxEokTGieHxiMdX
 TQ/9j3llkwDcwP8sUYKggPJc9xIL0K9SmQjEP3aLsKh4bmmZkdQOTjZPeBPMQzksVagp 7w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qps6tjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:09 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFGUop024248; Tue, 24 May 2022 15:31:08 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2rj6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Axmyaor3j1ElCDMHmizh+mnr3ES12lb/mHvchymVnUrI9ybO6Z7AUg17bClHB+L7R1cVYjhSA1bhXhmSSCIzpppXWLacoxX05JlGPd2l7fBayymGMgKcHEsEh7MhWG6Z6gXYHSFtIt651DqnI9ELkGZp/1gh2e7q3BzDl0HIHYRmKNANj5zamE8EKKKMGKRmcgBdnPLwYXORB6jQZFHRyLBXNxEc33U4G1WentRy6DxI8aU3SDCzO/mxiJelNQU2+cNCrFXZPtkeUUIi5Y75XjTf7NL3XDZwonXGzsOUflgKKLU1cTlku9rWaCCtB66Mj+ujEUKTmLd6Z/J8bwYJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8vynFuMKk+VtVYki2MYIQ22Ib/yp/L8kwk9dzLMwE4=;
 b=n9OefYjww/IvTl6PfFS0llbbydNuMeLTQuYYH4PIh2F7SVVP1C/24/Z730mTz0Xjm5JOeMSTzt+bbB6jPnpagyWicwEsh+jVFrdqkqDqT7l+cd96nz3bY6Q7w3Lu1yvkiK2Ih/p7uik3IAPxnFBnOFopaQappmaAMqCLHNOEiwwlgzXY0pj+5A3WLZkonEwvg7AenM0R311d6FjYPK92pGEooE6b+1Ksw6ZiOCCfQMx4YkwxAotGY5/FN9yjssx3Kek8JzoXX3Pl5FRHCFVa/At13VCLdXd+ndSpdb+0aN64qyUnb1an9foC97fQs2vFaxBz8X1ZH/TNn5OhZgkixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8vynFuMKk+VtVYki2MYIQ22Ib/yp/L8kwk9dzLMwE4=;
 b=S1Y+O3CMauzGCUgW5fJ4LWH0o70GSml9WVAUUDiP90dJsXqegIMgV2EKY9GTUjJ97F3yhssdsz9gBwJ/rMhqoAYBo84TkXyQ0i5Yd/03OFRAS8Xozfemhhzuirvmg+tpQb7Zi4deaLgBLDdI07Y6JcVj/JsAcKqkYanU2kxtlGI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:05 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:05 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 08/14] vfio-user: run vfio-user context
Date: Tue, 24 May 2022 11:30:27 -0400
Message-Id: <112c34713cbc8c0e917384288a10d7e3dfec941f.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78dd6afb-c4b0-418d-e23d-08da3d9a6aeb
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB31172B1F93C96651B2F5DCE790D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncI6emB/SD+bHdIEZ8k8X/iT/3slPolRxUZrwtclksu61CbRwlI1evpxD5em6XYh9QpBYlISPVlAfXzr96smJ33JpXTougVF+hWG3VOhx5H16gr2oF+2LqGFZ3c4U2P+UbC6JAiYk8Hunbuu0oJbGwA/R6zYDglq3AyG1HB0POZdKOU0iImnLN2Lh8fsWEjhQ7sRZxl5YrQD4u5VSouE4k6/qyDtnzJrxd780PFh5K1uz2usLor9f0J1QAGj9TjzHOOSfiK9NcrabeFe09J/lxVTaAw94HPoQJOiXaeDeSEyt666tPbO/snsAIL4mLj8Lw8yaxPekL3hevhWJ5wQl5RSDd1U7LbtP3kcqo4IamRvsd3s3HdA6XZljwVy7B8TzD3d8yEXt5ZwPQ428/Z2G3egiL6bCn+xpPBqlaHVFOhRlrKRsEonR7GAa1RGJZ2nrNRzFYDWo8rCKeGNzzAw29StlhryuyuEPF3QeNrOQM9ZrzBoiZNobJe/uLQply51x41rBiLO1P6k/kH0k5x20o0SufWDMS3QLh98UAGoD+ENbRm8/g0tb3ugNtELiSIeZfrcZH0AAOURfFddobzcBU0ndXnEpX2tyRI1qp72dUFdX50nfzxdR++NTYQZww6SRwBRcp3+AxxqN6jZ6VQmk8vznLrnqLRUxXh6z5LCv0jXnm5ZGsfc2SxpjKfoONGD3GlYRrKdnV08dIdS+Uf6sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aBr4Widizk3wdBNRb05YtqJiJx5bmNohFS7JR+UdSBNTB57c/e38kROf/MH?=
 =?us-ascii?Q?JVerbBQmgL8MiaT+kTJsBG6UaMQTvC2cD1fccR15O2zasUipGjSyPWkSpbtE?=
 =?us-ascii?Q?O4bG480iFQyfClfGVYvGBNgrALgtDwYI7W4cLWCREPFLuk1398RbIKw+GRZo?=
 =?us-ascii?Q?vdxLiXbQtsWJ1ZztlYdqavIx8euhrBOy/FhKMCM9Zr3MXRodFAU9z704yM7w?=
 =?us-ascii?Q?DBw4fPg4n+4vB0rAQ1U8dQkQi7JtCuj1/M6svfDgCYg93i2keawvMzAWSWTk?=
 =?us-ascii?Q?W1KCxeStQHpy5rthwwM3371qsIzx4zWlpTXpMtspnDZlMSO6QIMaqdcpxvZH?=
 =?us-ascii?Q?7firw8nWsokQFJxp9z/Nqfqz7Hy4xcgWEmh2N+ghDgrKZyJS6GnfSuN1i/hJ?=
 =?us-ascii?Q?a0IteXaptBhcSCzDzKWCMAS8Gd5ecpYJqTgrKedmWUF3qHvTPGWIzCX9CR+F?=
 =?us-ascii?Q?MkV6bVlqG9KU+awH9NAq96AXiVlwlchaIC2emmW0/Q/eHt6xiEjiFxSQuhXx?=
 =?us-ascii?Q?tAxtB0zrRP6jjyg5dfU4eiHNu1jSUweAhDeuAHZrW80AOx5DGgNVnxN48LTa?=
 =?us-ascii?Q?5EmDTtx+sINSDWnpRpNw0QsxFcLUC2cGuklUSkBBR0858RyFCRqXGtE/xgAL?=
 =?us-ascii?Q?1HLs2dqqAAbi1U4j2fp2CjhPdYQVIyJy7EV/lppOLaGCbFCFvaF8NJaFfAf0?=
 =?us-ascii?Q?vcvLVEp5AVtKr5uNPVb+MZNIxEtPqM4/OvImqLyNMJBblNAvPwI06dhqdB2H?=
 =?us-ascii?Q?7MZWyNOogJlXHB3t1+PBEYUXXdag0j7BvPVBOf1WIXkdl3jpPCAnPlCnqQ4y?=
 =?us-ascii?Q?5+nushLpD69wRYh/fIPh+LeiXJHbhUKBMgFZnv3qnMoMqmQVeXnG2rU0eThr?=
 =?us-ascii?Q?QpCWyER4FC4t+pmuiZd9Nc/BGemdV2q1jD0Zj0J3oSWCsEDeMfkJsIyk2mKP?=
 =?us-ascii?Q?CmHtanLPnOhDPch70glKOSELUyvKfCBTzSf7VFFpK/Fr5G03JvzshRg42MQb?=
 =?us-ascii?Q?HQqJKxilUk9lU66uGh+WtJ11Psofcgjni7Z28tmDiaT/cfIqG5OGu+d1g6bI?=
 =?us-ascii?Q?J/fWXG5eJ8xu+Cw0rWAD8uQEO6yYu0TcJ+qQTrSPZyhIUyLo+cUZHZ3HM19a?=
 =?us-ascii?Q?AFKODPLTil+oo8rDAPrj2DfeY7qD5ct52QyWuISdqDZCbYhc+87UZGyTGHCb?=
 =?us-ascii?Q?WTGogHi9pmPLcw0nEvj6Syni78rl3Ivrjwd/EWEy5eoJMu9ILKRc5f2+Q+gh?=
 =?us-ascii?Q?XT/TFw9u1vgT04DwuoTihzkR7wyigLDya5NHWvtejgCJ9fkxHYb+DwpCcKYn?=
 =?us-ascii?Q?/gxRnBRz1qI2ZXaOuVz/paw+na2bnyGd764LeNL/oc1jxUjsywIo8fUjvR67?=
 =?us-ascii?Q?lK+Gsnr0rKUpBEUkiXoWKH4lt3nsUV+b8SjmUqdbEAaA0sHJh1fmLNjscNO9?=
 =?us-ascii?Q?MgDFnUdtpe+ZRmvOBq3u3iKQfoaG2VPeGuPylSq8DN0QNi/sr+2LfwH+ADu4?=
 =?us-ascii?Q?o5XvrV/VbDNZ9vG5Cj7vLGterVUf9gPO4/1tpZxwoekoQv3vw6Dvi42TdtVI?=
 =?us-ascii?Q?ZerbJ3VL6Y3qtrFPf+BqYX/I2Otcvt/SIeyA5xAjBDnHoFw8LmFrJFcFavWY?=
 =?us-ascii?Q?eVrAF67iDald6JeEkJw0Kz9bt3jdmaF3G2WvTS4CWUULzGC/IYIU5qFOQb/Y?=
 =?us-ascii?Q?kw0acz/HWqxOh3Ci0uVZVrmxMqwXBTx2RcfqWgnUfuUK3m/cLFYCMuh3zMv0?=
 =?us-ascii?Q?e6aHL7RimQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dd6afb-c4b0-418d-e23d-08da3d9a6aeb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:05.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mIl0UKKsumIldBQYJ8UoD+O8d4RLS/NEaetz135sjsK4G027TshObxVRqcnaBXSyqoVYP8H0WxOf8eS/PH94w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: V_L1TAGeULHH4mEf0yfUV7SD8JRgLM_a
X-Proofpoint-GUID: V_L1TAGeULHH4mEf0yfUV7SD8JRgLM_a
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
 qapi/misc.json            |  31 ++++++++++++
 hw/remote/vfio-user-obj.c | 104 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 1 deletion(-)

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
index fdee274933..fb5c46331c 100644
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
@@ -216,7 +296,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -255,6 +336,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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
@@ -289,6 +385,7 @@ static void vfu_object_init(Object *obj)
         qemu_add_machine_init_done_notifier(&o->machine_done);
     }
 
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -302,6 +399,11 @@ static void vfu_object_finalize(Object *obj)
 
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


