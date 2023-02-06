Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2A68B725
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:14:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwd8-0007F2-Qk; Mon, 06 Feb 2023 03:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwd7-0007Ek-5z
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:13:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwd5-0004De-Hr
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:13:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id h16so9503245wrz.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qNb/+AfMQDxEHzS4d4py5Qy9gK3cNQ7mJLJN52tqhd8=;
 b=XnPZikqSgr3c4fHT+XpaGWp7tubb4eHyXj9MJ3alGhL05IWR87bZLr1hRaIZHfBFNU
 DZd8qj313W+AdOdZ/Nvf98vchpm2Gy/sVcgLdFFgjzzqUpBIY0FO5eo1dXRbYaMNnm/P
 fnEPYSDKux9nZbgRE6EWT7IQHmhI42u3zfhabS8+8MYERuIzkTfUcBwwMRCDyeiqwPPK
 X55xwZ9IQrDAv3z8jf30Wck5/EBSYVHX7WcSrmNh2PwPaRPJlm6SeD0KJOkggPPWmeUy
 z+rlDumK3QK/BJjR/0NcOeexitet8zawhiOqSkFS92Lk7jGIB0NmJgGPL+DO5VWcUzmf
 82Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNb/+AfMQDxEHzS4d4py5Qy9gK3cNQ7mJLJN52tqhd8=;
 b=TQNSfttcsxJk/X266m8rJHuioqzLuTB1RcqRpN4lO36VHSXp4jUrept/buI4S5YP9+
 gITMd9COl1vmEEt44rOCuy3hcdIZB67vCT8r0Y1D5AWm/SLHVMmOpzyMsQF3GgK8a9WO
 5RC3AyuT8EmUznNHCrNcXovm3ARlj8+m4A60TcQ6INiyc55OeA1AxAepqTFhc46nH9a5
 uDDtmAE1YvsYB41vn3a6FjIxkdALoNF9PLEyJiA8Zb5MTQHklSMYMsWh3MA0uGDS7hND
 IWL6hz459MpisPYQqhZYRnIAc2sfOuzuwuItkMGI2Yn3A9Vmq/CoQ/8p2By2TzpDdG3Q
 sjtQ==
X-Gm-Message-State: AO0yUKX0AQo6fRN/AXx+kuq0rDsW5qpwfbX6lQ9+1n90PrIDo8Oazk/h
 fsCP+tduG3JNGnK9wXjYPBqFVw==
X-Google-Smtp-Source: AK7set8C4ObNbZyy3JgdIFXrtHiMj2zQx2i17TbLGHdc7Paw8hAYxeqe5h+GuO+eQwg/O+I9XZAEOg==
X-Received: by 2002:a5d:514b:0:b0:2c3:e88c:d80c with SMTP id
 u11-20020a5d514b000000b002c3e88cd80cmr2052048wrt.44.1675671214071; 
 Mon, 06 Feb 2023 00:13:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bw17-20020a0560001f9100b002be25db0b7bsm8276470wrb.10.2023.02.06.00.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:13:33 -0800 (PST)
Message-ID: <83359feb-bcfa-31d7-e116-36f509a7abe2@linaro.org>
Date: Mon, 6 Feb 2023 09:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/9] tests: fix test-io-channel-command on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
 <20230129182414.583349-3-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230129182414.583349-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 29/1/23 19:24, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> socat "PIPE:"" on Windows are named pipes, not fifo path names.
> 
> Fixes: commit 68406d10859 ("tests/unit: cleanups for test-io-channel-command")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c | 6 ++++++
>   1 file changed, 6 insertions(+)

This doesn't apply cleanly on top of c906e6fbaa ("tests/unit: drop hacky
race avoidance in test-io-channel-command").


