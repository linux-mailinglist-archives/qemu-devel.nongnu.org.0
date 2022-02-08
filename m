Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DE4ADFCF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:39:21 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUSW-0008On-GU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTEe-0006hp-2I
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTEb-0001x9-Rz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644337253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/ZHQXMp0xOKdm03n4+685zIErIl3urKp6icCG1QC2c=;
 b=X8e3X81pG9U78XKqObd//1+t6yRGi2q6Rfk97GO7fZggb76p45CxAfpRVZfYyrZTJYg6C/
 5c23EVJFEU+I9+yttS/3CCOYtJ5J7CF3v6Dvb8DMWBTCMhIjxUuIMsWUJm+XR5/KLAGmWj
 uBUnD0Ng8IpfcLIbkKv/P2IgF5UBMTs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-OQrUhxctOrOhQR8kkxi0eQ-1; Tue, 08 Feb 2022 11:20:51 -0500
X-MC-Unique: OQrUhxctOrOhQR8kkxi0eQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f6-20020a0564021e8600b0040f662b99ffso4022644edf.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P/ZHQXMp0xOKdm03n4+685zIErIl3urKp6icCG1QC2c=;
 b=bJhpt8H+/gVEN75mf2zKtRX+P15bgM6XiIuYhEN6bnJNHMJrrNXaEdEJJsSxWgYlq8
 YBgB6R4Rm2uB3zcq2orhGypPN8N7hyaLW1M7D2Yd2cPjddjmvy113dEVSMa1bGnIZ0rW
 B7yJU/hb2tt2VvPIeteRBpvt/dc5IVhfK93OVadk/DAmbVCkEEsbBy0YhqeXGz3C0X3H
 PQNiUZwEy6u7JmLmhFtEx/mmohR1nJkSpbHFy4KJU12Q1ADth3X8DNxseQfoJb6jUNsW
 wZ4rR6DC/QMQih+7ZeI9MNJO1tliSpZwTSIWtgq0xYVvHqgQmGfJ+l8PNnfykPTd55rf
 nPZg==
X-Gm-Message-State: AOAM533RD74gLBAgM7rWATHHWXPR3NTI9xcYzJhhN4G4xgZwYa6z1aTz
 5y8aYcFoou5yHMLQKRP98AeJ/OVVJZx1CCzgc+AaeyllmEAqStDvA8KTxL8OK+kBqMJg20NnxrL
 UuxEn1JC/gxCExg0=
X-Received: by 2002:a05:6402:14c5:: with SMTP id
 f5mr5320267edx.122.1644337250773; 
 Tue, 08 Feb 2022 08:20:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKZp/a+T7GGOr6dw2wT0MnibckmBTD83xEVMnDJC/yZWNbCriO9K+2nkA4eT/JPch4wAV4vA==
X-Received: by 2002:a05:6402:14c5:: with SMTP id
 f5mr5320246edx.122.1644337250524; 
 Tue, 08 Feb 2022 08:20:50 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id i1sm2052241ejh.208.2022.02.08.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:20:49 -0800 (PST)
Message-ID: <687ca4ab-eef3-56f6-2cc1-a6d98d77d304@redhat.com>
Date: Tue, 8 Feb 2022 17:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Kconfig: Add an I2C_DEVICES device group
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 16:59, Peter Maydell wrote:
> This patchset adds a new Kconfig "device group" for I2C devices which
> a user might reasonably want to plug in to an arbitrary i2c bus via
> the command line.  This follows the approach we use for PCI devices:
> generally-usable i2c devices have
>         default y if I2C_DEVICES
> and board models with user-accessible i2c buses have
>         imply I2C_DEVICES
> 
> This means that when building a board model that pulls in the device
> group, the devices are all compiled in and available for use.
> (Previously they would happen to be present and usable only if some
> other board that explicitly pulled that device in happened to also be
> built into the same QEMU binary.)
> 
> I have been fairly conservative in marking devices as being in the
> group and in marking board models as pulling in the group; feel free
> to suggest changes.
> 
> In particular I've only added 'imply I2C_DEVICES' to arm boards.
> Grepping through Kconfig files I only found the PPC boards e500 and
> ppc44x that enable some kind of i2c controller anyway.
> 
> The immediate motivation here is that the recently added lsm303dlhc
> magnetometer isn't currently built unless the user manually adds it
> to their config, because as it happens no boards have it as a
> hard-wired device.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> thanks
> -- PMM
> 
> Peter Maydell (2):
>    Kconfig: Add I2C_DEVICES device group
>    Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
> 
>   docs/devel/kconfig.rst |  8 ++++++--
>   hw/arm/Kconfig         | 10 ++++++++++
>   hw/i2c/Kconfig         |  5 +++++
>   hw/rtc/Kconfig         |  2 ++
>   hw/sensor/Kconfig      |  5 +++++
>   5 files changed, 28 insertions(+), 2 deletions(-)
> 


