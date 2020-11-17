Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7E2B5E9E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:50:31 +0100 (CET)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezVG-00032A-8E
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kezS3-0000nh-6b
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kezS1-0000Aq-DP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xfvh3Z61yBuDJRcMCJrs05ZLtItmdtLmqhR7d8PoCPc=;
 b=ivYqnZg1gLxFIgZXFzpNw+oWSboUVV3GNQqODngW4yBFk56dfPl67nFgqDSBG9lu1chzXl
 Wo2TFIJJ0Szcshy3tCnT+6HHz/3il8wFn+poUzeHf9l5u5r5AC+NMCVHeLxBCPf4zD13uD
 VUmM3qnF1fmm73k3hVcsemezykMwvKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-X3_-BOoxOuWFUSwG7ku88Q-1; Tue, 17 Nov 2020 06:47:04 -0500
X-MC-Unique: X3_-BOoxOuWFUSwG7ku88Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 935B557090;
 Tue, 17 Nov 2020 11:47:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AE85C1CF;
 Tue, 17 Nov 2020 11:47:02 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:46:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] curl: remove compatibility code
Message-ID: <20201117114659.GB135624@redhat.com>
References: <20201117113850.64108-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117113850.64108-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 12:38:50PM +0100, Paolo Bonzini wrote:
> cURL 7.16.0 was released in October 2006.  Just remove code that is
> in all likelihood not being used anywhere.

Rather than assuming that, we should be picking our minimum version
and enforcing that in configure/meson.

Currently, we have a manual code compile check for curl_multi_setopt,
after doing a pkg-config check with no min version.

We should set a min version in pkg-config and drop the compile check
in configure.

Based on repology.org and our platform support matrix, RHEL-7 looks
like the oldest curl that we need to care about, 7.29.0

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/curl.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index 4f907c47be..b77bfe12e7 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -37,26 +37,6 @@
>  
>  // #define DEBUG_VERBOSE
>  
> -#if LIBCURL_VERSION_NUM >= 0x071000
> -/* The multi interface timer callback was introduced in 7.16.0 */
> -#define NEED_CURL_TIMER_CALLBACK
> -#define HAVE_SOCKET_ACTION
> -#endif
> -
> -#ifndef HAVE_SOCKET_ACTION
> -/* If curl_multi_socket_action isn't available, define it statically here in
> - * terms of curl_multi_socket. Note that ev_bitmask will be ignored, which is
> - * less efficient but still safe. */
> -static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,
> -                                            curl_socket_t sockfd,
> -                                            int ev_bitmask,
> -                                            int *running_handles)
> -{
> -    return curl_multi_socket(multi_handle, sockfd, running_handles);
> -}
> -#define curl_multi_socket_action __curl_multi_socket_action
> -#endif
> -
>  #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
>                     CURLPROTO_FTP | CURLPROTO_FTPS)
>  
> @@ -140,7 +120,6 @@ typedef struct BDRVCURLState {
>  static void curl_clean_state(CURLState *s);
>  static void curl_multi_do(void *arg);
>  
> -#ifdef NEED_CURL_TIMER_CALLBACK
>  /* Called from curl_multi_do_locked, with s->mutex held.  */
>  static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>  {
> @@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>      }
>      return 0;
>  }
> -#endif
>  
>  /* Called from curl_multi_do_locked, with s->mutex held.  */
>  static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
> @@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)
>  
>  static void curl_multi_timeout_do(void *arg)
>  {
> -#ifdef NEED_CURL_TIMER_CALLBACK
>      BDRVCURLState *s = (BDRVCURLState *)arg;
>      int running;
>  
> @@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)
>  
>      curl_multi_check_completion(s);
>      qemu_mutex_unlock(&s->mutex);
> -#else
> -    abort();
> -#endif
>  }
>  
>  /* Called with s->mutex held.  */
> @@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState *bs,
>      s->multi = curl_multi_init();
>      s->aio_context = new_context;
>      curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
> -#ifdef NEED_CURL_TIMER_CALLBACK
>      curl_multi_setopt(s->multi, CURLMOPT_TIMERDATA, s);
>      curl_multi_setopt(s->multi, CURLMOPT_TIMERFUNCTION, curl_timer_cb);
> -#endif
>  }
>  
>  static QemuOptsList runtime_opts = {
> -- 
> 2.28.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


