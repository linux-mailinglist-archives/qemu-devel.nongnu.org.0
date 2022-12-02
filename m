Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12F640465
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1382-0007XT-I0; Fri, 02 Dec 2022 05:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1380-0007U7-BN
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:18:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p137y-000105-K2
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:18:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u12so6124054wrr.11
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GcEhZ333Mh8juvji80lvYZQ4fx402XwIBjM2upvHdS4=;
 b=npSl0N8I2lyFBsEUqxJZ6ZOpWnSYiJtiy1xypmYxNdc+AI/Ul4dnnubIICqUYdC+ZW
 ly8n65CSjXN4la09ltm/fVNNe5ws+OyRMo7yV4OaDMvXSzyI36cCZEI8/BaWiVU7L1Xt
 WoYkLBxbOoh56ugRnbAyNQW3Pd0q7nc7bLCs/+k5Y+vZQ9gpYDmfP0tP+Al70W0LLWWk
 GpdrHuMjoxWdpx56+frEqo6Q2W3vMTKxLCH2K1XL1oL5+DU2+gOHNpKBnpYUZsXU1Kdu
 R3lKF1PEkhUPDmFYq6oLaZhMbSb9oVq0q78IbcETsT0I5Wxyyf1qMuA1v2otC70WEZZb
 hCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GcEhZ333Mh8juvji80lvYZQ4fx402XwIBjM2upvHdS4=;
 b=B13mBlQLJs6g26biXxB/nCQa58KKTpYLotFFDBm51Lwo6LhnehX+xSwyznPD1JrO3j
 Od1TRseVPBx+wH31syk9I5XuzqxNupp8srMZC65QLKmgivAYnlEXAeYFqkD7y8IMs5ET
 txjzQbAgBQSNxaPb5UYqm5nd2mO/1lnhqNA/yWSmeeqjndYkGy3Gi6VnGzrsYVS+mCZZ
 Sg6KyGqRl8KWQXrU0B7zCsg6kAaMzrsm9+jBQWzYtsMhLDDmKYz3DkXdJWbJm9wCutYx
 dyEB88hl0sgaCdN9SrxjKa2w4kD5fYZEJnO8m9TdAelZ+lPw7/O2fkSHt9kZBy+tvjWZ
 BWVQ==
X-Gm-Message-State: ANoB5pkX4GTyp26nQsMOgQZaZ+8swQP7iov80cMlQHQlFwTkShXkEikV
 ccI0zGuKMQWyjeLwK72FELF5gw==
X-Google-Smtp-Source: AA0mqf4FF5ZeoYEF/msNjJk8HLoZu/Gugc7hrFUloBYiYNhtBXiGsduypFDT1NX+nYMLAomFsYLrzA==
X-Received: by 2002:adf:f408:0:b0:242:39bc:4cf with SMTP id
 g8-20020adff408000000b0024239bc04cfmr4235647wro.187.1669976320715; 
 Fri, 02 Dec 2022 02:18:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003a3442f1229sm12985724wms.29.2022.12.02.02.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:18:39 -0800 (PST)
Message-ID: <7599426d-8415-d8f1-2e56-88636427d25e@linaro.org>
Date: Fri, 2 Dec 2022 11:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 09/14] ui: Move QMP commands from monitor to new
 ui/ui-qmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 11:05, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "Graphics".
> 
> Command add-client applies to socket character devices in addition to
> display devices.  Move it anyway.  Aside: the way @protocol character
> device IDs and display types is bad design.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   monitor/qmp-cmds.c | 118 ---------------------------------------
>   ui/ui-qmp-cmds.c   | 136 +++++++++++++++++++++++++++++++++++++++++++++
>   ui/meson.build     |   1 +
>   3 files changed, 137 insertions(+), 118 deletions(-)
>   create mode 100644 ui/ui-qmp-cmds.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


