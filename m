Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97C314421
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:41:24 +0100 (CET)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G9j-00064F-Az
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc0-0000lg-84
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:25 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dbx-0002hy-MW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:23 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KuP4O009589;
 Mon, 8 Feb 2021 20:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=dK8zPR+8mtKgSULL2Eb2yIeHABy+POJKAOI7S0jf0VblbkAioz9gexosCyqUTQpJf7zG
 KKIjtO9VPFemuvLa3V5Yty/vIqkc2WR9fs20CPe3Dvrma1cM16zOuc7wJW3eWO8FaGQK
 Vw9J85mYinG5oeGXP1m+jnv5K7tRCFhnbNN6IwBQ8Q1Kkh+Kmb3/iQtQ6h53EunPqBsB
 ktlDHMbKWTvwTDTF3wxYIto2eHzpLRf5SOrdOzbNx4XWn0AZfYtK30WWmdsoQMxC4x/5
 ZIx57vHzRCPWGnKbEDsMwBrY8cBM6pUs2syNKE0r+TV/M3m0V6qZE+bXegW6FKCyrvYe kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36hk2kdc5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5q7L157095;
 Mon, 8 Feb 2021 20:58:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 36j4pmtyjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kby2g+o0ptLNX7hnBNCF2TpVsk2JRecd9zF0r/eoG6Zc7Gnx1KBdp+9pdtArD2aw4b0+jwBfiVy/j5pw/8LXn0qEeCR1ILz5/DZK22llM+8JRp1F/87TUlNY6IQOre1TiUKSr74isVD5R9uNbCVURnlpJt2mfF6DjON4XrNE1i6xDL6y3G1sX32Oia/5MrMnvbfvOH6jYPImzUQZHq8313FJ0hg7koL9AQQ+0bvXWCYa+wMOHP5iOluDzMS1URMuGjPD60omOQhjctWSMSxZZ6E4heb8QpM8hfHuiJsWfIP1mJ4CIAgd72JlJ6hVS8AOutY0RNQghyg+v3Cg9hwtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=Ygiwt4uX7qDZzOtvZA1DbQuoR77lSt47Q9A4ybxUvBj51mZdUPPIID4Po7Ev6Kjd5hPUBQyeA6X1cMNiBp5MjgrW5DlIlTvdK0mtNyDwcxn1DUR4aVnRXyet70nTRv4rfKiyxrm0OimOzmQcdUKQKDbYNDROnJnv3xopY5axTBdmWqHxAetKG/xVOR/snvHCXrWUAnqg9D5bCJ2ZmK2Uiuxyo3hIjZd+/wbl5VQrcKld5ELmPwHSemogVfufQ6kZ/+Y36kCO4RMeyXzPtcIhSkVvS0F61MyocGSAMO5/8o0VGWfRm55HRQyR/o5XoCAgLzDge8JxTiAfDDrd3U+DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=xXjtM8sfQiAapyeuOA6OCjvuKAyVQYk07az8isrb2R05SqlPt1tNLXNUeAJv73MNkO/0dLor+js9768CZSyqaah9YlTMK8L4qCVJ5Ig+r22VTaVZPqN//3pOMU65j0cVsT6vrbEeJ6nd8Oz19ZthPAsQawlCk5EBH8xZGTCzyCE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:14 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Mon,  8 Feb 2021 15:57:53 -0500
Message-Id: <1612817879-21511-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 596a93ce-df9e-4e34-5a06-08d8cc744039
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15997C79AAC702DE1844EEE9978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFdexJ8mQnsRkouzXSmmhzYc2jfOrOZVOK9m1agnOV9lbXiE4mAfyLPE0upJfpYqpHBIl5Sm5NfDtAWRmFzmDCYJCM+xIQKPv2EjXOzv+PEkVCurbrS/uVltn4yWnjviYc9aWNWg+EupaYxzyXlqt5WQs8n1lyj5V/SszaahmSUMNUnIGmRFRk2FBxjP0br78guPOUYV3/2ZqNsp5BvIPQP0pugzTzXUVaLqueZbQqNY2W2Nt29rUSCfHiI8fZJ0OdFfFhNwGq4e8gfYFPNMIL4rGVBeNQTClIaKEh/JMIuhsTnt3FfmOdcDLimUteoStZIvDe/+UZl1bS2a3C4AmUYUK61jsZhd4gw5hJOCAx2oHnmkVG2a8YoJb84pFa0X1agKTOxUoUBtIb3aTgbRWIfjehddAeBYB8X89iWlHwQcv9zrPHrHnaJ0vKSHA0YzfZqbXxUecDLQH6r8bP7ZToFV/IYeg0B9Gmoi85OqCU+kYYpdhzIS/4BWAPQgl+e7geAlCri7RXUy9YfXIbWUkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(5660300002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nxoJq+ksMTzPaMB9krXRr0eDN1yTpg3fB4QXzs5sVRtoAJZdD1nMOV2Fmx8y?=
 =?us-ascii?Q?Ch+cM8Sz508omMFvFrBbHJXt1xsnMyGZVX+ob+tybLf0FkhfCQp1R+BtzCId?=
 =?us-ascii?Q?WKtOHCRZ/Z8dSCkKv6u7fyYYTpxFP8/Z/RkW5WHN/0Bt6l1JMY82Ij6+lUUk?=
 =?us-ascii?Q?PVn4Ff+UYBzkHWUCHpGJGc6BtMiY5yGXF/woRneA+oxQ/mReG3k9uu7aWKRG?=
 =?us-ascii?Q?FvI9aRJT4N+7XytVtfCyWsXae5XZ73+Uyes4mriSvhnOngacwIXCzZhvnMNm?=
 =?us-ascii?Q?LYww/QxjWDiG7fKgZnDMn45Fal+LSHObiEOIbgHEBkKfTahutNS5KSNfrEhh?=
 =?us-ascii?Q?3IC1ZSB5fdG+OMxkJNrLcwEUAMN0efW/8W+9vOt7OeU/W5MWK/ty+uQp3p9f?=
 =?us-ascii?Q?jtG2Yc0N4kkn5JZu/sVJi6uYdgaGIJ//8iykgUPGJcoZBM4tqZC05a7WrukJ?=
 =?us-ascii?Q?AytpfqYp47eH+57oh3gAUcdpxJeioSKCaZsMiI1w2pWedEHssXLlfbKgPqBq?=
 =?us-ascii?Q?MWzEDHYvfjxsIYc7eqUTOOE+JxBZfR+rmOl0uhxD0WhcrDePeAniIx9a/lvK?=
 =?us-ascii?Q?42JwWUYY+gSIUBF4wImCROKdrCwOGMY7NIP1W/MlvjhE6SZ757pWvKSedTXy?=
 =?us-ascii?Q?4BKtL0KKbxZJMNDl4C053K3mS4Kn67xf7oRcY6BevlXo0b1rmiXy1Ln22pIW?=
 =?us-ascii?Q?hNRZOnyId+WnlGIg6tbXcoO3usjifgFZt8oi63G0p9q321am6ofvxVjiiy+U?=
 =?us-ascii?Q?yIqinDXlQClU/IMnnWqtFHVfc2KzssvW00W0rtMNV6obB+GE0BmApFFfO+/F?=
 =?us-ascii?Q?GQpo8RhdmQHLRNvmaP/HDO0Iv6uVnDEw99PrOEU7f9QZefCkTItBGblvqPeq?=
 =?us-ascii?Q?xGY/rYO08gTqHBayzSDECTvXGoq3poKA7ml4IzCDRP/99qgk4oWPyxPMBMQ3?=
 =?us-ascii?Q?brh20NN7EsXPyfwg2Yz5ni6k6WbbIIi162p8yFWwjJiSLTzXVKgpVSQaFQMx?=
 =?us-ascii?Q?LCT8ChYgXD//ONd3xSVUugwjn2bizxb1F16xB/LiRUc8LVxhvHWYTqDsvbHx?=
 =?us-ascii?Q?/cnb7pfgpEUmm5Edqqh+SGup+tspEau4ewI1BDzyStWGMNQrMU9Xdym/vVkf?=
 =?us-ascii?Q?6CTz11/9jQZItB6u17EhLE29GCeghKoTjfAjchwN6l7clDJovD3sATsg6jw4?=
 =?us-ascii?Q?1UHYk+mOpWMkhWclKmZjL+UPgOT0I2RYQpNvL9kZid0ZM9ydQZviMQPaNlkW?=
 =?us-ascii?Q?hyZ2MJXsrlNdONBp0PZLnofjTmMjAkfLk+wCkZviXNLmNVW8qO5CgiQ2derZ?=
 =?us-ascii?Q?LikuMZS3d6nBvJHIAtcRY1Yi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596a93ce-df9e-4e34-5a06-08d8cc744039
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:14.0659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRwycwVWYhst5fpCpF+ImZ2DFQh8mo0lOi+4gwImA71yoJszGC+KMbT+IABthCNvSuGZASw3J4EW7iFwywTHSARvVd/urBM08+cTV8oaREQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST                | 0
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 4 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..e004c71 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST",
+
-- 
1.8.3.1


