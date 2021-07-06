Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9E3BDBDF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:04:00 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oUJ-0005l6-CT
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJh-0000Ys-HG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJe-00083f-Pb
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:01 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gprlb030637; Tue, 6 Jul 2021 16:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=wxWwt7seKD1nGteeB+sXrAEUdesC5+4O/U3S4dpdz4c=;
 b=XTFqKU0Qmk+Z1BIhSKImfndycUas6cNL09K1/dmC1bdoJ8VIOB9EgXrA+slv8XqcwapC
 XoCr0M4F/AkC3HZV9gzdo6rNI9RRSmQykg+4tutxgQkgpjFLM0IRO3OVXoyZSZStVdCa
 +gZuvjE4u3nm9gU5f4NxYPhSbLI0Di09YgcDG6hecLZuFyntTK0GLHrhSxsQB9HrWDj4
 +WMILxqT6DwJHQybW+JSaPtyspAJd7fnzyErlTeKy7zb+M2Q1ePkd3Zf6c8cOkD2xSPD
 zMGaHtoWmzQLgBxYj9/a2jpGo7c4t1lx05M4TD7XQYCQepDp8gnyDT1i78AZOjMHEV1n dA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smjab7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoHMs012559;
 Tue, 6 Jul 2021 16:52:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 39jfq8vj7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX1PYlPJ1pEc9zLfb5/XOKa2WsQCB/UvIcYUC4XYhVxlq5iS9S1kxhnhWVzp8ys45RQXfOZTMVYfhi4uHYAqN1Uc5EGa6Hn9InE9BnQ75gvKm/JbSnu15fXXPgIBo8YEAIVMfcFrVMqOoJKIMa1+x7x1F8Z/sMVF8lQ5qeve+W4OddCKq2sTIA+BJ8Lgw606Yz6eehtDC4RBwfHekR25az4IwMOIbh9BsZynx82z5wWaEhpQP/KReqQj8l+WbY3NmOBRr75aDbVJ+5O3LrxT+TtODOi1bb0QVuqmj22aUS1wsGBnuFQadumhDUkeiXAZZhMkDrlM12m3HMfys9tMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxWwt7seKD1nGteeB+sXrAEUdesC5+4O/U3S4dpdz4c=;
 b=ScGN297WyGpE4mCSDXGWcueaAj1A0m1OsM9qU/NhnDe+xN/wnznON46QZTluuodqpLoiIDkO0lm/s2B20zAwRrvZpnhEX+9B2WeUKcu5/jK2WKQaMX8VF5WNG6IvmjbR3bLbdHBC0jzTURVdINwAzjkBXyb6po4Z1s2o+G5UtkhsFnGiHtL0OwwOexBcCMwcjdNinT0IyzcK75VDrs++QCkzFll6DUrMGw52+7Vd/BsiJa1zNKx1qoAnSh/B0BJULkrdZlEtwPzD7HTNN8Z5zYiHur65mTA36YlaM45X/OZhTZ8yPOO8bTOk3X0RR3EWbBF/gY/eXlihJQyQuxYMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxWwt7seKD1nGteeB+sXrAEUdesC5+4O/U3S4dpdz4c=;
 b=nMfhLz9qjhGCAWGaeV73gB+lcAerV77ot3VHx08gbyShQe/HowWHo2t5RAoJIcgnhVwqSr4At6bi8M2QN4AzIdceZ50xIGs5UeNIR1jT4Z8bp/V70Idzvto+aeNgkvMk0m+7yqjVifuTJ2N5J+MKLJsQpUIZ2LV9B34C8SiaABA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:52:53 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:53 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 09/25] string to strList
Date: Tue,  6 Jul 2021 09:45:40 -0700
Message-Id: <1625589956-81651-10-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d7887b-a2c7-4b58-e8f3-08d9409e7f12
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805DD3A9545911E42EABAA2F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVpS4gZNe7B9JmIRRy8zDAhpTpu0MuIn9dWb4zPA/g4ZeqMFZPFBeDo3l/aXIl5pRoy46BPI9j2rs4GZiRotW8h83wWgB4gw28do2fnOX/M1eygTuHPwTlZwd8ZBBbeMDIkqH433IdP5bmwWxKKo+mSBgcmzt9LF9/CwWK/GsEqtTmQZZFLvSP3zYgvRLXzRDREef60WXpH9+ijdTfxU1u6nXM2qYpRE6BSjgww8PXw3ZHy2wFwAolQ/CE1u5WYpAaaMbgfIL53Zb/ljMt680RAbSFC3okoLvnXrYybf8VOA4LsgC7yBz9Xu6XdwntNIwoRaC7Et6lch23lMhODuuTfWrNRXrA/eAXQ4VRgBv4RQrf20F/QpUuS/hHnHgvIpCB2hVEisVf4pckFypUkqnmmB8F0h4SeiiSeeNorWrQjqjsDHU3u7WtFp1W9UAoSOKGIYxe4EbIUIzGv3ER5fi68zrirPwPzKBQ+i+onMvIjWLUjrkp3m9ek0KOxZda78aZrUMfJvet+fMePo88KOyE8TnJDERQCbIIF9e9UPd4O/Rsw949akp6CMrAu3Hgb44E/5p9ZMM38G5jwSIDuJL2zXqUqitR3rO/sbDua1EJvfxWE0LLJJYwMSvnTipQ8JpkyR53v0Hnd4VhpzpiGzJuQ5pGrWDCDk6LCtTCQs7CXAhTNKnZ1fACvets6hIIbbBc1XXxYEuWi+YVst6H3yROs8aGeZ3z7jlaYvlL/mFP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pynnTiCinKGJKBoWN7zyv5g9gIxE15FfHhz4b/DrRyQ61hdTO2SVFRZZEYtA?=
 =?us-ascii?Q?0vtXDDVo0c/XQjkmIq7UJdvVMb4bilaScEcCS4bZNCUwsPpxXcBOLPaGqzM/?=
 =?us-ascii?Q?DWJmJPqWqM0Q8cdxXGDUjnKnnrHezUbT4FDoxEwG3tK0CqtqgBloGoiudoOI?=
 =?us-ascii?Q?CGLuskaPUsuw0WGh5gmM9/NV1pOJ0eCxgwTmRM6H84kJDnUL7u3DTspF8ikL?=
 =?us-ascii?Q?IgZdk3YV8R8uwD5ZrZv51GND/D+HMyZnelyMVY+Uq1hbu1sa1by3gKycQsN8?=
 =?us-ascii?Q?BQFl13mFCrt3SvdpaD7J9yFWMJgNYrkWB7GaFsUmVQQHbVzUgng9lUF+I1tm?=
 =?us-ascii?Q?ynog400ySnYiVhvTrYsCJja9LwetnlUAiktaETxs/0ON8YyYfJ15I7dCM/0a?=
 =?us-ascii?Q?Jf2mzBaNhari6urEMNf2MLU1LLGLAoevKdbZzPz4030PaT8/mYEV6vaL/DdI?=
 =?us-ascii?Q?wsJLA+RAGxyIbbNUMmNwZCnEFS81x725u6iUcDglo2FMNswZKTkPWWn5r2Oh?=
 =?us-ascii?Q?QtAgvBG55cj54/5AQrI3osmOwU7RXBDoQHouijy8YbIT8L6OgLekff3ua3MF?=
 =?us-ascii?Q?4psJACYLQk0cEac5pGTfZvDq4oBxf7ueYEnLJrEM/Mbw2C2IayN/0SXNMnpH?=
 =?us-ascii?Q?k1QbEDJ5yHbnikvBb8YibYKSaypDtFUN1SJ0V8F+xB4HBYyV9DERxFLc0R5D?=
 =?us-ascii?Q?eZmSd4u+G6F5Q279W8U96Eid8yQBQ4TYdu41GDakWyYTdOWKhId6wf9sM2U2?=
 =?us-ascii?Q?fhCGgRoeu4GdEgplzfxUZifNhyVrLp70PQh/r3EiMIxx3gqOzzP1LTlPL6og?=
 =?us-ascii?Q?drGu00//32UNyldKfxqJdYk3TebB+up1q0asXpI3fAVz4aO7uWXu82py4Eip?=
 =?us-ascii?Q?v88swXOUeR9bJ7erJZ/PkL+wahwCZ51JdefHoE+9I5gIni4w84YcavFXK6be?=
 =?us-ascii?Q?m2WzJIxTL1TRXDbQ9/X/JnBq3QUhCHUrTgrYF3OLcQrvm5oLQTO6tgPliDEa?=
 =?us-ascii?Q?gIxNutFe3vZhPdTu8J2fhU6ozdk93PaLDSt9xNx5cxuclLUrtLGeM2kIrkAM?=
 =?us-ascii?Q?z9A9q1QW9UP3YsZJrp6fMisuPOpa51WO0Namz66uishgQiOG0/x95+9NJDaD?=
 =?us-ascii?Q?ytaLZOL02h0sf0amOkYOjGUaFxvog9vYp8ma9uBsBL8+xvPpRub3BPRXgFiE?=
 =?us-ascii?Q?ag+ihNrZHzxCrK+m+INgrB6nf+08OH5xoUZUegbHOViSoZC3hDys4MftL2e2?=
 =?us-ascii?Q?FGsMm+4zli8dXNiA0yhmi/ijqKj6+EsqnfNbizugOlfpfhIF5vgPQIypYYsX?=
 =?us-ascii?Q?rOkh9qLFCbFFsz4S8oJ4gc0z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d7887b-a2c7-4b58-e8f3-08d9409e7f12
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:53.1541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYjQnviDqul2mnRXsV6+P9b7pqdDD7u3U8QU1rjpN+gFcMcvcm3WJRTfhhXOpK8rtIWlo+19Quk61Mp869uamYwwsl1EJULlr2Ee33/q/w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: hNYBeCH0CLpLLDIRAR_Jxidqzkd23g0E
X-Proofpoint-ORIG-GUID: hNYBeCH0CLpLLDIRAR_Jxidqzkd23g0E
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

Generalize strList_from_comma_list to take any delimiter character.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 monitor/hmp-cmds.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e115a23..f902dcf 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -71,21 +71,21 @@ void hmp_handle_error(Monitor *mon, Error *err)
 }
 
 /*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
+ * Produce a strList from a character delimited string.
+ * A NULL or empty input string returns NULL.
  */
-static strList *strList_from_comma_list(const char *in)
+static strList *strList_from_string(const char *in, char delim)
 {
     strList *res = NULL;
     strList **tail = &res;
 
     while (in && in[0]) {
-        char *comma = strchr(in, ',');
+        char *next = strchr(in, delim);
         char *value;
 
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
+        if (next) {
+            value = g_strndup(in, next - in);
+            in = next + 1; /* skip the delim */
         } else {
             value = g_strdup(in);
             in = NULL;
@@ -1166,7 +1166,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
-- 
1.8.3.1


