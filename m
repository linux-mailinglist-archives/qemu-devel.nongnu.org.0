Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613A4A64BA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:13:30 +0100 (CET)
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyal-0007WV-FJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nEwdx-0000mL-7y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nEwdu-0005fW-2N
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643735307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tLVV7p5iH4I4aDQDHz03qB97CxMlrMetRd9pJnA8jcs=;
 b=eohezq/YbRXh/xLDxqA30EG7zwId0Rf/2h6xX+gNqp7wgyRjbGQ7KfHu2XEGegY0nXaRZd
 EWztyBei9qBkoz94eHRxsEsRFOPQV2wGv5zFQQQB99yyU/jt5m+qGL3QuGQ7wEAKoxQ7es
 99LNOnMVu/FhY0nO9uOHCKQtGDLyf3g=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-2p-C-gQJN2utZypQPoJuUw-1; Tue, 01 Feb 2022 12:08:24 -0500
X-MC-Unique: 2p-C-gQJN2utZypQPoJuUw-1
Received: by mail-yb1-f200.google.com with SMTP id
 127-20020a250f85000000b00611ab6484abso34175248ybp.23
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=tLVV7p5iH4I4aDQDHz03qB97CxMlrMetRd9pJnA8jcs=;
 b=0w8XLjNLojFFTJY2VruRHNtBsIFpZyymROslFviPJRmyQx3MeXVx/h+ixK3LkxUU6b
 Qnz808WZhpd620RBeoooshJdDx12232mLtLnXNhiEDPnKRtLrOrnLUQKKJY0PLypgnJE
 lUh675Smc/t1ezjCO1OJhnSfxMhT6+EPNH3JQjYhvOWBh4BLgniRFZvmewpcrtQSURED
 O8EfFR3t5RXBbDkBzzPRLKDMgWd78CNsq9MkMIrEAdEck75NgnZUzzUk8m2wR0T0Zo/f
 v5+UpunVTg/Jz5b+Hw+ZZkntVPsnbLuP0TkMGWkPReOh8SLE8lG91X/J1lHKDUm5QN5g
 h7ig==
X-Gm-Message-State: AOAM53016hQlnJkE+XZcTDrYe8LLAHi3iCo83UJApLBJ8u6R53Xi5lkI
 0UJuzQL0cvjUXw3IRsa3FLLMrynjjBQPdbUlku4PlLJGqdzFUfRASxDWQHgb5D5cDgSwNthAo1s
 vBHM91z3Ie0CxMNxMkseubrKIyBvQYxs=
X-Received: by 2002:a25:3008:: with SMTP id w8mr34328343ybw.42.1643735303635; 
 Tue, 01 Feb 2022 09:08:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYv3ibfu/Yto3ykbsftCa1FAiwSBwIWgqRgUYaHBC1LHREmp3WESDegUhJwGQOovDy1C1Oay5HL29BdsCrEEU=
X-Received: by 2002:a25:3008:: with SMTP id w8mr34328313ybw.42.1643735303374; 
 Tue, 01 Feb 2022 09:08:23 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Feb 2022 09:08:22 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201101911.97900-1-thuth@redhat.com>
Date: Tue, 1 Feb 2022 09:08:22 -0800
Message-ID: <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 11:19:11AM +0100, Thomas Huth wrote:
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile centos-8 qemu
> +#  $ lcitool dockerfile centos-stream-8 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>
> -FROM docker.io/library/centos:8
> +FROM quay.io/centos/centos:stream8
[...]
> +++ b/tests/lcitool/refresh
> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
>  ]
>
>  try:
> -   generate_dockerfile("centos8", "centos-8")
> +   generate_dockerfile("centos8", "centos-stream-8")

I'm not convinced this is a good idea.

CentOS 8 and CentOS Stream 8 are two pretty distinct operating
systems in terms of update cadence and stability expectations, so I
think that using the label "centos8" for containers and CI jobs that
are actually consuming CentOS Stream 8 is going to be a source of
confusion.

I recommend proceeding with a thorough rename, after which the string
"centos8" no longer shows up anywhere, instead.

-- 
Andrea Bolognani / Red Hat / Virtualization


