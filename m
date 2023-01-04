Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CA65E001
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCAG-0000ku-7t; Wed, 04 Jan 2023 17:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDC98-0000Xq-Vo
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:22:14 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDC97-0005gR-7Z
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:22:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id qk9so85858378ejc.3
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AC6dQXzHGoywu9nQ2ZSYn9ZLDwjXw+HWiNLFi59X4w8=;
 b=m33RbruhtecMiny0G4SbRkQIgPhnv0amT4CMTnbFUn04V//rBGr5LkrAnuJv6OOubS
 lQc52QLqIhl2eBFRvdg7v+havT8PCuTvGLwQq1Czr88SmuSTs73rMSt5IDkNtzhDplc+
 PTkJMFXM+ngY343Wcg+JqNO+Whdch5OUp87F1S25G/c5oDPyDbxE2aMDQIKvovSwlcXn
 konGIuB6WmXLHwtBWSyeUMhjAl2C4mHPzgHg0yuvarpF75DJqaOUn6E15nym671GJOH3
 lpbpGkdbsQKu7Kj/3qikktsGi6llyEtA/dt5XU6SRr91Gin7NPttizqErnowDVJov2m+
 9CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AC6dQXzHGoywu9nQ2ZSYn9ZLDwjXw+HWiNLFi59X4w8=;
 b=oAceuTyBgkxauqIrzlZwQ1OpxRDra6YaTgvUHZKM2u8PUdGXHbZA3pPe6Q5uvUqMbL
 MT9LRTUiHzLbkfhhqkFhXMfzIkYKrKKgZ3UPiKSJ4CwfOCJPj+qQMn9Wj5uu5DON6Uud
 uZhAvfcbISa3sGG7KnNMOVrz1uCDSUpsDuzPAMgR3QJfvUNfdLRpCx4bbxNGXb08denb
 MBVJO1BFeXCHRpTotMBL52nQFpZhYy5tgK5k3+cZZ/2NtYNQgt3sjNo+u2tOlGtzYU8n
 tw7j6q6ydQDxRNVMepSbqhw8hskp00fGnNMy8wTkz2Nr06+66cPdCJrvavkMbGif9qfh
 oqcg==
X-Gm-Message-State: AFqh2kq3Ex82S/b1QVOPQ8ihwXyK4yFM2pMRTD7vrn4SP3JfekcjtWej
 f9ko7nROyS5Lazc4iBW5Z5w70g==
X-Google-Smtp-Source: AMrXdXvdqWywV9ns8t66kRya6qZwZ9rxxgacP1bWeb+g7gc2p9iY54QSEAizao1/EDB0eDwP+oWO5Q==
X-Received: by 2002:a17:907:8d16:b0:7c4:fa17:71fe with SMTP id
 tc22-20020a1709078d1600b007c4fa1771femr45184955ejc.45.1672870923403; 
 Wed, 04 Jan 2023 14:22:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lb13-20020a170907784d00b0084b89c66eb5sm14166754ejc.4.2023.01.04.14.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:22:02 -0800 (PST)
Message-ID: <a159ca9d-0627-11a4-1c99-48a7aca958d8@linaro.org>
Date: Wed, 4 Jan 2023 23:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 07/27] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 22:58, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


