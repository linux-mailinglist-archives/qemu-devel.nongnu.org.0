Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D71546890
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:41:57 +0200 (CEST)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfpk-00079x-Nv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfoU-00057x-8r
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:40:38 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfoR-0002ho-Pb
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:40:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e9so13652945pju.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=X5nZuu9uFfVaEBEjd/LQpYatKJNFo/RN76R2TOaVDvY=;
 b=bvulnofr1yHBKZv2mahIng/7AkNH6o8Nc+D6gpfD/bihgYJwMAiV9uq8SM3/26Tfri
 EkmKy0DwncXHXJgKQsHV0eOMtu7/vaNnnd9cE/RrKDVNIIdPGGvkdWbLGF7em7mQsEUf
 5JTavPgITUefxc8JvE7pu49HJn2DFJ5FPkx+Qu8fOLyJHGd2dzARywMHodewgHLVeKA/
 XwsRUMc1hlj4JR3zZTEUxB6Pmz92pz1zuAMtmwfS2LNnRPQ9FJgqfu3XTOnc+OSEfLfa
 I0ia6E+4keOQChwbRccFzhA0vQ5GqxDSXk/VJ33fM2KuhnQLCDzlUjPJEMF6RG+bPd14
 EZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=X5nZuu9uFfVaEBEjd/LQpYatKJNFo/RN76R2TOaVDvY=;
 b=KaTUEO1EzlsQxqMTlDmfDSjSi0im+5Ghm4yhefOvtKnCCTE6P8SgnQBXPlrakLhQ00
 7Lb5vLkPVK7drv5W8O6E5TGJeJaMEfB/jiH8Llg6JqbzXO8+UoCXU8UOci08nwhZX9Ox
 7ZOLAeZhK6ZB+6MEmYXHSI2xmwsxS5n95l/Wwl24Auu9Hwj49QkgvmyiNEpSjjTuDMkK
 /JXk3EOJWUoPl6lJ9686U7BfuFEPYDh9dbCgNUCLSVM4+4ARqszJTx+d8ry8glSNsNDb
 5m3DUoonTJ5fcudRfvPWJuX4HLlCSThD1wPEsQ3Uxqi75igYm53DPFzQUt3ryc2ciNVh
 h1kQ==
X-Gm-Message-State: AOAM531r54kM62AWOlDZzs6+R2fqWBO3bTpUceK1t/drlzdEf1Q3eAnC
 8zT3Xcnp2lHOqU1Olxw37eE=
X-Google-Smtp-Source: ABdhPJzaBnpa5Zqb/NcrKzPsTcKvta/CPxJPDyQrSEEDhjSTf45ktFBX322L0ADRRloiJTDI2ZLxGg==
X-Received: by 2002:a17:902:d58a:b0:164:f5d1:82e9 with SMTP id
 k10-20020a170902d58a00b00164f5d182e9mr45634746plh.3.1654872034268; 
 Fri, 10 Jun 2022 07:40:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm18846960plg.252.2022.06.10.07.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 07:40:33 -0700 (PDT)
Message-ID: <4c24100a-4d34-39cf-380c-4dec381746f2@amsat.org>
Date: Fri, 10 Jun 2022 16:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 7/7] target/mips: Undeprecate nanoMips ISA support in QEMU
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-8-stefan.pejic@syrmia.com>
 <10b8d473-c299-8070-e8d4-3d41b67af467@amsat.org>
 <066e1d3e-d35a-662a-21bf-bbd362636cc0@amsat.org>
In-Reply-To: <066e1d3e-d35a-662a-21bf-bbd362636cc0@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/6/22 16:09, Philippe Mathieu-Daudé wrote:
> On 31/5/22 15:14, Philippe Mathieu-Daudé wrote:
>> On 4/5/22 13:04, Stefan Pejic wrote:
>>> nanoMips ISA support in QEMU is actively used by MediaTek and is
>>> planned to be maintained and potentially extended by MediaTek in
>>> future.
>>>
>>> Un-orphan nanoMips ISA support in QEMU by setting a mainainer from
>>> MediaTek and remove deprecation notes from documentation as well.
>>>
>>> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
>>> ---
>>>   MAINTAINERS               |  3 ++-
>>>   docs/about/deprecated.rst | 26 --------------------------
>>>   2 files changed, 2 insertions(+), 27 deletions(-)

>>> -The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>>> -(the ISA has never been upstreamed to a compiler toolchain). Therefore
>>> -this CPU is also deprecated.
>>
>> Thanks for contributing all these fixes! I'm glad to see this code used
>> and soon maintained again. Last time I tried to run a user-mode binary
>> it wasn't loading due to incomplete nanoMIPS ABI support. What kind of
>> tests are you running? Would it be possible to contributing them, to 
>> avoid code bitrotting?

Any prebuilt binary I can use to test instructions coverage would do.

