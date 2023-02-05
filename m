Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919A68AF7A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOd1m-0003eV-3K; Sun, 05 Feb 2023 06:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd0z-0003as-1U
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:17:26 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd0w-0000HH-RW
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:16:56 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a10so1995167edu.9
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LbUJRzKVzG9jIEGko/QYf3ZEh7EyE8+2AKE+759r7xI=;
 b=Xth4IUM4lpPV52SEgUvb5nPOeT0thMbbRs/7tjhQncaaj/Ox4ZzE7hjiBUiB3T/B15
 bWT3VIEnz5Iuvlrv9g4VEKLkUHbiUMd91z4C3GMXRLJ6eddZ4rBD3XN4sNa9LBRGKeWM
 3lsTMu/YbjAcnfNyOiTsQ/peB96RtjMSAxvoEPBwSw8UIqLTHB5fZ6QNUI23SsNDefFL
 4jHcMOlNX6ICC5NSqp+fbK9o+PhBb5Lz+qYXx5ESLV3V6ZWeDEspavfek0vm7dXkZ0vV
 t8K/Q7b84xO0b94Qr5RW9J7jWiLVDBenN9LVRYcaiNiBgbcEm3e1O+6YEIIG4+FEcQlB
 wdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbUJRzKVzG9jIEGko/QYf3ZEh7EyE8+2AKE+759r7xI=;
 b=1OLEa4Cg4tAKKsB+mja7PSVUAcIqxmRtdbI3pnVRJGZ1avnIIwdTUy7aOpEoU9oSDN
 rQ+lPkLO+3yjNviOd7GFRR2bcYkKyy6ee6hDhYyxmKg6mmJ+csG157fJsJKts9a/whoV
 nfh8v3SL2aH9rGiYyWV4GdCohRaX18IOdW5+GPb1M8QIQ3tNP1qF4gQbqoIXZi6A7SIA
 k9z4poqqGItWMdWBf1eeIb7J+A6US0yfJMiXBQfwgHMvY7rXue0IEQFm40FxjHXkGGBV
 kvw5kRH/cc06FKRM6qTfvT2oSllnQHjqy048aRxb9ZiJLl3gZ9O5lsUwsoUidygSetv5
 zjLA==
X-Gm-Message-State: AO0yUKWHWAYROPBd6jnO8rAmdKuiJJhpuyTRLEMjHGYULgk6giJOoVRn
 0AikkpPYjA2ndMPKVbhkhr4Kug==
X-Google-Smtp-Source: AK7set+5sxNO1G/Se/7+Aqz7/k0dZER9PNsfuUjAd5fmbLcUjEBg7kFbtEJwhxEgDXUgXry/Pviyfg==
X-Received: by 2002:a05:6402:3488:b0:494:fae3:c0df with SMTP id
 v8-20020a056402348800b00494fae3c0dfmr19465452edc.12.1675595813014; 
 Sun, 05 Feb 2023 03:16:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 er18-20020a056402449200b0046892e493dcsm3635375edb.26.2023.02.05.03.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:16:52 -0800 (PST)
Message-ID: <c92da8dd-6225-fd24-2ee9-935d779428b6@linaro.org>
Date: Sun, 5 Feb 2023 12:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 7/9] hw/pci-host/pam: Make init_pam() usage more
 readable
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

On 4/2/23 16:10, Bernhard Beschow wrote:
> Unlike pam_update() which takes the subject -- PAMMemoryRegion -- as
> first argument, init_pam() takes it as fifth (!) argument. This makes it
> quite hard to figure out what an init_pam() invocation actually
> initializes. By moving the subject to the front this should become
> clearer.
> 
> While at it, lower the DeviceState parameter to Object, also
> communicating more clearly that this parameter is just the owner rather
> than some (heavy?) dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/pci-host/pam.h |  5 +++--
>   hw/pci-host/i440fx.c      | 10 +++++-----
>   hw/pci-host/pam.c         | 12 ++++++------
>   hw/pci-host/q35.c         |  8 ++++----
>   4 files changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


