Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2C6FF9B6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 20:58:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBUX-0001ba-Gk; Thu, 11 May 2023 14:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBUT-0001YX-27
 for qemu-devel@nongnu.org; Thu, 11 May 2023 14:58:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBUQ-0000NW-Ly
 for qemu-devel@nongnu.org; Thu, 11 May 2023 14:58:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso21966685e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683831489; x=1686423489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IJ5revIFQeTqaJz0qcZWLrY2kcQelkmvDIoKRD6wTK4=;
 b=qHGx5X/7KSWez6CJoPnt+qe9JIGyTo/Daho5JGfxxHg7jHDy4fwgmbc4FIvjGO4yMY
 9S/H5vgVQwdmOl/TRTOEsiBqeFFwubKO0gS8V2y65sNu/pREsNja13k/APz+7yaVNusD
 9daJeqCzqAF5IWcPokI65QDmF0ioHZ9Wdija1hoRf9Ga3zuymur5ncHMVv8Zt9KNyvSo
 6bJ83oXmW2Vjis/2JSYcajw0qmTurjJc0HMetSD1bxhK6BifgU/dzm5F87TBwmPcTFdc
 CVlrEIH5q1creg8b/O4PBFoXE9846LqP9xybc5ta7CfRfao4RSq51yAQVzoF5rV5Iiz4
 ayWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683831489; x=1686423489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJ5revIFQeTqaJz0qcZWLrY2kcQelkmvDIoKRD6wTK4=;
 b=TeB5LtMPKmViDtiO80M3bGNzPtxMKk4ej3oFJIAf08HyB/Tv91D/J4xGCIH4p7nfe1
 ys7yJEsB1JI7LVXBj8WnlyS6gtqc5v1Daytoh0CdjsiLjJi5V1/cYbX7OsmiwDPV19ga
 DRtAd6oBmUKeX1QVHkNVJ831jLlO1+PM948VOJasTrQ8xbmZKTLEKuFBFVRWe0deQSOj
 Z8ziQrMYR/Ire76BOfu4Kg+0P62o2T4ycUuYaglCp3JWGU+iMfnAfx6jiap5f8+yiKRA
 7LbBikrwu7vQLWrsmBiBWBDtww1BeoFHTENr6kk9nqCht+Fmfnk4Jm3SbFDjIlxwzghH
 1nxQ==
X-Gm-Message-State: AC+VfDw/0idVSDqGmU4NURmHPglfntb4xzGp8eHrRw+WlF3qEmX6Bqwp
 jhW8itiZZPJ/nORTuD3hg6MLEA==
X-Google-Smtp-Source: ACHHUZ4ZEsiLFrL1Ih7r3W2dXE4HpPYe80a8XmfdYLDupyu4SoIh8amFIr4MyapmLlyDweImArNSEg==
X-Received: by 2002:adf:d846:0:b0:307:8651:258e with SMTP id
 k6-20020adfd846000000b003078651258emr12865053wrl.21.1683831489050; 
 Thu, 11 May 2023 11:58:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adff343000000b002fefe2edb72sm21076801wrp.17.2023.05.11.11.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 11:58:08 -0700 (PDT)
Message-ID: <f7b5e135-1229-bfab-effb-c5e0b1130cb0@linaro.org>
Date: Thu, 11 May 2023 20:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/5] migration: Make dirtyrate.c target independent
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Leonardo Bras <leobras@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Andrei Gudkov <gudkov.andrei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
References: <20230511141208.17779-1-quintela@redhat.com>
 <20230511141208.17779-6-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511141208.17779-6-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/23 16:12, Juan Quintela wrote:
> After the previous two patches, there is nothing else that is target
> specific.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> 
> - Remove check for CONFIG_SOFTMMU for dirtyrate.c, not needed (thanks
>    Richard)
> ---
>   migration/dirtyrate.c | 2 --
>   migration/meson.build | 4 ++--
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


