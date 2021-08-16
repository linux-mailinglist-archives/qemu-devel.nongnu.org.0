Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC83EDB4C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:51:40 +0200 (CEST)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfpr-0006OB-BV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhg-0000vD-Ib
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhb-000810-Pw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:12 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGZfZ6008090; Mon, 16 Aug 2021 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=gK+Q0/rA5s16W+k1rf3tURI3UrxB7LD4G/Aog3Zoeyk=;
 b=MKNTClW7qizuI8SW16g1By3eofYdoZmuzg/eMd+HXURfYRfYHHyjpPZqoZw9CQL1vTxm
 zED8psAEm8f9FzVTmUCKZWr+RPOAwZhPYt2AgHF/4W/XR9rKNZgkAqddFBjDj8wQSNVe
 M+RLqTKoLOGVZgzzHTHF4NHcMqH/KrqVtyGqX2Vvph5kPDUiaRbzWjqAPMdmBD1bn2KO
 cqRb8O8w4xhk0ZpFU7JqveSCjbRFye3IGf7W/J7zKwdp01FJ7h7U6y6hcOAHPreTeOgZ
 9EBdNL2kbWW6q9+Iyy72HfYjc3pA9sJFSHJ9dtU9eFbmPlOgmsRIifhpWqGOp6eBZXqm CQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=gK+Q0/rA5s16W+k1rf3tURI3UrxB7LD4G/Aog3Zoeyk=;
 b=oC2GmxKr7MtYe4tyE15V07HfaNwAPj0jyWEX+kNfJH2aL2zafQ4/YG6iX14cuDvmkJOh
 6jcXB7nVPQp+B5jvHTrUg2j/SaUtvJGWljmDOeQpVr1XjqXhgB4I0X4QvYukGDzT8PXn
 r3JlEUHpjij5U7hbyeJFS6j2rRm14HtMw6sDMWaxgsNekp3An+qO5W/V5l8JZbsSP9ho
 3XQkJ4+LkjSUIuWpWI7lCBz9wMuRZ0j3f1S5AObmyQDKQhAJvNKfUr1nMWt5T3Z2fqkh
 WKHk43Y6yQY9r339lPNBidGQ7F4gronWiLlclbIpuOSCsmrgLpIIzADjW770le1JiLF0 Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgpghjq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeiuS113652;
 Mon, 16 Aug 2021 16:43:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3ae5n609mu-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc5hcOl6Fv7y2iJPiQjBIFoFphWKJeBt2KDsL1XIKJVrfMkd96MmSYjQkYv0ZNuyq51AC7T5MqyVXupogba15KoIxZnsJADd/FpgVpk5OtUTEPwAMUCezp5/dHb9w3xtpZh/k0o7EMN1HwCURVbsJD9vBlqvEWX1YwfFuTBl/RZ1yYlvQNlZZNxa0WTT994wqX5yJBXGrmvLh2UBlKcvEFTiq7X2KVSbJBgjwmjs9L2CiwGQM+lFOyg/xbQMhOhx80k9gxFxQkjWQTz6iZha1MjIUe2Nxdbp0RtOVpDEmx0/N2lFWsS9kmkPneaZUXrxPEJ/ofe/CyBXdQs2SEFAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK+Q0/rA5s16W+k1rf3tURI3UrxB7LD4G/Aog3Zoeyk=;
 b=Jq/i33fjCRnQza2cO9Jvz4kR2ph03wytaT1vhOdaWeTSel+oa8LuKMGJ5HMxwwtLg4r8dZdDX4x7KY4hhenG6MzGfHw+Pkaf5m7HvckTXu2sdYxu2SCN/5b96CMnoS5gc+//TcYV8CV1ESOnZXp/cSD4u8RPPK6hWh9q5fqS1FYXZkOZACHCI24HgkVCIhrQUqS6yjFLv2hLzaKfCh7IweXcUkjuozK/Z6o9AoCI1ym3H9YV9QQStqfEbuIGxW5sWWj/VDpGw/ntJfIU3fwN7gz2FN/V+my35Eao/nigP8sg8J8aWgfh2elNYyo3rMt6BHRNSC4CmuMLC9I8zZ23ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK+Q0/rA5s16W+k1rf3tURI3UrxB7LD4G/Aog3Zoeyk=;
 b=oiyHiytyDCe4diT+Fg5GE8fvu6ExLCJQK5OKBCh+Drs6LNw9/df2ney/o00jMmtxAWOCBLGoKELNBOccn1mbFAABzrWU+GMZE3eGCVQpabnvV2cmM77UIKhJB4JVUXoNXwPrsdbc0HAeFdfcDWQaLZyaogahXSywSNGZYTKzXS8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:03 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:03 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 15/16] vfio-user: pci reset
Date: Mon, 16 Aug 2021 09:42:48 -0700
Message-Id: <a988ef2657256ec70bf34c673b5348fd350b556e.1629131628.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 16 Aug 2021 16:43:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aed286d-24d3-4e40-2ab4-08d960d4ea97
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47653C235563EEDE167AA2238CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0U5mPtOVIU/v5M/IPeb953MiTn/2s+XkFwWAktW9wCsXiFAxXYFhTwTo6jdDyH6bprUjpVGWv9zs6KX0uJNLWTbvbfy159ArFvQZ7Gsc4DXScAjjlaE180n/yU/5sUxm5Lj+D4iMeVjJJsS4+WK7AJFOX9Ys0ijWqtM9bSrCc/44rxj0ijnrhCRZgUJ92T7XFmReIt1x8+1h1kztlvjU/xXuP7cuA8D5ys9CruHJs4AebMlMn0m/JPV1ChdpTlUyYpOFzas6bqgeFLEFFh82IurfwmfpSEqOujbBajqCvLJkopCX0JongMQ61VJaYtruJnNTmKzah42RA/mA2mYGR2vcTv7RJQIcelWr0pCgbDmdIbN4wqLsHAkcZEBQ4O+hk49ntPM7ZURsMNKi1J4OBZqXCT36lYJ5MMePcuCOSo/RAg6PusPdZu3VZpzAt8faLEk7gdGaNC8Y4SZbahp36wcx8bz67HafTrYVeLZxyR4A2YOpfY8gLs7vldjyz7G8dgaCou9ZYh38JsSe5AMUhADyMOs9tSJnV63luUllNMxXlxCcBQ82GC/9qIm/L7YyeD36BnFSAB3JMID21PXzwMYhR66P9O5NPACIgMF4lDLJ78bNdaSzYls4C3QevBSILCE37FtdwSN7X6yNGc3/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGwKZQqyRzSCxLG7+EHJ43cz8k5VaIpsmD4MLXouwmopVbsc0rSQmk90lMJw?=
 =?us-ascii?Q?tec3Jqf50b/5M5S55iH6IurJX6eJ0ZID1t9AHs/toWtKjwpeVUoeJpzbXwkI?=
 =?us-ascii?Q?KokXF3ftZXq675IRZOQcYRIwWzNye7212CVc6rj8DGACGj1n67lJH3GTV0Qt?=
 =?us-ascii?Q?fk2owyIidrhCa1lB0ET50m6nrMcQ/icbx1DQ5Kd+oH/uPyl+PwJSAts7AZYn?=
 =?us-ascii?Q?sKHo/xArOXUIadgtAYrxY/TwL67NXt6YxfPMqQS7JkBT3wOdzVu3+3ZQI5sF?=
 =?us-ascii?Q?AXcU8A2MnXyXJK0w3ekb0BP0fH4JjpcbinXTTuuTJt+C6brmR37pywFH7mXC?=
 =?us-ascii?Q?iEktnfNZ407CVa4fQFRTfSzCJ1wZrH9JPRaAhD/k2PMoxFeTFMPFy0M9JyTP?=
 =?us-ascii?Q?KR27ewUQPC2H2NaLiaE14FbleqflaubmTsNy3b/zvkHCH//TalNDXXjSAh6K?=
 =?us-ascii?Q?b17sBX5xDepIOg6TnO5qCkCPael6B2FkxwfuzSj0lI/NcXNZ4TbR/oS95HS2?=
 =?us-ascii?Q?urCgtAzG/2fbYugbGehgo8YjLg54tbnWMaHuA0bDeKmApHxIOixlUjRI7NCQ?=
 =?us-ascii?Q?jq12nIG/Z5YU0L3HgMdxWzd+LahHcuRR07pYh6Ad+aHoki7YS0m+75/tkCKk?=
 =?us-ascii?Q?G/qj9xRFcdTIpITA7TcqRjs4lxN4LSxqbzGYFjXxzLiF2vg0Q4rpFqtrOtwZ?=
 =?us-ascii?Q?BjUHMGtCl21es9V0JY7OrOIz4LTvTeQVwJz2wRpYf4Jz/fDfraLpLIlPdfjA?=
 =?us-ascii?Q?tcp3LmtZlX88s1LXM5rZ17YtdaDHzpSUsJMqidoXWeLpnjfSmIRWM1S6ahyH?=
 =?us-ascii?Q?snOUlhkU/g0lmtLyh40HSM0XIpw9x086kbqJW5EL13Xy/Jr+qFSJ7V7t38y7?=
 =?us-ascii?Q?OgPOYK+tt2DfSoTee7ps3R/dDScUPp/xXys/tJokdHinnA16fIdra7gGuYM6?=
 =?us-ascii?Q?RieYx4lFfwUhNuyoC3+x5dOdXbfqfGlL2GId3cPbZeLRFiS8x7vQq9xcsn8B?=
 =?us-ascii?Q?mg22prSbdlpGouMthRjJNwTC0WlCszVD4w4G/2G17CcexyKhbN/WROayLqEV?=
 =?us-ascii?Q?DkfGbU+2e0oZH7tGd4d2Ran27Al2Ba7pIVofAl7nY/KCq0evDFeuO7gU1Mik?=
 =?us-ascii?Q?oLrzBjZPa+rT075nIVANPJ9ZAGcczBtIFbqsN2W36GaMkXaVihr2LznahSga?=
 =?us-ascii?Q?vOvXwFFILYr3ho34UREbODvs0PSfnhD4ExgQNOIkZHwykiDDPlq+iPYjxynd?=
 =?us-ascii?Q?klMDyk7cqxlw2LygawgocMA2k6rFn5geXZB4PaGBt5fkkOfL2Z7PDGcndrr9?=
 =?us-ascii?Q?miG5vgYNZIjtYarAViSiD2ISY+z0r99hQLU3mXQyyOJpzRaQgcZmERNFUA4A?=
 =?us-ascii?Q?zaTFNN548ZagNlWTtgt6MkU9vfKP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aed286d-24d3-4e40-2ab4-08d960d4ea97
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:03.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvdoONj2+iKXTj1voFcxQfI1GGKR/jdlEXhLeWCEuLS+uOCcpsr8+gfiMm7gLc/PlFa/UL1zRaug+98IfzHA7nSVKKtV126uqMWTf3+6I2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: iI5wjs3fZpTrd9P67XQLNCynDIJL7nSk
X-Proofpoint-ORIG-GUID: iI5wjs3fZpTrd9P67XQLNCynDIJL7nSk
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  1 +
 hw/vfio/pci.c  | 29 ++++++++++++++++++++++++++---
 hw/vfio/user.c | 12 ++++++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 32e8b70d28..5d4d0a43ba 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -86,6 +86,7 @@ int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
                           uint32_t count, void *data);
 int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
                            uint64_t offset, uint32_t count, void *data);
+void vfio_user_reset(VFIODevice *vbasedev);
 void vfio_user_drain_reqs(VFIOProxy *proxy);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 29a874c066..4b933ed10f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2229,8 +2229,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2238,11 +2239,18 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
+        if (vbasedev->proxy != NULL) {
+            ret = vfio_user_region_write(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                         addr, len, &val);
+        } else {
+            ret = pwrite(vdev->vbasedev.fd, &val, len,
+                         vdev->config_offset + addr);
+        }
+        if (ret != len) {
             error_report("%s(%s) reset bar %d failed: %m", __func__,
                          vdev->vbasedev.name, nr);
         }
@@ -3684,6 +3692,20 @@ static void vfio_user_instance_finalize(Object *obj)
     vfio_user_disconnect(vbasedev->proxy);
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
@@ -3695,6 +3717,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index fcc041959c..7de2125346 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1045,3 +1045,15 @@ int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
 
     return count;
 }
+
+void vfio_user_reset(VFIODevice *vbasedev)
+{
+    VFIOUserHdr msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_recv(vbasedev->proxy, &msg, NULL, 0, 0);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
-- 
2.25.1


