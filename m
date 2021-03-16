Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1E33D35A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:51:13 +0100 (CET)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8EC-0007Fd-7Z
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM8Cv-0006i6-MW; Tue, 16 Mar 2021 07:49:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM8Cu-0003fG-3l; Tue, 16 Mar 2021 07:49:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id 12so4917644wmf.5;
 Tue, 16 Mar 2021 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LGehRSnl2EqLsDsR39xZUYaPtbEg72xkCFY3ofHbw44=;
 b=nWgimJwltTitGcgiw/nZT1+k05M/JCUQBvaQ2BKuLcMikobbnN7adq2hoA+xTx+Yw6
 dqDquvAdgGRSYkjWN79iikzW4fkmjQ5xMRsJ9vctBBlW6iOqbPqm+vJ8UJ4rw65YDgxl
 MRlVAZm8IPlkZ04ek8cVgkF5ZyzaAUYrMiuL0I4ThablKtDko5ir6WBhqaDoPuvGeyvK
 3cCu6H3UeETvAbJ4YiZBdhmi0VwYrtZUfBWTNX2w5417BMg7OaON9I3XFIamzVC/eupA
 voDl/wlJnfY4zPBoGtJcL+WFeHlMbIru8TR8JZ8YvKDhjww5i84ORRlvYwMoMAtPHF9/
 a/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LGehRSnl2EqLsDsR39xZUYaPtbEg72xkCFY3ofHbw44=;
 b=kgQ8GCX1eshUl4cUWK8Dx60MHYCc1oSU90CTWYNDEbtIjJDbcZE+RuMPlWHCcPRAaW
 caMLZa4CrKtJRs+giZqpf8hMzqB00A1FEQuFGMwBmdVXG5yH0cnNQ1sDeFarjtxiRErq
 CLhRgzj6RrJvnDSc0VhGTh9SVkkK8bhJ9DTEZcCwosGsawmh7r726sIQwF9AFYDEhboJ
 fA/el3sk2yjx6m90iS6YS81FMUuhl4G+vmeiRmFx4obohX/ocwQ+8faWGTj4wMtfGKbh
 nwJEtbA9X8LGHw0PqZj4UhIN65QDLUiObpVwZwB0RAvtj4lSutlkFWzodviUrslSn5sa
 l7gw==
X-Gm-Message-State: AOAM530W5FEY6WeUzg3Ft/ZqbDOaw98/nK3Ip/N/LuzG3AnDoDI03X9o
 cDyP0Tupxf4T4TrdX5/Tpmk=
X-Google-Smtp-Source: ABdhPJx6u7KfT1UbiOCs6zP0RanFZSNTCU90MWcwhCmI86paT87kZdSRXsLpPd99FyCBdgBpRxQzQA==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr4241835wmg.26.1615895389861; 
 Tue, 16 Mar 2021 04:49:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s12sm2820044wmj.28.2021.03.16.04.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 04:49:48 -0700 (PDT)
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
To: Laurent Vivier <laurent@vivier.eu>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
Date: Tue, 16 Mar 2021 12:49:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 10:01 AM, Laurent Vivier wrote:
> Le 15/03/2021 à 13:33, BALATON Zoltan a écrit :
>> On Sat, 13 Mar 2021, BALATON Zoltan wrote:
>>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>>> Hello,
>>>
>>> I've started posting this series well in advance to get it into 6.0 and yet it seems like it may
>>> be missing it due to organisational issues (no real complaints were found with patches but
>>> Philippe seems to like more review that does not seem to happen as nobody is interested). Looks
>>> like David is waiting for an ack from Philippe but will be away next week so if this is not
>>> resolved now it may be too late on Monday. To avoid that:
>>>
>>> David, could you please send an ack before you leave for the last two patches so it could get
>>> committed via some other tree while you're away?
>>>
>>> Philippe, if you can't ack the vt82c686 patches now are you OK with taking the whole series via
>>> your tree before the freeze? That would give you some more days to review and it could always be
>>> reverted during the freeze but if it's not merged now I'll have to wait until the summer to get it
>>> in again which would be another long delay. I don't think this will get more reviews unless it's
>>> in master and people can start using and testing it better.
>>
>> Hello,
>>
>> Since David seems to be away for this week before seeing my mail asking for an ack from him, now
>> this can only get in by Philippe or Peter. (David said before he'd be OK with the series if Philippe
>> acked it so I think that can count as an implicit ack and it could always be reverted before the
>> releease.)
>>
>> Philippe, do you have anything against this to get merged now? If not please send a pull or ack it
>> so it has a chance to be in 6.0 or tell if you still intend to do anything about it before the
>> freeze. This series was on the list since January and the remaining parts you did not take are here
>> since February 22nd and the version after your first review since two weeks so it would be nice to
>> sort this out and not block it any further without a good reason.
> 
> Pegasos looks like a New World PowerMac, so perhaps Mark can help?

The PPC part is mostly reviewed. The problem is the first patch:
"vt82c686: Implement control of serial port io ranges via config regs".

I don't understand it. Zoltan said Paolo isn't acking it because
he doesn't mind. I prefer to be cautious and think than Paolo is
rather too busy.

Laurent, Peter, can you have a look at it?

Thanks,

Phil.

