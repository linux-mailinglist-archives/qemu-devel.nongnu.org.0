Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0B32512F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:05:23 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHGc-0008UA-Gi
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFHFJ-0007dN-3c
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFHFG-0000gi-Th
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614261837;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFh2jt7R7VmXlnuZXBj/xBFFha/76OU6hGJX5iQC+FI=;
 b=dbxhk3FS1nzJsXecYxY6S24Hj0Dc+N4YwwIirunQ/9mVi3cjh0NguTyKlWFSqaEQYCl1Zw
 xHCX8kFIGewYjW2MPcEtmzBFH+dMJ/DXdi43QxTeWSEw5X5+j+h0Q7G0d8N3GCmqI73oaT
 n4TZ+JHINF/0Jb8NUFM0tKVxuxeTyLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-83cu0ePINeWa0waQ2MIXDw-1; Thu, 25 Feb 2021 09:03:41 -0500
X-MC-Unique: 83cu0ePINeWa0waQ2MIXDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA4B106BAA8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 14:03:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-195.ams2.redhat.com [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A6E65C224;
 Thu, 25 Feb 2021 14:03:39 +0000 (UTC)
Date: Thu, 25 Feb 2021 14:03:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] vl: deprecate -writeconfig
Message-ID: <YDeuOYpYZX+49AAd@redhat.com>
References: <20210225131316.631940-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225131316.631940-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 02:13:16PM +0100, Paolo Bonzini wrote:
> The functionality of -writeconfig is limited and the code
> does not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping)
> so remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         v1->v2: drop option from manual, mention that there is no replacement
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  qemu-options.hx            | 7 +------
>  softmmu/vl.c               | 1 +
>  3 files changed, 9 insertions(+), 6 deletions(-)

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..6d8393b6f7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_writeconfig:
>                  {
>                      FILE *fp;
> +                    warn_report("-writeconfig is deprecated.  It will go away in QEMU 6.2 with no replacement");

FWIW, we've rarely kept exactly to our 2 cycle plan. In practice it has
become more of a minimum bar, rather than an exact deadline.  If you want
to promise death in 6.2 though I'll defer to your judgement :=)


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


