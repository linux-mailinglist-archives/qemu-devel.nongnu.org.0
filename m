Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754355B58CA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:55:17 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXh5u-0005nB-ND
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgvV-0007pH-LK
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:44:33 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgvU-00029m-8e
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:44:29 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-127d10b4f19so22167071fac.9
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ku+RTOyjn0pbWlGyE9Y/Gjef81wH451561Ek7hvgPMc=;
 b=u5is+KoyrW4SKTmAOm0o3BFH+SyeBqtiDyK/uuJkGYDkQ02FJ9DbiqvA/KdMj70Um0
 5ixEhi0GsYqP+OW/NeXZTRGRojC+4bsXM4Zp/+2cgCja+7OPGw5BEt799QbwpeuKYcLT
 OML/h2Nun1hDfTLve6S5oNKbL2KWrbzyDq0GuX9YPdDbPx6Aeqilepul25TCIunKoMHd
 2roJaTX90JJAXRN2nPrNjnK4av4kEYu7rtMc4QqeEKiLRKNV5XJwZfX9FD1VOCLf9ItQ
 Nrsnmo2bwanvGnDetlPoJwXj71xp5WIOi0n/WEV774u7IZd60HKHvDdEP66dDcsRagdN
 MN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ku+RTOyjn0pbWlGyE9Y/Gjef81wH451561Ek7hvgPMc=;
 b=juu5lCdw5SbsvDXXwDLEeLcGvp8VXeRcWSfOwIFNVmVlL1FEGr3FC5v3os3DJ4jzYy
 u1gQpFjaHMRiuZ+RpodiUEwFvobTZFzoFV/fHrAbdQ+RvDcjqlN5IMpbcN7bilrlIN/K
 qswby+/PuKb9s8F/jSL7aOHar1iAdY9IZxtwaYPMm8w3OAk+aYd35LobciPLYXMdbHYp
 a4pdS33UnNmjuE52uHbDQM37y/ohpDGiQq/tskXmz8FMxndbelvP0qg3JZDcUtGSoIxO
 i/rQz0PVg0o0AW/9yqPzYe996E5rU47aKtaqydiNJrWbxiJTizml6/aBLDuj2yfv7f7L
 HcWA==
X-Gm-Message-State: ACgBeo1v9BLQf19zOheYB3NdxVvRFPfUMT/UPmeKes0xfeEuxRtD6KwL
 ivQ7ni4m8gIEu7l1ABlpu2niog==
X-Google-Smtp-Source: AA6agR6EunW9F8F3/liAgiFQja5IPSV7vd6TcNeU8j809qlR6FwX5xaSHCSEOrGGfhoq3ewZsKi6fA==
X-Received: by 2002:a05:6870:70a9:b0:127:9820:f0f7 with SMTP id
 v41-20020a05687070a900b001279820f0f7mr11574342oae.296.1662979466883; 
 Mon, 12 Sep 2022 03:44:26 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 30-20020a9d0321000000b00655ca9a109bsm3477722otv.36.2022.09.12.03.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:44:26 -0700 (PDT)
Message-ID: <4c254385-2c22-da85-3f86-5d41177b6267@linaro.org>
Date: Mon, 12 Sep 2022 11:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/37] target/i386: validate VEX prefixes via the
 instructions' exception classes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> @@ -180,6 +210,8 @@ struct X86OpEntry {
>   
>       X86InsnSpecial special : 8;
>       X86CPUIDFeature cpuid : 8;
> +    uint8_t      vex_class : 8;

Since uint8_t expands to 'unsigned char', it's friendlier to use 'unsigned' with 
bitfields, so that gdb doesn't try to render the field as a character.


r~

