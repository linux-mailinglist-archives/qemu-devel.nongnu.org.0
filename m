Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF343BF7D4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:55:08 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QkN-0001R6-Dn
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qj7-0008Ov-K8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:53:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qj5-0005Eu-NN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:53:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id t3so7649395edc.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lUsEmhGe0QYjncs4ZB1BJeKTxJehCGPQs773Ye3Hfy0=;
 b=P9DLSK4JuvNPO6884JAzTRivRe5g5+FV+eXVM3YlDxHrSpq3Wq4XsjTqkj9CUto+Fh
 aldySo1o3XVqlpb+2FF0m+GaqjrUXlZtGQ9DLJEe7McIw+41m31yxVSIpTctxEpEOtmN
 hSKgH5znOXHX38JbEMOuioUMiQMcMbg/pVjEs7BV5ABrdrD/3VV8HDGV62sHnFqbZ3sA
 F3Mglum6WibJq9iyl3ebY4WRRXMut2+yzHGGvakwC6NniQM5g7aH6zrbplxyuA7PAie7
 cXO4GSXmTaLtmL+wCUZz7+zZVM4/c/7MqIuS7SWxkzJSnAQy/5NGlULOjbND+VFUIUD8
 /XEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUsEmhGe0QYjncs4ZB1BJeKTxJehCGPQs773Ye3Hfy0=;
 b=el1v4rQQ5s737q60dKhD5nAm0/VJrSBSTFulw1XQNk9M3TQjsUlyebuQ8hZBfwH1oW
 CWzGwI6PcvW+y3eEredu8hzmz4vkd1ovd63DIM58M6HN4ouqJdkcchHuW21cE51rhqzo
 X5WJDcq3RWVp+LI0mXYB0XMXTzhtm3QOPEC5zWeJnZ1VZEu/yO7gG6bhLyfmzWTgfxO9
 hyVP7OGOAzBxtEK0Sl5en7Cc5463tvCHAKiKR8teJNzpEvsAH4jngXQaxGT5yPmcUH7K
 joAAKUgeZ0Pya2qECyan7AdmhSwl3s5GvRQvrXmoYyvZenHBSjoYdgS3RbCaU6RgVo8J
 VWRw==
X-Gm-Message-State: AOAM533Xu09IutpETvqLjOE/fG1Rl1c6nlfXa8gY6EuCFcb/mjawbRas
 BHFXIQDk/3lKbmUNBVIJsJBeZQCFCDX3WFTplnQQLg==
X-Google-Smtp-Source: ABdhPJxw6/GnybtbR0x1o7ddnn59GcazI+YQrB37d/L2REFy6qzSDTFuRFvjYQKP0xNxw4VXMtRxaZa+PKbvfQR/hm4=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr24095854edf.52.1625738026176; 
 Thu, 08 Jul 2021 02:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210707193241.2659335-1-ehabkost@redhat.com>
In-Reply-To: <20210707193241.2659335-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:53:07 +0100
Message-ID: <CAFEAcA_UybrCmOffY6HD7eiE=Ubks1LGhKYmXgQ_hYYsKMYfhQ@mail.gmail.com>
Subject: Re: [PULL 00/15] Machine queue, 2021-07-07
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 20:32, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 4dc87143b9dbc0ae5719b67b4e533c824b239f00:
>
>   vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus (2021-07-06 18:05:26 -0400)
>
> ----------------------------------------------------------------
> Machine queue, 2021-07-07
>
> Deprecation:
> * Deprecate pmem=on with non-DAX capable backend file
>   (Igor Mammedov)
>
> Feature:
> * virtio-mem: vfio support (David Hildenbrand)
>
> Cleanup:
> * vmbus: Don't make QOM property registration conditional
>   (Eduardo Habkost)
>

Hi; this generates warnings in the docs build:

/home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Function
parameter or member 'rdm' not described in
'memory_region_set_ram_discard_manager'
/home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Excess
function parameter 'urn' description in
'memory_region_set_ram_discard_manager'

This seems to be because the function prototype for this
function says it takes parameters 'mr' and 'rdm', but the
doc comment documents 'mr' and 'urn'.

thanks
-- PMM

