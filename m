Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F2322F8D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:23:37 +0100 (CET)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbPM-0001l1-Nk
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbNW-0000jm-AW
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbNU-0004cF-BA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100899;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HYxp5eOxeAm7scc2B6FHsXhWvWewoDw7fCMlGCypeZg=;
 b=gIikL8jbY1z4w+++1VdIyl6e8e4V9CIMwCWQWtGbY8GTJ//TQGnbgVlboJANuZ3YgEbdq7
 MWV4C5Wk4Wq3md6uDk9fZilTOYeqDApOEf8Rm0d8eCxo59yt1Wc2OHx/5jNiy8fGm0HkS+
 AtMJS6VeuRcQS9OaPfwiGWXuqEudldw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-kzuvxVZUM82w1KkBJgA-yg-1; Tue, 23 Feb 2021 12:21:04 -0500
X-MC-Unique: kzuvxVZUM82w1KkBJgA-yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DFDE80403A;
 Tue, 23 Feb 2021 17:21:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8377650A8B;
 Tue, 23 Feb 2021 17:20:58 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:20:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 4/4] utils: Deprecate inexact fractional suffix sizes
Message-ID: <YDU5d/Ug+Jes4jE0@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-5-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-5-eblake@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 02:44:38PM -0600, Eric Blake wrote:
> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
> happen to truncate it to 1126.  Our use of fractional sizes is
> intended for convenience, but when a user specifies a fraction that is
> not a clean translation to binary, truncating/rounding behind their
> backs can cause confusion.  Better is to deprecate inexact values,
> which still leaves '1.5k' as valid, but alerts the user to spell out
> their values as a precise byte number in cases where they are
> currently being rounded.
> 
> Note that values like '0.1G' in the testsuite need adjustment as a
> result.
> 
> Since qemu_strtosz() does not have an Err** parameter, and plumbing
> that in would be a much larger task, we instead go with just directly
> emitting the deprecation warning to stderr.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> I'm not a fan of this patch, but am proposing it for discussion purposes.

Likewise. I'm *not* in favour of this patch.

Allowing some fractions but not other fractions forces the potential
user to figure out what the exact fraction is up front, at which point
they've lost the benefit of using fractions. If users actually care
about byte exact values then they already have the option to specify
those exactly. If they've instead chosen to use fractions then they
have implicitly decided they're ok with the potentially in-exact
answer.

IMHO the only question is whethe we should truncate or round, and
I dont really have a preference - either is fine as long as we
are intentionally picking one and documenting it.

> ---
>  docs/system/deprecated.rst | 9 +++++++++
>  tests/test-cutils.c        | 6 +++---
>  tests/test-keyval.c        | 4 ++--
>  tests/test-qemu-opts.c     | 4 ++--
>  util/cutils.c              | 9 +++++++--
>  5 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 113c2e933f1b..2c9cb849eec5 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -154,6 +154,15 @@ Input parameters that take a size value should only use a size suffix
>  the value is hexadecimal.  That is, '0x20M' is deprecated, and should
>  be written either as '32M' or as '0x2000000'.
> 
> +inexact sizes via scaled fractions (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Input parameters that take a size value should only use a fractional
> +size (such as '1.5M') that will result in an exact byte value.  The
> +use of inexact values (such as '1.1M') that require truncation or
> +rounding is deprecated, and you should instead consider writing your
> +unusual size in bytes (here, '1153433' or '1153434' as desired).


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


