Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0324216C9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:45:56 +0200 (CEST)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSyJ-00028V-Ff
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mXSwe-0001QS-Vq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:44:13 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mXSwc-0001pt-PX
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:44:12 -0400
Received: by mail-ua1-x929.google.com with SMTP id y3so7709037uar.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uGMyT1g2kQKrR0bm2s4+62LgS0QVbNZJfpQEO0Ykw3s=;
 b=K257wK7+SV6mJ2Wvyl+NXahS+1BfClgc3Mlx/vQiCVTUQOBXwdjbVrV2xxcrIZQMoz
 utJK1prTcE0Hjc6XM+aSiMPyDlZbpJLuIMm0MpHVNYOBKv3LOsZm3/eOE/vRZU3NAC0+
 JgUE0KJipJbNxZVo7HgQXub1nVfXnsVqY2kaxEHVTI7AqN7g8CtZDFinlt/vCM8Nr6vK
 EHx6wINzAhSlntv8o/HDvqzypRAkJH5Cs+HpkzvL3BiW3V+2uTSSxYTEJrhwaDxV92vS
 +7f5z1udJSjeOsNTqib4IPdvHJFazGJ2YDdBDyIy3P3wApJ66uJ1mpxPKsFq1t0SdPGK
 bv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uGMyT1g2kQKrR0bm2s4+62LgS0QVbNZJfpQEO0Ykw3s=;
 b=3UaoKRVPX7RAKQFus7cQnZv9tgkgNw78VSEsl6OBkSVUKuOoeE68/3lNvERQL78MEf
 0Ih+8p2vw33a2Ac67zfd8VmWtF1MpF7/X1DFUfLQeSXHlCcxPG1dz62wWUSkAiFX3XNv
 kxi8+u4Q6flixCAgfUMPLqjlZnQ4TxwmJuLHIV/aLJYqC8xZfmxw5kr8OBehhI96SSCE
 MJ2fP2+PeyE1GSCdZUtjJsoPp5UFp21hQsUlUfFLuUVtIuW2c3Ddfnu2tQ9naQJtvYld
 uei6u2KbuxAQtXi1e4FV2HEQAikqB9OyJUY2UWWSw1scEyLKL0GByhBt6Uy6WDG8FzTP
 ++JA==
X-Gm-Message-State: AOAM532VIWa09gqN3f9ch/lhsHk2INKxZLCDTV9nzB0TJpTOs4j/9oaT
 zKtbw++K0JNHqyyX99jXqrZYEZqMtB7vXg==
X-Google-Smtp-Source: ABdhPJzW6HNNBQRlOHutcxXVyggZjg3qP1QBy8uFTg7FeLyCa8MDWlyYh0MfJK0VNKdtwlgWa3aZ7A==
X-Received: by 2002:a9f:258a:: with SMTP id 10mr3391572uaf.68.1633373048599;
 Mon, 04 Oct 2021 11:44:08 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:3c03:70c5:60d0:496d:7761?
 ([2804:7f0:4841:3c03:70c5:60d0:496d:7761])
 by smtp.gmail.com with ESMTPSA id b17sm7585512vka.27.2021.10.04.11.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 11:44:08 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Date: Mon, 4 Oct 2021 15:44:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=luis.machado@linaro.org; helo=mail-ua1-x929.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/21/21 10:55 AM, Peter Maydell wrote:
> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>> qemu-system-aarch64: -gdb unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: info: QEMU waiting for connection on: disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>> warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
>>>>> warning: Could not load XML target description; ignoring
>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>
>>>>> Seems to indicate it is "ieee_half" -related?
> 
>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>> and there is no probing possible during the gdbstub connection. I guess
>> I can either go back to stubbing it out (which would break gdb's SVE
>> understanding) or up our minimum GDB version check for running tests.
>> That would mean less people test GDB (or at least until the distros
>> catch up) but considering it was zero people not too long ago maybe
>> that's acceptable?
> 
> I just ran into this trying to connect qemu-aarch64 to the
> Ubuntu gdb-multiarch. I don't care about SVE at all in this
> case, but the 'max' CPU includes SVE by default, so we report
> it to gdb even if the guest program being run doesn't use SVE at all.
> This effectively means that usecases that used to work no longer do :-(
> 
> Luis: do we really have to report to gdb all the possible
> data types that might be in SVE vector registers? Won't
> gdb autogenerate pseudoregisters the way it does with
> Neon d0..d31 ?
> 
> thanks
> -- PMM
> 

I'll check what can be done here.

