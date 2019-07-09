Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE182640FD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 08:12:57 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl5qa-00062W-NG
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 02:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hl5pd-0005Vk-3n
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 02:11:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hl5pb-0007Qo-0C
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 02:11:57 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:44652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hl5pa-0007QJ-Qb
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 02:11:54 -0400
Received: by mail-ot1-x334.google.com with SMTP id b7so972600otl.11
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 23:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lf3EnFwJ5D9ZPFimQQP7oOEz9HE97ug8lc33kyMVnFU=;
 b=cgphec37CI+8vVKtsqEnMoxxGKkeew9DzR4nK7h2XH+V5xoFMuXZadws0UHR2C59d/
 J9QeRDTMC1Uexxworq8KXfpiDxu6zisXZzWfXoGvPR4VL0kanMKW60jHqS2gS2HimuoN
 loEWqjg9TEyXq81oRhw2hrGr/+DGpjzlLJECLX0I1tjfPiqEkLv/W4KGbRNRzvFPfjtY
 p9q4B34gnVGrsJfmPgH4uWR9M+4/+VR6EdjUwnV5XkGmASsFRDFE4XOcb4pIHAqpkXpF
 4rx547BhawyFly3bpx8Su5MX/OUut1wRnfYD3EuYh4Rog+G8iaSVPOuPoUVqgXBuUal1
 0SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lf3EnFwJ5D9ZPFimQQP7oOEz9HE97ug8lc33kyMVnFU=;
 b=XFZL4+OoTHZP036OQKrRb0c1hR0AWf7nSo8ioORuiz9U5yBtqyn+y54z7FCayIhSS5
 2QqUnojAC1+JajsNOy87AkGbmh6q/iNOCpRAKI422SZQ2LQ0zqL4EsV5KYuYX0QjGAVg
 ihZ/TPJT+10JZ6nzOceFTftLMMuix7eftY6sj6NNZtR3tpZWzaPwB12TWQdF7UpFacHA
 2/bFbaqiSPzYXNWaC1fqlzTPnAZ40lWDPzFR1MQM7hTLUXa/K3ePonmAvpErDMD7tMls
 XSG1BGJ5iyU1YTQ/tGC1KH9cxONdJ0h9RFCzT+XZ7FFxGshyJIg9PwuJ4wzEv70Om7c3
 WARg==
X-Gm-Message-State: APjAAAVvf7uclDOdnzchNR+uEKjrcqpJDveCinYz+0K9daJ/S9n0OAT6
 gELXwFXC5EKVUXJIvy/3zBA6mg==
X-Google-Smtp-Source: APXvYqw/hgtpj8YGDjZMrhXFDMRmz6NenvdvLxOLteHTaZWSqzmm8h77Hy61lcWZweBNwru/9ZgdIQ==
X-Received: by 2002:a9d:4048:: with SMTP id o8mr22557308oti.217.1562739113544; 
 Tue, 09 Jul 2019 23:11:53 -0700 (PDT)
Received: from [192.168.43.94] ([172.56.7.82])
 by smtp.gmail.com with ESMTPSA id b23sm475374otl.75.2019.07.09.23.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 23:11:53 -0700 (PDT)
To: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <2136180936.260219.1561641583358.ref@mail.yahoo.com>
 <2136180936.260219.1561641583358@mail.yahoo.com>
 <1079763171.281101.1561641752988@mail.yahoo.com>
 <e4c1fbc4-3e43-5df4-a17c-527d98d9763c@linaro.org>
 <20190628002713.GA19257@localhost.localdomain>
 <eadb57ae-256d-0bb7-5988-f493662a5caf@linaro.org>
 <20190628155030.GA34320@localhost.localdomain>
 <ea16a81c-5b94-8dd0-8339-2bd82733aed2@linaro.org>
 <20190629163621.GA111724@localhost.localdomain>
 <CAFEAcA9sfNisAz-zAZAx=ZNFmsEpP0Ec2DeRedtZSd9KQ4fvNA@mail.gmail.com>
 <1399218244.1210557.1561982640362@mail.yahoo.com>
 <CAFEAcA-0vGg_1nfkbq+o6JwoDsRyP=6mnv6ADi-atV0ROX269Q@mail.gmail.com>
 <CALvKS=GvAkNr3OKZzjGoTGG_Eys76zjcjodiN4hKXjFM5B0a4A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d9e5602c-bb33-1812-ebc2-b533e9dd5f25@linaro.org>
Date: Tue, 9 Jul 2019 21:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CALvKS=GvAkNr3OKZzjGoTGG_Eys76zjcjodiN4hKXjFM5B0a4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-devel] RFC: Why does target/m68k RTE insn. use
 gen_exception
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
Cc: Lucien Anti-Spam <lucienmp_antispam@yahoo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/19 6:58 PM, Lucien Murray-Pitts wrote:
> Any suggestions on how to obtain pc_next from the "m68k_cpu_do_interrupt(
> CPUState *cs)" ?

I did have a suggestion.  It was fairly detailed.

https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06522.html


r~

