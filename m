Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD12580164
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:39782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzmx-00048i-23
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFzlB-0001wm-9h
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFzl7-0002l5-P2
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658761956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nc204jzX41RsuCL9R7hRlF3zrzx30vq1QlH1BUCYeBk=;
 b=ZkDzTwoqKTTMV8ddAJ+/bwCLGInS0NGKMPKb4Ox7rC3MRtnQ8mXVR/sUL2FJx/Pql7fL5b
 C4WLEAFLwiZYdFxGOUpedj5+kJVhy55JD4qr6MKhFa8wAOZcU0iBtY3QFQOVNW33WDCY0A
 d6uAoHOHW1lS1vmvlJkWFavm3/8FnkI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-v6fM8ehaNq-hkiNzZYh4Mg-1; Mon, 25 Jul 2022 11:12:35 -0400
X-MC-Unique: v6fM8ehaNq-hkiNzZYh4Mg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003a315c2c1c0so8831319wmb.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nc204jzX41RsuCL9R7hRlF3zrzx30vq1QlH1BUCYeBk=;
 b=kpcCngj3s9ccHqPTDb6IrKVlJzh40VGsx7pQb9D2Ogks4KpFHN+Nd6OetUOt6bDhfQ
 vKKJPtxGa6fW4ZmdOMjLeoHJnPvKUGzO0MxlLK1hhiz+I0jaOm4/agzipKFqD9k5jkuW
 peAl+V0jqhXKokSMlZU69TJYKDKEW3e/E0PLNgTlLmJI0jgUmQkK0qtxJ6zQpYqvMar0
 3XJgPftPiAyj/9liR2zzUPQY9oZIh0voKc5ZdevWZcPoq59D1JS0/b3hmpd4Id6jjedi
 T50p/OqDGKT3pPWVlMJl2/pNJkmrLVgwycJfets5ZRPQYI+SIFGak7Pnl/xgWp7dYmqQ
 LyJg==
X-Gm-Message-State: AJIora8eAy8eJ8hM4PcCe2rBz5HuxQhQurrIQojXHrA0e5AzeKjk6o28
 3UQeHFrWAMA4E8g3zvLa4ihHX407cRfyjMQaTpnY5wxzivsyKtR+FOWjcIbY22Mz+ZoG4GPxu+4
 Nq44uWfw7F1OxA50=
X-Received: by 2002:a1c:f314:0:b0:3a2:fee4:91d4 with SMTP id
 q20-20020a1cf314000000b003a2fee491d4mr20775726wmq.108.1658761954025; 
 Mon, 25 Jul 2022 08:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5ScIPNs+S3sC5PNB6fb1UQ8C7Jx3Tf6mhribmCKCJGMx3MTqRDTv7MMC9EYIOBGxwsLquNg==
X-Received: by 2002:a1c:f314:0:b0:3a2:fee4:91d4 with SMTP id
 q20-20020a1cf314000000b003a2fee491d4mr20775704wmq.108.1658761953654; 
 Mon, 25 Jul 2022 08:12:33 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 i13-20020adff30d000000b0021e4982270asm12467747wro.13.2022.07.25.08.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:12:33 -0700 (PDT)
Message-ID: <cb75282e-40e1-a18f-368c-3e15b5369bf5@redhat.com>
Date: Mon, 25 Jul 2022 17:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <874jz5i9qr.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
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

On 25/07/2022 15.47, Alex Bennée wrote:
> 
> Bin Meng <bmeng.cn@gmail.com> writes:
> 
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The following error message was seen during the configure:
>>
>>    "ln: failed to create symbolic link
>>    'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
>>
>> By default the MSYS environment variable is not defined, so the runtime
>> behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
>> At the configure phase, the qemu-system-x86_64.exe has not been built
>> so creation of the symbolic link fails hence the error message.
>>
>> Set winsymlinks to 'native' whose behavior is most similar to the
>> behavior of 'ln -s' on *nix, that is:
>>
>>    a) if native symlinks are enabled, and whether <target> exists
>>       or not, creates <destination> as a native Windows symlink;
>>    b) else if native symlinks are not enabled, and whether <target>
>>       exists or not, 'ln -s' creates as a Windows shortcut file.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> I'm still seeing Windows build failures such as:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/2765579269
> 
> and
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/2765579267
> 
> Any idea what's falling over?

No clue, but FWIW, I had the same problem in a run from last Friday here 
(without this symlink patch):

  https://gitlab.com/thuth/qemu/-/jobs/2758244223#L2817

I've never seen this failure before - so I guess it's rather something new?

  Thomas


