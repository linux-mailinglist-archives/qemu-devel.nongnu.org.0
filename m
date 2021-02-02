Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2E30C195
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:29:26 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wgG-0001ih-SM
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wdo-000752-OG; Tue, 02 Feb 2021 09:26:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wdn-0002mS-9Z; Tue, 02 Feb 2021 09:26:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id c12so20673528wrc.7;
 Tue, 02 Feb 2021 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/qNb8iqW13I6zvP3bh0qRMsD1/YemJJvDsDIJV88ns=;
 b=pZZVdASDw/2bWyWJip0qWSIXHuNdssugvHraTOa4yZLTdFzV4K+q7GmHsLlhwKnXvx
 N5aVRUb0AUi3QcSYGrlDANTQaqAYZgf9xhgKZOTOEcRVHHaL5iPzOVHgZQeWoUW8EWNM
 +gG1Udi9iH11EW2ydLTEC/YMiiF1TquuQZmsc4y8IggKP0abj9htW7tyDV0ZiFUvvZxo
 Fyj8RYRqtjc6uTojUllF/eNfxqvrwgG/9ubncf1Aquu4mzakJlN02LePDgPm+54oYg81
 MjonO/fYr2jBQYg04SpFs+cyMbl/JiB33YXoSlXQZIisMVnQzjYiHSIMHaVpiFZqzDPT
 Xjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/qNb8iqW13I6zvP3bh0qRMsD1/YemJJvDsDIJV88ns=;
 b=L/VM7hg/h38kYMX19ES11zbXCHtZHQW93kq0SeDrjkaH5Qw8J4/49voFaecOzlbuwI
 Vtzv+WHkHyuYcyFVxe7Be09fUshpTlKl4K03CzH3q0RuoB3ddyXOqNRHyCbh8e3BRUQp
 ilX5zPM9vnmjRhSAwHPllKwL1xZFOT7qLPs7HqbQHA+ogrX89KxY3Nl1vUBoE3iXBkWq
 reb8yWleZeCgUGeC//SjcIwg7NWiAibdYC0qQUUw9hq42Zo/bpIfII1kWobUyYMzG2Dx
 An4nZ2QuWaMkETwO/k64zRakhMyAEZ4yzKd7HyX8T2gK5CYLoj54qmZd+epQUtTCb0Ax
 Y47w==
X-Gm-Message-State: AOAM532s2f2CK+EejZ7Id+HbqxjTI67I4o3Pwpoqx0BYhvDgI/xLEv6H
 BAEHMqrehha1fexmdiBtCeTf2gMICls=
X-Google-Smtp-Source: ABdhPJzUhiNMgFY+vGaqiDn48585jXkxqSyqYp2Y69/V/25vUo1ez4avkNWi1HOyABbZNmSqi4XAMA==
X-Received: by 2002:adf:a2ca:: with SMTP id t10mr23759333wra.370.1612276008248; 
 Tue, 02 Feb 2021 06:26:48 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h23sm3503780wmi.26.2021.02.02.06.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:26:47 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
 <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
 <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8560a139-08b8-be47-f6f6-e3d3833687e4@amsat.org>
Date: Tue, 2 Feb 2021 15:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.155,
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 2:47 PM, Peter Maydell wrote:
> On Tue, 2 Feb 2021 at 13:29, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 2/2/21 1:28 PM, Peter Maydell wrote:
>>> At the moment we can reasonably
>>> say "only the 'virt' board and one of the Xilinx boards are
>>> security-critical".
>>
>> What about the SBSA-ref?
> 
> It doesn't work with KVM, and enforces it:
> 
>     if (kvm_enabled()) {
>         error_report("sbsa-ref: KVM is not supported for this machine");
>         exit(1);
>     }

Uh I didn't know... That simplifies even further the KVM-only
build, thanks :)

