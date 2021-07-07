Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB943BED26
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:33:57 +0200 (CEST)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BQq-0006qn-Ir
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKc-0000bz-C7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKX-0006oy-Px
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:30 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCM48029339; Wed, 7 Jul 2021 17:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2ylu0nrbapz928ODfW6tooyy6gNxR15ENSoHZRlcTrc=;
 b=vL6GBBcwmzXX71pomlFivwlYGBg5cSQEa7zJ6Rvyrh39mULVuuved1JvLOfxauk7OeXn
 eKlbEnzdh1TeriXmmzGwOV7FrhQiFhLjmB/y2MpNoAZTEtC2c9/aY9kCPiUdXNAna7by
 k0uk5lSCgiiDMWPHrDkUTlm1dnVR6mzbJRzCBRQ+2T9oVu+fym6xnKc6u0cSPRJhV+LV
 gvYLs3TuCQVh6rhzXGt4Mi2QZKcIJ4tqrX4zuprpF0kCgJUMNhkjCUKX6kZ/6lbc7BfW
 +kuA1h1z4rtUSpfZgfudiv26yCjPt/+ZhWnKhU0Or3n3LE+EGFd36MoY+h4PYoZb4zI/ 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAY40155372;
 Wed, 7 Jul 2021 17:27:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3020.oracle.com with ESMTP id 39k1nxjv80-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJI9az88Kd1Ujw62aa5GlMJL/SZVy4lYEI33MBfxsQWAdxUenXrVxjbMWQkgVEpleHIkO6veoiqkx30dBenNfPt1RRY5TQ5fDy9zqKh1VT1ln7YnWAdSMyE9+8OEN7jTD2DkFNBr4KfDr4WZRPFmsywJMneeW7rRQZTZHRZtPI7iCBhb235D+8kAD9OsRS4B1BB9Z385PyX7Ju3FdycTA3AFm/Hy85BBadRVs2Y5KEyahkfFPWhzp9HsQj4is/2Izj1XlWjTfaANZW31vM70MByIWOSEzE3oPoaaUl7+1DjkoGYH3i6sR5oFUuh/bbAEVw3FoHgPuUE5UIyCG51vKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ylu0nrbapz928ODfW6tooyy6gNxR15ENSoHZRlcTrc=;
 b=oDv7Th5qoDtkyZWxYZTiLUygYGpYkcvYdd4MAzi6xKhYlzppExtlljmZwevOTFTKHCz/Zz3zM7jJ7Rk5ncRtaAHIWMqDkvh6TX0wrdkWdXUwImzFnTf/Q7OdVumgFeOVIj0wdv/GN/VdDe+6kdl87TDwrqYkU8kYyat6Sc3B3plbMahGdgHtAMgtNVh5cYGHXfI0LL/3SL+MCZy0ULswbdmoonws4UF/D7owcHJrhXyOsGrocNUO3lpnjRddpfbH/Ph9upciJnFMoLcY8nQScri6w/Ldg/HW+PyFUvBuVBTo585kd0UCan2KLHlG0/smqndFWz5CeJJqfHOFuAcchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ylu0nrbapz928ODfW6tooyy6gNxR15ENSoHZRlcTrc=;
 b=RKpYQGHOQWSOhhjW6hXA5dcq6whtRevhzoo2w2onlMDNf1hpud/xyDdEtlVOhjjaVossa/F8J009mbRgnmo4DLWnHQ4Od61S2udg7CjVO1LdE1VmK3wRnNIwJyAMwj+Z2yReLUyYbwf4AZtqStPSITfoEx+Ws/RQqBIKaeCfhAA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2534.namprd10.prod.outlook.com (2603:10b6:a02:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Wed, 7 Jul
 2021 17:27:18 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:18 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 18/25] vhost: reset vhost devices upon cprsave
Date: Wed,  7 Jul 2021 10:20:27 -0700
Message-Id: <1625678434-240960-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f68adab2-3080-42db-4e8a-08d9416c789d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB253465C23B0B1977F6CBC821F91A9@BYAPR10MB2534.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ecMUnKMYlcEr1dtEA2wrLLogceBCMrivkiAXgZOaOspMeuv/2TaEcOAjPJhR215DGCKwrakMN6K8ykjQtbDjJNn2pG2VR5ZVx25L0+ZFEfwzIIhcc+Jifv995QoVLAadJrmbGl1uuoFzzTrZNpJYIbF8KyRRzLuzP+6ISB/4GfWRtKwI20c89BmabK3+HOOXKNzeiIpU4H74ERjzx/cRl8+x0bWBUySZ87Jvc6zOeE3ZKer/mGDS+092Qmlw+jO1n2Gn9/mB6Veyb3Hoiju9ED5qLuMjdCbfyz1Hb+YN04JyXKNtwQoyX8+batIcPnJosi35QrHMbGd3nEghZcfNsNtnhx/SnR8VWQNkrtKZ2WWs+d4k6hLo02sd3CenKcBXPEhft/UI4k5f+U2Qz4RFnBQ6aJLAque7DvtYSSB5PDBeeBI56sALMZzk8ERNmX0RIxRqfnIaVUU2vSN9ZUTyvHxSF/MZRxGsScW7fwSYC1No0f4o1YD+FL48LtO8sUchRIObWr9gWfaSDNUifiXcgOLsO8XylGGE85ekVD3EEFUw/8OOM8WjRatBrBCPgcxAdmQa0Y80yzjkrVJlwmkF9UdKPjE3/MhP2HcG8zg+VkjrKmMKn1t61USsYoTDfn0empLaLuRRJ7vyn+hcegOuIYufmnk88Rtd17OBTZzqQHpTJuWsQkQ8j6wGwGeXGxz9i7sI+CqVABMR9o08faDOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(66556008)(4326008)(66946007)(186003)(36756003)(5660300002)(956004)(2616005)(38100700002)(83380400001)(38350700002)(8676002)(26005)(54906003)(6666004)(6916009)(66476007)(478600001)(7416002)(8936002)(86362001)(52116002)(2906002)(316002)(7696005)(6486002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a3/ED28tT6zdJXtpAj/AUFt9VTij+RG46tHp0zbXErWSRiKRxkMSUoCb21Ot?=
 =?us-ascii?Q?sjHbMEAXg9VY9JzRRtZZAPB3Dvb9XW3wERD3M884Iie9nfw2Pfe7Eaw1R35s?=
 =?us-ascii?Q?8o+Y5iykiVuvyyow0HFVgrXmje/fBfrAnoTRZhHnATOti5y/rjirpCizU4WO?=
 =?us-ascii?Q?Z6YZg9iAc/WU09H/Dzh5MczH9zH6P6OUYVDexy92QxAB/8be1V1f/AruNuwm?=
 =?us-ascii?Q?4ACFRMfUTJ1iYCpsMXSbr28+DrTAbaDpMeTzELqnZTMstr/U3U01i+tPnVuU?=
 =?us-ascii?Q?VLsaWeU2V4YTCto9qlgVBADfmELIq/fvtI+MzYOpzTcaX7x3Yh3nrWdvASv2?=
 =?us-ascii?Q?am2N/VvSNIGAtWvYNWVRVrqpM8HYnNfHVqo20I7K9E+VHOWNSH3cqXUcRoeB?=
 =?us-ascii?Q?a49GxoCAANnzQL1ddx8fuIFaX7xkfU9UO6gDXFbsIX6kvjUGxvOwhXY4iV+/?=
 =?us-ascii?Q?4yqnbC53VmbylKD99l5pd3WUsJX9qNDIp14lXuhkZjZPMtHdrCjmw/nEt5+A?=
 =?us-ascii?Q?MJ5eEKWDW6Be/XPLsUNdbOeBV1+jJn7SSxiOXbdlT9T8uDB6N2Urm4RBKsp8?=
 =?us-ascii?Q?nkCjDOZHKHbwuesFzJ6VfObRq566NOqozEg3NznebijOoH98uEiiw5S+8gyy?=
 =?us-ascii?Q?xk0R7X1i5mCAgnTv3IbAMStmvnvTF2kcdEb1ryQjvA/OztkSaXVaHahTGZ5v?=
 =?us-ascii?Q?kQzgwhpiI3/rBa2hIdh8WLC7iSSjz/6WmKfBJOji6ekhaLjqU1lR0Eal/QHt?=
 =?us-ascii?Q?d1lkb4gaYRYuGByuDNIbF9gbgWpGwpBvqQo00ESW9E9YsDQLGkWmywJoyvwA?=
 =?us-ascii?Q?icein3weoEzcATB514Ls3I7ipmSeze5/q798Svnu76RIp4K0pUEqPmkYtxEO?=
 =?us-ascii?Q?PdxiDIinj/TOFMzDI1kK1J0O13D2JdfanEB2gbOthlgPii4ZR+1ut8Xu+h1e?=
 =?us-ascii?Q?xQoX6bgYIUP8/5S28qHkc6iKJaJItMjSifzwA462jAfnWbAm3yVu/TG0JcTe?=
 =?us-ascii?Q?sea+2yprh6udvBYnBF+qwcBwLx5aTs87iBsh2/VmpfIh4ftGjxKHelUPmQHd?=
 =?us-ascii?Q?Venco6s/lzmNpZkTIeYYSA8LIQ6WC6Iwfd517slGSNzpFaQWb/kkygrx5bmM?=
 =?us-ascii?Q?zZnEnH1pbOh9DVg64527Voo1nLfVESSjvXjE6e31K16JjRr71s3uRt/PzEFQ?=
 =?us-ascii?Q?u3Q+qEF0qcBXmMf6VzPJE/DTO1m/jcKr9SzBEF0moP7Zba+m5/c/JvrZLZFd?=
 =?us-ascii?Q?YM050cjdjJo/NCy760aqmzKDC0dWxOmtABIy21tU3EIIdH36f9Qhj6GfCNY6?=
 =?us-ascii?Q?adeSPz2I6q6e6JkwPo3anyTk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68adab2-3080-42db-4e8a-08d9416c789d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:18.7073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dk5fMJ4MfXPus/Sl4KHa6yYeWKN9ft2Rk+rG5cPm90Q0paoVvc/IYWWZHamqGuXsFVl09I5crdZop+oESVycBTAPQ4lgXm2dxXG0b/WnKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2534
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: u5kpwLmOaqbSO1vQOAQedIUlZAJ_QjLm
X-Proofpoint-GUID: u5kpwLmOaqbSO1vQOAQedIUlZAJ_QjLm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A vhost device is implicitly preserved across re-exec because its fd is not
closed, and the value of the fd is specified on the command line for the
new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
which fails because the device already has an owner.  To fix, reset the
owner prior to exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/virtio/vhost.c         | 11 +++++++++++
 include/hw/virtio/vhost.h |  1 +
 migration/cpr.c           |  1 +
 3 files changed, 13 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5..3934178 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1832,6 +1832,17 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     hdev->vdev = NULL;
 }
 
+void vhost_dev_reset_all(void)
+{
+    struct vhost_dev *dev;
+
+    QLIST_FOREACH(dev, &vhost_devices, entry) {
+        if (dev->vhost_ops->vhost_reset_device(dev) < 0) {
+            VHOST_OPS_DEBUG("vhost_reset_device failed");
+        }
+    }
+}
+
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file)
 {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 045d0fd..facdfc2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -108,6 +108,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+void vhost_dev_reset_all(void);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
diff --git a/migration/cpr.c b/migration/cpr.c
index 578466c..6333988 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -142,6 +142,7 @@ void cprexec(strList *args, Error **errp)
         return;
     }
     walkenv(FD_PREFIX, preserve_fd, 0);
+    vhost_dev_reset_all();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


