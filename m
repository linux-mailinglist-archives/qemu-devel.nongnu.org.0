Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DF2F09C4
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 22:03:16 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyhrn-0002TK-1I
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 16:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyhqd-00022G-6P
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:02:03 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyhqb-0005rJ-Hs
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:02:02 -0500
Received: by mail-ed1-x530.google.com with SMTP id u19so16816629edx.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 13:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9q/Fvk+28GOFVvHrftWBgEwjNFjsnhXFMpnrj5ogdLQ=;
 b=PjNhD6A42MyifQ87WIRIZcM1r+3x3T0q5go3OvUlxFmFQHLq/1PKLwKBOM29i67bB5
 oKy3cTHIztJkHSwXM2y9pESkbEAhGtTgSj1tzlbCC2NgpQ2BPiYfSC5zwjI7md2uNPay
 wA63oPKk6hlaWOQZjeJCLp7Unb7mQavfsnws3ABdpJG/iuwj6qB3DExkwtBwwrE/OJgq
 /G1qVBc6s1zlufxyiqPQJzguUrsR5uVsl1t6GeONk1Av0/8Vq4j98g90cRnsPDrRP9v3
 U93swJTUrB3F7E7jPbqUcwTbPw1TgzduFxgI4M7TRQ6G7nzip0WLus9hCKj/whR4ca6G
 Rq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9q/Fvk+28GOFVvHrftWBgEwjNFjsnhXFMpnrj5ogdLQ=;
 b=NdzscExaKtPT6BwIoYIClUvqftYocspvsioy5XO3RjGYeYVHHuMQCguiuFQfUocfoD
 IUSKeRilyC1NDnMarO+txggOx9ct2b0nIMFtvhc6TqMb0nHeWWYWJTxgXzaDAPALv7gS
 M5Bmz9rHFlGpMbdN04FoSUG+GJqYFYYuuI7p4VOhFNHnL0SgoV40aJGEDjP0OySETrZJ
 htM2zer18iDGVi+Tcm4eL+8+7faXC7XbHf4ubjg4G83+OCfoavG0MR2uKlhm8prtOioG
 jmRQYDwWAOiCivURzy6Vms3dVZAjPWpoL7ARYkBAC4wN7/MHeRm4YyZY7C6kARSjdgH4
 etuA==
X-Gm-Message-State: AOAM533GXM+M89OhW6MRV9xZ/4+F93ZoZcrbH0R40Jn+ZnXCPavZMr6X
 hClSeh4IMvmi8UV0aGnoe3o=
X-Google-Smtp-Source: ABdhPJzm9Wr1t8enC8qO/aVbeRHB8SBh655oWit0pde2cg/G3DZuwkTN0JhSJ0hwEdB+3tbhEaeXnQ==
X-Received: by 2002:a05:6402:312b:: with SMTP id
 dd11mr12344708edb.308.1610312520087; 
 Sun, 10 Jan 2021 13:02:00 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id p24sm6677906edr.65.2021.01.10.13.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 13:01:59 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg: Mark more tcg_out*() functions with attribute
 'unused'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-2-f4bug@amsat.org>
 <6aa1a388-6493-259f-a3d2-817c30d29655@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <023e738e-ae2c-252b-8475-98a8e579ee6a@amsat.org>
Date: Sun, 10 Jan 2021 22:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6aa1a388-6493-259f-a3d2-817c30d29655@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.012,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 6:51 PM, Richard Henderson wrote:
> On 1/10/21 6:27 AM, Philippe Mathieu-Daudé wrote:
>> The tcg_out* functions are utility routines that may or
>> may not be used by a particular backend. Similarly to commit
>> 4196dca63b8, mark them with the 'unused' attribute to suppress
>> spurious warnings if they aren't used.
>>
>> This fixes the build with --enable-tcg-interpreter:
>>
>>   [98/151] Compiling C object libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
>>   FAILED: libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
>>   clang [...] -o libqemu-arm-softmmu.fa.p/tcg_tcg.c.o -c ../tcg/tcg.c
>>   ../tcg/tcg.c:136:20: error: unused function 'tcg_out_dupi_vec' [-Werror,-Wunused-function]
>>
>> Reported-by: Wataru Ashihara <wataash@wataash.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tcg/tcg.c | 30 +++++++++++++++++++++---------
>>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> 
> This does too much to fix that Werror, as all of the other functions are
> unconditionally used.
> 
> Alternately, I'll re-test and merge my tcg constant branch, which will make
> tcg_out_dupi_vec also unconditionally used.  Then we don't need
> __attribute__((unused)) at all.

OK, better then.

Regards,

Phil.

