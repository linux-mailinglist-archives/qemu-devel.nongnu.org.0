Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF9577FA2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNz9-0008Lf-GC
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNwL-00060M-JQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:25:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNwJ-0000ea-CK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:25:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h17so16403101wrx.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2tUT+0d1WdjMUQZAJ9HOOTxL9llIhzMEHmbM9BeTpUU=;
 b=SifnCYZiz0SwY43VlzWBGse0Smu+kqc7TyqVS0kVgQK+/lBrGQK1Z47oAjIUa6+PKW
 P5Skx7sn7wnP7UF6Ij7bUZZzlFK9ROanqM+4zJipzCeIy8a7TR4W3uauGSmZwhLOefXO
 TI7uDXS5gmhDwpGlBSZ6AJXVw4jB+bxpEOMNDRTkjhPTJ6NSNwZj4idhpi4o0GCOCekI
 hnmX1UifzmYo2ZQsO28bDuaDtL7L0nyJEvipL9q4huFUmYUHjLOyvVtFXtMSKrm42THK
 m87gLc/G/PWdPsEWw+CMOG4L5TEBn3XK5qtMHUrNsPm5d38qPl0KYkXeQy+8nVcTDtAg
 LzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2tUT+0d1WdjMUQZAJ9HOOTxL9llIhzMEHmbM9BeTpUU=;
 b=tXsLLzUcE7cGjUUZVUghLyFo904BuUwMoNeeRFcSiLyIQFIn5CjPwQ2salgGEdpSyB
 Nn6ppVaWJgZyw3BheR7C+3JDauVPiu0OCtqaLpJTYlveX3BCOLtP8LxMp9OnFg2uWdz6
 42HgOQb/hVPI+1MTBMnr8quSbusQMn+r1I4lCoBSsMBtuy1Sk2D/1vPz/FRY6pvaiRci
 sOOLZpWntbj6Y34TQD6E4/t5TB07FRHBXGcQFrDwQw90jPkYG/RTyStRu0R9LdqOPCe9
 BzfrAvpJNL13IaHQfXdD1cKyQ5aATop85jJZ8PWC9kuPjG9DJbEITgbMEwrRysHxmPd6
 BX3A==
X-Gm-Message-State: AJIora8+Luxp329MKpqzJ1rBbMaRHjkoV7ni985WQdOU6tD7EYh7ek4q
 RV+gnYZ2NGYw/SpyNJyxwJ8dKg==
X-Google-Smtp-Source: AGRyM1vqyecXgGn1D9YGhoTUmvq+iE7dBpoiB1JSggQjuQXuC44gOynJYhlzc9pOELbMIK378CatDg==
X-Received: by 2002:adf:cf0a:0:b0:21e:2970:bade with SMTP id
 o10-20020adfcf0a000000b0021e2970bademr190039wrj.455.1658139921689; 
 Mon, 18 Jul 2022 03:25:21 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a2d47d3051sm16843208wmp.41.2022.07.18.03.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:25:21 -0700 (PDT)
Message-ID: <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
Date: Mon, 18 Jul 2022 11:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gpio: designware gpio driver
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
 <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ben.dooks@sifive.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/07/2022 11:15, Peter Maydell wrote:
> On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
>>
>> On 13/07/2022 18:20, Ben Dooks wrote:
>>> A model for the DesignWare GPIO (v1) block.
>>
>> Is there anyone else who should be reviewing these that
>> was missed off the original list? I'd like to get an idea
>> if there is any work to do. I've got a couple more drivers
>> to submit and was waiting on feedback from this before
>> getting these submitted.
> 
> 
> My overall feedback is: this isn't a pluggable device (PCI, etc),
> so what's it intended to be used by? Generally we don't take
> device models except when there's a board model that's using them.

I have a board file, but that's currently under NDA, so we're not
allowed to release it at the moment. However we've done a few drivers
which we'd like to get out of our development tree which other people
might find useful (GPIO, SPI, I2C).

-- 
Ben

