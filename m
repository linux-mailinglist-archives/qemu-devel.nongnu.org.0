Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BD65F12E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT7x-0007jo-RS; Thu, 05 Jan 2023 11:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDT7v-0007hM-LN
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:29:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDT7t-0005q2-T9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:29:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id l26so26829638wme.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6cxxueGNhyweU3ZnlPb8Q/WFIYfksbfsoMVLaZHp6ng=;
 b=kYrzxOqpW+kUwbhihTYMbPvT6a2lAUNOo/wXS4wJrpsFrhDlVhTsQa9vR6CYP5T8XO
 swfHEtSvVwvsOOz+tDhGO8s/CmrDbrtqQsx0wjLvK/J2DpLJ64iHV2aoP+GgCDLn2kLo
 heLrVekg2lz8B67ADrB8rt0+mBW+GOG3cfgEirvixYXbOKqZGmYxdJjW8zPm4IxcK0p4
 3OSG/EmsVBvPF+lr7Rm8OJpLb0xtjYCYRcITb9FENIOo4TBtZL4sUHrfyTdIs4nQjjuh
 SUE9Uvn5PDN6Glg+FCQjPY9jgtYyM4uE9PrsUP4rAMWP07YqndUndRPez6CtdHuxQc76
 utUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cxxueGNhyweU3ZnlPb8Q/WFIYfksbfsoMVLaZHp6ng=;
 b=JQAKTKEn3yBxB9mMyuK8SUHw514/GkjKaDWZXFF9+XwnNHCIuCHH7tivNCqBDKJDML
 at9P9M7I99QFE6GoGQ1WRCGDCnFJURDYFdPKeFpbpvOqKP8PA0Baw3xpHcmyXUqfXBuI
 91vfX8TkPIW8wEYQ2w+KOiBtE6Rkr1GO+MMC3X8Qx0i6LfQmsCqnOpyAGdWlElxUU2Cy
 AtC9BcjrcvJ+sGAQpRpCapcRphDBEFdF5qhfSw5xo9blhifDi2pUPZvfAmFZtDeQHhnE
 H6GCA9Y/NRYDHKkKOd/mKT7al10vOe/9ACATTJ3YfgUqEWN25CwZFsf5XedTjhwWmMgz
 On0A==
X-Gm-Message-State: AFqh2kp3M0MpFWR+NOLZOh8FNO7XpaO+4ciXhYpNBKjz74ExXSrToH4D
 fobOM+PX/zMKazwGOVlN8oRjgA==
X-Google-Smtp-Source: AMrXdXughjFw9PlBoipD6pGUOg4rTna3M+kvvU4Zu4b5iNNPhoGjzSeOQwcFGWabw4AsUaD/zju6wQ==
X-Received: by 2002:a05:600c:1c06:b0:3d0:a768:a702 with SMTP id
 j6-20020a05600c1c0600b003d0a768a702mr40907343wms.19.1672936195973; 
 Thu, 05 Jan 2023 08:29:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm3345302wmq.33.2023.01.05.08.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 08:29:55 -0800 (PST)
Message-ID: <f731609e-b04d-bb29-d37a-21f1dd0b1551@linaro.org>
Date: Thu, 5 Jan 2023 17:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 50/51] acpi: cpuhp: fix guest-visible maximum access size
 to the legacy reg block
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-51-mst@redhat.com>
 <20230105045544-mutt-send-email-mst@kernel.org>
 <c773af84-a36f-181c-6e0e-50124230289e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c773af84-a36f-181c-6e0e-50124230289e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/1/23 17:01, Laszlo Ersek wrote:
> On 1/5/23 10:56, Michael S. Tsirkin wrote:
>> On Thu, Jan 05, 2023 at 04:17:06AM -0500, Michael S. Tsirkin wrote:
>>> From: Laszlo Ersek <lersek@redhat.com>
>>
>> I noticed v2 is forthcoming. dropped now.
>>
> 
> Yes, thanks.
> 
> I'm picking up the "Reviewed-by: Michael S. Tsirkin <mst@redhat.com>"
> tag from your commit message. I'm not taking the "Fixes:" tag,
> originally suggested by Phil, because we've agreed that that was not
> correct.

I suppose the tool MST is using automatically included the Fixes: tag.

> The other tags (from Igor, Phil and Ard) I've picked up
> already, and I've updated the commit message too. I'll post v2 soon.
> 
> Thanks!
> Laszlo
> 


