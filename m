Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C7510A72
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:28:58 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRnt-0000Gq-MR
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRlR-00043o-Sh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:26:25 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRlQ-0000yt-3a
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:26:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id c12so31253456plr.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7091bydlwxaw17tBlVjH/q+breUK6rC4MIrMYhMibQQ=;
 b=GlqA/IAm4wo2Ot7MwYPRQgWoW60zsHyItPX/oHL+cJgp0T1NQa+vMMNLb6UfUkT887
 yC2EN4OqHxQM6uZ1+MFFlU2cPtMc5hj6jA25eAvAiEDd/qfKSZ1qjGAg2R4Hsmunowsx
 OC9xbfC3K8XhXLuTW8Z0Y/jI6mDglKYaIxm8u4ySAoNb8uehd4hzlkDM1c8v2464Kc7O
 /Nr5kP7KM+Imqt7TDnTg/ApjN4aUCZ3Wh/5N5G94obuMwSycLhbXbG5QzGGaoiSjrxqu
 QtuQT4WUYMwe5aHlVWHhkZ9uNmc3DD9cEO/IvgTg+c5cYLeIxFm2U3IEMHYKADHEFFe/
 Rj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7091bydlwxaw17tBlVjH/q+breUK6rC4MIrMYhMibQQ=;
 b=iMft7q/OqAMEjs+hjLqjxFWjKegN2phYn5LuER9p6vXTe0k9BDuawWFraTsK9jeOtY
 cVYxwPfJI7UkjZ30PquTZhiCDHMYtppylYo68Ls5o5hOL/2JnWtRzAxvEU/vzh4sacs9
 6aJbuddwZktE6Ol88w++GT0yGP08PkjAJX+C2I5wU2jhzq8pg0gvNGzmEEu3426eDLX/
 Gvq97mAHoxdXnU2V9GO5lUhMzbqsYv+aWSHgYPjOfZv54ZnrRiRZNwMFW4QavuF7vfxp
 iQ0INXA24w8CbIKwxaGCUujd0lMiBZ3CIRgRQj2a+haqKBc0Pvh2yMWHdzv/JN8Wjcgj
 BtjQ==
X-Gm-Message-State: AOAM533+5L7Xa5M8YQQ1N4LuiBa+oSzEIg8aPX5h450D1jJXntFzs8x5
 Xkf1W8ISTsqlt/6zyXqcKlnuRQ==
X-Google-Smtp-Source: ABdhPJzQrm/BUR7TCA6vLCTXVkttuCCpXYYPFMt88XU8FPK+wDOCL/isgPm7WcnWE+RpEd8V3YcCtg==
X-Received: by 2002:a17:90a:d584:b0:1b8:7864:1735 with SMTP id
 v4-20020a17090ad58400b001b878641735mr29013406pju.126.1651004782078; 
 Tue, 26 Apr 2022 13:26:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a62d141000000b0050d3772b9b0sm9544430pfl.94.2022.04.26.13.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:26:21 -0700 (PDT)
Message-ID: <fbf89dbd-17d5-cd93-4fba-3852f4cc4caa@linaro.org>
Date: Tue, 26 Apr 2022 13:26:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/9] replay: simplify async event processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062841103.526882.9023955155829649867.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062841103.526882.9023955155829649867.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, philmd@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
>   static Event *replay_read_event(void)
>   {
>       Event *event;
> +    int event_kind = replay_state.data_kind - EVENT_ASYNC;

Use the enum type.

> +/* Asynchronous events IDs */
> +
> +enum ReplayAsyncEventKind {
> +    REPLAY_ASYNC_EVENT_BH,
> +    REPLAY_ASYNC_EVENT_BH_ONESHOT,
> +    REPLAY_ASYNC_EVENT_INPUT,
> +    REPLAY_ASYNC_EVENT_INPUT_SYNC,
> +    REPLAY_ASYNC_EVENT_CHAR_READ,
> +    REPLAY_ASYNC_EVENT_BLOCK,
> +    REPLAY_ASYNC_EVENT_NET,
> +    REPLAY_ASYNC_COUNT
> +};
...
> -enum ReplayAsyncEventKind {
> -    REPLAY_ASYNC_EVENT_BH,
> -    REPLAY_ASYNC_EVENT_BH_ONESHOT,
> -    REPLAY_ASYNC_EVENT_INPUT,
> -    REPLAY_ASYNC_EVENT_INPUT_SYNC,
> -    REPLAY_ASYNC_EVENT_CHAR_READ,
> -    REPLAY_ASYNC_EVENT_BLOCK,
> -    REPLAY_ASYNC_EVENT_NET,
> -    REPLAY_ASYNC_COUNT
> -};
> -
>   typedef enum ReplayAsyncEventKind ReplayAsyncEventKind;

Merge or move the typedef with the enum definition, to keep them together.

> @@ -59,7 +59,6 @@ static const VMStateDescription vmstate_replay = {
>           VMSTATE_UINT32(has_unread_data, ReplayState),
>           VMSTATE_UINT64(file_offset, ReplayState),
>           VMSTATE_UINT64(block_request_id, ReplayState),
> -        VMSTATE_INT32(read_event_kind, ReplayState),
>           VMSTATE_UINT64(read_event_id, ReplayState),
>           VMSTATE_END_OF_LIST()
>       },

Second change here, are you bumping version at the end and I haven't seen it yet?


r~

