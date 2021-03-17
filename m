Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3F33F817
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:26:55 +0100 (CET)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMasg-00085Z-89
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMam1-0005Qw-Mh; Wed, 17 Mar 2021 14:20:01 -0400
Received: from wforward4-smtp.messagingengine.com ([64.147.123.34]:57097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMaly-0003Hh-7l; Wed, 17 Mar 2021 14:20:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.west.internal (Postfix) with ESMTP id 98D5B2142;
 Wed, 17 Mar 2021 14:19:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 14:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9WiiCj
 evm778K9eLauY2HpLAkLMYAvdfqKB1G7hi//8=; b=qchFrIk4BgJJP9E5zD/ILr
 ajEsBjF5IDqkFFdVEngp0uX7vG/MnKnc/5oj07Yftzffj65fblo4dfhXXQfujiBb
 n+KadBt35/NFPL9/y3I57YlgBIrEEdMDZzIKjoxzuXsiSvpcR4ytpN0lTfOeYF+X
 0RCWWw4AJfzCtPgadT+fR2e4PokYkkp8g/kxt5+PDj7s4fNBWg6ZBoWTVNT5pbDv
 P8gPKlgnS3LhKEgdSqkmrnPwFHS2YGqymL73/7iWz8ql8LBN05Wajfb8TztluVXL
 1Qu79fp4Ntt1TBif9jCYZn86UD5+q7RMqj+41oBjC1Sp5M99hr6MSzDXA+eFIgBQ
 ==
X-ME-Sender: <xms:SkhSYHTTCeG1qt_uCDnInusW-aolu1TPMCInHaiIsWg7oNSxtzO-tA>
 <xme:SkhSYJP2uj124MnfmSNX4XRO18S83bz8PDBZryAXlpsYSqWd17s_hAkos_EsD7SWR
 0hACDzwqnRkbODU_sI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeehleeffeduiedugedulefgteegteekleevueei
 teduleehjeekieelkeevueektdenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:SkhSYNgKrtROlJuvK859ndhJEABiQN8S4gyjYfC4C40a0CeVslf1SA>
 <xmx:SkhSYOmUxLLqCFUDeIJZvzZefG5Xd5LfqVf-qI0D_qRVTB5Z97Lmyg>
 <xmx:SkhSYBj27oOQNzbv2OHLc-TVBYWIwSFhtmsbLKBhd-UOXlZ6SuVlfw>
 <xmx:S0hSYBDjoBrXFxZaeHC0J64Sqrl8OGD6IYrKvLTftyUYnezZdY8tmBvisHE>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 191C724005B;
 Wed, 17 Mar 2021 14:19:54 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 7913fb52;
 Wed, 17 Mar 2021 18:19:52 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 5/6] test-coroutine: add rwlock upgrade test
In-Reply-To: <20210317180013.235231-6-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <20210317180013.235231-6-pbonzini@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 17 Mar 2021 18:19:52 +0000
Message-ID: <m21rcdej7b.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: softfail client-ip=64.147.123.34;
 envelope-from=david.edmondson@oracle.com;
 helo=wforward4-smtp.messagingengine.com
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

On Wednesday, 2021-03-17 at 19:00:12 +01, Paolo Bonzini wrote:

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
Don't you know you're never going to get to France.

