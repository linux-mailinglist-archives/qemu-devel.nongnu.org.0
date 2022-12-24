Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808A655AE8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:10:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98xs-0007IG-Td; Sat, 24 Dec 2022 13:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98xp-0007Hy-TS
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:09:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98xo-0006BP-Az
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:09:41 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n4so7621087plp.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nnwYIhqbIG01A/mHtQ5F147lqXQ4Ac4AYmfsDz7X10=;
 b=fEv+8PoHnwFaLq9FTKEmRyUtt62uvcg/EG6dGAL2pT3GlqBS37q1U0aJcIfnKNHgTJ
 jRFOK3/td1uCAhR8yWeXCBNs+D8RX7wCo0kFqMEb36iAQ5k5rmOGyd0xHulp3X2OW0B0
 rPrdKgN77Ke4eNf6drSq1i65RS/itHrz6JCP32FswipndBvHFXCo1j2wybWC9kr8/SLB
 jpd49dFlfQJ8dhClTaAi7jsuHkUZGi7O91qoO50wxJ++NyNz/UNxoyC0neqc6BOUQcJp
 iA3WIPJozHqET7MvxdQzeao6FCq81YnwuI5L2/7JMXwG0YuAW3mNSmSd9ESLHpVmKjG8
 FTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nnwYIhqbIG01A/mHtQ5F147lqXQ4Ac4AYmfsDz7X10=;
 b=2cFaOl9h1eKKeyYytbBySQFJ2VHKb3fr9MY6yY7ileJdd4JENxirG3ds8lXm9Vj05y
 fGjx7+OBjDZXui0OWUl2TUEjhUkDN11ja5je3eogcByhjRF7G8qAn8BT2ZN0OXpgt+yf
 P7H9YywxN60sAGlTbassg9bY3b/oJM39uXShbNXmMI/ccLOwdmh1TXDeDTYB/JI5Jjfq
 PR+XU5Q+RNSq4NgVOhFa+8vxCHmN/TE7I/TpHxdgNk18Q9cHm2bt31o8IN87PCFga1Gk
 yf5kUOQT0PagVh71ljhXsbUI7+ZzloH9ZD9qcYb54YbGNz7wSGW4e8Uo7G4dORPT2Qkr
 s5cw==
X-Gm-Message-State: AFqh2kqj+VIHiynMiCXAVFmTsunaYQuP6+v6GJAthuzXjVCKQzphJ/WC
 929xvLPYNlUq+rzDRsXhflDASw==
X-Google-Smtp-Source: AMrXdXuz10OEFpY71MHhiTyAWu+ATWfEfWTzOyoVgE1HNZ+V4bQUhoJNdFtC132bTohV2zK3HYtDWg==
X-Received: by 2002:a05:6a20:c78e:b0:aa:15b6:6322 with SMTP id
 hk14-20020a056a20c78e00b000aa15b66322mr15469771pzb.42.1671905378429; 
 Sat, 24 Dec 2022 10:09:38 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 k3-20020aa79723000000b0053e62b6fd22sm4398971pfg.126.2022.12.24.10.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:09:37 -0800 (PST)
Message-ID: <4452751a-2af6-adf1-8ac9-9001cef9a22a@linaro.org>
Date: Sat, 24 Dec 2022 10:09:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 16/43] target/loongarch: Implement
 vmadd/vmsub/vmaddw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-17-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-17-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/24/22 00:16, Song Gao wrote:
> +TRANS(vmadd_b, gen_vvv, gen_helper_vmadd_b)
> +TRANS(vmadd_h, gen_vvv, gen_helper_vmadd_h)
> +TRANS(vmadd_w, gen_vvv, gen_helper_vmadd_w)
> +TRANS(vmadd_d, gen_vvv, gen_helper_vmadd_d)
> +TRANS(vmsub_b, gen_vvv, gen_helper_vmsub_b)
> +TRANS(vmsub_h, gen_vvv, gen_helper_vmsub_h)
> +TRANS(vmsub_w, gen_vvv, gen_helper_vmsub_w)
> +TRANS(vmsub_d, gen_vvv, gen_helper_vmsub_d)

Implement with mul, add, sub.

> +TRANS(vmaddwev_h_b, gen_vvv, gen_helper_vmaddwev_h_b)
> +TRANS(vmaddwev_w_h, gen_vvv, gen_helper_vmaddwev_w_h)
> +TRANS(vmaddwev_d_w, gen_vvv, gen_helper_vmaddwev_d_w)
> +TRANS(vmaddwev_q_d, gen_vvv, gen_helper_vmaddwev_q_d)
> +TRANS(vmaddwod_h_b, gen_vvv, gen_helper_vmaddwod_h_b)
> +TRANS(vmaddwod_w_h, gen_vvv, gen_helper_vmaddwod_w_h)
> +TRANS(vmaddwod_d_w, gen_vvv, gen_helper_vmaddwod_d_w)
> +TRANS(vmaddwod_q_d, gen_vvv, gen_helper_vmaddwod_q_d)
> +TRANS(vmaddwev_h_bu, gen_vvv, gen_helper_vmaddwev_h_bu)
> +TRANS(vmaddwev_w_hu, gen_vvv, gen_helper_vmaddwev_w_hu)
> +TRANS(vmaddwev_d_wu, gen_vvv, gen_helper_vmaddwev_d_wu)
> +TRANS(vmaddwev_q_du, gen_vvv, gen_helper_vmaddwev_q_du)
> +TRANS(vmaddwod_h_bu, gen_vvv, gen_helper_vmaddwod_h_bu)
> +TRANS(vmaddwod_w_hu, gen_vvv, gen_helper_vmaddwod_w_hu)
> +TRANS(vmaddwod_d_wu, gen_vvv, gen_helper_vmaddwod_d_wu)
> +TRANS(vmaddwod_q_du, gen_vvv, gen_helper_vmaddwod_q_du)
> +TRANS(vmaddwev_h_bu_b, gen_vvv, gen_helper_vmaddwev_h_bu_b)
> +TRANS(vmaddwev_w_hu_h, gen_vvv, gen_helper_vmaddwev_w_hu_h)
> +TRANS(vmaddwev_d_wu_w, gen_vvv, gen_helper_vmaddwev_d_wu_w)
> +TRANS(vmaddwev_q_du_d, gen_vvv, gen_helper_vmaddwev_q_du_d)
> +TRANS(vmaddwod_h_bu_b, gen_vvv, gen_helper_vmaddwod_h_bu_b)
> +TRANS(vmaddwod_w_hu_h, gen_vvv, gen_helper_vmaddwod_w_hu_h)
> +TRANS(vmaddwod_d_wu_w, gen_vvv, gen_helper_vmaddwod_d_wu_w)
> +TRANS(vmaddwod_q_du_d, gen_vvv, gen_helper_vmaddwod_q_du_d)

Similar to widening add, mul.


r~

