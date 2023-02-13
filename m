Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E91694AFB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:23:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRady-00052p-OB; Mon, 13 Feb 2023 10:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRadq-00052H-Dp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:21:18 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRado-0004Q0-Ny
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:21:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id he5so1138221wmb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UKZydNWZXwp9WHeadEeVpEnr8VgbDw3yavNe0aDACJc=;
 b=EJqmPdyNlXPO6tW9FxHgaZUjHeZohIWNYiixZW8sn7f1OnvDdShSxbGKsj6bLS2IGB
 FszBJ/9xiGsbKXZ+JIiZkDr/3dOd2HaIp7rqVw19sFrAFzO74mhcIpt7oI2+RPmnP8HP
 ZL1ubqf36pnOe9cK/4T/+jiHl5WLbH/ndjmvBP3waLK8SEIbtvQCM85CR/yytyYlWSwP
 VamL0B/VjGMtHwrFdoL5mVCyjAh5Z1C99oRAovPhVlA/6Aq9hzNNAV5omjMaaLGdmK6c
 sk/pjqGGSclbW0qjzfnUGWMyHcGXV3YCPS5xlev+JG3n5575E8tosLTpSxXwa2SHNXRW
 H2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKZydNWZXwp9WHeadEeVpEnr8VgbDw3yavNe0aDACJc=;
 b=aZPJBt/k1nlBOpS4jwCM1z8xuea99Txu2TycI8Eb+ow7QIWIpb0aUQH7nGNpf5n5rL
 AqiVvqxuQPzGmp1DTvwMgXTquddnjhEnAzZEmbnyIOhOxWA/M5FQaSw5p/k1f/u1ki5G
 kcV2ZKiKsExemJg2E9ufJdiGvg3sdT8bNCvb6HaeOpIzoE+lfkbkvPR9rjLQaaLO6bCg
 On7YUFmIMs/KR1U92q5HyM1NQcCBLLY6S89ucYh5m8ch3OEgk/sS5nouL72e+NbV8dBa
 JxSxs7dYTi6cJulZjBfb97T8W3QQLenLBhv4+oEM7Lgq3Iebrnd+AJ79fcK3K2C8n/Bi
 T2ww==
X-Gm-Message-State: AO0yUKVpf5Nvq2ekotVjz3056RGwbPM47HQRB4MmqEz3wCbTgC/BrOUn
 78zCttVAPNyZfPJldyDsZao=
X-Google-Smtp-Source: AK7set/6ZfjdF5PY23s0eChu82NFHNBxF7xxLmTXRIGKDsRteg5tZcnoyun+xOebW1VCfXwxr7jLDg==
X-Received: by 2002:a05:600c:3198:b0:3e0:15c:3573 with SMTP id
 s24-20020a05600c319800b003e0015c3573mr18654770wmp.35.1676301675126; 
 Mon, 13 Feb 2023 07:21:15 -0800 (PST)
Received: from [192.168.12.67] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003e11ad0750csm13582274wmo.47.2023.02.13.07.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:21:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cfc3c4ef-59d9-289f-384c-5a34931e1a0f@xen.org>
Date: Mon, 13 Feb 2023 15:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 43/59] hw/xen: Add xen_gnttab device for grant table
 emulation
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
 <20230201143148.1744093-44-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-44-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build   |   1 +
>   hw/i386/kvm/xen_gnttab.c  | 111 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_gnttab.h  |  18 +++++++
>   hw/i386/pc.c              |   2 +
>   target/i386/kvm/xen-emu.c |   3 ++
>   5 files changed, 135 insertions(+)
>   create mode 100644 hw/i386/kvm/xen_gnttab.c
>   create mode 100644 hw/i386/kvm/xen_gnttab.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


