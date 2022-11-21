Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D986632049
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4ps-0002Wm-ON; Mon, 21 Nov 2022 06:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4pU-0002UY-Qv
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:19:29 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4pR-0002jo-UT
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:19:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id v7so8243077wmn.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A48OoRdsmShwExj7wAvLufJ9oyXWSifYdFwcbi5zI3A=;
 b=U8YL+auaK0xB3MUN32p8vSrrJ87IyRXAlK72JjpN+cXkBhgzg864NfCWuya/VX0Xnf
 skHjI3+2LDLFuukgbDRBr2/q8Pz0H+wJYd4qIYs9XhofS0HCkxu9DEtVNmCXKP1WkfTf
 zxu2KZSIGoJqu+FK/naNYOJ5AosnV8QGVqZAreo0cmq4huVRs8xgw3HBQT+nvzzU+92a
 eRXglzOBdwNGuxsuWVWWb2txwRMMdaOBk6KkYzyamA7zXo53If6Hq71qX29ojvHjHoNB
 MtRLiiIZdBSbOSm6vUDs99zXIAgMusH16rZUEdk+b4FAKb9NS7LJEw2EZb6+C87Zd3aW
 dPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A48OoRdsmShwExj7wAvLufJ9oyXWSifYdFwcbi5zI3A=;
 b=tDHAuablssLHkfADt6MoWHb0EKngd27MneEa63FyILuO/+SrREvCpD9mXeIZJTdA8g
 vzeR0pxrtVLy5A0bNOgs91EEnVmyiF1+ZzYndIln78yLLd2wLJlYgGV9edFRTDTm7z1z
 eI5+DfcQOUE8M8ZuA4JYghbw7DeTExy33iiJ2jM+DoXxTigUJNk7Fqqc+cyNljVpScAR
 +WvZhrr2Yz21j3PrMpMdEL/KE7lCxDLdLU+VKl+/XiYBmwa3c0VcrXquM4lx5UzzzKru
 968zmFAl6b3gesUQUetZ70iKp3hvzdXMN20rTcHM2IFEtR8r1KBFmJ7loLfJo7pPj6t2
 yTbQ==
X-Gm-Message-State: ANoB5pmVBltUbYWJvxoYvoClpaEcUrj9WMpiNe6xrvcEjB0qf9QgVVyQ
 47LPyAUCJegeM+CXGf/NLKdSJIh0gKE0MA==
X-Google-Smtp-Source: AA0mqf5LyPUPokjHNtnC3InP9UO258GPmVcCww9qcQhW3mXUQYWyrrcFAn3Otswa2d8mFtTKMtsTyA==
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id
 h1-20020a05600c350100b003c704f077b3mr3276197wmq.93.1669029547901; 
 Mon, 21 Nov 2022 03:19:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adff10e000000b002366553eca7sm433806wro.83.2022.11.21.03.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:19:07 -0800 (PST)
Message-ID: <de6b7e76-d4e9-3876-6cf7-350789860614@linaro.org>
Date: Mon, 21 Nov 2022 12:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 09/10] qapi: Use returned bool to check for failure (again)
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru
References: <20221121085054.683122-1-armbru@redhat.com>
 <20221121085054.683122-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121085054.683122-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 21/11/22 09:50, Markus Armbruster wrote:
> Commit 012d4c96e2 changed the visitor functions taking Error ** to
> return bool instead of void, and the commits following it used the new
> return value to simplify error checking.  Since then a few more uses
> in need of the same treatment crept in.  Do that.  All pretty
> mechanical except for
> 
> * balloon_stats_get_all()
> 
>    This is basically the same transformation commit 012d4c96e2 applied
>    to the virtual walk example in include/qapi/visitor.h.
> 
> * set_max_queue_size()
> 
>    Additionally replace "goto end of function" by return.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   accel/kvm/kvm-all.c              |  5 +----
>   hw/core/qdev-properties-system.c |  5 +----
>   hw/i386/pc.c                     |  5 +----
>   hw/virtio/virtio-balloon.c       | 20 +++++++++-----------
>   hw/virtio/virtio-mem.c           | 10 ++--------
>   net/colo-compare.c               | 13 ++++---------
>   target/i386/kvm/kvm.c            |  5 +----
>   util/thread-context.c            | 10 ++--------
>   8 files changed, 21 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


