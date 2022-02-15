Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B22E4B6D80
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:32:28 +0100 (CET)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxwQ-0002Nw-UF
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:32:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxoN-0008Fn-1D
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:24:07 -0500
Received: from [2607:f8b0:4864:20::435] (port=46607
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxoK-0005CW-Mo
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:24:06 -0500
Received: by mail-pf1-x435.google.com with SMTP id i21so33382707pfd.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bdU53Wxy90oHEvKBWpMem064Zss1imi3mca5C8w3BGY=;
 b=jNfnUYSyU70y1pIZKqX1Ri4fIg0yuEg9SPQtsPKIwXXe5XAsbpTy3WGnNDl6zhhB6P
 +Bj7A34e2CN8L8pzP11VUtDp9V0bJie8iYKANep8yLopMvuyqZFCaa22JsDHoksx/RIW
 5/DyCtAn3NX4GgCyXG4OjnHmcgEQVbGO5y1A3oYMb1bCnKjZtRhOnAqOi43lCsdsnRQS
 knCJS21QVfk6lexgY6Esn8pF15jrD82SfRPeucAqDC/++J6boc8Qb9sNP4WNgtjIAafQ
 JnajSTAD6fvWey8Qf7JjXbvX4jhiBH4/1gKStroaKjmxfaDYwlUGN1k8ynP7UEKZ8wNL
 KAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bdU53Wxy90oHEvKBWpMem064Zss1imi3mca5C8w3BGY=;
 b=u0B31ce3XKAyx1ZIgmlqiqWOqAJ7xkfICR6WdLUQQIlmtfvYWZUmC5WlpJmvG+YrBA
 U+JxQP0U7VzOT0oo4gXszDJLU5GPu0iuDEa3S9mYGItjG+LiObWTpbeJnJk2UQGXvNtQ
 pwDulP87FwqlUFhMgiIxo5evswmafWOyQ0ajLSjjhlTFh0SG3DKxgUTHUTjtR754W3Re
 3UnvYwq2mD4aBM/JwxlPxdu4tk0e3gyVnzHXWN9ib21LpNMhKFa+KuEXN7qxqCqKd3Ui
 VrWJ3CPIF1gY+zI2mwDdKB90DTUtEz71ReLIUxqepNM4quNnsWmiDG+LeDqHUIkyJPVE
 tU+g==
X-Gm-Message-State: AOAM530ZoAUO+Lb1zscm3sClJlP2Z2Xr99MIv4UnbL84cZXHiv6hqe+2
 T116Po+RClIvtYA47AoQ98k=
X-Google-Smtp-Source: ABdhPJz3IY9AtfwmMGfgjc71hxqvjLl0QUluAFMYX5b7VN8VRYVqjNs6hwuIn9jq5UYJgKiq/VQzDQ==
X-Received: by 2002:a62:7655:: with SMTP id r82mr3866429pfc.51.1644931443269; 
 Tue, 15 Feb 2022 05:24:03 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id s15sm40141528pfg.145.2022.02.15.05.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:24:02 -0800 (PST)
Message-ID: <cd066468-d3a8-9085-0c7f-e739976dd09c@amsat.org>
Date: Tue, 15 Feb 2022 14:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org>
 <CAFEAcA_Mp5=iAh=LE+w7Ky+nSHZRA0JSjfwom5JWYxKn0s8HXQ@mail.gmail.com>
 <CAMVc7JWRjZouOeicu6D_WGw4-vR8z9zmrDEhH94SyJd=zQb90Q@mail.gmail.com>
In-Reply-To: <CAMVc7JWRjZouOeicu6D_WGw4-vR8z9zmrDEhH94SyJd=zQb90Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/2/22 14:19, Akihiko Odaki wrote:
> On Tue, Feb 15, 2022 at 9:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 15 Feb 2022 at 12:13, Philippe Mathieu-Daudé via
>> <qemu-devel@nongnu.org> wrote:
>>>
>>> We globally ignore the 'initializer overrides' warnings in C code
>>> since commit c1556a812a ("configure: Disable (clang)
>>> initializer-overrides warnings"). Unfortunately the ${gcc_flags}
>>> variable is not propagated to Objective-C flags ($OBJCFLAGS).
>>> Instead of reworking the configure script to test all supported
>>> C flags in Objective-C and sanitize them, ignore the warning
>>> locally with the GCC diagnostic #pragma (Clang ignores it).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> I'm not really a fan of #pragma GCC diagnostic directives in
>> specific source files, unless there's no alternative or
>> the issue really is specific to one file.
>>
>> thanks
>> -- PMM
> 
> What about fixing then? Something like this should do:
> 
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -652,9 +652,7 @@ - (void) handleMonitorInput:(NSEvent *)event
> 
>       /* translates Macintosh keycodes to QEMU's keysym */
> 
> -    int without_control_translation[] = {
> -        [0 ... 0xff] = 0,   // invalid key
> -
> +    int without_control_translation[256] = {
>           [kVK_UpArrow]       = QEMU_KEY_UP,
>           [kVK_DownArrow]     = QEMU_KEY_DOWN,
>           [kVK_RightArrow]    = QEMU_KEY_RIGHT,

Clever =)


