Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0BF3BDBB9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:56:47 +0200 (CEST)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oNK-0000Gi-Dv
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJa-0000BB-3U
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJU-00082T-91
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:53 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqJtH028762; Tue, 6 Jul 2021 16:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=SMpTNDG2E0cq4AafHV3S6T8/ab2s5QAoSTHg7ETYiHM=;
 b=rWxM5tapof5WgNKZMGHhXlqd3WsDxe6UDZmJdBpXaIA6MYBea3DVLsbmquTJJlbUjM35
 9C53Xs10FpbzgpeD5wHXRRIqU+CLzV+Cd52W7ZrtOKsNiEccLReWLpf/Ks94lGmcKYaL
 erKKI/NSEtf1UBoH6amW953FntP/i1LMa5AvfqjyVUUAOEQKOSz8v/nVd/b3VBTX16u+
 tBTvhyP1ujyl6L+pn2zo8Jq33skMR1cfzfCCuRND0eOCPgWOo9HgtOuiE91eOO6f/ITh
 OfwFwJgOCfvJ8stT5c5h3DPiPT/MwiIpZCN2JZfjIw3Wy2VVtmWigGmPr8KYrL0yEstR GA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aaaanu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166Go40r159172;
 Tue, 6 Jul 2021 16:52:44 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3030.oracle.com with ESMTP id 39jd11nfxx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lssEl8mAHkKJcznvM6HnaUggQ51MGpjh802X4pxXzD5SWLFA7ZmDNOSoNBZWAqH0i6XdBy1AhP8LgTZ5QkSjj+81dV7pu3Ma4UG1Dz0DfzFxZDAvfGAM8hxJ017bmxHh/5K4GyAnkaOxKhJStg3prB5kbMr6cUGd/gJN7wQJcnMqhrbDIQaWiE6GrtZSdU/81tCztmgTg+1eSKFUIfnGBzx5Zvx4V9EVMYKkhZqDRx7ZIFbmCpSv8g/U162Wmii8mX3LiuB2U5XIxN/AURp6rx+9xAOhDx+0BMArq6opnzckEiHKz6JRi2IswDjzE1Lafp2CZJSfDF4JfvVg16shkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMpTNDG2E0cq4AafHV3S6T8/ab2s5QAoSTHg7ETYiHM=;
 b=oBzvgROBLnl4Ja010cVEW4/MaaRHqzT/JKV+yFlx20pvYcH9qmaiHfpT5s/fXlyME3C+8/JdTjLwW0GycRzgR4GDc5lEG5V4pUIK0EtZz6uZoaXtHUppV84EbUFamR6d2Lkr6ScPPhdPK6tC+0j7ID2zY+omxjn1STzW4YfMABBcAHFBOMfQDTfDoiTt1h+uO9dcDoQ/d8q5x6e8NlRpwsYn2u1aZD48lZwQXzivt1w2RxmDm8EGfw16coyAmovDw6RruFZFPweXhTUbcbSNHChAyF3DHvBO2IuTBwezjxEKu09VvinveXz/29yAq+LoAVWkOtVn/+UJasN7qzvj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMpTNDG2E0cq4AafHV3S6T8/ab2s5QAoSTHg7ETYiHM=;
 b=h4bkeNRA7SbwieAJu3GxYVgzR1EllnZKKNK9x/s3EHy+7fk1wIdkvL6e3j3q8wLEf9nxaAnudiu4aKjGA4atm1UkAXcPzdhSaS9XDIgn/iaLMBE2Wn5Fw/QAknW4qrfSpiQMKASLTXYqCf9PXQk/I2594lxzTuhAAQRf5a7SDyQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:42 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:42 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 03/25] cpr: QMP interfaces for reboot
Date: Tue,  6 Jul 2021 09:45:34 -0700
Message-Id: <1625589956-81651-4-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a903e7-0acc-4696-11e6-08d9409e787e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB29822A23025919C3B4AD5BEFF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GE3fCKSKwjTTjIHRAVd3ZDs4dcFz94oQOCH++Fuh914CaWI3nxBTZHojwaNxh20V5Hwr2XCY6gGcwYCpFkNx+pNAe7nuf9BKDFAD88ypVjyN/0D+hLpnFaUvdXEACF+GBvgQkIEi5lEZQBrZGLSy08H6PgTaAGOS1KPcD1sjce54eKqFqO9BLJjIoUP1e4mPexorUQGpj+dHC+yF/PFeeUtePwM6jYelIwr+gAvIgwoPqKmvqYN2vQi4TLhSd082VP47u1elUUbjk9J7kMy0lA+YYW3PM9SjpvF0Cp2sFmF8pdSaq6kg5Oc5NLlwaAa5hOj6VMaLlUaLCGDmQuviVhz7JduvfOuk3RuTA+T9YCTaGKhv1qwkQxbRvgKvttVnrr2iuGaobQCYt4iN8Di5nzY5L17UV2upfyFAy+zjUvgzAouuhJek0DhU7kSJhX+v616qkUb6Fu2R688e+35rAHxzRtxxLzU9Kf7ih/MCaIL+8QLQAGc4nwoBceZBs9pUci4z4Ara2NMzDgMxw4/6lJtYkIgc7UsZ4VXFQfJUBn2f9peheIcjuUtejk85vfJGsFIFIsaoBqYTuK03qtopqYqbLT6ChArZGMt8B2pPoLmWITZb9HYEDEM+v+ICEEc5OjGcyACqb36BjCOrc8zL0tx84DjApYRDSsayQupCnyuVgbgxw6qQO+R01ROCz+BeDsIXknpf60i22kI0eU01TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SN/hgQcRQA1SZEd8000bDtV2CvlDV4IJrnaWQCU4Qb+1yEDIsjLpo/T1WIVN?=
 =?us-ascii?Q?vaFxkxLVuu0UkkyBGBOdQRQ2XqDpfUeYARHbiWywfqqYsdUpfIVz9n4d/mGq?=
 =?us-ascii?Q?lhViEikyZbyWmmnKdPfiVVktlNKeG1R92XdaSXM+I45KBKv5P6WMemDOALi0?=
 =?us-ascii?Q?DwmJ8NtiAFzQY881/N5mXHUGBR+iXdNMjPSlnODi9q/Aer00+fZBiyZK+uFV?=
 =?us-ascii?Q?8NEeF8Wcyjx4pUkHuz+osiHZuzXyg71mtv0GcFfFnCVgcC42MPcH1gM+h+SD?=
 =?us-ascii?Q?lqvoigo8Qi0KWWCAGUPud+QnmCTgsvMfhsp37pBGh1xbBTCk/KhLRKIvMNkw?=
 =?us-ascii?Q?W2VTB6Fk/s/VB/UF3BLBcJRsA5mXU66S9nF0oLuXX0Aw7j9cgddWMMP6O9eg?=
 =?us-ascii?Q?MxGpIIiDGQl7BexlMv72JqxR6L68j4574NwuebgiMtz/1f4AH/9U2dAK/9Ua?=
 =?us-ascii?Q?B/I0lBWJ9J2z3e7KD3CBA77ygYyJM+sXuqcNH0OPoEKjdkW6zlCHuH9IsKli?=
 =?us-ascii?Q?3xHQPmIkDZVTwJZ/SWhLmDz4RVUVp3tEyOppoMAdLIdKNwURVVwqLqulmfgJ?=
 =?us-ascii?Q?S15WQYsICg8oFCcDkM9SoiRDqoCXUEMrlPxnNAbZ7N6HcWjUy4eMUDih6EaM?=
 =?us-ascii?Q?9AlUdfh1ch9lJ5OaKl/beaEqzz8GCYetPSunyEkjfZhayA1qWMbkVBOctJzo?=
 =?us-ascii?Q?TAAi3mddnoCJ+E6mlzSKE6enHAUVfdYtkPSbzbEN+jB2AHenN/rz6QQPMSUP?=
 =?us-ascii?Q?77j6eFIKvwO7Vkmk60XlXiWfvo9tNkxAkDXoyKtVv/NmF+Sa97oAT/p9yuK8?=
 =?us-ascii?Q?zaKXfESx8ipSo9nLm0blMJkZb7+XxAeNBQMtE708xmyVlr+pj4DlnYGFWxHX?=
 =?us-ascii?Q?ywWhniGhVrc56U8THtCuSKqDyz+/doxRl3LuSzWSg2LeomH9h3xig1Q3o5ye?=
 =?us-ascii?Q?cPdD2bKyLU5g3TNPjBKIFRXL04ycJoQKJ1+JyzRBpU/5mc+nY2KG9sFfZFkL?=
 =?us-ascii?Q?3v693DzSHPIMv3ApJau8f0iikquXVFpwxpaoucCvwksscbmuHv+iVGiinhfk?=
 =?us-ascii?Q?Qt2n9S9rQIevd9SOvs6VW28zBj8ag5xKb2N6tco091HUVhuxI0wKGgRaZIO2?=
 =?us-ascii?Q?m+wO2wHWjqqFPUQwCc5n8Vg6HxdmF221wcyqrtMONUQkJRsLxJyL4xIBYcfV?=
 =?us-ascii?Q?j0eFdD/NTSmw/y08SAHPV6DE1YbkCQWx3uiLD1vUQabxPYI/gFVCFUwrRnmK?=
 =?us-ascii?Q?xkvaiDkMj6MlcvaJCeEy7zW5pkg7LaqdHRQ5ygaMl9WTrtYGZAEb6KXLF59y?=
 =?us-ascii?Q?E4IOnEVDG/puEh8fces9Mx5i?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a903e7-0acc-4696-11e6-08d9409e787e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:42.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZJW26jzd/F2Sui9eJr++vSI9MQCLA5Z6cGG5KX1GQ09RX9bNHQftIs2FUxmMBkqjheTvyNjrWT9lsq3aIEhGQ2WNHybfNhDBnanjNUqVSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: eHs8kheX0nIISBK3jnvdIBKiTNjQJydQ
X-Proofpoint-GUID: eHs8kheX0nIISBK3jnvdIBKiTNjQJydQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

cprsave calls cprsave().  Syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot' ] }
  { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }

cprload calls cprload().  Syntax:
  { 'command': 'cprload', 'data': { 'file': 'str' } }

cprinfo returns a list of supported modes.  Syntax:
  { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
  { 'command': 'cprinfo', 'returns': 'CprInfo' }

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS           |  1 +
 monitor/qmp-cmds.c    | 31 +++++++++++++++++++++
 qapi/cpr.json         | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/meson.build      |  1 +
 qapi/qapi-schema.json |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 qapi/cpr.json

diff --git a/MAINTAINERS b/MAINTAINERS
index d337446..d4d1e9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2849,6 +2849,7 @@ M: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
+F: qapi/cpr.json
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6..1128604 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -37,9 +37,11 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "migration/cpr.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -153,6 +155,35 @@ void qmp_cont(Error **errp)
     }
 }
 
+CprInfo *qmp_cprinfo(Error **errp)
+{
+    CprInfo *cprinfo;
+    CprModeList *mode, *mode_list = NULL;
+    CprMode i;
+
+    cprinfo = g_malloc0(sizeof(*cprinfo));
+
+    for (i = 0; i < CPR_MODE__MAX; i++) {
+        mode = g_malloc0(sizeof(*mode));
+        mode->value = i;
+        mode->next = mode_list;
+        mode_list = mode;
+    }
+
+    cprinfo->modes = mode_list;
+    return cprinfo;
+}
+
+void qmp_cprsave(const char *file, CprMode mode, Error **errp)
+{
+    cprsave(file, mode, errp);
+}
+
+void qmp_cprload(const char *file, Error **errp)
+{
+    cprload(file, errp);
+}
+
 void qmp_system_wakeup(Error **errp)
 {
     if (!qemu_wakeup_suspend_enabled()) {
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..b6fdc89
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,74 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
+#
+# Since: 6.1
+##
+{ 'enum': 'CprMode',
+  'data': [ 'reboot' ] }
+
+
+##
+# @CprInfo:
+#
+# @modes: @CprMode list
+#
+# Since: 6.1
+##
+{ 'struct': 'CprInfo',
+  'data': { 'modes': [ 'CprMode' ] } }
+
+##
+# @cprinfo:
+#
+# Returns the modes supported by @cprsave.
+#
+# Returns: @CprInfo
+#
+# Since: 6.1
+#
+##
+{ 'command': 'cprinfo',
+  'returns': 'CprInfo' }
+
+##
+# @cprsave:
+#
+# Create a checkpoint of the virtual machine device state in @file.
+# Guest RAM and guest block device blocks are not saved.
+#
+# @file: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 6.1
+##
+{ 'command': 'cprsave',
+  'data': { 'file': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cprload:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cprsave command.
+#
+# @file: name of checkpoint file
+#
+# Since: 6.1
+##
+{ 'command': 'cprload',
+  'data': { 'file': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ce..7e7c48a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -26,6 +26,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
-- 
1.8.3.1


