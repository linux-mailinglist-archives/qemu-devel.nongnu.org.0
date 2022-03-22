Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBD4E3FD6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:51:54 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWevO-0001yK-Rw
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:51:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWetO-0000aV-1B
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:49:46 -0400
Received: from [2607:f8b0:4864:20::62c] (port=42530
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWetM-0005Ln-Hk
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:49:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p17so15495978plo.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uI6662ZCyK98ye2xVnU/NLWLI/ub3q3ZHrFRrfiEWjg=;
 b=FleduMeB6Uecx66IygbANzHquqMoeB9QJ/E1AahoxL3TLwP4l6eT2rgsE1//XD1DMg
 iBYUpmJwkU7XIZjVOkpbSLPBlH5cKZhQijYuCXXi7FSIZLr7Qew6+7+lePstmkBHqBQ6
 M0aRR2swBBx711iCg+MRz9Ja7MJCZAj1Zus8RmN3Ktqk32haGUVYV1OYI5LZKfZEhO8U
 f5YezIek5Ein5bij7iF5r7jHk1P0emxSu223otBhOw7vipjOyjjyj2jjnBPUzWXA8LwH
 oPXeF/C1QLsGRDZt6NUI97YfooQmzlJRA9MgUVhp6P8ZVQsfYh+xz/cziV4EOpOlYyJN
 yCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uI6662ZCyK98ye2xVnU/NLWLI/ub3q3ZHrFRrfiEWjg=;
 b=oWmtBB/BwB0Sp7OZzWn7dyuV5boxfkqIrnmmyDYbQCfcdFL6UxyO5jS6cWZ/t97nQ0
 CIs61WzDd6/YR8upjLW5Nd0pjk9RaaU7msnXusv5MsFC3jZVUp0NDk2mTabp4kXsHyz2
 fcZaKYlOMBvn5iSFGkqMukGBi8K67Y2kbO6vo2/79EEhR8mLtl/ex1kq/VhGylEFh2N8
 pLOjlEAU2zBTIk/sypImDDoBZZDv+pw5wYBALmcH21AL0tTbbJ5oXs33VilB1cunOjxh
 IaiCfwPwEGrYzr6RwxVbzlgay4fkJtFmhzQQgHczGiasxAsv7laFWGO1Ntdv90kWWYCS
 uZaQ==
X-Gm-Message-State: AOAM530gs6WI2sRiP7AzcF589RHyoQw5yBNl6aXHhjixmbCKskr+4ZZe
 X2fZfk4S6dag/AV7MPydMubLng==
X-Google-Smtp-Source: ABdhPJyosR5KZsQOHHgc8fdodMI5DXqaGAm9EH0lb22LIr43Va/2vu3eEXqoWPWCaZ5UqlhJ1wd2NA==
X-Received: by 2002:a17:90a:c791:b0:1c7:26eb:88dd with SMTP id
 gn17-20020a17090ac79100b001c726eb88ddmr5156058pjb.218.1647956982668; 
 Tue, 22 Mar 2022 06:49:42 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm2937081pjn.34.2022.03.22.06.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 06:49:42 -0700 (PDT)
Message-ID: <3c9faae7-0dee-0323-d58b-977cb8b78752@linaro.org>
Date: Tue, 22 Mar 2022 06:49:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/i386: kvm: do not access uninitialized variable
 on older kernels
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220320193914.111356-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220320193914.111356-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pkrempa@redhat.com, vr_qemu@t-online.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/22 12:39, Paolo Bonzini wrote:
> +        if (rc < 0) {
> +            if (rc != -ENXIO) {
> +                warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
> +                            "error: %d", rc);

Better as "error: %s", strerror(-rc) ?


r~

