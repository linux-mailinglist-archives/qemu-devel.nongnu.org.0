Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7C2F2E6A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:54:11 +0100 (CET)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIFW-0007GX-Cl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzI7y-00081J-J6
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:46:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzI7w-0007TX-3M
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610451978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPwAP0D5PUnsUJX6n1HkBiQmJ7sEesbxfWsF4bU7vow=;
 b=h/6FJkIoSR+aXumpn4DM6QlGVrv1Ej7E0EaY2U+xQnNuXLK3tKnCArUIQJ13mBih0tUwP/
 1pMhk0M2SGfsQ1Bz1xvjfPaU+reW4mP8AHN5QYuJBQq+9mxR/jrTh3XBmyq/IL4b4llI7i
 1eOt9qU9z+YppmJqSCI6iDIeRhnhP9g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-PlMQ4Ga3PFOvasIE9dpLvA-1; Tue, 12 Jan 2021 06:46:16 -0500
X-MC-Unique: PlMQ4Ga3PFOvasIE9dpLvA-1
Received: by mail-wr1-f71.google.com with SMTP id q18so1017816wrc.20
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IPwAP0D5PUnsUJX6n1HkBiQmJ7sEesbxfWsF4bU7vow=;
 b=nmR7ikxUok3knUwaLgRDh6lWUx9ISSbeaKvHkZ5uBJd8kQtdxP8HxBbIgOr0dPpdLI
 2j9K3HxfoubfvKu0+txvnY6AtgCBI8mzDNMRIZQXCbz1kCAn3H8zos4HGXixIf0v6yRf
 IKko2R9OfX8dzurz1/ZTxIgXMoVzTuBCoXh5TrbpzAB8l9dftlKJbXV/0usV8j5JcFLs
 EOseEYY+Dha51Kdl6hOENLHIIT3wMlvjH+CdLYlEyj3g9rt/05Qbvuzv6Ypr7mqR539I
 tOJ25Vj+pTwhdpQWiFvjutHVBKb4K/erlR0fgT/BgadtVRGSResZJYIcIWCh5QSLDwQP
 Kg5w==
X-Gm-Message-State: AOAM531QiUZFS877hKTM6OO739+p6Qql8GdAlk2VucCgRHRuHBzCvWaR
 Uuz3szfb1WiVAKNTF2sqZkXltPru/swr2f+QmD7IVbks2UnAAv3rhFr738PM90jLyKkzaWsppzI
 WKAQa4vUFDUJ8Lkk=
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3124639wmk.127.1610451975738; 
 Tue, 12 Jan 2021 03:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxagt7GG69JfHRNbYlJAOWhkhQf8bG97nobgfZ5H3+H+dl4z2bcoiD2nS17BctO3jhJOKI74g==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3124621wmk.127.1610451975574; 
 Tue, 12 Jan 2021 03:46:15 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id s6sm4984638wro.79.2021.01.12.03.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 03:46:14 -0800 (PST)
Subject: Re: [PATCH v6 5/7] configure: cross compile should use x86_64
 cpu_family
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-6-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <152face1-f60a-5e6b-9986-5ee3bd8a411b@redhat.com>
Date: Tue, 12 Jan 2021 12:46:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105022055.12113-6-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 3:20 AM, Joelle van Dyne wrote:
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 09dd22ebad..79dc9811e8 100755
> --- a/configure
> +++ b/configure
> @@ -7033,9 +7033,12 @@ if test "$cross_compile" = "yes"; then
>          echo "system = 'darwin'" >> $cross
>      fi
>      case "$ARCH" in
> -        i386|x86_64)
> +        i386)
>              echo "cpu_family = 'x86'" >> $cross
>              ;;
> +        x86_64)
> +            echo "cpu_family = 'x86_64'" >> $cross
> +            ;;
>          ppc64le)
>              echo "cpu_family = 'ppc64'" >> $cross
>              ;;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


