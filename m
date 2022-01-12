Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7E48BC00
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:48:18 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RoH-0003uH-Fa
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdc-0000k7-CF
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:16 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdY-0005gY-18
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:15 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMrG6T019928
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3nKSlB2JeJ7H75oqE/Kni7GIa4F6HzpKbKwCPS2xVRI=;
 b=0wkcbeHIDXOOvbJYo3lq630QfC4FmMtku3Y2i47DTpYJUajzOLKJqGPn9ibNbRd2JcWe
 rv5iotmC/CfqweZzp08Vyq/nmSPg/+8fUadvPwu4lUFYAiKaBQ7OI3Nizw7Qava4gDju
 +L3kD9+i4jhrxOjKbYj/t1LsMmYm8STWfaBaLC28UpgBgqJR65gT7KCVc1l/ryaMyqiA
 PFQ97u9vyfhs6V8qa5Y83nmArmTMg0znR6z9+PJZ1Bd/C9rAcUK/S7ucTf5B1/8Js59v
 VVsrQkPQJEkSFx4ZdAYJ5o4SHZpXko/qwzf9nAlt+gF8j5FhpDps99AqdbwLsxjs4/j3 SA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4shd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBD196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRThfQJCxjZyUQN684JRbvg93sl2p7LskOFt4eomJ3hDwXIXWIhXSFu/uMuOyikH08MSFG47zljNBVR7TXZsJJxIOniGgrMOJ6W8hrm5SMHxo18+Jk+cq1/xgTdjz69roahb5/oqY/1aiq2bYi3YXLayvd3aiffbN5eAz/nBvHADLp6KRr+q42feyvcZgaz8EQQtmFgwq8IxJw2Rz62viOWbmdZE1z+4FQkk58Gz7VoM60DETQEGfnjRvVlUnOQWNWJcrsIB8N5wNHampRQrTSzeXJKmnckP7SgDKZwJs9bV3VpVyOicKdWP5iaF4e8zjGU/hI5wtZpt8sc7pPUJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nKSlB2JeJ7H75oqE/Kni7GIa4F6HzpKbKwCPS2xVRI=;
 b=Nfz1TLa+mYjqJNYTnYzIG4OhtrABJU7jwfJPpSj8VUhrvqC7HL1PxTrqq9Y7c1n15+rXUY0pOl/YyHYGCvcmsOk2vzXUbiVSXI3KpSG/NfbBr+4C98lXLkXW76yhqXCUy8Rty3Csq6G3FI7J0xi36LCvcIhCdFQGmvgjouJXfEz+z2wRs5GejkMoYDKXf+hdc98n9qN5rz2nTFGyTEZU5YwDLUPkScX09N8tn0g59bWLABS1KERX21uYZnaI6et1xabNxwPd6P30ci7BBTQtGvzdBsUI/oUYMTsA5xNqFdAZQHJoQ9RUvlYF9xqqsTptWz2MGAoKqusT12RDVrKSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nKSlB2JeJ7H75oqE/Kni7GIa4F6HzpKbKwCPS2xVRI=;
 b=AVzIVu2RVsiKltIAO5Qea/pqiB4xighdTDIgnms5k2mgu62SST1WxJN5bdmaWTmMQn0k1Arl8JHrqmPMhpgDUYdwdRYKliLPbF9b0ExW8KfgJyzi+25mo5Keyzd7YMdKpBMqCuMGPIBcrPJvhlu/J6a5OhyboqXVlNOJZZQbrqM=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:06 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:05 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 09/21] vfio-user: define socket send functions
Date: Tue, 11 Jan 2022 16:43:45 -0800
Message-Id: <62f4ed7290dc1ac50187fb7287ba4d109ea96b9d.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76cddbf8-5109-4568-c499-08d9d563a8af
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB47428A5AAC47478353EA346BB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PxgUf8RQGUCy56EXaqZifw35eBfAuACzUl7LuhToq3YEhMC/40+SjKj1r0MH7z8xRqMVQupXldKDyy1NfRrb3Gx7LVhvu9ImgV45PHspnMgBAq9njiEkMoehWY+1Fz6q35sC/azsySRV2cz/yMN7Rw6H8mLgYHMCg+DOqxHzWQ9DI2GXflcHudYyMMn1C2SgVF8rtYNwvWGhLTROAZ1F83y1etyn7/mnoxwgM6rqYUDBYtfGSBPSD9TUBzZpa9pLGD46JmtyegRsFMsM7PpNP5LPo3mOVCtS6xcc38fAyo9qtSd6vbGe8Sq2GP9Fc0gQmAjJfgNnxMf1PTNKeXoHxxpuPBcF/ZAVnNON6mOLK/WYjqCui4vUkQiPxljvdebXDEXMwPi7elb5dsuwjily+faG3xDWanFP+ruNHz1oMq32ZzM7Sp+eJICVuQAKF7CwSfa1IRRgcWYg4KQKOHSmC67w+s0XdTPp6RrBPP8YLB0SyPZWUox/D4asnqTIEwNIUDlrcsQoPrJHYzTf4n9rzibugLZFnaBRPNHbGPtiryHl7eKxv9Mg8gdTIzV0JJkL/vFEO7HRO7nDt06i6UQloMv4lPfeHgy5/ABAqypMzY8WJrp0PntiztRLT51AeDEzjPrrjm2VBn+1TXQl1CXFCXzRT7SclVE79DTzLSt/baf+lUPWeWkL4opNTxlFAEK1KoYAb+cOrbK6BOLCfdYveQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(30864003)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMeSjgFG0yvjI+U+/nYKkuqq3fUA8vCM/dNINmQkvGj8BBacHeJ166WvTYF/?=
 =?us-ascii?Q?IWwpVZpc05EXBT4Aat5DR8uBY3ylHLVBkCHZld1paoMwOgyYEXApL5fIJo6W?=
 =?us-ascii?Q?Qzo6A0kUi0uY+xliiaZLhkZH1BnIckLtg7hIPef+FmoBtapBpOCcb/qNqAYp?=
 =?us-ascii?Q?OpbUKhnqBna6962PPZjKbRov56PhrPycv5oZ+wwrLOnc1grnan2LDjj0y3Sx?=
 =?us-ascii?Q?HtU3m7Se+C/bfutd0zWFX449B1Pf+yeZKzqAsovJg2jQDdKiwe0aYV0ViJA3?=
 =?us-ascii?Q?8beL50Nj1U5kws4zXolDZ3PLp3pDId0tcMiNj54q3IFQooMdUOpq0XvzeNI8?=
 =?us-ascii?Q?Lz9OWgyoxHP/K0PXowRfWoGdsrZUHR99+qIuuAkVPpC8vImYjshamqAhQzGN?=
 =?us-ascii?Q?XvVWOnPk5/o2ZeGy11oPv2ZKEBgbdXUrZqWuFy+gIuzrWQyb/HVzPT4BtFiv?=
 =?us-ascii?Q?YtgPv3AePSexznfY+AHzGYpqkH3dx56G7z19wCj3ad7uaGd83TUjbSytC+5t?=
 =?us-ascii?Q?6CT71RWxfqt8a6yODyvJEddGw59nPp+QnvbKnZtI9fFIuXqTl53qIOUy8dKT?=
 =?us-ascii?Q?2bffAPCOCB9/4P4GnokQudSoHmwDr8txpkmuPG9UCvbqbhj7QGToUTYo1Ha7?=
 =?us-ascii?Q?KBvAUjBGPDB2S/W/z6Jx3n9VHrV1+VjLrd1u4WJILIAhAmCsIDgwMw6wnepy?=
 =?us-ascii?Q?MPThpp2jDf+vjgedei8Go/xjOoHmw/SJDz3ASmFTQ9nq5GGhSANffG35VPHy?=
 =?us-ascii?Q?ND8qrqRf4sQY8T4aIj2SrK9XMVxP7NDPns4jZwsHHYtr9eTfbYeW/kmJrzkR?=
 =?us-ascii?Q?1OE/esPCJv2yt5rozDaEBj264XtkKh0H9x9RqvLl0jyJITe0ZBRISo37GAiJ?=
 =?us-ascii?Q?YJ4wS/BNccoUWvKAV52GWWM8WxSUTUJRf8wkrHHNGeivw4W5OcCKhxSe1lcE?=
 =?us-ascii?Q?KCuiYZGAj1mebj12byIsSI3izbLuC627QVk4KWDP1/Gcm+lIXqsxtnzdquJ4?=
 =?us-ascii?Q?6LmNiRMMdtkUt71TudWv6+U4anX0NS+9XLlxCDjy9roQXBNOaN04a7BYkBC6?=
 =?us-ascii?Q?GUZwNbCrIfYkEqWekE5dFkF8iEHcQ8g4RHgIxarYfops72GOS2YXcD3GIxsk?=
 =?us-ascii?Q?MyHLy9k57ggk5rbysRDDhzQV09kWN/m/ZtQhKW2KMVHNl5wvxatwGpNwshsr?=
 =?us-ascii?Q?gpYs4Fis53pa4ovlffa2OlnoTSFwmdxIvMSRB8FRphJo/HQ9RpfRBnG2xB7q?=
 =?us-ascii?Q?HVPSw2l+fZHhh0iMMZELArH1VnSd+FiEVmkAA1fd06ZyYJLpibZeG7vOllAT?=
 =?us-ascii?Q?6Q4mwW0xOvC2Lceu57630C5N2o6n86LqHD8uJcl2jGS5OsdZ4nXaWHCCO2JL?=
 =?us-ascii?Q?AKA2Hp4mXHLxpOTwGkLwLJqqylXqYuz/FHK263skJXcXREp/qCEe/vmpNRMc?=
 =?us-ascii?Q?nTr0jEGMz8xDpDvUGls+HAHkC+XFsUYDAi6+UAegnDs+hGsEEbmPN99HD6jB?=
 =?us-ascii?Q?zZ2qHlrry5qAQkVMwhhbZtnH8ZEnc1G2fJjZ454uV8Oz09JWV4cuTAMuPUtZ?=
 =?us-ascii?Q?+XyR2+cgCxGVvUKQwRkURUiUhvsL/rIsbWXY3oHY/afNNgoV7WKxr+1Es9PI?=
 =?us-ascii?Q?AcChc2xm5F3Nqpw01WLqnf5+QEmo8d4pDg6dO86+U/DW5rgIrJhYX2HLS9U+?=
 =?us-ascii?Q?ATMbAg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cddbf8-5109-4568-c499-08d9d563a8af
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:05.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddM/PXMs5OQ4h2+uu3xYhoERZ/sMf7lMcu1Mt+yP1QHKuG8w7NPXixaAcUsjONcUXkAUSUhVvlCp+lctBgjQm6MfiQVBox5nZhJCEmRWe5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: 6D7d0faGxsdyrSRuEImGm7j2AxMrcZG_
X-Proofpoint-ORIG-GUID: 6D7d0faGxsdyrSRuEImGm7j2AxMrcZG_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also negotiate protocol version with remote server

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/pci.h           |   1 +
 hw/vfio/user-protocol.h |  41 +++++
 hw/vfio/user.h          |   2 +
 hw/vfio/pci.c           |  16 ++
 hw/vfio/user.c          | 414 +++++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 473 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 59e636c..ec9f345 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -193,6 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool send_queued;   /* all sends are queued */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index d23877c..a0889f6 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -51,4 +51,45 @@ enum vfio_user_command {
 #define VFIO_USER_NO_REPLY      0x10
 #define VFIO_USER_ERROR         0x20
 
+
+/*
+ * VFIO_USER_VERSION
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint16_t major;
+    uint16_t minor;
+    char capabilities[];
+} VFIOUserVersion;
+
+#define VFIO_USER_MAJOR_VER     0
+#define VFIO_USER_MINOR_VER     0
+
+#define VFIO_USER_CAP           "capabilities"
+
+/* "capabilities" members */
+#define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
+#define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
+#define VFIO_USER_CAP_MIGR      "migration"
+
+/* "migration" member */
+#define VFIO_USER_CAP_PGSIZE    "pgsize"
+
+/*
+ * Max FDs mainly comes into play when a device supports multiple interrupts
+ * where each ones uses an eventfd to inject it into the guest.
+ * It is clamped by the the number of FDs the qio channel supports in a
+ * single message.
+ */
+#define VFIO_USER_DEF_MAX_FDS   8
+#define VFIO_USER_MAX_MAX_FDS   16
+
+/*
+ * Max transfer limits the amount of data in region and DMA messages.
+ * Region R/W will be very small (limited by how much a single instruction
+ * can process) so just use a reasonable limit here.
+ */
+#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
+#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 72eefa7..7ef3c95 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -74,11 +74,13 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_FORCE_QUEUED  0x4
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0de915d..3080bd4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3439,12 +3439,27 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->send_queued) {
+        proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
+    }
+
+    vfio_user_validate_version(vbasedev, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->ops = &vfio_user_pci_ops;
 
+    return;
+
+error:
+    vfio_user_disconnect(proxy);
+    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
 static void vfio_user_instance_finalize(Object *obj)
@@ -3461,6 +3476,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index e1dfd5d..fd1e0a8 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -23,12 +23,20 @@
 #include "io/channel-socket.h"
 #include "io/channel-util.h"
 #include "sysemu/iothread.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qnull.h"
+#include "qapi/qmp/qstring.h"
+#include "qapi/qmp/qnum.h"
 #include "user.h"
 
-static uint64_t max_xfer_size;
+static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
+static uint64_t max_send_fds = VFIO_USER_DEF_MAX_FDS;
+static int wait_time = 1000;   /* wait 1 sec for replies */
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg);
 static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                      VFIOUserFDs *fds);
 static VFIOUserFDs *vfio_user_getfds(int numfds);
@@ -36,9 +44,16 @@ static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
 
 static void vfio_user_recv(void *opaque);
 static int vfio_user_recv_one(VFIOProxy *proxy);
+static void vfio_user_send(void *opaque);
+static int vfio_user_send_one(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_cb(void *opaque);
 
 static void vfio_user_request(void *opaque);
+static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
+static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags);
 
 static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
 {
@@ -56,6 +71,32 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
     qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
 }
 
+static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    VFIOUserFDs *fds =  msg->fds;
+    struct iovec iov = {
+        .iov_base = msg->hdr,
+        .iov_len = msg->hdr->size,
+    };
+    size_t numfds = 0;
+    int ret, *fdp = NULL;
+    Error *local_err = NULL;
+
+    if (fds != NULL && fds->send_fds != 0) {
+        numfds = fds->send_fds;
+        fdp = fds->fds;
+    }
+
+    ret = qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, &local_err);
+
+    if (ret == -1) {
+        vfio_user_set_error(msg->hdr, EIO);
+        vfio_user_shutdown(proxy);
+        error_report_err(local_err);
+    }
+    return ret;
+}
+
 static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                      VFIOUserFDs *fds)
 {
@@ -311,6 +352,53 @@ err:
     return -1;
 }
 
+/*
+ * Send messages from outgoing queue when the socket buffer has space.
+ * If we deplete 'outgoing', remove ourselves from the poll list.
+ */
+static void vfio_user_send(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+    VFIOUserMsg *msg;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        while (!QTAILQ_EMPTY(&proxy->outgoing)) {
+            msg = QTAILQ_FIRST(&proxy->outgoing);
+            if (vfio_user_send_one(proxy, msg) < 0) {
+                return;
+            }
+        }
+        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                       vfio_user_recv, NULL, proxy);
+    }
+}
+
+/*
+ * Send a single message.
+ *
+ * Sent async messages are freed, others are moved to pending queue.
+ */
+static int vfio_user_send_one(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    int ret;
+
+    ret = vfio_user_send_qio(proxy, msg);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QTAILQ_REMOVE(&proxy->outgoing, msg, next);
+    if (msg->type == VFIO_MSG_ASYNC) {
+        vfio_user_recycle(proxy, msg);
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
+    }
+
+    return 0;
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -371,6 +459,130 @@ static void vfio_user_request(void *opaque)
     }
 }
 
+/*
+ * Messages are queued onto the proxy's outgoing list.
+ *
+ * It handles 3 types of messages:
+ *
+ * async messages - replies and posted writes
+ *
+ * There will be no reply from the server, so message
+ * buffers are freed after they're sent.
+ *
+ * nowait messages - map/unmap during address space transactions
+ *
+ * These are also sent async, but a reply is expected so that
+ * vfio_wait_reqs() can wait for the youngest nowait request.
+ * They transition from the outgoing list to the pending list
+ * when sent, and are freed when the reply is received.
+ *
+ * wait messages - all other requests
+ *
+ * The reply to these messages is waited for by their caller.
+ * They also transition from outgoing to pending when sent, but
+ * the message buffer is returned to the caller with the reply
+ * contents.  The caller is responsible for freeing these messages.
+ *
+ * As an optimization, if the outgoing list and the socket send
+ * buffer are empty, the message is sent inline instead of being
+ * added to the outgoing list.  The rest of the transitions are
+ * unchanged.
+ *
+ * returns 0 if the message was sent or queued
+ * returns -1 on send error
+ */
+static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    int ret;
+
+    /*
+     * Unsent outgoing msgs - add to tail
+     */
+    if (!QTAILQ_EMPTY(&proxy->outgoing)) {
+        QTAILQ_INSERT_TAIL(&proxy->outgoing, msg, next);
+        return 0;
+    }
+
+    /*
+     * Try inline - if blocked, queue it and kick send poller
+     */
+    if (proxy->flags & VFIO_PROXY_FORCE_QUEUED) {
+        ret = QIO_CHANNEL_ERR_BLOCK;
+    } else {
+        ret = vfio_user_send_qio(proxy, msg);
+    }
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        QTAILQ_INSERT_HEAD(&proxy->outgoing, msg, next);
+        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                       vfio_user_recv, vfio_user_send,
+                                       proxy);
+        return 0;
+    }
+    if (ret == -1) {
+        return ret;
+    }
+
+    /*
+     * Sent - free async, add others to pending
+     */
+    if (msg->type == VFIO_MSG_ASYNC) {
+        vfio_user_recycle(proxy, msg);
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
+    }
+
+    return 0;
+}
+
+static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                VFIOUserFDs *fds, int rsize, bool nobql)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_wait on async message\n");
+        return;
+    }
+
+    /*
+     * We may block later, so use a per-proxy lock and drop
+     * BQL while we sleep unless 'nobql' says not to.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (!nobql) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+    }
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_WAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+
+    if (ret == 0) {
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                QTAILQ_REMOVE(&proxy->pending, msg, next);
+                vfio_user_set_error(hdr, ETIMEDOUT);
+                break;
+            }
+        }
+    }
+    vfio_user_recycle(proxy, msg);
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -495,3 +707,203 @@ void vfio_user_disconnect(VFIOProxy *proxy)
     g_free(proxy->sockname);
     g_free(proxy);
 }
+
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags)
+{
+    static uint16_t next_id;
+
+    hdr->id = qatomic_fetch_inc(&next_id);
+    hdr->command = cmd;
+    hdr->size = size;
+    hdr->flags = (flags & ~VFIO_USER_TYPE) | VFIO_USER_REQUEST;
+    hdr->error_reply = 0;
+}
+
+struct cap_entry {
+    const char *name;
+    int (*check)(QObject *qobj, Error **errp);
+};
+
+static int caps_parse(QDict *qdict, struct cap_entry caps[], Error **errp)
+{
+    QObject *qobj;
+    struct cap_entry *p;
+
+    for (p = caps; p->name != NULL; p++) {
+        qobj = qdict_get(qdict, p->name);
+        if (qobj != NULL) {
+            if (p->check(qobj, errp)) {
+                return -1;
+            }
+            qdict_del(qdict, p->name);
+        }
+    }
+
+    /* warning, for now */
+    if (qdict_size(qdict) != 0) {
+        error_printf("spurious capabilities\n");
+    }
+    return 0;
+}
+
+static int check_pgsize(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+    uint64_t pgsize;
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &pgsize)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZE);
+        return -1;
+    }
+    return pgsize == 4096 ? 0 : -1;
+}
+
+static struct cap_entry caps_migr[] = {
+    { VFIO_USER_CAP_PGSIZE, check_pgsize },
+    { NULL }
+};
+
+static int check_max_fds(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_send_fds) ||
+        max_send_fds > VFIO_USER_MAX_MAX_FDS) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_max_xfer(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_xfer_size) ||
+        max_xfer_size > VFIO_USER_MAX_MAX_XFER) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_XFER);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_migr(QObject *qobj, Error **errp)
+{
+    QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return caps_parse(qdict, caps_migr, errp);
+}
+
+static struct cap_entry caps_cap[] = {
+    { VFIO_USER_CAP_MAX_FDS, check_max_fds },
+    { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
+    { VFIO_USER_CAP_MIGR, check_migr },
+    { NULL }
+};
+
+static int check_cap(QObject *qobj, Error **errp)
+{
+   QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP);
+        return -1;
+    }
+    return caps_parse(qdict, caps_cap, errp);
+}
+
+static struct cap_entry ver_0_0[] = {
+    { VFIO_USER_CAP, check_cap },
+    { NULL }
+};
+
+static int caps_check(int minor, const char *caps, Error **errp)
+{
+    QObject *qobj;
+    QDict *qdict;
+    int ret;
+
+    qobj = qobject_from_json(caps, NULL);
+    if (qobj == NULL) {
+        error_setg(errp, "malformed capabilities %s", caps);
+        return -1;
+    }
+    qdict = qobject_to(QDict, qobj);
+    if (qdict == NULL) {
+        error_setg(errp, "capabilities %s not an object", caps);
+        qobject_unref(qobj);
+        return -1;
+    }
+    ret = caps_parse(qdict, ver_0_0, errp);
+
+    qobject_unref(qobj);
+    return ret;
+}
+
+static GString *caps_json(void)
+{
+    QDict *dict = qdict_new();
+    QDict *capdict = qdict_new();
+    QDict *migdict = qdict_new();
+    GString *str;
+
+    qdict_put_int(migdict, VFIO_USER_CAP_PGSIZE, 4096);
+    qdict_put_obj(capdict, VFIO_USER_CAP_MIGR, QOBJECT(migdict));
+
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_FDS, VFIO_USER_MAX_MAX_FDS);
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
+
+    qdict_put_obj(dict, VFIO_USER_CAP, QOBJECT(capdict));
+
+    str = qobject_to_json(QOBJECT(dict));
+    qobject_unref(dict);
+    return str;
+}
+
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
+{
+    g_autofree VFIOUserVersion *msgp;
+    GString *caps;
+    char *reply;
+    int size, caplen;
+
+    caps = caps_json();
+    caplen = caps->len + 1;
+    size = sizeof(*msgp) + caplen;
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
+    msgp->major = VFIO_USER_MAJOR_VER;
+    msgp->minor = VFIO_USER_MINOR_VER;
+    memcpy(&msgp->capabilities, caps->str, caplen);
+    g_string_free(caps, true);
+
+    vfio_user_send_wait(vbasedev->proxy, &msgp->hdr, NULL, 0, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        error_setg_errno(errp, msgp->hdr.error_reply, "version reply");
+        return -1;
+    }
+
+    if (msgp->major != VFIO_USER_MAJOR_VER ||
+        msgp->minor > VFIO_USER_MINOR_VER) {
+        error_setg(errp, "incompatible server version");
+        return -1;
+    }
+
+    reply = msgp->capabilities;
+    if (reply[msgp->hdr.size - sizeof(*msgp) - 1] != '\0') {
+        error_setg(errp, "corrupt version reply");
+        return -1;
+    }
+
+    if (caps_check(msgp->minor, reply, errp) != 0) {
+        return -1;
+    }
+
+    return 0;
+}
-- 
1.8.3.1


