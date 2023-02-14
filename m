Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E796962B6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtrz-0006nt-HG; Tue, 14 Feb 2023 06:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtrx-0006nQ-6z
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:53:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtrv-0001MT-EG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:53:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n33so4779500wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 03:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xA39zz1e17b81sTGADXxoX/nYHcldTppkglokkqhP9o=;
 b=bJiZJ831UsSc33QAH7JX75Fc+rFySZkImtd9qptkX6zbKP9wKM/oumD1Hp0Wn1T/KB
 hDnvJumDaSh8pCvn1gV2BJZ3VJv/hZgRr38yruuPJJPv67KhbgrH6eRzLRWP5Chcg0Rx
 0qtzPg2re5mwVnsmzEkUiIwDH61cDIW5Ql7Dv3xc6y0Mg82L1A95O1y7KwN6qk1USDQO
 rB4RLxi7fc3oEB40p1xOyfKMZpOJ13xs0gKdyFFQ8mHcFZsXD8BA7NkOEGzdY1lOUlGZ
 alamd7S5Kdouzk7j1XKWdzTWBodkjOztth4JpqJvENwV8QrsF1fdvcCw8ckDNNgEFu3z
 3S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xA39zz1e17b81sTGADXxoX/nYHcldTppkglokkqhP9o=;
 b=wp5xbq0loSRcd9sFXfzUmiRXNkkwEl3FdNvOVJrcEGkOxxzXvMtv/PIEFsPm89GCbU
 ZcuawMhiJIgKEt16OtCNAin9+GKBtm4JFhDPacicvTC9UrQu6yrTo3JGmVfvfba5LGpj
 dQI/QJNV6TtPa9VLMt/WV5ZakBm8vFULRq37n/czB9HN1ugqqhXKOo0og8B1kqHDcPm8
 6BjvWObdud9+MuRkDLlWSiJW5Y01AEMxq2b0MiPykSDmiY1++Jof3uIu2VtziHkk06fj
 3zHNvQNZ9zQFQZCtyqgbssRJf1RBz/YaBfvju6xzBG8aP+Vej0GJ2aTgLn/1jZGOLBsZ
 ZJSw==
X-Gm-Message-State: AO0yUKXMcTCyw0JWE23FbWX0iM2yXSTzukWT5pGFHDhPTnYN/sj03eWM
 Gldo8/z/GRTX4cayoAcM8aodLA==
X-Google-Smtp-Source: AK7set9DaH/hwUKBGVEyrR/G6AGn9bhdhjUGHzENeyVl5nvICTaB11S0Muu0VqGQHFc406bCbN/UUw==
X-Received: by 2002:a7b:c855:0:b0:3db:742:cfe9 with SMTP id
 c21-20020a7bc855000000b003db0742cfe9mr2325612wml.34.1676375584400; 
 Tue, 14 Feb 2023 03:53:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm22022496wmq.28.2023.02.14.03.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 03:53:04 -0800 (PST)
Message-ID: <73444fb8-49a7-fc2f-091e-6f65e916fa58@linaro.org>
Date: Tue, 14 Feb 2023 12:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, eduardo@habkost.net,
 antonkuchin@yandex-team.ru, mst@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 den-plotnikov@yandex-team.ru, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, eblake@redhat.com
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+tTgpoz/o0nDu9r@angien.pipo.sk> <Y+ttBkTvDv1T7qi1@redhat.com>
 <87ttzojwl7.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87ttzojwl7.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/2/23 12:49, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Tue, Feb 14, 2023 at 10:25:22AM +0100, Peter Krempa wrote:
>>> On Tue, Feb 14, 2023 at 09:54:22 +0100, Markus Armbruster wrote:
>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>
>>>>> On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> The device field is redundant, because QOM path always include device
>>>>>> ID when this ID exist.
>>>>>
>>>>> The flipside to that view is that applications configuring QEMU are
>>>>> specifying the device ID for -device (CLI) / device_add (QMP) and
>>>>> not the QOM path. IOW, the device ID is the more interesting field
>>>>> than QOM path, so feels like the wrong one to be dropping.
>>>>
>>>> QOM path is a reliable way to identify a device.  Device ID isn't:
>>>> devices need not have one.  Therefore, dropping the QOM path would be
>>>> wrong.
>>>>
>>>>> Is there any real benefit to dropping this ?
>>>>
>>>> The device ID is a trap for the unwary: relying on it is fine until you
>>>> run into a scenario where you have to deal with devices lacking IDs.
>>>
>>> Note that libvirt's code is still using the 'device' bit rather than QOM
>>> path and the fix might not be entirely trivial although should not be
>>> too hard.
>>
>> What's the documented way to construct a QOM path, given only an ID  as
>> input ?
> 
> QOM paths a gap in our documentation, even though the composition tree
> structure has been stable since day one, and is de facto ABI.
> 
> Short answer: "/machine/peripheral/ID".
> 
> Long answer follows.
> 
> We have three "containers" under /machine that serve as parents for
> devices:
> 
> * /machine/peripheral/
> 
>    Parent of user-created devices with ID.  Children are named "ID".
> 
>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict().
> 
>    On "user-created": Nothing stops board code to abuse qdev_set_id() for
>    onboard devices, directly or indirectly, but it really, really
>    shouldn't.
> 
> * /machine/peripheral-anon/
> 
>    Parent of user-created devices without ID.  Children are named
>    "device[N]", where N counts up from zero.
> 
>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict().
> 
>    Again, abuse by board code is possible, but would be wrong.
> 
>    Beware: a particular device's N changes when the set of devices
>    created before it grows or shrinks.  Messing with the machine type can
>    change it (different onboard devices).
> 
> * /machine/unattached/
> 
>    Surrogate parent of onboard devices created without a parent.
> 
>    Put there by device_set_realized() (general case),
>    qdev_connect_gpio_out_named() (input pins) , memory_region_do_init()
>    (memory regions), qemu_create_machine() (the main sysbus).
> 
>    I believe this container was created as a convenience, so we don't
>    have to retrofit parents to existing code.  Probably abused ever
>    since.

Are you suggesting this is a stable interface and we can not move
devices (like from /machine/unattached/ to /machine/peripheral/)
without going thru the deprecation process?

