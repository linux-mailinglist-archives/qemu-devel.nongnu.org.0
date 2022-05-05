Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18251C6A3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:59:25 +0200 (CEST)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfl5-00014r-O6
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf1f-0007Ma-LD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:12:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf1d-0002BV-89
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:12:27 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FpOfi029440
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=z4YQmOEc2RDGScN538VMp7No3l4BG8BPB6iLj44+8Zc=;
 b=izqfE6BKKQcagiepMfjCEhavMlNrTOpuEmn9mNRfwHzIF+HkuegVPEXB7v278oqXXK8j
 V7u5JzF24LnE5X6LWsnmZCMtLKwfXEe0yLG7HzyPDId0S+Ye7/JRYOYRDnxR7NCGLaSV
 FDypuMc2U212JqtOcmzZaG/zCRofkTVZ4tyWB4cTHAV42l9nEVoQjFc/CzWFIMwo8bKS
 LUnWgEzQhGehtYbFJMyesn4e3xzBZREM7TZqs1mqn4my9jZLyKzsCY6LaQi0FRn7qrt3
 tSMl1OjDNVVCCQ5e7gV9BkcnpQqG1qPZUJVb4fSE1JsKFL8e6z6g7/lVgDEPFWcZX4hu Yg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m373-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:21 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqQ013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euxRIPtcX4mutgFrSTpyqds/fgilEZ7r154yk5rIUqd2KQtkI818+oGk9ElNacXnVvkIKWt0aPD6lK5QJkBEuzow37Yeq66/FnGHycLIPcwkmuk/LJIzdAHBpBVb9vuOSSdx7tdibuUjOEHjbiF/4m2839tpxr2CCFgTTwvk1lHJ/1J2bE1qRFfFe8k9W9PbmqjCuWffbGlZNGnM3rS5ILGhX7/6S524Da2OTniEktzAhik2h+b9SRPszHOGxIN5Rq7r4X51kIV2bvQwNORrx5ec1yDYtYvmgFjpX6gCkBjSboqxSUvGwxvI2Me8EimfrWn1icMDsb8Ha5SY4g7UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4YQmOEc2RDGScN538VMp7No3l4BG8BPB6iLj44+8Zc=;
 b=ldTDMUH0Tw92mP/WBOMY+SYhiVzpd8XJfFlGWGUbRXQT3Am786UR6JxjBqtpmx8AiZ3SXGGaqy5BicjqxXPMO8qlY/BeCOMUxtNkr4HRLSj23dWaXzOZafdsJjgk+BE15kQyXryL/CMBYDwLPAWZ4/CT6XFXUmfAzoFfS/ytz1k6FVlj6SzB7hOpilNQolcs6XJlFxaPab6KQ9/5l/0nNmu+IZ19z+OIj1Jx4SKMp/AYRq8Hoj61pu6OabYQ6xO7qHIxu71GlnYe1J6s1uGbQ6LjBzSQlsQl8BbmK+e8ZcXwe0JlkOrRI9s+4qt9LT3ubwv8ikEuvNmFXtX/DaV56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4YQmOEc2RDGScN538VMp7No3l4BG8BPB6iLj44+8Zc=;
 b=UwF5I9vG+aukumeXsdNEzSF86eb3LmgOrisjT7YvpY6ZVsmyA1Wa05bem1osFoTLTEV4DygowEkcDaKhOE/bI/WdxibfTU82g7dPDo6DfUWHCiyNqcEf/sTXhFy5vPvYY/wmU6XDnBK8zTUExjvTadDY3ntriDU2LmOqlyYocVI=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:18 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:18 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 06/23] vfio-user: Define type vfio_user_pci_dev_info
Date: Thu,  5 May 2022 10:19:49 -0700
Message-Id: <0bbbb66ee30dd894d148cb325f221ab65d78d0c7.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2bf6145-5165-4af1-626b-08da2eba4465
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867BB4F99DAC65FBB55499CB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LTcj3BDWwZzge+mB+vgbeqNmFltcvnTh8qlws2deYw+QkxtZdXuLEzr1GfdmIBLp8flGF9xSigi2jQ5XcM9TbctFV8OkiRUhi1vl8QWJwdDxla5dL6tlrmvIVmLT2N1jGxCtLhjDnB045ZCcboIbTiGRU357IPeYueyNeQ02S8o8BSo5cl/9Xvt3rrGyEA6zuJY3IfcnhoT/+Syw631QkFx2ZuKuykA10HIUI0UZPaYT3UAofXEZp1QNbVO/V9DNnSwtDQ9Z0j4lZ3onRlW1ubQMMhohxKdHc/+ilZY4jupJV1rSM42EK+HYiQpy8XfB8MqrsiImAMH22reeia2ubEodoXEm4tBHkKWaVdHASuknpC9tBJ4EIiLl5lRCHxPsy791881/41d06pidTwalT3se2dSwxilpZPeldlLZZCcFYp6o5BtlC94rySnAaiJth0O9gFmiqyOR4JOmSrEyxhVqIzHsVXqDromYxo3/4B7wPZJmCrSlObBMc7AD4hDKJgtWuv2V2LkEHGADandec3XsDriMlI0rextVGc8S5pV5yyOQVrrD1mfeyiaPY+ppPReRBaw2+Fpp2TFnHlZtCqp16yeQI6LPJuNKRqw7nqCDm9BlyDwimcS4NgJLRdq9UVmy8Xtmn3FygsVCc+jMdg9C9eevjadrtqfYe9NUxSo49PE6al9TgtuvvlLgLix8AQdl06bmLkgtEG5zVMI8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sM5npD9NOmP9LTye7KjapEWrN3zxpGW24+JKTqy9NiGLaTjxdpTDdPgB1piS?=
 =?us-ascii?Q?NpHZcl8XcB2oRwHDtqTWJtfIqnQ4II0lPa0mcEdH9a0YTpkOeP7LM0SrhsIs?=
 =?us-ascii?Q?bLYu1JNwQnTseDA+OO2P6a+eLamXmxcVjMpd0N7Y/ywNbKxza85d5+/exmuM?=
 =?us-ascii?Q?woOXy72X0O4AWOOSTG0NDXFvzAc1hNuF18FCwoX5xCiTAt6LYJxL/GiH5A2l?=
 =?us-ascii?Q?1vpuQhnenJb9vZfk2obXIho3DV8/CbQyVo3QNJzKGJh/QyOKzDdurxVhY0LA?=
 =?us-ascii?Q?qoJ0LfkOaMaGa6u3g4S+RpK8c3o0VU+FhZNo0MhTOqlGdO+S4a7SzTnsJi+p?=
 =?us-ascii?Q?WcVi5WkaESgOEryZ8Qt/UZRYmBsl97omI18ap6yqUAWO39PAxxOvOAoauULi?=
 =?us-ascii?Q?qeHmZdSlvHRbWI4kmQQdVoM5P9uwwTO8G4EaoxFkHmWkOI24S5SstCPrySXA?=
 =?us-ascii?Q?MzgHcz50YzTR2DH0SS+qtUC/s9WTArknBXIZluLuZoSKOKVAzidZoVATNCtM?=
 =?us-ascii?Q?k0XO4x/oGJI5VyA8TNXPKWwna5ga5xZTUzMIDHPCLqOUnQDiTWt6+evRNEKS?=
 =?us-ascii?Q?Scw2F6dRmilhumFPNx5fraZPTBdjl7qPjIYthIjHJFM2XGVseLcWWD4eRN0Q?=
 =?us-ascii?Q?rkZlPNRNgswst4p/zAZ9jjwTp3Rr0+/Z2Uakdmouq2uGvYbzBxw6uOmrVpjR?=
 =?us-ascii?Q?BgFhNExNTZNE4nw06RGmvoAn51/CWiq/hCyhozicUnM+N1BcJ1B/MbKLD3Fp?=
 =?us-ascii?Q?gKGTf5o9uRj42CNm2TkrzWqpL4gG8IVF6ew8FQNSlStA/FA2UfsioRlUCRn2?=
 =?us-ascii?Q?+3UHy8pVgOnC+50ylHy6PLe82I915RFSWyKyYAI2DvQqGytsnaraQCX3hwtD?=
 =?us-ascii?Q?Mw8v/8gUt04yJ4+wpvKcMwfmkQHfKLORLzh6mcSgZaLybf4Kl/NposNNCvBK?=
 =?us-ascii?Q?jlca0Yz74cySL6qFidjhdOdOQhG2KR9XoN+x38MH3ljNIsea/6Hcem+2exam?=
 =?us-ascii?Q?ejxzmo6Yvrz0ehuBpaY7niOdqDHgqo70mjHoimtJBFd1nBom8EsWAfvbDkdv?=
 =?us-ascii?Q?ALqb9tktSZIgEsIpHxE7J01+182BquHpTU56L8njfcOjtC5keffAvMM8JFKX?=
 =?us-ascii?Q?Mi09awbCguWMCCpj+/Ks8DW2oX7lszRGFYlsyosGKhgmBLrwFFGjObAlJuoL?=
 =?us-ascii?Q?CMi16h4GBv1OOCzL3AhwtR8bBzkg2p9dtPGuflZKQyJtDuiR92mCComa0mYO?=
 =?us-ascii?Q?I6K5U68UHi6zvMDe6TdL9anbbuQY0sfpKtzvhsBPJlSMCJJyuOuURfRCJKJn?=
 =?us-ascii?Q?5f5yjJImdp2LDMpUMmc7VWevW+fWXdpkWHNcJBy6MWNjBhqfkJMtOLy6tWeD?=
 =?us-ascii?Q?UIyVwzlg+2XtFVZKyUSpRIUSbNOnw20SbqwdyiWUDMtX1U0cNKvFwe9FkypX?=
 =?us-ascii?Q?sgfnKDNjsm9Z4bYXVnrmF6LFhBvTZ5pZrIsTmw1vCAQ6Qx9iS0fBvcKsiNnW?=
 =?us-ascii?Q?aNEg6/Qk6iQb9Srwbr7k6mW84/PhxIZjaKYSqwlMmRt8k6QHrXLYlL6ig7I1?=
 =?us-ascii?Q?ZQCyuevu/onhbHKiGh14I39zbooS6RfCNV8BiRJy2XnesJzycTWD1PsQbgaW?=
 =?us-ascii?Q?h9CX9bKCw+tPsNN0h72u3fR72EDP/dPoc5YFi8u28vUhOfdygtGlKX88gDpg?=
 =?us-ascii?Q?K3htvwf2hdj1+zjQKQyh1i/bPPPqd21xX0n6AncKepdoMkf2etXlVDF26Jfc?=
 =?us-ascii?Q?vtmqLyp0kLbF9kTOFECFzfHuDPoTAaY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bf6145-5165-4af1-626b-08da2eba4465
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:17.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iOid6DzdFb7m+aI/KviOb+z7crr/PG00epXoXzcN5YmTq6COZziUP/LyL6MwSw/TkCGV+/JMgUfHukcGwu325pEABOLeZgx31jrP3Bmgeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: zFeTcLC4qIZVELfVfth4LFDklaSzMhsX
X-Proofpoint-GUID: zFeTcLC4qIZVELfVfth4LFDklaSzMhsX
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

New class for vfio-user with its class and instance
constructors and destructors, and its pci ops.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h    |  8 +++++
 hw/vfio/common.c |  5 ++++
 hw/vfio/pci.c    | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/Kconfig  | 10 +++++++
 4 files changed, 113 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index bbc78aa..59e636c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -187,6 +187,14 @@ struct VFIOKernPCIDevice {
     VFIOPCIDevice device;
 };
 
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0616169..da18fd5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1742,6 +1742,11 @@ void vfio_reset_handler(void *opaque)
     QLIST_FOREACH(group, &vfio_group_list, next) {
         QLIST_FOREACH(vbasedev, &group->device_list, next) {
             if (vbasedev->dev->realized && vbasedev->needs_reset) {
+                if (vbasedev->ops->vfio_hot_reset_multi == NULL) {
+                    error_printf("%s: No hot reset handler specified\n",
+                                 vbasedev->name);
+                    continue;
+                }
                 vbasedev->ops->vfio_hot_reset_multi(vbasedev);
             }
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4524342..be8fe1d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
@@ -3377,3 +3378,92 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+
+#ifdef CONFIG_VFIO_USER_PCI
+
+/*
+ * vfio-user routines.
+ */
+
+/*
+ * Emulated devices don't use host hot reset
+ */
+static void vfio_user_compute_needs_reset(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_compute_needs_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    /*
+     * TODO: make option parser understand SocketAddress
+     * and use that instead of having scalar options
+     * for each socket type.
+     */
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->dev = DEVICE(vdev);
+    vbasedev->fd = -1;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->ops = &vfio_user_pci_ops;
+
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+
+    vfio_put_device(vdev);
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
+
+#endif /* VFIO_USER_PCI */
diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
index 7cdba05..301894e 100644
--- a/hw/vfio/Kconfig
+++ b/hw/vfio/Kconfig
@@ -2,6 +2,10 @@ config VFIO
     bool
     depends on LINUX
 
+config VFIO_USER
+    bool
+    depends on VFIO
+
 config VFIO_PCI
     bool
     default y
@@ -9,6 +13,12 @@ config VFIO_PCI
     select EDID
     depends on LINUX && PCI
 
+config VFIO_USER_PCI
+    bool
+    default y
+    select VFIO_USER
+    depends on VFIO_PCI
+
 config VFIO_CCW
     bool
     default y
-- 
1.8.3.1


