Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB202299956
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:09:36 +0100 (CET)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAgJ-0003KT-Mq
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAXm-0003Nd-A8; Mon, 26 Oct 2020 18:00:51 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:33005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAXh-0004oa-7s; Mon, 26 Oct 2020 18:00:45 -0400
Received: by mail-ed1-x543.google.com with SMTP id w23so11273321edl.0;
 Mon, 26 Oct 2020 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BHHyLK4dbzumvdiDtF8jxXveU1KQbQxcU8A/Ktx9ZP0=;
 b=FDVw2vnedQUu4/v8cv5kaokf5quhiBP3p5CGffARAwaygeHChNyVsIg0I9tslY1yI2
 J6/5wGu5tf1HwaP1giokvmuo7CWpt1F1fe9aKVi/OEv+oiDc3P3uZrQiC/Ugld6IfWzi
 WPnHiQ5vfufNCSmK8nKDuB5KWkTtRZ1mrSF+mDubdrUfbFCfh1bissMP0PrzPv+ZGnN3
 vxkPhfgxDa1/rl43C80S6PXEoPWmmNDGRzFn0qdlQUH8AMrDVKpQa2CPhyZ/syOw6FAW
 ojNh1PRdTpBHvPQvOBNATw2T6CgiighomKBxK4I5ubEawOUn0dyjU//IrtT9axPX5aUr
 tH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BHHyLK4dbzumvdiDtF8jxXveU1KQbQxcU8A/Ktx9ZP0=;
 b=CLUn7rsnvGhcp8929G0rDsmd0RSBeUDWilimKaKw/OhfNAXN57wWP+2BbbY2LdZ7ap
 NNzLshE7Hz3AneONlSrhOr7IoGPUfoRBCPOhVrnVDL6X9NQo/OPAqUlxq1CsOoO/ATpL
 EfBpD+u/ea/CWBkwNwzUiAj0UlzVBU0oFlL7Oe3bPfBkeIx5afV/RXQ4ek5JFEdLwhk2
 ZdXJoFO9kCIXSxaO6iJ/U3hpjAEQTA28s42YhU0CQfNtlNzy4EW2+Weaj3SusQusVlTD
 WQmv3Fn1ivFmGDfBqpFNV8MiWPHkDQnN3vnOYcLnXomh8TP5KTvEWO7Oq5omERFI4rrf
 WWPQ==
X-Gm-Message-State: AOAM531yjNxAx1SsDPiW94DVanxq2n+Au2D3Vvze58EsqnTnzqsUY1UT
 yWe4Pl/BmQ5l6UL6s+aPYzc=
X-Google-Smtp-Source: ABdhPJx2K15S2laW8Fexl73CBSiQbvysnroJS5082ihTczKyPiZYp7GybOm5RC8f0u5fgkuuktR98Q==
X-Received: by 2002:aa7:d658:: with SMTP id v24mr14625078edr.327.1603749637117; 
 Mon, 26 Oct 2020 15:00:37 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id i14sm6529768ejp.2.2020.10.26.15.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 15:00:36 -0700 (PDT)
Subject: Re: [PATCH v6 0/7] hw/misc: Add LED device
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200912134041.946260-1-f4bug@amsat.org>
 <3783cc00-8ec6-6174-dad6-331177b95724@amsat.org>
 <22a8256e-3d1d-832e-b8ac-e05e9e91f07e@amsat.org>
Message-ID: <12b6cd76-d444-4ff5-1e7c-f11c8e54ffb9@amsat.org>
Date: Mon, 26 Oct 2020 23:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <22a8256e-3d1d-832e-b8ac-e05e9e91f07e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/20 5:29 PM, Philippe Mathieu-Daudé wrote:
> On 9/19/20 2:30 PM, Philippe Mathieu-Daudé wrote:
>> On 9/12/20 3:40 PM, Philippe Mathieu-Daudé wrote:
>>> Hello,
>>>
>>> These patches are part of the GSoC unselected 'QEMU visualizer'
>>> project.
>>>
>>> This series introduce a LED device that can be easily connected
>>> to a GPIO output.
>> [...]
>>> Philippe Mathieu-Daud=C3=A9 (7):
>>>    hw/misc/led: Add a LED device
>>>    hw/misc/led: Allow connecting from GPIO output
>>>    hw/misc/led: Emit a trace event when LED intensity has changed
>>>    hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1
>>>    hw/misc/mps2-fpgaio: Use the LED device
>>>    hw/misc/mps2-scc: Use the LED device
>>>    hw/arm/tosa: Replace fprintf() calls by LED devices
>>
>> This series is now fully reviewed.

As soft-freeze is tomorrow, I'll go ahead and send a pull request.

Thanks,

Phil.

