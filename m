Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE73109FA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:13:05 +0100 (CET)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z2t-0007N5-Sj
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7z0p-0006HJ-N7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7z0h-00075H-Oe
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612523445;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a7pp9G1ExoCGMov6AtrKjsKCRxMqRJOclfLXXlZT2f8=;
 b=LOGNERKzBM+GGBnDRq5yzW0jtlcHiUX/55/6SUXmrWHad6If37e8t6kt+Ct3QdqAiLHVdH
 woqqyeRRRyofi0ttXMqGI+0GwDM+w6iZIJBMHt0iWWe9s+QBzwzb2OhaTUK7L34cxPEirk
 BiK22RfEHL8LSck5jAYoGYWcTvF01UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-oQw4gjpXMKCTqUTLKei9AQ-1; Fri, 05 Feb 2021 06:10:42 -0500
X-MC-Unique: oQw4gjpXMKCTqUTLKei9AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8C7801965;
 Fri,  5 Feb 2021 11:10:40 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F186E5D9CD;
 Fri,  5 Feb 2021 11:10:38 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:10:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/3] utils: Deprecate inexact fractional suffix sizes
Message-ID: <20210205111036.GE908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-4-eblake@redhat.com>
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 tao3.xu@intel.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 01:07:08PM -0600, Eric Blake wrote:
> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
> happen to truncate it to 1126.  Our use of fractional sizes is
> intended for convenience, but when a user specifies a fraction that is
> not a clean translation to binary, truncating/rounding behind their
> backs can cause confusion.  Better is to deprecate inexact values,
> which still leaves '1.5k' as valid, but alerts the user to spell out
> their values as a precise byte number in cases where they are
> currently being rounded.

I don't think we should be deprecating this, as I think it makes
it very user hostile.  Users who require exact answers, won't be
using fractional syntax in the first place. IOW, by using fractional
syntax you've decided that approximation is acceptable. Given that,
I should not have to worry about whether or not the fraction I'm
using is exact or truncated. It is horrible usability to say that
"1.1k" is invalid, while "1.5k" is valid - both are valid from my
POV as a user of this.



> Note that values like '0.1G' in the testsuite need adjustment as a
> result.
> 
> Sadly, since qemu_strtosz() does not have an Err** parameter, we
> pollute to stderr.

This is only an warning, so setting an Err ** would not be appropriate
right now.

None the less we should add an Err **, because many of the callers
want an Err ** object populated, or use error_report().

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/test-cutils.c    | 4 ++--
>  tests/test-keyval.c    | 4 ++--
>  tests/test-qemu-opts.c | 4 ++--
>  util/cutils.c          | 4 ++++
>  4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/test-cutils.c b/tests/test-cutils.c
> index 0c2c89d6f113..ad51fb1baa51 100644
> --- a/tests/test-cutils.c
> +++ b/tests/test-cutils.c
> @@ -2095,14 +2095,14 @@ static void test_qemu_strtosz_units(void)
> 
>  static void test_qemu_strtosz_float(void)
>  {
> -    const char *str = "12.345M";
> +    const char *str = "12.125M";
>      int err;
>      const char *endptr;
>      uint64_t res = 0xbaadf00d;
> 
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 12.345 * MiB);
> +    g_assert_cmpint(res, ==, 12.125 * MiB);
>      g_assert(endptr == str + 7);
>  }
> 
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index 13be763650b2..c951ac54cd23 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -522,7 +522,7 @@ static void test_keyval_visit_size(void)
>      visit_free(v);
> 
>      /* Suffixes */
> -    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.1G,sz5=16777215T",
> +    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.125G,sz5=16777215T",
>                           NULL, NULL, &error_abort);
>      v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>      qobject_unref(qdict);
> @@ -534,7 +534,7 @@ static void test_keyval_visit_size(void)
>      visit_type_size(v, "sz3", &sz, &error_abort);
>      g_assert_cmphex(sz, ==, 2 * MiB);
>      visit_type_size(v, "sz4", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, GiB / 10);
> +    g_assert_cmphex(sz, ==, GiB / 8);
>      visit_type_size(v, "sz5", &sz, &error_abort);
>      g_assert_cmphex(sz, ==, 16777215ULL * TiB);
>      visit_check_struct(v, &error_abort);
> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
> index f79b698e6715..6a1ea1d01c4f 100644
> --- a/tests/test-qemu-opts.c
> +++ b/tests/test-qemu-opts.c
> @@ -717,10 +717,10 @@ static void test_opts_parse_size(void)
>      g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, 8);
>      g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 1536);
>      g_assert_cmphex(qemu_opt_get_size(opts, "size3", 0), ==, 2 * MiB);
> -    opts = qemu_opts_parse(&opts_list_02, "size1=0.1G,size2=16777215T",
> +    opts = qemu_opts_parse(&opts_list_02, "size1=0.125G,size2=16777215T",
>                             false, &error_abort);
>      g_assert_cmpuint(opts_count(opts), ==, 2);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 10);
> +    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 8);
>      g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215ULL * TiB);
> 
>      /* Beyond limit with suffix */
> diff --git a/util/cutils.c b/util/cutils.c
> index 75190565cbb5..5ec6101ae778 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -327,6 +327,10 @@ static int do_strtosz(const char *nptr, const char **end,
>          retval = -ERANGE;
>          goto out;
>      }
> +    if (mul_required && fraction * mul != (uint64_t) (fraction * mul)) {
> +        fprintf(stderr, "Using a fractional size that is not an exact byte "
> +                "multiple is deprecated: %s\n", nptr);
> +    }
>      *result = val * mul + (uint64_t) (fraction * mul);
>      retval = 0;
> 
> -- 
> 2.30.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


