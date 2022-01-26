Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFC349D653
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 00:44:23 +0100 (CET)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCrxd-0002Jk-R4
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 18:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCrvq-0000pX-7P; Wed, 26 Jan 2022 18:42:30 -0500
Received: from [2607:f8b0:4864:20::535] (port=46728
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCrvo-0001R2-Eo; Wed, 26 Jan 2022 18:42:29 -0500
Received: by mail-pg1-x535.google.com with SMTP id s16so628810pgs.13;
 Wed, 26 Jan 2022 15:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8U0PCwXAtP9hxrXRMQAewZRoryCr/zmhGOhvjgaaA68=;
 b=IZF4Lrq7ZdArdyVu+koW8Iep2PsCKJkavjzi1tsClaafL5xEKUEsyF8O63iN2OVTUZ
 QM9/B6EwUYlUDJgrN/j3wqhzZPBt7jUKEpJQ/5uVjsscMqPNOojYZTJi4SMprKbdN2M1
 0CaEOZHEH1BsDBDTr0bUP0R8+EZZAqm3SX65vkcLNaWgKq4pSRATUM0mo5BMCEG40nQE
 fWM0nnWnvqx9VNFUA8tguLk8dAb2YuEGPEkdufFr/kIg/m07rJnw5NoLyxuRn5k6C7nU
 8H5WrJm1jr5f9pNarT7y+S27sPzW4/Ro2G1UBASY61AwA+utqog+PcZNrvTvDKc9MaWk
 D74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8U0PCwXAtP9hxrXRMQAewZRoryCr/zmhGOhvjgaaA68=;
 b=WMTWLTs1rlC0vIj73QjOWvyZwJasvW+vPzleggb2WvxhlgLvCFpbQzM49uqOJdK0fN
 gKVj/E2j74nep8JHXTOFr8i7nlxmCQwzSbPu9F2/1D/0a++QLrgH1RapzjGvKrkMMpnI
 VwwlVxaj/9DFqnXTRdEmPJDBVn8dMrYdTJogl0J8NRRjG/QZ4ax37Zlpm4D8WMS0utTt
 jo8RDwgMkK3wERvXh0I3zMfb0n8ELhE0UkO7rFEYflbIXd6k0MzCG3mf1to/zWFxFhYw
 RiK+JKrz0edYJjCsgAmvPqnNI+sxWc1Ok2sRXe8MskXZ9NlfDbK014zSi3181X08RBVP
 gOlQ==
X-Gm-Message-State: AOAM531ZZRkNRUrtgx8PhWNNGZ10L9cqBgzmYyKyr54ovJgZacqu+Jk2
 p0wb6NTp55johl9fq+ZnIX4=
X-Google-Smtp-Source: ABdhPJwhaWJIzS6+swDO6x60eUa+d7JT/VnL5sT8zwUTfF9+qVr54B5kfNAB6Tl/s5MBKr3I7xmGtQ==
X-Received: by 2002:a65:6945:: with SMTP id w5mr858709pgq.235.1643240546101;
 Wed, 26 Jan 2022 15:42:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id rm3sm302516pjb.13.2022.01.26.15.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 15:42:25 -0800 (PST)
Message-ID: <fff08204-2cd4-0f35-b23d-85a0eeb3ffd2@amsat.org>
Date: Thu, 27 Jan 2022 00:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Chris Rauer <crauer@google.com>
Cc: mst@redhat.com, Patrick Venture <venture@google.com>,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, imammedo@redhat.com, Enrico Weigelt <info@metux.net>
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
 <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Enrico Weigelt

On 26/1/22 19:03, Peter Maydell wrote:
> On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
>>
>>> I need to see a pretty strong justification for why we should be
>>> adding new kinds of devices to the virt machine,
>>
>> The designware i2c controller is a very common controller on many
>>   ARM SoCs.  It has device tree bindings and ACPI bindings which
>> makes it ideal for this platform.
> 
> No, I mean, why do we need an i2c controller on the virt
> board at all ?
> 
>>> Forgot to mention, but my prefered approach for providing
>>> an i2c controller on the virt board would be to have a
>>> PCI i2c controller: that way users who do need it can plug it
>>> in with a -device command line option, and users who don't
>>> need it never have to worry about it.
> 
>>> (We seem to have an ICH9-SMB PCI device already; I have no idea if it's suitable.)
>> I didn't find that device suitable because it is part of the Intel
>> Southbridge, which may have some Intel platform quirks, and
>> we don't need all the things in that IO hub.
> 
> That's a pity. Is there a different PCI I2C controller we could model ?

What about using virtio-gpio & bitbang I2C?

- virtio-gpio
https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net/

- bitbang I2C already in: hw/i2c/bitbang_i2c.c

Regards,

Phil.

