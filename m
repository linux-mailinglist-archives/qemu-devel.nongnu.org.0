Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D384BDA7A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:11:43 +0100 (CET)
Received: from localhost ([::1]:36406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMALm-00072s-Oz
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAJN-00057p-Lm; Mon, 21 Feb 2022 10:09:13 -0500
Received: from [2a00:1450:4864:20::42e] (port=41617
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAJL-0001oT-Pz; Mon, 21 Feb 2022 10:09:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k1so27612504wrd.8;
 Mon, 21 Feb 2022 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VFrqoTCoTxb8Y7/bCTq8pyWkoZRMSpFsOtp809yOs04=;
 b=OPe04mKihkNQkhTerZ9WYu/K4ZdnKvZ1v6bvZQvnUYx5tFJGhN5b5Z8lE5xWd6eJV/
 iW5gqTBEp0cIHSH9MFFo1QwyvaOuOwXVqrqXnbOhehy1eKqwHHvyZar8S0JeSmdFubDa
 1BPKjCppGukujRm/Z39OHMpb+aFMrdNDhMq3dsxEdaXDC2p/9kJqv/M1yPw9Pnk0Io+s
 4CoJAJBwghcMYLK0Yaq4nh+PBJy6IkkiN5ml3kOhvFWnwnxflibL1AhpLgVWS35LAMMY
 Hst31W8hGs6j8m1sPLmYmsDjiDdiqKLtCYaDa8sDhLQ5TbNm8lLT2mT5cYBSc5Ghe2rq
 0QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VFrqoTCoTxb8Y7/bCTq8pyWkoZRMSpFsOtp809yOs04=;
 b=Tvx/b31rsMUwgzEuumn25hnn83443dluk6hW7XHqkzlrO/YpwTC30zpzJ/OECHTFtO
 Km7IaFAfRkflSB3wUsIS+oA9tvlYnxwXVvCR8j0f13s9eNA8/N15Vvc6yo3mrarJ1GgA
 QXwoVXJaJ21qvH7NINFIQbW66WpWdVxa26JPnct4Jp7jbm2/XrmmwPDRsM7IR97ziOcp
 gp1/UfEj106qpVlL4COxxVlA9lRQXfATOUIAJB6XJt2qIAW87EDZfakQQZQbcKrMPGuB
 OQaNK28w5gmvvu67mXohFCsfuDNEg8CSZ41ygnWHwO8vsjPN6vujecmUuEDFKyB9t8Oa
 1C3g==
X-Gm-Message-State: AOAM533iBGFjPzKKRvAMZJwIkw1SI2wB7o0NXmKLGEp45TnBOeA/QNhN
 DPdopNyR8k4T7MMccIP3r74=
X-Google-Smtp-Source: ABdhPJw08V1kP21bV8m3Tpg5rIqJt/QWVCek/hBMDiatHXRotN2861pRXrkF87VRo19EnbxBOnsl8Q==
X-Received: by 2002:a5d:6d4c:0:b0:1e6:335f:6b65 with SMTP id
 k12-20020a5d6d4c000000b001e6335f6b65mr16930065wri.371.1645456147804; 
 Mon, 21 Feb 2022 07:09:07 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm8736640wmq.17.2022.02.21.07.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:09:07 -0800 (PST)
Message-ID: <33126ecf-e70d-ce9f-1933-af781b5dc166@gmail.com>
Date: Mon, 21 Feb 2022 16:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221142907.346035-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 15:29, Stefan Hajnoczi wrote:
> qemu_mutex_iothread_locked() may be used from coroutines. Standard
> __thread variables cannot be used by coroutines. Use the coroutine TLS
> macros instead.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   softmmu/cpus.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 035395ae13..005a5c31ef 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -473,11 +473,11 @@ bool qemu_in_vcpu_thread(void)
>       return current_cpu && qemu_cpu_is_self(current_cpu);
>   }
>   
> -static __thread bool iothread_locked = false;
> +QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)

While "qemu/coroutine-tls.h" is indirectly included by "rcu.h",
please include it explicitly.

