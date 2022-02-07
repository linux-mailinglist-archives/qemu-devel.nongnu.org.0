Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22864AB8A2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:25:20 +0100 (CET)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1Cv-0003nG-6K
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:25:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH046-0004MJ-S5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:12:07 -0500
Received: from [2a00:1450:4864:20::62f] (port=46814
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH043-0004zp-NP
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:12:06 -0500
Received: by mail-ej1-x62f.google.com with SMTP id o12so39998561eju.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/85EjmFSM41Lf+gVP2nSU8fKRYdIzc/G7jHZ+lcudaU=;
 b=IWp9RwoYaVcmBtZ+75vf08+WpXxHLIG6BemhuXvgYu30HFX4P4Hunn4H0FBERxL7L7
 VLP+M9MXV43lMOjPZ/1Z+UB1Ftja59vH8gmuZJrJacAG7JHeoKvYvZc21VdyJNZ/L45R
 g+XtA4NJFdrYfgXYBGIEl1aLe4Q1m9/9zbhRfcMEBlb5jnV0QIuI1N6RST7L7a4Hksxp
 cdGk4WxNnktGuTAVLlUwzMcYxy/wnvJwirGri/4WyoPKd0Js+Zig14StdFSTXRRJnrTA
 kh4FcbaEF+7MhZ3bTYjtOpO5vjWcNWGrdRB46dJHzcc/D0sfNBQHKq1iRRpvIkyVqgJ+
 pjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/85EjmFSM41Lf+gVP2nSU8fKRYdIzc/G7jHZ+lcudaU=;
 b=kzq4SYGzCAgTKutp+ZL4lxoneJjO2WTCT1YKYLI5cIGGxVZ5VniciMpAa3OwI5AveV
 PMPUtGdas4NfBscxvOHdnON3L7VHg52MCR2U6YzItByoYvchqbUJHrgVuB857bm1BpbB
 0jCLhat8dwxAOHnGRnae1wwHu6O0zeJ+032sPk4Ic67vZQecYRlrF7TMgz47PcEz6uyB
 h5+uQ2B+1rXSeM5FAuBk50IBUdWe71g0TFQWhzIwAu2BiLY8YF9VrFWiqYJuJ+BT4RW1
 n1HO9jQ99itLSmvagoM8Rg0KGjT61B7ospKMZdSi6GSbTdkmlFFzwoQ8pxXTmBfUtF3S
 KKKg==
X-Gm-Message-State: AOAM532+J4lEa0jwY/AIckqhnPqK5u2m7xFXHcRwZ+GAWup4VDvWYn7Y
 2KO5DSGPRkJcuqbZ7KVFt0E=
X-Google-Smtp-Source: ABdhPJxJ1LgOvtQVbclcRCKrdTAN4Yseypnc/Oey9rUiTspn+Rl32DflxVLyw9AnCByt1V+WMDNEUQ==
X-Received: by 2002:a17:907:3f93:: with SMTP id
 hr19mr810605ejc.594.1644225121077; 
 Mon, 07 Feb 2022 01:12:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 5sm5048625edx.32.2022.02.07.01.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 01:12:00 -0800 (PST)
Message-ID: <b2317570-92ec-d66c-462a-6b57516ea387@redhat.com>
Date: Mon, 7 Feb 2022 10:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Add TCG support for UMIP
Content-Language: en-US
To: Gareth Webb <Gareth.Webb@umbralsoftware.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/22 21:27, Gareth Webb wrote:
> @@ -7382,6 +7383,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          case 0: /* sldt */
>              if (!PE(s) || VM86(s))
>                  goto illegal_op;
> +            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_ECX_UMIP && s->flags & HF_UMIP_MASK)

No need to check CPUID here (and below).  If the bit is clear, 
HF_UMIP_MASK won't be set.

Otherwise looks good, thanks!

Paolo

