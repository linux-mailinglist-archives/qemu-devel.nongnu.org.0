Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE72F84D5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:55:08 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UFX-0008J7-7q
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l0UDt-0007Sg-QP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:53:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l0UDr-0000CT-ET
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610736801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hs0cWmPcgq2YuBckC2xYrXzEBlVUbH4Jl3cgOCnHb9k=;
 b=IgdzDk/S3JkgWEAmnHPU6HUJ+QqfCwFYOzjirb1n8eCK2xQu5fcYnf7n7gkbtwykRrjKNC
 tojBj7h0nLGAF+EeDO+wVDbmdeJMlb+Jad2B15XfHHCoFuieIqI8nd8E8JSdeufTeyq8l8
 Dz/pCtRsINWkzZF7DbvEBjSBgxn4y5c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Lm-dJhBSPymFI_pNhuvGtQ-1; Fri, 15 Jan 2021 13:53:18 -0500
X-MC-Unique: Lm-dJhBSPymFI_pNhuvGtQ-1
Received: by mail-ed1-f71.google.com with SMTP id g6so4270505edw.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hs0cWmPcgq2YuBckC2xYrXzEBlVUbH4Jl3cgOCnHb9k=;
 b=P8A6PoqoMBG79nySu8g9THs3D6Zrv9ZRDYPX858L6Uq9RUUHRtgC+cEIY6Cdw0Dkn2
 tMwdj1Bfn9VOi+M98RdMj+mAuPstu0kTEW4Lf5r6bjkd0r/oJPpJYosvOPILJX+7saah
 n7v12SFUgQPlWGPiOrjT8fvQRgvndtLx0CNdxw72DExYI65dvcR87S7f3OH4yaC2m2Q6
 MVW8ACAKtPnjSGcg/xcWzp59whTpEmfJwZQaD0c91mFi+jDnHoJE/uTjPVfrjyiv1p/2
 x6WoyQte22wtaN61y4uedXvtVBGbxopmlyWmRVN82LVXWViN78oIqPyNrz8fhcuBFPJ7
 A04g==
X-Gm-Message-State: AOAM5319wGLjK6KOI4H5GwsLKTCeXjQaZbYp4Cw3n0JAhnrzju9C9Q66
 8YiphhWUW/xjJ/6ba9WgrtmQKp9shqJ1J9kgovaDNj4Y/n3r+u8H2g5i5YUNw+AKAXxomNWdE17
 EXv/ZBEN39fJovKo=
X-Received: by 2002:a50:e80c:: with SMTP id e12mr10395006edn.288.1610736797651; 
 Fri, 15 Jan 2021 10:53:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw02Tn2rKlqPH1aPRV9Gu7hQnp/jhC9q9sW8PZw+TSqGOUezis+TqF8pUWEHF3l4HKRAAd2JQ==
X-Received: by 2002:a50:e80c:: with SMTP id e12mr10394995edn.288.1610736797464; 
 Fri, 15 Jan 2021 10:53:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cb14sm4220305ejb.105.2021.01.15.10.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 10:53:16 -0800 (PST)
Subject: Re: [RFC PATCH] meson: Only install ROMs when building system
 emulation binaries
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115175135.3402714-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7acbc6ab-c97d-ada4-8ce2-481b6000b5b6@redhat.com>
Date: Fri, 15 Jan 2021 19:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210115175135.3402714-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/21 18:51, Philippe Mathieu-Daudé wrote:
> It is pointless to install ROM blobs for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC because I think it would be better to make the 'blobs'
> option a 'feature' instead of a boolean so we can set it
> as 'auto' and then in that case we could do something

Yes it's better to do that and have

install_blobs = get_option('install_blobs').enabled() or
   (get_option('install_blobs').auto() and have_system)

And then if get_option('install_blobs').auto() you could install blobs 
only if the corresponding target is included in target_dirs:

if get_option('install_blobs').enabled() or 'i386-softmmu' in 
target_dirs or 'x86_64-softmmu' in target_dirs
   ...
endif

Paolo

>    blobs = have_system
> 
> because currently ./configure still displays:
> 
>                      Install blobs: YES
> 
> which is confusing.
> ---
>   meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 954152c90fe..273b8e6baa9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2254,7 +2254,9 @@
>   
>   subdir('scripts')
>   subdir('tools')
> -subdir('pc-bios')
> +if have_system
> +  subdir('pc-bios')
> +endif
>   subdir('docs')
>   subdir('tests')
>   if gtk.found()
> 


