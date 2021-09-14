Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BA40ACA4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:41:46 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6or-0004SA-Mf
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ6mB-0003Hp-S5; Tue, 14 Sep 2021 07:38:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ6m7-0005j8-OO; Tue, 14 Sep 2021 07:38:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso2265221wmd.5; 
 Tue, 14 Sep 2021 04:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6aFNn6YJmquc8lct0FXlBEWnOJ/DMbrk8gsfOaJbmw=;
 b=U52ZWXS9loZ9RIbpiyL36rlYBc4hhrGl2BNWDLxbz9VOybVlTlsN1nUXdby2aDx4/a
 N9n4viKarRNr5RYT1M8A/jYNRRDwvRmoYpgra9Wxgw9SFqTTthVJhdfuXtS/WKtRlby3
 CfsgVXzEFjYukUv0sJu5jtYAxOEeaO7zdWQYt/oiVo4hZkBQu2xC5i0FmMi3W7YFjfGo
 lP62NoOmS2zl9NgaJgMBly1bEAOwjArFFFNdheehn2VpFXFpn0Jt4DlqqWIy8QJr3kQf
 lMX+qHoykPby6SFO439/qCDAwG2fOlo9kND5Yct9w3vXxZVVSpqx/iXnVzWzAIQ8mu7A
 qtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6aFNn6YJmquc8lct0FXlBEWnOJ/DMbrk8gsfOaJbmw=;
 b=o+REG3bLqRfOmc66g7ra1XyIgEtPtLQV9Vv1aDs1OuwYDZxMwR8DV+spGjTZRbXjMz
 cWXPe16LnspYMdlEII7VuqnLSyCvmjUp5PpsuMR82dLa+jNwcpry4sW13Kj/xBDcehkB
 826MQGxyCsvVrdICWsBfCdR5/BhtwH1jEwHrrTVMF3FVDRDUhaYXJrdEA6XFgDPNLLsy
 fRxzjPd2TQaWlusqKkr4iWYZu9k8c/JJhlljaf8Z/eFZEOM0sXgAkLE/s156AjFBo2Uv
 IxP2Pf6QvpOJOThDGbkewMsvOUxPluD7fqtzvT58s3TVIf2e0LWC/XFPOpNu5ht5I5o4
 A9vA==
X-Gm-Message-State: AOAM531wijuN3hXReiI/D6lOLKhGgbuTFZxus/9JTZrMfoqrKZ1RFeOz
 s8p4cCJqFgQpgqocJPVy4SFx5+Lkxx4=
X-Google-Smtp-Source: ABdhPJw8RQyET32cQtvgKOSngOld4VT3aEXKzuuPpq3cZHNKF3EUTk9NN5C4VXGsAzKLuNv6Z21uSA==
X-Received: by 2002:a7b:c447:: with SMTP id l7mr1697998wmi.15.1631619531911;
 Tue, 14 Sep 2021 04:38:51 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y8sm3225030wrh.44.2021.09.14.04.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 04:38:51 -0700 (PDT)
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210913161304.3805652-1-clg@kaod.org>
 <CAFEAcA9CJekxghvjOpoweVNX6ebKz9yP27tP8OVsiR49T4XSHw@mail.gmail.com>
 <22ba830c-47b2-a2b6-089f-3844acba7a4f@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cd9bc645-b159-8790-7431-ab0d07ff0b38@amsat.org>
Date: Tue, 14 Sep 2021 13:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22ba830c-47b2-a2b6-089f-3844acba7a4f@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 12:58 PM, Cédric Le Goater wrote:
> On 9/14/21 12:51 PM, Peter Maydell wrote:
>> On Mon, 13 Sept 2021 at 17:13, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:
>>>
>>>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210913
>>>
>>> for you to fetch changes up to d7add12e20fa8982f5932ff4dca317c5d2dfe7d9:
>>>
>>>   hw/arm/aspeed: Add Fuji machine type (2021-09-13 15:19:20 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Aspeed patches :
>>>
>>> * MAC enablement fixes (Guenter)
>>> * Watchdog  and pca9552 fixes (Andrew)
>>> * GPIO fixes (Joel)
>>> * AST2600A3 SoC and DPS310 models (Joel)
>>> * New Fuji BMC machine (Peter)
>>
>> Hi; this fails 'make check' on 32-bit hosts:
>>
>> qemu-system-aarch64: at most 2047 MB RAM can be simulated
>> Broken pipe
>> ERROR qtest-aarch64/qom-test - too few tests run (expected 83, got 31)
>>
>> I suspect the new machine type has a default of more than 2GB
>> of RAM, which won't work on 32 bit systems.
> 
> ok. I guess we need to change the Fuji.

If the machine requires 2GiB, I'd rather not modify it but not
register it on 32-bit hosts. Better to avoid Frankenstein machines.
Thoughts?

