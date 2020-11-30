Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32712C8C9D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:23:29 +0100 (CET)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnpg-0004gQ-IF
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnoU-00049k-4t
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:22:14 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnoS-0001dE-85
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:22:13 -0500
Received: by mail-ot1-x32e.google.com with SMTP id f48so3734493otf.8
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TGbG3b6lbod0Yn93MW3aGBM3YqTTII/HrSDVJ9RT6Qo=;
 b=R1YaElMHI4a6tk4OxLrsuP5DaC+JFhqqlcyHkIY3KCoC1LBYT+SoI6YfRM7deB+syf
 0vBAh6SjabnB373uDzSNi9hr+B6pUPDezcrtHIQwcA/RxvowQqMDLGKwWxOXgaXCxp05
 GWqzsFg72KWkU7ltOCT9JJino9JodkYuFJlobSEwZ58FWU2J3UPux6SUTjPR2kGjb4Ah
 +9GoF0SMqCnBK3+KqgIqK1Q6nko5ZiEcoD0Nrf2CQcUBZ3sUPz71Xea8Agk4RjGXvzzz
 SB6bG4VjNeX2qlulVQ3k5O2p2i67UxSfa5zvdOWxTEIsMmM6rS271fuSHTc3qZ4ydJMK
 mIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGbG3b6lbod0Yn93MW3aGBM3YqTTII/HrSDVJ9RT6Qo=;
 b=RNHZ/p73T/IfF9u1d/i5gUdP3/KluzuEed894AELftF66rBbkKHLhuEODXtRKgHxsb
 6su8bVgd6C/l6/DIqB4w6zo0GJG/uJf85H2mtQV93EcOnrbYtCfrKpldiO/VocRjaSr2
 aBgDnwghER+GKj7Vl4lp2WxEY5QaA6NrSdTItTkSEEQjTh6ViGA3p8bDe2tg0+TUMJiK
 DBfyDfembGhmN6nr4FgGMBWLbNplQkt+3Mp0KlkDxrVhBtNIpmydhebdKWCbpzDcoRt1
 XuatdXdndicFFv4mYmE+BLdvU51Hpgv4lhQBPDD5t+QE4q+M8r0ayPSgv/86y0Pu519H
 ZoPQ==
X-Gm-Message-State: AOAM530sRXZq/lEc+Ub7bc8EEVgAdUUTkNKDYJz8pWmq7NMw9V7+W3A8
 EBydSSL72oH5DfSir+ezVQsFqQ==
X-Google-Smtp-Source: ABdhPJzy7JwJwhz82qvTB4mKjXaig5saVg9nRtv9OBypD+CwO+RxXTxosJ/7b8X5MKqhigr3FeG1kQ==
X-Received: by 2002:a05:6830:3151:: with SMTP id
 c17mr17904264ots.336.1606760529863; 
 Mon, 30 Nov 2020 10:22:09 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o135sm10010862ooo.38.2020.11.30.10.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:22:08 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow use of hex/bin format for argument
 field values
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201130122639.2431070-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <080ab4ac-aa73-a5c6-6dec-7c91d0337111@linaro.org>
Date: Mon, 30 Nov 2020 12:22:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130122639.2431070-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 6:26 AM, Philippe Mathieu-Daudé wrote:
>          # 'Foo=number' sets an argument field to a constant value
> -        if re.fullmatch(re_C_ident + '=[+-]?[0-9]+', t):
> +        if re.fullmatch(re_C_ident + '=[+-]?(0[bx])?[0-9]+', t):
>              (fname, value) = t.split('=')
> -            value = int(value)
> +            if re.fullmatch('[+-]?0b[0-9]+', value):
> +                base = 2
> +            elif re.fullmatch('[+-]?0x[0-9]+', value):
> +                base = 16
> +            else:
> +                base = 10
> +            value = int(value, base)
>              flds = add_field(lineno, flds, fname, ConstField(value))
>              continue

Well, the regxps are off.  No letters for the hex, and 9 accepted for binary.
I think with the right regexps, just trusting int(value, 0) is good enough.

So maybe something like

  re_C_ident + "=[+-]?([0-9]+|0x[0-9a-fA-F]+|0b[01]+)"


r~

