Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CA6923A0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWZ8-00070S-7I; Fri, 10 Feb 2023 11:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQWZ3-00070I-D5
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:47:57 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQWZ0-0002Ba-92
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:47:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id co8so1904723wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=At/ga66PacQVUsb/6ZfXaxqI1D6nzXhXIpdyyEbQStE=;
 b=RPIz03Tqb7+9x2C12SikezWs7bKD8Csh/XkPl4xPHoXCJtWP34MP0/iUQtDWwBD5va
 zuxsV2J1tYKmYBvjNr9Xd+CvCfoenxg4xZFsLBxfKM+5Bb3vDxiVYRLuYy0+8uxjjyQT
 x2CEkkL94aJh+cG39MtAZEeeT9aJ+uP6VG7HXOMEF2+dZ34v1J6QQBcEHS5qBc/VKM0+
 rVPMNc70DC5upqh3Xi03qQVuC7Xh90DicCABB8TEjBjLISAKwdQrEFb3xC9EDj73Rhhb
 Mtl6sChQKjsb7hGwlPzIsVMz+oHXj2F1ygCLMBb6KioX+Qts+HwFCx39B/PkQtt2ijKP
 smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At/ga66PacQVUsb/6ZfXaxqI1D6nzXhXIpdyyEbQStE=;
 b=5pAgd8dhPfApQvh4f4MBLOaPOSggz4kBVhKllI6Q2gmCwUdTnkxko+5tyRHrNA9mFr
 Kn5Ddbr6ekiNjbueI2MqVNe9KFfi66AYDEKjUk+AdNVttXjk+6/8E328QEGBosrxeuH8
 L6E6XLgPUmybDGsyxVNqK9X7EGcDcBhA4rgONcJVEh2LrIrPMHqk2+oIenIP1fUFZ7U+
 exM5v6dsIESVl5uVavwtPIKqh6tbPIQU4FqLSZZJav2Ckjcz9vr1HzOF2ASV3ERPchku
 TWDSEtcK2nfMV2yhKW/rq5um4BZndvTBAuyXZL79dX3njZdz+Lue7fWpl2/xrNM64Rx1
 DOBw==
X-Gm-Message-State: AO0yUKWQVRZ9Mft8a0xOgBguxVx+pGCNq4Jbj5OPo4nBX/6oQnoI0grt
 pkVktjhNlTC0wJjZG7V5Vfo=
X-Google-Smtp-Source: AK7set8Vely1o5+nTQEQaFTjtGqkdYkKeX5pdom/tZrDhgLX9rXM6M/rl2fjtWBUvD+uTHLFWWB/XQ==
X-Received: by 2002:a5d:6c64:0:b0:2c3:be89:7c1e with SMTP id
 r4-20020a5d6c64000000b002c3be897c1emr10337289wrz.1.1676047672656; 
 Fri, 10 Feb 2023 08:47:52 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a5d6201000000b002c3ea5ebc73sm3977582wru.101.2023.02.10.08.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 08:47:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <774982d2-eb27-7c4b-88fe-de5f74b6a574@xen.org>
Date: Fri, 10 Feb 2023 16:47:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 41/59] hw/xen: Support
 HVM_PARAM_CALLBACK_TYPE_PCI_INTX callback
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-42-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-42-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The guest is permitted to specify an arbitrary domain/bus/device/function
> and INTX pin from which the callback IRQ shall appear to have come.
> 
> In QEMU we can only easily do this for devices that actually exist, and
> even that requires us "knowing" that it's a PCMachine in order to find
> the PCI root bus — although that's OK really because it's always true.
> 
> We also don't get to get notified of INTX routing changes, because we
> can't do that as a passive observer; if we try to register a notifier
> it will overwrite any existing notifier callback on the device.
> 
> But in practice, guests using PCI_INTX will only ever use pin A on the
> Xen platform device, and won't swizzle the INTX routing after they set
> it up. So this is just fine.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 80 ++++++++++++++++++++++++++++++++-------
>   target/i386/kvm/xen-emu.c | 34 +++++++++++++++++
>   2 files changed, 100 insertions(+), 14 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


