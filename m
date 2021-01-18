Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20C2FA011
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:41:01 +0100 (CET)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tq8-0006Yd-GV
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1Tka-0002Nx-VY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1TkM-0003f2-KI
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=OfMXaioHYWngjNIBi8eXl3N7DH/iwcVsdI4WLDaqFQ8=; b=vXuOYiRlsWWRE7jd5YhheyuLMK
 4u510SAfGzprySW8Wr6OExh4fXEaYnSTSm2c1jJ71ZkSMDt/38wK3WlPLaYaHcRlLzaUbsm8FfeRx
 uBEReHDBvGNPFd6o1xcKqQjPCHaREs8MbSCzf+lRSNqWsz0lsJmdsd0sgiRUvWCZbVuL33P24T+DM
 ool5LDSFGv4SuxPxNNPJG1nRYgj0st3Hp+biCwSTP7ajZSQqWxGjc9spqbjOcYdQWX8M5hK4wZmI3
 kjVNvuqigAy97r2fRkggLbH6tTXAU8NS69npm053+SFTVzeZLtshO4oLLfBXHlAhdiA28qFTXmHUm
 T5bW2nN/VCtPVfVAwidmEDVd2r/7RNd8J5CRz6+cBFFrKp9Pt+ZdpJNbexXHtOk1WOTm8o4EkawSS
 VCQY3g5YrTaFOvkS09k9fziAVg8ykpaWSNejOQ48bqKuJASd1GYxYS+Tzzt0orzXYNOZLJHJ5t/T4
 j+iHL0adcHGKgTt/F488D4yIR+tJsTv8hnwDlC/2O25wwZnEPm8TLXJSfDiPJ0UMvNLEyJu64yNh9
 YNr1MNwdl+/LX7YRd7GVwhegL4beoTEWGfSE3wB7mok2XaTOKJs60rYP+MKofA0f82IoK3hUnS3xx
 KPBvIo1K+Dv54HzJdq5mBxGcI96nQpLVFXihrbpVs=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
Date: Mon, 18 Jan 2021 13:34:32 +0100
Message-ID: <23015364.U02QJlgKXI@silver>
In-Reply-To: <20210117230924.449676-4-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Greg Kurz <groug@kaod.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Montag, 18. Januar 2021 00:09:24 CET Alexander Bulekov wrote:
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

Yes, dealing with signal handlers for that is probably a bit intransparent and 
would leave a questionable feeling about its reliability.

What about __attribute__((destructor)) to auto delete the fuzzer directory, 
like virtio-9p-test.c does for the same task?

>  tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
> b/tests/qtest/fuzz/generic_fuzz_configs.h index 1a133655ee..f99657cdbc
> 100644
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




