Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9163EA33
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dmk-0004zQ-Uf; Thu, 01 Dec 2022 02:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0dmV-0004x6-B2
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:14:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0dmT-0006uB-Od
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:14:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so1235963wrm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xmyi1yPErCZIkACJgDHJ1l/Cb7zBt6YNKB/IihJik+s=;
 b=EGOzofBP3fhlgkySQwBXQhv7+82Cu8iURLdJaX29otbL9IMV9xrxJDJ9Z6bmG6cP0i
 aledq/B5HT9kniuzQstaUEXV5ZOC57mhzyIxzaPkTuQZ/pTBxTmJA9ScfND3W+kuQhGw
 i1tLjvxgkYMDfoeQI9JVOFCuim4IVCV98pGAeq95+ZDncYo7WNEdCrft4bZ4gEv1PxYD
 IvyC/mUM2IDgRP790cUBeIeDtCkZ0jFUtRhlrItBpfhOriqiq4r5CVtZmEwh/60OAuDE
 wKKFa/pcitIiY8eRDw9KmQ3ElPAy74sylKC2kZXq5LCBCZ2K1egzI1/YuxUwThVEUQYz
 8YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmyi1yPErCZIkACJgDHJ1l/Cb7zBt6YNKB/IihJik+s=;
 b=5Pr97oCn6oaGqQlJj3lTd6Q/dtSA6XcgtgwxdX0mhSMPTKGcn3Q2t4D1m35aPOgJ9A
 w6PaI0Mo1JfCfxf0jethcVMqJzIe1lrN7n0Vw3/4kvELn5gNGQ4fr3U4WZIJOAmNuzTG
 meCeGnxkoiHdLEoRopjDEBgj7cr45iyEbkwcpNsyG+ZuqDsMWfkjSvYRxWmiPHsxnFjH
 VSUGo6jYko1vIXQQp4Yy5uPvZjCmkMcNQWzGSPezLuPhSU2Ve7lDBwDsDhefbCQnexke
 NwZnQkOJweQtHzexx9ASgajY4rug72u+i9EfBrxJr5YYxgwU+KKQ5J52M3elTz0e4wSP
 sedA==
X-Gm-Message-State: ANoB5pmaze0OOHfzFrmhhV8zUqp0T2v/6p4wJaePujRdcnki7BJhc/vv
 KmCme5241l+10Wp1spokO8PBkw==
X-Google-Smtp-Source: AA0mqf7QGl0OGKNWcMlEmQzf0UnpDyOA6+rutTqirxwWEWbMrXSowt4bHMEKi509qxMVs//yI9wwDg==
X-Received: by 2002:a5d:4f8f:0:b0:242:28c6:2373 with SMTP id
 d15-20020a5d4f8f000000b0024228c62373mr5224741wru.292.1669878887261; 
 Wed, 30 Nov 2022 23:14:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c41d100b003cf71b1f66csm4119779wmh.0.2022.11.30.23.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 23:14:46 -0800 (PST)
Message-ID: <362ce92d-720d-9013-640b-6edb008bd075@linaro.org>
Date: Thu, 1 Dec 2022 08:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 6/9] ui: Move HMP commands from monitor to new
 ui/ui-hmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-7-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221201061311.3619052-7-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 1/12/22 07:13, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "Graphics".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   monitor/hmp-cmds.c | 342 ------------------------------------------
>   ui/ui-hmp-cmds.c   | 360 +++++++++++++++++++++++++++++++++++++++++++++
>   ui/meson.build     |   1 +
>   3 files changed, 361 insertions(+), 342 deletions(-)
>   create mode 100644 ui/ui-hmp-cmds.c


> +#ifdef CONFIG_SPICE
> +void hmp_info_spice(Monitor *mon, const QDict *qdict)
> +{
> +    SpiceChannelList *chan;
> +    SpiceInfo *info;
> +    const char *channel_name;
> +    const char * const channel_names[] = {

Can be static (pre-existing).

> +        [SPICE_CHANNEL_MAIN] = "main",
> +        [SPICE_CHANNEL_DISPLAY] = "display",
> +        [SPICE_CHANNEL_INPUTS] = "inputs",
> +        [SPICE_CHANNEL_CURSOR] = "cursor",
> +        [SPICE_CHANNEL_PLAYBACK] = "playback",
> +        [SPICE_CHANNEL_RECORD] = "record",
> +        [SPICE_CHANNEL_TUNNEL] = "tunnel",
> +        [SPICE_CHANNEL_SMARTCARD] = "smartcard",
> +        [SPICE_CHANNEL_USBREDIR] = "usbredir",
> +        [SPICE_CHANNEL_PORT] = "port",
> +    };
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


