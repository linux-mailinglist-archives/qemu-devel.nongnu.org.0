Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142243EC936
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 15:03:13 +0200 (CEST)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFFnC-0003oV-Ug
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 09:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFFkL-0002ZU-LS
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 09:00:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFFkI-0005Mz-BV
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 09:00:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k29so19772401wrd.7
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jF7KUIqTN3dDp9yjKhk7NW9FAHfa3+9ETiuxSC8tU80=;
 b=gxOrlLDQIYYDLNeHeQNT08RDf/ULtZOgtPdS6sfV1hP8sWmzQJXh/yTNQYDo4b/vir
 awmPNk7mqd7X4nZxuGchEmRUx6OcEtgUMtePKmFYb7RZ8z//n4wqv0J/5IROg1/bgRaA
 db2cZNLvcSQfWasNxu/lg3QlU3QByDYCT9KoegHQf1nZ7QB35ZH8oMnPe6JilWERKGUf
 cnPPb/0p5B9ePmotEtrby4q5fHVIkAo8CMr1T+T0bFU7k3YRHj1MdEGk5xfw6/7MJOf+
 YyBxlE2f4ukt16rFbR22PU3F475V184HLDDtzZF3i7jMcIi6AbiPgn8HjBXiX3QRdrhC
 xqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jF7KUIqTN3dDp9yjKhk7NW9FAHfa3+9ETiuxSC8tU80=;
 b=X2bJlJIcApStU9r3DZvWKzDZU4DYaZp5EDEiZYdPr5QDnk7zkUK0NL7taM5MIfzpJf
 AF5RgRxROAHGubwypLHiKVD3f/A7qjy4rlUxcFHgogfDvFYf/XZW0UYZK3aexJSPI/9T
 rWNXEHoO05BKsGddXFk7pgnt3Q9cJGR0MnUB/OomXF1Y4PblnQfBPRDNjAAi9oNkZHRd
 OIyA/8b76g5RLx520HDZkaxIfZ9pueEGit8ZgFqVzrxL9DGIdm9nkW8yayPHE/POQUUu
 RXgFnPhX0Iqp8m9SNwL3zsjzTKgE5nAxaFnRAN+iodBzXs8lvcVduDMspkxP8TLF+Nkz
 w7KQ==
X-Gm-Message-State: AOAM532wssgY4PeMSkd53kkz8zF/JegLYc3gWtiV0Uer+nNy/gt+9m1o
 T0XQQSN1CRPlk5kITkN9fQ0=
X-Google-Smtp-Source: ABdhPJyFM0l1uWHBggPRCMRdmJsoUe87AUjSfQi1VHbehC3Ghp7xdxe2O2NtegR0HNoKKTtlNiLMQw==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr13348530wru.143.1629032408441; 
 Sun, 15 Aug 2021 06:00:08 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y1sm7571504wmq.43.2021.08.15.06.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 06:00:07 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v3 0/7] target/mips: Convert NEC Vr54xx to
 decodetree
To: qemu-devel@nongnu.org
References: <20210808173018.90960-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <55d56b90-f258-82f3-f429-fbef71a41a3b@amsat.org>
Date: Sun, 15 Aug 2021 15:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 7:30 PM, Philippe Mathieu-Daudé wrote:
> Missing review: #1
> 
> Trivial conversion, few more lines moved out of the huge translate.c.
> 
> Since v2:
> - Move TRANS() to translate.h (rth)
> 
> Since v1:
> - Use TRANS() macro from ppc/translate.c, per rth's comment:
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg827660.html
> 
> Philippe Mathieu-Daudé (7):
>   target/mips: Introduce generic TRANS() macro for decodetree helpers
>   target/mips: Extract NEC Vr54xx helper definitions
>   target/mips: Extract NEC Vr54xx helpers to vr54xx_helper.c
>   target/mips: Introduce decodetree structure for NEC Vr54xx extension
>   target/mips: Convert Vr54xx MACC* opcodes to decodetree
>   target/mips: Convert Vr54xx MUL* opcodes to decodetree
>   target/mips: Convert Vr54xx MSA* opcodes to decodetree

Thanks, series applied to mips-next.

