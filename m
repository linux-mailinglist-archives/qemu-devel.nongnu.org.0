Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7944014B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:27:15 +0200 (CEST)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVeo-00073A-Nl
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgVA3-00084I-Qt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:55:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgVA1-00068B-J9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:55:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso11068598pjc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+1tEBoRc5b9bY3Gf6aP7q8ITN85UYf+3fac6Et00JRI=;
 b=YGcTOqh2JGb6mJtmdb0uz/3QPyBs0tDYNcTRfajE9/LxI+K6J/IPNuRozgFmZWbPfJ
 8i4iH+5jWva02R5T0YD8RjxJo1mphhdm0I2W6oPfXxuybE9zP+z2jYCdeJ9RF08mJ2AH
 qSDpEtrE9RqgF+N+SerLvuhLyNEQ6jjOYdY6njW4EzLcc01C3d0kg8TQlT97DRAf55/S
 1pY0Oo8jp8E4D8vcD8oYmoTa2Afx/YssSs5CXi6DNgMfM+dX9xR+IYxXUVWkjdEUsZMk
 9APjUfwBDYmQAtk4wveqP+q22RLK4MuOktRwdPLbTScBRzDhoXPg1cGKEf9JJCrXJWgm
 vWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+1tEBoRc5b9bY3Gf6aP7q8ITN85UYf+3fac6Et00JRI=;
 b=vbs1hEVS+Hj2UZGJIZE2IWPgATyndPhRcQePv9BNp9Xr2GN5s4M2lrsr1AV3jXHa/r
 KFFvW4f6kqpVdBtlnzhJkrpQFQHoPxqrPuxJOK/1UmNRg6vVBTTkHW8EuuFwarYLn3Lr
 G0Z8BLS6WsctXnf2PbMvxjMuqEMUuskV1X0+7LY8rWJh7Vx7SpW51wlvPc1qJUGdc3Iv
 wzylLJF4VtjE8pVGDJgBmIILqbESR0dolbRcB4rhQ1kjjn5ym9Go7cH8hhh23WBh+aD1
 xexrmCu1/G13TmW+kL5/rvX5qjfAaVI6IHNXrCi5AxN1ypFthD7g/baYMFt3pAz1Zp+u
 a3IA==
X-Gm-Message-State: AOAM531VasvwDDEkJsLtUJigTb0Icnz/WRocjnlno3bp1DsEQIBn+1P6
 lUdmSg+A7P5JT2kWA68cp0tRBg==
X-Google-Smtp-Source: ABdhPJwVgrYc1HwLFjAm5by53T3RxZzU0HurK4Mp5duRMINHA+F44MUsuxRPuZybDPYfpXycUiG4YQ==
X-Received: by 2002:a17:902:bd01:b0:140:4094:c70a with SMTP id
 p1-20020a170902bd0100b001404094c70amr10760514pls.70.1635526520066; 
 Fri, 29 Oct 2021 09:55:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x13sm6018066pgt.80.2021.10.29.09.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:55:19 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove obsolete FCR0_HAS2008 comment on
 P5600 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028212103.2126176-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d8ea728e-364f-0943-7bdf-c5bb26a51468@linaro.org>
Date: Fri, 29 Oct 2021 09:55:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028212103.2126176-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:21 PM, Philippe Mathieu-Daudé wrote:
> FCR0_HAS2008 flag has been enabled in commit ba5c79f2622
> ("target-mips: indicate presence of IEEE 754-2008 FPU in
> R6/R5+MSA CPUs"), so remove the obsolete FIXME comment.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu-defs.c.inc | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

