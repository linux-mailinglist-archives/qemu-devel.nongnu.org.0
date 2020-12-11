Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F732D7838
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:51:55 +0100 (CET)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjly-00087J-2x
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liqiuhao727@outlook.com>)
 id 1knjit-0005fJ-Rf
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:43 -0500
Received: from mail-bn7nam10olkn2030.outbound.protection.outlook.com
 ([40.92.40.30]:22253 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liqiuhao727@outlook.com>)
 id 1knjip-0001Of-0Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZvzil29GmEgjKT/zTCPYxyNlFTb8pOfD0OBbr7ksI3E4mZ4cG5nppyBYl+6+VXof7P9NO2uUsl83hGEfirNsq2W9UNgTy2vVB+FqTgloZRISJBwqgI38TVsw5U8qFBNk+wWJegN4eP4aNndLGdQojBhH0VUrW0J195sKLiTldQf5Vttf6dW5cp+5UkZ3QzrnpnIJ6YEk0R/grW5DE397oUaZ+a51USNUz8IS7VZjOZb5D+dCNyU0Ms5QAcFZs8+wvq6SSzvc5xvMkdUhS8S4NKVvL8UayBW/4X0O/vd+cRArptMdfZkKPQIWKNDD9LZD3qmLVKgJZHhAeIB2mXuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kud8lvMatIKe9UPdaQUZUVh22ENTtJwrpc1BVDaCuS4=;
 b=GXlFfedleD8Ou1gkPxn/OGWZlahO0RTEo4VswqGPHeBp6mTSyA67pFj9YKNctSyNjy50Iht9SgscCeHF0uGH96MN8bJND5ZnDiTYbN+ydN49Lf3GOTDrX68BBAKczJdZDsV8GGVzADoCYnZ463urOkRt1XIfelyjn60QM4/rKb/+6XoKcDz4MKMRLLKsEprzRVJxQwvqTjq8NVYwFHyVSWKiNRHl1VCXa80KTryp7ofvwJ+JZ8dXmo/pJvYMr+8NWu5gkgWx652/+6MrjoHvDdjnsJxmTWPBua/j3Rq7oXwGOp2o/12K1PzCKvzlyENd3z4aSHatOdbumS3e7syKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kud8lvMatIKe9UPdaQUZUVh22ENTtJwrpc1BVDaCuS4=;
 b=d6r6C+mUYuDLYKE8m/0S50L2JFd87n/2pFJ8PGnhjp3l4fSJi55/Qu92XgDBMDADvY5juCyQY1uyOd8vZTTP4PW1CLH0/Yd0ep6aZKNsTGbmEkwiAgSN+eHB07dFihTwu54SU9jPWPrKLQGbhXj73Th/7fKJlC+lHSxylfekK8WBjgGU5UNOXcM6+C9/luSdnQQsEOHrgYNJujR07HEZWYvVqeyONxmsNX5ivzHzrKWmlGWE4U0/gjwHWPiUTrJpAi+kVJ9q4NLNISAqJ8IpydZDe0JDrxsDNROHMEi4tUKxJm3fYA+W+gn9jI7uJN306Mo+KVIeTbSkC+CQRZQwqQ==
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::4e) by
 BN7NAM10HT132.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::268)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 14:33:34 +0000
Received: from MN2PR02MB6237.namprd02.prod.outlook.com
 (2a01:111:e400:7e8f::4e) by BN7NAM10FT048.mail.protection.outlook.com
 (2a01:111:e400:7e8f::199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 14:33:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A0F3FC6F07FE0A320391EF8C4B496A0B878FC0BE53B9902C851E6DB1EB08F7F6;
 UpperCasedChecksum:5950F1433F757C366C3D18B749BC91F521CA2DE43CD81EAF71679C78E87742B2;
 SizeAsReceived:8426; Count:44
Received: from MN2PR02MB6237.namprd02.prod.outlook.com
 ([fe80::493:c839:2a3f:3b50]) by MN2PR02MB6237.namprd02.prod.outlook.com
 ([fe80::493:c839:2a3f:3b50%6]) with mapi id 15.20.3632.024; Fri, 11 Dec 2020
 14:33:34 +0000
Message-ID: <MN2PR02MB6237191C5DDBC42ECB06E87AE0CA0@MN2PR02MB6237.namprd02.prod.outlook.com>
Subject: [Question] How we make fields of a structure fit in a cache line?
From: liqiuhao <liqiuhao727@outlook.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2020 22:33:18 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [HVarGiDdxpRw+me3TbyiITO5K8hakeavPYUpWHBzv4A=]
X-ClientProxiedBy: PH0PR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:510:e::23) To MN2PR02MB6237.namprd02.prod.outlook.com
 (2603:10b6:208:181::29)
X-Microsoft-Original-Message-ID: <a0c979b662f98ec445cadf43da0fd32ae358449b.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (199.193.127.145) by
 PH0PR07CA0048.namprd07.prod.outlook.com (2603:10b6:510:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 14:33:31 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 44
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7d8d4324-35b3-4635-605a-08d89de1bd9c
X-MS-TrafficTypeDiagnostic: BN7NAM10HT132:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yGggM+ZEPde/VMz1kzcGTDv+ga6gmIFsWFwOIjO3QYY3avRMaKJX04XQj4rCchh2Nym3yvNr+j1RWEBVVYWIdYBBQQmUsf9ivN0MmPIJRHx3tbknopeTxxOMSokO2aBLSZwdco1DgSeq3grIUHZcb2MposcCYG5e+jr9P5YaCuezHo+/zT5HP7NoPAsO+vhHWyrrmW15BzGjztfRflC5Q==
X-MS-Exchange-AntiSpam-MessageData: 4bMw01s7pHXwOy7P+9WQWJog6oBgSQ/xHyktwKQLzGU8cY3DEjrF4u8GrubeA7xNVvQhlo2Hme3iGFp5AEShVk18M2RDphtP6HvVoShwE1/+sJS7vyvdTsLbg6xPeJ41XYKBy8PioSPg212Acq5QJQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 14:33:34.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8d4324-35b3-4635-605a-08d89de1bd9c
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT132
Received-SPF: pass client-ip=40.92.40.30; envelope-from=liqiuhao727@outlook.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

While learning QEMU, I notice that some fields of structures are
comment with "should fit in a cache line." For instance, the
MemoryRegion is defined as:

struct MemoryRegion {
    Object parent_obj;

    /* private: */

    /* The following fields should fit in a cache line */
    bool romd_mode;
    bool ram;
    /* ... */

I know we can get better memory performance if their size can fit in a
cache line, but doesn't it would do so only if they aligned adequately
on an address that's a multiple of 64? Do we make sure most uses of
those structures are aligned, or I misunderstood something?

Thanks.



