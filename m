Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C977D28BB52
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:49:46 +0200 (CEST)
Received: from localhost ([::1]:40244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRz8z-0007IS-Ri
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kRz4s-0003fl-Ag
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 10:45:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kRz4p-0000SR-69
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 10:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602513926;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+1NAlPgWXzj2JvnsX24+0Qw2Y5YxBL63NYgr7cEj5C0=;
 b=GYPiPPLtQvDKxhLh0D45ZK0NtYintpZY37/2e/cXxuVThPBvMCFLDg1dWgmaMxMBh//7qD
 HCbn+RdgcMjAE6CvTX6RwLApsrUMe2Xf76AOoOf2+wNv1IJXbrCDvRxTfuUncDM9H96iF7
 AuHRPwAT7XeckWD1HkW4mR5FMStCkFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-BjMT57D3MdGKUhkmAl7x8w-1; Mon, 12 Oct 2020 10:45:18 -0400
X-MC-Unique: BjMT57D3MdGKUhkmAl7x8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3936A18BE166;
 Mon, 12 Oct 2020 14:45:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4FA277B7;
 Mon, 12 Oct 2020 14:45:15 +0000 (UTC)
Date: Mon, 12 Oct 2020 15:45:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] qom: Fix "typddef" typo
Message-ID: <20201012144512.GI39408@redhat.com>
References: <20201007220255.1170167-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201007220255.1170167-1-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 07, 2020 at 06:02:55PM -0400, Eduardo Habkost wrote:
> Fix typo introduced in the C11 #ifdef for qemu_max_align_t.  It
> never caused any problems because we always compile using
> -std=gnu99.
> 
> Fixes: 4c880f363e9e ("qom: Allow objects to be allocated with increased alignment")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  qom/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index c335dce7e4..125dabd28b 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -692,7 +692,7 @@ static void object_finalize(void *data)
>  
>  /* Find the minimum alignment guaranteed by the system malloc. */
>  #if __STDC_VERSION__ >= 201112L
> -typddef max_align_t qemu_max_align_t;
> +typedef max_align_t qemu_max_align_t;
>  #else

Why do we need / have this first part of the #if at all ?  We
unconditionally add  -std=gnu99, so surely this has always
been dead code and can just be better deleted.

>  typedef union {
>      long l;
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


