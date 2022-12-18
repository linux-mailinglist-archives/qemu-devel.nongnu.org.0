Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC665042C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xP5-0000wX-J8; Sun, 18 Dec 2022 12:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xP4-0000wJ-4O
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:24:46 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xP2-00047M-M5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:24:45 -0500
Received: by mail-ed1-x535.google.com with SMTP id b69so10041709edf.6
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TS+HXrcwMXHSzcbiz7zD2o3N56QwcOiFT97lmji7Klo=;
 b=WOde7QKJd/ya4khtpYNpBCvuvgAsNbaege1tmebkPR8pfT0zlI2hk4UhR2JkXg/JR4
 PXtiXElUJZDPBsbrsKyfsRLSxdr3G/1aXJgvuYwHwk9zTp6G4fBh4yBRmqScFygT0AiR
 bAcSoJKwinTN/LINmeC5qVs7SJ29PiUj7kzWVusb/gvStJako6r9R5tEAmjlTZD2kJ1K
 5G46v/Tx6TixUrEQqVOyXepsVZ20Vw/HvbIZeukera6bmLTY9Z9iWZ6lH24uBUdU+xm/
 3B6+knvjhcBtE+LyvVTXYEaeodxQpz1SmZUkPFKBXds94crl7B1RXjqzfE6AzeQluPzh
 NmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TS+HXrcwMXHSzcbiz7zD2o3N56QwcOiFT97lmji7Klo=;
 b=xqpAtuGHpkYgUj7hEXyDvcduuPs2rRdEkDfJmWYaIgTbIVw73kZa5c56J776DPZZwx
 3RPWnTT76l9HccYQpmkL9c08hEcHppQHzB89A8i4QzmCROnddT3EOPfI9P2bGWSzTSwO
 i7VlRCdXAMl+sDCwpiRqIRQZ0EDs7TWtzp/O5fLLx5SxJi20EIZ/8w5FeF3yu9muAn5Q
 14GFLijF/NDQHRwmXk56Z5lufW0xJnqYAr8N5KkVXviIQ4GlMXJW3nSDa6jGj3p2OTjI
 KDtr0QXMtRpdIPH20GgFn8ZKbbTjR1H6uNQrPpktxe2Vpn1qjWiQs7YoC4a7KynJ89Nv
 isgQ==
X-Gm-Message-State: ANoB5plWFf34KWziydikC196Iv5/b2oEY6emEakGLV99JBcdmP98fHWe
 cGaJqgghHyMDHr4c2x6D6v1eYQ==
X-Google-Smtp-Source: AA0mqf49HDEoTO5xl1dHbuqjequRNdFI4i7nfeJ3lyS8BsOiIPGLa3fh04KbjrsXwbZPdxZ11hJJLw==
X-Received: by 2002:a05:6402:1213:b0:46a:be66:c0e2 with SMTP id
 c19-20020a056402121300b0046abe66c0e2mr33030805edw.28.1671384283100; 
 Sun, 18 Dec 2022 09:24:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cw14-20020a056402228e00b0046b6bc19439sm3359652edb.47.2022.12.18.09.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:24:42 -0800 (PST)
Message-ID: <f07e827a-0985-2ff1-eeb6-768b156bad6f@linaro.org>
Date: Sun, 18 Dec 2022 18:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 06/11] audio/alsaaudio: use g_new0() instead of
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-6-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218171539.11193-6-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

On 18/12/22 18:15, Volker Rümelin wrote:
> Replace audio_calloc() with the equivalent g_new0().
> 
> The value of the g_new0() argument count is >= 1, which means
> g_new0() will never return NULL. Also remove the unnecessary
> NULL check.

Yes, since commit 7267c0947d (Sat Aug 20 22:09:37 2011)...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/alsaaudio.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)



