Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3383212CE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:11:57 +0100 (CET)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7G0-0006kP-Nf
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CT-0002KQ-AN; Mon, 22 Feb 2021 04:08:17 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CF-00007j-8Y; Mon, 22 Feb 2021 04:08:17 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M94OoI011823;
 Mon, 22 Feb 2021 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=p74fVT205bos26TY1S3TvuDdYivv6goQmXFNHknwR7g=;
 b=W+aeNJj6kjIxp8WP6BgF6/ZjT6gVDpee/Hzas7vIUuWqnECQL8DFt2y41tWUwgByQPJp
 iJ7KDcBQhSb+xWvD/eyyQ2pFBkgW1UoRF5jpYgrQubr+WrVRp14+aE63jZdBTmLFYmsc
 u7QSCnDQN4NyHKl13fLVU+AosT+Ux48QoKNm0zrxOxQzHatAH9IwgZ2ubGXpZODcjWNF
 cI3v/12xwiTirCUz6Zws4Zpb7+EqPt4LokSAVodkwS+EM8K0BkWz5ASKe4zZsQYUtUyZ
 ttUUJbu3ri7mFWWJMUIqQFQGS2pBHYS4gJ8TE+/5XHatNlBu4181yi8MpzVC6UF+ZRHY IQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36ugq39qgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M960cN181046;
 Mon, 22 Feb 2021 09:07:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 36uc6q2xgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAtmUeVe6oGptME8PUL+nstb9rQ6RE3VqFe74y014RH5DWCkgeSLwsxpkxlqy2bsuEbWkTB8X+kOYWJKwvgA1GaKYtmeed4FLvd3e7tzE0EGSjOUca+mf120bbjYWMkgqSr+VnDtcB9VOu2XFcMxxTrt62URkcazERS58K+W+m8XI+K5/911+eRawpBKacj+6/PfAHa9zi6qL61INFLuhUek72gp2HYfXMkwgt84PSyWSVlLcCIYjZ41EN+iD+yrK9iP+JNoJdbHacmYsZyxGqTAun57eXxwnIQRQjuwVtXg0fUEKeMH9HiSjSLexgDCepcNS9mNlQ5bZdXWrmPAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p74fVT205bos26TY1S3TvuDdYivv6goQmXFNHknwR7g=;
 b=AWjY3Oz+jjnD0C8ybj1F277aMRKYiC2Z/OCUUT5v7kIqdRoRP7S8sFFeUlzzS+NylTNL9Be4qR770545ac8RRHhBorSa7VshOl0ZPdNSYNd9pyJ1aqfB+brfqARnScPkhEmpqtDzG3NXMbsyXBOcco0K1XgzY0bS1TuGJM4oKDEKZHzS7S0a09RbptY4JWDhPQbTqg7/WpaYTMEWMjEUvV8WFHng4OsuR8ffO15IaqcA+Rgc1dFc7LjJruV36jGyoDbLIsrF1Ip2yxO0+3BNrl5owOOFl5aDEyrrY4va8nEZ4kPvBpaqavabFxEMzWUZCSZLyF8ajeNgviM3bx2ivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p74fVT205bos26TY1S3TvuDdYivv6goQmXFNHknwR7g=;
 b=Yg5rVCsoXX4weTLC2xDIMJf8OFKLVFMni7xNPM85f+v06r4kud4MK7NIdxU2uRIrDQLos7S4mCsjPMC7jn/IEJaI0O1vzcHFAX1gXteOcoTjtxiBwKyOVeDnp31zUsVLPcKdII+JZKpHyLzX0BPdIdgtK7R9v+O/YwHqtKjjmeo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3227.namprd10.prod.outlook.com (2603:10b6:5:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 09:07:53 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 09:07:53 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/3] hw/flash_cfi01: Reduce memory consumption when
 flash image is smaller than region
Date: Mon, 22 Feb 2021 09:07:44 +0000
Message-Id: <20210222090747.2310104-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 09:07:52 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id abebe8e6;
 Mon, 22 Feb 2021 09:07:47 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 408b884a-056d-4fbd-08a6-08d8d7115656
X-MS-TrafficTypeDiagnostic: DM6PR10MB3227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3227108F137D54AE69A3801488819@DM6PR10MB3227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uq4EWKkbfTrWy/l0j8Wq874WjpIYHe6bqZ4TdSQY7+aGFO8dLpfJgRhczBR6iWNkwXTbIEGzXhRcsVZcrqOk2yVZAPO6SJmtwVg1ZnWCkpilh6iAeqKk9eycavilmrEMbyFHLC4wD+GlFGXfq86W0B1jCbO1u+N5f/bCwZA3CUkpFmDfPEQV+o2H8mhr6WhNNsu6abpSz9YfJCMm7PVqWqvLGOHbVUlXozqaWDfiCeZPerNTQJDmQ9BfyEQXNIqxJ6OSTOeca7RiTA141J5m42mucE26dbskwSspqUPkf64YXsq13ptwaEFiwBIr8r11GDEPnzCIVSCDAbqU2ynXoyUB8Jo8dI7K+muYSMqWSnC/bu/GyOQgM4Yk/qvep+piauGLNg4vbc6hhpf6P6oLrqgfPF4D2cjOpB5sEsZL9J9fZvhSsaVRt5tW3nbvBuAc/+emIEizrHCibwFb+kb/sB7XvDNpJJOUwQRq3yuw/VDm6NtO+U7jMi3ZxztqbKl8qmPx9B3bHQJ2146JL2W6Bw1aEzGlxqwTh6ukmYuqDoSq5GInpnf4YCNVbfGWtqd/XPmQch4vn3fO94uz98FvUi2KTJDvSUH42ronNnUt4sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(54906003)(2616005)(52116002)(8676002)(83380400001)(5660300002)(36756003)(316002)(186003)(6666004)(44832011)(66476007)(107886003)(478600001)(66946007)(66556008)(966005)(86362001)(6916009)(1076003)(4326008)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8TwN7Y2x7JXJ6KtxXjO+fqefDFFzwfNJcx85KkrElzqTloJ7ViZBhXzn64SF?=
 =?us-ascii?Q?ZPekQfljACrfVVmlG7tNIWiRpQHjtFIq8C+6yxaOIXZgyx8a1WEtrBCBQE+s?=
 =?us-ascii?Q?MgZZxWpuWtccYaYEXM3iBlm79YaSoFeSZUFc9OdAaAAYE0rBvFetedb9ElCf?=
 =?us-ascii?Q?Nfj80BHdK5XbLj4Oh8tAziNEHOKtKLzPlzhzz3xDxaOD7q9uxr4QSXI0t5IO?=
 =?us-ascii?Q?Y62luiOCtPYpMddAuq8gXOv+c22NYt0eb1OE6yt3kn/5TnQweo9xyZM3bVzy?=
 =?us-ascii?Q?pPepWt6A1+JjD7QZdWrwRF2jgmpTILntOKmoeXC33br5OyhUPaBjucIlM1/F?=
 =?us-ascii?Q?AAoz5CZSYDGwcZ+u9nx9FPJc8CH/IAgywgDVZgO/dgFLRdyHv6g3m1q4/MCw?=
 =?us-ascii?Q?mYiPt2qEocieIv/83hsaz9HwjytNTN9IQBg5V3nx1sheBrN8D9HdnxJbUEbl?=
 =?us-ascii?Q?dLeTATLcV46kq4k0bRzE0G4E8B3iG2oPo/j395U+dqbFMt+vBhkqkN+Snq8Q?=
 =?us-ascii?Q?bGFb+ELFvQEStV+RddLFtzO7D1caG5fCspQuff26fwndgCs8Q7Za77DyNbS8?=
 =?us-ascii?Q?TjH2c5AM6ASIUu2gY5Ca7VWS7kmRpqOpxK7hY0cnqU1o8hi2NZcrAWFZiNgu?=
 =?us-ascii?Q?+mUMeQ4+wCsDNpNEgxsA7isVZ4HV0qNc/JQDitROJfi8X4IjdAMeR0SuR381?=
 =?us-ascii?Q?u75KLgvdSO0CXhCfzmj9ljFDwmM8fqVf/4HMrcvXzm0pc/P8fKBVOaTKoUB5?=
 =?us-ascii?Q?48h9m3AeR8H4koa0PrAJolqFjGEKNrVxBZppkASB9bJga/GQEZZCxGg+s78U?=
 =?us-ascii?Q?DDcRU5CTFbFmuHt3RTNlWOqhZ3Y59Ztr/szyq8H0l/NLLrN1zO717Dn0vQJp?=
 =?us-ascii?Q?PTzuHt7zx3nd3enKOuu+Ur9I1SQb0pVpZrlFVPcv/XAKeMyYNHnpcRcBnn17?=
 =?us-ascii?Q?AweuZde1Omc811ASGhNAZJnhzMxBUTI55CCdPu1Xi97NK9LDnytMVKkq+h0B?=
 =?us-ascii?Q?XW9v1XShlaNHADTTTbvR0IQrQdyZRcAiC7ppNdRXs0CUAXHq1tRjI7M/i95o?=
 =?us-ascii?Q?9KAVj1OOFm6KpIIaZZ8inf8osW2MYD5qRSXFzLqJUernr6MKKp0j1dWrVZML?=
 =?us-ascii?Q?KJeC0mvj360d6GNRRocSw+XLgEe4w/9QNJp+Pc9Uab4Q6fnsNYh+qakgaCzX?=
 =?us-ascii?Q?Y9Hu3VvhnRceUm9EdtlBTzhE2zHLVzfDNqlJfb6qa+k82OAjlb3MVmFdloDh?=
 =?us-ascii?Q?tkDMNlCtjTMq711uypvSoUE9ZubCkaoeH3pUONUrdUe8rutbxMTmC2QfnO9R?=
 =?us-ascii?Q?0MemXIG8F5CDQvAUT49H1pIDbN+xwj+IUe/Bgk4YcGIqew=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408b884a-056d-4fbd-08a6-08d8d7115656
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 09:07:53.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLq6KuDJpYwNH7vrUbvqcfNlyedAGA6vqoj1+Sze8P97k/1Vfptfu3q9pCLBkZc7SpdR/O2V9MyOWLcyICDn8jBi9619Jp903V77Hk9+zm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220081
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As described in
https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com,
I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
images on aarch64.

To recap:

> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both
> then padded out to 64MB before being loaded by QEMU.
>
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying
> the memory). Of this 128MB less than 3MB is useful - the rest is
> zero padding.
>
> On a machine with 100 VMs this wastes over 12GB of memory.

There were objections to my previous patch because it changed the size
of the regions reported to the guest via the memory map (the reported
size depended on the size of the image).

This is a smaller patch which changes the memory region that covers
the entire region to be IO rather than RAM, and loads the flash image
into a smaller sub-region that is the more traditional mixed IO/ROMD
type.

All read/write operations to areas outside of the underlying block
device are handled directly (reads return 0, writes fail or are
discarded).

This reduces the memory consumption for the AAVMF code image from
64MiB to around 2MB and that for the AAVMF vars from 64MiB to 768KiB
(presuming that the UEFI images are adjusted accordingly).

For read-only devices (such as the AAVMF code) this seems completely
safe.

For writable devices there is a change in behaviour - previously it
was possible to write anywhere in the extent of the flash device, read
back the data written and have that data persist through a restart of
QEMU. This is no longer the case - writes outside of the extent of the
underlying backing block device will be discarded. That is, a read
after a write will *not* return the written data, either immediately
or after a QEMU restart - it will return zeros.

Looking at the AAVMF implementation, it seems to me that if the
initial VARS image is prepared as being 768KiB in size (which it is),
none of AAVMF itself will attempt to write outside of that extent, and
so I believe that this is an acceptable compromise.

It would be relatively straightforward to allow writes outside of the
backing device to persist for the lifetime of a particular QEMU by
allocating memory on demand (i.e. when there is a write to the
relevant region). This would allow a read to return the relevant data,
but only until a QEMU restart, at which point the data would be lost.

There was a suggestion in a previous thread that perhaps the pflash
driver could be re-worked to use the block IO interfaces to access the
underlying device "on demand" rather than reading in the entire image
at startup (at least, that's how I understood the comment).

I looked at implementing this and struggled to get it to work for all
of the required use cases. Specifically, there are several code paths
that expect to retrieve a pointer to the flat memory image of the
pflash device and manipulate it directly (examples include the Malta
board and encrypted memory support on x86), or write the entire image
to storage (after migration).

My implementation was based around mapping the flash region only for
IO, which meant that every read or write had to be handled directly by
the pflash driver (there was no ROMD style operation), which also made
booting an aarch64 VM noticeably slower - getting through the firmware
went from under 1 second to around 10 seconds.

v2:
- Unify the approach for both read-only and writable devices, saving
  another 63MiB per QEMU instance.

David Edmondson (3):
  hw/pflash_cfi*: Replace DPRINTF with trace events
  hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
  hw/pflash_cfi01: Allow devices to have a smaller backing device

 hw/block/pflash_cfi01.c | 190 +++++++++++++++++++++++++---------------
 hw/block/pflash_cfi02.c |  75 ++++++----------
 hw/block/trace-events   |  42 +++++++--
 3 files changed, 179 insertions(+), 128 deletions(-)

-- 
2.30.0


