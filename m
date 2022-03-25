Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F74E756A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:50:40 +0100 (CET)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlGx-0005Er-Gz
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:50:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXlFE-0004Mk-8h
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:48:52 -0400
Received: from [2607:f8b0:4864:20::229] (port=44923
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXlFC-0002wI-Kf
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:48:51 -0400
Received: by mail-oi1-x229.google.com with SMTP id t21so3489489oie.11
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WUKJSnZTD+oFAy3hJZVo6hplP7w0kOaDgY999zfbzGc=;
 b=Zll2te4xRsqy4G14wuzEHK2rx2iTeqjrZBcRR1zGJGVOSnvjx6HT53hPhzF8uYVEfL
 TcE25sk9i1AG/AE+t/TH9cH5k5aYFVu6iVjcipWRy/52/CHjeinOYus7SeZRVAXtRR4U
 JU15adY7guUUq+edC+ZfJ15GIkTlGPxJoBVb0V3N/zaXPQxziegx2z5YHh89uaPu7105
 jm9YOv0LSVi02BNetjoGlpbPoEBpv7H4zgsdLAlQZnVUWwluLxIqh69l3EPqQ7yxFGwL
 jyTwQsMU8txuX6yg3RLT7MD0saqqXWJP1ztMX1bPBIjx3uzOr+PmoXPCIZCl3TRKhHwT
 pq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WUKJSnZTD+oFAy3hJZVo6hplP7w0kOaDgY999zfbzGc=;
 b=hDnHRAdrIhbt8qo/XQ626CgQxFrtki8Npk8NioGpDd8NHS9zUd+80BvWn9vWjH9xW3
 TQd5fcDHi9mrxSIqHsJEHq9vmwGC55f9V7Sf5LVg7IHhTYv87GMpG7Fo2x8Qn7do+Pm7
 ysx9uzunw9G90NL7DcBRgk7EJFE52BAgnmhbZZaAqtlkDG9r4xpjSH14Mfr0VhtZe0RW
 DWTqD0Fb99dXoRCs15HvFxx4xrzZqCdt6EV6maaqARKEOOQpOCqzi8nkWLUiX6EHmts7
 SFhSrkzRcBlnclBwHXRfiI3kWIEbaUXEsMlG5mfZ8kol1zx84fsGwC/sSuOzDY7cYW5g
 rcOw==
X-Gm-Message-State: AOAM531AcmVKe3X9kPb7QRBjl0KHo3Jza4oUn6UltorRyj60EM/mpEdx
 UU+TjleU9iI5KMPuet/iOrGoJw==
X-Google-Smtp-Source: ABdhPJyzrBK22fcTFTRcdacsFSH2Oo5VqRRa4DoDFhl8yiMguZE82sR0zeghpl0LwVRHFA0A59nx+w==
X-Received: by 2002:a05:6808:1443:b0:2ef:4a7c:e9ca with SMTP id
 x3-20020a056808144300b002ef4a7ce9camr5262954oiv.116.1648219728653; 
 Fri, 25 Mar 2022 07:48:48 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c189-20020acab3c6000000b002ef8a16e8bfsm2837564oif.43.2022.03.25.07.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 07:48:47 -0700 (PDT)
Message-ID: <5a811414-b183-d34b-3094-ea7b3cfb4c68@linaro.org>
Date: Fri, 25 Mar 2022 08:48:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/i386: tcg: high bits SSE cmp operation must be
 ignored
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220324080847.69459-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220324080847.69459-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: sonicadvance1@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 02:08, Paolo Bonzini wrote:
> High bits in the immediate operand of SSE comparisons are ignored, they
> do not result in an undefined opcode exception.  This is mentioned
> explicitly in the Intel documentation.
> 
> Reported-by:sonicadvance1@gmail.com
> Closes:https://gitlab.com/qemu-project/qemu/-/issues/184
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

