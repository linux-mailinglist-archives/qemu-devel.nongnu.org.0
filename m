Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DD4D6939
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:56:00 +0100 (CET)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlMl-0006ap-Ui
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:55:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlLK-0005vu-VM
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:54:30 -0500
Received: from [2607:f8b0:4864:20::42d] (port=36844
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlLJ-0004o0-Hs
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:54:30 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z16so8749888pfh.3
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wOD9K/wK9pkl58wLeXpODnjyFT2nNis8HBn+n9q0unk=;
 b=ngJtDGWVX4XBfrK1RD8Fyzmbvdrm1TgEGgEj9KYiBznFi6X7FKfFLjuYrVtfG/r2/k
 b9ylZxh1VjJPh6x537OfEVVolURiYwR8tt8lA/FFSt4ASyjjP4MxLCB3l+tWdAuJoBjS
 VTFLEmeNwHSFUg8PKNTW7S0TD3eoD9Rhdqt93q+T+WZ92T3gDxIQlW1D53qZVwtpq7bB
 Ck1O4te2InjaxmZVBcAHEhIC47wYdDsbn3j334qgGhAw5SZVPy9Ei60y2tpuQCbgMurx
 pQ91RquWFmiKpxaf7ILqLTBqv7izzWajw4huxwzGsfAbcEKEb6pjjMUom8nZd9HTXs2D
 PAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wOD9K/wK9pkl58wLeXpODnjyFT2nNis8HBn+n9q0unk=;
 b=eVNGCPZqIMUbwbnb1Md/NTxN5HGj9zqBdqKM0nLc80rdENIkx3zTHy8zSK7xPoiFP3
 VidYjv4Vjm0TtSEL4AcZI+zmndXTuO1VUtYE6tJB8a+Wpgt+OVJHp+smMzIssGpSOLdK
 IcIN26yeAjzc8gv75unrLeg3Wl81Yy6vKAhxacmAEAPPFEMk73YHeSeppzgIL/XJDm6T
 L+m8MwlryNVQZzpxYXyTLxUMWq6elpJdmIsmF7f3JpWF5tmApLXDzHb/sk1qLoVNceN/
 9HL9lAmM8Lbhi4N1Zi52VzyANn9nWSPQLGyMQ88ixis4os4Yf6bAIcaAyhF9MMQZWBha
 iFFg==
X-Gm-Message-State: AOAM531OYZSLGkMBZpqE5w6O4t3NnlMo0N+6uS/wAohYTzM6VzL1tghD
 k00kQ0ZoHmzRhp5iJt9qNkfi8A==
X-Google-Smtp-Source: ABdhPJwY+FJEFR2w4gM0Dg8sIUgZcicOuoL7hh2P3V9tay6B8Rd18UcUFm5Blr3mdcQ0NeOb5/IRwg==
X-Received: by 2002:a63:c144:0:b0:373:d6e7:e78f with SMTP id
 p4-20020a63c144000000b00373d6e7e78fmr9676292pgi.571.1647028468109; 
 Fri, 11 Mar 2022 11:54:28 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00234900b004f6feec0d6csm11069440pfj.2.2022.03.11.11.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:54:27 -0800 (PST)
Message-ID: <c49115cd-1cdf-7cd3-2c14-49406eb3af0c@linaro.org>
Date: Fri, 11 Mar 2022 11:54:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 9/9] dump: Consolidate elf note function
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-10-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-10-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> +static void write_elf_notes(DumpState *s, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (dump_is_64bit(s)) {
> +        write_elf64_notes(fd_write_vmcore, s, errp);
> +    } else {
> +        write_elf32_notes(fd_write_vmcore, s, errp);
> +    }
> +    if (*errp) {
> +        return;
> +    }
> +}

Are you anticipating adding more code to this function?
Otherwise the early return, and the guard are useless.


r~

