Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11C538884
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 23:07:33 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvmbr-00016p-TN
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 17:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvmap-0000SB-Vn
 for qemu-devel@nongnu.org; Mon, 30 May 2022 17:06:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvmah-0004EU-6U
 for qemu-devel@nongnu.org; Mon, 30 May 2022 17:06:27 -0400
Received: by mail-pl1-x633.google.com with SMTP id o17so815864pla.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9DVfnIh9gCQOtlUaye7IuQUtucgcZy6Pq8ZMUir6l/E=;
 b=AIuZu3iOZ/Y0PUr8PNbTGpUer+339WtsR3+EjrvpAIMcenif0/+jst+FuTb9xFmpCA
 jmeCqhCwFu3W5jXb7oftGeuOMVZYQRfP2ERxr0Ifzvvgu/WFB+oK5frzuAaxkasmWEuW
 LgmbukU7pqrPdg8YpEM284zU+lskZYiulKJFZ+DG7hcPOgwoAKUuoWK/GgO4iKCv2Icn
 Y1jFxSRGarxOS0TPb3NBXFKHjaH4yZCVWTTPG2mYmx4rt4klDRD/Eu1XoPLNa2YG1kBm
 xywS+fyQgjDq7t6h06mIZ+ZcK+51jb2wNgAPf9DdmokhPf3xcDZ1DxiTRIusKP1D+s3D
 LdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9DVfnIh9gCQOtlUaye7IuQUtucgcZy6Pq8ZMUir6l/E=;
 b=qnyb4Euxnex1mxNiyiiFrSFA4WvaUOdkn0OJd0rsFhqp4B759xJI9kpgmKIvfZS12p
 lWuYMz7yeiQETmACmZU5oxg3apFgMdcxyNaAFCJr/5DSd7ZOEDS5tnvwIBw0DPUq1qVJ
 JPYWjcs91FWkYpdHSz+nQQhx5A1s0rKBNPZKb6RBALsl6NTkrvs7uaOdoDoqtobogHW/
 M2oB2HzoezRt7wqPK8+AOsTPhxf+J0MpqkBtz7Cko1vbJAsru3u9wbVsJ52iaaY3nXOA
 WNrw7HpFUXyIEhjekQXDN423wuy7ch8xbXvB4fFPnrKJA6lAUj5EEBr6h+3xZLJBLncO
 T2KQ==
X-Gm-Message-State: AOAM532X/6aER+GXQWVRBwqcBK0xno3QU5+vd5hsO5tLDneEdGmv0kxg
 QPQNI/nhy9pGl1PCrVMKXMT0D2dnK5V9WQ==
X-Google-Smtp-Source: ABdhPJwjckElcKD41oxXGp1TF5YJRIgMXcHIoSomstM4FFSiK+aax8K6E0b/MqZYIU1JYSCjwUGX0Q==
X-Received: by 2002:a17:902:eb4d:b0:15e:d25c:4e0a with SMTP id
 i13-20020a170902eb4d00b0015ed25c4e0amr58991484pli.8.1653944777286; 
 Mon, 30 May 2022 14:06:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:feab:28bd:b064:f797?
 ([2602:ae:1547:e101:feab:28bd:b064:f797])
 by smtp.gmail.com with ESMTPSA id
 h190-20020a6383c7000000b003fc52b8400bsm110981pge.33.2022.05.30.14.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 14:06:16 -0700 (PDT)
Message-ID: <48c50e1f-7e2e-38ab-ab28-c08be5ae0136@linaro.org>
Date: Mon, 30 May 2022 14:06:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] Add myself as the maintainer for Hyper-V VMBus
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <cover.1653934780.git.mail@maciej.szmigiero.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1653934780.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 11:41, Maciej S. Szmigiero wrote:
> The following changes since commit f7a1ea403e0282a7f57edd4298c4f65f24165da5:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-29 16:34:56 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/maciejsszmigiero/qemu.git tags/vmbus-maint-20220530
> 
> for you to fetch changes up to 6ede46b910ac66fd10bc169fb0a6f681429a9c5c:
> 
>    hw/hyperv/vmbus: Remove unused vmbus_load/save_req() (2022-05-30 19:49:42 +0200)
> 
> ----------------------------------------------------------------
> 
> As discussed in https://lore.kernel.org/qemu-devel/4e03945d-fb92-494d-53a8-f22ee91501c9@redhat.com/
> I am adding myself as the maintainer for Hyper-V VMBus, so there is some
> contact point for incoming patches and somebody to review and pick up them.
> 
> The VMBus code is currently in a good shape, this pull request also
> includes a single patch that has been waiting for being picked up since
> November last year.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Maciej S. Szmigiero (1):
>        MAINTAINERS: Add myself as the maintainer for Hyper-V VMBus
> 
> Philippe Mathieu-Daudé (1):
>        hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
> 
>   MAINTAINERS               |  6 +++
>   hw/hyperv/vmbus.c         | 99 -----------------------------------------------
>   include/hw/hyperv/vmbus.h |  3 --
>   3 files changed, 6 insertions(+), 102 deletions(-)
> 


