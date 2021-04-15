Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE709360463
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:36:25 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWxU8-0006dP-L2
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxSl-0006A3-A6
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxSh-00026c-Vq
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618475694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xI86Zs8SI2SvPu8qU0+SoK5yPnjRaoOsYZVMRg00vCk=;
 b=LqCJup7XSAqNB5Y4YOBUkURiBaD4UGoSU1vkMFYY7+bNaHCfxY+OpKI5P85+t9mdgcBXK0
 MrcGCBsgHXEGL7lJ7I0OVhZdgUBrvtGijE6d78yF//xojRGtP8NBtbzuNogqX5T9w8hAFf
 +Fsp+SCL9mPfJkLA5zdQiGWcwtrwKyI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-o7c2hXY0M-KH34MvqyTHWA-1; Thu, 15 Apr 2021 04:34:52 -0400
X-MC-Unique: o7c2hXY0M-KH34MvqyTHWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y82-20020a1ce1550000b02901262158f1e9so3601936wmg.8
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 01:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xI86Zs8SI2SvPu8qU0+SoK5yPnjRaoOsYZVMRg00vCk=;
 b=rerMn8l0gFBNoolCmmXiSb+/hwvU7s3d5OLS4eBKxjBCRWDJfuwDsxMpAw9u5qhrqp
 WIG6FuLhN1Vy3xH3X2JGYs/fhMKDo/mwALmlPULefVX6/NLbhciO0k0+vGLhH+LJ2tPL
 AE7PV8/nY+OKE63Zmol1juTpQgmpM8oC0IgdSDfBPknF2QUtZD6RXV3V43soB6QcUr8E
 VYkoFoTCs6BoXkgdYJIMpnkpq5u86OccDwalAKPfFVfr9CigCLKH9HR3HJAyM9sB4jT4
 FMmJpwZ7eqz/wS/ys38+Dg9in/gliMD5CLPPjdhoIsR8t1E1VodIy4/wUwWh4GEw4yhz
 sZKA==
X-Gm-Message-State: AOAM5309laXQ7ZfNPeeRy0A/ylCln15Qbs4Y+AH1G4EGSkKHvR/4lDZi
 r+jd8QrflKis8O51P+nE1V9d0Xr35ThCH6BzTlhvxIBvVFwL9mR3q0JIoU4Re8bU4wv+5S72Kkq
 l/qS931e1audhqbk=
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr2006465wmq.166.1618475690663; 
 Thu, 15 Apr 2021 01:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTs4UsBCMr6tiFEqFjxlMF8nIMsLn3WK77TJbZkTlCKvND0lGKG3g/3M2GGnjxh8UFRzShZg==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr2006439wmq.166.1618475690476; 
 Thu, 15 Apr 2021 01:34:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c9sm1939907wrr.78.2021.04.15.01.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:34:49 -0700 (PDT)
Subject: Re: [PATCH for-6.1 4/4] configure: Poison all current target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <529f4022-aa17-2b41-294d-a293b0461690@redhat.com>
Date: Thu, 15 Apr 2021 10:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414112004.943383-5-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard/Claudio

On 4/14/21 1:20 PM, Thomas Huth wrote:
> We are generating a lot of target-specific defines in the *-config-devices.h
> and *-config-target.h files. Using them in common code is wrong and leads
> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
> as expected. To avoid these issues, we are already poisoning many of the
> macros in include/exec/poison.h - but it's cumbersome to maintain this
> list manually. Thus let's generate an additional list of poisoned macros
> automatically from the current config switches - this should give us a
> much better test coverage via the different CI configurations.
> 
> Note that CONFIG_TCG (which is also defined in config-host.h) and
> CONFIG_USER_ONLY are special, so we have to filter these out.

I know if we poison CONFIG_TCG, almost nothing build, but I fail to
see how it is different from the other accelerators. I suppose in the
future (maybe with Claudio's effort) we could have it not special.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile              | 2 +-
>  configure             | 5 +++++
>  include/exec/poison.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index bcbbec71a1..4cab10a2a4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,7 +213,7 @@ qemu-%.tar.bz2:
>  
>  distclean: clean
>  	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
> -	rm -f config-host.mak config-host.h*
> +	rm -f config-host.mak config-host.h* config-poison.h
>  	rm -f tests/tcg/config-*.mak
>  	rm -f config-all-disas.mak config.status
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
> diff --git a/configure b/configure
> index 4f374b4889..a0f0601e7e 100755
> --- a/configure
> +++ b/configure
> @@ -6440,6 +6440,11 @@ if test -n "${deprecated_features}"; then
>      echo "  features: ${deprecated_features}"
>  fi
>  

Maybe a one line comment (but since it is obvious, I don't mind):

   # Filter out CONFIG_TCG and CONFIG_USER_ONLY which are special

> +sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> +    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> +    *-config-devices.h *-config-target.h | \
> +    sort -u > config-poison.h
> +

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


