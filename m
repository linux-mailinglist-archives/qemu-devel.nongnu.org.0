Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751A303AB6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:49:58 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Lv3-0006vE-CW
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liam.merwick@oracle.com>)
 id 1l4Lsw-00063B-GS
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:47:47 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liam.merwick@oracle.com>)
 id 1l4Lst-0006Dp-JT
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:47:45 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QAiksL087809;
 Tue, 26 Jan 2021 10:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=CZksD+woiUFxuasOpc898fZGqaG2cWGYr37E3Ru6xBw=;
 b=CbbSsXx7aG5z1Cpbt5CU9JOiCgKZoYFig3r9O1JctOjMzSQ+c/Yb98G5WbsoxACC4EAJ
 umHgzVMjZ3vg9mMHXwyEg5uzfrZi9XSB5cD3h52psjJ7tKjSG/XxvVpZm6oJJE8dILY/
 OLrS1ekQJ8kikMoNKhx3MHY0RRpsnDKQg+J7VKwT4cHBMsSOLKBrvkHXBOfRygOu64nj
 8sCzdxNkilshK9dC64aRvTb7hQ68411g/pKX+0KOafxc8zitr8QMskUEl6JDLbzRdjiK
 73ujtIXoIEJkHe9/MK0w7M991/1cw6EuWVoDOqSPXmkmp82llyYAzmbQ6DnXsOeoqnQb rA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 368brkhf96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 10:47:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QAkUNQ105690;
 Tue, 26 Jan 2021 10:47:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
 by aserp3020.oracle.com with ESMTP id 368wpxs4cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 10:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzqMqlOxXuuPXTkk0DZ3KgqLGHSGaCiJXymLoXglspjZVLPd3TyD/ww++pRcTz9Oxu+2tSa660g0nEROXQaqtSlxRP/Q5fwSvshNh139pUkl33bzqmIrCnZhpxXskgbU3dfzpekMEFYs5VL0nKyRpaIu+He8iFD7mkrIeuuCb6AfmQW8S8+eUjHU22OdFbQNLsQOfpH44E3gbSQGPAz3qgBv5c16v/IA9c6tMiZ73me7DosrrXUuCE5DRa/KV/ul9feStdKzCFu6uHjqrG2SN5AB0bCr6ZC/II4dUngD9D+6Pz5GhRB2FPTBLgxBAMElb7TduFVyXF9eMltCEcr/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZksD+woiUFxuasOpc898fZGqaG2cWGYr37E3Ru6xBw=;
 b=KBFsu7VpnD8YyQOQpoRrsbN4dUnQ2Bp8Xd2rywkZ/CmsXrn4ZVFyQZ8Bfmt2dB5aX9czP4SW2gy3P7dcj0Ir5FynShWjNMyljofGgeicPsF2ELxunbUn+e1u4TqgadYbi9RA+P32xTWW/MuWOvvIbqPq+VWAGq/0Ne+LRJV4ffDHJApXaoQxXrMUuoL8iQ15+9n5ScO30BI09hbtMDJErE3QhVs5tsPJXeLLZ5sHLSu/7f8eLTQC45t1Sk9kdoPrydWLZoauDHlA2ofOfNU/TYRImd9PXqFD3K8eUDn5rgfNG8yiB5Yyez3IYIP+l72i1IyVVh1MuSHANPKVa5etuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZksD+woiUFxuasOpc898fZGqaG2cWGYr37E3Ru6xBw=;
 b=sXwWRdKz0sVR63uJ3krBuUbfl5tDtw7g1wJ6/3ejMpid4I887yxSGKwKT7aN3i0+SGQG+ZP4XDUmeHRCaD0ysmBv8Ic486nOyV45AOMm1fd6wZULAG9SOgZcRnVDExum4LryiokZ4z4hN7ySCStXTE10wJ7iEokQL97c8HocnRo=
Received: from BYAPR10MB2807.namprd10.prod.outlook.com (2603:10b6:a03:8e::10)
 by BYAPR10MB3702.namprd10.prod.outlook.com (2603:10b6:a03:11a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 26 Jan
 2021 10:47:22 +0000
Received: from BYAPR10MB2807.namprd10.prod.outlook.com
 ([fe80::9ced:5dd:48f8:9ac5]) by BYAPR10MB2807.namprd10.prod.outlook.com
 ([fe80::9ced:5dd:48f8:9ac5%4]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 10:47:22 +0000
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210126103502.260758-1-stefanha@redhat.com>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <a0e6ec06-14bb-29c4-7b6a-21b060a88de8@oracle.com>
Date: Tue, 26 Jan 2021 10:47:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126103502.260758-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [141.143.213.45]
X-ClientProxiedBy: LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::30) To BYAPR10MB2807.namprd10.prod.outlook.com
 (2603:10b6:a03:8e::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.175.184.246] (141.143.213.45) by
 LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 10:47:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f50acf9-3a51-41ac-0b03-08d8c1e7c218
X-MS-TrafficTypeDiagnostic: BYAPR10MB3702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3702AEEC8AC616421B83776DE8BC0@BYAPR10MB3702.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zz7YIMQgr7VHyOVj+ZVKDmT99F48FowXvlQ7xnc+zojNOCap0QJBbrDwAQqjE7gMp+RSWFsw7lRenaQ9LQ01TCSsu7806iUVBV4hlE64J9jFAPYEHty3Gsk8S2Ie6FN28S+fhyyqGspKkcqP4t7lx6rJ5iY2jpIYN9fxMy83pUEcdM4PeHw//G7LapaHToTwyUqmhMXvg4KCdm3xHrLQ68dLKk7S0FaX5jkXcsd2wseAeTaaCiEh4vjpkKUIc6RZmBGK5RydEchA8pzEI2jg9w+MKneUilePxaqZRaIGt7CYPsC4hBSKJzgFxx5gol8FQdbz8gbvafcLXVGNS7yyklL6t4jlp9nnUuh5CAhs0PMmUW3gYTxfQigiHr63baTrmOBotrjrjBVlGhEIukun71Wu0Qn3N2/CLWOWbSRhrt5UpSqc1CM6zD3e79+KobsoNbMz+6ZmpM7qMt5MvbLoQo0D7D3yvoQgt5u5dSZGDI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2807.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(478600001)(2616005)(83380400001)(8676002)(86362001)(52116002)(5660300002)(53546011)(316002)(44832011)(8936002)(6666004)(956004)(54906003)(16576012)(186003)(26005)(107886003)(36756003)(16526019)(31696002)(6486002)(2906002)(4326008)(66556008)(66946007)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmZRMkpGcDNyRmZOSXhTTXNRYndnTlh2S0tzZTI3a3QwWmY5ejlyY3ZiVVBF?=
 =?utf-8?B?U05oeFNnbVBVVFFCNm4vb1prb0VDbitMRk5YVmJENUR0ZWVsbW5mblI0RUhV?=
 =?utf-8?B?eVJ4YUdHV2drK3RmOGRQS2xGT0FOdFVJZWNEUUtvcjFBMnR0R1pzbU5GUzh1?=
 =?utf-8?B?QlNoSzZFcFhUSXJnbkV5ai92bmUyZmFmaWRySzkrekkvWGsxeVpLejRUdHZ5?=
 =?utf-8?B?N0dHN1lUTkJkOTVIL0srY2JUUnBvRm1qUFhJS3dXdVY4cUVqcFh0UnRBajJ4?=
 =?utf-8?B?YU52MEZVbE0vRVp3MmJYZHJieXNoQzNHUWk0cjN1dHZMRTNDbVpLN3ZpZTNX?=
 =?utf-8?B?bnhqRCtGOGQwOUROQUhlUlFYYURkK2xidEVxdFpLWlI1VFVSVzRNUTNFbDR0?=
 =?utf-8?B?ZVAyRC9WRVJYOXRZcUZnMXRhM1hTR3RsNXJIUmpSeXlDSVAzdUpaOXhJK2Vi?=
 =?utf-8?B?Z041U0J6dVYrZFBzaDErOWZWRjhuOExGdkN2NWIwL0tESDJMTit5ZU53UGRh?=
 =?utf-8?B?R2FuQnVEeUtvSDFLcVJyb3k3NUp4b3ZCRmd5cms2UjNIOE1MYzV4MDBTZUNL?=
 =?utf-8?B?ek5SbXBMREs3UkpibGRCTmMzODdoR0Y1SFhpTCtaV1dJL0ZZY0paRGdRU2NG?=
 =?utf-8?B?YkVsRmhkalFJZHBQVDYvelpTN3VNb0hJamZaMlI1R1NDT3pkRUpNWkZSY0k0?=
 =?utf-8?B?TWtrODBxeUloWTlId2M5ZnFnZ2FmdU5tK09la3lOMzlORkUzSUxTT1BPUitY?=
 =?utf-8?B?SFR3RTNEUERFaWVpL2k4WHdNeUQ2ZW5QaTZUak1YTmZ4MFZQYmdUMVZOMmdJ?=
 =?utf-8?B?R0cweWljL1BOa3ltOW5zVGVMZG00eDNuSkZWTzV3dk43WnJpWUkxNU1KYVFY?=
 =?utf-8?B?d2czbkswK0wwdXN6c1Bmb2JHL0lqa3hqRS9KTE91UXBIMGxPWEhTV2c2YVBx?=
 =?utf-8?B?RzhsclNHcUxwd3FySjBIQUNmcU5lWUcwUUNEd0FwcmFaSWk3RFNIVkZVY0tS?=
 =?utf-8?B?d3JERzBIeHNNNFpuZzZjRTJiczc3WTNCbkhDNlFSNVgzL3g3MTlpZ3Z4ZWJZ?=
 =?utf-8?B?bEZXMFVSVUgxL09ya0N1dk9RN3U0ckQ4WWcwNVR5aGRRdkRESjM1SlM4TXd0?=
 =?utf-8?B?bGRINXJPNWpuZTcxUklidWdrUVZnZURDZzBTMXA0YW5BNUJlMU45eEF1MzZS?=
 =?utf-8?B?QlYyZ3ZzZjNCQm9DdStHSEt1MjBSdzlZMXhDMTFtSnpHWVdPVmtvejhmbXNU?=
 =?utf-8?B?MXc5OHhadE1IWUxvZVZndnFjbldHemZTM2R2ZDR3QTdQNUlHT2xtQndjOS9a?=
 =?utf-8?B?RTE1NmtoV2V6clFRdEp5amYxQlFEU1Uwb0ZwSERWN3E2V0dZaklISVQyZHpN?=
 =?utf-8?B?VGFwTzEwR0tqSFRQR3VEbXNDeG5ZNWpKaEo3Vjh0azg0TzJabTl6OEFrYlhT?=
 =?utf-8?Q?qIugBK8r?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f50acf9-3a51-41ac-0b03-08d8c1e7c218
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2807.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:47:22.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+1yl5z6PPYrZZnZNsyy+mPS5Cj4uK+uacqvZUp4ojncIeZxlp+VQNAUXMoh/vr73EJ5i2Onc4jiCt6Xu6n/Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3702
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260056
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260056
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=liam.merwick@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Daniel Berrange <berrange@redhat.com>, P J P <ppandit@redhat.com>,
 virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 10:35, Stefan Hajnoczi wrote:
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
> 
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
> 
> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.
> 
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517


Should this also explicitly

Cc: qemu-stable@nongnu.org

Or would only a long-term fix target that?

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>   * Add doc comment clarifying that symlinks are traversed client-side
>     [Daniel]
> 
> This issue was diagnosed on public IRC and is therefore already known
> and not embargoed.
> 
> A stronger fix, and the long-term solution, is for users to mount the
> shared directory and any sub-mounts with nodev, as well as nosuid and
> noexec. Unfortunately virtiofsd cannot do this automatically because
> bind mounts added by the user after virtiofsd has launched would not be
> detected. I suggest the following:
> 
> 1. Modify libvirt and Kata Containers to explicitly set these mount
>     options.
> 2. Then modify virtiofsd to check that the shared directory has the
>     necessary options at startup. Refuse to start if the options are
>     missing so that the user is aware of the security requirements.
> 
> As a bonus this also increases the likelihood that other host processes
> besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> malicious guest cannot drop these files in place and then arrange for a
> host process to come across them.
> 
> Additionally, user namespaces have been discussed. They seem like a
> worthwhile addition as an unprivileged or privilege-separated mode
> although there are limitations with respect to security xattrs and the
> actual uid/gid stored on the host file system not corresponding to the
> guest uid/gid.
> ---
>   tools/virtiofsd/passthrough_ll.c | 85 +++++++++++++++++++++-----------
>   1 file changed, 57 insertions(+), 28 deletions(-)
> 


