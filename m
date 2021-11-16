Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28776452FF6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:11:27 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwN4-0000hm-9u
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwIB-000152-05
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:06:23 -0500
Received: from [2a00:1450:4864:20::434] (port=34467
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwI9-0005E5-2z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:06:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id d5so36774514wrc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YVf1tPDQPknmRSR7gDWNr9vucM+qonf4Ycx9pfm5Zro=;
 b=kWuQg9gDlicraqXV0XRVbK/E28Cbqup4RNxtLxwNI2V9JnIW2x5NUwtO9gORsQQecw
 xpiNrHIzf58ASnwWjlpog/YHwv5txTbaMs4Ca0BSheRbrh8FR/cufvi/4XLSRF0RDK87
 z/jhAWeBy30jY3y3WF3Rz+JFq6QVsdnhIb5CUGQrKPMftEVGL6WSrRUVfc9BrdL4OWtW
 md+oTgeLmugpSho/h6urA6sDGuXINslm6t+N8YG+a9owZr0rU2SnvRzCrskUoJp1PXEd
 sGNX+leNFT//wKH7z1MRnxDW9aIdyfITzXOidcDYtc6PEXlrV7pG7X4hHdWX4ofXJIYk
 kOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVf1tPDQPknmRSR7gDWNr9vucM+qonf4Ycx9pfm5Zro=;
 b=fcZ6PVo/g1jKHuCBnkX4oNu7I05Mp6k9Smbk/ybZz8ocs0qlbLG5og8aEpfYZHKlZj
 ks/78dQdHzvuf3nsQMAIpoAAtRqVY33Xhb/2C8SaClzhOKXV2EOyjA9epo2TG1bXHEPz
 TGS3fttQl7dTyjZYKeBxB837XWG1llOmq7ylrj9LOCKlFLWbkAadKrL0nyAYNWUU3iKo
 73l281dxF/e7rnJhXLPJgNjSqkC+bOyc0fiIHxnjEzYsGTYdADFcxjsUBFlzDbk++b58
 EhXAShY2xhFid8cKSOG/efCa7j7hDuN7oYI7S5Fc5FGZg4Jf+cqVMi32rRXU7JVfw1NU
 INoQ==
X-Gm-Message-State: AOAM532fn3TiVTv3wbtyuLijL276L4NQOqkAZlJcwyCgqOdb/XkssL4n
 COVwjKo8jP9Ai+VlZ2Lv6Anpfw==
X-Google-Smtp-Source: ABdhPJyeRNkUCMpnS5wWabKJVY7GASfoBYvKq5b/hLBVnoqEBpGnu8sU1eS54UPKNVDrqKFpAkskqQ==
X-Received: by 2002:adf:8293:: with SMTP id 19mr8509648wrc.167.1637060778818; 
 Tue, 16 Nov 2021 03:06:18 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id r17sm2517745wmq.5.2021.11.16.03.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:06:18 -0800 (PST)
Subject: Re: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211116095042.335224-1-richard.henderson@linaro.org>
 <CAFEAcA9-BfaXq=3pH2PM58TrmW=sOhA2EgG+V=eYTDpnY6AiXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbc810f9-03d2-51ba-d1a9-4f04379cd1e1@linaro.org>
Date: Tue, 16 Nov 2021 12:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-BfaXq=3pH2PM58TrmW=sOhA2EgG+V=eYTDpnY6AiXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alistair.francis@wdc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 11:53 AM, Peter Maydell wrote:
>>   cpu = host_machine.cpu_family()
>> +
>> +# Unify riscv* to a single family.
>> +if cpu in ['riscv32', 'riscv64']
>> +  cpu = 'riscv'
>> +endif
> 
> Needing to do this seems kinda awkward :-(

Yeah, well.  It's either once here, or multiple times later.

Or, we admit that riscv32 will never be supported as a host and rename all of our other 
bits (tcg/riscv and */host/riscv/) to riscv64.


r~

