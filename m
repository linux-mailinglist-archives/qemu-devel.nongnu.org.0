Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8739CA8B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 20:40:38 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbDo-0007xb-Sm
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 14:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpbCw-000743-IL
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:39:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpbCt-0002Qm-AL
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:39:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so9308897pjz.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SZ7jQNPnzgr/PEHfbbCvtkdSb20nF6IhR0AS1IwPZps=;
 b=FypTVuIONprKzIU0tLIMcN3To2dgJQ5X8trju2zWjTpGX208FRp2qmUYUSEKDRFbDe
 pKM/qgST8m6q76Z6A8f+hDCFOBinyyQ1K327hfKbuLOU4yvOvzN10JOn5e7MKF8cgCT1
 iaxJKhgUX7iGZTTuSJ5jl3rdHLY2GSzMGVKv7eQurNNdYLUchuP8VCx1h/kTZr9xax+N
 Ux5HobRxfnBbFp+YcUjx1qTwixP+kBgr8ZaaezIH0aiHhcT96zdphfXa93bhzaoNzdri
 7iQME2AQkRG7+2qca/lK3KH+Zqtote7hTuyPn5yHA5USjpNfXT8DsJALJv8Zff8e0NbD
 +oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SZ7jQNPnzgr/PEHfbbCvtkdSb20nF6IhR0AS1IwPZps=;
 b=BkSY8Iyxay3PwHCgKNJnJ3jM5zCvtsLTJTsgKv77QzAqbOLAkuw5t/dbjvYER/8GQn
 23e1cevQj5voYpdHftzKXvqNO0YOe4GwIC7T62RAG79lpdMVpZyxoWMTk48h2FZYR7i4
 TEDHJTCKlPhInVOsOKu/AxE/Vkp38OIPNRbOFl5JTLcW7fdlw8+ruAWNnRpuynb+LVW1
 266zLMgkhOMXVbayt9RcBUx93g/QFHdxrV592RLGhcXVfzJXKa+orKdVhz2janpOuM+/
 FESGSYdDZM3cpBG9zw/DK7qnUzk4cx5xU3XZdMQoHqvSH/7hPi72zEa+FFIMrPslBz7u
 E5AQ==
X-Gm-Message-State: AOAM533HmDuPUBkUcP+z0MjH+vjaAAQgjBGu3Z5FfQzPOmVv4PBjEHOG
 /21nehWMlp9jabb+5H4quwK2wA==
X-Google-Smtp-Source: ABdhPJxGCPKq9Eop5BDumkBy4FGl8voAWyu09ac8taG7AGqu55tvGmIU/ilHH5YtzyEz1btB1K3PVw==
X-Received: by 2002:a17:90a:a512:: with SMTP id
 a18mr4452964pjq.215.1622918376917; 
 Sat, 05 Jun 2021 11:39:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j16sm7485302pjn.55.2021.06.05.11.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 11:39:36 -0700 (PDT)
Subject: Re: [PATCH v16 72/99] target/arm: cpu-sve: rename functions according
 to module prefix
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-73-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <242f83e4-d573-52cf-240c-4674ea294b51@linaro.org>
Date: Sat, 5 Jun 2021 11:39:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-73-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> @@ -276,8 +276,8 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>    * of the contents of "name" to determine which bit on which
>    * to operate.
>    */
> -static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void get_prop_vq(Object *obj, Visitor *v, const char *name,
> +                        void *opaque, Error **errp)

The comment above this function needs some renames to match.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
> index a23831e3c6..09aede9319 100644
> --- a/target/arm/kvm/kvm-cpu.c
> +++ b/target/arm/kvm/kvm-cpu.c
> @@ -89,7 +89,7 @@ static void host_cpu_instance_init(Object *obj)
>   
>       kvm_arm_set_cpu_features_from_host(cpu);
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        aarch64_add_sve_properties(obj);
> +        cpu_sve_add_props(obj);

As an aside, I think this if is always true.  kvm is 64-bit only now.  One can 
start 32-bit guests, with proper host cpu support, but it's the "aarch64" cpu 
property that controls this.  And all cpu properties are processed all at once.


r~

