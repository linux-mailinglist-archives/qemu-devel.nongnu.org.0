Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6C691FC8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:33:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTWs-0003Pe-UB; Fri, 10 Feb 2023 08:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTWq-0003NZ-Mm
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:33:28 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTWp-0006iW-52
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:33:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j25so5090566wrc.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9NBBRHxtStivSysogZGFTrvRHkfzDuerEVsMGPS6iAs=;
 b=HVN66hHqd4XIbrw6tKuALkgmc9GeR3Pb0Uqwb78ZvRoIEn8yGbLTqr8ehSwKdDg9BR
 EE4jGUa/6mQwZGzTQ7EVLtNATT+8TcxGr05Ft6TTHlkWmjchjkXUvgfThYoVxwDih8os
 uDcAFJft1Sf3U0xizq//AqpU8FighfDsLGZ2VdCgvU5F6OgfrofwOhHvKV2RP2uOtxq8
 K3KOFiESKQwVYguiq66NyTpoJqKg52QcSIfHs9IYfiHHshISQXzqRraAIIwhUVXrlFfo
 V7mwYVu74Yb/VHxLY5EVRcwe9vbbbfRHSZZWqqfXYNM6dt0xOEt5TggsxhGVtcMCs3/R
 OzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NBBRHxtStivSysogZGFTrvRHkfzDuerEVsMGPS6iAs=;
 b=EnWtXzRXEm5IyQfEBvWjjMjglEeyfaVjxZyMLVftUTZbukJO4Z9u975lUQ4lqdBeQh
 5PGpFf1VbS2ojVkGBWf0E+SbYcE6zkjZr9yDcIOGN3ZJB/O/z0JQiWpKeHnojQ4rI0ck
 XvLDgxDQg8cQgNwKjhhgGNBrln1x1ybGD8IM4dhKiZJGjCIMnTvjEt0DXNvUTNqEoJZp
 PAVJU0Y+NhdK2DzQWm1eAYdTU6eT3KOWCtPvD63JVzbOu9JommWJwHo7v4S7d23F388S
 5SWZY2vcrij+PEf73SObLST2nkc2OdCmmxqgvb2NCnd4ZfNNfbzTvNTy3wix0vi0KTrf
 OA2Q==
X-Gm-Message-State: AO0yUKV6wbCH2Hq56fp+qcESoiq6VPF5ZJweUIVrt59u0K7DHTD9MHIL
 TcJUSBwsSmAP5WGqSae7dtE=
X-Google-Smtp-Source: AK7set/JxfkLBoVaUrlnvudP8O7HnA62XZ1VF5kRy0hCyPuj8gZrk1pELzaABTGyOyxa8nB7koR9rA==
X-Received: by 2002:adf:e650:0:b0:2c4:616c:fd07 with SMTP id
 b16-20020adfe650000000b002c4616cfd07mr4159803wrn.34.1676036004074; 
 Fri, 10 Feb 2023 05:33:24 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a5d68d2000000b0029100e8dedasm3680509wrw.28.2023.02.10.05.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:33:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d2aabb04-bfec-bb35-3f80-9115ffa67d37@xen.org>
Date: Fri, 10 Feb 2023 13:33:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 31/59] hw/xen: Implement EVTCHNOP_unmask
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
 <20230201143148.1744093-32-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-32-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> This finally comes with a mechanism for actually injecting events into
> the guest vCPU, with all the atomic-test-and-set that's involved in
> setting the bit in the shinfo, then the index in the vcpu_info, and
> injecting either the lapic vector as MSI, or letting KVM inject the
> bare vector.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 175 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   target/i386/kvm/xen-emu.c |  12 +++
>   3 files changed, 189 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


