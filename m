Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D15534A6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:37:35 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3f0W-000073-9b
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ecA-0002YE-BO
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:12:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ec8-00019n-MC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:12:22 -0400
Received: by mail-pl1-x632.google.com with SMTP id m2so5398114plx.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s6A3oTSWq0J7hhHpyOtJeyY++etwnlURlQTr2A0tir4=;
 b=k4W5lC49/WLdTiQ4MgxjIU2WZxk1jFITeHUV+AsgA1xyKo33WAYkz8bkdPrmBio7VV
 6DlZgFvYRi6rXNiBpVOnDkH1tVZUT2RPh7Nb+vFzkP2Vh5wLTyuWDoc34IfR7/2nN634
 c/J9SETqBAwj5ea4MZaij08UHv7hl2dzS3VENYDUw7Kp6/XQPckGYd3HgDKdlWs2u/n8
 /LTBQ8km1wf0F8gNi5Hp3Gvj9KZDcvpbFVfffPLmGcBsvwiShJyGz+a9nAQULGj1zv5s
 dMd0bMgaceEVKGzx5t/ES77l5UltZ4WMWPHNCGjhL+Gn/qr4ahUb/zBsslHHG/KN0tNi
 O6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s6A3oTSWq0J7hhHpyOtJeyY++etwnlURlQTr2A0tir4=;
 b=PR9sZCMUFky5DJqTVZbv8ZIl6I4pgsNC9tnOzF/Wp8ZNtzV9E3iiAD8l9YzGhwZRcs
 GJJePI+Nzbu3rA3R9Os1rb8DggsJsH++Lj5BSMkTyaHFvu4tnZ15PMoP76jMIe806r8Q
 9cQ7fxP/ZPC1gRhoZB2QBCXXy9TzvTio5PxywfGyxsp8PaC/zWnqr+CS+1yGJwXsb9PC
 7z1SmryaOW6TrwQE1H8pwn+9UGJtmu/EOGIAxwwcJR2inNGxDIhbvRuibcLWkk5QgyHU
 meXAgErVpIEy/rwoFgCvFAGbiJMY+CzoydsdPY5mE4w7An1xY4OfBmwrK1kr/d362K//
 QCGg==
X-Gm-Message-State: AJIora/EtKCEgjv/O16EGIZD39WffIuLLxzNa3qw8eBNgMBKfvz2qllO
 v1nGAG0sOudC+xCruisse3BAAw==
X-Google-Smtp-Source: AGRyM1sg9WOqym7bAfwOsJ0MGwGJh7+VBfhYnxUA9pbCRNw33oFchXUiR/v1W17Otmedxw+du4sXkA==
X-Received: by 2002:a17:903:1105:b0:168:fa61:147f with SMTP id
 n5-20020a170903110500b00168fa61147fmr28170559plh.72.1655820738849; 
 Tue, 21 Jun 2022 07:12:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170903248b00b001618b70dcc9sm10761304plw.101.2022.06.21.07.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 07:12:18 -0700 (PDT)
Message-ID: <ddfbcffc-dabd-d7e7-03fc-924e8048de42@linaro.org>
Date: Tue, 21 Jun 2022 07:12:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v18 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220620093401.3727352-1-gaosong@loongson.cn>
 <20220620093401.3727352-3-gaosong@loongson.cn>
 <60e4b2f3-8e62-bd81-7ef3-298863afe16c@linaro.org>
 <978a16a0-8d4b-411d-5235-475aa2804857@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <978a16a0-8d4b-411d-5235-475aa2804857@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 6/20/22 20:56, gaosong wrote:
>> This is missing lock_user/unlock_user somewhere.
>> You can't use the double-underscore __get/__put_user without having done that.
>>
> My understanding is that the struct exctx need lock_user_struct/unlock_user_struct,  then 
> we can use __get/__put the struct extctx.

No, extctx does not exist in target memory.  It is purely local to the signal 
implementation as a way of tracking the layout.

>> This is why I suggested statically allocating the extra
>> pieces of the signal frame *on write*.  You obviously
>> cannot rely on the signal frame being identical on
>> signal return -- the guest is allowed to create any valid
>> context to give to rt_sigreturn.
>>
> I don’t know if my understanding is correct,
> 
> we can put the exctx or target_fpu_context into target_rt_sigframe, like this:
> struct target_rt_sigframe {
>      struct target_siginfo rs_info;
>      struct target_ucontext rs_uc;
>      struct extctx_layout rs_ext;
> };

No.

You need to look at what the code in setup_extcontext does.
It allocates two sctx_info and one fpu_context on the stack.
Thus the structure would look like

struct target_rt_sigframe {
     struct target_siginfo rs_info;
     struct target_ucontext rs_uc;
     struct sctx_info rs_fpu_info QEMU_ALIGNED(16);
     struct target_fp_context rs_fpu;
     struct sctx_info rs_end_info QEMU_ALIGNED(16);
};


r~

