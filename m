Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109569CF30
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6zn-0002dg-AK; Mon, 20 Feb 2023 09:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU6zH-0002YG-KK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:17:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU6zG-0004Bg-0V
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:17:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id bo30so819340wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IHkIwLxkSeS8wFUKmYz6nKu8AuiH4wfTzkx07sUuX0Q=;
 b=Re/1rBPoB5m0u/Uz9egorgBh3iL5ede+vL1+wpUcaBduOZJzTNNu/ElZLz6/zdLbuj
 M5LGb078mdqVhVO5eNinuy9+dymoz1+vLEE1ghX9AJRWGyHLfbQQ7qa6vujL7w4REnBy
 RfPKixQsGJPI1r7Z6Tqlb1eE0ElsgE/zew1ypdykO2dI+XuTaLIMUx/eLYMGphSIsrUw
 tjH6ycuKpXJzxMAIy3EcCkBnh6vbgWebXr1MsuKBJ9718GxIOx2asbGeicNYXpz8Ht5E
 mRMlX7BZGnN9esQcoa4Q98NTKHebeCFsxDaP4T34uslHL7oCtydh3/y/NuZwAlk4nKm8
 EQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHkIwLxkSeS8wFUKmYz6nKu8AuiH4wfTzkx07sUuX0Q=;
 b=txxNChT3+iVT8bT7h4riHLpBZgd8ELOEJ6wWpDWCf66F+4/NB63ZCHLPpkF7oEKwKD
 pVCGu7HUnPir7YcvnBYcpDZz2IQzb2DJdkpfU8dVjnx8t3UEoEbAh4sHRHQr3uKAAC7V
 RZ8KDKtmL4xL1YEXrq+qsF/Go4PJqeB+5hkYxe1oXiHO3hVrtO5uOCSR3ejpDnjQu8Tn
 Of1kBNuJxundMZLruDOqzzZqMXYMvqs7znvt/b1s9cmyBtkY/AJOiVL/uto4Gt+48PxN
 hlj89S6IxDrjo3K7gV8YS+obcBDThGvhyluVpBq4dn6mQQs+uKjM/ioUy0JS4l2Yqhu8
 anlw==
X-Gm-Message-State: AO0yUKWnNDEfU1uJrew9FnNlXpZz4MZQXEjH9/oIU9iq+Va4XHdI6C1Q
 nnqYUqc3LgMSwPblyrvG1VM=
X-Google-Smtp-Source: AK7set9Nb9Kf7Vj1jZ8lkcvP1esEnGhDjTFDW13PCx0zuC2lgyWrk6Kh60R1eHUfucXiAl2RD9OnXg==
X-Received: by 2002:a5d:6f15:0:b0:2c5:51a5:9ef8 with SMTP id
 ay21-20020a5d6f15000000b002c551a59ef8mr95330wrb.8.1676902668362; 
 Mon, 20 Feb 2023 06:17:48 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d5389000000b002c6eb1fc07asm1942639wrv.31.2023.02.20.06.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:17:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <df131157-6eed-18ab-9540-d786a5abe0f1@xen.org>
Date: Mon, 20 Feb 2023 14:17:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 09/59] i386/xen: handle guest hypercalls
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
References: <20230216062444.2129371-1-dwmw2@infradead.org>
 <20230216062444.2129371-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230216062444.2129371-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/02/2023 06:23, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This means handling the new exit reason for Xen but still
> crashing on purpose. As we implement each of the hypercalls
> we will then return the right return code.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c        |  5 ++++
>   target/i386/kvm/trace-events |  3 +++
>   target/i386/kvm/xen-emu.c    | 44 ++++++++++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.h    |  1 +
>   4 files changed, 53 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


