Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA441604D64
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:28:39 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBvl-0005MG-Jz
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBdR-0005ie-AQ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:09:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBdF-0002NC-Mi
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:09:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id u10so29939328wrq.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/gaivNtOvRrmGFG6RPtNgIZb7CGAKiq1jjE5q+NEHYU=;
 b=cwrXMjtw99DxuvfQpNVOsjORQFtxpP4N7aw5W673k40lx5roGxVPn5LnRPAqpw3HpA
 2K6LE+lZH2DbtOtMGwWXYLrMkOqprxQXXS9f6IWj7sbOY2AVuKDNjJL+QGzXSji1rnrC
 k0k8mLrMRqKzFQ3Y6hhqpqlk62WabsCRp4WAW4ZMTItbMtvKYX23oAH/ETrp5nXYB/WH
 iUVY/87IgTYjiVzascblXfdp65nlqXn+LGUlB0hNiQp9bhapWbBZW+kBl4SvEeC8W+86
 qTcMz19B8zxy4v5XKjywPyZe2LLJrSMpkg8CaPpZDbG8uwEDzRN7gJTzlywi4zK6TPI1
 Es+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/gaivNtOvRrmGFG6RPtNgIZb7CGAKiq1jjE5q+NEHYU=;
 b=NTgepij57/AecaEdvg1xZ1aHDYmZ0GXNx+QoacEpgNjOT217aObwOjKjzGwxITslWK
 Yw3nZnjv75sa7agVOmFv+0zNt5qcMvUk6NfHpYlAAFxVL1MxXTpfotlOPaUIdxRgIsVe
 UEUGktANmOWhntntqkYR274uf6x9fbjTtl41e8+vKUCgStCy33YeluWGeVpdZsOYjHdn
 F7KHOWzdnPAf1tMqbtp5b3DRYAAimL2J0hh3w+SqBGpxcl94CxJpaUTWyS6MvEpdox+V
 h8k9kGmNxWjqFDGlGSly9bQ1kvzQasL2Ob0z72BOe6gQh/Hgxn/JEOf80NCqB1HJqXJO
 lyoA==
X-Gm-Message-State: ACrzQf0Fi/YCR4abbsNWs2ta4T9gcPjHQ4zLEcQnw30TzWZ3WnXluYcT
 vR77ypEYoCHsBgexmQfqcdI=
X-Google-Smtp-Source: AMsMyM7AqcpGVOsCXg9XMM+zrskrCjvD7TOGamHI2Z1R4J3KaR7LgpJ+lBr1vVn8AO35vwlVfZ754Q==
X-Received: by 2002:a5d:58d3:0:b0:22c:e8e4:1461 with SMTP id
 o19-20020a5d58d3000000b0022ce8e41461mr5783598wrf.227.1666195762924; 
 Wed, 19 Oct 2022 09:09:22 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a05600c34cc00b003b435c41103sm536772wmq.0.2022.10.19.09.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:09:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0cd7b6e5-b20f-6bab-ea7b-65723c16a065@xen.org>
Date: Wed, 19 Oct 2022 17:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 05/12] hw/i386/xen/xen-hvm: create arch_handle_ioreq
 and arch_xen_set_memory
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
 <20221015050750.4185-6-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
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
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
> 
> Also move handle_vmport_ioreq to arch_handle_ioreq.
> 
> NOTE: This patch breaks the build. Next patch fixes the build issue.
> Reason behind creating this patch is because there is lot of new code addition
> and pure code movement done for enabling Xen on ARM. Keeping the this patch
> separate is done to make it easier to review.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


