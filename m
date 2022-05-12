Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7EA524F55
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 16:04:02 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np9Q9-0002Cf-1r
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 10:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9O9-00013O-0X
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9O4-0005Fz-9T
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652364111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGTeTn4f8ysRUa19Fu/mC1hdVRUvx/2tHoZHAT+hzrs=;
 b=KHWXRqCXlMZJkXw9cBm/tgmckN+rPtEbQPZA678B1eJykoe84uZThEQeU5mc3qgAmmwNbU
 uTawMNeDax/RYtjnrdUYyHjxQj6TbAYkRMLWfZDzZ3K/xSoGlOLJ0TYtJKwpjEQ1Pv1I2v
 P0dEwnOgOvmInRzoIwnf8asIDcTmXNc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-H8UqubouO4ylSQUuJRNh8Q-1; Thu, 12 May 2022 10:01:49 -0400
X-MC-Unique: H8UqubouO4ylSQUuJRNh8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so2178680wmn.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 07:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=AGTeTn4f8ysRUa19Fu/mC1hdVRUvx/2tHoZHAT+hzrs=;
 b=wp+gkG8Je4JzTBMj03eVIa/0jTUNLWnnm/epVWGM/5vGFetmiJZp2SyrTNIOXarWkj
 uXOkb9csG1+oGziZ78X3vqJy4LtoOKZcn6+tQqJD4hppNkTOVyL9qoRHrKFxUBkXxkQP
 z9A+NnTkEb3iotuze8bmoVyRdaL1YFRBaZlnF6NK3HTU5Kl9irS8bls0NtnOIRJYKtc5
 jJwlVEBWnqLC6xDUgONHFz2o/SHAxt9eONSC0ABHAl5OlC1YQ2he7bopKc9m8NeP3+VG
 bA3DeWjpLD6pmsipxLraaVXf1EQD4ZDgaZxsZC0HVdaxTtxplF10m+43m1sevQCe9+Sy
 vY3g==
X-Gm-Message-State: AOAM530aEDpa4spec/he349XhQ7HpXbdmNTpFzLKZWgE2xbaVlAecHyf
 7MuT7szUOkzAie123J5H+howv0Hv8JKI/7x50F0TM+fH72+zIc6x9XbORNne1lF2iKpU11Fztxk
 MV/dz5jZxMPa7ggka9UiyGurgyBBucL+8/CbYqA+//Xp5uFxQpQJQ6vPtuzQ7XDE=
X-Received: by 2002:a7b:cb57:0:b0:393:db11:52ad with SMTP id
 v23-20020a7bcb57000000b00393db1152admr10319841wmj.143.1652364108381; 
 Thu, 12 May 2022 07:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLkSahYqLL+uvKrZs7qfsEqPrgQ58q+V9J7wg9UkOWnD79ByJGpsTCHW/zRKbgL6NMQHZCEw==
X-Received: by 2002:a7b:cb57:0:b0:393:db11:52ad with SMTP id
 v23-20020a7bcb57000000b00393db1152admr10319798wmj.143.1652364108033; 
 Thu, 12 May 2022 07:01:48 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 x13-20020a7bc20d000000b0039429bfebebsm2846763wmi.3.2022.05.12.07.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:01:47 -0700 (PDT)
Message-ID: <8812e17d-d1fb-1553-06c2-5394123f995b@redhat.com>
Date: Thu, 12 May 2022 16:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 0/2] Update linux-headers to v5.18-rc6
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20220512102942.1134141-1-thuth@redhat.com>
In-Reply-To: <20220512102942.1134141-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2022 12.29, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:
> 
>    Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-12
> 
> for you to fetch changes up to 98cdec27e4396a2982c85ed148f70770bb6600b4:
> 
>    vfio: tolerate migration protocol v1 uapi renames (2022-05-12 11:00:05 +0200)
> 
> ----------------------------------------------------------------
> * Update the linux headers to v5.18-rc6 (required for multiple patch
>    series that are currently in flight)
> * Fix the vfio code to compile again after the header update
> 
> I'm sending this as a separate pull request, so that the the patch
> series that are currently in flight do not have to deal each time
> with the ugly vfio macro rename anymore.

Replying to the 0/2 header to make sure that this gets seen before it gets 
merged: Please don't merge this series, as Avihai noticed correctly, this 
needs more work first.

  Thomas



