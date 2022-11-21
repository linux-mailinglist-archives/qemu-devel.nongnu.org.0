Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94706330F4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 00:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxGUF-0005bt-It; Mon, 21 Nov 2022 18:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxGU8-0005ZJ-O1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:45:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxGU6-0007pg-LE
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:45:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso245428wmb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 15:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2XZ93j7xRtjb+lGkxY7RnboyYWFgDju15W26jQXLq4=;
 b=KiFqwk6bxKxpJCKtPVIDQ3Jmsw0cTdRUFJSqB0RmIjM0lfhnO0ceFqO46/mKDn69nx
 92nH9XMrvQ2hK5j0WH52nJBtvXRUM2a1zsLRkDL/vPxoI7u1VHREoaSYQMosTDxRChwq
 ot8QQGvuTElbq7ouZGcCkhy3E+RGg75kqL86/w2ajfFdxhTiEbR4D7HLgo0YxZHX/09i
 Kud3qQOu5l7SbGtfC+kEW750dBpd7semzadYMbbFNGQmQT+XY0D6rnQ46UMKvGfLVMrh
 DEjoas2CZ5Vre9ZK53c/WI4xoOuRFVBgJy9MF63JDZXIOsEk0OYfrPVO6wbAofVYSmev
 ac+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2XZ93j7xRtjb+lGkxY7RnboyYWFgDju15W26jQXLq4=;
 b=TRtFpj6X/sGfUjk6VYO5MoGenO8obbqGu2ZW793nhoerNwLlNQB/CtlBScoBKEaUsr
 KNFf6bw8taOd+R0KSfFFOoRKpfd9wtUzvXX8Kp8KMc5dKn/zUjIqHgIE7ggpShqF477y
 3b7EKYruIj80iqs78He+MpIVkDZGRKVi4EbvVAWNKn0LB63hH7F6zR9NZm6L+IMSn06A
 q+zQqzR0v3cRurdZMPCf4I0TShMXTm45Ge91TMyusR/UHDORYlCM7JBU+6DHJJ2Y87/X
 S+t/JoVJolk9VXt3wrtXsImVZE4ZsIrb3GeEPUEiqevoxJ4agTMuYUjr7DsdqNxgvwSU
 IHgg==
X-Gm-Message-State: ANoB5pk9yogSfBckG7417/BD6+8lgwL0gu/TKUAsR4AM19VRidJIHa/4
 lYgkhyJYNlqW1MucbHmPueIh1Q==
X-Google-Smtp-Source: AA0mqf4qOUj6Wp1Bn1QOimMZKbX/gGY7TUCHNioJE580lF9iTFhvNLKj4GinRIcStG6inPYQEH/8Sw==
X-Received: by 2002:a05:600c:4211:b0:3c6:b656:5b52 with SMTP id
 x17-20020a05600c421100b003c6b6565b52mr18014508wmh.1.1669074352407; 
 Mon, 21 Nov 2022 15:45:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm411744wms.0.2022.11.21.15.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 15:45:51 -0800 (PST)
Message-ID: <87706e12-01d8-2cad-72d4-95e3eca9c8a7@linaro.org>
Date: Tue, 22 Nov 2022 00:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 15/29] include/qemu/int128: Add vector type to
 Int128Alias
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Adding a vector type will make it easier to handle i386
> have_atomic16 via AVX.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/int128.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


