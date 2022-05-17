Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751FD52AB7C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:05:47 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Vm-0002TM-S8
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2U6-0000Iq-59; Tue, 17 May 2022 15:03:54 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2U4-0001c2-Mx; Tue, 17 May 2022 15:03:53 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q10so23443971oia.9;
 Tue, 17 May 2022 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8DoVFtux1M7f4OEtYxqyB3+Az86qiyaorfUaH1SvKVE=;
 b=fdNwwhrrRd2xAUQhcEM4eynR7s5cpAhHkRkst58FgRywclu9HpbUG9azAuh6x9jOTB
 z+QDMj7PWmsK15m5yq8TsRZ68GRTW+TDi3HlLP7L4UanFJRGMwuw4QgnfuIyvEJxkGQg
 7Q/Og/QdO4SC8Qmt7jFFJIyGKADHONNDFevOXFVmUUMvG+C56sDNpm03UWCoqVTxoqfK
 B5Cp+V/bU3LYq93LvZJ1SPBbcPToAGW3T30rQlr9EFVNcfeY7BCfxbhxvyT3pLtIjemH
 mUCW0/2iNi39RlFsi/OIIBhCk+vlwTfPtqxKy2dGO5EZoS7Cm6Csf8oMQgu3iBPhEjRN
 N7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8DoVFtux1M7f4OEtYxqyB3+Az86qiyaorfUaH1SvKVE=;
 b=sDCBSq7duGWdpoapqVDWUXA0Fyzvus9/X0SsaRL2Zuju/h1HtLZdfJhRvyMMZAUgV/
 lR2RGuSp1kRLjqvVaTGVmNf/62uQAcvPUOmsnHySA39DfJe7wCTD/no9FLpAFNC/2lKv
 1lBpinrv+AsmyJxX7isdACBtjPtaVLzmr8i2+OQDPUbKs6TaHkgbi6rNlCWS8N1+WWzn
 hzwwBIYTN+aoeB6tg+X+xqE03tQ2cutMed9tcO1zU60Ds05Gf+UpdMSvMTfVzkBIMwes
 YCPSOikoxZp82tNU9uaY8T1rU2fwEQrhly4TwOxcdLMD53iNP2sr1sP3t2jKYQVR9miP
 3U1w==
X-Gm-Message-State: AOAM533Ez5bpIzt3Dl56kOVwk9uNvLK6h5T3XFyDnpMUrd53oXI1PBHT
 7uwxT2NSyWTuPR9+ZhdP5V0=
X-Google-Smtp-Source: ABdhPJwbZm72EMF2a0uooTJYU/zHnoVrabjrmhJHlfVwc4y7OgCZzfZXJqjFfqaArrz535AZ8QuZnA==
X-Received: by 2002:a05:6808:e8b:b0:322:4c21:6ba3 with SMTP id
 k11-20020a0568080e8b00b003224c216ba3mr16580672oil.204.1652814231227; 
 Tue, 17 May 2022 12:03:51 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056830204300b006061debeed4sm51833otp.69.2022.05.17.12.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:03:50 -0700 (PDT)
Message-ID: <a261eb5f-e025-12d2-0207-772573e2df75@gmail.com>
Date: Tue, 17 May 2022 16:03:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220510235439.54775-1-muriloo@linux.ibm.com>
 <aca5b885-daea-bb59-e79e-3317e3854cf3@gmail.com>
 <2d9f4a3c-aae5-f407-e8ea-2762de5ad4a2@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <2d9f4a3c-aae5-f407-e8ea-2762de5ad4a2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 5/16/22 11:33, Thomas Huth wrote:
> On 16/05/2022 16.14, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/10/22 20:54, Murilo Opsfelder Araujo wrote:
>>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>>
>>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
>>>
>>> Make devices configuration available in hmp-commands*.hx and check for
>>> CONFIG_MOS6522.
>>>
>>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> ---
>>
>> Thomas,
>>
>>
>> Are you going to pick this up via your misc patches tree? If not I can take it
>> via ppc64.
> 
> I didn't queue it yet, so please take through your ppc branch.


Done. Thanks,


Daniel

> 
>   Thomas
> 

