Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B208650431
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xTt-0002Qc-8Q; Sun, 18 Dec 2022 12:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xTn-0002QG-CJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:29:39 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xTl-00053z-RC
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:29:39 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d20so10137734edn.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rW9GFJy5DO6m1C/qXYxtCkwqfsc+4xZJLi5lxmaCdPA=;
 b=AOhIiHHbYhrerbSmwB3VQJYoXiJFqZrkUmzK3jXYAkK32BB5KgGwLsc7GqfLMQHPO8
 V94kyGqgOpJrXFOMWZ+lFcd4gG7hSV2AFkyObN3/tXnJWBpnIs19hluC9QEdueN6LnL6
 7VUWljLFaMArxeobTfr7vd1AXcFhgZGl6vbCXZl9GBijhhHSt2eRkCxf0EAZ62B9ptvJ
 S1/5USAFPJH5Dz60UJA42fexI6OcSS/VkEtwBFelf2Izdlxg2CpTxmUOIOJFovLtRtIG
 L7Lr3FB6Xy1udpcqVFk0b55XH29h+QSP2gRYBFrZBNeVFdtDdQMkwC9x4y58zUm9sCy7
 95+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rW9GFJy5DO6m1C/qXYxtCkwqfsc+4xZJLi5lxmaCdPA=;
 b=F9BnaJyan89cNzRKXxvdd2QjzNAl9X3/Gbdg2rbwvCta5XuiNZ9ewCTl7dE64Wbpgq
 8geQ+XyQ6WfNJb+KE69i1hVDVPAw3o1SVwr+S6aQKQdGM8IuWprQtFLPgCfbcmBxWNFp
 D7jN5SSsbh6OQIk30xfu/PHTJ0mw9/rhALR+LWVDngbFYW/qWsx30CvegwhLvPK+2D34
 sh1wdme0+WE/ZI+nqUnoLNXCKuaD45n8EsQ6Em9Vgy+0uxzNS8gHRPHLcHIfEokYq+7L
 iJi0xBUUJb7AtjTFkM8Co9OH006xCytSa/wYQOPQ92VPmHsZyhDtzcdZ/J4Sc6hDJ3JW
 QT/g==
X-Gm-Message-State: ANoB5pmtLxRe0HGAs9WqNiM5ggknQ4kMnyqdcf4W4DNJlogb5cBpH1lZ
 Rh4a+QNJ6yuJwVeEqw68eS7sIA==
X-Google-Smtp-Source: AA0mqf5ro1KrTO9GgCn42P8Yc+ICc6zmv4CxgUJ4sWQIIQpuE5bQ3dfjNFopNNgVBH0gPivcVXA+KA==
X-Received: by 2002:a05:6402:e9e:b0:470:2270:c508 with SMTP id
 h30-20020a0564020e9e00b004702270c508mr22676756eda.41.1671384576139; 
 Sun, 18 Dec 2022 09:29:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0564020f0e00b004714b6cce2dsm3308480eda.20.2022.12.18.09.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:29:35 -0800 (PST)
Message-ID: <dc76e0f2-b2c7-4df2-f13b-b2e3d995d4a7@linaro.org>
Date: Sun, 18 Dec 2022 18:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 09/11] audio: remove audio_calloc() function
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-9-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218171539.11193-9-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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
> Now that the last call site of audio_calloc() was removed, remove
> the unused audio_calloc() function.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio.c     | 20 --------------------
>   audio/audio_int.h |  1 -
>   2 files changed, 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


