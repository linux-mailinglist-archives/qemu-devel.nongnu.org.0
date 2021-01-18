Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F102FA45E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:18:36 +0100 (CET)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WId-0004Pt-EA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1WHL-0003yH-GY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:17:15 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1WHJ-00024l-Ab
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:17:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IF9Qa9178784;
 Mon, 18 Jan 2021 15:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=cWyOsHx7NTs2IIN8wthje0rOsrQl4f73Ve3+pnDe0u4=;
 b=XWsz3WaMP565dHJk+FQKg3pRVcRx+k/JEQl5kO5+yCvTZw0y5D9zjq9icj7cY1I3aLW9
 ijmOikIGTfUkdIOflvRVqFNC5rn4SVccTqz3idGxXMvFvUedFcMze98WMMW+Tuj1EPOH
 tM5x2kdaHu4RfvtoGsdmKOieiLNFsCPX96uBhrp6XIo8je5Zu9QhYgX0FooIGDde6kSk
 LVLx6a2C0LX3VCBJNDZ5kQvCRerUmHH/TGrRQg2+SQMw+13FmTPSwwzBcRInjC8dX7GV
 ppwNRVdl6jdepBSfopbjENU8vG1dAkDwbFo3EUo1QHuIOnxb0b+QtO6le8OLBczhJfQd Kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 363xyhn1ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:17:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IFAtFU077858;
 Mon, 18 Jan 2021 15:17:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3649wq5shf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:17:04 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10IFH3Zt008529;
 Mon, 18 Jan 2021 15:17:03 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 18 Jan 2021 07:17:02 -0800
Received: from starbug-mbp (localhost [127.0.0.1])
 by starbug-mbp.localdomain (Postfix) with ESMTP id C109E2E6AED2;
 Mon, 18 Jan 2021 15:17:07 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] docs/fuzz: add some information about OSS-Fuzz
In-Reply-To: <20210117230924.449676-3-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-3-alxndr@bu.edu>
Date: Mon, 18 Jan 2021 15:17:07 +0000
Message-ID: <m28s8qff64.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180093
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=darren.kenny@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sunday, 2021-01-17 at 18:09:23 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  docs/devel/fuzzing.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 6096242d99..8792358854 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -181,6 +181,32 @@ To ensure that these env variables have been configured correctly, we can use::
>  
>  The output should contain a complete list of matched MemoryRegions.
>  
> +OSS-Fuzz
> +--------
> +QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
> +By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
> +generic-fuzz target requires additional information provided in environment
> +variables, we pre-define some generic-fuzz configs in
> +``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
> + * ``.name``: To identify the fuzzer config
> + * ``.args`` OR ``.argfunc``: A string or pointer to a function returning a
> +   string.  These strings are used to specify the ``QEMU_FUZZ_ARGS``
> +   environment variable.  ``argfunc`` is useful when the config relies on e.g.
> +   a dynamically created temp directory, or a free tcp/udp port.
> + * ``.objects``: A string that specifies the ``QEMU_FUZZ_OBJECTS`` environment
> +   variable.
> +
> +To fuzz additional devices/device configuration on OSS-Fuzz:
> + * Send patches for a new device-specific fuzzer
> + * Send patches for a new generic-fuzz config
> +
> +Build details:
> + * `The basic Dockerfile that sets up the environment for building QEMU's
> +   fuzzers on OSS-Fuzz
> +   <https://github.com/google/oss-fuzz/blob/master/projects/qemu/Dockerfile>`_
> + * The script responsible for building the fuzzers:
> +   ``scripts/oss-fuzz/build.sh``
> +
>  Implementation Details / Fuzzer Lifecycle
>  -----------------------------------------
>  
> -- 
> 2.28.0

