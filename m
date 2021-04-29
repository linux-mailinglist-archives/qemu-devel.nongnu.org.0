Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636636E466
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 07:09:05 +0200 (CEST)
Received: from localhost ([::1]:36694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbyvA-0005UB-1h
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 01:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbyty-00054m-UW
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbytv-0001CI-G7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619672865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8+Cl1U9064EUJwe+DF0mYAuUK9iN1tf/Qulo2ioEi4=;
 b=BWaz8+H94wItPS8R1Mtn1I3YqTsITEk+whXtOmsV1x4MGRFFgPb/3Rv7/ZyO+xC1T/ZSBw
 U6vXNkB74wA50CMB/Bv9GCLJE11io8EqbETnSw7HOZug70o2e1yCIsAF32L40JxLH0gDVT
 9exzaYqLlMAzXX/k35+6r2sStBgGadY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-Mz7tUVLUMEysJhUVJPSyTA-1; Thu, 29 Apr 2021 01:07:43 -0400
X-MC-Unique: Mz7tUVLUMEysJhUVJPSyTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so11947374wrc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 22:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h8+Cl1U9064EUJwe+DF0mYAuUK9iN1tf/Qulo2ioEi4=;
 b=FumkL4o+z8yTcIDiL5zGGmALKo03T6H7oazTc68VMU38RZPcORKUDpDU1K0t5r8qkb
 0l/sJRjwDUTA6rwRzW+xfMxNGKRkuZd5K6w5fQR0I39OU1kiN9yTENf7KDcolslSFECE
 W5c2A0NooubN9ba+0nOQjC3ybyj2EgyAL0zUsyrVTGroY74WfpKRi0Gr4Yx9RbA5Jh8G
 7KflU+/nj06drnG/jd1fguDUuFO/k4xP+FTRvvLGdWrzP8eQDsyE0LrJovq2qskkBwDh
 b55teEpaXnI5WFVlT33HK/1I/nhumE44cSDAyhUbbXYtaee+0oWpFmUKuBlKOz51rLEC
 AX6Q==
X-Gm-Message-State: AOAM5320tcEBOZ72qUoCZXCq4HO2j6DvJdk/ubsiFVqMja93otlxwGn+
 QPNpbqR/Ik36+yGsz/WHohLWwhLZjJV9HcRniCMYRzo8z0hp3aENjEcsS/wP63NCHwKXzw1LFW1
 87QPQw0Osj74XHPM=
X-Received: by 2002:adf:d227:: with SMTP id k7mr32634812wrh.390.1619672862049; 
 Wed, 28 Apr 2021 22:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlikyzvD8YrPpjIQYQAcqFAtsmXZs7lszxdUmWAjPqONPaThLJ+cIRm+gV4wFBMK6BmHREDw==
X-Received: by 2002:adf:d227:: with SMTP id k7mr32634791wrh.390.1619672861836; 
 Wed, 28 Apr 2021 22:07:41 -0700 (PDT)
Received: from [172.19.58.38] (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id 61sm3095174wrm.52.2021.04.28.22.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 22:07:41 -0700 (PDT)
Subject: Re: [PATCH] meson: change buildtype when debug_info=no
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210428195558.16960-1-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd5fc80e-c08a-95a5-57e9-28a123196eff@redhat.com>
Date: Thu, 29 Apr 2021 07:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428195558.16960-1-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:55 PM, Joelle van Dyne wrote:
> Meson defaults builds to 'debugoptimized' which adds '-g -O2'
> to CFLAGS. If the user specifies '--disable-debug-info' we
> should instead build with 'release' which does not emit any
> debug info.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 4f374b4889..5c3568cbc3 100755
> --- a/configure
> +++ b/configure
> @@ -6398,6 +6398,7 @@ NINJA=$ninja $meson setup \
>          --sysconfdir "$sysconfdir" \
>          --localedir "$localedir" \
>          --localstatedir "$local_statedir" \
> +        --buildtype $(if test "$debug_info" = yes; then echo "debugoptimized"; else echo "release"; fi) \

NAck. You are changing the default (which is 'debug') to 'release'.

This should be at least mentioned in the commit description, but
I don't think this is what we want here. 'release' enables -O3,
which is certainly not supported. The 'debug' profile is what we
have been and are testing.

I'd be OK if you had used "debugoptimized else debug".

The mainstream project would rather use 'debug'/'debugoptimized', or
'minsize', which are already tested. We might consider allowing forks
to use 'plain' profile eventually. But the 'release' type is an
unsupported landmine IMHO.

If you want to use something else, it should be an explicit argument
to ./configure, then you are on your own IMO.

Regards,

Phil.


