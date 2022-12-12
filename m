Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C0649AED
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ewj-000788-5E; Mon, 12 Dec 2022 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ewQ-00073X-AK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:17:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ewO-0006RG-AB
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:17:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q7so11368632wrr.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJVjChcLJxTKlfhC88nS1TPruEEgjC6NzumW+f9vnYw=;
 b=F0jnGTFHia6TCDYItpMnsfsmmJF7k5R2v6TF7hfOA+KlSpXWa7dODBCO5Er6i9u1s5
 nZA9l+Vk8ei2yX57g+vt2X3p+CIb8oORZvYk5xl/RYGLHp0UnLqnBLxERt6TSKIr2u2/
 HgxsVAGJBE9uReFz2jPlvWfKlNwvnJeN1/WRAcrSzaMpu+OOkWn88cwh4+zblqYe9Epj
 AV5KADjSy7c3XtBa/kWW2ZSKgzZZ0F0KGlGYBG8I6oy4wRCZ3Dd8WDlOUo5Q4cq7X3gJ
 e3pZTLp2HaLQdvvmWGxQdc7pmEJjEglIUgfQ/KuMDxFOF+Z0Sx13FdEMMCVpVcFPcUmx
 YEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJVjChcLJxTKlfhC88nS1TPruEEgjC6NzumW+f9vnYw=;
 b=WgJ+82I9liTIQzVKzX4RtfRrPs6FGIP4bP+tuqF+ACKH5NX50DvF+7EfVIhYO7VOwd
 GvGq66B7cseB7p4cuMAezrMHyXDZHyxfi8oxDXVaRopgCqyntu8To2l3WGMNKwxaNMh/
 HI3Bl1NbpUZ11UbWhzM4RJ/17bz4wG+GPXe5C8qxodKVMWh9Q6e+SY3CJCe2o/WcFCEd
 QB5sgE+YO4MWGF995mKyIBovK5gYVt6U7zhbDmz7yc33HhM7tPD2mQ6r+b4/CnPEH3AM
 PhKKOInHPU3mRKW0AjO5Qy7Jcr1pP0lJbFtGjFOZ34C+xXNqXoyexXHUVbSNHf3Oc0fX
 Xicw==
X-Gm-Message-State: ANoB5pmiksquaLu98aL6fG7Zhys8HNna+J21qHPjwy2WN7vNDvevsmRo
 pTkC3Ko1htr02q6HenKkt9Q=
X-Google-Smtp-Source: AA0mqf6tD7C0Sz/t7YdovK+NloLtrlgw0dGDLB4jIuiKtFWQoiu0Q6mWlkgfhCh2Ao8P11c2ZN/ErA==
X-Received: by 2002:adf:e199:0:b0:242:809e:1428 with SMTP id
 az25-20020adfe199000000b00242809e1428mr10633440wrb.5.1670836658094; 
 Mon, 12 Dec 2022 01:17:38 -0800 (PST)
Received: from [192.168.2.171] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002366553eca7sm8313894wrw.83.2022.12.12.01.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:17:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d213bd5b-4efd-8de3-c78f-90b74a81e3dc@xen.org>
Date: Mon, 12 Dec 2022 09:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 01/22] include: import xen public headers
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
 <20221209095612.689243-2-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221209095612.689243-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42e.google.com
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Update to Xen public headers from 4.16.2 release]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/standard-headers/xen/arch-x86/cpuid.h |  118 ++
>   .../xen/arch-x86/xen-x86_32.h                 |  194 +++
>   .../xen/arch-x86/xen-x86_64.h                 |  241 ++++
>   include/standard-headers/xen/arch-x86/xen.h   |  398 +++++++
>   include/standard-headers/xen/event_channel.h  |  388 ++++++
>   include/standard-headers/xen/features.h       |  143 +++
>   include/standard-headers/xen/grant_table.h    |  686 +++++++++++
>   include/standard-headers/xen/hvm/hvm_op.h     |  395 +++++++
>   include/standard-headers/xen/hvm/params.h     |  318 +++++
>   include/standard-headers/xen/memory.h         |  754 ++++++++++++
>   include/standard-headers/xen/physdev.h        |  383 ++++++
>   include/standard-headers/xen/sched.h          |  202 ++++
>   include/standard-headers/xen/trace.h          |  341 ++++++
>   include/standard-headers/xen/vcpu.h           |  248 ++++
>   include/standard-headers/xen/version.h        |  113 ++
>   include/standard-headers/xen/xen-compat.h     |   46 +
>   include/standard-headers/xen/xen.h            | 1049 +++++++++++++++++
>   17 files changed, 6017 insertions(+)
>   create mode 100644 include/standard-headers/xen/arch-x86/cpuid.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_32.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_64.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen.h
>   create mode 100644 include/standard-headers/xen/event_channel.h
>   create mode 100644 include/standard-headers/xen/features.h
>   create mode 100644 include/standard-headers/xen/grant_table.h
>   create mode 100644 include/standard-headers/xen/hvm/hvm_op.h
>   create mode 100644 include/standard-headers/xen/hvm/params.h
>   create mode 100644 include/standard-headers/xen/memory.h
>   create mode 100644 include/standard-headers/xen/physdev.h
>   create mode 100644 include/standard-headers/xen/sched.h
>   create mode 100644 include/standard-headers/xen/trace.h
>   create mode 100644 include/standard-headers/xen/vcpu.h
>   create mode 100644 include/standard-headers/xen/version.h
>   create mode 100644 include/standard-headers/xen/xen-compat.h
>   create mode 100644 include/standard-headers/xen/xen.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>

