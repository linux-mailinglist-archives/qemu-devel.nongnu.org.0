Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A250169DBCA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNrR-0004DI-6t; Tue, 21 Feb 2023 03:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNrP-0004Ca-Df
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:18:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNrN-0005qD-EX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:18:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id l1so3160087wry.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p74aSkHdGlsDw7t9/3+LPkqL52Fsa6q2cVgqRuU6S60=;
 b=PyfXmSYk5/CejrOHDOzIo68/hJybyn4kfCi+kpPiZ3+FE1Rc3byD5Z+JMUwkzvDFBb
 iOz++avnP1GNlXk3OJoC2ii8f/FQhN6VSj9JG9UMOVBOdEr8z76/fMyrVo1nVATJlgKm
 Sp1Q3YeUpF+E+PnoUzVeybaF3PeJuV7ayAOCU8vuHnW5q7kEV56d4b6ZBFQeBxYVk6uJ
 6MKebV9GQuWkdDVnkvNJOeZoWlzr9fmYoCsmSxsTn9O0OptzCJPeMxJojUu9TBTkXz7U
 6leX/uL32Q9mKoUOezbx2LBrkdzMdFhRZEhR8Qnbwl4sTe85jeQcADaL+kXkEfDdv7s8
 rTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p74aSkHdGlsDw7t9/3+LPkqL52Fsa6q2cVgqRuU6S60=;
 b=VcjscYwWmK4BzKpM6PSQUzsVo8jLTlQUGyh+TowegW7oSPMGHc6kB1SBO6ibdmvzk/
 uC/WJF8i+DHICf+hyJD8XZ5X6gc6+gm4zXZNva8UpCGmVAxS6NFIozIY7xBYjEl8plxO
 DFKrNSHoZ2dSRyE2nP9Ie7DrXpS5Pg1lHE39YuAheaNQtRiztOS0UsE3B4p9Tbpn++Wj
 H/qTdex+oNIUp8Wj996Q2J85hIFWEtR8s2YoOvW9TNKWocgLddwuHGCAUzjZDzyrMyMv
 U/Ti5nGc4ZVbhylsZWlemxtwTi+HU6i3MbvZzXRif+0ZsXfiMrWwJJ09IyTlKbazixdn
 ltLQ==
X-Gm-Message-State: AO0yUKVwcXYIuPgLxP7yA6REbgVaCycl6QiQEsACqAnlcu3RawbUh6tK
 uY1URwgqZ02RxPlKC6TxUs7/Lg==
X-Google-Smtp-Source: AK7set8Cf2eALW2zztptXb1T+b9GRA7BHWuD+SSIykap4OeHHbqN3csgvTwJcmfHsMg289fHHD3CZw==
X-Received: by 2002:a5d:6da9:0:b0:2c5:518a:f6e0 with SMTP id
 u9-20020a5d6da9000000b002c5518af6e0mr3329369wrs.6.1676967527801; 
 Tue, 21 Feb 2023 00:18:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b002c573778432sm7541052wrr.102.2023.02.21.00.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:18:47 -0800 (PST)
Message-ID: <cb171b7d-810e-9cd9-a0cc-ca7575513f1b@linaro.org>
Date: Tue, 21 Feb 2023 09:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 29/29] e1000e: Combine rx traces
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yan Vugenfirer
 <yvugenfi@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
 <20230201033539.30049-30-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230201033539.30049-30-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/2/23 04:35, Akihiko Odaki wrote:
> Whether a packet will be written back to the guest depends on the
> remaining space of the queue. Therefore, e1000e_rx_written_to_guest and
> e1000e_rx_not_written_to_guest should log the index of the queue instead
> of generated interrupts. This also removes the need of
> e1000e_rx_rss_dispatched_to_queue, which logs the queue index.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c | 6 ++----
>   hw/net/trace-events  | 5 ++---
>   2 files changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


