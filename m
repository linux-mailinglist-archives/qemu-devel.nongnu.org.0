Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5103A86F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:56:56 +0200 (CEST)
Received: from localhost ([::1]:56136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCMx-0005B2-G8
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCIo-0005zs-L4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:52:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCIl-0006Aa-01
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:52:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id m18so19075741wrv.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rPQXm04zQDyGxmKomjbXOazJQHb2pJl2zbQIbkZpstk=;
 b=VQOmQ9qfOss3DMdmqzVZahJRwqKVXy+0kB3HqNSJ61W1hxyYgdjCnW5Ps7OVUAbXbE
 v7ayRlhcm7+WF9u4im4uV9EWwDzYAIkrnOFvq8I47Ysfe1KSeupyFjbPlNamsaTOAX2g
 C4bYZdvo0egNfKW4f0BZz7n3J2f0U7sF9qZHc76fMVRYLc2Y0BdE/NCcPjXEarmvKvoY
 YuquSu//6PSQor04MGhliRTomAc4pqqeUCzRABkRWCzgGsbinI5oWMsouyDPsl3NI3hk
 IY29G/Be28EYsYJlQMRD5BBe0xLX+mUb8kfqoCHQUFFjfY0w1gmCCc0N8/0Dxm6N4nKH
 6G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rPQXm04zQDyGxmKomjbXOazJQHb2pJl2zbQIbkZpstk=;
 b=CyGzxp8ngi8q2vbx5ooySJfgVAk/NXHUYvKgwiD/qxV4SCM8JHW7ej+E0pKKuSYy/2
 RvYZQiFzx4sQqMP80dScq9HLcujQsZo08CzQigctPJ5my8ReONohaPfaqKxFIP+MwTi/
 +dWk/oTqOMoZze38JXckpE02zfVs4bSYXPSzvgX8FS6ZwyPHLyI4y6jeBwpwjm3B6jYb
 hvLnHheOT/4xEbzkFicyGlLuoHSHy5yEf34WF45g7CLvMCkGGL6thYTHO2jGmWHEupnA
 OIOM2gjz/aeKQj8Ww7T6xkB4ZpnghIhr5K50KZAMggwjaNi1LWkcj78wh+SYIdoIkjM5
 zPiQ==
X-Gm-Message-State: AOAM532eEIFS3SHd/p7Osucaz43VVr8bQ4PYDVogPxlmBGYxufbLqvES
 VmM5xyClN9zmTFEwwv7Hx9Q=
X-Google-Smtp-Source: ABdhPJz3tM5NXXm0ncUXORoj88zQjWKtMQclsPYYk+YsuXBThI2MQ3n/ZMBkbpB5xezCB1xlZR+TOQ==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr69866wrc.122.1623775953654;
 Tue, 15 Jun 2021 09:52:33 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s5sm18619444wrn.38.2021.06.15.09.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:52:32 -0700 (PDT)
Subject: Re: [PULL 00/33] Misc patches for 2021-06-15
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
 <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7b25ff29-4f7e-aca5-d3b1-7732b35c018c@amsat.org>
Date: Tue, 15 Jun 2021 18:52:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 4:17 PM, Peter Maydell wrote:
> On Tue, 15 Jun 2021 at 14:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
>>
>>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 429f60abe15cca9046e6aeaffd81e991e34c9bf6:
>>
>>   configure: map x32 to cpu_family x86_64 for meson (2021-06-14 20:17:55 +0200)
>>
>> ----------------------------------------------------------------
>> * avoid deprecation warnings for SASL on macOS 10.11 or newer
>> * fix -readconfig when config blocks have an id (like [chardev "qmp"])
>> * Error* initialization fixes
>> * Improvements to ESP emulation (Mark)
>> * Allow creating noreserve memory backends (David)
>> * Improvements to query-memdev (David)
> 
> Fails to build on all the BSDs and OSX:

FWIW I sent a series adding FreeBSD to GitLab:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg809453.html

But we might get it even quicker apparently, by plugging our
cirrus-ci to gitlab-ci:
https://potyarkin.ml/posts/2020/cirrus-ci-integration-for-gitlab-projects/

