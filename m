Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8C30FC91
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:24:28 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kEs-0001iD-Tt
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7jhX-0001eI-RZ; Thu, 04 Feb 2021 13:49:59 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7jhV-0001ty-3D; Thu, 04 Feb 2021 13:49:59 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114InduA156661;
 Thu, 4 Feb 2021 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=C40Ei6OYJ9eobCi8zLAHJ5EF9aoVFRWBoxBkb8aIWvU=;
 b=aiVxQt4VtEnA63Zpq2lDGCoZkGsqxNqOwhZR6R4UW+8rUlb9N1Op+JD/JZo8yPOgKyBE
 B4ako+jnBuRMYJIz+QpeJO/Mg1gwkEgwyDHD0aEWPb63KbpeAf1X5i+0qmgPEi8JekFk
 sg+E3u6H6kQYz5+NxwaEzRlorD7LrfZUx4m71HVlcxTfMqaa5Cbvqil6Uyrv1PdgFhS+
 2a1YVQyvpxes0/9UflVgKBm8P7XNe3MRjTIzSnYz56UgnMGer1t1k1NKDKE9LQ74dFr/
 Yt6uMfS5rmYW5al0YTIwpvN0KSbdh4a75OvVJ7mDtrqlC9xCWWhDQmCGpwLqyNXMSjCX tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36cvyb6u36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 18:49:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114Incri187651;
 Thu, 4 Feb 2021 18:49:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3030.oracle.com with ESMTP id 36dh1suqyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 18:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq9mpwDAHHMzRFqyW/rREQpbKC+tNubCiIKCzZEh50PZ6QFlY2UfSGJtsqzjD2W1MY7eoC58dYdX7n0XTcrT8HZDsbaeaRWHgA29ZflVSXsarLLmwGHK4Nvhb9i8FlwawCSDa1Qc2IaXN74r+wavedI4iMBq4h3WNCuybrmtfEaF0VQaDcNlahpHheLMFoJDih5MzaFrgV2jI/gQNiLvvrgy/pwtRj3WktQ15U8KmDHdAMhPN/0WGW4v48fKO7OOAzndZqRDq2x1q9K4ljhjPmX3ogDpm2ZxL51lnm4keJRud3BktzXXE+NIW8FKPN/St5krqHCobIuvl5n1wcZ4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C40Ei6OYJ9eobCi8zLAHJ5EF9aoVFRWBoxBkb8aIWvU=;
 b=loutInBMnes4wcJyNOr9XeC2Jp/v8Be8sKwsZDuD0MJqTlwtd2nbaA5p9PnmP8MPOzo5kBVrJl7xo9APwCBl1A4bDrbIpys2gtegLFkEM1A48zVLOicSabjZsU8HrGPVb59l6nx+6tL8xf6oc16tAMTuBZZDbaqVNwbAZ1L/EvxR5Rmxg/aIeXswNtKXlXHIVkqIb65t1bn4TZaSlDvxMeiVwSeCMwOWUb233+KBHDXY9OnAl2C7A8my79ty5fZkWXsmJiL+/6IwGsGAAWZvazP57bSMcAoYBofK5aGyifi86cP5eGXZDRsbSGaEGJPnzD9avMXC5Sl+fuQwL+MFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C40Ei6OYJ9eobCi8zLAHJ5EF9aoVFRWBoxBkb8aIWvU=;
 b=JROBNL/MgBQErSpk91vJyjcOdPXgzbt7fv8FsR+E6rJe/sQ8HUtDZBjmlfsg/EmH4R4skOKL68wmg+e2YF/bXEr4LdU/1S3qweCu+QHlPJs4ocvE6VVVWLqMGwdfxZTvFbczDodylxBdTgrY3gz+u5ceoenAlrLzkb/BJNQyiWM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB3912.namprd10.prod.outlook.com (2603:10b6:610:a::30)
 by CH2PR10MB4248.namprd10.prod.outlook.com (2603:10b6:610:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 18:49:33 +0000
Received: from CH2PR10MB3912.namprd10.prod.outlook.com
 ([fe80::551e:116:b791:2ef0]) by CH2PR10MB3912.namprd10.prod.outlook.com
 ([fe80::551e:116:b791:2ef0%7]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 18:49:33 +0000
Date: Thu, 4 Feb 2021 10:49:26 -0800
From: elena <elena.ufimtseva@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/27] Block patches
Message-ID: <20210204184926.GA116253@heatpipe>
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
X-Originating-IP: [47.216.143.105]
X-ClientProxiedBy: BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40)
 To CH2PR10MB3912.namprd10.prod.outlook.com
 (2603:10b6:610:a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from heatpipe (47.216.143.105) by
 BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 18:49:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62af179c-94e9-4efb-4276-08d8c93d9c87
X-MS-TrafficTypeDiagnostic: CH2PR10MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR10MB4248B25048E50A6833104CC28CB39@CH2PR10MB4248.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7fZ8k3Hz79PXyCWsAgmItcnb2EIhQffYOXEMH9JlTowTBiYEJggJz30I+uuMg9WUFhhjT+TkQ9KorFN7HWgtxFi3P8bht4FpRVYXauNiF/l5xatEOu1uqyFrNQT6Y7tBmGnB5pmNgua2PNLKKAwQI+no3s7drYiDfyEWn9GzBsW7wOOcfzkpWr/xQJtvl0iSeszsjs/4wCeJSbPn5/IMGIIkLC6MyPdRiNwnZzIYzjKxAnkIJDZfDVyGCTGhCLvFZ1KgmdNScme6EID3klbgPxSNqd1OHZHqRZvI6uO9tKWhg+ZgruY2YcmnvFwcHDLDNFAr9wxSjiafkO8BLXbK6tN1TLhS0ZsRJJao1lj2IEIdNOkIac5gMatz4A1OZvxpa8zi66bJKQHk636H+8MlK75hBI2JY7IXh3mseY+5XYh4OcyZJM3jREmbfix5txkMVOfLc66upSlpe8/czUBJQpXQwmtR9EYcbcEYrhq8wziujroWwv919OSGlyRL+NmK5BwveYV4HtAQizVbr09ZNEjZLFn5prPzcr4KopdN3eMtNd+rK5/JOcxlurzvXVRdbCIkeiVhx9NtCvIeZF65OQjWZPemfxV6TJ5eb2jdr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB3912.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(346002)(39860400002)(376002)(2906002)(5660300002)(8676002)(6496006)(54906003)(966005)(8936002)(9576002)(52116002)(16526019)(26005)(478600001)(316002)(1076003)(6916009)(956004)(83380400001)(6666004)(86362001)(66476007)(66556008)(33656002)(4326008)(55016002)(186003)(9686003)(33716001)(7416002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LB6WK4ecZcOcV9hcKGf0T3QcMTWGOK8MXZWusJbaw9qUk4QKOtKGygq6u1jb?=
 =?us-ascii?Q?+2b6Fi2x/Eq4Iqxyy+MgMXSblXss8xfXVUKuqYrHfpRAgemzj0DlakNVpOum?=
 =?us-ascii?Q?92xiCC7KwGtAx3LtsH3ZsSnB5Esy3V/arVcfwGDfs6uPbJayQ5Cx49O7sLDc?=
 =?us-ascii?Q?SoXIaZB6TjXOKFUR/gRXBgxDVdbpF5lzbhCj1W2Wc1qcRFem7iwDoDcY3NpY?=
 =?us-ascii?Q?xy1bWFVdbl6Ah4wX26aIZ0uBMGp4ohNZayU5iu+5n+FrBVdZjIpbxyPP1nGQ?=
 =?us-ascii?Q?M1hRZ61SVxzUpSQapNlSBA5u0ezMjEO59j+gGKkQZkPo/3Gd3umERseCSsXq?=
 =?us-ascii?Q?bfImCjSnOSkB0T/aYzrXZECx/tQaFKSp8tA0fMBDV38sByKtjjMROYX74cUP?=
 =?us-ascii?Q?8KXIP53xf1+dLQqov0EifQVRztAnU7nFB7hpUdMvsgLMiplPPJQbF/OnfE/g?=
 =?us-ascii?Q?Xz7BqhqD70fdYRNef5ZoHNGJbYDfCVuocFgFOpZ7PA+FpvMMijAIsqeyYvKq?=
 =?us-ascii?Q?y03EyYgI6yrDgg64OHqVDZ5ElvJbDBrrKxTgBpp+1yYPE/8A9rv0CW/rhVI4?=
 =?us-ascii?Q?+S9UbA//YwTVpaqPX9xfPfOODxUBCnW1s/PfMdTH5LjJ3eI5UBPeMHKztJW6?=
 =?us-ascii?Q?1Q8s6cNNg8FGDqzo0buACtwFviF54reKpsc4Tsq/5zgi2VM5BwJy612ukVWs?=
 =?us-ascii?Q?tHHpGxVHSz65zuI37VngSoNXPmREU6/T+m6uMh4JdVEEVlx0EcZMEMr744Za?=
 =?us-ascii?Q?h25WreyXvuGtZf1mJSBh596dNkN0vO//dGyNQpZxL+oYTb8s3P8FUQygtJpX?=
 =?us-ascii?Q?clfLUUcnTSFjMywAtgEEtzcjN8Nin2qQePRjUpfBQa7m8re4KSKbC6tgs7UU?=
 =?us-ascii?Q?mVId3oMiFuNH0Pw7V1/Eteiq7xPERSamYT+JhuExSYd3rhVcokIWoEYV1kAv?=
 =?us-ascii?Q?VUuztCvCQiwTxrXWGJJGzPwJBMsJv/2Ow0d+3S8IooBiPW8vhMAFVq+a9zUU?=
 =?us-ascii?Q?TRaEx06qdk8SYAEY0YE/RWJltPkVyd5+8pG3zokPJJP4pHJTZo3xsvcM2vsD?=
 =?us-ascii?Q?D2W5RS10L/yq76sJszEZqlI+MSieCiCN5JqFZeokLtoHsqcn3JsGkKMVYvcZ?=
 =?us-ascii?Q?7wKV2llzgWac4d7jXRW9uTndROINbYk0WRMt0IRHHAfI+o8YMTiFxr6Cwx03?=
 =?us-ascii?Q?cjetPXW/Ds1FTvPUYnUI65DA1CZK1SNxGZ4CExkmcfoH05xVyPyDKMgYeJwK?=
 =?us-ascii?Q?yLd+bY6k7zfpcXfVRG828vzFYWoigWMMUIwFb5o/idfJVRMTvizEYmCmLgan?=
 =?us-ascii?Q?RcbOFvQZAS4zmBxqsbjkp8Kg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62af179c-94e9-4efb-4276-08d8c93d9c87
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB3912.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 18:49:33.7648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KWYbd6wRRDDs603HdgUMabQg3iK+v9HB80ta6RxM0jRHHVcUhCb9jQE7oKy0vsQ9YQCQebFgE+V1nTFJmBPBIQFZlRx/QEoJXWJRFFZDO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4248
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040113
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040113
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 05:35:31PM +0000, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 15:43, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399:
> >
> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' into staging (2021-02-03 19:35:57 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to abe42229db7b87caa11b3c02835ebf9d384e0bd4:
> >
> >   docs: fix Parallels Image "dirty bitmap" section (2021-02-04 15:17:10 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > v2:
> >  * Rebase to resolve memory_region_init_ram_from_file() conflict due to the new
> >    offset argument that was added in qemu.git/master in the meantime [Peter]
> >
> > ----------------------------------------------------------------
> 
> Fails to compile, clang:
> 
> ../../hw/remote/mpqemu-link.c:40:29: error: suggest braces around
> initialization of subobject [-Werror,-Wmissing-braces]
>     struct iovec send[2] = {0};
>                             ^
>                             {}

Stefan, should we make changes for the patch?
Please let us know.

Thanks,

Elena
> 
> 
> Don't use {0}, use {} -- the former may be the C standard thing,
> but the latter is the one all our supported compilers accept
> without complaint. (cf eg commit 039d4e3df0).
> 
> thanks
> -- PMM

