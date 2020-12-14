Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B52D9A49
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:50:53 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopBc-0004Dc-A2
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kop1c-0002nG-8B
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:40:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kop1a-00087T-OD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:40:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id c133so1921070wme.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BrrQYqYGshTc/6VuSGjvuyQkulwl1IqzMrsCfz/Qh9c=;
 b=YsW+yVlO5oUprEeUcbHHli4nljShXyjwH+t4Z8ielbT02jAyjt8COxW4D6coVh2447
 RgYQEhleQDRqpk8P7oI7Gu9oisQdO1BfBSlqMG5uv7W9+EoSE8D1lQA/dUai6XD2xPGf
 kzUQz7a095cMTPznxt0pwqQZd+2pqF65oc3lcLeMgGbeKpVhqgOOD0Qd8+LeHddap6FL
 a1GxcrezR1NOI9jNvN2DBfOiGPOIqaORMvaaHerJ8q+4kGaJr8Z1OAcQLl1cThKBStGR
 kMQmAkUZLCIHWAiQok/i36Px0PvnANoeOdKK4hGr2G5dbga4rPcJilvVENsUsIvT7gJ1
 uVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BrrQYqYGshTc/6VuSGjvuyQkulwl1IqzMrsCfz/Qh9c=;
 b=QzvMAMjjEFX7qx49tgWbXtfdRlou2bsXdIHwNluB4KlXVaNRhzgbss7gYBR39nJ6iW
 Ux2t3kifKGuJ4MAZFDEZRxYwsJ+vGXjQMo3SD2m04J7ZCUs8+rtDj//AhydTog4eQwoU
 vVUoMSjbDmTc23u9PnzS+dwVSOlayHbgfk6kghrTjryX7hnf7xfjTbvu78Ehg/cOfZAR
 Sa00ljRyteBLaoVA1aXyhBicE6wk7TQt5ikuR/m0jfsjeYhxCj33042KaJVxreU7kbPm
 aNbhjrGsM7qO67sGDaDbFLqkTk4cnBFCOQyw1Kx2MJd+wXwt8XZzB75XNHcEU3yHbHCn
 5j1g==
X-Gm-Message-State: AOAM533Metlp+5wkDcb4jcSxVqJ/reGpiRRscLnkT/xd9+mX+MyHy0mP
 gp2MNyYDA+hTODKsA0hICiw=
X-Google-Smtp-Source: ABdhPJz7jvk8QmPzwDl9rZNaxqCujA35kY69TYJskYQDu6FwSpGoKI7efyzEGe4dOA+wJk9OFcjdiA==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr27895135wmj.88.1607956828302; 
 Mon, 14 Dec 2020 06:40:28 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i8sm30274942wma.32.2020.12.14.06.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 06:40:27 -0800 (PST)
Subject: Re: [PATCH 17/19] target/mips: Rename translate_init.c as cpu-defs.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-18-f4bug@amsat.org>
 <56eefa47-f95a-087e-54d2-05135d2c506d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b479857d-3b31-9e68-1d51-3de614b300dc@amsat.org>
Date: Mon, 14 Dec 2020 15:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <56eefa47-f95a-087e-54d2-05135d2c506d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 11:30 PM, Richard Henderson wrote:
> On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
>> This file is not TCG specific, contains CPU definitions
>> and is consumed by cpu.c. Rename it as such.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> cpu-defs.c still contains fpu_init()/mvp_init()/msa_reset().
>> They are moved out in different series (already posted).
> 
> After the other functions are moved, then this file may be compiled separately?
> 
> Or... why is mips_cpu_list moved?  I guess it wouldn't be able to be separately
> compiled, because of the ARRAY_SIZE.

Indeed, I missed that.

Thanks,

Phil.

