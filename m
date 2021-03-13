Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06233A0F1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:16:27 +0100 (CET)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAgT-0005HS-4W
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAPc-0002Gu-HY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:59:01 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAPa-0002by-7B
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:59:00 -0500
Received: by mail-qt1-x82b.google.com with SMTP id s2so6498275qtx.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UNHufHh/ho5CKjMBqY2Qko3CqnRJV5hBbL7veksSQX8=;
 b=y/i0I1HMLbt/AYaYtxXnSdkSDfZMFeBVA+0m9HAmMp3H2g89rDZFHHBs0VdNZizUy5
 TZFwuRglQ3AjTfxHoAw8Sz9s/8d6sfA78OBYx/gtOmA15GF4jLCYnvJPTfQVb4L33Wvw
 oM5YQaFres+YLb01XXsQbFGcXqt2XfoiNqw3h31hHU/n51q/FiAqWb+AzBtOmg7qSjL9
 6wEsE+K3jPIJ6ApEVAsQAynVGChu21TgSCnFDWi1lreALxxVt/F2E484Xew2t0XknoHS
 0H0qD1K2alPeK2gOah/bCU8375ji6awpCxVzMI+3QJqJ07rrZi18e5+lZX9C7wBOQ86g
 oyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UNHufHh/ho5CKjMBqY2Qko3CqnRJV5hBbL7veksSQX8=;
 b=DnL4dqq2tey+cyVHqHw12qOTFeKrlpQL6q49KMiqpakxO7hNHNGfPMZpo66aeKxyI2
 1JaxuhUyqmGVkJlD8mJGD0fjbWbgGdHmO8ftcskSQ7le46N0EOVRFoTmuc3dw0lXfffn
 jS0GrmL1KzymW5fW8fJ8+dqMBPyTbPebdILGvQqId9RkGElfCqr3FKK+i/ihRAqZeLMi
 qLeedGWlBNlf7/OBFyNQgvNM/IU5UuEb02g4hpbGzSAOOExbL9f/5ZUuSrXO5swCwzgn
 93rPxVb27QToUI0JMZpS/zD1BifMOpfC7WVjxbDM4q9be6gkmkUXJEYvIz9nGBUF2/16
 jytA==
X-Gm-Message-State: AOAM531a/mKGs687YpCneNpLdGA69lXo9LBJJydUa9KThVhEesXnEuU4
 Aq/pfORC+k755Cmg3Z8PX3OS1w==
X-Google-Smtp-Source: ABdhPJxNe/BbkOALKXU5gkNnG2gZC0i/3Pc7aSsHNtuJt1O+S8+GTEpxNI0r0v88ww5SlmWaSf/OEw==
X-Received: by 2002:ac8:698c:: with SMTP id o12mr17362120qtq.340.1615665535872; 
 Sat, 13 Mar 2021 11:58:55 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h16sm6551983qto.45.2021.03.13.11.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:58:55 -0800 (PST)
Subject: Re: [PATCH 05/11] hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b72e6f78-361a-d4bc-2c5b-faf982db173d@linaro.org>
Date: Sat, 13 Mar 2021 13:58:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> +    if (s->id == UINT8_MAX) {
> +        error_setg(errp, "property 'id' not set");
> +        return;
> +    }

This error message would be a tad confusing if one set the id to 255.  What's 
the point?


r~

