Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FEB5377D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:02:43 +0200 (CEST)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcEU-0006FW-D4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1nvcB0-0004cq-Ui
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:59:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1nvcAv-0007fw-Ah
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:59:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U8DmLK018415;
 Mon, 30 May 2022 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=WphdC4jcudO4CEu6oiTT0Z+R7YsZ1zBJ8a3GPJKDbaI=;
 b=GKHEYJLnoHsaooZ33Y7VwTAao6B/Vg3ua7i85dqJAHuNZmLA1quN4OKIqsq1n0jj2i2n
 1qMQXLL+CAqUsYElL8c5r2INO+tEJEfC1gNp+rGAJmouEilkqPj93IE+U1t/xAmiNOK1
 Dk4CsQVG/8thxbqOGQOkpiMXJ/xBvRw0I1vJAVMGGI/GrmrMrxJqa1Bjwv2bzHnb+aUp
 l9D4aOGMjsqQJ0CnrV1UfTEAlI6l4XK6BJb+f3HZdjxjIyHkd66Ijm42CMXCL1Y94G0h
 eOcqFw8ngxNuZ6jgPavAoih5lpbu8XsZZwX/kWyXJCrjHCnRxV/UE4r/DSl+UU37eAxQ JQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbc4xjman-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 May 2022 09:58:50 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24U9uC28036902; Mon, 30 May 2022 09:58:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8hu40t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 May 2022 09:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHyi/hgDEScj5FC26hoGtmrXV2UDfkBiP4ynAUiomnZjQYnX3F3J1MYNjhQiyCQqqzDQd69H5sRMvR7RsReVE1UBnpzfpXtFEyGWs94t7SetBkA6VJXQpGFkeDDhjKRxFqy2E+edsMQGXODKDP8nW/6uh+mDogi7Hrw5vSM7u5nHk9DbMZi5AswwNHDYCrrTT2I8qPrIzV8zDwPIypRFo4tJCY67ple+8bwzIQtYUcKhhIj/hOBQQ8oKKUtJ0WlZzbbjimRc/T9Eyy0hZTh3jGC/0UfGIkUtAhBWPEOD0z71wim0vmC7cJW9ipMuNEPM3hTtqOrJBCK2fE6QL+Pbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WphdC4jcudO4CEu6oiTT0Z+R7YsZ1zBJ8a3GPJKDbaI=;
 b=FglY9eX5v26A0ICLb0GnfV18RWU40948cYBnwB3+Kg6NWRHiphk/61tjdhS+Ur+LRPqtfjjWmbcd70wkgwaEsHjdtPl7Mva1AwP2TEqgA/mNN5I7PbjRvo3EEmBKat9nyOKNG/ik15WNKftNWV54V3zgEEMAKIj2kKDO46q5xbrcK2oFwadyrJaRXvoubKjTf5dPbCzUbVPxbp2dqdSPyrTfTq/nPNiXC7BD3I1zCncd+Lffct65ZRnALWb/QAByDO5Ge3g5z+GsG63XTinXfx2xZjMAhh5WPFc+sZIPA+XzGd2GLz2oN41tpmv75DYdYFy1wMlE1TZ+Yz6vPKvaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WphdC4jcudO4CEu6oiTT0Z+R7YsZ1zBJ8a3GPJKDbaI=;
 b=icfcfRLB17tsDL9i+qYvoZ/KR37I+7eHKxz2RvbjyH/MwhHoQCunuJcr2xYS1/Q3UUNer/9pspRoG7GJyKlBsOk9FUiQTG8XpMQuXsjnDR9ZcpcSgqbNtVeUMQpTk9DBbYtqt8sCPV1wbXksbK6xNvUEnXh+GyAN0KcDlYS6ph4=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by IA1PR10MB6050.namprd10.prod.outlook.com (2603:10b6:208:38a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Mon, 30 May
 2022 09:58:47 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::94bf:816a:120e:37e7]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::94bf:816a:120e:37e7%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:58:47 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao
 Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Li Qiang
 <liq3ea@gmail.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Bin Meng <bin.meng@windriver.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
In-Reply-To: <20220527161937.328754-2-alxndr@bu.edu>
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
Date: Mon, 30 May 2022 10:58:43 +0100
Message-ID: <m2fskrcpf0.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB7PR02CA0030.eurprd02.prod.outlook.com
 (2603:10a6:10:52::43) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e9292f3-ba24-4fbf-a4af-08da4222fd26
X-MS-TrafficTypeDiagnostic: IA1PR10MB6050:EE_
X-Microsoft-Antispam-PRVS: <IA1PR10MB605098F98F5B0E8C56CE1AF1F4DD9@IA1PR10MB6050.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nlVm2pkCKcyJ+BdIltREzbASWsj239faoEIW//pMHXnAF7OsxDzQ++gVIajRcG/TOwMJtG+8ci/w+NV65Bn30mUEXEmxSCbFW/aksUr1oxs/ZbWzTF95aBjVExmZEdENw2DffrXllXBGrJGRbk0U1wWDmxW2JJfUPgI5/i5qTknMMVddRss6tPXQb8XKvA/A9XvglOCX8pxw4tTNqzrAk5RwjZ0imLvmOezB/9GHnq2q3k7WoCbE69HHyc+qaU8bTJZvLhLKscWoFZcGxsbBgqg4QCMtI+Xd5Eu0GzX4cPZZmqANea7gNuHsIfiBJ9Btq+BzdPXG+BBxDuiHX4lEE1IaNg0ueFTISTA+7/Am4SmlN/vkpRRLvlDq0VJuPD/0dr7KMdOJx32EZFViOMJyvSLldDSSaLHnqdpMnQx8pDexAuRHzkS+bITr5c4ym0AnpfbjJ8SLQzWiWk/clVIfO4WcA7BYzl5Ro5FK2f+WDhvfbMUk1tOepxs80gRE4cwiJo4GP99Nm0mGQUtNDnpxsxSm7HmWlr6+dMgCPuE6X0XUFzwKULNgvGxDx9lEmsUpPDEuAD3sOPJod2P4nX8ysvMIH7jg3rKGIMbiN/BKy1V5bmjw5mXfCt5XCU4pw8o6jOXTboHNZo5BNVSu7PasA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(8936002)(7416002)(5660300002)(44832011)(508600001)(6486002)(2906002)(6666004)(6512007)(26005)(86362001)(54906003)(83380400001)(316002)(38100700002)(66946007)(66556008)(36756003)(4326008)(66476007)(8676002)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JwbG0l93NP/0BGFLJbqe5skgxmRXkzsOhz2jqTE0pQwjIg4KCJyku6luePu1?=
 =?us-ascii?Q?8vrCft1ybU6i13+UZcY4lWVBlQkalT5pOJOnEaq7UTskS7Twr7qStVJ1G7YV?=
 =?us-ascii?Q?mS+pl1JKlPA9v7GeP0Xa2um0b9tCkyIaKPGZr6GaboyMf2y/QV7zqQplOUTM?=
 =?us-ascii?Q?wqw55nRSLqJZ00vJrwNwX8FQkt4r+0e02hg0iXB59tI6+4gCJiSQJR/To+eQ?=
 =?us-ascii?Q?ar4Nr1QV4p1HSmFXszr2MuR6pHs6M9DViKPgNHeKb9r4cf5l+CGPhBqNPjl1?=
 =?us-ascii?Q?es3HquxLwPch/Rf/ngBtyJzmtJW/2xFeHLa/a1FTQFyZTYC3V8eVELD3yEYm?=
 =?us-ascii?Q?7CtPDZj6egQNy7CX++aJbQgM7aaO6xDOoobsix6HPhyEnE2SdHcGZPWdiATC?=
 =?us-ascii?Q?uygG5Tbz6kikNyeYAP6Z7b4HlqCNoPR8MD0INTOhoCMvAUMiiqQjeFz/3ypD?=
 =?us-ascii?Q?FIod/JZz8SNYTZqkK2vzQlzrFffzqsRxQc65PiY+tPAsi6YNamPG3dRbDISz?=
 =?us-ascii?Q?TRBCu++nXEfHQSKrDvJpyWIr2JMfA05e0ThdZwoeX7OT1gZObkTXyvR2+kgy?=
 =?us-ascii?Q?nskbzAiEZQ77pBwDARoSLer+oGYHheDfVAz8h3Pld3dzO0x3Bw2X7HRjdB9c?=
 =?us-ascii?Q?MButwg6yAz9wpnGpxyvLeb8m5sLq62wniftUIibQPoesVkp+a8JWqTmwf0hu?=
 =?us-ascii?Q?yUy4RrVCTAXCOSL1nORx+/YGa+X97cYjMyNnhU4XbxBgrNkgCUxET4easU6z?=
 =?us-ascii?Q?jWQSp+ONbyo39gvYAeHKC/Tgd0liHQgdN4w6P8pqY/M/J3Evstf1OeZ1lYjh?=
 =?us-ascii?Q?LpZbCl1wF+Zx3GFJlIIENrZkvTrW9cDGB8dF2c1fnCLgbx9yLBzK1gxrgh6u?=
 =?us-ascii?Q?LJW1XOGDjPOdIHCx2hPpF0MBpC6+pED0Wif9ApUD1U3N+qxFOtBRWUuK0la6?=
 =?us-ascii?Q?ED1zRfxaFyJOM8bQpwyoybgMkFB270+aLULB/ENae7Odt5TJG8sMq0kGS66t?=
 =?us-ascii?Q?Cn9ptaYqwpwAabCsOYSFhEA58qJ8VW8GUDCGHECuhDQzSzNjZTGbHo+xJxwd?=
 =?us-ascii?Q?pPIsGWkF76iIaaOT0vwFsVYBllszmV9nnoW4l1S4QT13kTb9lbwE1DeKx4x4?=
 =?us-ascii?Q?8f3ZjBLiFKPeDkR2pCgSZmYIwcRBea55cJyGaJHgxEDaO130coojHXvfNrfF?=
 =?us-ascii?Q?6dE/39NOgXDZFYjVqRjnl4FSzibzL88tvWfQT/36hakHz+fyL+CKVSQvgSk1?=
 =?us-ascii?Q?3dw4LPz3bCss/CE+mM3U+Wk51xeYAyLori/5BTxlUBQ5kqWDB6gR14GKOHZB?=
 =?us-ascii?Q?P41ExXYHata1cq/wO/VS2W1GtmMOMM7odWoVb9sn9Q9STzJTck6MRFROWx+h?=
 =?us-ascii?Q?4NAcqS2iDJQEBdufE6ogLBnrxk1mjipBkurzR4jlxADSDFbnuz4K4EgpUJkw?=
 =?us-ascii?Q?aNOemPttyLqqIF6o5iBKA+qPrx22VQixSKp2CnlC3bXpssVa/hHXFshbICC2?=
 =?us-ascii?Q?/i2uiKL5Yw3ejLPpkVa0lo8HGFYHC61nGj7tgvWZuX0DFkKAtq1rX0FWSJDZ?=
 =?us-ascii?Q?FfGjcL56lfvpv38zJ4FbbOR7O5NZ5iT4Zs8hdfnzhmi62t+mztMguYg+23ws?=
 =?us-ascii?Q?NjKfy1BNTwh7TeKdJCNHk9wGrrie6ruc6BnKr3iuAdDocTA8PpbNTppoyl0U?=
 =?us-ascii?Q?kTIGEaW57uVGjyUB8uDBSVEkgGODaE1OUkSPgKCSBfUUs1TIthnm9qNMw35U?=
 =?us-ascii?Q?qUuUTpdtgNj75+K5O7oMBu24dmElAF8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9292f3-ba24-4fbf-a4af-08da4222fd26
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:58:47.1085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VtztZ2b2G0sVp2LymcUng0SwDlCbyOMq3NUyL13wGn9a+V3a2EFemmFRF/W2/ZNwDFDji4wKHWU3I57TMIbAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6050
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-30_03:2022-05-27,
 2022-05-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205300052
X-Proofpoint-GUID: Kr4LGdXND6zPYX7lOXz_KemJOwj1w3OU
X-Proofpoint-ORIG-GUID: Kr4LGdXND6zPYX7lOXz_KemJOwj1w3OU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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


Hi Alex,

I don't know this code well enough to be certain, but is a flag
sufficient here given the intent, or should it be using a more
thread-safe method like a rwlock or condition variable?

Maybe the device state structure is already protected at some level
with a mutex - just not obvious to me from these changes...

Thanks,

Darren.

On Friday, 2022-05-27 at 12:19:35 -04, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag should be set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent DMA reentrancy issues. E.g.:
> sdhci pio -> dma write -> sdhci mmio
> nvme bh -> dma write -> nvme mmio
>
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
>
> Assumptions:
>  * Devices do not interact with their own PIO/MMIO memory-regions using
>    DMA.
>
>  * There is now way for there to be multiple simultaneous accesses to a
>    device's PIO/MMIO memory-regions, or for multiple threads to perform
>    DMA accesses simultaneously on behalf of a single device.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/qdev-core.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..6474dc51fa 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,9 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    int engaged_in_io;
>  };
>  
>  struct DeviceListener {
> -- 
> 2.33.0

