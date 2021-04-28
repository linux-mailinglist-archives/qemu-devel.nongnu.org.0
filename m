Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB736DD4E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:44:19 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnIP-0001OQ-LZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbnDK-0005tX-Jw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:39:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbnDI-0002h4-TT
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:39:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id md17so5698482pjb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WBH6+JuF6fTEaF0bwagSj3jygQHZT7qzDsIFicHmeqo=;
 b=Fja+8q1iPAZHBcH7GopLl8ZvhddglYH1cU6Bwl/583Gsb8GNpJ0ww5MxUfSMa8XDDn
 mCJCrLkN6DwONjWlqG7m/3GLjoMSwGDelk7+0eQzG0v+IIA3zJCLik3/1cx5QMfG1Ego
 jyJkJxX7eXyawxJA1WW36b1oLBvfu1asRuB32L1YeQAW/vyt9pz4olLfhhixZvwkcMF1
 j5P5ljCnwCAgULqwIv2TgB/xJ5FSl7BnbaceMEwdjLRISPJirBBJ3BRMkhBlOaG411tG
 iVmEMA5b+vmpGmmo38Rle4dg5KwPT/qcpxpeoC9dbkpi6PqszuQE8fSDuzt8Zx5cEl6k
 IiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WBH6+JuF6fTEaF0bwagSj3jygQHZT7qzDsIFicHmeqo=;
 b=kDo6wHHgCMSYYnAOSeqz6SxuFBHYrRsFz+CAcHTY5IkVsWsBwlWNoBJYl0eqCrmonM
 3nGblOXsSy3AoEs+aEIhEhZvrJ6WajFCeEhGfw2jK/lXxy7m92p1a83tZeL94KXYxvkV
 1htkm0JOfXC/GRz4negVeBgPvjJUcGVGvUR59m5jLcszgGst/LcXr50+1BKjfm6JwDpm
 RbcVvhEIGsHjBudtFWAeUnuNYF/twqE9rLrEXv53ZK4lyod2MhR6N1AY4wTwyczq4zbB
 kFaW51UUthvHqpUUtD0Da672O4mAuikXIZZHeVue1j3ZyXcMyWFFz7GeEG1+EDhkhNYZ
 OaMA==
X-Gm-Message-State: AOAM530C5DcBYrf15tspArzoCKfqZW3EnFdRXB27UuaV/wRqWeaDLlm4
 AhFZWuutfUYiEsLrWF60nrp2+w==
X-Google-Smtp-Source: ABdhPJwTke3eTJ+RAR+PQI/FYqo6bFHXN1yyJoMrqXTzUxhL0K9ka5Odiqyrz/YvlCE+/RNgWO+amA==
X-Received: by 2002:a17:902:361:b029:e9:8392:7abd with SMTP id
 88-20020a1709020361b02900e983927abdmr30649348pld.8.1619627939197; 
 Wed, 28 Apr 2021 09:38:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b65sm186907pga.83.2021.04.28.09.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:38:58 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e06f3f24-9ff2-bf3c-91c4-178af60c6c59@linaro.org>
Date: Wed, 28 Apr 2021 09:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428144813.417170-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:48 AM, Philippe Mathieu-Daudé wrote:
> diff --git a/util/meson.build b/util/meson.build
> index 510765cde46..c2eda2d1374 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -59,12 +59,10 @@
>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>     util_ss.add(files('base64.c'))
>     util_ss.add(files('buffer.c'))
> -  util_ss.add(files('bufferiszero.c'))
>     util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
>     util_ss.add(files('hbitmap.c'))
> -  util_ss.add(files('hexdump.c'))
>     util_ss.add(files('iova-tree.c'))
> -  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
> +  util_ss.add(files('qemu-sockets.c', 'uri.c'))
>     util_ss.add(files('lockcnt.c'))
>     util_ss.add(files('main-loop.c'))
>     util_ss.add(files('nvdimm-utils.c'))
> @@ -83,3 +81,9 @@
>                                           if_false: files('filemonitor-stub.c'))
>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
>   endif
> +
> +if have_block or config_host.has_key('CONFIG_VHOST_USER_FS')
> +  util_ss.add(files('hexdump.c'))
> +  util_ss.add(files('bufferiszero.c'))
> +  util_ss.add(files('iov.c'))
> +endif

Isn't util a static library, built once?  Why are we avoiding building these 
unconditionally?  Surely symbols will be included in any linked binaries only 
as needed.


r~

