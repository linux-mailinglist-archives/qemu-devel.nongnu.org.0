Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4421B604D67
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:28:52 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBw3-0005tx-C6
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBkm-0000pf-3G
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:17:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBkN-0003e8-G3
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:16:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id w18so29954366wro.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=WIgq7KUkYAZufLZT/vJOKCqP4ihn+JSpnSvPKstMd2Y=;
 b=AOOTzFFJZ+yUIMjgdeHf1D7JPZg8t95Tpk6QQ128iQoHJYFSXGZ4qacujs2ESTOisC
 A5QXDcD+360J+dV93ampTlklhgXeKHieLNMAz1Dg0irNgJENEsyPoVaSKP9J3xICpF94
 1uWhLHMUt9oHnaJpDkFVEZefu7sGXaKLNDAyUZFO1rAx9u+jP34xnsalh59QQ9nxyltk
 R69AbDDKwfaqwbKuEzlgY2QLdERmGfwQg4DtZZr1oeAR06ierQY1VXpit3aIvY1Mbj+R
 B6b8Es/lh5tRjquy6f1+5vLnfQGlYD2dU2UNCcb1343tS+O8RXj6ZvVpumfnrbL7eeXE
 tM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WIgq7KUkYAZufLZT/vJOKCqP4ihn+JSpnSvPKstMd2Y=;
 b=bCz4YDwRhTnPyW2xCXSmVzHSuX0i/OBqb1w9srke7rS+9dHn8qZh7Mk9Up3IbfFd7E
 Y4ZapJZpZC1aSCart4C+Pn1doXwFwpnC+Fmqe/SbMgyqWg8S6G7aS8rQArpcFZ0zrPfY
 knpjeQeNAK01G5i+o9xrfyLRHaqO3XL2Nbbm1a+VPXUDLTIrQk6bgGo+e7KveF9dTCSP
 4LtlXy7vIVrf9foDmoJK0F4DEpUMV8lrkl43ibNL95UuobycAKtFNICNZ2wlacA8XYFW
 FHeMLouLhjTgcBewn8HQYH0bUBcV7ZrJxTgbQAixh+Kd+MGstVYsmlWQAEm7e36Xu2e3
 A/dw==
X-Gm-Message-State: ACrzQf0RHV44c9B81y1JCu2txafENJreWH4M26OyzLjZ8Os6z9/yq7g5
 doLG7gv/rJG6J40Ez6p008k=
X-Google-Smtp-Source: AMsMyM70BAGn+ITDttNygqHII8IscaYNZml+iS8aG88q+Uj1/vKaPUkqZHfITZl9ve2GqS+zJReXkg==
X-Received: by 2002:a05:6000:78a:b0:22e:4c41:9e36 with SMTP id
 bu10-20020a056000078a00b0022e4c419e36mr5641977wrb.160.1666196204511; 
 Wed, 19 Oct 2022 09:16:44 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003b4a68645e9sm323180wmo.34.2022.10.19.09.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:16:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7b8e645c-90c7-a4ff-4405-51df6df2e508@xen.org>
Date: Wed, 19 Oct 2022 17:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-7-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2022 06:07, Vikram Garhwal wrote:
[snip]
> +    qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
> +
> +    state->memory_listener = xen_memory_listener;
> +    memory_listener_register(&state->memory_listener, &address_space_memory);
> +
> +    state->io_listener = xen_io_listener;
> +    memory_listener_register(&state->io_listener, &address_space_io);
> +
> +    state->device_listener = xen_device_listener;
> +    QLIST_INIT(&state->dev_list);
> +    device_listener_register(&state->device_listener);
> +

As Julien said, these do not belong here. These are the (current and 
legacy) PV backend setup functions; they most certainly have nothing to 
do with device emulation.

   Paul


