Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B52FA4E7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:38:53 +0100 (CET)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WcG-00055B-Sr
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1Wav-0004bS-Lz
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:37:29 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:42464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1Was-0003HE-Tu
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:37:28 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IFUsoI156862;
 Mon, 18 Jan 2021 15:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=4LIIaqIpgEjieaK1iEH1YvASgmi78KnXI54cAjVkjWI=;
 b=ANsJcVsnnl7dbAp28NnXe4901oTC251KHgd0Xa3oAX7oRZ/Toc4i8TrfIGqFpRmDUU4X
 gY8yc2OjfJLSwWz8UYXmU49ji8Cz+A972U5XSeEG7CGQUu4B6zLghL334YZsgNv6cD9g
 kGHfYHp/0auFB6xs0dylXhb2OQGUX5iyCeFZCgHq5769mLE37hfsGeysD8ekuaIHpNNz
 Xwx6derX1dzqOhFw6Sxnoero8CaW2Z1O6PcRUu26t+VWIrpl7WpQ0+0wvzFTnKwo40L8
 HoRlqWqNolfG7uRvWZAQ926wdcyJuHpQ7CDJyuNC/SZ6ks2KLsHXRVXoFCmmXeTDXsbh 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 363nnadwku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:36:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IFW0Wm142929;
 Mon, 18 Jan 2021 15:36:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3649wq6hp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:36:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10IFaULQ006744;
 Mon, 18 Jan 2021 15:36:30 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 18 Jan 2021 07:36:30 -0800
Received: from starbug-mbp (localhost [127.0.0.1])
 by starbug-mbp.localdomain (Postfix) with ESMTP id 5B0502E6B685;
 Mon, 18 Jan 2021 15:36:34 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
In-Reply-To: <20210117230924.449676-4-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-4-alxndr@bu.edu>
Date: Mon, 18 Jan 2021 15:36:34 +0000
Message-ID: <m25z3ufe9p.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=900 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=896 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180094
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sunday, 2021-01-17 at 18:09:24 -05, Alexander Bulekov wrote:
> virtio-9p devices are often used to expose a virtual-filesystem to the
> guest. There have been some bugs reported in this device, such as
> CVE-2018-19364, and CVE-2021-20181. We should fuzz this device
>
> This patch adds two virtio-9p configurations:
>  * One with the widely used -fsdev local driver. This driver leaks some
>    state in the form of files/directories created in the shared dir.
>  * One with the synth driver. While it is not used in the real world, this
>    driver won't leak leak state between fuzz inputs.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
> CC: Greg Kurz <groug@kaod.org>
>
> I considered adding an atexit handler to remove the temp directory,
> however I am worried that there might be some error that results in a
> call to exit(), rather than abort(), which will cause problems for
> future fork()-ed fuzzers. I don't think there are such calls in the 9p
> code, however there might be something in the APIs used by 9p. As this
> code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't be
> too much of an issue.

As I understand it, this creation of a new directory should happen a lot
less than the amount of actual executions of the target, since it is
only run on the first 'parent' target process executed, prior to the
process cloning operations that the fork execution performs - or any
time that 'parent' target process is renewed, after several thousand
cloned processes.

Is that correct? Or am I misunderstanding when the
generic_fuzzer_virtio_9p_args() function is run?

Thanks,

Darren.

>  tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 1a133655ee..f99657cdbc 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
>      gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
>  } generic_fuzz_config;
>  
> +static inline gchar *generic_fuzzer_virtio_9p_args(void){
> +    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
> +    g_assert_nonnull(mkdtemp(tmpdir));
> +
> +    return g_strdup_printf("-machine q35 -nodefaults "
> +    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> +    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
> +    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
> +}
> +
>  const generic_fuzz_config predefined_configs[] = {
>      {
>          .name = "virtio-net-pci-slirp",
> @@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
>          .name = "virtio-mouse",
>          .args = "-machine q35 -nodefaults -device virtio-mouse",
>          .objects = "virtio*",
> +    },{
> +        .name = "virtio-9p",
> +        .argfunc = generic_fuzzer_virtio_9p_args,
> +        .objects = "virtio*",
> +    },{
> +        .name = "virtio-9p-synth",
> +        .args = "-machine q35 -nodefaults "
> +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> +        "-fsdev synth,id=hshare",
> +        .objects = "virtio*",
>      },{
>          .name = "e1000",
>          .args = "-M q35 -nodefaults "
> -- 
> 2.28.0

