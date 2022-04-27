Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213A510DCC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:17:05 +0200 (CEST)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWIi-0003yf-6L
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWGq-0002cB-Jl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:15:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWGp-0002rq-2r
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:15:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id i62so267696pgd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7vH/+woqmWDbCkl22O9W1aIdQt2BQijJ4q6oJwm/hLg=;
 b=PNJEJmkZwBYcUlfGAAkez9djEf7uAIluEVI4QaxqNh5mwrrmsysGb9BrIAkjyeDshr
 Xq8bWZLNJxLLI98IhgbkP6dliL9oV3wt6jkgN8NguvUCs79rXw19o9d5dBR4539K5Hqo
 /MAZTcsOOe9vyYStOSE90zk/DvCfzEScG+rYEajy1ADPKkTymBJuhlIenrqPAv+shyr5
 2uyqlqNVYalzbW17VrGw+Yc6B173C3ubBzLpDkBYu4qA3hqyKD9dl+6zPmY69B9cF3/A
 Y7PSQ6GBsOExs49hqKzGAem4cCDTTqbHdl3/h2ACpaWTpmXJCqmDAtcRywUZY1mWNOE2
 8epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7vH/+woqmWDbCkl22O9W1aIdQt2BQijJ4q6oJwm/hLg=;
 b=b2BtNpHTbn97yexVfLpXZ+JzuNEYq7HRy7hWzrmqy+mQofpXeehgHFqS2HX6bMosTu
 iBqRIrV4RJw7MWx68GD0E4kERV6mGP+fLPvCtpTn3Uysh40OMrNWEWH913ZCIyepEwOY
 BE8nKx6Tg1sT652lMzYLqC/wu97e9HxNeKGwxnI3M8/tQJYI/tiAZdYFGoDlu3aVbX/n
 s67jZnA6wW5pzBeygL3uSGxPYO1DErPpV/o40Utrv+hhw8V9CK1mv7DqCzQJPtg+s4+i
 oMhM8hiaexKfukAqtkjoqc18a3UI8H2MMN2etpYCGlq5M+9LYNwzVWcLeufXz1Sx0/KA
 jvIg==
X-Gm-Message-State: AOAM53219s3AJvAqBBdjlSHVWMquS+tgq8y5I53sgLhz02Eu0+F4lJP3
 lisd8i5m4WdmVFOXSbNSzOAnLA==
X-Google-Smtp-Source: ABdhPJySICqkcoWgIw1bVikrmSTiVCij3TimKFo3+QyxvWNOE+W3SRw3ba5y0rIq84ql3XObpHQGsg==
X-Received: by 2002:a63:864a:0:b0:3ab:1a03:4e33 with SMTP id
 x71-20020a63864a000000b003ab1a034e33mr13918156pgd.241.1651022105855; 
 Tue, 26 Apr 2022 18:15:05 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p185-20020a62d0c2000000b0050d1f7c515esm13130274pfg.219.2022.04.26.18.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:15:05 -0700 (PDT)
Message-ID: <bb908912-cc59-c1fb-1dd5-41dcb3495f28@linaro.org>
Date: Tue, 26 Apr 2022 18:15:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 17/26] Replace fcntl(0_NONBLOCK) with
 g_unix_set_fd_nonblocking()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-18-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-18-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Jason Wang <jasowang@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   net/tap-bsd.c                      |  4 ++--
>   net/tap-linux.c                    |  2 +-
>   net/tap-solaris.c                  |  2 +-
>   tests/qtest/fuzz/virtio_net_fuzz.c |  2 +-
>   tests/unit/test-iov.c              |  4 ++--
>   util/oslib-posix.c                 | 16 ++--------------
>   6 files changed, 9 insertions(+), 21 deletions(-)

Typo in subject: s/0/O/.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

