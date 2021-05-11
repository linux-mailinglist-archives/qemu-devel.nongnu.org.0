Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C937A8ED
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:18:57 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTDs-0003sb-H6
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTB8-0002K1-93
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTB6-0005Ap-0o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVLZby8ThcFt5OjLjmZjc/UJ71xkrOP3rvuR9mZiSpw=;
 b=Rp21wNRk36E96E7/l0EYXHq7kEsTDmJaCavGik3suNl5CwmPiawz8ap8i6VU7mgaXPlGIW
 zt5JjbkTuCDXz30YmZHtx/Vv1k4mB4XVudQ7LLDPPOnww/KGeYCMIFyIKzawWJ6VPBLY9Q
 bDDSuGyr4Q6XWKXTBTWvIw2wO/Zi44Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-t113XPvxNZKsUZrgNeLtcQ-1; Tue, 11 May 2021 10:16:00 -0400
X-MC-Unique: t113XPvxNZKsUZrgNeLtcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so1114773wmg.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVLZby8ThcFt5OjLjmZjc/UJ71xkrOP3rvuR9mZiSpw=;
 b=N6ehgvnyidExx2ZtLs/APG368rpISf27K8NXqh0ULXb3VodK00/kyG9TxgKDNZO6E7
 aFvx1HzoF7GlxKAvJHJazibB6k8st5vKDPvOp6KDqZM9bw7A5teoxmDU7EMYUaZl4PPX
 Oz4wkKddpEegFHKdNhYgehiOd2+nEYTc0Ffm6gEgc5317sLXVpYUpD2IX+9TnA8Kzg1U
 X2mQC+TY2WZ7mBMIIx/vYEeM8cxDme8bQBXKvCgzWVeoOijJLKS++jPIvBeddI/opa5z
 9FAhLNzIxAdAxAaUp1zA1yVl4Hp/VjkukdfxWnnrSTPQsftcV7C0MO0t5YxaqK0eEdeF
 /QXA==
X-Gm-Message-State: AOAM531g4y7SNLCFKIhNC3dfJD3y3f2GUcI8h26uRTGUQJrn+LcD4Hsa
 YskCgMhuoKj9ls6DeVAa6VOEMIyFlfx/U8mocnw2tKQFf9B4JzwKpowpZDLxGVI7DmMC91UTU6J
 awhTbg9tWD1e6jkU=
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr31973365wmb.66.1620742558960; 
 Tue, 11 May 2021 07:15:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEWRg4AvkEyceToIFx1qM5Y2CILBwouwQ5xOmerRz6edva7coHNN+SD96094yNjwPDjEb+dg==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr31973337wmb.66.1620742558729; 
 Tue, 11 May 2021 07:15:58 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id f6sm29662752wru.72.2021.05.11.07.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:15:58 -0700 (PDT)
Subject: Re: [PATCH 11/12] configure: bump min required GCC to 6.3.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-12-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b84c71fd-e00f-3de1-c061-dadd44e55dab@redhat.com>
Date: Tue, 11 May 2021 16:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required GCC version.
> 
> Per repology, currently shipping versions are:
> 
>               RHEL-8: 8.3.1
>       Debian Stretch: 6.3.0
>        Debian Buster: 8.3.0
>   openSUSE Leap 15.2: 7.5.0
>     Ubuntu LTS 18.04: 7.5.0
>     Ubuntu LTS 20.04: 9.3.0
>              FreeBSD: 10.3.0
>            Fedora 33: 9.2.0
>            Fedora 34: 11.0.1
>              OpenBSD: 8.4.0
>       macOS HomeBrew: 11.1.0
> 
> With this list Debian Stretch is the constraint at 6.3.0
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index a1a40577c9..43d2470bb6 100755
> --- a/configure
> +++ b/configure
> @@ -2059,8 +2059,8 @@ cat > $TMPC << EOF
>   #  endif
>   # endif
>   #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
> -#  error You need at least GCC v4.8 to compile QEMU
> +# if __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 3)
> +#  error You need at least GCC v6.3.0 to compile QEMU
>   # endif
>   #else
>   # error You either need GCC or Clang to compiler QEMU
> @@ -2068,7 +2068,7 @@ cat > $TMPC << EOF
>   int main (void) { return 0; }
>   EOF
>   if ! compile_prog "" "" ; then
> -    error_exit "You need at least GCC v4.8 or Clang v3.4 (or XCode Clang v5.1)"
> +    error_exit "You need at least GCC v6.3 or Clang v3.4 (or XCode Clang v5.1)"
>   fi
>   
>   # Accumulate -Wfoo and -Wno-bar separately.

I'm surprised that we could not remove some spots related to GCC 4.8 
compatibility here, but if I grep'ed it right, there are indeed none ... thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


