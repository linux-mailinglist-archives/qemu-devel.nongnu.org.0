Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E913A617945
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:00:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqW3w-0004gi-Py; Thu, 03 Nov 2022 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqW3u-0004fs-P2
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqW3s-0006fQ-SN
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667465935;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wxSKoxafMKvWF0ywBsQCAbUM4AgroH712lc68iJqXfA=;
 b=Y+0e8Dg6D3ywRjvwlbdzSM/V0j/G6uLZi6Cg0kWdCZ1+G5amWArRkitVyOo8sxbn+4ziXa
 tE97kxniyf2fiwCcngYGz6PKjuOl3yQpBf68OfjRWakvmciwtBwLGGfoBHDT+wcjkq9W/r
 hhfSEHlorKqvTnjyzQ5cijGXmY4yAbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-OfkXP7iMO1Sukff95TFNXw-1; Thu, 03 Nov 2022 04:58:52 -0400
X-MC-Unique: OfkXP7iMO1Sukff95TFNXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B574E85A5A6;
 Thu,  3 Nov 2022 08:58:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E55BF1415117;
 Thu,  3 Nov 2022 08:58:50 +0000 (UTC)
Date: Thu, 3 Nov 2022 08:58:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
Message-ID: <Y2OCyLSw2hurfemT@redhat.com>
References: <20221102202258.456359-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221102202258.456359-1-sw@weilnetz.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 02, 2022 at 09:22:58PM +0100, Stefan Weil via wrote:
> The configure script fails because it tries to compile small C programs
> with a main function which is declared with arguments argc and argv
> although those arguments are unused.
> 
> Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
> configure for a native build does abort but shows the error in config.log.
> A cross build configure for Windows with Debian stable aborts with an
> error.
> 
> Avoiding unused arguments fixes this.

I'm not convinced that we should allow -extra-cflags to influence
the configure compile checks at all, as there are likely more cases
where arbitrary -W$warn flag will impact the checks, potentially
causing configure to silently take the wrong action.

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> See https://gitlab.com/qemu-project/qemu/-/issues/1295.
> 
> I noticed the problem because I often compile with -Wextra.
> 
> Stefan
> 
>  configure | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 4275f5419f..1106c04fea 100755
> --- a/configure
> +++ b/configure
> @@ -1258,6 +1258,7 @@ if test "$stack_protector" != "no"; then
>    cat > $TMPC << EOF
>  int main(int argc, char *argv[])
>  {
> +    (void)argc;
>      char arr[64], *p = arr, *c = argv[0];
>      while (*c) {
>          *p++ = *c++;
> @@ -1607,7 +1608,7 @@ fi
>  
>  if test "$safe_stack" = "yes"; then
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if ! __has_feature(safe_stack)
>  #error SafeStack Disabled
> @@ -1629,7 +1630,7 @@ EOF
>    fi
>  else
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if defined(__has_feature)
>  #if __has_feature(safe_stack)
> @@ -1675,7 +1676,7 @@ static const int Z = 1;
>  #define TAUT(X) ((X) == Z)
>  #define PAREN(X, Y) (X == Y)
>  #define ID(X) (X)
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>      int x = 0, y = 0;
>      x = ID(x);
> -- 
> 2.30.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


