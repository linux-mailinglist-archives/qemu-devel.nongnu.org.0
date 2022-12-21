Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C486652EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vj6-0001gy-46; Wed, 21 Dec 2022 04:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7vj1-0001gT-OV
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:49:24 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7vj0-0002DE-66
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:49:23 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so14374238wrm.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8cH30VnQRJzBVCVXreUOOdWmTFybA6lxqbZLYCMUbsY=;
 b=YMhPuBMeOPT3LfkaFT91G5jrpoQa7zudDaY6CbHIpjOzV+wNkcvb5BlrtWZji9Tc59
 Hq8FV4SKLiIecxdFnVgH7GEHZLcdfcCCLwRYS2mPsXKHTba9dYRVH/TfC+3XEHPWwhBt
 r0ZQgbTlp4CBIbjUaCyn4rC+VRDjcvuNMVrZVRFEtErzEsHuUa5UH1DXOnCYbJEaqs1Y
 G+X1ufodrIoX9tZjJaOghXj/R2KzsSMBbNgDk8/M/otiuPCTTPsmaqWpf1aMW9KZ/RgB
 kPkOreqvPF20QdqOcw2n0H4U/c286YoCeE5kgwctYO4Y2gArsBkzKnUGRXQQoy0RrAUh
 0VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cH30VnQRJzBVCVXreUOOdWmTFybA6lxqbZLYCMUbsY=;
 b=LIFieCtU8AN3Tx6UnVRdyfUm8fFdq73n8qaFkz/+5Yw+mWQx/fOdxtCdhvVLEL/nqO
 n1iu5UIkewz/MxvzHwu9Mw0ZAjnoCyGFegYPxZYj0WbVENSGmnEFULhMfZYLEdGyQ8Sb
 yEYr/GT1OJ6QrvWcsyWNp+aHEFe90Rpxpfg4CtOLRR3rEXOqr5KMpfQG/PBj7+LVaCtR
 1PprLMf2SgkpR6mrq0xCpCB9K+MxTJHySY6OYQ8GmuI1SEXOZkPN67LgltjvZZIlCBvN
 P2awszzv18PPe1dm9fSet7v9NUeoH97KZQtfLiWh+ITs+M/r5Ziwjb1rRP5i/yEfS+JF
 wE4g==
X-Gm-Message-State: AFqh2kqZ2oPrLtarJSyLFe7QZxh5OTpNG6WWO8g5jbccJaCtuxrp/qg0
 TgOfx09cPVULczP9tr68eZk=
X-Google-Smtp-Source: AMrXdXvZq/3Mw6Pg+vf+FsHdZ9xv9qrg1Q8NFj3GhsqGhqnCEpX+zSmpOONykiw0TRAZ6TpTLOR4GQ==
X-Received: by 2002:a05:6000:a0b:b0:242:1ad2:15e4 with SMTP id
 co11-20020a0560000a0b00b002421ad215e4mr865177wrb.3.1671616159971; 
 Wed, 21 Dec 2022 01:49:19 -0800 (PST)
Received: from [192.168.6.210] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 ba18-20020a0560001c1200b002421ce6a275sm15018339wrb.114.2022.12.21.01.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:49:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d70bda7e-4d3c-4cbf-5b7a-6704e01a3d85@xen.org>
Date: Wed, 21 Dec 2022 09:49:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 03/38] xen: Add XEN_DISABLED mode and make it
 default
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-4-dwmw2@infradead.org>
 <9dea5cbb-1a8f-4e90-52ea-01fe1b7dbd80@xen.org>
 <91e5e1091fe354d529e692beb2c4b4c4d747b836.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <91e5e1091fe354d529e692beb2c4b4c4d747b836.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/2022 22:59, David Woodhouse wrote:
> On Tue, 2022-12-20 at 14:39 +0000, Paul Durrant wrote:
>> On 16/12/2022 00:40, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Also check for XEN_ATTACH mode in xen_init()
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>>     accel/xen/xen-all.c  | 4 ++++
>>>     include/hw/xen/xen.h | 5 +++--
>>>     2 files changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>>> index 69aa7d018b..109d2e84bc 100644
>>> --- a/accel/xen/xen-all.c
>>> +++ b/accel/xen/xen-all.c
>>> @@ -158,6 +158,10 @@ static int xen_init(MachineState *ms)
>>>     {
>>>         MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>     
>>> +    if (xen_mode != XEN_ATTACH) {
>>> +        xen_pv_printf(NULL, 0, "xen requires --xen-attach mode\n");
>>> +        return -1;
>>> +    }
>>
>> This is new requirement, isn't it? Libxl only passes --xen-attach
>> for PV domains so AFAICT this will break Xen HVM domains.
> 
> So HVM domains are currently running with xen_mode == XEN_EMULATE and
> work because nobody ever actually looks at that variable except in
> xen_init_pv().
> 
> What was the reason for ever needing it to be explicitly set on the
> command line; couldn't it have been implicit?
> 

Judging by the comments on the enum, it dates back to xenner. I guess it 
was needed to disambiguate use of xenner from attaching to a real Xen 
instance.
The only cases I see it being used in libxl are for starting up a qdisk 
backend when spawning a PV domU, or retrospectively for dom0.

As you say, the only place it is checked is in xen_init_pv() and even 
then it has no effect. The comment in the code says "nothing to do, 
libxl handles everything".

> Seems like the right thing to do is to make it implicit in xen_init()
> above, and *set* it to XEN_ATTACH instead of requiring it to have been
> set on the command line?

I guess, now that your reviving Xen emulation in QEMU, the mode does 
become relevant again so making XEN_ATTACH implicit when QEMU is 
launched by libxl, in all cases, is the appropriate thing to do.

   Paul

