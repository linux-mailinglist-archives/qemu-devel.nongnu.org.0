Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72809484961
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:42:14 +0100 (CET)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4qdJ-0005aD-4E
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4qc4-0004lq-IT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:40:56 -0500
Received: from [2607:f8b0:4864:20::1035] (port=45886
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4qc2-0004Js-Nv
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:40:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso4340613pjg.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 12:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3VrYoNA/xILe/mvT36gxoItTluXvrjXa7CJrxIMsX0o=;
 b=KeNofYob7emM8pZ9rbij99cJnHF3UiQGVmRczaOJoGGUh9+Qq6npVg8UvMTrajWuxy
 ejk32OKOMizS2meQSXrX2YosQxWFMjpfhNtd6QXVajB8r312KdaD8HfO/expWs4u7ZqZ
 UK6X0/bKmLSfTBzP9QR7eFYtgSXilcXpWLFuLyY3hNuPmUwJFsgGEzrzNQ48XUh0XFQz
 +acMQtB4sHK1boPdVc1D7QkOSWZ1osncnQNvy+lo+0aJJRS6NpKXN0CSP87UJ65aTM1P
 EnLhBEPF4Tng3vtZMvHiXH6QBHYsbP8kXSRudMGoludkyHNi2sukl3WB3Ub2MhiklEoY
 +bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3VrYoNA/xILe/mvT36gxoItTluXvrjXa7CJrxIMsX0o=;
 b=6/Ep7li+Lun6qd7hm39sfDghsy4+eJL+5l1pynAn05ZyRO4JYhbVunW6bkhR8HebAR
 BBwjOtcZ77osMez5wKPlOh90257oAGC6uFGGlAStW14HboouJgEqW+m6G9EPz5geMEEj
 orAm0EB74RteZFNhdxMkyDZoRDZED0FcAlCHkw46M8meddAB3ggfMZMtnUmMCVbkDdgs
 v1pqexsfZ3c1YIRjFioaYDiqyiFUvNMzjsMTivJ9BnWfuagVNq5ovWgaX2PgkvvZeMxS
 jA72Dmtq18QzIU/k1oPx2cflvvw4kC5ZyYrHHJDYpF+Ekz3W6tz+dH6KeWMHcz+wYVcd
 RbeA==
X-Gm-Message-State: AOAM532q4XX9ExlYlArH6MkltFU5rH3bznQ8NVClyGmUntbIGapQebO7
 83Gz8eTV26sv9YSnUKzuMhpqdQ==
X-Google-Smtp-Source: ABdhPJxf/ik/Y38VYkYLmBfxQcbxiU/njiP3rM6oWO5mtjginJbxMSZxO4ekVawojZpu9eJSmC5hzQ==
X-Received: by 2002:a17:903:11cf:b0:149:a17a:361b with SMTP id
 q15-20020a17090311cf00b00149a17a361bmr25760391plh.146.1641328853171; 
 Tue, 04 Jan 2022 12:40:53 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h15sm46036189pfc.134.2022.01.04.12.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 12:40:52 -0800 (PST)
Subject: Re: [PATCH] tests/docker: Add gentoo-loongarch64-cross image and run
 cross builds in GitLab
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 WANG Xuerui <git@xen0n.name>
References: <20211229062204.3726981-1-git@xen0n.name>
 <87fsq3l26b.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a87cd1d-dd4c-b360-23c6-60903fbb6a8d@linaro.org>
Date: Tue, 4 Jan 2022 12:40:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87fsq3l26b.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 10:31 AM, Alex Bennée wrote:
>> +docker-image-gentoo-loongarch64-cross: $(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker
>> +	$(if $(NOCACHE), 								\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) build -t qemu/gentoo-loongarch64-cross -f $< 	\
>> +			$(if $V,,--quiet) --no-cache 					\
>> +			--registry $(DOCKER_REGISTRY) --extra-files			\
>> +			$(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker.d/build-toolchain.sh, \
>> +			"BUILD", "gentoo-loongarch64-cross"),				\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
>> +				qemu/gentoo-loongarch64-cross $(DOCKER_REGISTRY),	\
>> +			"FETCH", "gentoo-loongarch64-cross")				\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
>> +				qemu/gentoo-loongarch64-cross --add-current-user,	\
>> +			"PREPARE", "gentoo-loongarch64-cross"))
>> +
>> +
> 
> Can this not use debian-toolchain-run (possibly renamed) like the
> microblaze and nios2 toolchains?

At present there are too many "debian" prefixes in the macro.
It could be reorganized, but perhaps not trivially.


r~

