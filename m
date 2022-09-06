Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3C5AF573
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:09:51 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVetE-00058m-LO
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVerY-0002Qe-I2; Tue, 06 Sep 2022 16:08:00 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVerX-00037W-0L; Tue, 06 Sep 2022 16:08:00 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11eab59db71so30853234fac.11; 
 Tue, 06 Sep 2022 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Q4ukqRn89KiIYZ11tLXVJa1vsgLn2v5K4/6edcoVVS8=;
 b=hjfiEaGLLsib2Juiug8CKSY5HtEaLahX+uhptN9f5vpBAf2NIlf/ZP76PthExmrFD2
 0KI+G7vN55C4RRJvzaYlyL/jepCJVIbCc+OWpHW7c3B+kAVw4rwrnLWO28XpYTlEiq/W
 F/GogMZraiucGqW0jiUx5VYPllM2VnWosRBtFV41ruLYT0wnNBCFEhsJw5Z3NXcAfpjJ
 xlsAlryWQL7bc4prRMOeUWskWuQyDQhFiL0NYJtfRW3NfvKcqzqaZh8rx/JUzWRBEIDQ
 QxySpisdww9HjWJhQ3q7aDh0tUFxuAWfkpxcSORTanWhQcZvOY4OjyAxpG6raqNxPIvD
 V+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q4ukqRn89KiIYZ11tLXVJa1vsgLn2v5K4/6edcoVVS8=;
 b=kcFNjfYB6X5F11JjykgQDbyi6MGn8yVvlsAYZpajL+LTwQOtyhujUFmoUEKJYDrFZb
 a/rZPjcT5HhluKH/9RJflZOsTrghHBtrwPAyrj24Il3IIqBXdoAD2H/oUk9O+JLKnshY
 3BCs0vyafScSmUhkDxieDnY4AT+xX2Vwx7IpdO9LLi0xhcltU/Tcsxgd9tZDUyeIxmHV
 ITsgCmsPr8Vwp3aI60fU2wQSzNJYtUoevE+jqcsV9vkJJ0/oDmwMalaOO8AICK1cG9xs
 AJjbsQEqWZqbSFlA2E4OPFhDYBLMahLRzaLT0Azd9FYByQS07LZHOv4K7y4aUqSDQVGP
 o1Ow==
X-Gm-Message-State: ACgBeo2jdVNI/X9KhP8Tx9XPKt+8HIdqPJmksDnmh6j7gz2nGuly6rBf
 n4DHMOlmsACDbPwIbOTAsbg=
X-Google-Smtp-Source: AA6agR6h+wNgDxo7saoQVxyBGQMp+KXX/rjesHSu4BgThrWCJ39bXKUnCS35VCsTAdfUevSM2fV1yw==
X-Received: by 2002:a54:4401:0:b0:343:46c5:9b2b with SMTP id
 k1-20020a544401000000b0034346c59b2bmr39142oiw.130.1662494877437; 
 Tue, 06 Sep 2022 13:07:57 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056870a78e00b0011bde9f5745sm6879008oao.23.2022.09.06.13.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 13:07:56 -0700 (PDT)
Message-ID: <3657c4d3-fbc5-03ae-f55f-8dd0ac20d3f5@gmail.com>
Date: Tue, 6 Sep 2022 17:07:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/3] target/ppc: Move fsqrt[s] to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 9/5/22 09:37, Víctor Colombo wrote:
> Move fsqrt and fsqrts instructions from decode legacy to decodetree.
> 
> Víctor Colombo (3):
>    target/ppc: Move fsqrt to decodetree
>    target/ppc: Move fsqrts to decodetree
>    target/ppc: Merge fsqrt and fsqrts helpers
> 
>   target/ppc/fpu_helper.c            | 35 ++++++++-------------
>   target/ppc/helper.h                |  4 +--
>   target/ppc/insn32.decode           |  8 +++++
>   target/ppc/translate/fp-impl.c.inc | 50 ++++++++++--------------------
>   target/ppc/translate/fp-ops.c.inc  |  2 --
>   5 files changed, 40 insertions(+), 59 deletions(-)
> 

