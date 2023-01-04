Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA165D720
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 16:17:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5Vu-0002jR-Dn; Wed, 04 Jan 2023 10:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Vq-0002hU-Cp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:17:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Vo-00073N-ST
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:17:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so33263321wrz.12
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CeQL5xWC173b6TUlkncPiMJP/Eoy8yXUJGOkp8pSziE=;
 b=J5vToNBwZNPE6isC6rzDCQasdXVM5QQ6ViaudBztq9BY1UjSa7dqNQ4YtwVCTbIlM4
 VcFAiu42pOHnylu6h+Is6Sj4pPaGI2bDWbOdTgS29Hl0K7x09j1lk4l3FoJskBIVbjQy
 XR8I/KX+RNmSq9VDy6LX2bf5BJq4bIg8zUvtZMdjiJSL6yZa/YyfRW5ito3x+6nZpwTE
 swVNnHjOf+0BvmS6nLhRt9rPID6FeaoBnmfqsafX90aGSYTBKdJZO0bWoLLm+/f9yzID
 XB1vwczUCLW8KqQvCyAyboPhmSTxI7uiqJ7R6+kg309LuHLEexw+/tWuQR05HG87CQwu
 ebCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CeQL5xWC173b6TUlkncPiMJP/Eoy8yXUJGOkp8pSziE=;
 b=s57SDh1Biu3bWdqZcLg24Hr4cWSdrb6FVfyKs5E4J2ps8+nMyLAa98wC8x8UlHBsY5
 h1fvqQlF8hhsd2FIJUbWsqWXxaorTvWkVy7vw9gaV48PEtoFL7dNUchwAGd+fULwQAl0
 bpFY/FBSX9CqAyhDGMp9uJ1RP0cJmafT0dKg9caoJEawKbY302rb2V5rMt+Pe/7hgi6n
 L1CkDXoqfCL15+hjnck1vjKuOSviCpLMbw8zT8yqUyDVxF/BGDpKNCYnYO/c05mQ44sY
 HbZVkJ2lceHgVlrdPUopd6JwF/pQocQd//CXHVUuaGNT77Ey/9//Gw3Zb39JN/SqLjZM
 vskQ==
X-Gm-Message-State: AFqh2kqOqqF5hwhdg2u2hAPMW14awI+BZU9wyjl3xsYtEZoR6halIzlE
 IXCBVvUjEeiMbS6RcLAymi4N7Q==
X-Google-Smtp-Source: AMrXdXvH2pOn3LWxDaYFR7QAs+zf153SI/Oyb1HLgOqiNzpUp5DYIJp/xLQE53lCu6Un1TZ3PMWlhw==
X-Received: by 2002:a5d:52c1:0:b0:242:5d8e:6c35 with SMTP id
 r1-20020a5d52c1000000b002425d8e6c35mr29010302wrv.28.1672845422878; 
 Wed, 04 Jan 2023 07:17:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfee90000000b002a1dd8ff75fsm3038540wro.62.2023.01.04.07.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:17:01 -0800 (PST)
Message-ID: <5a1b4b87-e6eb-de5d-ae1f-b648b6a7fc58@linaro.org>
Date: Wed, 4 Jan 2023 16:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 15:44, Bernhard Beschow wrote:
> xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
> while xen_piix3_set_irq() maps multiple PCI devices to their respective
> IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
> this.
> 
> Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
> IOAPIC rather than PIIX has this many interrupt routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/xen/xen-hvm.c | 2 +-
>   hw/isa/piix.c         | 4 ++--
>   include/hw/xen/xen.h  | 2 +-
>   stubs/xen-hw-stub.c   | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


