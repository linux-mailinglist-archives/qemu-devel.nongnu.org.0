Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF4111BCD9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 20:26:37 +0100 (CET)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if7d5-0007tR-VP
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 14:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1if7c4-0007II-4q
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1if7c0-0001pa-KC
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:25:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57761
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1if7c0-0001nd-EE
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576092327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=TfFnsMVrK8GyPgcdVFQ+ARUgGWK0e9VUtRAsmQExV6s=;
 b=hpdR9yAJwo3h8Sefpgmv99GMvU0j+PF3PhkaPQCrsA/I7BH/r1JgcB9BQiL/r4trn+nQ6Q
 1rrc38piQSGnAbFfCbWS8NmiJy8Sb0ArE2BFoJ653O0uqAmvoNpxiPf5Zm2w9k2h0zMFS3
 a/2URyIKYBThokfMGZisx9oqdwsnLIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-EYheh1kJP7aEmiIrO1w0lA-1; Wed, 11 Dec 2019 14:25:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311A3800D41
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 19:25:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-85.ams2.redhat.com [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C47E726193
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 19:25:24 +0000 (UTC)
Subject: Re: [PATCH] tests: use g_test_rand_int
To: qemu-devel@nongnu.org
References: <1576074210-52834-6-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c61a0b0f-d4c0-6418-c7cd-568cd6d27c5b@redhat.com>
Date: Wed, 11 Dec 2019 20:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-6-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: EYheh1kJP7aEmiIrO1w0lA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2019 15.23, Paolo Bonzini wrote:
> g_test_rand_int provides a reproducible random integer number, using a
> different number seed every time but allowing reproduction using the
> --seed command line option.  It is thus better suited to tests than
> g_random_int or random.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/vhdx.c         | 2 +-
>  block/vmdk.c         | 4 ++--
>  tests/ivshmem-test.c | 2 +-
>  tests/test-bitmap.c  | 8 ++++----
>  tests/test-qga.c     | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/block/vhdx.c b/block/vhdx.c
> index f02d261..36465d5 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -1504,7 +1504,7 @@ static int vhdx_create_new_headers(BlockBackend *blk, uint64_t image_size,
>      hdr = g_new0(VHDXHeader, 1);
>  
>      hdr->signature       = VHDX_HEADER_SIGNATURE;
> -    hdr->sequence_number = g_random_int();
> +    hdr->sequence_number = g_test_rand_int();
>      hdr->log_version     = 0;
>      hdr->version         = 1;
>      hdr->log_length      = log_size;
> diff --git a/block/vmdk.c b/block/vmdk.c
> index 20e909d..eba96bf 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -2037,7 +2037,7 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
>          /* update CID on the first write every time the virtual disk is
>           * opened */
>          if (!s->cid_updated) {
> -            ret = vmdk_write_cid(bs, g_random_int());
> +            ret = vmdk_write_cid(bs, g_test_rand_int());
>              if (ret < 0) {
>                  return ret;
>              }
> @@ -2499,7 +2499,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
>  
>      /* generate descriptor file */
>      desc = g_strdup_printf(desc_template,
> -                           g_random_int(),
> +                           g_test_rand_int(),
>                             parent_cid,
>                             BlockdevVmdkSubformat_str(subformat),
>                             parent_desc_line,

Why do you also change this in block/ and not only in tests/ ?

 Thomas


