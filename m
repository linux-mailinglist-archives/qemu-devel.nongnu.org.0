Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D63BE1F6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:25:10 +0200 (CEST)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0z7V-00064O-8o
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0z6g-0005La-ER
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0z6Y-000389-Pv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625631849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULVgUGMhZfHOYZQGZwr+5e3N+dbg9Rm7P8/eyclctso=;
 b=RTaNgQz9YOLCZAZKDZccWN7YJSA4xzRdxPjYKStYEc9Fil8D7bZZx5XeGhxZ++hgmqSyGU
 gOp21DOtIpFRWSaykBw67AMX/I7XXxoULILYwidqUssGBn0sF2rUka0cEj99uT14VJvhjR
 BANQBh2CpSEjZLK3oQabVoV1SIdw1xk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-_X50MnClM-iujfkqf8j3DA-1; Wed, 07 Jul 2021 00:24:06 -0400
X-MC-Unique: _X50MnClM-iujfkqf8j3DA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f47b02901ff81a3bb59so187207wmq.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 21:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULVgUGMhZfHOYZQGZwr+5e3N+dbg9Rm7P8/eyclctso=;
 b=p+5OSNK9hJrmbr3D4WP4AHZJ3BW6gxejeY+gL7kKkBaslgYu4qu1HhBiTqIM/diS//
 tKWWDcib5ykuZ2ddVQqyq00alzk+JToPW9L0kTTjxfCxjyX2Rn2roNbpfvi2wli7fGK6
 +1FWGGQx3+hZbPLGTfSh/Yc/movyU2q9S1L/hA519c+nn7xxXJPMLk7z/cnPpBYg9yhr
 /ayyYAZrkWMLQfdmzTlFonw7yvl3qsua/L42Z4h0o0Pa1VGw2SPAD8cOQGRU84Y4A9fN
 AlaAQR6Y16IetN7OEXLvvVVXyoHHTNlLHAeViqGBzHYh+B2jN7VUb64E/AaOtDa9yeY2
 4D9Q==
X-Gm-Message-State: AOAM532I2h1Hs+oaYFv2Kn0d0zfxtGDWhGZit1CmIVH419rAL+vWKqT6
 9KAW/LVhXbgt/1dbWDZQ6hs+CPjiKuVR0247EWo9EbhEgv5vafOJIRDdOhsANvSZLFttojUi8Fc
 35k94SsQkR0Ldz/0=
X-Received: by 2002:a05:6000:50f:: with SMTP id
 a15mr19186892wrf.108.1625631845447; 
 Tue, 06 Jul 2021 21:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwKtw4nnDWXGcJiFwHG6DLFmiq+VWIGN88e6X4fbSVIAsylu/6p5TnnXoZ8J0AjG4bhY8FVQ==
X-Received: by 2002:a05:6000:50f:: with SMTP id
 a15mr19186868wrf.108.1625631845274; 
 Tue, 06 Jul 2021 21:24:05 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id p9sm18397503wrx.59.2021.07.06.21.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 21:24:04 -0700 (PDT)
Subject: Re: [PATCH v1 30/39] configure: stop user enabling plugins on Windows
 for now
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-31-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <13c5b368-1735-b622-51c2-936ef4561b25@redhat.com>
Date: Wed, 7 Jul 2021 06:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-31-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Yonggang Luo <luoyonggang@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 16.58, Alex Bennée wrote:
> There are some patches on the list that enable plugins on Windows but
> they still need some changes to be ready:
> 
>    https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/
> 
> In the meantime lets stop the user from being able to configure the
> support so they don't get confused by the weird linker error messages
> later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   configure | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/configure b/configure
> index 44a487e090..9d72b31a9f 100755
> --- a/configure
> +++ b/configure
> @@ -707,6 +707,11 @@ MINGW32*)
>     else
>       audio_drv_list=""
>     fi
> +  if "$plugins" = "yes"; then
> +      error_exit "TCG plugins not currently supported on Windows platforms"
> +  else
> +      plugins="no"
> +  fi
>     supported_os="yes"
>     pie="no"
>   ;;

This also looks like the wrong spot for testing - the "--enable-plugins" 
handling is around line 1510 in the configure script, but your check has 
been added in line 707 already. Again, this has to be checked after the 
options have been parsed.

  Thomas


