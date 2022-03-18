Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319234DE1A8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:15:07 +0100 (CET)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVI42-0002rb-8r
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:15:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVI2l-00028p-0W
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVI2h-0000ue-S2
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647630822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zShIUOgjk+5BWd5gubkqFfkZvXXGhO7xeEJvE8k7O1Q=;
 b=SQMxKgRTviWuCXKGpjz3JYaG0Aw45C+od6RJ3HZjLYcWhhebFy2dQOZtMvxSsJhm+I5+S4
 7nv0Q6MiKkVriN2SLTnPL59wcyQOypWEP4oRBA/2485nwa4Fu6N2Li8Kp01RQtFCTxy6/i
 YLJ8vJgt5XGBAYzbPUNxhvwiN+WKL9o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-y4GPBO_ePEeHZ3MGmrC3qQ-1; Fri, 18 Mar 2022 15:13:41 -0400
X-MC-Unique: y4GPBO_ePEeHZ3MGmrC3qQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso4661347wml.1
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 12:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zShIUOgjk+5BWd5gubkqFfkZvXXGhO7xeEJvE8k7O1Q=;
 b=LMlEqSglMthJH+qGxpya+3jUxAcief2VMzqx1yRlP5RZ9+w1riIrbccFwcIknxoN3z
 212zBkFwUcR2vBdGsMU5s4dghVZWvJf/NQL6wWOQhWf7p1+hrj923RBlr4TG+EmzBmew
 8hPFtcS29sxZelbAFOtQjYWzCKZYC/F0qhU7UaYCtY3CCrW/+tvNu2W09zNVpkvd5VwU
 YTli6yIbARyozBTFXAZd5/wAxPVYyXhYpXGX+mDTZX5YDWPnCOuPbnQBgZcbCl/OTSeo
 u3Q3JuzAk0zkiy8ngetpwxQKHkQqrezOznWZdBV0nY0frRxM+knxMJfqWTv2ut+iNn75
 4p4A==
X-Gm-Message-State: AOAM531n8cg7LlHCXRmEBnvRwwCQYWshHWvcNsXqmbI5hJJswuvqiDgQ
 QzK2Y0/QBu82TswEAEx6CR3D4Kt8QdxZCunFTirBzXpdmroKYZqo8WxTGGhvMjZEBmqmlSwzdoa
 pBJwoXmXEeXoN2BUXyWnWIiALKila8w2PMwlr64qSj2P4qxElY5UeROqReNInlDk=
X-Received: by 2002:a5d:6d81:0:b0:203:e187:1faa with SMTP id
 l1-20020a5d6d81000000b00203e1871faamr9378528wrs.381.1647630820212; 
 Fri, 18 Mar 2022 12:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSrssuETXC/WIbmvO8pk6usg8ac79vMMqKMx1PJqNQWjGa/oNNib5pM7kukpUIlXCtwrc8ig==
X-Received: by 2002:a5d:6d81:0:b0:203:e187:1faa with SMTP id
 l1-20020a5d6d81000000b00203e1871faamr9378484wrs.381.1647630819617; 
 Fri, 18 Mar 2022 12:13:39 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm7191834wri.4.2022.03.18.12.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 12:13:39 -0700 (PDT)
Message-ID: <95d41037-ce99-1715-9fe4-000757d61c75@redhat.com>
Date: Fri, 18 Mar 2022 20:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 2/3] hw/audio/intel-hda: Restrict DMA engine to
 memories (not MMIO devices) [CVE-2021-3611]
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211218160912.1591633-1-philmd@redhat.com>
 <20211218160912.1591633-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211218160912.1591633-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jon Maloy <jmaloy@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2021 17.09, Philippe Mathieu-Daudé wrote:
> Issue #542 reports a reentrancy problem when the DMA engine accesses
> the HDA controller I/O registers. Fix by restricting the DMA engine
> to memories regions (forbidding MMIO devices such the HDA controller).
> 
> Reported-by: OSS-Fuzz (Issue 28435)
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/542
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Likely intel_hda_xfer() and intel_hda_corb_run() should be restricted
> too.
> ---
>   hw/audio/intel-hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index 0c1017edbbf..3aa57d274e6 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
>   
>   static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
>   {
> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    const MemTxAttrs attrs = { .memory = true };
>       HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
>       IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
>       hwaddr addr;

That's maybe the best we can do right now to fix CVE-2021-3611 !

Reviewed-by: Thomas Huth <thuth@redhat.com>


