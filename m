Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1A4D0A6E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:02:38 +0100 (CET)
Received: from localhost ([::1]:35484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLR6-00029g-Pf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRLPG-0001HB-61; Mon, 07 Mar 2022 17:00:43 -0500
Received: from [2607:f8b0:4864:20::22e] (port=45785
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRLPE-0007Lo-Jj; Mon, 07 Mar 2022 17:00:41 -0500
Received: by mail-oi1-x22e.google.com with SMTP id 12so16817231oix.12;
 Mon, 07 Mar 2022 14:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SAwkdZ+0crddr7gUhBxW7kWvBvqaHDyvNsu9UmYMPXg=;
 b=mUp7a7edqTgAAeIhoxsXICnIeCdosUCDCdjX/xaZD7mbrGU2E1ex2weX+bpgCg1m52
 qVorcNX/Rq1dnpazw3aT+zbAAl06p8ur1ZrPWaF2hGHsNaWQAMq4w1HvC6cPZdZPOizw
 l8RdAT7sHsziV9YH0JLN5EoGpDjQcIGmbZBTk1QGrjpNJY+eQE6w/12/DRi8Xr2R6EZ8
 tAfGqaz13wmb9o0MKBT0V+6knqtajTi696SOliCtfhjPtO/Nc97w5IlcUyMtfDMhgcXy
 HxVLjm1HLP28fy0Zcu/6qlzQmReQ5l//K0b5AanmkyQg9S9MJ5mF84YilOU2Bh8b9ImH
 p1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SAwkdZ+0crddr7gUhBxW7kWvBvqaHDyvNsu9UmYMPXg=;
 b=fQyY+sQfGAynIMkMN9JYhjQ0dRFH73LHXALv739N38mUatHeD3aHCgA3o0DkXAOYEd
 TiHpwLxzoIIArFe7uW/WNCBw1vWc7o8QajZQIjy0rb5eAt8qyhmuW/NdEj3oM/mu0jnh
 hrsKwMMbxZcTiUhC77oUArhQHpY2rQxU4C8D2lzqnoJh5q7tZbP5SYLNhoLa6piBhK+Z
 CAiAuYXUywubW77mUb9fY/BrUXmJ7Wd63S6zfTPORAEJe3aJotQ3AnMIfFfGNElz+bZx
 eS7zWEEG9KV7PZHLTn3qa14/dVBbL2m1K9kq5UFoceJgBdb2IEoExwMGFFES8hrXlJ6w
 WDYg==
X-Gm-Message-State: AOAM531vrm2ztxx/GzFN5ByqnVgu+xcu7N0RrHmI9I7cENcxjwKygHYi
 taeKCWxgHERZXmkfTlsraIk=
X-Google-Smtp-Source: ABdhPJy25OTYILqmXeGhwV80IKl0v5jR5s11SYT+3E36Ym+WFBMAnkLyfd8ZX3+eivI74QJMXGGCqw==
X-Received: by 2002:a05:6808:1490:b0:2d9:a01a:48ba with SMTP id
 e16-20020a056808149000b002d9a01a48bamr741397oiw.261.1646690438830; 
 Mon, 07 Mar 2022 14:00:38 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6?
 ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a056870450300b000da5424e4b0sm1589864oao.50.2022.03.07.14.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:00:38 -0800 (PST)
Message-ID: <74b35947-b6f2-6155-45de-93777545753c@gmail.com>
Date: Mon, 7 Mar 2022 19:00:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220307191553.429236-1-danielhb413@gmail.com>
 <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/7/22 17:21, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 19:19, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>> Hi,
>>
>> I got a lot of noise trying to debug an AIX guest in a pseries machine when running with
>> '-d unimp'. The reason is that there is no distinction between features
>> (in my case, hypercalls) that are unimplemented because we never considered,
>> versus features that we made a design choice not to implement.
>>
>> This series adds a new log type, LOG_UNSUPP, as a way to filter the
>> second case. After changing the log level of existing unsupported
>> pseries hypercalls, -d unimp was reporting just the ones that I need to
>> worry about and decide whether we should implement it or mark as
>> unsupported in our model. After this series there's still one hypercall
>> thgat is being thrown by AIX. We'll deal with that another day.
> 
> So the intention of the distinction is:
>    LOG_UNIMP: we don't implement this, but we should
>    LOG_UNSUPP: we don't implement this, and that's OK because it's optional
> 
> ?

The idea is that LOG_UNIMP is too broad and it's used to indicate features that are
unknown to QEMU and also features that QEMU knows about but does not support it. It's
not necessarily a way of telling "we should implement this" but more like "we know/do
not know what this is".


> 
> I think I'd be happier about adding a new log category if we had
> some examples of where we should be using it other than just in
> the spapr hcall code, to indicate that it's a bit more broadly
> useful. If this is a distinction that only makes sense for that
> narrow use case, then as Philippe says a tracepoint might be a
> better choice.

target/arm/translate.c, do_coproc_insn():


     /* Unknown register; this might be a guest error or a QEMU
      * unimplemented feature.
      */
     if (is64) {
         qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
                       "64 bit system register cp:%d opc1: %d crm:%d "
                       "(%s)\n",
                       isread ? "read" : "write", cpnum, opc1, crm,
                       s->ns ? "non-secure" : "secure");
     } else {
         qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
                       "system register cp:%d opc1:%d crn:%d crm:%d opc2:%d "
                       "(%s)\n",
                       isread ? "read" : "write", cpnum, opc1, crn, crm, opc2,
                       s->ns ? "non-secure" : "secure");
     }

This use of LOG_UNIMP is logging something that we don't know about, it's unknown.
And hw/arm/smmuv3.c, decode_ste():


     if (STE_CFG_S2_ENABLED(config)) {
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
     }

     if (STE_S1CDMAX(ste) != 0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 does not support multiple context descriptors yet\n");
         goto bad_ste;
     }

     if (STE_S1STALLD(ste)) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 S1 stalling fault model not allowed yet\n");
         goto bad_ste;
     }


This is something we know what it is and are deciding not to support it. Both are being
logged as LOG_UNIMP. This is the distinction I was trying to achieve with this new
log type. The example in decode_ste() could be logged as LOG_UNSUPP.


Perhaps an easier sell would be adding a "LOG_UNKNOWN" for the features/regs/etc that
we do not know about. The semantics/intention seems clearer than what I'm trying to
achieve with LOG_UNSUPP.


And yeah, if this is too convoluted to push forward I can always tracepoint like Philippe
suggested as well.



Thanks,


Daniel



> 
> thanks
> -- PMM

