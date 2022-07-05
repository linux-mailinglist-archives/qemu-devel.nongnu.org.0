Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74A5661E3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 05:33:29 +0200 (CEST)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ZJZ-0004Gl-0T
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 23:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZIg-0003OG-8K
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:32:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZIe-0004sB-Rq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:32:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z1so4146484plb.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 20:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=n+tqJTvn7soNfiKqhPkChiNYQkgp2XITmS45YDF3Ma8=;
 b=Nys2pHb3hFXi93JvCvilT9ych7WTQWJDdYv9rdmFYOvIHMMSSpiJDRJ6Z2f8NoR14B
 Ma+fnN1ULyiYYxdXaeXvYARafHMkboyKjSiVEK/w6Y36F1BnbWCp+fN7djRL6GZw7dMa
 2JmuuzfPkeDcWLisPhs8xsFbT17urwzJKJ68kRzwlWLq7WJyLwn2gXGeqpiUxBaP/7c/
 b5uH4o6ia29KXmZ4oP8S4QADmOcA4suLvA5nAvUPUYdRtFpqGBaUThznWU5P/sBw5NXP
 l+vN2nDfp21x+uhhnmCN+M98tjWfkMCV/Yis+4LQig3te8ck9vWlDiZjUM5giHcbvFRx
 zuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=n+tqJTvn7soNfiKqhPkChiNYQkgp2XITmS45YDF3Ma8=;
 b=XvdN+HUwmhhMdwXqWbtqdntjDbeZaoKrjr0R9U+IVIQyGVuhHlq8LdvhdzAVLFZ9R7
 WYYmZs1vymWlsVS/3yNrH/FuSuaBP/GNIsLl4PFvc5lCDO2gJnU1AHpF6vz1SbgXaRoV
 erNTp3OzGX9EDHzRH0XdVZ5IeemT0/LCUkAC3g9YoL84jUIkdnmG43yGovruzxfNzlYf
 Kjz4LPuYicNQRXAmQYpY04xhGZV2DfvS94e+wkmxiowGlmea9mya50Z57gpONg3XyaT7
 0ji3MSGD1fVVxqiWTAlAg2ijTcTx2tw2LrhhzUr30LZ3j0MefmuLQCO5ELXvTASlszKb
 HLPg==
X-Gm-Message-State: AJIora+Hew42vGheqXdvViXu0sDtr+hkJd29nEa4UD65pUk1ywYj5KFY
 G5E494BcW/XT1wl26lgbvhr6tg==
X-Google-Smtp-Source: AGRyM1vNDEazzwdg3N7rl6PTHFSKKvnvPzceuN616RqBp05YLtk88O1S1NxPM6ofGqN7T3076/vzbw==
X-Received: by 2002:a17:90a:e7c6:b0:1ee:fed1:60a4 with SMTP id
 kb6-20020a17090ae7c600b001eefed160a4mr40500500pjb.100.1656991951443; 
 Mon, 04 Jul 2022 20:32:31 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902f14900b0016368840c41sm21855191plb.14.2022.07.04.20.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:32:31 -0700 (PDT)
Message-ID: <b09aa13c-d7c1-d80e-fa80-c6720fb0c10a@linaro.org>
Date: Tue, 5 Jul 2022 09:02:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
 <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
In-Reply-To: <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 7/5/22 09:00, Richard Henderson wrote:
> On 7/4/22 17:38, Peter Maydell wrote:
>>>           case TARGET_SVE_MAGIC:
>>> +            if (sve || size < sizeof(struct target_sve_context)) {
>>> +                goto err;
>>> +            }
>>>               if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>>>                   vq = sve_vq(env);
>>>                   sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
>>> -                if (!sve && size == sve_size) {
>>> +                if (size == sve_size) {
>>>                       sve = (struct target_sve_context *)ctx;
>>>                       break;
>>>                   }
>>
>> On the other hand, the kernel seems to happily allow records
>> which are larger than the SVE_SIG_CONTEXT_SIZE, whereas we
>> ignore the record unless there's an exact size match.
> 
> Yeah, this gets fixed properly in patch 39.
> Perhaps I should simply squash this with that?

Bah!  No, those are two separate checks: the minimum size to contain vq and flags 
(target_sve_context) and the minimum size to contain all of the vector data 
(TARGET_SVE_SIG_CONTEXT_SIZE).

The latter *is* fixed in patch 39, but this one should stay as-is.


r~

