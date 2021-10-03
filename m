Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703E420229
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:14:28 +0200 (CEST)
Received: from localhost ([::1]:46950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3C5-000121-Tz
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Ak-00005V-Jg
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:13:02 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Aj-0002ib-1E
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:13:02 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id 11so8570034qvd.11
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FtYfXDPjKuWLMwODC3EZgHDxKgD0aEWKFZjdulrH9xc=;
 b=LvVePnEE6BYr8tYj1cELRb/XAb1CjgwfcENwZxXqxIPQzEZsPR2aAtwWwt+6hVKpPo
 mYsBep4NBHkHqJ6onwkahZqkKyTNjk/pA34rPzJzv1OziyzvhZQtO4GJ5nVf8Myd8AH3
 A4UIeyhQzGD2c0U0MUj57Y/wj0Ls1khxNkWPc7866Sk3tKcZg91ftbixOUVE28xO14ai
 u23viXXnsqXx1836Ex8zvYbBl3U3XyXkVFOiFkgsKQmzYccIYidCFZA+1kJWpj4x8yYn
 fGvtsfPQoRalQcz73t8Y6VjPaq5HvawN2T+Fs0pw+lCFV36UC3PMheMtXLmZESP/AsTa
 zv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FtYfXDPjKuWLMwODC3EZgHDxKgD0aEWKFZjdulrH9xc=;
 b=GKjJBLAIPFne9mdYlqOaFZLVIBxPDW7FfL4cOtmqKXQ/DpCX7oCEUurYvepPAHZcBq
 1H3vWlHao4ujx3h/PFPYm92l0RneDRhHffl5az9jYqDJnzt1BDKbTzr3kwQiC5ht4pWq
 rwZqw6GErxxNcFUGXHkajbbI0+P3JkgB3Rs4FyYiaTgGWdvs7TxN09XKc/AiQD9jJWs0
 hN545UOSx8AgFEkwPj1S00lkhvdaJKdtNJBsVRJF4AGUzSg6D8yGS3aoUwVi7bilmbqD
 vkDEZguZHQUpGSeIHHUwsvtyQAQUVYrggprwuj0NIcA04sn3cY121grAAMWxHg3h3YHR
 OtTQ==
X-Gm-Message-State: AOAM532RonATPye62mtJ/J/iid3Mp2kIwYDeskMDOnBuMILx+M8HW8Eg
 7KF1npcfbvA6Edew2tUR98uXCMr59RWw9Q==
X-Google-Smtp-Source: ABdhPJxcokIR/uZx3ENmtI7e5o7HMl4Ugg2DLOAd05JHkQPaEnr7YbwxDj843zgoVP+jrSnsq3j5zQ==
X-Received: by 2002:ad4:4652:: with SMTP id y18mr19172589qvv.2.1633273979552; 
 Sun, 03 Oct 2021 08:12:59 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id e22sm6033092qka.133.2021.10.03.08.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:12:59 -0700 (PDT)
Subject: Re: [PULL 00/30] Misc changes for 2021-10-03
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211003074250.60869-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04ebef15-66dc-74db-f742-eab4aa1a71c0@linaro.org>
Date: Sun, 3 Oct 2021 11:12:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 3:42 AM, Paolo Bonzini wrote:
> The following changes since commit bb4aa8f59e18412cff0d69f14aee7abba153161a:
> 
>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210930' into staging (2021-09-30 21:16:54 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> 
> for you to fetch changes up to cb83ba8c1ab856b4327e7e869c410bbfd4152c2c:
> 
>    softmmu/memory_mapping: optimize for RamDiscardManager sections (2021-10-02 08:43:22 +0200)
> 
> ----------------------------------------------------------------
> * -smp cleanpus (Yanan)
> * Hyper-V enlightenment functionality (Vitaly)
> * virtio-mem support in dump, tpm and QMP (David)
> * NetBSD GCC 7.4 compiler support (Nia)

Applied, thanks.

r~

