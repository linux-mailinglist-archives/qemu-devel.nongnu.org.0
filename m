Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE2544E88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:17:53 +0200 (CEST)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIyt-0005yr-Nl
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nzH2G-0006qx-EV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:13:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nzH29-0005VH-NC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:13:10 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so20876761pjq.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4OEpwKfRhk+/Bw+ajXIlaom3ggZwPPaPsXOJxTS2d7g=;
 b=YePZDPXQlHwHra1M8oaueRHnzF0+1wwx47W6shZG9D5RX6o4W641iQqi41eqckK2Ze
 2OeonslVAfH8l7bYS+Wa7mQM/QQ1KzGzpWeI3GQGAEPOJG+1soa40qQ2qwEI/yPRb6bM
 sPm13NdTMu9IZh4xRkejAKcDCC1HaxLedergL0HkYC5T9hk1PVpp7/vmVAr23rU+jwm7
 00CK+LDaqrS9BqV6miBVfQvc19UagmlQq0M7qoeSSgBw3vIPUJJ8fq4RabRYGX44Rq5L
 dAPEA20CTXkeEghzUucB5RvM0j0BBWOSE8nqxDhxEe6ops21mZcWBT5AFYcyORzghpWY
 3EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4OEpwKfRhk+/Bw+ajXIlaom3ggZwPPaPsXOJxTS2d7g=;
 b=c2nQbAvFww2GOJeHqLsPrFd/tFtR97rZH7ScjSQbcX96X73/KvhDdJniNZV0B5AhJS
 4hCxoGxnVopnyZpvW8tPh+4AW+vcKLEVK/T1cgAQ2m4gLivW4gbABqEk1+iYxXOsZjZK
 6nQSVVFtWeNQ8/KkTADhjXtzjRgo8MeGWYucWCGF/AjFPKAIeINFvKBTmpVw7aYPld46
 rXWXlLAOj8LEEnx7WBuj7fPQt9PPibkOLevDvdieoWEgcXHNs/EYdlky/48BM2LE3zrJ
 yDcQbYeiqYABhbTWkKqNuUruAfBCDeCcgBwgX5xK4YlapyTXiuzIugeRu3FRrY0c9k2Q
 Uk3g==
X-Gm-Message-State: AOAM532wQ2UB0UONfe8KXPuloruscHoPw0aBLoYeU4N6A56nTI0YMSLK
 GSUgtXpGJh27cF7yLHJYleM=
X-Google-Smtp-Source: ABdhPJxolsVGMF3LD135fEKYtts558HztJx0DtQ/nXL2nAEKTVv629O5Bqlcj2rcS1Ve97CgGhad9A==
X-Received: by 2002:a17:903:246:b0:153:857c:a1f6 with SMTP id
 j6-20020a170903024600b00153857ca1f6mr39078667plh.153.1654776783535; 
 Thu, 09 Jun 2022 05:13:03 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170902d5d700b00166423df3cdsm14594081plh.209.2022.06.09.05.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 05:13:02 -0700 (PDT)
Message-ID: <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
Date: Thu, 9 Jun 2022 21:12:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
 <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/06/09 21:02, Gerd Hoffmann wrote:
> On Thu, Jun 09, 2022 at 08:45:41PM +0900, Akihiko Odaki wrote:
>> On 2022/06/09 19:28, Gerd Hoffmann wrote:
>>>> --- a/include/ui/console.h
>>>> +++ b/include/ui/console.h
>>>> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>>>>        int       yoff;
>>>>        uint32_t  width;
>>>>        uint32_t  height;
>>>> +    uint32_t  refresh_rate;
>>>>    } QemuUIInfo;
>>>>    /* cursor data format is 32bit RGBA */
>>>> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>>>>        void (*gfx_update)(void *opaque);
>>>>        bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>>>>        void (*text_update)(void *opaque, console_ch_t *text);
>>>> -    void (*update_interval)(void *opaque, uint64_t interval);
>>>>        void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>>>>        void (*gl_block)(void *opaque, bool block);
>>>>    } GraphicHwOps;
>>>
>>> So you are dropping update_interval, which isn't mentioned in the commit
>>> message at all.  Also this patch is rather big.  I'd suggest:
>>>
>>> (1) add refresh_rate
>>> (2) update users one by one
>>> (3) finally drop update_interval when no user is left.
>>>
>>> thanks,
>>>     Gerd
>>>
>>
>> I think 1 and 3 should have to be done once since refresh_rate and
>> update_interval would interfere with each other otherwise.
> 
> Well, between 1 and 3 both old and new API are active.  Shouldn't be
> much of a problem because the GraphicHwOps implementations are using
> only the one or the other.
> 
> take care,
>    Gerd
> 

The only GraphicHwOps implementation updated with this change is xenfb. 
xenfb can be switched to use refresh_rate in step 1 or 3.

Switching to use refresh_rate in step 1 would break the refresh rate 
propagation until all host displays are updated to set refresh_rate 
instead of calling update_interval.

Switching to use refresh_rate in step 3 would break the refresh rate 
propagation when a host display is updated to set refresh_rate instead 
of calling update_interval but xenfb does not use refresh_rate.

Regards,
Akihiko Odaki

