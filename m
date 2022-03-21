Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F411B4E3284
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:02:17 +0100 (CET)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQ6S-0003eV-Rl
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:02:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ48-00027O-MW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:59:52 -0400
Received: from [2a00:1450:4864:20::32c] (port=52199
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ47-0005d9-BJ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:59:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q20so9361810wmq.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yTZ8tsVHWn+XELLH/KFobxbnlV/GGKBsZ0d3EHIDDGY=;
 b=jwAWD5vxsOiUbx48G2TUOF49mbby1QalaBoDCcGijHqNogROxwWZfbHmzxAGZNDUxu
 KvOAMgyrQbFVRLOZ2koGNziUswgjPWDJd5UoLDfOHQRVd4El5hkW3vxxwIxbsVHWbiB/
 48EiukqlIgcPfh45FcQkjpO8ivo2VoQ0muLWo3ndxqqY4JVXRqjD43nTFYMJAoHgb8bk
 BxCwK6jwlHnTWWJY/TpftCDpSWzpG0UVyHhpgliAegAwPuKbkxjK8FmogWtMOetc+sMn
 nBNKn+C4JYsBPeljFsJZ/ob7XjEx4hOQNn2ezyNYhn2xprTM2PmVvpG6lOCz9bl4nNqG
 6Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yTZ8tsVHWn+XELLH/KFobxbnlV/GGKBsZ0d3EHIDDGY=;
 b=UOyYxzN6YhVCG0KkEcrUKd0Q+k6iWfypkkix5W60siQjGthRAvayFyvwdbNgTwNJbo
 60dv5La8+vbsfExsM6h56vMhjSrK/0a3eOPv0XzezNShz9o3oVhe0wAOXluLnvpm/z9G
 mHVIKNtMuJv4us7+0CISnPCKyABZOJA3Bvn66fqnBti9DT6oU7QFOsvbSzPCZXg5QGLm
 uAM1rYh1hApo27DHI+debasSrFhabfdP5bbkLEOhTHrPCHfkrscYLwR9oTLHScb6cVI2
 CMvWo0n0cO8npgqhTIqQ4wbmrr5JJyQSxi7wsc/UUezoHxc1LFE+PUX2xAsXRmDwUiei
 TUfA==
X-Gm-Message-State: AOAM531ZaDRjdWBLLcP45XfNvMgvIVTwo9AKpHPS27g9Yo4brj6dp4pn
 VnQhUe2XrlRMY7Rnb+Skm5g=
X-Google-Smtp-Source: ABdhPJxTpH99/jq4bI/xurt9UVRxi/NLyL/xR04pO9oYR4zBvjOQ16RP7QzghOiMhc5MhIituBPZ2A==
X-Received: by 2002:a05:600c:4fcd:b0:38c:7495:e644 with SMTP id
 o13-20020a05600c4fcd00b0038c7495e644mr1003352wmq.102.1647899989969; 
 Mon, 21 Mar 2022 14:59:49 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm14102402wru.75.2022.03.21.14.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:59:49 -0700 (PDT)
Message-ID: <60c940a0-d7ba-483c-0e28-118a51a04feb@gmail.com>
Date: Mon, 21 Mar 2022 22:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] ui/cocoa: Move create_initial_menus
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220321041043.24112-1-akihiko.odaki@gmail.com>
 <20220321041043.24112-2-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321041043.24112-2-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 05:10, Akihiko Odaki wrote:
> The following change would make it use add_console_menu_entries and
> addRemovableDevicesMenuItems so it should come after them.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 178 ++++++++++++++++++++++++++---------------------------
>   1 file changed, 89 insertions(+), 89 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

