Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD437B55A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:16:33 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghEW-0002tS-O1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghAs-0008G1-EA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghAq-000851-Qq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620796364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jy6X3uXsOX2+ZS1fqvueseKT+GWrB5QyysBOESbmvBE=;
 b=L63vSVRVnBkLjrDyDRYQDz2cvo6Uh4ZHn0bBCJfzHyK3kCufvsKKhElRo2zFbCqAJVyAEc
 TZzRw1hHerI49kxfwGZxSaChtZExpYCysvTq5MA/cAczPCMr3ykc12aB18dYZSQzv9hzC6
 lIMMTU3FT/v2jjToml+U2DtW8qThVM8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-D9LzmimZNX-RX4aoZQkKMA-1; Wed, 12 May 2021 01:12:42 -0400
X-MC-Unique: D9LzmimZNX-RX4aoZQkKMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so86409wrp.15
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jy6X3uXsOX2+ZS1fqvueseKT+GWrB5QyysBOESbmvBE=;
 b=U3kBkSInmrflbulds08/HgJAHZuIP0l4zKq27VHltRto6mfqOs9Z1Gt69t+pz2xR1v
 0pVjZqjZ80+P0cMia2jBIFaKdUGLsQSK1DmopSneIKVop/NGJyaU374kvWYUBd5u4mql
 NB35xr91kVuFDwdFIOfQNSW13Ax3NBdITRGi2xVfAX1eB7hUXEbAoNQv0DyyepTaytGP
 e/lpPNcHpwApNzqB+C0jbzMjhKgFpj0n5pVaU6qIKh4HcTltUJE5x3IjmHIPrgVSfNYb
 7BUkghTgRRhJcm4BhWgyPVQq3Iuqtc+EJCUwf/uHyvv+z1i8s3wiQkyf0+WM33wMJXuD
 6EVg==
X-Gm-Message-State: AOAM531wwTqbI/Axr6bR61pJ9ClHPJEsP1NYrmGwmf8y2DrX+/nMRzCp
 vOFsZNVxVS7uF9U309ojx5W0PraRfY6ilNW/lEt64X50kWy6cYMz8NE/RDHOsBAmZJGJvvoUHa4
 QnnoitXX9A32JCgw=
X-Received: by 2002:adf:f90c:: with SMTP id b12mr20686959wrr.409.1620796361407; 
 Tue, 11 May 2021 22:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCyD7WT2h7qFR8sJQ/EQGPVfwVIovguMky5rX3gqYDbEoELHvQFfHE4sjUZeYu5WgfWJA56w==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr20686941wrr.409.1620796361237; 
 Tue, 11 May 2021 22:12:41 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id p10sm28630729wrr.58.2021.05.11.22.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:12:40 -0700 (PDT)
Subject: Re: [PATCH] configure: Only clone softfloat-3 repositories if TCG is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512045821.3257963-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <afeea06f-b778-6d62-daf6-99fa4286b056@redhat.com>
Date: Wed, 12 May 2021 07:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210512045821.3257963-1-philmd@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 06.58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 5877a6b2bfe..e0e02623e3e 100755
> --- a/configure
> +++ b/configure
> @@ -257,8 +257,6 @@ if test -e "$source_path/.git"
>   then
>       git_submodules_action="update"
>       git_submodules="ui/keycodemapdb"
> -    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
> -    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>   else
>       git_submodules_action="ignore"
>       git_submodules=""
> @@ -2277,6 +2275,11 @@ if test "$solaris" = "yes" ; then
>     fi
>   fi
>   
> +if test "$tcg" = "enabled"; then

Shouldn't there be a check here, too, whether git submodules are enabled at 
all or not?

  Thomas


> +    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
> +    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
> +fi
> +
>   if test -z "${target_list+xxx}" ; then
>       default_targets=yes
>       for target in $default_target_list; do
> 


