Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF433F3F5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:24:40 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY2J-0006hc-MZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMXxn-0000zW-KO; Wed, 17 Mar 2021 11:19:59 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:53579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMXxm-0006s8-4b; Wed, 17 Mar 2021 11:19:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.nyi.internal (Postfix) with ESMTP id B09DB19410E5;
 Wed, 17 Mar 2021 11:19:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZGSzOI
 Y55d3KSPe/dERj6CLtK4nCi8vOYs6Fp3Q+5Fs=; b=hAY380beAIwBGq0L1fl6iq
 qyW0VeoMzTchd3+85e115AeOQ3apwSGh/9k74OBIZtZeujlEOrYkwQx/ATf/D9RG
 Hikhy7Lx/9B4IIXPFl2zF1n9XSLd5A1mowAZPlxlv5Fc94eSmEYqXOZG+zknp4rM
 lPUPjQH/T1gTipiYggHvHTpyflqXUduwj5PdgU2KpmeSSokwwhu0ft221XTQ3ygp
 HTpVGjlF3ikpFsrHXm4w5m+9BMoB9PT5rYosVJPoAn0vDbVjSUE0TAN9RhHtgJ7c
 d5ufdukANo9ooDLRlHIqgrBJpGqgbe4VOp0I+e42VMLXBZxX5uW1E6c5G4IPzgGg
 ==
X-ME-Sender: <xms:Gx5SYL5tTdz1zUDBLcswWmaIgJ2zhVd4bH8UHq7BO1-v-T42A7qutA>
 <xme:Gx5SYKWj-fl5MYswQrGG5xD_kNCO-aNM8cvSk_Szl3MEFhfUSh_oW6rWJD1EDe819
 FRWZ94XgQyIUIaBaHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgesthdtredttddttdenucfhrhhomhepffgrvhhiugcu
 gfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtg
 homheqnecuggftrfgrthhtvghrnhepheelfeefudeiudegudelgfetgeetkeelveeuieet
 udelheejkeeileekveeukedtnecukfhppeekuddrudekjedrvdeirddvfeeknecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdrvggu
 mhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:Gx5SYCA5A_kXCpAI5Giyegh__SLHCmzBbK-YpzWqniQyKdv-xlcc-w>
 <xmx:Gx5SYB4mHd1p_dKDkVWvnFopqKIU60y-nri00jAxf_dQok6PVqKI4g>
 <xmx:Gx5SYFwVfZgLL9qTkndhbOZOxZHTkjK5AUs81Y1XkxHaTz938dL9sA>
 <xmx:HB5SYJ20DgKyv7yd9WjLusizaWT5x7LwEWUWcizSaC64XjbuWnqTRg>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2814E1080064;
 Wed, 17 Mar 2021 11:19:55 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 83c6bcb1;
 Wed, 17 Mar 2021 15:19:53 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 5/6] test-coroutine: add rwlock upgrade test
In-Reply-To: <20210317121641.215714-6-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
 <20210317121641.215714-6-pbonzini@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 17 Mar 2021 15:19:53 +0000
Message-ID: <cun35wtvmcm.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: softfail client-ip=66.111.4.223;
 envelope-from=david.edmondson@oracle.com;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-17 at 13:16:40 +01, Paolo Bonzini wrote:

> Test that rwlock upgrade is fair, and readers go back to sleep if a writer
> is in line.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  tests/unit/test-coroutine.c | 62 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
> index e946d93a65..6e6f51d480 100644
> --- a/tests/unit/test-coroutine.c
> +++ b/tests/unit/test-coroutine.c
> @@ -264,6 +264,67 @@ static void test_co_mutex_lockable(void)
>      g_assert(QEMU_MAKE_LOCKABLE(null_pointer) == NULL);
>  }
>  
> +static CoRwlock rwlock;
> +
> +/* Test that readers are properly sent back to the queue when upgrading,
> + * even if they are the sole readers.  The test scenario is as follows:
> + *
> + *
> + * | c1           | c2         |
> + * |--------------+------------+
> + * | rdlock       |            |
> + * | yield        |            |
> + * |              | wrlock     |
> + * |              | <queued>   |
> + * | upgrade      |            |
> + * | <queued>     | <dequeued> |
> + * |              | unlock     |
> + * | <dequeued>   |            |
> + * | unlock       |            |
> + */
> +
> +static void coroutine_fn rwlock_yield_upgrade(void *opaque)
> +{
> +    qemu_co_rwlock_rdlock(&rwlock);
> +    qemu_coroutine_yield();
> +
> +    qemu_co_rwlock_upgrade(&rwlock);
> +    qemu_co_rwlock_unlock(&rwlock);
> +
> +    *(bool *)opaque = true;
> +}
> +
> +static void coroutine_fn rwlock_wrlock_yield(void *opaque)
> +{
> +    qemu_co_rwlock_wrlock(&rwlock);
> +    qemu_coroutine_yield();
> +
> +    qemu_co_rwlock_unlock(&rwlock);
> +    *(bool *)opaque = true;
> +}
> +
> +static void test_co_rwlock_upgrade(void)
> +{
> +    bool c1_done = false;
> +    bool c2_done = false;
> +    Coroutine *c1, *c2;
> +
> +    qemu_co_rwlock_init(&rwlock);
> +    c1 = qemu_coroutine_create(rwlock_yield_upgrade, &c1_done);
> +    c2 = qemu_coroutine_create(rwlock_wrlock_yield, &c2_done);
> +
> +    qemu_coroutine_enter(c1);
> +    qemu_coroutine_enter(c2);
> +
> +    /* c1 now should go to sleep.  */
> +    qemu_coroutine_enter(c1);
> +    g_assert(!c1_done);
> +
> +    qemu_coroutine_enter(c2);
> +    g_assert(c1_done);
> +    g_assert(c2_done);
> +}
> +
>  /*
>   * Check that creation, enter, and return work
>   */
> @@ -501,6 +562,7 @@ int main(int argc, char **argv)
>      g_test_add_func("/basic/order", test_order);
>      g_test_add_func("/locking/co-mutex", test_co_mutex);
>      g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
> +    g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
>      if (g_test_perf()) {
>          g_test_add_func("/perf/lifecycle", perf_lifecycle);
>          g_test_add_func("/perf/nesting", perf_nesting);
> -- 
> 2.29.2

dme.
-- 
Oh by the way, which one's Pink?

