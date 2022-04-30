Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F3516028
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:45:32 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkt23-0001ra-C6
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt0x-0001Ah-27
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:44:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt0v-0005Ie-LR
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:44:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so10109589pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QjqbO+0uIbzUIZ0V2U9hnIk0W5m0pdOR7Y62h12hcss=;
 b=cjWNYzulXlPJL+uU3MR7K0d2vIkhXdfN6zjM4Nb+2IZEYg+S1zFp2JxOcrCfxzMuIE
 mhv8QUIX6dWpCjT67+E6AxhvXsZIzRSUpuE6qkoZnAjLWjI8k1p66iVtIawKzlCqkVXe
 fFX0PF1gpiRYv53u2SrLeMAW9VFYXe1TIL+0MYUt6vQlky9od/uSrk2uAT2Rxegr9p1Q
 Zc9N6tLhoKxFG2wK6HNlFQls24lKQJo+Goc7PncuE2y6fCoV1APIh2iMdeAsZcKvt3I0
 BbBhnYf+8nk0WAPjWOf2V5XocGRg5BLPKQTjf8AnsWO1wmDSD2rzC3TAY7dbF9HG3X3E
 qmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QjqbO+0uIbzUIZ0V2U9hnIk0W5m0pdOR7Y62h12hcss=;
 b=te4Y0kmf7FfekSHjnUczgHavAVHU5hV9Tk+nXF/gDqyfvIXphcISrqgmKiF/pG2Elb
 0kYhclTMW65pxTVXYjHkxMRWiybqjxLEp1syB45D8lRvYsafNmZeIJCTBhDJzkPlfnkC
 r2TplU8uL2NmUQIzSM1KQxSSyGnd9hcwKXn2uHN0hXEG6ujr58kxE7tLdf2Ydh0AI1mq
 gDpSVJ3JB4LQOsyKKQsY38vfuWQk+aR2qZhXUyUZFRrsRabZ+wGNCiT7taAjFmuFOeuk
 YQ2dgxVHW8RxnGxCzf1JSZYRSU4+sriNXmBqfBhRFVZFi2Kor2E8bhKocw4+7xhE6Wdi
 /5rg==
X-Gm-Message-State: AOAM533UZbSr8hj4zN1wddCQK4wPz0ZlQOrfoqNbMboM/iktj425F+3D
 eIUyTv99T+T+SNOi47E3nAqKwA==
X-Google-Smtp-Source: ABdhPJzuxysUVTWBc8VIRiAuADzVFC1UAe4xz74V4dilYbrXxcLIEw+fGUdFFbpRVLe4cDib+/FjbA==
X-Received: by 2002:a17:902:f64d:b0:14f:fb63:f1a with SMTP id
 m13-20020a170902f64d00b0014ffb630f1amr4832042plg.159.1651347860187; 
 Sat, 30 Apr 2022 12:44:20 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a63d804000000b003c14af50604sm8749935pgh.28.2022.04.30.12.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:44:19 -0700 (PDT)
Message-ID: <864826a4-a686-f8e2-f517-3402078036bd@linaro.org>
Date: Sat, 30 Apr 2022 12:44:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 05/12] configure: include more binutils in tests/tcg
 makefile
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> Firmware builds require paths to all the binutils; it is not enough to
> use only cc, or even as/ld as in the case of tests/tcg/tricore.
> Adjust the cross-compiler configurator to detect also ar, nm, objcopy,
> ranlib and strip.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

