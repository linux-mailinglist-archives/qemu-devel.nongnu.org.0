Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13DB65C074
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:08:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCh1Z-00034k-IF; Tue, 03 Jan 2023 08:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh1X-000346-CM
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:08:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh1V-0000tM-Q6
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:08:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso23076120wmb.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mh/zsbMtwDUDuiMyccz3msT2ZkqEwto6VjY6FjsBiWE=;
 b=SOIAOLkRP34uH3eAeDVCwYfOWjeXBFdvSp9B/QluJ2ls70xu31LUgwHqKe63Re/6MV
 2NM8LBvNHyrPGuMct0osTtBGwrzidZcNU8FX4uyrIhdro5+MretydpgP6QauR/m/nMGs
 c71JnrKYNWpLd96rnESYlI8MtAR2oELB8jGv8nnyuNQrCev0fLYaTwn0w8g7b0Ud7t3S
 fn5OFHvyRj3Xyth8lT07QS87HaoEWn5tyUfKo+hhrJPica6VHhntqP7Yukg83Cmhc3zC
 AxBJF8QKIlDbjd+bsrU7dos7qJCUf7gvPDqulODaPdwXp28SSQla9SeQWI7Hm9By71yA
 bbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mh/zsbMtwDUDuiMyccz3msT2ZkqEwto6VjY6FjsBiWE=;
 b=si4qMddOxHTwVPEuhCBnOhNJGgT9j/Uhd9Q+Tn5qFG0UrKxxnDF3D4d8kjTXHIWT3c
 ekC0kS1gfhYi2WSMItIxJgVDPiwD0KK7x8mFSKrFlyToLNcCEB/L46QOIHY+ezYHngj5
 5wzLi7tDb0/7GNZolskGs5j4hzO/uWCqzsYh+cIrKY/ENtDmn59PO6s1FXdZhyhOWsLh
 65JFxzl3F8LpvmIfx7vTJBAEwBpOsAHWgKqHVfsUctZm3qIUaN6TvN/aIu8gMQ6VmfdR
 tnWPyYdRshhINbI5YvSRD8nTK4RjDRIJ7Lw4jfOvd9cBTzWw88xiDXvGhNlt5NTxL8Yz
 2tDg==
X-Gm-Message-State: AFqh2kosXrjZS5AczqOm6kzTAHKWbxdxvbdAhkF2wyzbF3nePMKqT32M
 d68lMMYAmWJx4KctWmCKnSTFDQ==
X-Google-Smtp-Source: AMrXdXsfUysPWxJBtYTs1P9AyD0cPp/Su3ZEE0w7KFcU6+Ei8NIwEW37WQd1rvFBLit/XtWNjhrJBg==
X-Received: by 2002:a05:600c:a10:b0:3d5:64bf:ccb8 with SMTP id
 z16-20020a05600c0a1000b003d564bfccb8mr31112411wmp.12.1672751287206; 
 Tue, 03 Jan 2023 05:08:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm63862269wmq.45.2023.01.03.05.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:08:06 -0800 (PST)
Message-ID: <027718e8-84c7-67ea-243a-3f08fd3fcaed@linaro.org>
Date: Tue, 3 Jan 2023 14:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] softmmu/rtc: Emit warning when using driftfix=slew on
 systems without mc146818
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103084801.20437-7-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 09:48, Thomas Huth wrote:
> The 'slew' lost tick policy is only available on systems with a mc146818
> RTC. On other systems, "-rtc driftfix=slew" is currently silently ignored.
> Let's emit at least a warning in this case to make the users aware that
> there is something wrong in their command line settings.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   softmmu/rtc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


