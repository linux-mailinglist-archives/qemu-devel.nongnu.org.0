Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F052EA63
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:56:42 +0200 (CEST)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0JF-00012B-Ct
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns09D-00019T-BL
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns096-00021Q-B8
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:14 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9eR8j025952;
 Fri, 20 May 2022 10:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=TuLsfapAXV/BoxeUeuJy79NqcrBXLJ8b2/kAkWuMx+c=;
 b=qRq6QYg+8A9ljxL9hPKyiR8Mic4HcG3rCQbTt2i8U0jiR1jXB7pMTi69e1eWXkSePtpw
 +H2qprARfe7fpsskkOzEuAIQqGvslF5WflYwAAtoi9QCK+IPBtQSw3yq/E2aZtEpXcOu
 705n/xa+3QOi3C1djJXWkRZ1uB/qomyfAkUQwK+N1V9SyG6syvKJdy/W1y+RSQU9QXkI
 OOl7rRvmNIsJvbaz2MSyZm+wDBBB+oYgwIibX2J1nkge7Ru+F2pyMBYd7TOQi43pe92o
 JTY0/W92Xod4WWBx5OsdDnQc/5Q261lb/jXu1JD3S45rApl00nCbaAJHDR4uK1k8ltUa 9A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22uce968-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:07 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAjsBf017063; Fri, 20 May 2022 10:46:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g22v6c99t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3K1RRx8dbFBaTIjUQ8gVo/fz/Jrye6yOwEIMk4Kkpsw79s5vePbfs6eUhta/n3HC1P72EdBrRQ+IlXNwG6dkyx21QHSlkn6h0Hqhrl9r1MFpXDH/BYb9MrOgAoGgFYre455PyEhE5xwmXpNTrOEiO/vFjuJ5nfw6HCgEmJp4YpAJ4tFwZxdlSeJ1a48KnbmazfGOHdHRPhDf84Ptt+DJeIuBB7c1scyKr2iCMx86A/kzIA1l1mt25KM8S4kuPzZtxsOOL9hRYL7FABsukLdqVfdgqPIF5QsHM2KE+d7I0TQoDqJT7Szz1mJ4H+FP2P4btZ7mHHaLjgF43Cz/3JfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuLsfapAXV/BoxeUeuJy79NqcrBXLJ8b2/kAkWuMx+c=;
 b=FwFDHRHkyuyHXAqcKbVYdZJI2qQh5Rj5Udf+tk+jFFuea+a8urgRJ9N9IMu0t6B0NeqCgyj9Cv8PP/QuCAwiKo8QxBQwS96rk1qpYO2ljyq17S5L7nybXx3ZFnhh3H6s9M2O5XEHoTGNZcxTQctIeSBJKBzXdfBvGGacQbAdIGh6nIZU6J5CUzjNZ2sIpfDt231adJh0kaXltSabcOisrwScZS2bm6iKrQtJlaESRmWLw1L/+6msG9enB3f1Um/lHWvbcYpoU/Sop+e/+VpbG49L8t+T+Ka097g9ZTvL3X7dirFUUIfBENzU7BRJV7MPfUPwRSKXLNGfUmfNmKpuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuLsfapAXV/BoxeUeuJy79NqcrBXLJ8b2/kAkWuMx+c=;
 b=fuRNyZG5wzv8FFW+WB1rU/ST30k24LJ9OyFVRHXwnNc7rzi3QFWUk1Gyzy9e8P/fedbUJKFodCRtrujCk6YalDnJpMBiw3CgHo9eB3M4JOgCTsrhfP86sfV2G6RHvgfgbpy/T3E0BNyYjaJpO/TvzHGCWs7eEuNYsctYZpQxGx8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1378.namprd10.prod.outlook.com (2603:10b6:404:44::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 10:46:03 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:46:03 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Date: Fri, 20 May 2022 11:45:31 +0100
Message-Id: <20220520104532.9816-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ff818dc-c758-4a7e-82b7-08da3a4defc3
X-MS-TrafficTypeDiagnostic: BN6PR10MB1378:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB137811DD067E0BC0CC064CF7BBD39@BN6PR10MB1378.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /v/gtoj8rcsG8wtAX1DxwInL3AhStjU5f3fhdkahDm9+eE0iRt8X89haJVq3gAClkGP27zUPpxQ6cOk18RCB4JKdXxbeX01WOFuqHkTpln2n9j3nR5oASA+Nm8VgXV1L22oq8rIB6bW2DaRU15UV4FakHnuMI9sieQeRIAqQecjJAMJna09QqFThkzXQlvu97IAFxc68jDgJ2McznLrxdkKY2cohDdUiLTQ3ODA/v8d4KFR/jgCUpsax5AZcT/lTk8MUUyBMpvkQzxcBuKkiTO0kq+t0CtcXRILkKjSaPbSGGM2q2FMZC1Io50laWt4gVBwxaa11rKfoH+tIE04Xw2oLmD7KUZf577mVsqL27Rz8KwqdRzfyo9Y6ATu+wl7XyxprEgr526MvAtOCyPHQZWsS2BvkIfwtxmR/HlK0h3g9s+mOOLPVhppYrPFOHFlvBKJ6YLbGBgVYCLCp2EN/mKBVEJZgMKIWQPN+CSGl/Sf2fJRVwyor1AHTjnITPSSJvlJk38OX5vRz0n852jyceM4W550kKOKh3fGgGQpbuht2wt4oHtOmb9GBpwcsMDYoYPfzF0vxuDOa6krc2qq4UA39DbiK8HK91YvpWgwiOkFrZYjXz9jqkoYKnp0nZ1RHFyzXNScFa4bl/3vtXSImXxM8CYrtbNdtFKtUmiZbtz3KQ7BuhK7v320yglGiyUt0tw0BV++G5cpzpi3eQ+HA6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(66946007)(6666004)(7416002)(83380400001)(508600001)(66476007)(54906003)(6916009)(66556008)(6512007)(8676002)(6506007)(4326008)(26005)(52116002)(2616005)(38350700002)(38100700002)(86362001)(316002)(186003)(1076003)(107886003)(103116003)(2906002)(6486002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5MIOPhglEGF4fx6p5mXtA5VfSF6SP0+BFgQmnORgBCTAK/5b9jcg3w5b7Et?=
 =?us-ascii?Q?FpPYm3qy7a6ew5ZGBVnVbKgzqwdbGmuDGEoukeDMiebXxGUahA904GBWZ4K/?=
 =?us-ascii?Q?2y8t6hXN1CsiLTHqIpUFE17fv0Y5QB/RhVlueEunHcvAsuxeTAXAW1KX/pp5?=
 =?us-ascii?Q?C7bdcvThk1zh0JTCy1LQmApuWD7+nL7XpYPtf1xStUfcxlq7CT37v811/t8T?=
 =?us-ascii?Q?ruzUNn2UuMS+tFIF6T9/GJJKMkWjgER1z9P8ezYxhfk2Kb1DcBpuN5DLgfkU?=
 =?us-ascii?Q?Qti96rSzxW1lTkRTDaEPInZCl1gfjkTCGROBAMU57301xGBzrAP3RHXZft38?=
 =?us-ascii?Q?mNz+RT+XBiN2Gy1Lb024ss7LR0XLbrjC9wCHlQL6VnFFnMxgE7QoyjPypVt4?=
 =?us-ascii?Q?0fV92kgPLVHbxFcOYzSqC5LhPkKjpInbiMHoAyLvpj57ICPzTQGYX2eXNrjL?=
 =?us-ascii?Q?X38Zb56wLNMlMngtRl56qzxXyhpWAhGOO+c74EFmz4AeVCPsQHUnLQ3X3LXa?=
 =?us-ascii?Q?Sb/yeI2nYWd1rPjcYMzZrXHuKFoFC8ry5mZp2fhVgz/04hbYLpWm2RUae8nn?=
 =?us-ascii?Q?02gQvzZy08N/0wahSe4AXssE0w2jaftiy9UcxWV+deOdsF4jQRbBGoZzAGxN?=
 =?us-ascii?Q?LKGee82WNChJs+rUDz8pWn6aNwRIJk8gdF28la1pHDAroLijduydLDAlRaZl?=
 =?us-ascii?Q?FSZJzZIb54llfgTpKHxid+ZYykZDCI0krcF8VKXBGaPNVuWE4Zkw3/E2/VEz?=
 =?us-ascii?Q?d5wjNKUSqXQORTb6zNx14caSBHvzpfQD0SYug0s9i9QjYqhWWW9Ay7av4Imt?=
 =?us-ascii?Q?e3bqUI1nyWQR3Kr8mT7XGAhtgXRbMuKgUjOygyR29pK0ZLVcrta7pGK/TUhL?=
 =?us-ascii?Q?IVolYOHzt1QUTMebr/V8M1VZzFpgEXHZrmmS/L/qg5JVHhjV84QjBcQTOJE1?=
 =?us-ascii?Q?TGRdlPwK+yLtBanDwuuV8cjX5vRFk5mBMznicnzwHmcHx7LlVfOA7hQCVf35?=
 =?us-ascii?Q?pj8JGlO+yM4FU3Crb59qyZPz41WlZ/HUljMLR8XbdxiAkBZPP7V8O+q6CU5f?=
 =?us-ascii?Q?cCsn50/KcoQVWLbuYyjnPhSNzTrztUZHSOiU7RamMIYWbwsnIGQTfzgD2GCK?=
 =?us-ascii?Q?vSPgEF/BiAbs5WUE+i/s7mUavoMQvIfUpJEpAPv7izZhqOxlEM7CVDe1T/HZ?=
 =?us-ascii?Q?unT7RXssNf3fEOujfl9ngUuzSP0n/b2hM8r82bEkkdx0gqOoeb3+IolbVzz+?=
 =?us-ascii?Q?ypkSfiPjiy5SIpYy9ujbQAtL68s4eQR9IFz633enOMFwYVpzt2Yllg7IAi8F?=
 =?us-ascii?Q?i1LoxmwxdcJV6ucisXMHVErHaFa3htgZCCfdNjFga/mSM0fGfz4dMriZ4RzO?=
 =?us-ascii?Q?YoGOdn2LZkvYTnbk8NiYOJzlWdrFd9kZVc9gvhsFLFyeHZfc/WGZ10TMgi0P?=
 =?us-ascii?Q?Is9YXXxJuh6kK3f7tctKNDXKMqCXuh8luoNmkfUUuHp0Letvbfkl3vg5TlvU?=
 =?us-ascii?Q?cUtTtDxiODVgKHnEggnfhkLcAU50gZdPCk3rkIW0PgBsSHwr8qr2d7fCQn0h?=
 =?us-ascii?Q?8EY8ZjaUEl27y9tB+ui3qMJ10vu8cw6yCYlWuXvACX5Cjd1nG4QLOtI5zxNU?=
 =?us-ascii?Q?f6p981L/Qhd/ECU3FRXosukufR4Qpv7my1I1nf9gPF4eUNnyzLIva1th/Bul?=
 =?us-ascii?Q?p2DASCFTjcXX1oZNFf/1jrNq+sef5Ahk/5SjEZicLz+j0v/C/6pBAAVoriv6?=
 =?us-ascii?Q?E3mpXq0z32buxusFJ/LyAvx/CAJU8BY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff818dc-c758-4a7e-82b7-08da3a4defc3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:46:03.8618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KXb7+IQ/1BIHbfqnkyCCSgYoMfAb12l1Z+MOSsQK4RjvZtrBVnF+RgC5xdkpQNK6eIrMpmQ+DG4KuMUWBOdscBTki4uqntZvvYopZEswpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1378
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200079
X-Proofpoint-GUID: BKmu5vUBdKPB4XQGtMwwWW63f0gNvKbg
X-Proofpoint-ORIG-GUID: BKmu5vUBdKPB4XQGtMwwWW63f0gNvKbg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is assumed that the whole GPA space is available to be DMA
addressable, within a given address space limit, expect for a
tiny region before the 4G. Since Linux v5.4, VFIO validates
whether the selected GPA is indeed valid i.e. not reserved by
IOMMU on behalf of some specific devices or platform-defined
restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
 -EINVAL.

AMD systems with an IOMMU are examples of such platforms and
particularly may only have these ranges as allowed:

	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])

We already account for the 4G hole, albeit if the guest is big
enough we will fail to allocate a guest with  >1010G due to the
~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).

[*] there is another reserved region unrelated to HT that exists
in the 256T boundaru in Fam 17h according to Errata #1286,
documeted also in "Open-Source Register Reference for AMD Family
17h Processors (PUB)"

When creating the region above 4G, take into account that on AMD
platforms the HyperTransport range is reserved and hence it
cannot be used either as GPAs. On those cases rather than
establishing the start of ram-above-4g to be 4G, relocate instead
to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
Topology", for more information on the underlying restriction of
IOVAs.

After accounting for the 1Tb hole on AMD hosts, mtree should
look like:

0000000000000000-000000007fffffff (prio 0, i/o):
	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
0000010000000000-000001ff7fffffff (prio 0, i/o):
	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff

If the relocation is done, we also add the the reserved HT
e820 range as reserved.

Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
to address 1Tb (0xff ffff ffff). On AMD platforms, if a
ram-above-4g relocation may be desired and the CPU wasn't configured
with a big enough phys-bits, print an error message to the user
and do not make the relocation of the above-4g-region if phys-bits
is too low.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index af52d4ff89ef..652ae8ff9ccf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -796,6 +796,110 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
 
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
+static hwaddr x86_max_phys_addr(PCMachineState *pcms,
+                                hwaddr above_4g_mem_start,
+                                uint64_t pci_hole64_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    ram_addr_t device_mem_size = 0;
+    hwaddr base;
+
+    if (!x86ms->above_4g_mem_size) {
+       /*
+        * 32-bit pci hole goes from
+        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
+        */
+        return IO_APIC_DEFAULT_ADDRESS - 1;
+    }
+
+    if (pcmc->has_reserved_memory &&
+       (machine->ram_size < machine->maxram_size)) {
+        device_mem_size = machine->maxram_size - machine->ram_size;
+    }
+
+    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
+                    pcms->sgx_epc.size, 1 * GiB);
+
+    return base + device_mem_size + pci_hole64_size;
+}
+
+static void x86_update_above_4g_mem_start(PCMachineState *pcms,
+                                          uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    hwaddr start = x86ms->above_4g_mem_start;
+    hwaddr maxphysaddr, maxusedaddr;
+
+    /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (!IS_AMD_CPU(env)) {
+        return;
+    }
+
+    /* Bail out if max possible address does not cross HT range */
+    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
+        return;
+    }
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    start = AMD_ABOVE_1TB_START;
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u) cannot avoid AMD HT range",
+                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
+
+    x86ms->above_4g_mem_start = start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -817,6 +921,8 @@ void pc_memory_init(PCMachineState *pcms,
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
@@ -827,6 +933,11 @@ void pc_memory_init(PCMachineState *pcms,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
+
+    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
+        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+    }
+
     if (x86ms->above_4g_mem_size > 0) {
         ram_above_4g = g_malloc(sizeof(*ram_above_4g));
         memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
-- 
2.17.2


