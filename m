Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B46632FEC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFPj-0001PR-QL; Mon, 21 Nov 2022 17:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFPf-0001PG-Tp
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:37:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFPd-0003W1-RD
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:37:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id 5so9516252wmo.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tvpe4Bw5x75BkmU8KZtSQgc+ZpHp4XmtplC92HTEItY=;
 b=LIu3sS3g2ODYItymcYrkU7JQjUxkqTlpgQ1LzPZj6Ld2YfrzBIz/2roFymufDj6Q/H
 wwh1g9Q27v9gtXVzzAVTwOhd154wn7kcFL7Lmzf7w1QWCy1rT/KvrIoiiMWDmmyXDNVo
 NADrE56SOqDFd7quURuNJc/hy44AmpQ4GsSlpwUj3QmtoIxaWBPb5p43+VC/hPn7kNpU
 Gzl4VBskYEzgr8ECraUb85iGSW6UBl/jGjFbrz8Fs/mND4CqmbDOG/WSrTmlqZOzschf
 /fhg2YbbrNuvpoyPKmCFlzYXsa51RLBy1iWRjUUQweKiMv7EcTC/00rXn23t2kmhWeez
 Tttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvpe4Bw5x75BkmU8KZtSQgc+ZpHp4XmtplC92HTEItY=;
 b=uIMzhM2TaGWvsvVypw1TYTrRJpb+fWE65D6c97v0OKgFHyEUKds5ueZFdqr+4q4o3D
 fiZJC6Zpz8Fx7Ps4OQf4cDQXKYKfbPgTMY6/Vw+0WKID96Mc33YQqWxki50ZexjF6ODs
 wqwRLGx5n5bL7ccgYBwrGjL8XJpCOySRNJuPNvkRnieuw8P8O1N44w/ALYpbQCwDxvlQ
 DmvSSyV/lD8z6Ns9Q9PbnLPUfDahXi1sgXSfqIS80h1/aB4ByK+J3sB/ZMdNzAzicjFK
 pY89tPAlaw4pJtTn+6J87N1QmtYCsdoIX5qdSVRHwf71MMxmLud9LLO2FgBiI9jGg24U
 /36w==
X-Gm-Message-State: ANoB5pkV5CqoM01u+Ko/2GohD9wVifCZwjgcv1TeCLINZnpZM4Il9jZK
 7c1nht8+31GQtszQMPlBOr5gBg==
X-Google-Smtp-Source: AA0mqf64ywx/Fzo4WUS9wjj9sDcNDSAc1QfL+iaEOqTnJ27yyg7Vw+2zvPEumesq49Peib5G8AK40A==
X-Received: by 2002:a05:600c:2309:b0:3c6:f252:f072 with SMTP id
 9-20020a05600c230900b003c6f252f072mr1042082wmo.145.1669070232026; 
 Mon, 21 Nov 2022 14:37:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adffa8e000000b0022e653f5abbsm1930902wrr.69.2022.11.21.14.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:37:11 -0800 (PST)
Message-ID: <b8a21f61-cf25-87c6-694a-c9623a9d9c43@linaro.org>
Date: Mon, 21 Nov 2022 23:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: UI layer threading and locking strategy;
 memory_region_snapshot_and_clear_dirty() races
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
 <CAFEAcA_gDzyucBEq2pQJVmgZkLEP5hhW7k6_LmY7_mO3gEGHhw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_gDzyucBEq2pQJVmgZkLEP5hhW7k6_LmY7_mO3gEGHhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing more UI/display contributors.

On 17/11/22 14:05, Peter Maydell wrote:
> On Tue, 1 Nov 2022 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Hi; I'm trying to find out what the UI layer's threading and
>> locking strategy is, at least as far as it applies to display
>> device models.
> 
> Ping! :-) I'm still looking for information about this,
> and about what threads call_rcu() callbacks might be run on...
> 
> thanks
> -- PMM
> 
>> Specifically:
>>   * is the device's GraphicHwOps::gfx_update method always called
>>     from one specific thread, or might it be called from any thread?
>>   * is that method called with any locks guaranteed held? (eg the
>>     iothread lock)
>>   * is the caller of the gfx_update method OK if an implementation
>>     of the method drops the iothread lock temporarily while it is
>>     executing? (my guess would be "no")
>>   * for a gfx_update_async = true device, what are the requirements
>>     on calling graphic_hw_update_done()? Does the caller need to hold
>>     any particular lock? Does the call need to be done from any
>>     particular thread?
>>
>> The background to this is that I'm looking again at the race
>> condition involving the memory_region_snapshot_and_clear_dirty()
>> function, as described here:
>>   https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/#u
>>
>> Having worked through what is going on, as far as I can see:
>>   (1) in order to be sure that we have the right data to match
>>   the snapshotted dirty bitmap state, we must wait for all TCG
>>   vCPUs to leave their current TB
>>   (2) a vCPU might block waiting for the iothread lock mid-TB
>>   (3) therefore we cannot wait for the TCG vCPUs without dropping
>>   the iothread lock one way or another
>>   (4) but none of the callers expect that and various things break
>>
>> My tentative idea for a fix is a bit of an upheaval:
>>   * have the display devices set gfx_update_async = true
>>   * instead of doing everything synchronously in their gfx_update
>>     method, they do the initial setup and call an 'async' version
>>     of memory_region_snapshot_and_clear_dirty()
>>   * that async version of the function will do what it does today,
>>     but without trying to wait for TCG vCPUs
>>   * instead the caller arranges (via call_rcu(), probably) a
>>     callback that will happen once all the TCG CPUs have finished
>>     executing their current TB
>>   * that callback does the actual copy-from-guest-ram-to-display
>>     and then calls graphic_hw_update_done()
>>
>> This seems like an awful pain in the neck but I couldn't see
>> anything better :-(
>>
>> Paolo: what (if any) guarantee does call_rcu() make about
>> which thread the callback function gets executed on, and what
>> locks are/are not held when it's called?
>>
>> (I haven't looked at the migration code's use of
>> memory_global_after_dirty_log_sync() but I suspect it's
>> similarly broken.)
>>
>> thanks
>> -- PMM
> 


