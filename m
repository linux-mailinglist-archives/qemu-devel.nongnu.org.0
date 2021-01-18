Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F78F2F9BEF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:41:01 +0100 (CET)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R1w-0003jx-4c
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1R0g-0003AJ-Vq
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:39:43 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1R0f-0005hp-Dp
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:39:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m4so15738706wrx.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xtfACpCfBTbNvTVXE/Yc4V/mV4U6kCZ4KDnHksBYMqs=;
 b=iPfOeuPxhb+88oM5dxs8SJmQyAhrgXKReYp6VfsWnKHK1a5MGeOvATbVRjY4ryA94z
 +VJiCzKCsBnvz8bAmdyMY8ywBkGyQVw77zCQBlKNufrNBm5io4ogChEQKvoDa1LjCZO1
 BXKWh1z0te/S0QRvrN73AOT4owpdhtU0OPrHXf6EpgMG7gMTNerbIVPimnuifPVEcuDm
 6i3TbAGgwvAOntABEcakMUmWWr+KD0PgGIftiybqiiLn2ATdA+Wy1HC8A8lbkw6WKNY6
 mnkpKWYcUadejGoyE8rPoX5wq98MHBEu9ekOhh9aoBAL7L43X68L1npFn3OYDPbm9xWf
 yzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xtfACpCfBTbNvTVXE/Yc4V/mV4U6kCZ4KDnHksBYMqs=;
 b=TyHxlPwEWxQlL6iS61TUWCQIpfcjW7jTtJGOWz7ZYXMY6D7k8S6/GXoWvHK/O7Qcqp
 PG8JjTHSNr3fS8JXKPllRckhH7OBo7dLJ/KcQwSannaUwZ9KOLvkbd5n9SVYPPx+BumJ
 FYTvoNHQs2ul6wnR5sAnSeILVrVi6YoC2qW6+y1GJM/22BanZaqA52UQxwaV+ZM8+yCV
 0mYIPkafeGK4WR2rzigJqFMbQnUWcAYO9WEOb4wvs9AF3XERK9jYoHxA77kq3hHMILjM
 n9vNqQyKg4FYtql/Cnz7w122UukHlI7WM3cN+ztxSLUV1+vX6OeJBIS9wskmxVk9trVT
 L8TQ==
X-Gm-Message-State: AOAM532vqlIt7FbFDpWLCBpdp5VOe56XiAmJyNkflZsiMErX/ov0YrI3
 kutU9W1BSeNMv9N/pw11xtY=
X-Google-Smtp-Source: ABdhPJyymy0MOTTcNfFaaNTNq91wcR0c2R6ruGAfmOI1dfGViwu569VHnhEPuzZAGbcfKnOKaXRfEA==
X-Received: by 2002:adf:f684:: with SMTP id v4mr25413226wrp.387.1610962780046; 
 Mon, 18 Jan 2021 01:39:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j13sm24111970wmi.36.2021.01.18.01.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:39:39 -0800 (PST)
Subject: Re: [PATCH 4/6] accel/tcg: Declare missing cpu_loop_exit*() stubs
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-5-f4bug@amsat.org>
 <fd7e64cd-d2cd-104f-ac1b-f5476e08b5a9@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <47f62c85-243c-ba70-56d6-0157afa5ae86@amsat.org>
Date: Mon, 18 Jan 2021 10:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fd7e64cd-d2cd-104f-ac1b-f5476e08b5a9@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 10:29 AM, Claudio Fontana wrote:
> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>> cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
>> and are not available when TCG accelerator is not built. Add stubs so
>> linking without TCG succeed.
> 
> The reason why stubs are needed here at all seems to be that that the code
> calling cpu_loop_exit is not refactored properly yet;

I agree ...

> if we look at the example of i386, after the refactoring moving tcg related code into target/i386/tcg/,
> (and really even before that I think),
> the code calling cpu_loop_exit is not built for non-TCG at all, and so we don't need stubs.
> 
> I am ok with this anyway, just wanted to convey that I think we should look at stubs as a necessary evil until all code stops mixing tcg, kvm and other accels...
> 
> Thanks,
> 
> Claudio
> 
>>
>> Problematic files:
>>
>> - hw/semihosting/console.c in qemu_semihosting_console_inc()
>> - hw/ppc/spapr_hcall.c in h_confer()
>> - hw/s390x/ipl.c in s390_ipl_reset_request()
>> - hw/misc/mips_itu.c

... but I have no clue how to refactore these, as they
are used in both KVM and TCG.

How would you do? I'm stuck with the semihosting code
dependency on ARM since 2 years...

Phil.

