Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DD6C15A5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:56:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGum-0008Os-Bu; Mon, 20 Mar 2023 10:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGuk-0008OK-3H
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:55:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGui-0003Nx-9p
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:55:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 ip21-20020a05600ca69500b003ed56690948so7272769wmb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679324106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Clz2vBdyjfvAKMJdE/BgBADTiCIjIA5khDw7jInjbxw=;
 b=rimjBQ630FZ+w69hrUPCFDWm8cOUsY3LDrs/OfKu9zlXNMLOJZ6r+ERm/K9LlPTKV2
 5KIh+c+Y8UpsMylknrbkB2Cdkvct1K5wqwFs7bwOWVF9zoogDppU8oNeeHZ05FX27+XJ
 lLxIDWc7qScPqXVeBI9lliia+zdEZ1nIlGr4E+4RqspHncDRsxGsWuIEgpXxXwUvEV1d
 a9WRMEfEpvprheRxYX3lDsxzewm5oWxmycENY36NnZ6LDhGDRHa8AyoBLW3Hv37UBG71
 8GGXSTR+OGH6XRqpacLdyrVhvyLqGLneTeM9AJ4u7Cd4T7+AEyMP82pl1W34t0m+6q/W
 aiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Clz2vBdyjfvAKMJdE/BgBADTiCIjIA5khDw7jInjbxw=;
 b=Krh4jswewugWJZBKLIWtj+MSX7U85iUYNM2TwalySOSrk5SbCTQlFvOoCPOXNqCWBt
 RwjIMsWlNmmTUKbd7fx0tNmniYgVFYvW6MuB1T8J0bY6qZY65HqUOivo2EmYX/z7RQio
 DRbizBPLV12QyaNHFivJkqKxKCJrzAtBlU21JzEuT2beHLWrU4vLmwcD3IWdILd0bJ3W
 beSqs0YD5l1cXBPzPLe4XJboU8NWoSfvKwBDF7ccSWpBsW543ZepCG0xD9N3GT/3SaUA
 BorJGLsucqIMTQOoDvnJbuptq37I6ho0NcmxyexERrImlJbzX8a+yJttgUgxwL909Fip
 pBsQ==
X-Gm-Message-State: AO0yUKUCRoduBXXPzdBOrDvx5vNwht9leOhLaWS+R8Js9hvlKWwHVLsD
 t0Oy1GRrQsHvH54JcxZTAas5Aw==
X-Google-Smtp-Source: AK7set/wk7J9BvJIGd8Jdy1bwqOAPJwbPoEIWjXBTC84sXv6teMG5qg80MJnkCA9QqDSElQdBcz8GQ==
X-Received: by 2002:a05:600c:4f89:b0:3dc:5b88:e6dd with SMTP id
 n9-20020a05600c4f8900b003dc5b88e6ddmr35304445wmq.10.1679324105974; 
 Mon, 20 Mar 2023 07:55:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c1d8b00b003daffc2ecdesm16633487wms.13.2023.03.20.07.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:55:05 -0700 (PDT)
Message-ID: <0f9c0a98-01b1-f947-6526-21b6aae06186@linaro.org>
Date: Mon, 20 Mar 2023 15:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 07/10] accel/tcg: use QEMU_IOTHREAD_LOCK_GUARD to cover
 the exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320101035.2214196-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 20/3/23 11:10, Alex Bennée wrote:
> This avoids us having to make sure each exit path does an unlock.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


