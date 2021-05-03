Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499CE371613
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:38:52 +0200 (CEST)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYmh-000409-CW
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYki-0002Tp-05
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:36:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYkg-0004rZ-GS
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:36:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id g65so3355684wmg.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N9Of1VbnlNPDwUUzpCMjjflrvxqZ9Gm7E/IwfrRlBpE=;
 b=Ft0R25Ej/2lVYhmsnULvPQagb3t1Q38Ab0GtJr/0ohl1Se0tJSuLBZNdsU94E3DJeC
 C/PnZi2q8Du9Rf76CID+ZqyhbB5ecshrX31ITNbENe0LHPDnm2LIu3gVabenCP59Mzg3
 s7QVf1cGszXN0ILRk3AVZnsUr+hedPdozca+T+DjWYASbCV3j0WMJaVS9slto2xm6MeT
 a2AqOKXKz4kccbR7l19+OXTj4o9OreScscYIzW2NJo84v529LxeG0/YgqvLX5BDFtBXe
 ztWeUghIElUJWxsym7M4oZzPGano7k4ZpicGwpGtQLmc00+Mvpp+j5VcsxaxVwulkmd3
 oZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N9Of1VbnlNPDwUUzpCMjjflrvxqZ9Gm7E/IwfrRlBpE=;
 b=ZJLCddF7V6Ynvj2QtKEIJVoN9ta5QByez1d5hEE4TwwqpFlHrmqkBbBxbBSZSQIpbG
 k26po2Ut+Lscx09OWCErySSLNa1h1p/Nbm+HWs/mXm48TOeYvfTTHhxUyFrBuKgp+kdD
 7ckVubUWAjkVzzR0u+d4IkLqjzJu4QhOroyvRx/SDZelejrDQwENShdcDC88cCYSQoYM
 GUE60KdmMQxYYFEh7SvQl70nm2KU7V8c5jwgWvnJJpI66/eX08yb7hCGE6Q3UJCtLVmH
 Odx9VRZy/DVNXMZKRm7/HjE6dbutFhNnBVpCljusmlN6dumIMzRBFT1exbIaWebbSg2l
 8arA==
X-Gm-Message-State: AOAM532dInh+4wVxMymTzDTACMyRv6KtPnz9Qxu4lX4W7cT4dRy8Q8eM
 USlGVYqyfMwVVYvv16CfZAE=
X-Google-Smtp-Source: ABdhPJw3wB7tjXTcWmRV8dORShcg+OlmMI/CTQnaT+ceA22ki04PwdPgj5sKZMUYtzAaCnfKI8ekbA==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr17973566wmc.179.1620049004660; 
 Mon, 03 May 2021 06:36:44 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y8sm15318886wru.27.2021.05.03.06.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:36:44 -0700 (PDT)
Subject: Re: Problem with Avocado and QEMU console
To: Willian Rampazzo <wrampazz@redhat.com>
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
 <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
Date: Mon, 3 May 2021 15:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 3:12 PM, Willian Rampazzo wrote:
> Hi Philippe,
> 
> On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Cleber, Willian,
>>
>> Avocado marked the test_mips64el_fuloong2e as failed while
>> it succeeded:
>> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
>>
>> Apparently the first part of the console output is missing.
>> (Normal console output attached).
>>
>> Any idea what could be the cause?
>>
> 
> The log shows the following:
> 
> 12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
> found in console: "Kernel panic - not syncing". Expected: "Kernel
> command line: printk.time=0 console=ttyS0"
> 
> Does your comment about "console output missing" means the expected
> message was supposed to be on this missing part?

Yes, "the first part is missing" so Avocado didn't see the expected
message pass, but the messages emitted *after* it are logged.

