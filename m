Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BB4FA974
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 18:14:07 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDiw-0000jj-SW
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDfw-0007V3-4s
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:11:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDfu-0007w5-LJ
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:10:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so12442364pjk.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ByHpCSlnIDG7oJpxBStqxJYys9m9b63aeAK/0iLBC48=;
 b=SALeGrKvlIhYItgPupk7gNAV5Xiw0PwCnB/Ehm7XUCrLqkrGGRO75lgdxHnMA1tISK
 TDipNEzDVuXHKV4WPqmH93Whet1ki/40q25JE0QWdTmkARtY1tRalDrRscPpr/1MVXrj
 y39uaw0+slsEmsLel/qV51BZw6WcrfRRYYAdWF+2Ndg975tpyP3FOuoUAWLFTAWarewY
 Bjmp9J0lupkFIZxIM1KPiWriCk3WhbT26XThvoIn+3buASIr3M9L+V4zkNgoXizordxU
 3r/6uarXVcacqFA2trP38U7Xt0tBRzhE6jVPD6oMaHBl9tOb9fEQ/LonKAUvS16M35U8
 H7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ByHpCSlnIDG7oJpxBStqxJYys9m9b63aeAK/0iLBC48=;
 b=RlhMbiTJGW7+/mhDaEv4TGgMoxSLoWEVC2mzcWwfoDuqBso67wbrVr85hTgNxAHjK1
 xoQlhdjoR6PL9ObhVdO+QJRo/PrGKIGokW2AfcIPFyMihrd80qx8bt/1hF4a9eL21geG
 eqdYQUDKiH4alLLOpNL+2/WOhDwtDMkbgWuzMQBwLImiAnkgSlPy/9FU1r7MCnRYob8Y
 wAHFC1mJVwP5/RZOHBUjIcaqF+KEwBySplKsexT1Ezr2WbyGyZTstL/TPfw22SdNzHFT
 LoLbUsjkn7cA0KzO1RRnkldT1e1Dg+ycUlwlbWTs7HXMyzradr75wpoYoEJeNjxeb+QH
 OliQ==
X-Gm-Message-State: AOAM533euUQhDvjuV+hrS0/C9elh1VlvwJPZM8pKGzimyCBlpVjqu5aH
 kJEhG2lQqihtHjibl0kx/O3vjq0y8IhfYA==
X-Google-Smtp-Source: ABdhPJz2fhgU6N6yl1e/x2d2PWoLJ9YuNn7ml74XR/IgQ2KYv3jSXl+hjZCUJKLZiQZPW86c80Bjxw==
X-Received: by 2002:a17:902:a404:b0:14b:1100:aebc with SMTP id
 p4-20020a170902a40400b0014b1100aebcmr24983810plq.133.1649520657207; 
 Sat, 09 Apr 2022 09:10:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a17090a5e0d00b001c7d4099670sm15362831pjf.28.2022.04.09.09.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:10:56 -0700 (PDT)
Message-ID: <87f46e79-0f90-4697-37fd-1c0766aa1664@linaro.org>
Date: Sat, 9 Apr 2022 09:10:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 10/15] cputlb: add tracepoints for TB invalidation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 4/8/22 09:47, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 2 ++
>   accel/tcg/trace-events    | 1 +
>   2 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

