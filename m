Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DC66B9FF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLZw-0006hm-9J; Mon, 16 Jan 2023 04:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLZt-0006hJ-Dl
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLZs-0002EW-0W
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e3so17576803wru.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Is/NQskLh7di5gawlQWD9gHhbFmqF1TTwh6ZV+ZZdQo=;
 b=yyRefnh/Dm/vKfNi8z67G7WyZDQjcQBSkPd78aBK8OhOVAgLKPHQTy8nvJlfRsq9Cq
 aA+PWyDHLwwuwzt8rJqMi0JCV4NFLdpSvzZtS3TX/gHuOBnnBrSlYmyUzTbhFBG7H1xP
 1A1JbRMm31J/AK7ZB2xFBwd2oy+uU6L4Y0e50EwlhJ449eKw5+y+EJrrDQDmIkvjEJz3
 OEsKEjo+nFgCnY8ERdWJKQpR9c3/wWRZwo7VNsmrvvqMZNvBkCy3YfVcNIj6967zSYle
 T7+G1jsnjY1iFv9dBPsge0d1LDUaxu2AaFfZ8xmqPzOur0LID/xoBLiuQPmMLIZApCjj
 cu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Is/NQskLh7di5gawlQWD9gHhbFmqF1TTwh6ZV+ZZdQo=;
 b=ElBDk4jru3MJrUOaEH9r/26D7TpXB8OPINlFnd4GQYjxDIbyK9fPbSCy53457Jufwg
 HEV6+CWSFWRXBnlPsAVQrhXKVe4sQzsUqrpYdsf9tpBAR3ptX2Zqqv5V+wVwIgkZondV
 /xinVeb/1WKb2i1UPOhmCi84yZCzpVhXy30gNZ3OBa47eIhpFsWA3CC+v090yOlZYXyB
 WWCEUbHw7ekFdkIui1sSg6GPx1PAO8ywfXiC4utLkFoxFNrI4xuRqMyGXrgMSfD2b2Ua
 OyC4KSuZQh1NsdU7nJbB3nyBw8OyTXh30gkF67X5gWCoG3HjQBv6DukIJqEBvsWgY4gw
 7Tlw==
X-Gm-Message-State: AFqh2koaDe8moaGQFyIEFOqtB48wlamaTZXlARqzuqVhLYtkNSDe9Wun
 JF+3kdsoZ1YpHUw6WS2PVJBCBw==
X-Google-Smtp-Source: AMrXdXur6pptwQmgx8IfZD9zU4S2gJKSNHEsskCCHAFeHifAzKW7QgFTQwYQXIp2GZfz2SDvfrVSKA==
X-Received: by 2002:a05:6000:18ca:b0:244:48b3:d138 with SMTP id
 w10-20020a05600018ca00b0024448b3d138mr54158141wrq.54.1673860490525; 
 Mon, 16 Jan 2023 01:14:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0024228b0b932sm31075221wro.27.2023.01.16.01.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:14:50 -0800 (PST)
Message-ID: <5d15457d-e8f6-841b-7274-6ff74e1a425e@linaro.org>
Date: Mon, 16 Jan 2023 10:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] hw/isa/isa-bus: Remove now unused isa_build_aml()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114222738.282478-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 14/1/23 23:27, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/isa/isa.h |  1 -
>   hw/isa/isa-bus.c     | 10 ----------
>   2 files changed, 11 deletions(-)

Possibly squash with previous patch, regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



