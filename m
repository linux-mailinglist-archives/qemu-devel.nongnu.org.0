Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC184467AE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:19:48 +0100 (CET)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2sV-0006Ws-AM
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2mJ-0003tX-Lk
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:13:23 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2mH-0002Ij-GF
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:13:23 -0400
Received: by mail-qt1-x82f.google.com with SMTP id d21so7741693qtw.11
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aTFBER3pvvT+g9acGPHbxwCfylzAbStFDaBwu14aw54=;
 b=y3B8nRxJm8DHHS8Ma6eem+fBrYC4TfxQwRJA5Ruu6QoWR/2anzft7S2WDiWxq6qDpQ
 YUkWZzvQZh4yzbCXvBTE6gZL/lVWLcbmxjD2wXAkrLtZAvaa47c9+ZO7jLUzQHjYTMLH
 YGqMrVGWyd9gQwAR3JVR83rqKBAr1XaStKfw5YNn6LfvrVFTo41aysxD60qJvkPjhC5X
 GWOOCsXLCVNH7dkIUAMzEzFuC2HzT8nG6xoZVuD0B5nX1S5u8wxIMEyQr/d2H/UKMsXQ
 AfA7yDNQGZaaE5jWSiAoA2g17d00ufabWfw0jub5Z3n0wOYBxm1duARmNGBP1/82FKUf
 jpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTFBER3pvvT+g9acGPHbxwCfylzAbStFDaBwu14aw54=;
 b=O6f9pGZDKz/JDC/goK8nyFcXfhjiQgAtgeU+iSteV8OaVBvKYc2urk5IXnqGKtj0vY
 GMHSestnfktrs+ck6TXYU4gO1n/lG4zSrdN7BQ1CXpu2tfQIBcyO5l0BJnVjRBQUHSWu
 lukZXP7/+JNysUN+rHaZFNuR3IyKWeqrYRiZbqy6Z8T96+nW8F+sgtGWzR7j3w1LAOM3
 f76kdcp597DT/WLigTml8KZ9bOdHkfRUGTFbliaCsBfF5/LMYfNfz2NXyIjOmOosuSVl
 CbK2BN7CwLPjfX0JlDLtSZioVDOlSpZf+1LIz/3TNH6FUF7rzWd5MZRMgBKUBt4iY8+b
 R73Q==
X-Gm-Message-State: AOAM5327Y6UC04OoqbbHIPsQ/tnJubpyaOk2nIuvAAuG8Z4IEWztIbGQ
 MxalI8Oax+9kEivNnVADifBrFQ==
X-Google-Smtp-Source: ABdhPJyF2G4Y0tO4+dAXIG3Mn4Oimju9qivewHoF4GIFPrQBQ/phBL0y7Nrpw0BUtzEZ4BtPV9JkHg==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr64639465qtc.266.1636132400247; 
 Fri, 05 Nov 2021 10:13:20 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id b2sm5834851qtg.88.2021.11.05.10.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 10:13:19 -0700 (PDT)
Subject: Re: [PULL 0/6] Egl 20211105 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211105113043.4059361-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
Date: Fri, 5 Nov 2021 13:13:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
> The following changes since commit b1fd92137e4d485adeec8e9f292f928ff335b76c:
> 
>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-11-03 13:07:30 -0400)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/egl-20211105-pull-request
> 
> for you to fetch changes up to 1350ff156b25be65c599ecca9957ce6726c6d383:
> 
>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface (2021-11-05 12:29:44 +0100)
> 
> ----------------------------------------------------------------
> gtk: a collection of egl fixes.
> 
> ----------------------------------------------------------------
> 
> Dongwon Kim (6):
>    virtio-gpu: splitting one extended mode guest fb into n-scanouts
>    ui/gtk-egl: un-tab and re-tab should destroy egl surface and context
>    ui/gtk-egl: make sure the right context is set as the current
>    ui/gtk-egl: guest fb texture needs to be regenerated when
>      reinitializing egl
>    ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface
> 
>   include/hw/virtio/virtio-gpu.h        |  5 +++--
>   include/ui/console.h                  |  4 ++++
>   hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>   hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>   hw/display/virtio-gpu.c               |  4 ++--
>   ui/egl-helpers.c                      | 25 +++++++++++++++++++++----
>   ui/gtk-egl.c                          | 10 ++++++++++
>   ui/gtk.c                              | 23 +++++++++++++++++++++++
>   8 files changed, 79 insertions(+), 17 deletions(-)

Applied, thanks.

r~

