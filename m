Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE1D644D15
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2eJ9-0003zQ-6X; Tue, 06 Dec 2022 15:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2eIw-0003xb-0M
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:12:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2eIu-0005mo-CK
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:12:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h7so19111343wrs.6
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 12:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b21kCZYNcLlcpKFzR6to4NENhy/7actJOSRGXVxgfB4=;
 b=SGPYhdswG1BP+l6ep8QSEkDeWvHOdr85MVuOKUFqrkQFSoar46OgoiY9ViU7Q3bwyE
 N3L7+EsTn69I2m2MzdnXMHQppZs1mjRgnJWHZvyHINSrxcEyxGWLmicGO0zET6zC2EoS
 3X7u+1eunUVWvVrZ8QezPlwMORpsAK8WDOBQG59S44jBXpodIC048kVAg/dk+9vDaZJB
 yC2hgn6jqT8ktEiYjBgUO+UhfMSvDBLNXespdjE7+9Cb0FHK50tCLP5yGPJI9dyUA9u7
 NX7FpzOqPDndj4LdPw6Uw60tNXjL8e+B1NOLWSfslb38kWcXE9qGYkEXHU/4VfJtYeVE
 3bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b21kCZYNcLlcpKFzR6to4NENhy/7actJOSRGXVxgfB4=;
 b=42W09reg4vn/lbHS4QSfvBfQBAyCx+GBK0iaItuV3rJ+PZuEsHaFC93JEI8A370vWo
 MXCKkhxcaA5NA6IDoP/0Nj2eWrBHLBOaHpKJLCSr+YGBIwSMptavQlbTEgAUamsRW2G2
 ESjmwy9aogwav3PrD1cfuH5fA4sC+5zXm+rCUKl/uVlGBGs0lKgAgHiZvZzknqSf7Ab/
 iJWctJH9kqNvDDMkOvfebs0PaqtssmSl3i+tZRKf7RtW9BOrUc9NgPcLbr8Q0MM4lbJy
 Yc8IlnKewFEMkc9GdRzFiE1KuH6WwH86PTn+MJw69AmL5dTrbMyXPwgQAfvzVdHIpsrq
 BB8A==
X-Gm-Message-State: ANoB5pmOYW4ruf0PF/2pHYArqCs00RJiUm6y+/biLv2mippab1fm00sK
 TVHtNwrmnZkMwRg+yGw0osnjbw==
X-Google-Smtp-Source: AA0mqf67QWPYz1hFe6TQPs6rowAPpMcljiCp3a5HUML3nODsEWKg0XVKld4En7br1V1rXGoSSrd3YA==
X-Received: by 2002:a5d:6b46:0:b0:236:56a6:823e with SMTP id
 x6-20020a5d6b46000000b0023656a6823emr53380931wrw.495.1670357554577; 
 Tue, 06 Dec 2022 12:12:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003a3170a7af9sm25640629wmb.4.2022.12.06.12.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 12:12:34 -0800 (PST)
Message-ID: <6fb5f423-cb24-6214-e776-e8c27920240c@linaro.org>
Date: Tue, 6 Dec 2022 21:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH for-8.0] ui/vnc: fix bad address parsing
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221206192334.65012-1-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206192334.65012-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 6/12/22 20:23, Vladimir Sementsov-Ogievskiy wrote:
> IF addrstr == "[" and websocket is true, hostlen becomes 0 and we try
> to access addrstr[hostlen-1] which is bad idea.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   ui/vnc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 88f55cbf3c..8830bfe382 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3765,7 +3765,7 @@ static int vnc_display_get_address(const char *addrstr,
>   
>           addr->type = SOCKET_ADDRESS_TYPE_INET;
>           inet = &addr->u.inet;
> -        if (addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
> +        if (hostlen >= 2 && addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
>               inet->host = g_strndup(addrstr + 1, hostlen - 2);
>           } else {
>               inet->host = g_strndup(addrstr, hostlen);

If addrstr is "[" then inet->host ends up being "[" too now, right?

I was pretty sure we had a helper for that, but can't find any.

