Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3F3E528C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:07:07 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJyk-0005yN-Ti
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDJxF-0004CN-LI; Tue, 10 Aug 2021 01:05:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDJxB-0000lT-RX; Tue, 10 Aug 2021 01:05:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id g138so300765wmg.4;
 Mon, 09 Aug 2021 22:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KNHqKSBDR5Kv6C72hXvrkjzGOtl8Cvx/p06cXPSQimk=;
 b=Hh1kRIIq2H6lriZZ3vSV//TglhU71FWA5idcIYj/Vl8hzSbqGQk41gpY11CERaRk9f
 NDtuYs1GtXhWmD1uKFf3xzF0vFyTFsN+VZg01wyt9UlNVE/23kIrSKjBwC3Q/8OjYLq+
 pGKoxxF92rkOA9BRrjvIBZPTIKGAm5xYKHzX89tN5bLq0ofVPr5W7wPQG63/33T+A4d0
 NR56nq166Ofe+qzxVk2VJzJ5NWVWj5TS77c25e4YYckmZpkS5RPw1pLVSalAJBK28eov
 DujERDQsSOhT/R6l3wYHCgMnZ8Xx+PSZx6Aa8RarVAO4qDM0jAGEQdeR8gzw4oxq6aXM
 c+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KNHqKSBDR5Kv6C72hXvrkjzGOtl8Cvx/p06cXPSQimk=;
 b=R410/lyTZDasiJTuDPAkcx2tmdUxt9TWkZaZJyjOVAgRQr1+sLnPt/y2fYpZATOPQp
 f9GHo30j17W0QFFtuxH3xg6IDjOXA1DGB05CvBm/bRh2TjZ8L3yTyvtVe3/mHQ+s9hb/
 jUmMOyAta72TP0k8h3Cqtd7ZeL8hlNqY4iJh1aHxWvJpIkGsIYToXYRc3Unmjz9eIVyk
 16Gg8Es9OW69l44SijJ0k1l2eXYIB5n6RTIaMXg+dLoQPxgbSz2D9jIIOdk+hpjnoZm0
 iFFDnQiI0FwhRx0e04yvmoVa2ZweVyo0GUndtigKZd/AVTHfCqpkhAtZyD8DedLoGtr4
 SKeg==
X-Gm-Message-State: AOAM533HSuZINQ5JlNV1oTw+Lss8bEx0zYcFEtYtWN5sN9cNmV78uJ71
 CrF9trq8rkLitldyGQaj5/8=
X-Google-Smtp-Source: ABdhPJzI5d2n/xUzWKBFfBWxLEhHQvLIfj/I5/TVqwYoZWBca/ZHXiAfng7Fn6TRcxVO6oKV6JWt+A==
X-Received: by 2002:a7b:c094:: with SMTP id r20mr9479666wmh.163.1628571926232; 
 Mon, 09 Aug 2021 22:05:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g16sm26324559wro.63.2021.08.09.22.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 22:03:50 -0700 (PDT)
Subject: Re: [PATCH] xive: Remove extra '0x' prefix in trace events
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809085227.288523-1-clg@kaod.org>
 <e546f365-b941-ccda-8ba9-24aadb12da3b@amsat.org> <YRHOv3siLEqQuSBB@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9cf5c816-b1e3-6a56-67b9-f300c5a767fa@amsat.org>
Date: Tue, 10 Aug 2021 07:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRHOv3siLEqQuSBB@yekko>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 2:56 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 11:39:49AM +0200, Philippe Mathieu-Daudé wrote:
>> On 8/9/21 10:52 AM, Cédric Le Goater wrote:
>>> Cc: thuth@redhat.com
>>> Fixes: 4e960974d4ee ("xive: Add trace events")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/intc/trace-events | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
>>> index e56e7dd3b667..6a17d38998d9 100644
>>> --- a/hw/intc/trace-events
>>> +++ b/hw/intc/trace-events
>>> @@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
>>>  xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x ACK"
>>>  xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x raise !"
>>>  xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x new CPPR=0x%02x NSR=0x%02x"
>>> -xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
>>> -xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
>>> +xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
>>> +xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
>>>  xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
>>>  xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END 0x%02x/0x%04x data 0x%08x"
>>> -xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
>>> -xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
>>> +xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
>>> +xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
>>>  xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
>>> -xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
>>> +xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x%"PRIx64
>>>  
>>>  # pnv_xive.c
>>>  pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
>>>
>>
>> Acceptable for 6.1 IMHO.
> 
> Acceptable for, but also not vital for.  I've applied this to
> ppc-for-6.1, but I'll probably only bother sending a PR if some more
> crucial fixes come along.

Fair enough :)

