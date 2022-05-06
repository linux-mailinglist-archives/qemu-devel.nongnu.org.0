Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301551D071
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 07:02:46 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq73-00051T-KH
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 01:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004se-AR
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzN-0004R0-1O
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:52 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245MAYha013665;
 Fri, 6 May 2022 04:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=cgz1sON8aTlVYkW5iYCcqfzaqlnTFYYWf9ArGyKnUFvriaLzrzVUOIn2vddKKVpy11p5
 DNVtTTo67OuEVO6ZWwVbJ+mGRs0YFesjezve9srUseuMgNTmxUP0/9vhE2GZ0haIU6DB
 WK9aUvyrkgUwQMJ0T84cbP8bJq6Br8zHwo51RxsfqRL/UIBqLbf4Z+3y6hIUz3iJf5tP
 4pZ8PpO0N5pFBDZKqWt3XlyVhUY169HDakOb0cOBckMFkdx18jbWkVAzZeIq/G5Vjftb
 egpKAFB+tYH2NRztFUa+MSNN6LDoYiQMDE8gqVEkF5baNktJRfn4DjmKN+CVLfPhNLFx ug== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsn4cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:44 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464oaaw006680; Fri, 6 May 2022 04:54:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ywve1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEDUgPLyrhRRVUXtFyA77sX7X3XsYdHC7MCxRxUkitsjemomjJYU7sWT0fYGpRLhFf1O2y0s5KJlEqfjjNAEU36QnNVNcHJy7HXbCw8a7qrVnIhSRCjN+NSvZJFccqRpOTHJbndyyWbZreosP8SS7yo4/RjUovXDbwtXGyI34e53DOgvjDOjmM5MXdgUDIPRF8x8M3WbA8yNYvz3W3PLkngjshwGgWUrABjANVDdtz6zx0C9MRzYNMFO4YsM4DBlM/wj3f0EtPANARlSsedRB4CxHqRYlX07a0CHwEX6CGmcKmy+5oYcUZQub627Zl2NMsZO/20WduAFVucZ5cqpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=gQZjp75JYqtpk9LauRB5IgN9cHDVZz9zFalN969x9IpxpQLlzxJNC8gnQOqormCudM2RIFauLHmtZMLbQTz9OX0y74397zQJWGVg0fnPG0ShZU6MhtplmtXsh7GRgNnPUi7YpbILpKXMO+GnGjah/tPR4J2aPxChIAq9FqrRSmyUaQb8PDj0Vbjy8GGpWHxN8lJ1By81YhbZIcGEE/km4RS2Yi2o4+zbcFyXWZPqDhu+GegrNjoN57nQnjmAmJjnJ7+gNOoNsncJGAMBiRybzstqTJ3o0bWF8GuYzOKcdoNYHW8AI6dDUIuxs5c2LsCQ71WzeZOgYmu6XDajDQ64qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=oSsN5TWm3rx/ica05xHWbvUX8Z4s2UyoUVSrygdfMuX0z2yl8Wwc36vFzhOyhCrO7AtK9AUUfmfq3JHd+J6NouDU85HjmnPL8KhIle7oKzElGtZ2FqVhMIWFx3Z3vZfFotLjrW5WVuKBVWrDFU+nNkxZVv7cHT0p3Obubcwe0Iw=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:41 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:41 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 1/6] virtio-net: setup vhost_dev and notifiers for cvq only
 when feature is negotiated
Date: Thu,  5 May 2022 21:54:29 -0700
Message-Id: <1651812874-31967-2-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6d61c01-4e9b-4d7d-5921-08da2f1c87a4
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB14165ED30B6478C5194F0517B1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vArLhh4G1DlJR1qgQxmen32i0u+Lp3DMpVpb5cVrh7+s4hNHfpe/aVIHjtCrxIR2svgplv8/HmYaknlGjdDFYco5neYNBstcgftwvStA7Ynok35Ogfv6Z+3XE3hKTwUJykz9l8SLU5FVGb9WLtqN60goijhsaH3zvEoXzQj3uAzXKP6sLU2GwyvUi0nSNpDn/eTT7BrhB+/nS9B9VYNepzu3MqKqZEqgDTcp8nKb54gvq7LIlz/iP7KGVJCSa9OxT0A2BBQ9biuO921VlmU7vnTAawybvmGJ8C6J6Vc5kwFEk8YNlRQK+WydHKtQgg2QzDTtHo3jrkSM8nYTGp4iotCle0s96H8kbZpur3nt50m7RjQfGNJd6YTHL8Sr2qWyXdElX9Ei4Hvm1TvaeU4XT1e+z8zgpRUurb44m0SGJfPhSK3JpAM8eRhHF1PiniDxlJmqdd7vfrH+BgXoPYn+jUgnTeC73tXv7W3TvTkscq84byTI00JkbT7yS3PSkx5Zfot6jBH7AZCykww7Z2f4qlRUQQAvp6T/w9DOQGZDvI6V0ZKP70zxt0XswEbDA8UYNo34Ohlkn3//8cynJJA92Qg9OXnXZk7GCAbQMiKpWfKaSNaNRnnZFIxjYR1fMCtiRnuCEzOr1cn68KM7XsURnm/zmJux3A6rzPkl+7v/apb6fvPdEZJagxaP0pRzzBQyhYcWUhK65aArvOsRPkSmeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g4z0ZAacYq7EZ+AAe5xQew3UuysqtWryTB6UgZPSb74U2ZRP2VwUquYNL/kt?=
 =?us-ascii?Q?m4ZCfeYp2Z1HPdBizraWKLwc9UGsSRSZuzCWCumJR4v31gRVGQDQjIrQZ0Be?=
 =?us-ascii?Q?VY5at2MdUchoe4eDzaxkHBPQP2wzZi8BdeaU/wUYIAU7QkF0mGZYb1QqSd3s?=
 =?us-ascii?Q?4Pr0nJRasMgh6m//UAVaab3tqZAxnIhv/UDZX8TiGdoJSOSUcyAzOhweNuyD?=
 =?us-ascii?Q?oG3GdFKPNB9tOqTMtHgYoA5o0PkQ7gHNruRZf/notzDCGIoKlli97qGEbeXb?=
 =?us-ascii?Q?WYQwUbCjxPB7m9JQjZb6uiFqFie07gpC6gzpHCmykknv0Otw5h3sVLO+P/JY?=
 =?us-ascii?Q?BakZZkiEWdEDWx2VY3RchcyJDMhk/ig9HBZkoHhy43Q5zpMQuYuP2bL8EC75?=
 =?us-ascii?Q?oWdH0zFMz512CwHLDg6fI0aMEXa9RYAsrNzZxWB3gos/ipQTmWnGOykkSrRZ?=
 =?us-ascii?Q?1j+BZuSAo8my6EJsSgO9Zf8anL3csRXIenYbhBANMAtEn1K7vseN3KPKBNyH?=
 =?us-ascii?Q?L+4WWxMld+56364I5eytYNs5u1xDDIhxWOkNrabWGk79rZAToymDS5ttFvva?=
 =?us-ascii?Q?+eV2pZwsz3kvF88juWIFKyPOzLEqsCUoOPFvMhcfM27iCyCngyIANFEULV6q?=
 =?us-ascii?Q?kIsy645FS/Sl/W5E+t3bq0ZSN/yuTHP6D/W+12GvLcU+vV8ktWKdB98YW3kk?=
 =?us-ascii?Q?RhDtns8yTignvo195J7dr0yHCuHLAbf0Bk9BeCN1igorrQyRaEUi1DMDmpRr?=
 =?us-ascii?Q?3d5vSxZ+9HYz5y+K4fpv1t9knkiKNg64MGt5iEMH7GZLUhW604oT0m5xbUJu?=
 =?us-ascii?Q?X7x1bbij9AKz+tgBJtBfNJ2psjm40bVilcjE/ZgSXx/FgjsVkqgjboAkYxkp?=
 =?us-ascii?Q?QMq/Z4H7bAJr9+W8usbhiB38RCu4Hrq5pbvIjdxtCK/dn+ZypO4kL680gZNm?=
 =?us-ascii?Q?a9IFKjhm+2F7OHbXs8i/S+sNWNZCRqqVoqCyLDyDMgYP4iKgPKGOnqa63TX7?=
 =?us-ascii?Q?LMYF/1+s7hMrMbD54wVUWbQsRohvqXv3mAUYIV6O8H2VnnOJ2hDHvGKKcc4V?=
 =?us-ascii?Q?/d/botbXGXe4ZYV1V3z7HdjGM+1E3JuH7hzC9pCHNNRD4HXbAp/rTIPwK3nu?=
 =?us-ascii?Q?6Su7LNWW/hVO+no7uSFYXkL5tbs2WJRn63nEhD+avhg8s4uVQBq0X3HN62y1?=
 =?us-ascii?Q?0K2h0PJe2MjfRzdOhYzkSlqetKpTFVFruyolrpPveUMohuFXFE07JRXo+rOH?=
 =?us-ascii?Q?dCAhJJdK4WI+pQKBkLToE79rPhXJgmpqJ8PdLYs7KDtIZ2CqyySxEF75B2CR?=
 =?us-ascii?Q?0F3HuBluQe6h3+A3HhnRnA83etGWnaziFrFj6uiJJ4K+/8hlUlbOJ5EAB21m?=
 =?us-ascii?Q?rRQO5Q/J0rFRtJR3k6izxh8VJQ7kH7aKWBUpW2qtn7BTt/7+jd/+EGEHa4B1?=
 =?us-ascii?Q?vELbhnjyxmzYL2WFFXrkYUfpF52YN0TMQUOUABpxFwH8AiJT1Y3fiKiH2k70?=
 =?us-ascii?Q?7wJtcwOiaT3F1m3TgW1MrzDPwXK/huqU+tdDXFnxL8zGPbOmgtB8a3eLXZDN?=
 =?us-ascii?Q?RyjAB0ggJTmRDiIqN2ppGD4OZcSzVyzTMJRuik5duc5MhboUo7i9BOXvBxRK?=
 =?us-ascii?Q?LrtyD1oaMKMGbMHmVMiQZPy34pXZKpfLdgI8FHDt98SGXgJrI1I96/pNcAm8?=
 =?us-ascii?Q?6uuegpCR+YqG0ub1rRConX6Xa8ZJDcP30t2lfEXNeBQruakRDAfx2AQxEPkT?=
 =?us-ascii?Q?/YTFupgg3RS2ej47zVVHEqJ1tzB6U58=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d61c01-4e9b-4d7d-5921-08da2f1c87a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:41.0443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6OMWBLlnS8KPJla7E6qrhxLuNTf37f2NvgEIcTDn8/ReHoz6Lnk3w0Riic27EFxIPlP7lcd0ES/COClM2C0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060023
X-Proofpoint-GUID: _dMbJdfbVZ0lsPJlRxTStCi6rkxQOcvh
X-Proofpoint-ORIG-GUID: _dMbJdfbVZ0lsPJlRxTStCi6rkxQOcvh
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

When the control virtqueue feature is absent or not negotiated,
vhost_net_start() still tries to set up vhost_dev and install
vhost notifiers for the control virtqueue, which results in
erroneous ioctl calls with incorrect queue index sending down
to driver. Do that only when needed.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72..ffb3475 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
-- 
1.8.3.1


