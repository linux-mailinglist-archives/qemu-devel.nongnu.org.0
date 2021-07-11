Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD283C3D95
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 17:19:20 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2bEl-0007Bg-5M
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 11:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2bDP-0006Vv-Oc
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 11:17:55 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2bDN-0006Be-Ou
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 11:17:55 -0400
Received: by mail-pg1-x531.google.com with SMTP id u14so15392166pga.11
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQTGR6VnZSSSMQ8xKCwfEaCStugs1N9+E3ksZrL0psI=;
 b=E84u+ltsGUtxs0aD/E+N/Tf1Ksx0BE/QT0nPVfg4uA7+oGe3KWL89vYBJerOJkLBio
 aMw6YJxybtnazPtO1qP9UpOPH2TbyWP81Hk3+5jZGf766dv19sBWGJFFvmfo5xiJMeps
 xP2XTUk0w71h+nBochmGnNbCiFnbTYDc0WMjaXLnly4YWsfoBO58vb//h5uLTNNwBodU
 8nQxpBl/RM0WmoWfmikKnaJQFKa2WnxoEtmsF1H/Gn7jZjMdMn/ZtPB3H+LlNNkfpt/b
 aQCVeadv5PdOiXHYc3VgkF2A5pkI9DMVtb45xGjOEngP+Kv6yuJy5Vkel+LgLfiv+mHN
 mX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQTGR6VnZSSSMQ8xKCwfEaCStugs1N9+E3ksZrL0psI=;
 b=mDCf3M7FwGLaf1alHUtUfSghhd5B1i3BMgcBVS9awe4oMZz5kLoDuoUgWxBieqWvf7
 /xux2mDxOvm2RLWg8qq8wiiNL7+Buvu3+gi0urcAWBE0rAnMEJaJn033I9u5mfIYUlaw
 NhQqi5OiKNoA4iJFiEidUB4skEnb+OtnGXKNU+XYkVQiEKdFt1HigF7voVeK3HTdTN+M
 X6UM8qa+5Myh2DQAaBKDGtJZCkQZOjGo33i1yNqvtYTq5tQcdv2E+clxWbTUfRBsARTG
 Zu5GfbM7izckMF0ALm4CqLZkD3v92h0DWEgox988fy1Y5d8Saoy4oBN9BuXv4zs608va
 ElAg==
X-Gm-Message-State: AOAM533PDCxI8GbR7flQEPq7wKxOA/qHKP6tPIiEJ6KD4Ny9+PWvR/In
 Oq0f7JxfH/8Zkp2QCPt3rYVo6g==
X-Google-Smtp-Source: ABdhPJzZLUKHwtpCXEqdHwyICBCORxMcnzeGM1ZoEqen1CQSCEPBYkqybExp4fs6vfyJWjcFRsk2Pg==
X-Received: by 2002:a05:6a00:a1e:b029:30e:f6eb:c30b with SMTP id
 p30-20020a056a000a1eb029030ef6ebc30bmr49239236pfh.72.1626016671793; 
 Sun, 11 Jul 2021 08:17:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 131sm12712017pfb.164.2021.07.11.08.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 08:17:51 -0700 (PDT)
Subject: Re: clang build error on i686
To: Peter Maydell <peter.maydell@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
 <CAFEAcA_jRNB=b2FS+9yrYX6r5YcnT0n9ooDH5Bnskzn9PwSKhw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa6e3eba-1cbd-1951-2811-36856b3a1816@linaro.org>
Date: Sun, 11 Jul 2021 08:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_jRNB=b2FS+9yrYX6r5YcnT0n9ooDH5Bnskzn9PwSKhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.631,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 10:45 AM, Peter Maydell wrote:
> On Sat, 3 Jul 2021 at 15:37, Cole Robinson <crobinso@redhat.com> wrote:
>>
>> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
>> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
>> clang-12.0.1~rc3-1.fc35.i686.
>>
>> Full build log from the 6.0.0 build:
>> https://gist.githubusercontent.com/crobinso/7b1206044eac7326490b2adce829e861/raw/9dddef968051fd6383ba7adb9e595081ad4f8fa4/gistfile1.txt
>>
>> Lots of errors like:
>>
>> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
>> function `helper_atomic_cmpxchgq_le_mmu':
>> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
>> undefined reference to `__atomic_compare_exchange_8'
>> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
>> function `helper_atomic_xchgq_le_mmu':
>> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
>> undefined reference to `__atomic_exchange_8'
>>
>> Also warnings like:
>>
>> /builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
>> misaligned atomic operation may incur significant performance penalty;
>> the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
>> [-Watomic-alignment]
>>      uint64_t orig = qatomic_read__nocheck(&s->value);
>>                      ^
>> /builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
>> expanded from macro 'qatomic_read__nocheck'
>>      __atomic_load_n(ptr, __ATOMIC_RELAXED)
> 
> I think at least part of what is happening here is that this compiler/host
> doesn't support native 64-bit atomics, but configure has selected
> CONFIG_ATOMIC64 anyway.

Not true.  The host certainly supports it.

This is a new alignment warning in clang-12 wrt the alignment of the atomic operation. 
Which may be complicated by the fact that the i386 abi does not normally align structures 
beyond 4 bytes.

We may need to disable this warning for i386 (but not x86_64).


r~

