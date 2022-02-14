Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBA4B500C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:26:49 +0100 (CET)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaRM-0000SJ-Fr
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaNm-0005zq-P7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:23:06 -0500
Received: from [2a00:1450:4864:20::336] (port=46033
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaNk-00028v-Om
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:23:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso6265896wmb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uxUnbg78ZAoHyzaz0hxCa/fEsyOjUm/mJHFx9sCjOlk=;
 b=oQHT1ZqdqGdsjbha2EoQYxKJ0NdJAhi//Cc+HXbUjn6QqnbQD683n8kWdWDSGhk8de
 5SVHE1Fsx7GCkTL623DasUDEYFsig20g8n66aAQYom2MJ5vj6sP4tM2Aj9+PK84Tou6r
 +uXs4OCjDyX5Kv/+LtDMmKGmao9lC9jGEojLxZSikx4mHMqZhRUSyTQdqSoj8xDTLUyh
 cJrGLVqfmM0YMXM3pQB1KkwPzxjL47qQ71g31IQX1Bpkr2TCsPaM0PIYCX8GRwqksOdp
 l+ZumLkpHJqU67pWat+03O4iUsnEZYR2IkzPEPKmmhVDyIr1J2WLll6ym4lLYqwnIvqM
 gFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uxUnbg78ZAoHyzaz0hxCa/fEsyOjUm/mJHFx9sCjOlk=;
 b=j5Ho8XObSuZVirMHYwJ/Qfl/d8L1gIY+qf8f4dNp0CqM7javEt6zbtf2VsBe0Jxd5k
 ncgxKDxP7U4NoPWnPZzg9jUwWniiXxdoQ3cM4VcLG4iofO+deCOcc9pYvQq/hVJUWQaA
 LDovZWyqu7AOSgZptYezkeDc+3BkYUC2VAwwkd2gZa21Z7Imr5fY4wZ3HCOYYwTh/z1n
 FfcxDhVi2l9spX0K73xAJKtmyYnJs2PCYc3sm412mZ12+C0oMalKOhArx9B+4RB7REkk
 rTiJfEF295+lzTm/u5eBZLBOdS/t7pCfHQJqgb5lc0C3MTM4Fep54z+VeJsGVv+qQssW
 G2Mw==
X-Gm-Message-State: AOAM5333ce/yPVNc653UzFhTmYL5RLWumjrZNf0LqhGWkVsnP9myp0j5
 YFiBRwbyItib7H3s6Pwb6j0=
X-Google-Smtp-Source: ABdhPJw2PTKhD3dtOkNFSiPXwhnvWBxvBfkHKEFLsP+2L55RSK9DtXSNLIOflGWZjwfDzmPh1uPoaw==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr10953916wml.83.1644841383401; 
 Mon, 14 Feb 2022 04:23:03 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id bg26sm13145201wmb.48.2022.02.14.04.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:23:03 -0800 (PST)
Message-ID: <22cb13d4-6bcf-9e04-954c-3062044a6597@amsat.org>
Date: Mon, 14 Feb 2022 13:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] ui/cocoa: Add Services menu
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220214091320.51750-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220214091320.51750-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/2/22 10:13, Akihiko Odaki wrote:
> Services menu functionality of Cocoa is described at:
> https://developer.apple.com/design/human-interface-guidelines/macos/extensions/services/
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


