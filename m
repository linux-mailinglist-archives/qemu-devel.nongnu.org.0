Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4033EDBCE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:55:17 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFftM-0004RZ-Ah
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhf-0000qg-A9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhY-0007xg-9l
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:10 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGZhse008102; Mon, 16 Aug 2021 16:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=D4ZqAyq4SE/ICj/ozzOgWBRxaqFlE2xHi8oF3tQZWe8=;
 b=vbwLr3kFKbTRlDuI64RscayhLij23ulaHPWrFiU3SPDQkJM2hb32IQhKq3NeJvFC4W7G
 vu2uGnbwHJs0kZAfwLa5ARhqXSDry+o7CxicBRgAC2OyCHhp/rV9EvLr9rN9sKn+2gau
 qYDbtjUpYXRdLAHeisz+9JqsftRUaSwueKTGO0iweEDpnsJgE20NdOmjFu7zD09QBUQM
 HiXZULaiuQNZgJgeVqEa1szfNhoa+rSrfLRdTbDSmyp58sE0tA8AkKRZdBDGfaVFFhM6
 FE+6vuB9ljCseurNGCF7t210G4RejY3mw7Vgcg6zYwSzr67YqDp83gLHtUCo/nAb3HVI nA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=D4ZqAyq4SE/ICj/ozzOgWBRxaqFlE2xHi8oF3tQZWe8=;
 b=zpqoUqy9n/uAa+btmsD0g9Bp+eFVFHYTJVOBfwZuPG4G9rH0fX/7Ia5dL3AhRTAXVIzh
 bhPwFvLo+wbI8l6kbVPiyvp1hVXef0im2C9SBThTkqS9tbNMdljr70vEGufALNWgHELs
 HeGSDqaOiY/n6OTeBxCMH3uhTCE19q4flnN01TI2IVOwglPxEB0DzBqKXmlK+kXS/qPM
 NYhJahOIWQ/fdb41p+f66iFd/QYJ8wlpRBQ9CUvhKbGPmJ1aod/deGbWHcoUk+T/36Qr
 GJFQlxATWvK6vYv+4PcUU9Jg9qeJdqjLH238QqXwfT5nZS5YSX/1UDq7eKMwZB+ey2lN pQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgpghjpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5v159237;
 Mon, 16 Aug 2021 16:43:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfULiFQ/6ehwivAjs+yoCAZFXKU7w37DwWrKSUJPPMyBDG8UqeLY9I4cg38hwWhaDhUJLq7aZzzG4CC+gA4sXSpz9NH/edw0ic0LtKD4szG2l9vOppZZuB/uk6Eqrr65JWOCUiIqDGoVt545J7SZ0BkT/wqP4DkSMMxTdMBmkKzqR/ynXef2AcIziZftuHhMAgIF7DftvR0kxvzK+3UhMDLawiY+3XOks7ba4zQ5Wdp48pUDhvb7Iwh3PVK88OmWcfEEGW5rVzY4DgAAjMR1EGmJEPMa1cZjO41bGT6AxRzGEgaApyafVDyIPgEAdfmjHZLWEdDbXEAvAEhyjLgCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4ZqAyq4SE/ICj/ozzOgWBRxaqFlE2xHi8oF3tQZWe8=;
 b=eyLH7X59JGqijT8elRKhJD/1BHd8MrB6zSAIxxvWmnaQqoHmUsdSviBjcrrGvfIkM6JYDXJVrfLvRYJaVKkMw5SXYpYfWwcYb3fCI6/JYYfJYnS8mhfDbN/Qs5DZ2qCnbzf/sP7+bT2RVtsfBZ+o1S9L4wFljmrqYaDTeGdjMKFu6akuZswRslxXxzeQNw3ErWxET4vnisyB6+Xp9Xbq38k6ml++LxgGvD+PesumpYHj9ERZa4jjAju2sa6IOACoO9eUXE5Uw6m9JHxKgzEQs/BlnLjLT8zVeHDRX/Rf1w2kMIekU+RLq3vP6q010LryhAo5NcaNPtqoMDwTVzwoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4ZqAyq4SE/ICj/ozzOgWBRxaqFlE2xHi8oF3tQZWe8=;
 b=zNv/VQtiwRemo0ZBRZ+6RXJHHSGyVfxvXFC9qiA4isB0pk7yBXoFnQpQiu/H+V4eZiT6fMG3chA30RE5fSIdTnmDhh7OjgpprY6at2gvqV+kpw45SAI7ar0RAo6DpvQPcerOu6reFJUZABhO7Yzv+FzFpq3bmemFbmCGtN5S5dc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:01 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:01 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 10/16] vfio-user: pci_user_realize PCI setup
Date: Mon, 16 Aug 2021 09:42:43 -0700
Message-Id: <b6ccfc654915781b1bd16aec4e3f98600f2577ef.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b888b83c-7149-45b9-a241-08d960d4e8fc
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47653DEA12779AF962DF048F8CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IKBKuJt4QWdpYBA5zdfB3EbGHlR91ziNefq2Uj61+FVAuAQObL5071IEBMlrEDGfhxkWBLFxWJW3C0mDO+7uYUtVuW5f+2LxxNzan3JDcKNJjoxe2rWLzmNHYQNsx9BUpjmXOtv6eVl+0bD0D3MEqeYQjZP+E2J4MsT+cmc1m0UogVNFlohZEk1AHaZom4Q2Pu0xQNTL7nK1MSNy0h2XbnwsRNY52j6ONcVN79zaGTEvxaarEp2e3a/iTDF5AZegkRt8qwSWH8h7YVz1h2lwBpW9TD55CN2LM+alJ3RY1y62psufQYX4GuW/5Wyj5s+2ScaYLSovlJQJfVQ3IFeLl1z6UEVWChdMzmK5Oe2FYX0L2ThAL/OOdMiHLNA73SP6RBRzIE14xYsEoQerpxGg2+lbIl16EMTWu2H3N67vXOajmKC04yExuCpzKwisc/aHShwLesEMgA6xvJeqDjGVREQFasFUP/gqiOxaqL58qo8X9iHLggs17A0m2iBu6N9nwOvK25va0FNR6m2nDE+FHnZ83RJS3h2iHF8TMaQv8dYXwayoyv0x4CFDxx0VKvOMKnT7UT56eiFtMB2wxFZKRjjNbRAxTt1HC1tD95Gf59HGYzdrWaAOm3js2XOxnDu7lwzkZf09Kj1PJtoaxu2Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4XOSCZZQpgO9V4bUKxzxndPMZlyRjr2VW0aFopvlMvf6wl7rEtUlq03+CyAY?=
 =?us-ascii?Q?k6XMloUqZJwBduh9/1tMWqb8IF1evlQKieSNZHMcnC8Rl9KLF7uarsoROh34?=
 =?us-ascii?Q?Q1CerEl+a4jRJNDj/RDNtVz5sQ4uDC3s0LC25fgjgzU5UlGeTDCtLvfSkXRQ?=
 =?us-ascii?Q?ZQgiyFEVawy+S+5IDEKvNIDyZx9ShM2UZElaX29V/GkslHzXo+v6tm4fmcsW?=
 =?us-ascii?Q?ZCc7yq+fKRDUvZhcGw7eYBjUdQKwLJRgjr/IRyA1B0mH4rT3ql8Q3FmhTfjn?=
 =?us-ascii?Q?IHoDnSbMhO6q4mRRJG+PneKVAu4NvuY8eZZ0lU2MImLzQNb8BCDzfykvT4ea?=
 =?us-ascii?Q?bdcXtH9YumZOYgpiEi3JRu1613bomhGa81EeR8JS3qNb737UsedFJxqKWKOo?=
 =?us-ascii?Q?IdLseqD+4JbOBCLzjVWM+OdDwNsk+sIU8j/rweiBELLIxcEUnkHRLmCyLM98?=
 =?us-ascii?Q?Fm88mX92Eo94mwKnVNxUgKre+BsfwJDnw8fOtvqryT2fU6AAv1h6AXMTcls+?=
 =?us-ascii?Q?h8jdipIjwmKQlDzi8sv0xeMU3tSJqbmiiFX6LAgqmepZvGv2s5bJyjYn+bzH?=
 =?us-ascii?Q?v9PVfugXNZlX97yA7o7gk47lbN/IWXhpwY312Z3BpJI5E0ZvqUxlrstL+lyO?=
 =?us-ascii?Q?W0auCJa7MPaQdMBYfQxWyDDA70uz+vSOPW4Tn/eUfL0XHtQoKTfSRWutk2sY?=
 =?us-ascii?Q?57nnKjg7aJWlwPOkDiWq3b9XdQN6ozNLs33q2At2ucLPI14iQPjmxTEf2Z8z?=
 =?us-ascii?Q?0ML1EoQ6kcLYgEjDfUApEQVySnPjh40uxkd9f+KLVBhH5L+SPQStr2eKrENJ?=
 =?us-ascii?Q?cQWF3ycdh+b3RL8Wxqz0uYcbbpYrFVURjy/ACKbzVw+NfmfUxsquAWksj/px?=
 =?us-ascii?Q?F2wREfpIiXvzVPB6SVMcYblbI8XmDSk2v1A5EinEtW8dgRN5Vq43NhjUTG18?=
 =?us-ascii?Q?8H1yEGBbTjuwUvnrO48S/InL0FU/XoZmvVcup8UuZvd2C5c36qIGzoYJ8oxI?=
 =?us-ascii?Q?lcF9HcwjN/jzrhKkHTeDi0JbN7kGHQoYwDvKFOZ2x3OoOWBLJEZSAqwznLxs?=
 =?us-ascii?Q?LO6YrKifnUA58WZoQcYah1gGK6biiUPNvn+zzjfr0EtORrJ5p+Y4arKnuV9h?=
 =?us-ascii?Q?b+u3AyrbV2im4JQhvVlSjD2pKEJQ5h5EL2LFkcjTJbDV9bL7OKvi52lzV1In?=
 =?us-ascii?Q?K8LOPC4+H8IIAzZFZsWPVABf0Y4NSoe86c0aUqZfC074i0/M3XB9DREGjBtM?=
 =?us-ascii?Q?nAtJ02C0cPmzD8eicq+T8R0OoPAl+lz+g3VfvwWT2hXPzYVIBs7r7H7EuxSl?=
 =?us-ascii?Q?Z1JLmUpBnklZ/8SY+3EkUxgbMW5XzUXawVRz2zIhoHudO73Xq0nZcmpXuIUt?=
 =?us-ascii?Q?olt8XavCDjxDIlDK58EvItUqSH5f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b888b83c-7149-45b9-a241-08d960d4e8fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:00.9298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSOn4p5ocsv1DHd/YO2apmDElhdqMX15BaM/pDkbukK6mp14r9IUtdYS86mXji7ZbnKnUdX+9EOR1+uU2XM5XB729wtwh71a3JW1v51vxoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: mW2HA9vHsKV2Rp7bDGmaU9vQle4qp64t
X-Proofpoint-ORIG-GUID: mW2HA9vHsKV2Rp7bDGmaU9vQle4qp64t
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 210 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 175 insertions(+), 35 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 63aa2441f0..ea0df8be65 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -807,8 +807,14 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        if (vdev->vbasedev.proxy != NULL) {
+            bytes = vfio_user_region_read(&vdev->vbasedev,
+                                          VFIO_PCI_ROM_REGION_INDEX,
+                                          off, size, vdev->rom + off);
+        } else {
+            bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
+                          size, vdev->rom_offset + off);
+        }
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
@@ -927,12 +933,28 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
-        return;
+    if (vdev->vbasedev.proxy != NULL) {
+        if (vfio_user_region_read(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                  PCI_ROM_ADDRESS, 4, &orig) != 4 ||
+            vfio_user_region_write(&vdev->vbasedev,
+                                   VFIO_PCI_CONFIG_REGION_INDEX,
+                                   PCI_ROM_ADDRESS, 4, &size) != 4 ||
+            vfio_user_region_read(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                  PCI_ROM_ADDRESS, 4, &size) != 4 ||
+            vfio_user_region_write(&vdev->vbasedev,
+                                   VFIO_PCI_CONFIG_REGION_INDEX,
+                                   PCI_ROM_ADDRESS, 4, &orig) != 4) {
+            error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+            return;
+        }
+    } else {
+        if (pread(fd, &orig, 4, offset) != 4 ||
+            pwrite(fd, &size, 4, offset) != 4 ||
+            pread(fd, &size, 4, offset) != 4 ||
+            pwrite(fd, &orig, 4, offset) != 4) {
+            error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+            return;
+        }
     }
 
     size = ~(le32_to_cpu(size) & PCI_ROM_ADDRESS_MASK) + 1;
@@ -1123,8 +1145,14 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        if (vdev->vbasedev.proxy != NULL) {
+            ret = vfio_user_region_read(&vdev->vbasedev,
+                                        VFIO_PCI_CONFIG_REGION_INDEX,
+                                        addr, len, &phys_val);
+        } else {
+            ret = pread(vdev->vbasedev.fd, &phys_val, len,
+                        vdev->config_offset + addr);
+        }
         if (ret != len) {
             error_report("%s(%s, 0x%x, 0x%x) failed: %m",
                          __func__, vdev->vbasedev.name, addr, len);
@@ -1145,12 +1173,20 @@ void vfio_pci_write_config(PCIDevice *pdev,
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
+    if (vdev->vbasedev.proxy != NULL) {
+        ret = vfio_user_region_write(&vdev->vbasedev,
+                                     VFIO_PCI_CONFIG_REGION_INDEX,
+                                     addr, len, &val_le);
+    } else {
+        ret = pwrite(vdev->vbasedev.fd, &val_le, len,
+                     vdev->config_offset + addr);
+    }
+    if (ret != len) {
         error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
                      __func__, vdev->vbasedev.name, addr, val, len);
     }
@@ -1240,10 +1276,15 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&ctrl, vdev->pdev.config + pos + PCI_CAP_FLAGS, sizeof(ctrl));
+    } else {
+        if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
+                  vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
+            error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
+            return -errno;
+        }
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -1456,22 +1497,30 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
-    }
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&ctrl, vdev->pdev.config + pos + PCI_MSIX_FLAGS, sizeof(ctrl));
+        memcpy(&table, vdev->pdev.config + pos + PCI_MSIX_TABLE, sizeof(table));
+        memcpy(&pba, vdev->pdev.config + pos + PCI_MSIX_PBA, sizeof(pba));
+    } else {
+        if (pread(fd, &ctrl, sizeof(ctrl),
+                  vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
+            return;
+        }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
-    }
+        if (pread(fd, &table, sizeof(table),
+                  vdev->config_offset + pos +
+                  PCI_MSIX_TABLE) != sizeof(table)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
+            return;
+        }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+        if (pread(fd, &pba, sizeof(pba),
+                  vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
+            return;
+        }
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -1619,11 +1668,17 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
-    if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
-        return;
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&pci_bar, vdev->pdev.config + PCI_BASE_ADDRESS_0 + (4 * nr),
+               sizeof(pci_bar));
+    } else {
+        ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
+                    vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+        if (ret != sizeof(pci_bar)) {
+            error_report("vfio: Failed to read BAR %d (%m)", nr);
+            return;
+        }
     }
 
     pci_bar = le32_to_cpu(pci_bar);
@@ -3423,6 +3478,91 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    /* Get a copy of config space */
+    ret = vfio_user_region_read(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                                MIN(pci_config_size(pdev), vdev->config_size),
+                                pdev->config);
+    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
+        error_setg_errno(errp, -ret, "failed to read device config space");
+        goto error;
+    }
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can choose to expose the ROM or not */
+    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
+    vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
+    vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
+
+    /* QEMU can change multi-function devices to single function, or reverse */
+    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
+                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
+
+    /* Restore or clear multifunction, this is always controlled by QEMU */
+    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
+    } else {
+        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+    }
+
+    /*
+     * Clear host resource mapping info.  If we choose not to register a
+     * BAR, such as might be the case with the option ROM, we can get
+     * confusing, unwritable, residual addresses from the host here.
+     */
+    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
+    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
+
+    vfio_pci_size_rom(vdev);
+
+    vfio_bars_prepare(vdev);
+
+    vfio_msix_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
+    vfio_bars_register(vdev);
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    /* QEMU emulates all of MSI & MSIX */
+    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
+        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
+               MSIX_CAP_LENGTH);
+    }
+
+    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
+        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
+               vdev->msi_cap_size);
+    }
+
+    if (vdev->pdev.config[PCI_INTERRUPT_PIN] != 0) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                             vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            goto out_deregister;
+        }
+    }
+
+out_deregister:
+    pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+    kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-- 
2.25.1


