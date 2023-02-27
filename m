Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E96A413E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc7G-0006DC-Ea; Mon, 27 Feb 2023 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc75-0006BE-P8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:56:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc74-0000qo-53
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:56:15 -0500
Received: by mail-wm1-x332.google.com with SMTP id c18so4046372wmr.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0YyH9wIONO+h7FSBrqrg0qaeB7ig3pxYDXH86bDYdq4=;
 b=hthTsustRKlTl16SG+Mkgiksk3u0XfHEcerbQ0eP8Z+4K51P8U154/BJiAoSFWyYaa
 tPY+EaP/UEBASDn0sYvVnT5f9f5uDFSgRf62WFRiWeU+DoZCrM9MuU2o2GoavnWezt+r
 eQ8UUTZzDiKmxhK1RvaZlr02T5Y963TJzXjcpDpzb2ltrO6Zr16cVgrXuMiz+gEw3fsd
 mCWmtmPaKFa17273EA1Vb4H8liu1uvaeDFcy6oB8D9E/+1VS3IAn4jo34djAycDli/BF
 X1TVIPGRFlE39TrhQelCf9uMGDCrS8fXGH7997KQdLWmz7C0bAcy2BqfVDIrlyfOOcCr
 b8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YyH9wIONO+h7FSBrqrg0qaeB7ig3pxYDXH86bDYdq4=;
 b=4C2UWxHZGHasoxViz+S+8WPpxDMErd50t5xC/QZ8nvlpqMI2c+Q7mCDMAqgQVR59Mb
 DBbS4WfRG4OditpaTt8FC1eoytAMCL6lY778RSpnUK1pR9+bfhXLWiJpODrNsgcq3TxL
 cgcQPVkfMxtQOxGCjLU4DRem7S7fHZrintMjl/RU8/RHZZN1zkTY/WPPhn9an1xoRkf3
 3fJSrwI0Sav5y8r2wbEV34DvFnfhlFcBGD5Wti+XuN9MRFs9uX9f5ba86J7GXmG6MtSF
 exe8Feam3oKkwQCCrHk3OiCEfS91yEKXHG5MqzMi8SY2wYzUJD1T6IFBWtXOWOxdVDed
 NRQA==
X-Gm-Message-State: AO0yUKVxFa+AJNcV0eqPNBqJz+49VXRGfREucEeK25cGzRn5PCrkBmpt
 IvxFyXasvPlwmZqDg4bmqBk0ZQ==
X-Google-Smtp-Source: AK7set+/EWMh3k6X8yo6ApyBqlPvgk20l8vHcBdkdWhZYKdq1C6N7VfB2MOQUUPAgxeplx5zWGn84Q==
X-Received: by 2002:a05:600c:44d2:b0:3ea:4af0:3475 with SMTP id
 f18-20020a05600c44d200b003ea4af03475mr11706547wmo.1.1677498972653; 
 Mon, 27 Feb 2023 03:56:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r23-20020a05600c2f1700b003eae73ee4a1sm8860204wmn.17.2023.02.27.03.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:56:11 -0800 (PST)
Message-ID: <48a7a544-a149-eaca-71d4-f05d58e84922@linaro.org>
Date: Mon, 27 Feb 2023 12:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 09/12] hw/i386/ich9: Remove redundant GSI_NUM_PINS
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> Most code uses IOAPIC_NUM_PINS. The only place where GSI_NUM_PINS defines
> the size of an array is ICH9LPCState::gsi which needs to match
> IOAPIC_NUM_PINS. Remove GSI_NUM_PINS for consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 2 +-
>   include/hw/i386/x86.h  | 1 -
>   hw/i386/pc.c           | 6 +++---
>   hw/i386/pc_q35.c       | 3 ++-
>   hw/isa/lpc_ich9.c      | 2 +-
>   5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


