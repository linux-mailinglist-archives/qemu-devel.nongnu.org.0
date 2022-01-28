Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679C49FBE9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:42:49 +0100 (CET)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSSe-0001qU-HS
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:42:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDSHR-00086m-L2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:31:13 -0500
Received: from [2a00:1450:4864:20::62f] (port=44907
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDSHN-0004hK-Ta
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:31:13 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ka4so16530122ejc.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Ucpq2mQMTmKdhLkauzQ/Wcb++foP2rNjXzZ9Ps2MLA=;
 b=qME8TJxrxdE49z4SnT/neQcaqkgCL3zTxSy/YzwqnKGV20HR9JP8me14lLanYUxDH+
 MeYPk4AYIv9WzPi6RAYKET2l4uE3lbwBd32wKCMCk88AfYu7Kw8C+CeVwW5SYsL9Pz7K
 g2AHtYB/B/oZfFMCjIVc0vXeGdtSmzH7PgcLZD6yXqNZcUpRABP+FEJtoAeWh4ZaYvub
 nk3hd4vZLLzkLw+48/inH4qJxICjZ8fOLB7nLinWtrwBi9AEhY97yzS3tYKgCfeQg3yd
 c/AfN5zmbleiImKVbOvQIS9bDL5IE9S/eurbp95n06tkfr5JvZjGvySOD/xr/fhvrOIe
 MZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Ucpq2mQMTmKdhLkauzQ/Wcb++foP2rNjXzZ9Ps2MLA=;
 b=sj/P80cFQDoQMtjHYdInZthu5X8AgJfqlvlL5xLU3bvTFN6BH68FET7Rgc1HW9GiYN
 fL40g6/1oL10q+5HQFrgSdSA76i0g/hVDXH3Y2g0qF653vlUEgqhD692GvHdk0ukc5zG
 LWBfRF20F2oOgXMhfkHpiV6C0roI9CGiZxos1dNhKgdKXw7m2T0mQ4UTJy2D7KRPe7oF
 /zPcp1PPHgf+ylqEBORLe15NpbmKcpGt8J76jQSJ8rXv18RSk5x3ty3xgyH7KrdU4a2o
 04O0Zq6EOUsl+F/wk0ohcNW3Xr+CQfqn/XbGq1j8+59gpQJkpmC/9CxCFkO3ifqr4aMv
 wncg==
X-Gm-Message-State: AOAM530saU7JrQtEKo5hrShnLY72QXuojhLtYogtPm2mk22WGt/c/DjB
 XSS/khXeL2SqWDtE87+83Cw=
X-Google-Smtp-Source: ABdhPJyH9ZkJyt9W/d/PN2MpaJ4htj3y9If6MeR5f/94lCWg1lmo0PBupjAo67xF1obiaqh+mOimKQ==
X-Received: by 2002:a17:907:a088:: with SMTP id
 hu8mr6496908ejc.439.1643380216016; 
 Fri, 28 Jan 2022 06:30:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bv2sm10016773ejb.155.2022.01.28.06.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 06:30:15 -0800 (PST)
Message-ID: <ac920f6c-de23-b93a-4d5a-db807aeace3a@redhat.com>
Date: Fri, 28 Jan 2022 15:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: should we have a Kconfig "device group" for I2C devices?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-VUOa3R8_BZzJ0d3+RQyZJgwQ-P+3RWPHBoJQYUc7_Mg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-VUOa3R8_BZzJ0d3+RQyZJgwQ-P+3RWPHBoJQYUc7_Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 15:17, Peter Maydell wrote:
> Hi; I've been looking into what is the right way to handle in Kconfig
> an i2c device which is intended for the user to specify on the command
> line with a -device option.
> (It's the lsm303dlhc magnetometer, currently in code review:
> https://patchew.org/QEMU/20210921093227.18592-1-kevin.townsend@linaro.org/  )
> 
> Currently all our i2c devices are just pulled in by "select FOO" from
> the Kconfig stanza for a board which has that kind of sensor hardwired
> on-board. But for at least some of them it works fine to just specify
> them on the commandline of any board that has an i2c controller that
> allows pluggable devices. (For instance we do that kind of commandline
> plugging in our test suite with tests/qtest/tmp105-test.c.)
> 
> What's the best way to structure this? For PCI we have the "device
> group" PCI_DEVICES as documented in
> https://qemu-project.gitlab.io/qemu/devel/kconfig.html#guidelines-for-writing-kconfig-files
> and PCI devices say
>      default y if PCI_DEVICES
>      depends on PCI
> 
> For ISA devices we seem to make them say
>      default y
>      depends on ISA_BUS
> 
> I2C devices currently just say
>      depends on I2C
> 
> Should we have an I2C_DEVICES, which boards where there's a sensible
> user-pluggable i2c controller can specifically select ? Or should we
> mark the i2c devices which are sensibly user-pluggable as
> "default y" ? Or something else ?

Yes, I think it's a good idea to have I2C_DEVICES like we have 
PCI_DEVICES.  This way we can skip them on x86 (where the SMBus 
controller is mostly a legacy device) but include them by default on 
AVR, embedded ARM, etc.

Paolo

