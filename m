Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692F4D75A2
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 14:56:54 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTOiL-0004nP-JD
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 09:56:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOeG-0000sa-7U
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:40 -0400
Received: from [2a00:1450:4864:20::335] (port=51786
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOeE-0007vu-Jx
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id q20so7839503wmq.1
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xuBl6ONcrrYUe0G7Un7MfcnOroaOedQhWvSGb+OOvz0=;
 b=a2P+9yAi17hL1ziBrk+NRpeGf4U61nKKj2iYX1xR3uhRJWLfet1Pbn1Hg6B4LBZMIb
 Q1A/SUePSuXwA99yky5Z9+wCNBLZIZcFV3oD4TaMi3Zs/TEQB7Bm1Zu3FU3zGZWz9q+W
 MMn9gx3aIYgZjLmxouXs/t6ZedCyaLSlpCvIJxE+zsRz/je5VIuLH/pbFnZkirsv5apu
 6WoQ+43pu7LlB1EyojMD6DriCWRM1XtQBWo3NjJiMn2tROgLqq8BSAje0H8QHWo0bWbb
 k0YLW78MMuhQeOzcZ6p2X2VXPKO+ncKoVZFsAIBIJej1uUQoRJ7+cBeuPbXBNkMcGfOg
 x1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xuBl6ONcrrYUe0G7Un7MfcnOroaOedQhWvSGb+OOvz0=;
 b=TSd+KhtwPwYNvixYDCiDgQ6qOJCBIgj1Xha46EHNaPe2SgTaroec3P6/SBnC0jBBId
 3m85MTwaE/9SxX+nxN8Dh8j+lWOQ4FcpZK/bQZ6M5588ypsWG6OlA6xg82NWfDPrBvG3
 bb/GZbZRlbzTjJyrTVPkBp2rZjEbbDtvFDtR7yRcTt/CV7DdDihoGf25NRzsd06L5arh
 JNT0wQHfN1FfJ4YOmOuNi0IlhipBQI5FwvVqpwE360Ca4L0JubjaimxUScUBJUeP0nYP
 jrLimpGlCjo/9eMKmgMzKp/cgeyNDVqvUdxZsxf5L5xqUOPdU7jKdcfHLU53YXuFOexe
 F+Cw==
X-Gm-Message-State: AOAM530ueaLm2DTpviw6D54JvjUwqzRp1pgzd8zE25qusCJb8eaabY3V
 wXjsB6vPBP1hxzsYbzDGH28=
X-Google-Smtp-Source: ABdhPJw4LSmFxG7624DoAoziGICLhrXNZd5NT1BaRO2aHsn2gSITqpmlHiubebl7CbNHrtgjLpLewA==
X-Received: by 2002:a05:600c:588:b0:389:9e5f:59d3 with SMTP id
 o8-20020a05600c058800b003899e5f59d3mr22071565wmd.35.1647179556827; 
 Sun, 13 Mar 2022 06:52:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a1c7209000000b00389a616615csm16931612wmc.2.2022.03.13.06.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 06:52:36 -0700 (PDT)
Message-ID: <4df6dd33-a2dd-01f9-2277-51e68afc9b8e@gmail.com>
Date: Sun, 13 Mar 2022 14:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 10/11] edk2/docker: use ubuntu 18.04
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-11-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311053759.875785-11-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/22 06:37, Gerd Hoffmann wrote:
> Upstream CI uses ubuntu 18.04 too, so pick
> that version (instead of something newer).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/edk2/Dockerfile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


