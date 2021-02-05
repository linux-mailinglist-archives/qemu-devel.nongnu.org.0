Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB8310A04
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:15:15 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z50-0000nO-Hz
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7z35-0008FO-Rp
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7z34-0008KX-39
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612523592;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PuSyrdISyVFtCbTWbIt8fGaBjUA7BAeuGoObOVoetMM=;
 b=hxvDE7JqL7bFdADP8FwZmeZfEf0BEZyQKuJw6RfEYfxC4F6ZafsHwlAHkyvEnHLaLtMtvK
 flXL3Qpt6/U6z2T9A8yQezBeFGIoYuxV3+JGUtmqsCJhvkdsLlGBKsg0KkJvkpUtYP6ZCE
 wFzK250Jhp1PA2b20mWVrwKXVmiERZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-PNT5wWagOKC5qvMDJYi_yA-1; Fri, 05 Feb 2021 06:13:11 -0500
X-MC-Unique: PNT5wWagOKC5qvMDJYi_yA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF094192CC41;
 Fri,  5 Feb 2021 11:13:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C78E65D9CD;
 Fri,  5 Feb 2021 11:13:04 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:13:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
Message-ID: <20210205111302.GF908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-3-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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

On Thu, Feb 04, 2021 at 01:07:07PM -0600, Eric Blake wrote:
> Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
> that is ambiguous between a hex digit and the extremely large exibyte
> suffix, as well as a 'B' suffix for bytes.  In practice, people using
> hex inputs are specifying values in bytes (and would have written
> 0x2000000, or possibly relied on default_suffix in the case of
> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
> sense for inputs in decimal (where the user would write 32M).  But
> rather than outright dropping support for hex-with-suffix, let's
> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
> have an Err** parameter, we pollute to stderr.

Err** is only appropriate for errors, not warnings, so this statement
can be removed.

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/system/deprecated.rst | 8 ++++++++
>  util/cutils.c              | 6 +++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 6ac757ed9fa7..c404c3926e6f 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,14 @@ library enabled as a cryptography provider.
>  Neither the ``nettle`` library, or the built-in cryptography provider are
>  supported on FIPS enabled hosts.
> 
> +hexadecimal sizes with scaling multipliers (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Input parameters that take a size value should only use a size suffix
> +(such as 'k' or 'M') when the base is written in decimal, and not when
> +the value is hexadecimal.  That is, '0x20M' is deprecated, and should
> +be written either as '32M' or as '0x2000000'.
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index 0234763bd70b..75190565cbb5 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -264,7 +264,7 @@ static int do_strtosz(const char *nptr, const char **end,
>      int retval;
>      const char *endptr;
>      unsigned char c;
> -    bool mul_required = false;
> +    bool mul_required = false, hex = false;
>      uint64_t val;
>      int64_t mul;
>      double fraction = 0.0;
> @@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const char **end,
>      c = *endptr;
>      mul = suffix_mul(c, unit);
>      if (mul > 0) {
> +        if (hex) {
> +            fprintf(stderr, "Using a multiplier suffix on hex numbers "
> +                    "is deprecated: %s\n", nptr);

warn_report(), since IIUC, that'll get into HMP response correctly.

> +        }
>          endptr++;
>      } else {
>          mul = suffix_mul(default_suffix, unit);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


