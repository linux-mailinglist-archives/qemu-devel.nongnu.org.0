Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA812F3C38
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:18:23 +0100 (CET)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRzZ-00066L-Mm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRx2-0005YC-No
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:15:44 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRx0-0000FM-Ju
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:15:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id g10so1801716wmh.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DRoHzt9tQRDhJgi5Yq7OqWforpDC0exgm5WG/7U6HBI=;
 b=lEkk/kvtcFn9vbBao40J1tEJRIwJk/ruU7Jxjh3Vir0XYyYGoJQRx3YbBvXWsHhgzR
 un2zwhOQVBQNZhSQPwI7Uz/5/BC96Pp6leV3fz+0RD/qxGhZi29++bOkPGpAvUUsyBJl
 QWFO3gGpy18BuawYCdCncsjuBORaco966FP8EKTP1T8DZw5AcWC0oZWRW1F/2sOAcY5/
 mJX6JKZ/cgY/qPFxhb8ZQ5d1GAoDvWrl4nnfs2Fp6PA7P6LZc05rFpmVn8G9xM3BGOPi
 b7CeNtdK48SlqO+2SmhExfmLCu9jJpIW8yMyJe/LfNDLsLeePMBZ+xmFg37Ni0bHG2ip
 6pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRoHzt9tQRDhJgi5Yq7OqWforpDC0exgm5WG/7U6HBI=;
 b=KlwufXfQdEcgDbOaNz4K6bOkrsEMqckZoBAlqz+CyGGF3B9vEhhM8PyQXyWRkv8WnV
 kKeycwM8mmBnOMDiLewIG8a16woNkfwe2dqpHlOwF6qPfEgrTM+Ye7u8d5gyyP5d0qe8
 8FSHDLnnBqiYh3G85N9wvTvMA+j0ldu8d6+RxcemJyr6D+8oVLJLrP6CGnrLUj2slTaM
 b/1+gL72nos7M9RVvDg85x3ORpJaEWUF76FbXhlAc4y6mX7gQYl9FGZRcCBMbzGyRoe7
 8JKqF+/FuxUrMnGSnh+PgZs+RNpiNOmQY1Pe+Kjhrl+82+d8KeDe3spUjiCkZOwz+Ggx
 vnDQ==
X-Gm-Message-State: AOAM530KRAr7LeSnjHzrs+o0CiN5MVYV/fnCw0WgGFlA1Ke/7Ezn/okt
 tSxHWXDwl8fp/z7PYC0XZf4=
X-Google-Smtp-Source: ABdhPJygFK+mpdMMAX7MiJz3ZWzwyBiaDMfvzllHbPOp7y8CyXIF+c4Pav4+nN9MGpiNEBJTCMZWeg==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr1225265wmg.172.1610489740534; 
 Tue, 12 Jan 2021 14:15:40 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id b9sm6510946wmd.32.2021.01.12.14.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:15:39 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210112184156.2014305-1-f4bug@amsat.org>
 <7fd434f1-aa6d-f4db-b741-564a33a8540a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d6ffc43-51b1-e565-6dc5-6985ed43ccc5@amsat.org>
Date: Tue, 12 Jan 2021 23:15:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7fd434f1-aa6d-f4db-b741-564a33a8540a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 9:44 PM, Richard Henderson wrote:
> On 1/12/21 8:41 AM, Philippe Mathieu-Daudé wrote:
>> Some ISA use a dot in their opcodes. Allow the decodetree
>> script to process them. The dot is replaced by an underscore
>> in the generated code.
> 
> Given that you then have to remember to use '_' on the C side, what advantage
> does this give?

The direct advantage is you can copy/paste the opcode in a PDF viewer
without having to edit it :)

See i.e. some Loongson opcodes [*]:

MULT.G          011100 ..... ..... ..... 00000 010000   @rs_rt_rd
DMULT.G         011100 ..... ..... ..... 00000 010001   @rs_rt_rd
MULTU.G         011100 ..... ..... ..... 00000 010010   @rs_rt_rd
DMULTU.G        011100 ..... ..... ..... 00000 010011   @rs_rt_rd

DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd

MOD.G           011100 ..... ..... ..... 00000 011100   @rs_rt_rd
DMOD.G          011100 ..... ..... ..... 00000 011101   @rs_rt_rd
MODU.G          011100 ..... ..... ..... 00000 011110   @rs_rt_rd
DMODU.G         011100 ..... ..... ..... 00000 011111   @rs_rt_rd

The other - remote - advantage I see is when using a disassembler
based on decodetree (as AVR does), the opcode displayed also matches
the specs. We are not yet there with MIPS, but I have something in
progress...

[*] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg02509.html

