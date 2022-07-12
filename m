Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236C571116
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:07:53 +0200 (CEST)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Bg-0000ZE-5w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB74B-0002RS-Gz
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB749-0007lm-Uu
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:07 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o12so6438206pfp.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nOUkieOyuY2qc7D8Qpj4XFVqLWygOJV4rVSvR9gwvkM=;
 b=m0589SZY/0eQ8CC7ubvbgOaBaydwtUJmdBBvz5ChxcZVnt2FLHOLInXm1fkz2Y0dHz
 Oe4e8v6Cw9DbGk1RSmmsPUdbYPA5zPjhKxsEnCaFrxyxzN6wVUgQInvXrYAKAG6u0duR
 u0BMuBGxKzzG8wEBaV2j6c7gjJ8h3e34tAFzlj+yJAxtNUEbsyaV8O0RM8cfCMoux+4k
 MUra/umHwqgTCCwtBQoAPfPdCvtai71u7GsvmsZxRWhcroVY5rxlkxcvaq8CFA+YHeTK
 Ir8kwB+okYuPI0+KkCoH6PpPkUyaSmW7aopNqcDssbzkq1nE8dm5Jj+NMhYqLIJ4I5pt
 8CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nOUkieOyuY2qc7D8Qpj4XFVqLWygOJV4rVSvR9gwvkM=;
 b=SkEZ1X1rNRU44dOYcpeWVJlaTlzwcUvtazlwU4R5qX5dtATTzuPJZCinvi2349CBer
 PSdPV+t722Y0XWHBd5HYxIYFNU03a7JjExhxugpqoiGv//Jz4o7ePAm15WrvAZwpEmK1
 pfiGkHnBx1CnI3Tfy3RSjMVhFTizGeUb8N4PTpCmSswUlI9ZnFRLcrdJZbUOWmYw+hOX
 ShjJ2epaa+E2DUM9GIqc1iXcJMQUsdpA62gWbNrgaNjzYbbtLhUhROUB/IHf8WgyoWQp
 SSenEhox+Th8Is0+OOHd2OL0WoN+ouB42L6H8+aLe0rj0DExEjpPiAS/sb8fKqtOfcX8
 bXQg==
X-Gm-Message-State: AJIora+TcFBxh5pfKg/7mOsEeuE7QlE++pj9WCYV2SwbZJDO4LrtkbT/
 4Rb8A3lQ70JAe88yCxbjKNy/IQ==
X-Google-Smtp-Source: AGRyM1uWaiABiSotcOPXMjEbqM96jfoFroeBF76ULrRFlxRTewcDsAlCq0MdbfXt53XEWzp4/yJIzA==
X-Received: by 2002:a63:170d:0:b0:415:f76d:45e1 with SMTP id
 x13-20020a63170d000000b00415f76d45e1mr8597875pgl.171.1657598404387; 
 Mon, 11 Jul 2022 21:00:04 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170902d2cf00b0016a565f3f34sm5614062plc.168.2022.07.11.20.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:00:03 -0700 (PDT)
Message-ID: <0677a1c8-9b5b-a76e-42f3-e61628fffd50@linaro.org>
Date: Tue, 12 Jul 2022 09:29:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 06/12] tests/vm: remove ubuntu.i386 VM test
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-7-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/22 21:04, John Snow wrote:
> Ubuntu 18.04 is out of our support window, and Ubuntu 20.04 does not
> support i386 anymore. The debian project does, but they do not provide
> any cloud images for it, a new expect-style script would have to be
> written.
> 
> Since we have i386 cross-compiler tests hosted on GitLab CI, we don't
> need to support this VM test anymore.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/Makefile.include |  3 +--
>   tests/vm/ubuntu.i386      | 40 ---------------------------------------
>   2 files changed, 1 insertion(+), 42 deletions(-)
>   delete mode 100755 tests/vm/ubuntu.i386

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

