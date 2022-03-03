Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980944CC928
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:37:19 +0100 (CET)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPu4U-0006Sh-Kf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:37:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPu3g-0005dG-U5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPu3f-00065H-Cl
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646346986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNYTSp3or36uTKBl27yUxyKvqxBGkEIG45KBP6xzUCQ=;
 b=Tl98z/agXdp1axbA8OdBpjugrWqeCYvFoKeV7v1idjeDRTbPSm2X7gXQbkVEQ1hfT4mCYK
 vUFGOtw3tvbw5iCgFnffHUz2+v+oSc3cTgQTa+7qGxMe3BTN9yyUEFHxx2t5UIFlfDctJs
 StJfEVioUuyTjUOPJupQLtyptTY1gMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-ziT4vc-LNBGsXn18u_tObg-1; Thu, 03 Mar 2022 17:36:25 -0500
X-MC-Unique: ziT4vc-LNBGsXn18u_tObg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E5A31854E21;
 Thu,  3 Mar 2022 22:36:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AC85E481;
 Thu,  3 Mar 2022 22:36:23 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:36:21 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 4/4] iotests/185: Add post-READY quit tests
Message-ID: <20220303223621.pv4zhtiu6rwderdn@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-5-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-5-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 05:48:14PM +0100, Hanna Reitz wrote:
> 185 tests quitting qemu while a block job is active.  It does not
> specifically test quitting qemu while a mirror or active commit job is
> in its READY phase.
> 
> Add two test cases for this, where we respectively mirror or commit to
> an external QSD instance, which provides a throttled block device.  qemu
> is supposed to cancel the job so that it can quit as soon as possible
> instead of waiting for the job to complete (which it did before 6.2).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/185     | 190 ++++++++++++++++++++++++++++++++++++-
>  tests/qemu-iotests/185.out |  48 ++++++++++
>  2 files changed, 237 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
> index f2ec5c5ceb..8b1143dc16 100755
> --- a/tests/qemu-iotests/185
> +++ b/tests/qemu-iotests/185
> @@ -33,6 +33,12 @@ _cleanup()
>      _rm_test_img "${TEST_IMG}.copy"
>      _cleanup_test_img
>      _cleanup_qemu
> +
> +    if [ -f "$TEST_DIR/qsd.pid" ]; then
> +        kill -SIGKILL "$(cat "$TEST_DIR/qsd.pid")"
> +        rm -f "$TEST_DIR/qsd.pid"
> +    fi
> +    rm -f "$SOCK_DIR/qsd.sock"
>  }
>  trap "_cleanup; exit \$status" 0 1 2 3 15
>  
> @@ -45,7 +51,7 @@ _supported_fmt qcow2
>  _supported_proto file
>  _supported_os Linux
>  
> -size=64M
> +size=$((64 * 1048576))

I tend to write $((64 * 1024 * 1024)) rather than remembering all the
digits of 2^20, but your way is fine.

Nice test addition!

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to queue this series through my NBD tree in time for
softfreeze, if no one else speaks for it first.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


