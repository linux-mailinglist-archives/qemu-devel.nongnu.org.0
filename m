Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F264A51A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lpy-00071a-Lj; Mon, 12 Dec 2022 11:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4lpw-00070T-2a
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:39:28 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4lpu-0006MM-9Y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:39:27 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so3046656wmb.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=4t6dUerYxHF6CoM2aKg/0xJ6z+ZkRCzD/QW3MIhL/ds=;
 b=MCFxJIO7iC8UMlW35mTVHgUv8B2mlSMmZIv3DUUJ/aOuAC+rxoqpP1e66zFYoWX4ri
 phKmTBchooSIMep36H7JZQ+FtyXlJ+e6z4oL8vv7vtD2cihioqaFFTFV7mY1OmWu8YKV
 A4ZyZYhpXy3zI9OmwQkUrVBrFvTOM5NSV4c2IdK1YsUs0ZWPbgXEpa9Uq9y767U7M+da
 6fwBBwyC5+RhLtwkLJ76t+JsOMpic/UxqN2HWNHp6YXMX5xmfxV3X8UT3A5SLbmh7Z6m
 0V8s2LR54mV2vRLzFxsfgclaacqk4ZszHwRN4d/eM1FN5i0Zzjv+9ukt73DBx9KQN0Td
 xXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4t6dUerYxHF6CoM2aKg/0xJ6z+ZkRCzD/QW3MIhL/ds=;
 b=VMCyvts7iR5KsuCRktjkmJJHHGm6u55eKpgzDo9F5xj70TtSbLsVRwtfIYDO1w21Ck
 6xMz+gAw7O4dEawOmBqjCY9pntVmC879MJeuH5qtwncXS5DgsGoOulTa9O3nIzqwSddV
 tnNhiC5Z5ga4wmb5aYQPzukTWNH4oxSejDbju2F22p9VCbpa3q1EkO+jc+GU5aZHrXTS
 1ddjlNrrdd8iOqRj9KsLl5p65WFWvUbSogewxjAwuHwAbpc+ytYEEsGsIH1sXOqCzzd1
 u+d2Lho9WODqQhRz9kNtIEqikNem9Y18XsK0sltoxpvS+/7vqUubppRjFZKD69yziZiZ
 ulTQ==
X-Gm-Message-State: ANoB5pmfbvV+rN5b/rHCj9J4tmVKVLYPTLljm5XBLyySxpIe8SGncnY9
 +gJoiUkIdh0l9wFNmQy+qgI=
X-Google-Smtp-Source: AA0mqf5VJYkwLGYqX053N50Ze/bN0qDOfZ8ASkGbHqF3YCgQzrxvBmGctJ0ewnyGzaDRHpvkUKLZPg==
X-Received: by 2002:a05:600c:1e25:b0:3cf:9ac8:c4eb with SMTP id
 ay37-20020a05600c1e2500b003cf9ac8c4ebmr12541656wmb.24.1670863164791; 
 Mon, 12 Dec 2022 08:39:24 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe2c4000000b00236488f62d6sm9387563wrj.79.2022.12.12.08.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:39:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
Date: Mon, 12 Dec 2022 16:39:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/12/2022 16:26, David Woodhouse wrote:
> On Mon, 2022-12-12 at 16:16 +0000, Paul Durrant wrote:
>> On 09/12/2022 09:56, David Woodhouse wrote:
>>> From: Ankur Arora <ankur.a.arora@oracle.com>
>>> The HVM_PARAM_CALLBACK_IRQ parameter controls the system-wide event
>>> channel upcall method.  The vector support is handled by KVM internally,
>>> when the evtchn_upcall_pending field in the vcpu_info is set.
>>> The GSI and PCI_INTX delivery methods are not supported. yet; those
>>> need to simulate a level-triggered event on the I/OAPIC.
>>
>> That's gonna be somewhat limiting if anyone runs a Windows guest with
>> upcall vector support turned off... which is an option at:
>>
>> https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=blob;f=src/xenbus/evtchn.c;;hb=HEAD#l1928
> 
> Sure. And as you know, I also added the 'xen_no_vector_callback' option
> to the Linux command line to allow for that mode to be tested with
> Linux too: https://git.kernel.org/torvalds/c/b36b0fe96a
> 
> The GSI and PCI_INTX modes will be added in time, but not yet.

Ok, but maybe worth calling out the limitation in the commit comment for 
those wishing to kick the tyres.

   Paul

