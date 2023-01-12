Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616766726C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwsk-0002eQ-HG; Thu, 12 Jan 2023 07:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwsV-0002XF-AC
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:40:22 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwsQ-00032d-Fw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:40:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id bn26so17980740wrb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YASqFIoDPo1KM5ucsNFvbsjrcrVOOaKzqBqUIt6ySV8=;
 b=kn+l3zxbHGf+v3F4xh5G528GTz/YgApFYQ93JTVnnYKcIQDCCiH5+RWQJOIxv33S3X
 7n46kAjAVHfCQ74qEzy+QyauVROrvykLzrafKJhZguJS3bNMbMv4mSJY+EoEnhR6Esyn
 9CNAD9cfnO07mMj6oC34htOgKxF04iJre0Yqf7EtWAjk1wlvtgKszH15Y1/miPT5L8p3
 //6JZK42jq3yfMTFXW2hZfF+UQSUmY6/hutigr4OpnYartg4rgeAV64mWfv74nfbF3W3
 AHW4YcvKsGxHb0hrwThxAQIPkh7uTZvHMnf1qtbiUC2KAqqf7P7rIgkdMpB6wAETK4IP
 Ws6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YASqFIoDPo1KM5ucsNFvbsjrcrVOOaKzqBqUIt6ySV8=;
 b=4P9/PH6Wt/a0P3kM9HpI3EKnOZ/IN9NwGZtAcOlpbOMHWNogKhRMmMUQt5x66NqBYd
 +08X8IXo86ZLQcf9c5wK1o/X/ofKCNCJZq1d49HB4Qufe9lfImNqhnrVN3BAJ2tF2L6B
 lGSC4ooysl/HqS9ltBrwIp3qepFCSanohLO7a6XPY+/i0pUYF4dMmzYj9SFr4PymbH5e
 lioCVX3jr6OiK68qoc9ApTFalkEalPb7sNTBz/oTPX/1asHeG0ac8HqC/Y0PiRtw7OYT
 ML0SE5DqEmAnuoAOKD7aCJBUaIqBKizXspod+T0CilDkkgM9NvI+TLWP21djl/kC2F4B
 t8Ig==
X-Gm-Message-State: AFqh2kqgVRNeSRQJMQmyhz8qp+gEr4aUSyPoX0zOSWQP5oBQg+w6TPzT
 z9S0UtivoK8D9Del/kEYXfVz5w==
X-Google-Smtp-Source: AMrXdXv36nBZo5Xscouo7BVSNb7fzaYDIbHWXrqI455lqnYdgemLlqrc4hQjJfuOwGtOr44brUXVGQ==
X-Received: by 2002:a5d:5082:0:b0:278:126d:60fe with SMTP id
 a2-20020a5d5082000000b00278126d60femr39790264wrt.10.1673527210993; 
 Thu, 12 Jan 2023 04:40:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w8-20020adf8bc8000000b002bdc39849d1sm4084526wra.44.2023.01.12.04.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:40:10 -0800 (PST)
Message-ID: <5c7be172-2736-4d85-8945-588611b5ae13@linaro.org>
Date: Thu, 12 Jan 2023 13:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 09/33] hw/intc/i8259: Make using the isa_pic singleton
 more type-safe
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> This even spares some casts in hot code paths along the way.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> Note: The next patch will introduce a class "isa-pic", which is
> shall not be confused with the isa_pic singleton.
> ---
>   include/hw/intc/i8259.h |  6 +++---
>   include/qemu/typedefs.h |  1 +
>   hw/intc/i8259.c         | 11 ++++-------
>   3 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


