Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EE68D300
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKRq-0000vC-Ot; Tue, 07 Feb 2023 04:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPKRd-0000qW-FT
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:39:22 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPKRb-00068K-NA
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:39:20 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h3so5069809wrp.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ohfAvwBASale/c7JyOZ19VF70Q/GJO+/UJQZvNYi/XA=;
 b=H6BuGQlu0JZAcRygE7rHTMuWiYeexTMb/XIBU7Ba76ukPowgtf90h+nDOZJAttUH/Z
 BuJhYbyWSwo8Op0W/F7U9V+BNMF4zosYYtyisT3lBcGJSr0G20Z9iLZF1fn2wuseuPNK
 B3r12VByW63M0lvm4SqdHt1W7yNdHRbT6Dc5bYOivX90TJOlVJCcyTsYBZ7GvcqZP666
 bDTpIcOR9x7fo3Age3nU8sfrvC39LCbOmAng1OAGOcvaFdXt0U3NcEKBzUUJpgdXHab/
 s5uR8ebg6eb3Oll04DY94CbGTG647vpoah3g9FMLG9XBTlzhLeBwHU27oi1tXtNMQmp9
 I0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ohfAvwBASale/c7JyOZ19VF70Q/GJO+/UJQZvNYi/XA=;
 b=k4tI6Ps0vgsG7jFSxKM57w/3lAMP1/Ryx4ujOzkgQRG6t6Jag4eFJpyZ4/cmRdVz2O
 PigBwCcuUghvyFa9tWQttqEUl9qZjfj3Z6wVhQtFdkCo8GUFBB+ABhdFPod5QBrOe0VH
 LjR9gjbQVAuttx/jRbGKyYTBD6Hv1YpYQB173WTQ4U+a2qJQ9hIFdTpfQBQnFu9CGJvS
 O6jOGEOHSHbiZi9RHC1qNAkwqTKvE4Wv/2uIxGCRbGa3jPzY8LhUw1DyXOTHf6vz+E7X
 hnjriofEEkgGq8O91DHaD1r0aW8hA7CX7kngWWYd6+TIQ3z5H7D/HcXyD8MY/Gh032Uy
 ABgw==
X-Gm-Message-State: AO0yUKXzfFwyg0U2cXtBML+vKOOkBqKSEe4HCmfAVCXomE/oeHfVCUvI
 AbAoMBxUslPu96Y+AlzqOfjvpg==
X-Google-Smtp-Source: AK7set+VgPew//IjrO4itmBR84ZqJ658CRnZCZBE+iOxcx1aZfHtw8bRdG7hW5M6ZR2Azv9jQUTyzQ==
X-Received: by 2002:adf:ed11:0:b0:2bd:e8b2:4da8 with SMTP id
 a17-20020adfed11000000b002bde8b24da8mr2016683wro.35.1675762757831; 
 Tue, 07 Feb 2023 01:39:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i11-20020a5d630b000000b0029a06f11022sm10684239wru.112.2023.02.07.01.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:39:17 -0800 (PST)
Message-ID: <67963ba8-c3d3-f0f2-43d7-e4227da96626@linaro.org>
Date: Tue, 7 Feb 2023 10:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] char: do not double-close fd when failing to add client
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: armbru@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20230207093544.1067685-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207093544.1067685-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 10:35, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The caller is already closing the fd on failure.
> 
> Fixes: c3054a6e6a ("char: Factor out qmp_add_client() parts and move to chardev/")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   chardev/char.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



