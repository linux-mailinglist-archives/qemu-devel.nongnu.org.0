Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FA4AF90D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:12:14 +0100 (CET)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrRt-00067f-9W
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:12:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHqYK-0004r2-36
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:14:51 -0500
Received: from [2a00:1450:4864:20::432] (port=45748
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHqYG-0001RW-SL
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:14:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so5176958wrg.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 09:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGPY7UsN51LT1AhXH1630JOWZGD3nEweYNExlzh/Vy8=;
 b=iyEimfMuPrxbWh4D/RpuI6140P0iWuTz428bt+0fTR4keBWwTjTpYLlHid+GeNBzcR
 Bxg9cSrJvyQ1JARLGqLHArMSXP45B8dYgyeMMYPSODrhDRVrmp7doK6/EhY/xopOzJsN
 iiJkvb5GPmHppHOiWlyvM0jnkqpwcEbJP79Hg+Uksl/cHLmFlVEdmX458Uia7ukMI/Ks
 iFGWEXR0UF8I2A0gtkJJijjfChs5e7az/85gSMqj1rIfCAIDW7g7BGVPxrogHp0mCU2E
 Wb0VlLfgzNVfW/i2izocx+5AMI0QebibyaldEaB20LNXDU+zI2R3hhcBdjcR+dDVqldy
 Grcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGPY7UsN51LT1AhXH1630JOWZGD3nEweYNExlzh/Vy8=;
 b=UQnaa+jwG9yZbiUZyErZJpTlIrAdZs1u5lSrtAHmtbVvwhv2B7zHsfx5zW2CaH8GWX
 y/rMLMbSwiO/CUevXUjiWyoVvVxZjJAkWv0h3utabMVl3akRpotE1gMzPzQaSA/vvNvB
 pDYvpWH9O6utnuDhg3bYqUTI0/bVywHXiCsLbUJrLOlw+Hoi1hQnSNwMSwR/IQrdz1pT
 o4zKUol3wWWrLr2ne22PG1klNXK0hpmx2SfI6R1qYhnOUINf26JcHLP0CDBnmPp4Ya9f
 s2+EniLwWbvivsqVdwiNEDWcDwEggL7ymQBDJq4HMuC8WVvRMAwGzivcbX2KAISjWmBt
 8oMg==
X-Gm-Message-State: AOAM533f4mwM1GZfwujMPrrhPv+kOhvk9VOEegIEhmSxz8R6kFgq1DjB
 MeJYb/Rrdp4AekgFlJFMcWornRVK+Kn8EW+aEhTPrw==
X-Google-Smtp-Source: ABdhPJzGcr0k+M5qqOiqlXaSRBda6BEB64YdpQ9S4SvHcuW2zmcteTZ6pgUN0qkdkhgSqJBB9wknnPDQPyrWGwXCiH0=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr2831871wrs.295.1644426879382; 
 Wed, 09 Feb 2022 09:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20220207213039.2278569-1-jsnow@redhat.com>
 <CAFEAcA8Diwoioh6U95Q_c8y+cjsuVRv-VvW89Ngp9a2k47UuiQ@mail.gmail.com>
 <CAFn=p-Zzwyg2Rb_Dj24BHGGiUOPtZTY1-4PQ8DerZxW14=PUwQ@mail.gmail.com>
In-Reply-To: <CAFn=p-Zzwyg2Rb_Dj24BHGGiUOPtZTY1-4PQ8DerZxW14=PUwQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 17:14:28 +0000
Message-ID: <CAFEAcA_Orxgbgz3HEQ6-KsmWW5gJtA9X73mO1ttNZBe4vtegCw@mail.gmail.com>
Subject: Re: [PATCH] Python: discourage direct setup.py install
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 16:54, John Snow <jsnow@redhat.com> wrote:
> On Wed, Feb 9, 2022, 8:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> While we're on the topic of python installation, is there any way
>> to suppress or otherwise deal with the warning Meson prints out?
>>
>> WARNING: Broken python installation detected. Python files installed
>> by Meson might not be found by python interpreter.
>>
>> (I vaguely recall tracking down a meson bug, and this seems to be
>> some issue the meson developers have with the way Ubuntu/Debian
>> have done their python packaging. But I forget the details.)

> Unknown, I don't think I see this message on Fedora. Are you seeing
> it from Debian? I'll see if it shows up in any of the VM build tests.

Yeah, it's an Ubuntu/Debian thing.

-- PMM

