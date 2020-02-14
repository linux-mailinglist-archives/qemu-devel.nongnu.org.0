Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1D15DA2D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 16:03:43 +0100 (CET)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2cVK-0000EB-V0
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 10:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2cUP-0007o7-80
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2cUO-0005E5-2q
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:02:45 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39737)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2cUN-0005CQ-Sd; Fri, 14 Feb 2020 10:02:44 -0500
Received: by mail-pg1-x543.google.com with SMTP id j15so5089210pgm.6;
 Fri, 14 Feb 2020 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/fzSUv3LWaUZgAyFEnvD/PWp0NSUATXxB2tzCGpoCc=;
 b=bzrwGijfp9yoVCMh/AGYESeqYWo//w9yBTgRsT4YlAa9RKhWaGXgRbZ/tLK9f3kyon
 yR/otbnjJWRusFLQEPsrjcUyzvDNiJAl4tXgONXZoWOwCLm+vAlGOqDAtJUIhSHN1qIN
 35Ab24AgPTtTWaoxEaFZMTWKvntMHLN0VL4FOcppRwzWAbVUcWsOqVC2w+789GnojszJ
 6RHkHU5KkUBLOBcPTRv9+JRB/gAtQh64F834QkAy/6aRxK58ODewmn70rmAYUb2XUigZ
 YXOyMu/wIo1GnZPNE0L8t+o1i97E8cv20lE0NWEau4QuMKclqJc4j80lXI45GCP1xuxj
 f/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/fzSUv3LWaUZgAyFEnvD/PWp0NSUATXxB2tzCGpoCc=;
 b=oauvAqxRekIVCv5WOS4PZxBWFKKiB2P6lvSHI2iCWmuP24HYKBOXD2SaYtAlY8WuRL
 Ff3TUvUYy28m0sDIHG0oc1m1weibHk4jZm4XeL5sQf5r30kdSk9Kxd5DvdtSF0iaS8m7
 YbV3wc9MAa+pb2LS0JFYlMdPDyNHV7KdE9R7BH1GLcIYrX9uSda5eLgYEBaIKaTkimiG
 a5krJEY4thNOlPPT8ppUvyHp5FingvqMlqg6DaW+xShBTlL4ATiSX2cutZbRDmXEo78X
 +o6bt/jUYQXAftopDKTVtaLcqvmgs7LKxXGCnlJ+oMGkCFVDlab/7RXyuzTgVQ5mZAsE
 A6Lw==
X-Gm-Message-State: APjAAAWKwlNQvy9TrbiQlZu19ZahPzCqsn8GFcKCmL/LE24hwLMOPFTX
 oq/afWZssinnzyj7VQ2scWG1aMp0
X-Google-Smtp-Source: APXvYqyz79IjAyZaRcyRMHxWU5KY4TtKKk0ITsRauQuG8+0JWVcK9MFsvmAa4GR+W//47FhHhWYKfg==
X-Received: by 2002:a63:ca04:: with SMTP id n4mr3994122pgi.110.1581692562016; 
 Fri, 14 Feb 2020 07:02:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b12sm7662557pfr.26.2020.02.14.07.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 07:02:40 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200214060548.24939-1-linux@roeck-us.net>
 <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9bfcd260-696d-c747-355e-f694d108e9df@roeck-us.net>
Date: Fri, 14 Feb 2020 07:02:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/20 1:26 AM, Peter Maydell wrote:
> On Fri, 14 Feb 2020 at 06:05, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> USB ports must be instantiated as TYPE_CHIPIDEA to work.
>> Linux expects and checks various chipidea registers, which
>> do not exist with the basic ehci emulation.
> 
> Hi; I didn't see a cover letter email for this series (sorry if
> I missed it). Would you mind including a cover letter email

I didn't send a cover letter, sorry.

> for any more-than-one-patch set, please? It helps the
> automatic tools and it also decreases the chances that
> I miss the patches when I'm scanning through my email
> (when I'm tagging things I might want to review I basically
> look through subject lines for single patch patches
> and for 00/nn cover letters and ignore middle-of-patchset
> emails...)
> 

Sure, NP. I'll resend with a cover letter.

Guenter

