Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE99321201
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:29:19 +0100 (CET)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6ak-0002lt-O4
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE6Y5-0000uk-9i
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE6Xy-00062W-4I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613982383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kn6yn48zB1vOQFeES5SZdkSApSJl5+RMCNgA3zLHnuw=;
 b=iQQiiw6gYJnQOlRjUURpXHXWb1owAOq2q4nguNPveYsZKZU1Yi3XEJn7ksELnfzIr7x3SO
 sS5zOl1dkSvsbIUPI4v3mBBMYb3JjLPv7jSU5eCYfv5UQ9N47cja4IvqHyehRPvTtSRFqW
 3+MO7dvgov5pdaPvVmTQvEL9RtIaka0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-6sP8LCL3Mue9o3scK2iAAA-1; Mon, 22 Feb 2021 03:26:21 -0500
X-MC-Unique: 6sP8LCL3Mue9o3scK2iAAA-1
Received: by mail-wr1-f72.google.com with SMTP id t14so2459276wrr.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kn6yn48zB1vOQFeES5SZdkSApSJl5+RMCNgA3zLHnuw=;
 b=eszTyeq5jVi8TH4inawo/ZNGKDVVwVeh8NyI4FZWiOZfP+fRnMCD5tElRH0jhkFBPY
 vK1yateocbp8EnZv4Zq1VG7WsCxwVHWI42WxjeGmPwhU7ll39v/79bV/xgT1M6V6FDmd
 iaf+5GiF7fl893manzMpJpHBNrCxhqty6PQX9oDzV3nNoIOcwoF2JstaYIwtve3cf64R
 pi5sOxcao3TZFPijCjTh7JWRZEpO5x/q8wUCEKGyOKaVW/F7TyEa0RFAUOGF7SXNJq7E
 RW4YpaapLXf6y8p8AgyU0zIv5Fdf7OcGinnzgdodjdV/YDGllXNxQjZUDsyQUK6MawWz
 OsEg==
X-Gm-Message-State: AOAM532/tZCXFMVAJsFSgCFwzxtaN9aTQJbX77zIrURvbWhGhT+IwRCg
 QGLwLAJjcnXfP0VrRl4S6pWIujHyHrHOHnIHsUTZEKvlv8fjWQ5iJUltNPxa3G3wvMcScpV4atV
 /1OXBGmGQv7w/PeM=
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr18974997wmm.163.1613982380340; 
 Mon, 22 Feb 2021 00:26:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw02yWGWLPakMzYAfA65qbX2Fs1SN/lUX60amisy99BNFbWcNfJfEozn2iN1cLBJs97lCSRIw==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr18974975wmm.163.1613982380090; 
 Mon, 22 Feb 2021 00:26:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 6sm34893198wra.63.2021.02.22.00.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 00:26:19 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
To: qemu-devel@nongnu.org
References: <20210202155611.998424-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da2393b7-c0a8-8f59-5ee5-4a5569f9853c@redhat.com>
Date: Mon, 22 Feb 2021 09:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202155611.998424-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 2/2/21 4:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd88668bcd..838d0f14a59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1768,6 +1768,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported
>  F: hw/vfio/*
>  F: include/hw/vfio/
> +F: docs/igd-assign.txt
>  
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
> 


