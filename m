Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5F6C1353
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:28:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFYE-0008Pg-FC; Mon, 20 Mar 2023 09:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFYB-0008P5-Fj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFY9-0005SX-PO
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679318864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUuoNBjJV/ld/UVXKUmX8SOw8Y7/iFVKETGcaL08X2w=;
 b=LDiY83oC8Az/FPRc2GW+HlOdXavbyqIS4tl95IMatcwtnZyMV80vkS/Uk6qSAbb8Z6Pm7x
 3LCPcDlHA1yqUpesKTDT5stpO1J9WSCK5dAsfDv/QTbqXS9sCj0y7MichbsHrfaL6S3csS
 fs9+CCLyR+lKumhUu01PnWV2JUi28JY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-AbVrfpqFNBqoDki89H0x_A-1; Mon, 20 Mar 2023 09:27:39 -0400
X-MC-Unique: AbVrfpqFNBqoDki89H0x_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C142B185A791;
 Mon, 20 Mar 2023 13:27:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1F0140E991;
 Mon, 20 Mar 2023 13:27:37 +0000 (UTC)
Date: Mon, 20 Mar 2023 13:27:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sebastian Wilhelmi <wilhelmi@google.com>,
 Eric Blake <eblake@redhat.com>, Sebastian Wilhelmi <seppi@seppi.de>,
 Simon =?utf-8?Q?W=C3=B6rner?= <contact@simon-woerner.de>
Subject: Re: [PATCH-for-8.0] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Message-ID: <ZBhfRmJc0M93s1F5@redhat.com>
References: <20230320131426.16348-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320131426.16348-1-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 02:14:26PM +0100, Philippe Mathieu-Daudé wrote:
> By default, C function prototypes declared in headers are visible,
> so there is no need to declare them as 'extern' functions. Remove
> this redundancy. This also fixes when building under MSYS2:
> 
>   C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standard attributes in middle of decl-specifiers
>   1075 | # define G_NORETURN [[noreturn]]
>         |                     ^
>   C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in expansion of macro 'G_NORETURN'
>   240 | extern G_NORETURN
>         |        ^~~~~~~~~~
> 
> Reported-by: Simon Wörner <contact@simon-woerner.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541

There's already a fix for that issue included in a PULL request from
Thomas:

https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05225.html

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/qemu/osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f68b5d8708..79c26c748a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -237,7 +237,7 @@ extern "C" {
>   * supports QEMU_ERROR, this will be reported at compile time; otherwise
>   * this will be reported at link time due to the missing symbol.
>   */
> -extern G_NORETURN
> +G_NORETURN
>  void QEMU_ERROR("code path is reachable")
>      qemu_build_not_reached_always(void);
>  #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


