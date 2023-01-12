Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC356670CF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:24:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv91-0008Ba-7E; Thu, 12 Jan 2023 05:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv8v-0008AN-By
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:49:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv8t-0005AA-GR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:49:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ay40so12893669wmb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MXcNrOpiPeFujEYlhrBYpiCab6kKVXGUUy3gl0GT55E=;
 b=tLYAOCT14v7SECGqEVeLDP2H3rPinZr3MXRplGKs0MuoOlqfSvwCwW9MLovJx3r2XI
 7MDNk8L1DYt64S2f47b8meztRNbDF/rdJ9xew1OMZvoSaLlYFuIj3u0/27E+QDRGkwaQ
 MMNIol9sHjcE9zpEMBoq9nB6GWwQ5RzSKwen3pthEw3mHL5rVZU/kAGiGEcFwlatjiqm
 L/CL479zv8lh7tiu3V026RL56mRn6bTBsbYKeFFrjh17Vue3uYQ0m7oittmIP3b0qEir
 8dy/kbbaX+no4wrC4Y4XWwrAczvWjOiZDOF9rlP1r/QQ7CvoUGSeBZYk6yMHkVDcACmC
 NhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MXcNrOpiPeFujEYlhrBYpiCab6kKVXGUUy3gl0GT55E=;
 b=chOHKl9M5AiLEqe81F/qOdYA0+mW46WfzCkefJrUc8ZzrO5BzrM02XctUmplwp1X39
 JlLAsHCd+8W4d+PyIMfT2yeoFXgyqn45+33bAoRWl4LrknHhVInwA4pWJnH3EPLqYBee
 XS7XL1HJQs55aTpKP+c7qu+WY+cIcjANhp4mi8+9dGx57RB+a5z92Yxamy3jHcKWhhzm
 pWgRJmHDUHh2zqz7Aj/17ADBkQWr+VebUP84preF+p9cV1roLlzW4BNAvUpFMVSxxaH+
 Cf6DcVpp+8bNR3eaS96r5VQxTFlqGxq7of+nvUdrVHgDOWDv4Po4OhcSX7A381YX9R1I
 01dg==
X-Gm-Message-State: AFqh2kpNnCWBfMczQlJ7P1i3un4Tsy91ujOhoI4AVOwX+aujvgs+L/rF
 z5PyXadjp0tGE9OuVaEOnp4sbw==
X-Google-Smtp-Source: AMrXdXvaJyOJQ+d0T6yxOF3E+E+XMWU4sfDH0W9ACVufRoC4wo1cVrB/5qfKwcOVAfX9TsskzGUkyg==
X-Received: by 2002:a05:600c:3ca2:b0:3d9:da3a:ef9b with SMTP id
 bg34-20020a05600c3ca200b003d9da3aef9bmr17503465wmb.31.1673520546109; 
 Thu, 12 Jan 2023 02:49:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f19-20020a1c6a13000000b003d9fb04f658sm7454648wmc.4.2023.01.12.02.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:49:05 -0800 (PST)
Message-ID: <55cd1cce-d7ae-04e0-b046-1d87b5c4f193@linaro.org>
Date: Thu, 12 Jan 2023 11:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 13/31] e1000: Configure ResettableClass
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-14-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-14-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/1/23 10:57, Akihiko Odaki wrote:
> This is part of recent efforts of refactoring e1000 and e1000e.
> 
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.

Typo 'There'.

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/e1000.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)


