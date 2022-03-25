Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458F4E7A6B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:27:44 +0100 (CET)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpb5-000504-Mr
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:27:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUB-0007ha-VC
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUA-00038i-6h
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:35 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHI9mm010798; 
 Fri, 25 Mar 2022 19:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=QN5gUsZmsVhG2Wn4x3y8/MvKgNNiXltgDD2Y1OF35SU=;
 b=LOWhwMoo95706WCXX7BdMN1bRkBcXLa376zWwM/ZvvN8mIUS15tAXkSTK2Pac+j0TCSo
 kmJI92QSm3F4wmbBnQ/o/dLdJltHHdjA/T7EPM37HYu2rIlXRWXP5y0vKrjYZbvoEjZ4
 86WKRW5IQJuCSCaSGCssk4PZAgNRoilrkCh7tYsKYJYBWegEg74Itj2WlmDF7qnX4bE4
 sfomP/F5yErucUYoVLvrZ2pI144VqIOz6AX8JOrF+0OikKPndmZyMO/Q1O9EaLruxMmw
 eo4j+bt9oSeRNlvNr7RVENr4aTOUFWd5/HmZb3a0lCKsU/em3nB/IuHH1lS+0OL4q5iM pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ssg46m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGWDV043737;
 Fri, 25 Mar 2022 19:20:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3030.oracle.com with ESMTP id 3ew49rgq83-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlSyifhJ28hlXyJtsB5/FUDeZxCQwZr6XRwKI6ghxhxMrW3BaQZTAOx/wLJxpOo+x4BLp0lqbfgoNSwzzvL/A22+mhCM4W9OP7JL3k3qjbwpECtI8IBlqIXlX7PwBEhpzra4VTGR3VObiLPTpNg7iqvSLqBR943m93zi7mm6Sz7Smm4Q7Fcn/c9EeGszdXPsJBPDzZv+DCdR7l9Pf8chNPclkgfgtPwQtNe8J0U0onQTN7/2cMm0yJx2BV46h0+Xz7bfgCRAe2ADJwK2NY+kihFG2gmIxAeofn26t1dVuxr4MUQXoA62QjxhGkR7rYkQ21LYGY/6NFd1SBhh3Qyj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN5gUsZmsVhG2Wn4x3y8/MvKgNNiXltgDD2Y1OF35SU=;
 b=YaCoMRfToZyWETsq6QYmY3bSbqxN4H2CEu9vCmROxnkq4MqIcp4yoiuss7lqOnEJCF/Bf6/Ovl8u1KCoX4MaOuGjWH96PhG1zvcm7GP/JNyaI5b1vtDtNmhXWl46553BcLuBWCXMth1QfQW5sBH3nDc7vDT0CouMZHMuL+YKtdfkFZV9o2JbuN+iwPzjWgZuX1UBHdm9g15uo8qGR623lGAhiVfilfEQjiNe3gr6Fhj7/kCWx6H74l18RJWxrP6UTDi5Dh7uWIzZO7hAxWwZVuciKF07XX5Wb4AyjObE47roqupTiVfQh2lhTp99/skmAYd9JZ9xzaqkMLfc0IsneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN5gUsZmsVhG2Wn4x3y8/MvKgNNiXltgDD2Y1OF35SU=;
 b=XinfCre8XQVC3ah4GJtE7HwSBEAjf6YvzQ66lE+twGhwBvsLeivJ3HU9yHafIqBgduVYVaWH/Z5XARs/ZOopchBnpoUIMMwTryEUjx/GAzvd7hosQD0NVwBm4eoemHwCjVYBIyr3Zci2eRnCER8K45xvPmWxqMXaUF/hKWgijCg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3729.namprd10.prod.outlook.com (2603:10b6:408:af::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:29 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:29 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/17] vfio-user: handle reset of remote device
Date: Fri, 25 Mar 2022 15:19:45 -0400
Message-Id: <adcfac67f710d8ed447531a58b799792f7a8e492.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee653491-bd62-429e-568b-08da0e9485d4
X-MS-TrafficTypeDiagnostic: BN8PR10MB3729:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3729A40A6208FE72DA2F11B0901A9@BN8PR10MB3729.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XtHgX0SKoBGZcTAdkhLbgClmUyHEK2zx9nQnYrb93UWARcWeultm7/A91hMGhywCHFrDLHYTsbwUX/df0MBFrQBqOHE01XfSej1qfUOK9cIxEMcMTgXzXCvVaYlRK2mrcTEPXkdlQNvFxg80nEEY0+KQKzAUWbbXlSSLCnKQAuMdIZ2K9OD0YHkRUjNJYZcA4S/EPE5mNMScmWSPVAQtjToFSf9Z4graiSAXIpr6q+9zIPUDmRbjb2mz7TgwwgsKcLf+UDgs/Qb6Yrvnpw874uykoBTv2x9TeJ1VyIwR6OxHLbmd+KauWdPadvcZ9MD9NrElOEJ66DCn6uUyCDMEXgexMUEXaIWq0D1sXuGIyYLbc4i2YOQ+efWB7JLZ/KeGytXVKwTgcAOIrDmo/XMzFIeF1A7V4bdd9Vvle7a6aRShsNvQ+14QVmcUtFjI2iz0dZCpbP3jke731n3y9wlQQRNOQn60wgH0xk/4yslFl6paVsWyOlBt2mZYWTemv71QO/JLBp22qYYWcWCx8uPVq0yfJbfBmNX1FLZDqBbN+JR33TFAstyJ/xsbiHhSBsSuzQBHysbKsj57Zm5lDwWlMdxJ7cAbBiWUIV/f1DbSSZUem8W9nUSbLaB8mesh9ohfbCY86ZrAEU8lqX8vBOGIpKZ4CJMYrZqhVFx1SOGr7K6DcKMRQyRP+21jSS373Hb4LfPScVYxOlxPotmHPmGYDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(6486002)(8936002)(6506007)(2616005)(8676002)(4326008)(508600001)(66476007)(86362001)(6666004)(6512007)(6916009)(66946007)(66556008)(5660300002)(52116002)(2906002)(7416002)(38350700002)(186003)(38100700002)(26005)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IbrfY5iNshaBtZ58vh2R6puoUET+vIHmQTu63y3DPJM3wtXKH4+mtwtRBOBP?=
 =?us-ascii?Q?k3JFmb0/07WzmGTqzcAkYmy1jE8e15kkBzQxaNig1pwOjpHhEuOR44iSBP78?=
 =?us-ascii?Q?quBLG8MmzZc7FIegseKuVdda9/MZ6Aaltgopk4KUbfTSLqdl+/B0iVRCGs61?=
 =?us-ascii?Q?rGury7N2ZYCiOpb9cHLqjV9R3YOTgRfdcgCfb4OSUVYCKQL9En54CmXkzG5R?=
 =?us-ascii?Q?ZhoyvDeI8RTvisQv62s3CJ7gKsWM2knLX37AC6g16UOD1Tkt0J7va7ovrkPZ?=
 =?us-ascii?Q?lS+0HNzwC0SxL96gxTm5p9C4afMX1b70aqfsvI0XCwZLCj+Krtnuq7dlyCXz?=
 =?us-ascii?Q?YL+LAb+3ALYL9NemJSRUYlnseVH++MBf21oKZZvdh0OL8Z3XslnFR/vxURio?=
 =?us-ascii?Q?UPVOdNvhB3v78/0X4krGIUzOOAAxz/iaymhF0cDPBHdwHMPNvWYNFfEcYvqU?=
 =?us-ascii?Q?uEAp1jhUeRdnjhO9GLyuBxAIFH+qSFyNvO2PNPu8dBy7sPa6K0FtkvxaZPtz?=
 =?us-ascii?Q?ds5IQIpBcBEXQvXk8G68LKxKWS60FVO5Udq50/dB+h3DM6HQgFNVzEytqJAH?=
 =?us-ascii?Q?ac/QoC3YTXzSYn9jtvJDKOcquyCN993tAWwwDyYDnzWxvz29a9MHOAxFZku5?=
 =?us-ascii?Q?JoaSH0HuL0IHM7k2wJ4RZmTE1Ws8TIX1we6gQYXbSq3K32cvZUvVk8EuZOsj?=
 =?us-ascii?Q?+2iT2mI7ti5Fc7KUojEYfoq8hRJhrLJcYF6uudKSVjDIPmlLcHyI9UtVknVo?=
 =?us-ascii?Q?lHIEcLr565NcOowwVjc3gSw6Wpv9QrJryRv1GogFE8IC5ukWlHn1YCCudSuP?=
 =?us-ascii?Q?2OZIbb/djBBb/KmsFWOFCwpMfE4sbm6R4M/uJIee8hC7b+UYDgcdb6BeOmxE?=
 =?us-ascii?Q?YA5FHpFUoAhf3VHSawFGHiM7lWMlO9ZdrCIBrnzYqSRlppEupEs/OzAp7BnO?=
 =?us-ascii?Q?wjHKLtr1tIzoeRLrNq+Dpx+WwmnEha1V39xzSx+BeioBeXFylsXnszcTKPti?=
 =?us-ascii?Q?vPhbxf9Hflu32a27i0FNjJMTCZSxVsQLPNKo4rvKs7yIogQe75LbNmsFBnSK?=
 =?us-ascii?Q?/mdLi8JVo2cRbhKYQXy32KuHqaEvoF4RtiPiv904R4iS5JB5kekcqT0iXxIY?=
 =?us-ascii?Q?C2DuQG+aiwK/x+DRzJUcDSsjSVySmLoymkT3w/zNhdWz4lzQ/jLc3BH9JGk4?=
 =?us-ascii?Q?HG1nk3VPoQdM62jentiH2iQXMpo7pu6owWNZA7zI04LcXFdZb6V/pYpsNUCa?=
 =?us-ascii?Q?VuyEVi2eX6clNsq8jgDYqdg6klmrLZF1LqhfHPtQRWxQbBe/Ou1I+34godGk?=
 =?us-ascii?Q?5Jnc7strkGd8I3Wospci2CQeOKNHF8GfrP8SuG61x0PBtRnAYjBQGG4KrbY9?=
 =?us-ascii?Q?RuaY9OENp/WIqhzVE6H21MZfEZ7nNIPzjrRXln/C/duWTMPFB/8g/WFyBazN?=
 =?us-ascii?Q?ae1dwuLHCYCNsfVRKX4sl1HUmz31NF6BmHY/VR0gTJP+qbpyHLWYotv0+gtL?=
 =?us-ascii?Q?/mGbBJzF96aSW2Vhm6YkCjjMlK0Gv3rbuDC9QhhDgJ+y1yWgQO62OrMpgcME?=
 =?us-ascii?Q?E7Rw0NL+dsP2mhaFiyKDAywc5qlxureIBDefe64h4tQdAHkFBjNV9RoIwrSi?=
 =?us-ascii?Q?raBkPfUPLnoal1AayJW9K61KzZIvG4X00G43W93nf5XmqfditqcnNY4sM5RY?=
 =?us-ascii?Q?UEKclqYHkv0O2lP3LGnAtEYS4MbjbUHogY8fMwrlDFj6zRv2065EZXCRhgPB?=
 =?us-ascii?Q?vEM8lP8FCg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee653491-bd62-429e-568b-08da0e9485d4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:29.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcihd2ueZfq4a/6aLZFUd9EOm2niEgIAeUb6BiJwPsqFqnYoeA/K19fbvsfoTLFpcAGcNWN4J9D+OQGqqkVuBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3729
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-ORIG-GUID: aXTzYWIZnzUcIxpkqZH8uXthvvge7V_j
X-Proofpoint-GUID: aXTzYWIZnzUcIxpkqZH8uXthvvge7V_j
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 19d075a9dd..65e56d39fe 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -581,6 +581,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
     pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    /* vfu_object_ctx_run() handles lost connection */
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -686,6 +700,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
-- 
2.20.1


