Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679166B9FE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLZc-0006Bh-1o; Mon, 16 Jan 2023 04:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLZZ-00066A-64
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:33 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLZX-0002CC-Cu
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id b7so798592wrt.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ts0+v2g6a9WlIYhl0xyu4Mnd9HfKJPQBTFknNaZ+Z7U=;
 b=PuQQqIOK3Bya/UJRpu/uVWgrosj/j8XpATXrRnG4CmsbBYfzUSQfn1t3kAi06q97Wv
 cv9hOIcVBJXqNOVc9fih/yedUH32Q0VqEU4VXfZTHlrn6Y868Hf9dI10vdneUhmCWrDj
 voxcvvdYg13bPx1EMSMKF0LwOLJiXJAmNpa3+2w7NJdnDfeneTuXyajYhB+E1h/YEsho
 y1aZvee7RXliitrEzoskpE1/6L/emGhkLFGnX2jUQliGopdAUMmNCMzvnVNd7JT341HA
 NS4Tk0Zip2rPlNW+x1S0H8Rx9xGbsPIUHw2JFLuPy5MgyaindqMkA0H/+7R8YSYNql17
 c4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ts0+v2g6a9WlIYhl0xyu4Mnd9HfKJPQBTFknNaZ+Z7U=;
 b=V+BxS8UpBl5X/kD4EGM9DMR4XjP7knTxcfzAUOMh8Wmhw9X1yytAfsRAwUsj7kH6dH
 WykPvZvvYIQMz8WuKjobpE9gdrtS9bE1ce9pO9cZYy+lyaXJyMnyhdbu1EvGUeKQn7Lb
 WLsUF+l9GueUzWU4kB/6sgqV71uphpCtOYaKBhMl/V71cCOrKq7FPgpdtq+UEDpIEOpz
 qpw0oYFsRXU6o0vjkhTsDMj8Ng+PizkwK56K+1s/QZ99b8GKnc4dl/kkzqxKvwypUaMD
 +hs3tRRgjcp8ZTJerznu6EnlljGAfOMfLb9Fjv73vFTfnCWXBF80i1CpPKo7OJkcn2Wo
 Iirg==
X-Gm-Message-State: AFqh2krfpwVYmAqCsR3k0kgsKOcaGE6YtGnc2jJXKsfOK+qHhFhwmq4n
 0FRadQY9Aua4rRvwdpXnH+eoNA==
X-Google-Smtp-Source: AMrXdXsNN4UzrmeJckr/jSERqrsx/RZg9DZzFGY1Wv1ZnckM+gZseoSe7UwRLGWyeSu3fRL1ZrQ6Bw==
X-Received: by 2002:adf:da50:0:b0:242:6777:bfa0 with SMTP id
 r16-20020adfda50000000b002426777bfa0mr60781049wrl.53.1673860469896; 
 Mon, 16 Jan 2023 01:14:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm11357294wrs.48.2023.01.16.01.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:14:29 -0800 (PST)
Message-ID: <7ba3aa3e-9cb4-e092-9768-7b14da49f2b1@linaro.org>
Date: Mon, 16 Jan 2023 10:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] hw/i386/acpi-microvm: Reuse qbus_build_aml()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114222738.282478-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 14/1/23 23:27, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-microvm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Possibly squash with next patch, regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



