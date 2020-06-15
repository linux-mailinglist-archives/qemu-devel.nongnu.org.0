Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8771F9CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 18:11:44 +0200 (CEST)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkri3-0000wq-Pn
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 12:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkrgz-0000GQ-Kg; Mon, 15 Jun 2020 12:10:37 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkrgx-0002nA-TX; Mon, 15 Jun 2020 12:10:37 -0400
Received: by mail-ed1-x542.google.com with SMTP id p18so11936968eds.7;
 Mon, 15 Jun 2020 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4XcGnVtSQi3aCkQ4ZSpU8g9kkcVF6G/zxFJakn7ABuI=;
 b=DrXRX8JHO2pebzCWkKOSn4YGx9AseRgzlKvbcOWORna02OZtzuD06Os8q7xrEgXjI0
 ribMEeCdFuYBL1SqIFoRls21FROgE8qqyIZ2KTLCJe7XEf+y5W01tkC4n/ntkgzbhLFB
 /BR3oICcqsO5635zU0E5pis/PEgA3+21r50LNLt2xkziqY8TJznQ29klHYHrNTpH1W/V
 ttSCjpBKGP5rXS4swgoaEg6r4eKTwqUFsN79Po2exXd+42vuUKPYQc2H0DRy3FhdLA6x
 tCJBu8prsYrqwivVuzaNl6yNDV+I0F+d3R+j6IDbcfrEz21aCyZe0lASiH2jbPe3Bpov
 FF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4XcGnVtSQi3aCkQ4ZSpU8g9kkcVF6G/zxFJakn7ABuI=;
 b=B6VDPGH8V31gCnkdNdqbw8RG9LkcquSP9N65J5Z3+65tHo/J3p5qG1lPizoWyoclTs
 LE/3OObGuwPaXY1Jc4+hc/dGxulPtZgZy7g1WBbm1CAWG4kfinxLv6YstNUpZtgyvWkC
 MgDtMWYKNdG8JbT0Tcxv2pOYg4d7onxZdC9BZxePVkfrw8+BdQx0pzQPJKkjlLXPAEJg
 Myml1k3tWFEyJqCbw0bWqhQZ5zzKmtp+gtIjyi9ZOleahPhlTfbbriw9BymOQOVTfU5O
 dl2Pq09DWr+a/rG119YTd+QA+qgSHZ+Oz007M3HaLiTZTEelbV1Hfc70lP+qyEpyJwiM
 OoNA==
X-Gm-Message-State: AOAM533R1Be2X1wSdPUpRci1/jX5gjhm8uqlTS1zsJTz+mWOSGphymu1
 448k0z9S8XIqZviiYjiGliUdyRpq
X-Google-Smtp-Source: ABdhPJw8Gciylc4FFJfbvz1NH2pORQ3+fCeZcjF1vky0AUU4QZpJKyaF48O4PKgeysMHlNhfvQabKQ==
X-Received: by 2002:a05:6402:3052:: with SMTP id
 bu18mr23812852edb.323.1592237433327; 
 Mon, 15 Jun 2020 09:10:33 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o16sm9334582ejg.106.2020.06.15.09.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:10:32 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/5] hw/arm/microbit: Add a fake LED to use as
 proof-of-concept with Zephyr
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-5-f4bug@amsat.org>
 <CAFEAcA-B26YareWgkTanQdGnz+WuyJW6jbHCvdwcGty56zgXpQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <876b9c00-1af3-3673-2819-19f3903af5e3@amsat.org>
Date: Mon, 15 Jun 2020 18:10:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-B26YareWgkTanQdGnz+WuyJW6jbHCvdwcGty56zgXpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/20 6:02 PM, Peter Maydell wrote:
> On Fri, 12 Jun 2020 at 18:54, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We were using an AVR based Arduino to use this device, but since
>> the port is not merged, the microbit is the easiest board to use
>> with Zephyr.
>> Note the microbit doesn't have a such LED, this is simply a proof
>> of concept.
> 
> I know this is an RFC patchset, but just for the record, I
> don't think we should add things to the board that the
> real hardware doesn't have. (The microbit does have a 5x5
> LED "display" but I dunno if this would be the best way
> to implement that...)

Yes, I plan to implement a generic LED array matrix and
use it in the microbit (and few other boards).

Without the AVR port merged, the microbit is the quickest
way for me to test with Zephyr.

> 
> thanks
> -- PMM
> 

