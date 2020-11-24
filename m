Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0242C28CF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:56:43 +0100 (CET)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYoE-0003qU-Ay
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khYmS-0002rl-61
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:54:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khYmP-0001z0-RE
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:54:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id c198so2509312wmd.0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BlV18RfcAJh+HrxX7/N4XvLJfB2F7M6NYyL4TR8Bie0=;
 b=UNofor9fTLl/xw6KnrxT0IvF3Oeh5AsPAVPOVtwppqXMNb2qJILfbfZVnvN0BPjQQ3
 taj2Wi3qvEkGQYxgj3j7zJHUi2gGgOUxBewpWU5W7dxajnaOClOkEPlfBux/0her0GUf
 jBNUd1sehQ0SZ2Z1IF+TYKtO7Fj8hg6tySK9q5HscRcInYxRjMKEZ+PRunaQrHDA42YQ
 2ahfRL8QE69L7/RqsY8hTTppP17U4hJ1HnVO7lRVjDcbVg8fe+OoR3FtA/FoYMUSy+IC
 uVB9LM1sL26hpUnEXkLgmpACIcN5e9r6SsIReDai9X0jifX9ymLrRDuC5xfXzq6nJ1ct
 vM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BlV18RfcAJh+HrxX7/N4XvLJfB2F7M6NYyL4TR8Bie0=;
 b=j8VVYNzPt1e5+A9YCNIkBjCBh2knijuvjIX4IOWxSwsTEVslEbXmY+FPzM97Bl+UnG
 Egzt1veWrrTLLtMneknb6eTjCQg8nfKgygzHP4RDmvikXT+wtwLRll8hAzPg9K9QSy3c
 OOx6bJRYBzb5Y+MRncKCEhHkzc2BD6EK5dhwjzrXtlGkPfxhNWUq+QkqgM/NZ1ZPpXKf
 jOVSHVCVvm4piIinbDfQiGcg9D5yRtADjMPHYB6hTPfxr1nxeu4Pv8l2jPDxXge5HMUC
 ScXPrJl6zcvYJpsftXT3mhofcE7JXNqRRENvXQ1OrcJmwuuUEppsGgs0268Upo/VWdZh
 x0KQ==
X-Gm-Message-State: AOAM530micsXpIfaFLZP4BLdHV6JqhrWixyHLhbnlpo1bC97cU0oZQQ6
 8gyz+OIiKoET/PvFRanRpu37oJcchtE=
X-Google-Smtp-Source: ABdhPJwoTVL2af+VwY9BjHLN9/zoyJitzlHQbDbKEFgEnXVNSIsFaSaiHkoQ1U5z0hR6QEf9m3IiQw==
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr4801440wmi.152.1606226087803; 
 Tue, 24 Nov 2020 05:54:47 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j6sm6280045wrq.38.2020.11.24.05.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 05:54:46 -0800 (PST)
Subject: Re: help with a build-user and build-user-plugin failure
To: Claudio Fontana <cfontana@suse.de>, Alex Bennee <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org>
Date: Tue, 24 Nov 2020 14:54:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 12:04 PM, Claudio Fontana wrote:
> Hi Alex,
> 
> I am seeing build failures with build-user and build-user-plugin:
> 
> https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998
> 
> and I am trying to start investigating.
> 
> How do I reproduce this locally?
> 
> I am trying to run locally the check-tcg rule, but I cannot get it to work.
> I managed to work around the problem of static libraries (disabled them),
> 
> but then I get:
> 
>   BUILD   TCG tests for x86_64-linux-user
>   BUILD   x86_64-linux-user guest-tests with cc
> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /tmp/ccgqtAM9.o: in function `test_fops':
> /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined reference to `fmod'
> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined reference to `sqrt'
> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined reference to `sin'
> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined reference to `cos'
> 
> Have you seen it before?
> Any suggestions? I'm on OpenSUSE Leap 15 SP2.

Related to 3fc1aad3864 ("configure: remove unnecessary libm test")
+ tcg tests still not ported to Meson?

