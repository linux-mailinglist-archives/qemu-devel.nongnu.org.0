Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CC258DB01
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLR32-00017c-KV
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1oLR0C-00083d-Km; Tue, 09 Aug 2022 11:18:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:15398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1oLR0A-00013w-38; Tue, 09 Aug 2022 11:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660058318; x=1691594318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TX3ivMipKYtV085hciZjmMLRrG5+i0ZlGWDgGk/w/Es=;
 b=CIoIzG9hNBheXSvO2LjikY99HCBWCbqu52VuEdF+ez1/tr5Ji7MI3tr8
 zfh4Y5Uit4T7IAeFm8MxoHZIIP7Nwrl2n8b1LyjiWIBAahu+TJCY2JOOG
 WSBxUJJ5IGQjtcB7hgZ2zz0DF+VP503xRd1x719+TzTjpC8HBAkKlRLnM
 +QfBJgb3s08Lb5/UHQ8dL3+bZxJaJ3XXRC7qf3aMH+0GiTJuh2ZdG3AYo
 a0/h6s5/E5tQkdmxH5h5ICGV15TUkSuP5MwEI2fLIDzX/NPPGx3UBuZbf
 BWORQQs6xCT8odCJH4vAA1sHTbDkRNDepUAauI+GcUSiW2cqB/8fCbUGu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316792727"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="316792727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 08:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="637750253"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 08:17:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 08:17:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 08:17:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 08:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZCJIsCv5hLZi/s4MmTZqZ1tauCVAnVOGDCS+wd+KElgPjG9wPIsr4ucJqTEIEans4YbSvdVyUUV3+v90fCjlFCQMBJ7nIcFZbY8Ds1VC8dVDwTiJHOsPoA3MQuXSD6p1kIqyYPvFd8Znx4VEMbqTMdmeqa7nGDa/xRti6HEFtT+nB05kgM0c+QQrvUq7BpVaCaX7wi2ait1BvaK5T+x5iRC5PTOerMs+vBb5oehITrm5fy7j5PbXgBqAnpxzgZ6nYgByUtQ91c/Eu4YR3uJm6/H/GUe910dBeoUp70wOHzyFudZE8QR4vkxTPuqy4HyJRgY3yiJlAsNVt0Lrf09bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUCA8ZR18PzhWv4cvK9VQ2dXRtv7lzXImmF9AzziR5k=;
 b=VURj3ys8jV43yY3Z6kyqGH+Fn3j/PDWLOi4D/tce89H7kyuK7eHKIcIVt7bjtHW8ucoQIo5RoT120CzkREtmCNAiFj++3+Jsc9wpBoKMlt8Ywb10nzal2d54B037PTCSWJQJMWK6VkULcVIc63nha0TFJphwsuQWPFPg1T7Zc1UlPMDAxcjgwkPjFjhyYAR/VPmjNHdLQ4FVMyCmhCgfjncTwG2C3kls/BvywGL+Ir5ZYySREClDXxFTJ9jwQtdgpCQSlLhGl/nhcCrSvzt8TTRMvR1bAy39n0eOlpqMbfsWZu39vTfruZd6tmNbdBNCOLtK2icp7nFKY7rgZoIWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by MN2PR11MB4725.namprd11.prod.outlook.com
 (2603:10b6:208:263::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 15:17:37 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::9847:345e:4c5b:ca12]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::9847:345e:4c5b:ca12%6]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 15:17:37 +0000
Date: Tue, 9 Aug 2022 08:17:34 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Bobo WL <lmw.bobo@gmail.com>, Dan Williams <dan.j.williams@intel.com>
CC: <linux-cxl@vger.kernel.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
 <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b16a1b2f-af74-4865-4ba5-08da7a1a4ad0
X-MS-TrafficTypeDiagnostic: MN2PR11MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wStLj5I/tilg5eoTvGlBoe0vSVs6/lkoVWSkZq3eJQ5g1nnooEKai1oLTdf9VIf8wdIeHSPAwq/xKRAGgJeUG263rsjvfoNAFm+GnVtZ/zadHbBwOmMgg4zsOQpF3uPqQscueeXlWiRQrLSy9oGhnerBTEj08au00BVbu0zmqigTbjOAmQz55CfAUV694u4m8FS6zqhEm5B2TaF/itUtTKRuUEibYsLN6vp476RvQAbkg/LUtmG7XpvuT+giTgZ95y95wUG1cz8pMNqwaQq7ATSiyQWgUhI8RLrM8U92ZO/EUtVjbwMA/faGtXrIdRoVT8PlHDaZ5LzquqxNzXUyxfMbyzAWHv6qKjF71QPXDzq5L3UoNoefTNTaDuX2kRM4mZZCS9iWQR2Jb/p2RNo4c56Bh6XUTmhBS9R8efZM94ex4GK0QbQkqWqkTEg+a4/ISY8A9M+2GGP9lA3dCPKadf8+Hp8BKFzoZRnh9Yik6o5m4S/jgl12RkrNxeseD6kWeErhg/boE+Vi5AOkZZeTnqQvdMY0Q6XsyalE8J3SIljp0wC8xfSUkkh+dq7GU9fI8Nap2uu2C0sImWKDwhOrSyc9Pu8HqaT61ab+Hz9vzRKNhHo0eyZ8wbmsw4I3l1rDl/oQ/g3Fqp3sGTJcY+jKT2m3i9PjouwDjzXQRII4sB0AE5rMYRR4AC12Kw6B10xvwNwEpETse+Z0J7SyYGXggQxjY4zDt/+DX+6ITa+LgfHjvku6ngDypeDyRyIjrQRr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2126.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(2906002)(82960400001)(38100700002)(110136005)(316002)(8936002)(66556008)(66476007)(4326008)(66946007)(8676002)(4744005)(186003)(478600001)(9686003)(26005)(6506007)(6486002)(5660300002)(41300700001)(53546011)(86362001)(6512007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zFIuXonsX/YmGJX0tT+td96NRxy1z6oYNq4WuZK4fOUTj9sV7hepcflxTCvs?=
 =?us-ascii?Q?0XJNka6rWuIdekan0/COmxJ4PmpH0uaHhI8QjwykQisjcBfLt4exrpgpsoCj?=
 =?us-ascii?Q?E03WFmFCyZkRv0aioUt3kkjG07IqsvmFfd+kPzBrMOzexwU/9ZjDip0ksIry?=
 =?us-ascii?Q?UOK2eFOuPCTYYRN26f/dCV/Cb666TNJX58MKdYpmUYFPHdkNf4xJrDd6FHSf?=
 =?us-ascii?Q?1DDV8RODf4+0edqKr0n4y5xB42p8gcONNvrUFz4Ac4Im00V97kITgos6Lkpf?=
 =?us-ascii?Q?86qcIPVN1HZ/iix6XgOB5CYe6Y3s3IJwvXl1vQwN582ml5iN1SnCQZ5bNtLG?=
 =?us-ascii?Q?gEMZJjja90EBS9ACYaa4NXe73ghtOtFYAkGnwIrjerLaqBB78IssreTS/lVt?=
 =?us-ascii?Q?qsW6CW4ACtJSAnrs3WfNqr7093TjVULjb2OeVzW8hE9Yrbjroxp17kQ7MlgU?=
 =?us-ascii?Q?V7ukzFf47z6VuhaBp/os1237z+UB40Wup0dIVk/K8B0ny/nc0kuxWknGQpJw?=
 =?us-ascii?Q?Ajl3kJ/xsdKHRio3lsS0bExTjbyfsrpx7XwmPB1Bk8h7mX497Bm4xN4tOoBs?=
 =?us-ascii?Q?ydgOw1u20JGH6GELV+H3Uuy7DHw3eA6kaUkijB5wsr7ZTvSOGDK9JHuDb2xm?=
 =?us-ascii?Q?3YweHaC8TH3Qxt2kWVUxx/gpt6qaah39AvXIlC93QQLXtMdqRshHIp25Cfh9?=
 =?us-ascii?Q?4GaSiBrwkfroQhgQHEfQURTRb1S1OvEmUkrLs6LjCL5bIhPVRLngSJPyiyDU?=
 =?us-ascii?Q?5EXIJECHPrTbV89ms0IYpX9StBlVhAk6t6gepWGNEjt14fSPTvHu1SYsto2e?=
 =?us-ascii?Q?+yOysk6k+eUyDZ66rJlLsm3JjOVukru4icsF51JrAmPdUn66JHHKGlgxOr5q?=
 =?us-ascii?Q?zjlNomLUXg8/7jzjdSdaC8+Ltv92GdX0g6wc8wkLA43v0QQo6I1W2Pvv9pGV?=
 =?us-ascii?Q?SXMvXRvNXRmWioCWpuuZsYGvT4DVSLHzMcNBnASpv42LkxjUfENo/Jya2Ezg?=
 =?us-ascii?Q?1hrsbdGi50Qi04AEnb2QMcAWJ2tFXjHrexXS/sDghqHYWhAsclNEJj8/KFxu?=
 =?us-ascii?Q?jlPupJ0XiZmnIpZ9P7M1ohqG/SIueqF1A13DigoQsFZmSSGoCcrWCX3Qw4au?=
 =?us-ascii?Q?r4V0bDpm01hZjtIa2Y1IKdJnnn9g37LmjTyIM/VnXEVanAIbfJqcLLjL6Z4l?=
 =?us-ascii?Q?VHQYqN9KMxLJRiLw5U6SNDoG9EBNYKY5bZwFjuyWa46uBnojyNTAerXOdrBP?=
 =?us-ascii?Q?zoQmmOCUg6KkoXtawCvHYjDzpil+GbLSzUI5j6vtMwRxKLhoOdF0hfbQ6Ug5?=
 =?us-ascii?Q?ZsT67BYUhVmWn4ILeP6I+y3HArE9c+8GFih2xA5zBIjzr9BuTFBklj6M/glC?=
 =?us-ascii?Q?gWKyEo5S+AGqbVhKZPLciFETh9peMb18x9pzL1Z9yYnWQOqEZPW+iuHs3oGj?=
 =?us-ascii?Q?iLs/K6cDLvZJxbNKTYdjgQS0WzAG9U8Hq2gHjqe3Vc1/w6hAz99inle/Uggq?=
 =?us-ascii?Q?9KWLtczM9X427YuiEd7fT/Jy8KbjhS7BUI9bHLYDKwyGE/hrWMxzAWPyMszT?=
 =?us-ascii?Q?Lb0q3EF2kdo1TgAQJ2gmnSTi/cA4XtTWAPZNljlbX2ZbBI+SjsPdpI9+Kry0?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16a1b2f-af74-4865-4ba5-08da7a1a4ad0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:17:37.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fptZ/88G+KKrWiRnEYX3XLHVk6eLHyNbZQnmCk7JtgW/7nCAmYykM3Y7UTtfspZtAY+PFzsHtOttFFN6RwwDO8bIJQuaB9Wpn4Q62kkJS9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=dan.j.williams@intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Bobo WL wrote:
> Hi Dan,
> 
> Thanks for your reply!
> 
> On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > What is the output of:
> >
> >     cxl list -MDTu -d decoder0.0
> >
> > ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> > at least not in the specified order, or that validation check is broken.
> 
> Command "cxl list -MDTu -d decoder0.0" output:

Thanks for this, I think I know the problem, but will try some
experiments with cxl_test first.

Did the commit_store() crash stop reproducing with latest cxl/preview
branch?

