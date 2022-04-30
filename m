Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082C51602D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:57:01 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktDA-0006xX-DJ
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktBT-00069k-0C
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:55:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktBR-0006wL-F5
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:55:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n18so9737679plg.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N66FG9atH2XDUfCWUWSlJlJzJIkZH983uKiSi6i0HKc=;
 b=b1WIeTH8voNnvlJ9BsNE5/RkaOP+vFkeM0bbXH/mpDdM+c0j2ElbwSD6Yo1bv2070Z
 t7U2P6fksJZYWGxLpQfBCzD4uaU17Nk0hAVU8vnIEcDdCKWOuCJ0G0hD/h1lhxqpboox
 B7jIa+5MgfI0zohNbmg50EmZKkVf0iA8eLIX6lMHhsEQqeOfilxKHtDM/pHtG661uZEg
 OzWVwU9ItmhPtWT5/VrH97wJexQkCn95jzo9GSt76m13ssuhBD2VFGzN+Zxqh/yZJysg
 nfn9uzBSget0UfHYMoZAKK1lH2+67OrVkYLVWFavJOnCJ8nrt/Y2cfSgBkLUH9lnUBh7
 hzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N66FG9atH2XDUfCWUWSlJlJzJIkZH983uKiSi6i0HKc=;
 b=efVyjNvC8M3uurzJCvn4VXho1lqXq9C9JLGR6EaiSOBMtj3N+p9GUbQaIGd74p3vln
 t+TwrGaKEyuwGqesFDqUm5Q5jnA+puVhK/jJmIwwJocPu0LBzl1cD8R121BbMsvPz3zB
 Nx+ebxuP3oVQd0hd43kp1fNhml8gOBQqv4tc5vZcNB9WbMxlUN7Jqr1FfW5OM7Jrvwc1
 N9blEbdUCWPXLTpuGYQPwJVlKEJUQogP5evVlJH9WuM9LadKRrzgy4cOB+D5Hr/BMhWa
 HoQJBJoYSPnFYwdXuTw00Q+FFxtiYit3LUJg5U+9whhcdzcFuj5Fc+CSG6MA/xdftOhi
 LRTg==
X-Gm-Message-State: AOAM530Gx3NHc9qOZo19YFtS37TyPKey/H5P/ZFuAVgeZTZukW/F24Hb
 0Bc1aNP1nLqcTeS072v+q+TPbw==
X-Google-Smtp-Source: ABdhPJxNwN36+qW250aTAjLfCOuYwaSSoQjA9WOpotrYcGoy6gYvqywb7j4eSHk5UUrNOGXkoUBGAQ==
X-Received: by 2002:a17:902:8ec8:b0:156:847b:a8f8 with SMTP id
 x8-20020a1709028ec800b00156847ba8f8mr4872760plo.121.1651348511909; 
 Sat, 30 Apr 2022 12:55:11 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a17090340cd00b0015e8d4eb1c4sm1816296pld.14.2022.04.30.12.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:55:11 -0700 (PDT)
Message-ID: <8ae66338-4ef2-2e72-92c8-5f8f5697e16a@linaro.org>
Date: Sat, 30 Apr 2022 12:55:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 08/12] configure: enable cross-compilation of s390-ccw
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> -# Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
> -# or -march=z10 (which is the lowest architecture level that Clang supports)
> -if test "$cpu" = "s390x" ; then
> +# Only build s390-ccw bios the compiler has -march=z900 or -march=z10 (which is

Dropped an 'if' there.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

