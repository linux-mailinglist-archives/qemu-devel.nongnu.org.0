Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732392F78DC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:25:50 +0100 (CET)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OAn-0005SF-9d
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0O8L-0004AJ-OH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:23:17 -0500
Received: from 1.mo51.mail-out.ovh.net ([178.32.121.110]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0O8I-0002Z9-F9
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:23:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B962525AAE4;
 Fri, 15 Jan 2021 13:23:10 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 15 Jan
 2021 13:23:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028d4a4139-036b-4bd3-9e3d-f40919fd1b6c,
 DCCBFB19B1A3BA1C031047B2F93F7C58B25CC811) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 15 Jan 2021 13:23:08 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Message-ID: <20210115132308.371a0675@bahia.lan>
In-Reply-To: <20210114221748.503565-1-alxndr@bu.edu>
References: <20210114221748.503565-1-alxndr@bu.edu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d402ace4-1775-4512-a08c-13584d631363
X-Ovh-Tracer-Id: 9884838235623758188
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhvihhvihgvrhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=groug@kaod.org;
 helo=1.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 17:17:48 -0500
Alexander Bulekov <alxndr@bu.edu> wrote:

> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---

No changelog at all ? 

>  tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..ffdb590c58 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
>          .name = "virtio-mouse",
>          .args = "-machine q35 -nodefaults -device virtio-mouse",
>          .objects = "virtio*",
> +    },{
> +        .name = "virtio-9p",
> +        .args = "-machine q35 -nodefaults "
> +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> +        "-fsdev local,id=hshare,path=/tmp/,security_model=none",

Sharing a general purpose directory like "/tmp" is definitely not a
recommended practice. This is typically the kind of thing that I'd
like to see documented in the changelog to help me understand ;-)

What operations does the fuzz test perform on the device ?

> +        .objects = "virtio*",
> +    },{
> +        .name = "virtio-9p-synth",
> +        .args = "-machine q35 -nodefaults "
> +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> +        "-fsdev synth,id=hshare",
> +        .objects = "virtio*",

Not sure this is super useful since the only known use case for
the synth fsdev driver is running the virtio-9p qtest, but
it looks fine anyway.

>      },{
>          .name = "e1000",
>          .args = "-M q35 -nodefaults "


