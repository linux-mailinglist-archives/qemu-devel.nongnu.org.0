Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F161FA92
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Mo-0003ak-Vu; Mon, 07 Nov 2022 11:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1os5Ml-0003aZ-GU
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 11:52:55 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1os5Mc-0005mU-TC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 11:52:55 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7AF3cT027173; Mon, 7 Nov 2022 08:52:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=eSU6P+ltkfRaa1HIV6c5ZbHBsF7pcYPehHugtz/MSeM=;
 b=rQZT1KxDf5OPmZ21J2iBaeEwdI1tESBTeAoEO/766aGznqyvmRkcgPVFbx7rfibI7Nrz
 u1KppLm01i9TjTujBG8TiO2Ke+7FE/JPz8UL999fxKX/+tKj9h/nVy6oMc1AOArEiLAI
 kKDBQ/VLG8piHEtVwAa/J2ZXsmRaNGvKasbAcDyCK+Ti1CNT80IsC6Sb8wBjBbVbGv9y
 KdrK/xuihsrwOlM6IKU27HrraHULKEJF8xxL+9JLzVBsC8O2xQXxqtSiFmsozJb7ULIe
 EH310zMKnIVJIAnWlQlxWAbRwOUd1p0oC4OYM94kr4gK/Q9Eu6L/pkbn0zeri03I4A0S ng== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kpebntu22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 08:52:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6lEa9EZFb4B8PJzpCrrx5gEPO/OXxq9geBasQ+lr4hg5fNHLMxnkRq8uVlW9uQ5Yg1aiBFX4NYEJeFutgzK37I2C6+NEBdOo+WloGPdbmOi2Fc8xYBqVyz3oBILfiG9SsCE7mRABIQ3gPaita089k8xbErdNfVSu4C734WbsfZLGWc0zIh/1KXtzeYDqY3wy3V14Bj57cCH0weGnC2or3AMPWelkOxe+tyhbWNigcnUXaR/ViKsF06yQSkt+mAEIDqbBa9WmOEPERpfF59O+SDdtZSFN70sV5tu6rj+odGHoOiVvVnnVLqdeUIcuVBaHKoGlEBBk68auMvszONt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSU6P+ltkfRaa1HIV6c5ZbHBsF7pcYPehHugtz/MSeM=;
 b=DCam8Sc6NAU5xHgaCTUEgjAwgfW8/uGl1K5tgYfyaJ47lI6P/YACivY5ZBAzAZRNUcmkSSN0NCe1fAjYv41IMUeXiqnnE/widvbtSgcXG7YTjdKAXv6MN39zFc+/rdv6NpEDb/0OZH6V29rMZnTbsEYT61YT2MT4DrTh7grlsXvF9wqu9FgzfKpkQKBKjdb8bdfMR9vXP5xB7GggrQPMA5wKyLrh7HJRamm7HdhpgmR8C9lituO+dWLZG6I9yKO7S1NCob85xhd4PE15R98vgsz/UelhWEHJYwnlrw0jdILnp5QJBm5/kisQ+qDvR81cDsr9kPoCF68j1rVy7PRxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSU6P+ltkfRaa1HIV6c5ZbHBsF7pcYPehHugtz/MSeM=;
 b=FasdTLEwtUZBwuWeaDk9505r52OZDT+ple/tQKYoOcRxVHiG2DV2IAO6RxohkcT1sf7YN+z33cl7jKBLyzYLFVa8rEUhbdQa6m7nMUPg3pLNZFhoyEhglpsPuLFnyzETKGMekp+7B0IXukOu6k87nJxDNxLlmM4VsmNRuQPrK5588X88ae4Bp9CswpwdBTBl/3sXj3dL+uhhbjzu+cw7aZAw1TYE6ToDjUTVi6evtPt649SeqbXrFuCI6kT6o3MJTmzLQJy2U1Z0F/bar6UOHQUGpIBqpslVoHLW78sxTqM9A0OyJYXvYWFJcLUdG8I5A+gIZXOEk9a6Q74D38Oycw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CY8PR02MB9154.namprd02.prod.outlook.com (2603:10b6:930:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 16:52:35 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:52:35 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v2] migration: check magic value for deciding the mapping of
 channels
Date: Mon,  7 Nov 2022 16:51:59 +0000
Message-Id: <20221107165159.49534-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CY8PR02MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dfca5d-9d2b-4be1-1c5b-08dac0e078a8
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFK6LgnPbws9FRtH8R3yek7fmz/HxA/+DP2FsTE7yMzGAWtV85DuKd/D7bea3ntY5WvZLrgqdkQmmw7Db/uOw0NySbGMqIzw+zGzwyn7pBf5evj9kSN79GLivsG9Bbh5Fc60bv4IE+CY11xj/OF1b0f+Puh1TAf3IJgdFOUBDgiJ0/q+kFgpQ6gnAzYWPfU+GzEB3RyeonjuobV1z6MRcpMW/gtud5n54Q4mEqW81B4LIyy01YiVzwrrBQjlyXS0XNoLHCSjE5Aua9YBZG/hYsqfbW2/URJKMpuaonEmRTgRxK7WyfQVOSLrkF2cl15FbP78sdKhwlAmz8gh07+WR4u6HkwZKZaWhD0jzDRNaIK+g6UhCfRZFNrbYruQULYcBMs46ea1LOpnKgEVDsT9qfX2R6rLlqzaXgNZqtSqmrn4rQIV00whu/AnRBhgddJhEI9Hrli1XNPs6nDFtHueLZ7D0lrCpLNaCCP/CnHcF9y0gmF3jPlRrxd+MU81vXTkyTkkYkLqMz2xdVVS4TM4zBegk/cXPOXsGQCDS3dmzKoUjzxOI4/+B57Lz+AEnjQ2CVQyD0uaCt2Zpu3thFyMEq/5jJRcPRhHXmbI35BSnextQCRqZblTO2NUuWYbJylZQNk14rR51xN2BSg+OXhjm5fBt+ZSB4GUt38aNYAIxoiPxzazNouys326x9nEo3qt2A0IAw+EtIZb/Ts961n3XoNi41W99jPyXWvhLXGynnatYG7fIQujvngjZpwkSeQPlWD957/9t8uIX1Vxxtnp9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(186003)(1076003)(83380400001)(52116002)(2616005)(107886003)(6512007)(6506007)(6666004)(26005)(30864003)(2906002)(5660300002)(478600001)(41300700001)(8676002)(6486002)(8936002)(66476007)(4326008)(66556008)(66946007)(316002)(6916009)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnpkcERJWlZpbG1XbER5MmFXV1NWdVNNaUI1UWFMVEYreDVlUWoyS1FOY0JS?=
 =?utf-8?B?eDZvV1dlYkVFRDl0SHZKWlR6Vm5zckR2R2UxMmlhT05wNFZ4ZjZ2Q1ZLNURp?=
 =?utf-8?B?Q3BnQ1FpSlNmQWkxRmZUSWhoNm16a25yamRJK0Y2bS83SDRjcHN3VGxXbEVR?=
 =?utf-8?B?UlJLd09ZNWgxWERNdmQ0YUFEcW5ObFJnNk5EUGpxTGlzdHU5Zi9qenYvK0tQ?=
 =?utf-8?B?N3JNQUhLdGhsaHFZb00xemo5MHY1KyttUExiaU1WSEZEa2dYc1doU0dmYjdS?=
 =?utf-8?B?WUh3djZRWGowV3BKcFQxN0hpeElOL0NiRm9xcXdzSGRXanFKczR5eVRUOFpi?=
 =?utf-8?B?eDRhUmxDMUQwSXNEN1R3ZU1CVCtuSkNyRzI4L3d6ci9seFF5MDRrR2kvNW9j?=
 =?utf-8?B?N1VZZ21ROU84c2xpUkVZNjUzSHI1OFpiN1M4alp4QXBUMmFHY1YxTW8xZWkz?=
 =?utf-8?B?Y0VLTUk0TExLb3dOTkNwKzBSdDNMZllBNHppMXd5MWxXWVBxZk5XU2NzYUJO?=
 =?utf-8?B?ZHpnNlRnelZNZHZNUTZ1cG55SThwM0hhM1lkUlhpZDBMMjZMQUt1aWVSb2Vx?=
 =?utf-8?B?b0dLdWVMVHdSREc1Wk5OcWduNisxeU51RG1MdFRySmR5eXJYS2xsK0tYR21q?=
 =?utf-8?B?bm5QRXBiWGZEcGVmSWFLdWVWa2VoUEZpR1lLN1lGam1QdnJralVrc0hvdWdy?=
 =?utf-8?B?RU1WM3dTZ2M1SFl3anVHQnVFRjdVelorYXRTUXErelFxM3JKUFhLc3JHU2d0?=
 =?utf-8?B?cGJJL2xVV1VGMDZiR1hORUE1UzZkeC9NNEdmRC9XR3hLN2hWdEV2di90S0RV?=
 =?utf-8?B?c2JlVnpMZ3pldlhwNUxGSm84d2tZbDJsMWNUUEpJU2swUVJMSXBsYmN0ckQr?=
 =?utf-8?B?UXUxUWRoOTlJTG84R2JLS3o2NlhvZmhYbHNhakJEdzJYOVFNdnJWdEJCUzJC?=
 =?utf-8?B?T1FqWEp3R09tTXVIbTcxR1FzWkhYYVUwakFWamt3TkZHa2pZLzU4aXAwNkti?=
 =?utf-8?B?UzBUWTd4UHRWbXZSVWdzRmFuNm5Tb081dGZlUlZTVlJhQnVubHBtSzUyVFAv?=
 =?utf-8?B?ZEtIVnh6bDFScGU4RU1DdkxDdTVpelJEcFAwZ3h0Y2Y0ajdlOUNOdDdkeDhF?=
 =?utf-8?B?cFd6YTlmSVJXMkkxQ0J6Uml0eVYrdFdCcmIxUFMwTXNibi92blRyKzhMc0NJ?=
 =?utf-8?B?d2ozZk5OSXV0ZUR5Vmd3elk3YTUwbkxUVkozOFBReEVyUU0zQ09VaERVZEo4?=
 =?utf-8?B?bmp0SmNuZ2JkR3NUdmRHdE9NTFRkMlcxeDIzUjhkVzZ0T3A5UXM0SEhDNlEz?=
 =?utf-8?B?RFdXUVpKenNJR1FRVFFjOVdNRnZ1TTJIWVdyVzRMNWpuTnkyT2dHYWtVV1ZK?=
 =?utf-8?B?N1hhZ2IrdWRpOGtzUnVXc2FRNG9VZmtZKzR2ZnVKSXR0eWorbnZCMHFQdHZ1?=
 =?utf-8?B?UXdNQlhaZHNyTHpMd0RFdUhVT0ZQQk50RHZjYy9FRkZkazJBeXFHQ2cxa2o1?=
 =?utf-8?B?TUtuQWNxdENLaXFTazBPaWlEN3JEdTF5aW5oTHpLelUyejJudjdIQk1RSWdi?=
 =?utf-8?B?NE5mT09JZEx2VmpZM3pFUkNtb3FBZ2piQU10SnMzcEQyeis2YnN6RUR0djdj?=
 =?utf-8?B?alEvZEw2Z2ZiZUV4NGU1TGNBOHR5L2t4V1VSUXBqYTFRMFlWbjdqdE80VDVh?=
 =?utf-8?B?OXQ1NUdtUXJRRTNrK3FPeTE0S0N5OWQ1MXBqNmk3TXhDRkNTR1pQZ1o3K2FD?=
 =?utf-8?B?S01DQmhrSlp2MWZqUWxhaHdmS0tacUxGS2ZwT21haHVHckhxL0E1TTRYYmcy?=
 =?utf-8?B?d3pBUWw0N0JVTFNCbzZxRW9kMFViWThkYkhwSE1kaC9zY3F0elI4L3gvaXhz?=
 =?utf-8?B?QXZlZ0hrb1Z0MEZMNjVSWFFyK3BFeVoya0NHUnRxZGpUQjhUaEg0OVBVcE1U?=
 =?utf-8?B?U2dJcVl5LzdvbEFvUVFVR1lqS2xRcm04SDFoNkg0SmlUQUZYUXI2TkRraDIr?=
 =?utf-8?B?bUpjMGdhZHF1d2I3cEVtYVZqYTBoMEcvNVNucjFoT3N6TGFDWjN4K3d1M3RV?=
 =?utf-8?B?OFZPeEpOdWVWdG04OXZSdi9ncVZkSjAzb1l2c3pJWjBwVEIvR01hWm1zMWVx?=
 =?utf-8?B?RWNwZ3J2UHJGaG5iTmNHYWVwb3plcmIvN3FwME1CdThoZHNnR3dtTmNjN2d5?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dfca5d-9d2b-4be1-1c5b-08dac0e078a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:52:35.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnXYU110ZHE032E+XkeBT3JUDGgcCumHZNgFpjzwuchey+fp4xX6MVLPAeT9Uv89MFvzUApji2tecIZQHFrZC1TanV2iHyhgByn92uOWqPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9154
X-Proofpoint-ORIG-GUID: C2XxNl99nwQuy4OK36zbZmpUoQkqqYkC
X-Proofpoint-GUID: C2XxNl99nwQuy4OK36zbZmpUoQkqqYkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.
---
 include/io/channel.h     | 25 +++++++++++++++++++++++
 io/channel-socket.c      | 27 ++++++++++++++++++++++++
 io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
 migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 8 files changed, 130 insertions(+), 26 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..74177aeeea 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -115,6 +115,10 @@ struct QIOChannelClass {
                         int **fds,
                         size_t *nfds,
                         Error **errp);
+    ssize_t (*io_read_peek)(QIOChannel *ioc,
+                            void *buf,
+                            size_t nbytes,
+                            Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
     GSource * (*io_create_watch)(QIOChannel *ioc,
@@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
                           size_t buflen,
                           Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read in data
+ * @nbytes: the number of bytes to read
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read given @nbytes data from peek of channel into
+ * memory region @buf.
+ *
+ * The function will be blocked until read size is
+ * equal to requested size.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp);
+
 /**
  * qio_channel_set_blocking:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..b99f5dfda6 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
+                                            void *buf,
+                                            size_t nbytes,
+                                            Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t bytes = 0;
+
+retry:
+    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
+
+    if (bytes < 0) {
+        if (errno == EINTR) {
+            goto retry;
+        }
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+
+        error_setg_errno(errp, errno,
+                         "Unable to read from peek of socket");
+        return -1;
+    }
+
+    return bytes;
+}
 
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
@@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
 
     ioc_klass->io_writev = qio_channel_socket_writev;
     ioc_klass->io_readv = qio_channel_socket_readv;
+    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
     ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
     ioc_klass->io_close = qio_channel_socket_close;
     ioc_klass->io_shutdown = qio_channel_socket_shutdown;
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a2d9b96f3f 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
     return qio_channel_writev_all(ioc, &iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp)
+{
+   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+   ssize_t bytes = 0;
+
+   if (!klass->io_read_peek) {
+       error_setg(errp, "Channel does not support read peek");
+       return -1;
+   }
+
+   while (bytes < nbytes) {
+       bytes = klass->io_read_peek(ioc,
+                                   buf,
+                                   nbytes,
+                                   errp);
+
+       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_OUT);
+            } else {
+                qio_channel_wait(ioc, G_IO_OUT);
+            }
+            continue;
+       }
+       if (bytes == 0) {
+           error_setg(errp,
+                      "Unexpected end-of-file on channel");
+           return 0;
+       }
+       if (bytes < 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
 
 int qio_channel_set_blocking(QIOChannel *ioc,
                               bool enabled,
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..406a9e2f72 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migration_in_postcopy() &&
+        !migrate_use_tls()) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
+                                        sizeof(channel_magic), &local_err);
+
+        if (ret != 1) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


