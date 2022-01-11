Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4148ABA3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:45:00 +0100 (CET)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EeB-0000xh-9X
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:44:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Eco-0000Bx-OU; Tue, 11 Jan 2022 05:43:35 -0500
Received: from [2a00:1450:4864:20::336] (port=46625
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Ecm-0006u3-El; Tue, 11 Jan 2022 05:43:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso1532502wmd.5; 
 Tue, 11 Jan 2022 02:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fCjueDFv/EzgsxoKreZXkLCzsKEeDprdTK5nQeXAmQg=;
 b=hzEva35+NKXal+8dWVpQEsjW5dEg83iixRpWkHvWd4AdX9BrETQB8t0MH1LuLQpvfC
 babxLd599HPzt0y0LuhvELp6NKVK41hcwtXHryR2Adm9RkLxPmTYZVeHSUpvaDuKhXnp
 393fmmAfabbRwCa3F58Zj0WiY32Yz574Kne0D/hbrWlrxdjA/LMebdLaIhKAYMLma440
 JbnyVDVrGGbZ6sgzCl59sCK5fTw8CQM4JqIzcmTOsR9U3J/eoiZFQEw15CzDvKpFI4go
 nQC+LB2xevkXYoOi1IuSLWQ/aJHckSWXotJxalpEk4ViPf2mx3QDfSuzAmOIG9L/X1BI
 I1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fCjueDFv/EzgsxoKreZXkLCzsKEeDprdTK5nQeXAmQg=;
 b=hBHXibfVgA456l6oXFxnYr2Yg25ys9sAdC3CmMlbkah5yo9hR0szgmYPgYmdi+bd2q
 CgS3sEj2jv13fUZiMamfPwr9g1xppecMuV7vGxBsc9vQq4j/tdZyF4O/ZrwyBcxQi1nJ
 b+/8l7T1/QS9Ux06+6XOeY/0EOtlfNVckCplvs75O08Qj3SL2u8uhuE7YbwwQ81MAQmb
 qVAO1GV8ATdNdfnx8wEv+vyeO6MqpsdadGu+64a5cOvgSn0d7c4p1uDClNgh3wx44KJt
 DUjsDKYMNLEtsahcD5V1lGOvIH9WVtMvP3XY2hLR5wNha2SlDtXntNl4iTTKsWeRLNw6
 mK6w==
X-Gm-Message-State: AOAM531TuH3S3NihMyo9oYWyEaIHRJuXEtSXsf6xri+oXRG7sgZMfk7d
 vPrVSEDKc8R0TNipFcfAqiI=
X-Google-Smtp-Source: ABdhPJwdJhb0sgjyGV4tLsMKGa9HNebzjaRNdA90rVMAFGWh7r/MGgxlZWoa8AcwZh7utUU8YjKtJQ==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr1928828wmk.110.1641897810615; 
 Tue, 11 Jan 2022 02:43:30 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i8sm11294032wry.108.2022.01.11.02.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 02:43:30 -0800 (PST)
Message-ID: <7966f396-7ec6-f528-0ebf-248c24f19482@amsat.org>
Date: Tue, 11 Jan 2022 11:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/9] hw/nvram: Restrict stub to sysemu and tools
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-2-f4bug@amsat.org>
 <62eee9e9-62bf-039d-8bc5-c12c0d8468b6@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <62eee9e9-62bf-039d-8bc5-c12c0d8468b6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 01:17, Richard Henderson wrote:
> On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
>> +if have_system or have_tools
> ...
>>   if have_system
>> +  stub_ss.add(files('fw_cfg.c'))
> 
> Disconnect in tests?

(I assume s/tests/stubs/).

fw_cfg-interface.c exposes the fw_cfg QOM interface, which is not
used by tools, but since interfaces are checked when QOM object is
created, we must include it to be able to use qemu-storage-daemon.

fw_cfg.c add a fw_cfg_arch_key_name() stub which is only required
for sysemu.

So no, there is no disconnect. I will however split this patch in
2 and better describe each change.

Thanks,

Phil.

