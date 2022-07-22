Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7F57DD7B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 11:29:23 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEoyH-0005tP-M2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 05:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEovj-0003nd-3r
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEovf-0004fb-Hu
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658481998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6QZ1czF51C+g6GnvsBTVWA9cOGVWu2XPkXNWt4MC6Q=;
 b=PaiFT5Hbq3QavkLKVZQ2ebykVu37BS9d3GkgEX/tRpZu/N8KuZ8QPb57ry9pJ25wMm5Hqc
 bnV3mYOXItV8D/VFzzgzS0e0dW9Xbkuyw76+BhmKNTmRYPcStpWGOx51gyDmUpn3RjxD72
 hNCAfQo7fj5UMVD/OjSLFpc30+elVs0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-5CNHFwN3NPOnZfzyw-XQxQ-1; Fri, 22 Jul 2022 05:26:37 -0400
X-MC-Unique: 5CNHFwN3NPOnZfzyw-XQxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r9-20020a1c4409000000b003a2fdeea756so860261wma.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 02:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=V6QZ1czF51C+g6GnvsBTVWA9cOGVWu2XPkXNWt4MC6Q=;
 b=3bXVvnVfupwoS/KSOT2YK2DC+SCoMha03+idruOnaN5mZ8Bixxfy96vFGxdnsGZTae
 jKhHnKZmkleXLj12T+s9vtXx3feSkgj0F5VyNy+OX8mIQBYRw77iy0bKa1GudhXqJiSb
 xNPNdHC+pKYRpHLbCQE7Dl/+K3dKOiHRg45QYvUt1gSllDeCXyhfj+suTWoDDLfkQGLw
 BOgggEPEOvZCIrMiaki8QrLKI/LVtHyQhu7mIjaHUDii9URoOChzGn3uDEyE+/xB3oYE
 kj/6RMH0vLE97Hp41Lgspw4NiWzrQzcmXSXA6iJlwICCHuV8wGk7S7xSMDQ30sU2KHND
 mNbw==
X-Gm-Message-State: AJIora9u5a6vDUw19oiotOySQXfDhkKwVr1AYlaF0RG9YrzF6SYZouok
 z5ZA4dCbqN6sUejM4c1Nj5G5n2OhFiPKEq+yWeMhMxdueIH0cWxnPMBO7VR/UER4vpxQhNy+aSD
 sbcFOC9wykRFMiP4=
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr10197844wmq.58.1658481995944; 
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjzcHxmQoryy91KIZWlarfpU2siHsgBe06+LVBcBoOx3mkA8vsI9VoK0rfb6yY7EAHjuq45w==
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr10197817wmq.58.1658481995568; 
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a2fde6ef62sm4375839wmq.7.2022.07.22.02.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
Message-ID: <a33c9ea1-e622-ae8d-5f12-1b20599e8b4b@redhat.com>
Date: Fri, 22 Jul 2022 11:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Hard limit on 256 IRQs in qtest
Content-Language: en-US
To: Roque Arcudia Hernandez <roqueh@google.com>, qemu-devel@nongnu.org
References: <CAKbPEtZxCGfz4_h8_YMg2bb-kQF0sorLAppKcBTweV0gxM+OLA@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAKbPEtZxCGfz4_h8_YMg2bb-kQF0sorLAppKcBTweV0gxM+OLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2022 18.17, Roque Arcudia Hernandez wrote:
> Hello,
> 
> 
> To write a qtest for an SoC using ARM GICv3 as interrupt controller the 
> qtest infrastructure is short on IRQs.
> 
> File tests/qtest/libqtest.c defines:
> 
> #define MAX_IRQ 256
> 
> Which is the number of elements in the array that is used to keep track of 
> the value of the irq gpio:
> 
>      bool irq_level[MAX_IRQ];
> 
> The GICv3 can take up to 1020. The SoC we are trying to emulate uses more 
> than the current 256 limit we can observe at the GIC input. If we focus just 
> on the external interrupt range the GIC would need 1020 - 32 = 988 IRQs. 
> Will it be OK to make this change to the qtest infrastructure?

I guess it should be fine. Just not that you have to adjust the same #define 
in softmmu/qtest.c, too.

  Thomas


