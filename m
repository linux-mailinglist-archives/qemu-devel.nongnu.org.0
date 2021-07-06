Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE83BDBB5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:55:11 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oLm-00054v-CA
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJf-0000U7-PX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJd-00083S-3C
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gq4aw003050; Tue, 6 Jul 2021 16:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=p16l0WPBMG4jZxEyxo+4hfuLsJ7gQEWt4ArQ0Bp4BeU=;
 b=JbsnlIcMN4huc5g6V8TQ1yr9ND8P5QZJ7sMDhxNXSQLsk1+6CtugZ6Kk0JI941SvAjeG
 3rDDzNHYXA+czxUV6CGg6lSDZaW144YjK9rLcVon4q2TNdOcLzZwOasgSEDJM3DLss9L
 cHD0PzmzBtnLSozopBgMyivtWgYXbPkHlftN8q/0pFvn6ctOE2/REnAKzbSFOUZbnkGD
 WchpzkyygRNfvk9hrpKidYL5DVJ6or8MASKWdG11pClhLcl2Y3p3/tLk/92oUKGYf8/P
 hna9zUFkf90VX3eGOmttEyyHEwasu3iQwEeURo2SOY2ohltCboXDFe59GSs65Mu0I1on YA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mha8f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoTNe003614;
 Tue, 6 Jul 2021 16:52:51 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
 by aserp3030.oracle.com with ESMTP id 39jdxhgbmk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET57Dwy3ZcnTTOoAo1UnP0AqSFuXJEOFvpZnyJHCTKWajvMQUKqbxtQqiLifG69FFLK4RwvVtwu9yl2kqQekff9xii5YREaA/2yJnoLUrSV9b8EkMUclZLEu00KNTb+RtjQETu+eZQbLqSzt/lfKgah0PtBHL9qnh+EGURjO61BbmOmiumzfGN1efaiqUQH5diXL9BS7+qvo1s8ErWjXx/57ybMXRY2CGq2F2iL1dS/s0X66/TToHcYCHZhWePKFuT4g8zoDWaIhvNg0+Me+iwJZKhJc7XIWvG/qyTJJfBaSyB5uUatAVn2tImG2/Yq7CJdbFKmB5MkqwoS7XmR0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p16l0WPBMG4jZxEyxo+4hfuLsJ7gQEWt4ArQ0Bp4BeU=;
 b=BHMg2vAS9POz/xSpXhAkGVzsV/17MCY2wcyBDNIhvzmcXzLcs+9e9qopoomC9E0Ve6e+Z31B03o0irTV+CRVdIOH9r+8E+Z/XI7zgCmZfAEqQgLvWbRciRh4mkW9/VhloNTz4+LTBEbKLDC32bd+apCKQ3R0rksKDTv3S3/td/9qjBWy4nLXGF4p8Fip2glTqhL+uTn1zwFrEcA2iOnciIDkdNPllLxtTYMia1fYAT18fiUeKxPzEBiYt0F6VVTLmCwrFr/+/0oLYslIx6SpdfWOS50y3kCAJ0ZJ6vdNV3pe3TZcFlfBnOUAUOr/O0MVSNjgNGxnQVE1tnq8daLPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p16l0WPBMG4jZxEyxo+4hfuLsJ7gQEWt4ArQ0Bp4BeU=;
 b=zTzslgqtjBNeBa/H4jqXnVfQF/OBwrheScpwsLJPnVjQTsQmiwEbjtH2J6M5qzcRQp1XIo4PTOjci0KAg/WTAcb9q3xSyqRXYReTP7zG2xHdcVd8x4x0O4abe0AAXn2FDCXNob02rhGOioYhwa4IhzMPkhE3FLPAPby2V4rvqj8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:49 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:49 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 07/25] machine: memfd-alloc option
Date: Tue,  6 Jul 2021 09:45:38 -0700
Message-Id: <1625589956-81651-8-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bffb18db-b062-40ba-0db3-08d9409e7cf7
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2982714CFDDFB0DF4C091B74F91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjiTEA4iPSLoiQFKf1Ka4dDx7v9jYhDsy2gziHqMeGoFGN30j5mCHo/LA2pEehsL6hJHNgJ3m/0KuG/cWatd+gMF5yJskmSSnbiBbBxhU7bn8Xsyc48OCHheOa4Moh6wwushx+uyRu6fmyQVlvGk9K4vuYJOasnD/guP4waChdoQiT97Ck7QGDTK9r29yZl/Z2s42RLlgPLwtLsuvUQFwc0v2jTT0F5lB1vZ4ABdgTUZQ059Mr0jgCmmGx3H0BLYxHV7taA2w9wQMGNtQblnaq1KNXCMCGSVMy6AYjX8NWh4BcJcwMtTUXGISEGUs6fAi3seOB3KZjYBYFjEbFgcwSQLkhBpjQfeUnrQjuBxTwwsaRFanAj3Jz+N6rJI8hPqaQxpb5mKuvkKneS7ZASXMCtN3vSws2gctVz3sOHYluHxla+pb/bD0SJA0cQf7AnoZxBAe+rAj0XdQHgTV65GT52aThe34mwh1V6PqlhSRvCFGbt5/u7aFMsSI9qOZWhnycNyHRdmdq18cYlBSt1b8HhrTrNL73AHIvvEQyO2/AAef4LzULR4RUM7AKsc7G13rgV0nXOIhu8UjFx10tUiJqlvY9uIJwyj//d6zom0m2/CIm1+u9nN1o27Ty2JxOLkLsSMDowDbEyWSA/TkmKmHNBhN0MkiwmLzuklJUhCTT0eBp+XNWfXQ9+1hklNJPWq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awOAYNd7Cv69SVVe42SbsXMyVOjjCnqOgsD5ovW/EOWRBvQei+8WkAqBmqjX?=
 =?us-ascii?Q?osY8MUVlnq8KZYxS8uW9omhfjlMh9Yu4cUvdfk45z8C6lvl076WW6s7uJuMd?=
 =?us-ascii?Q?9uFUx27qGtmdzBBSgpU4OjwyGUsw+3UrA3bo3fK7LBv8tTBsBp2h9Noqd0Tg?=
 =?us-ascii?Q?/Yj4Hm81gPUyzWdSUBc1dmTjvSgI1yyP5URN1u3lEwW13WUNUFIje6I2ytWV?=
 =?us-ascii?Q?rNveCvsLYx/kAQukm7kikms9h1vkNTzf0Q642we38TZllqIehmdlQMs/veeI?=
 =?us-ascii?Q?WidTiYboORfd19G6rZfIhAE5YRp91/HYLhVOVEEIrZmitxb11S8XeKR7kjoz?=
 =?us-ascii?Q?c+lx+eR+t3d4GMBoW8ABo6VxTrX3Al70Dcwdkez6c7Rf14pfmbavg7kSCv/J?=
 =?us-ascii?Q?+EbvU6qjMFyCG7Eg7F0RIlXSCman0I7qd5g3h1B6+Sw/Ye9oYH1MrUG6j9+w?=
 =?us-ascii?Q?UhkT2W6KsPONn2Y8YeruVBq7CkkEUTqrIVErA0lsT92LzhsuBcNrdjfoi8cT?=
 =?us-ascii?Q?Tb/hW8LuLJBfh/wB+y8Hm1OpeQo/Ti8tYBKNAMEl/Nr21hsiCWxwudxfnbvT?=
 =?us-ascii?Q?Cd/B+/oLyAcJ8CW/eQiKLpdpzUdIjJBBZDKPO4paAm1OLhPYoGt4Ihmn7F1T?=
 =?us-ascii?Q?IvXLKWGJqeeURVf2th7D5WmUEmOB4tcUz/wDbVkHR3GHxpR1T0GNpZgcpXaW?=
 =?us-ascii?Q?zM60yTWPS6vHMrJmPRblM6KhsNjvxfxffx6w6NBE6Ko7Wf5L4szpnfT1IKYa?=
 =?us-ascii?Q?A9U99SCVSY73cjgzB4SEvegESBdhSVj4cNU9bTyhoNMATgaTvuse+iHvKopJ?=
 =?us-ascii?Q?NZFfxAP/a0WALxC8rErZOmdkwJ4hI7ne6QcXXt5pvc4ibXDrKWJgvnb7CFjc?=
 =?us-ascii?Q?U4OO/MxV9Bandv4xNfCQflx1z8IsdxnIUi3wi4PlQfO05M8Ojn/nUo8ofCZR?=
 =?us-ascii?Q?NGe0raJawP23Hvf8BZ8D2xmP+RH79DHiyV0XyuvCwrKfS8PNsfCBOGvMH8jt?=
 =?us-ascii?Q?cnv7W8IRO/XQaF8hPDJCEZBYA3qOwOcC0w/8g0fidVzcsGnPBceJ+P/p/ufY?=
 =?us-ascii?Q?JrhZN6DT1mLotljozTYE3Y7oFHFIwLYjzWyBr6U18wEHF8MVtaOPwhxRnYC5?=
 =?us-ascii?Q?CaZcadtMhTyB3BLJNRSwQv8Hl04N2uN1DgZuQRQW2gwKJJYs9F/0LXVkvT2N?=
 =?us-ascii?Q?eA5Q2oHewj5OoGxVYHwvKERa7wJn6dezvydgmwEsvgnsqj4Kc2m0Ogd4JCH/?=
 =?us-ascii?Q?2i8RLNdd3N4RMgkQfypJ/p0XbMy62ArKTPoxTg/JbuAtc/EjKy/S2Bj+svo9?=
 =?us-ascii?Q?j/RY+7oB8jThTpFKCCuH1X8m?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffb18db-b062-40ba-0db3-08d9409e7cf7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:49.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLLsO49uMKCtOQk7IVLoo/eDD+6Ak/+2luD+JDy34lR4FncF3VhKwE+H3QB8naP8wRzXyLCH071pJT/UVuwo2veUkVf6K51i1W7L3ELjSX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-GUID: S0LVfLJjjsEXoWBHJD7D5-Gy_R1FnVyy
X-Proofpoint-ORIG-GUID: S0LVfLJjjsEXoWBHJD7D5-Gy_R1FnVyy
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Allocate anonymous memory using memfd_create if the memfd-alloc machine
option is set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/machine.c   | 19 +++++++++++++++++++
 include/hw/boards.h |  1 +
 qemu-options.hx     |  5 +++++
 softmmu/physmem.c   | 41 ++++++++++++++++++++++++++++++++---------
 trace-events        |  1 +
 util/qemu-config.c  |  4 ++++
 6 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78..3ce5303 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -375,6 +375,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
     ms->mem_merge = value;
 }
 
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->memfd_alloc;
+}
+
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->memfd_alloc = value;
+}
+
 static bool machine_get_usb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -858,6 +872,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "mem-merge",
         "Enable/disable memory merge support");
 
+    object_class_property_add_bool(oc, "memfd-alloc",
+        machine_get_memfd_alloc, machine_set_memfd_alloc);
+    object_class_property_set_description(oc, "memfd-alloc",
+        "Enable/disable allocating anonymous memory using memfd_create");
+
     object_class_property_add_bool(oc, "usb",
         machine_get_usb, machine_set_usb);
     object_class_property_set_description(oc, "usb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ad6c8fd..dceb7f7 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -305,6 +305,7 @@ struct MachineState {
     char *dt_compatible;
     bool dump_guest_core;
     bool mem_merge;
+    bool memfd_alloc;
     bool usb;
     bool usb_disabled;
     char *firmware;
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002..3392ac0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                memfd-alloc=on|off controls allocating anonymous memory using memfd_create (default: off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -76,6 +77,10 @@ SRST
         supported by the host, de-duplicates identical memory pages
         among VMs instances (enabled by default).
 
+    ``memfd-alloc=on|off``
+        Enables or disables allocation of anonymous memory using memfd_create.
+        (disabled by default).
+
     ``aes-key-wrap=on|off``
         Enables or disables AES key wrapping support on s390-ccw hosts.
         This feature controls whether AES wrapping keys will be created
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9..695aa10 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -67,6 +67,7 @@
 
 #include "qemu/pmem.h"
 
+#include "qemu/memfd.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1931,35 +1932,57 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 {
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     old_ram_size = last_ram_page();
 
     qemu_mutex_lock_ramlist();
-    new_block->offset = find_ram_offset(new_block->max_length);
+    maxlen = new_block->max_length;
+    new_block->offset = find_ram_offset(maxlen);
 
     if (!new_block->host) {
         if (xen_enabled()) {
-            xen_ram_alloc(new_block->offset, new_block->max_length,
-                          new_block->mr, &err);
+            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
             if (err) {
                 error_propagate(errp, err);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
         } else {
-            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
-                                                  &new_block->mr->align,
-                                                  shared);
-            if (!new_block->host) {
+            name = memory_region_name(new_block->mr);
+            if (ms->memfd_alloc) {
+                int mfd = -1;          /* placeholder until next patch */
+                mr->align = QEMU_VMALLOC_ALIGN;
+                if (mfd < 0) {
+                    mfd = qemu_memfd_create(name, maxlen + mr->align,
+                                            0, 0, 0, &err);
+                    if (mfd < 0) {
+                        return;
+                    }
+                }
+                new_block->flags |= RAM_SHARED;
+                addr = file_ram_alloc(new_block, maxlen, mfd,
+                                      false, false, 0, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = qemu_anon_ram_alloc(maxlen, &mr->align, shared);
+            }
+
+            if (!addr) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
-                                 memory_region_name(new_block->mr));
+                                 name);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
+            memory_try_enable_merging(addr, maxlen);
+            new_block->host = addr;
         }
     }
 
diff --git a/trace-events b/trace-events
index ac7cef9..99e8208 100644
--- a/trace-events
+++ b/trace-events
@@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 670bd6e..135ec3b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -205,6 +205,10 @@ static QemuOptsList machine_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "enable/disable memory merge support",
         },{
+            .name = "memfd-alloc",
+            .type = QEMU_OPT_BOOL,
+            .help = "enable/disable memfd_create for anonymous memory",
+        },{
             .name = "usb",
             .type = QEMU_OPT_BOOL,
             .help = "Set on/off to enable/disable usb",
-- 
1.8.3.1


