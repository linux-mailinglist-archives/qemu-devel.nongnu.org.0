Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE92299518
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 19:17:25 +0100 (CET)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX73c-00031E-Nc
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 14:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX6xd-0005tv-O5
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 14:11:13 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX6xX-00079e-Mt
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 14:11:13 -0400
Received: by mail-ej1-x641.google.com with SMTP id gs25so15044372ejb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PZrXk6W7mQs4ElV2C5DAdWPjGnR8Jcr+ipn/INYEJI4=;
 b=LWT6fGYa9l/a+rIM0FaxT4Xbdh/KQoBdTB3EpKnlNa1d8QW2HTgeEIy8La4GQKR9Zt
 X9xJHa7Yuh1vuMv3xaPfJ1IzNc6L0C75gDQbyktoA9a25yuHmxrbtibPHCQcI8xYh3RY
 jmlORsINEsnBFNs8F5t906wsDR7yVSRakxEXX40Oq1lNPdWn1jiSytUIZuZ1bZmorn/w
 F+UsFG5dX2FiowxfIlp2L/ghBOW2FHoiGxQr7d0fjwr52iLFOuzLb8/dNvOgchOsfuSM
 3jaLFGhIj1kUyW8yRa2Aqw5OoFpWoRAXnmKOTEFpgJlXUk93RMJXxtW1PR6oL9sX+KM1
 BKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZrXk6W7mQs4ElV2C5DAdWPjGnR8Jcr+ipn/INYEJI4=;
 b=AtaVMgDEpI6gEDBJMqpZFuvhVWb0LIA0MW89c8dcDvBmpOQ26VcIqZVVSGEzQIZwvR
 MjjnqjmUEmqAJfmN0s7rwxLkcEvQx+Rrhoe9ZYZ5GSzxmweyLPfOIqkHSnfi70dXDK9e
 fbqoQBYyObeuNDx//CEUB8yg2wB18EqOgLFK/HJ/pifKfSQMNBHY1Zz25sIgnwKn1yUh
 Qjo7CNhxldejKyKlmnJStzAvMiMgOVlfWgF2HmkVb002wN8NDENyFfRV4OVeluNbX0/z
 t5f4KIzz9G1DGzMkyXIi7eraKEQVZJjx8prMpFrxRKf4qppbVJNFqxCiK6ADIDkbA2g0
 OWJQ==
X-Gm-Message-State: AOAM532NNcTK5pW56Ee37dKityhHy3MsO/1V5GjSmnTd/p7CZgpFTTHk
 IYXM6Z0IdvytZfTV5wZAykY=
X-Google-Smtp-Source: ABdhPJzHwYNW2gsA17pMNyejBfj9IhEWVZ/9+Q/b6MTuhQDto9UQJYNmc2iaaWEx2v9ZGJnS28LJCw==
X-Received: by 2002:a17:906:2b44:: with SMTP id
 b4mr12253392ejg.73.1603735864203; 
 Mon, 26 Oct 2020 11:11:04 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id ld2sm1051786ejb.94.2020.10.26.11.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 11:11:03 -0700 (PDT)
Subject: Re: [PATCH 01/15] alpha: remove bios_name
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b95222d-a335-2589-375a-7b0f0621d5eb@amsat.org>
Date: Mon, 26 Oct 2020 19:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026143028.3034018-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 3:30 PM, Paolo Bonzini wrote:
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/alpha/dp264.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

