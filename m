Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB46553999
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:37:15 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ikU-0003fr-4e
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3idy-0005YY-6O
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:30:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3idw-0003PR-DL
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:30:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z14so13906242pgh.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sr83b/r8tDWAgS5j9Vg1WzTpzfgzR2Khrujy9d565Rw=;
 b=PAIODbwz4aePyPSO17GoX5TShnLQj/p8x5Bh1gMVFwluZa8ykejkqv8NjM5tzUIJdF
 19Wi0lN37zSPlXDyyzUbrkkoyNNV4JOfYJ9gWVZeZip8/FzNbsLaflt4EiWaIHFvZZgn
 XAtFjsFVxmv6OJKQyaDcAYQFxT4wHxCYIczB5l3UFtmeGfTI7kX9eG0LcMrlNiG4vwsS
 KglEG3Jp/Zb2HJgdyq8dUJSzLc5a1mwUfOir4wqlOuNa9mbGuhJ5J5atCCa+yNo+s4sP
 5nfj7K6XjyE1UMRMgMmigo65U6lRCXKuIPq3PaK14/K9B1SPjOPrjLr0TsLIrjr3yXdW
 uXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sr83b/r8tDWAgS5j9Vg1WzTpzfgzR2Khrujy9d565Rw=;
 b=oiTfYLnnOeDtxkVUIT/FgTeY6qpliCBPrD0x0M7LWeS+11izXdb9UXReDhY0TlrOu8
 g7mbZzynaDct5mifo69ZHpuX3GPGtsaEKqWLQYZg5peJkzGe9EI/OKwnbFhV9gXbRc62
 sT16Ip7hAfSffXLsBoItzHq0KbW1UDAMx7RdCpqBILe8SYJEYRoM1l34QUCPia9wvrmJ
 eIe6QknTAQElOpwV8ozElTbJHuBRaLeowI0bZG5VMfJ0VFMNEOMAfVYiF6EuTT6z9ym4
 BROvKf9TcSJv+mOlXm1aRWy171bubmpCuPAI0V/WHaZJHmGDTYoXIW78+FeabnDx8tjy
 WS/A==
X-Gm-Message-State: AJIora8u1QgeqgKPhOsIq3nz5o86DwddPVvUco80dJvpEctSc+Nlfmoq
 1E7J5htzwCre/35fGvVc9aYFZg==
X-Google-Smtp-Source: AGRyM1uLaNrsW3mMBtp1J15jqrHqO09AOwYbVXFdc0wmKmNeKxXN099boS7owgK4KcZF3i6L67SMeQ==
X-Received: by 2002:a63:68c4:0:b0:3fb:984f:6779 with SMTP id
 d187-20020a6368c4000000b003fb984f6779mr27760800pgc.444.1655836226939; 
 Tue, 21 Jun 2022 11:30:26 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a637019000000b003fdc7e490a6sm11645373pgc.20.2022.06.21.11.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:30:26 -0700 (PDT)
Message-ID: <3f08612b-68f7-3971-b570-33cb6b3b5d52@linaro.org>
Date: Tue, 21 Jun 2022 11:30:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/15] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220621094400.122800-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/22 02:43, Daniel Henrique Barboza wrote:
> The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:
> 
>    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220621
> 
> for you to fetch changes up to 609b1c866925049f22a79623021076192f7a6595:
> 
>    target/ppc: cpu_init: Clean up stop state on cpu reset (2022-06-20 08:38:59 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-06-21:
> 
> - tcg and target/ppc: vector divide instructions and a vbpermd fix for
>    BE hosts
> - ppc440_uc.c: fix boot of sam460ex machine
> - target/ppc: fix stop state on cpu reset
> - xive2: Access direct mapped thread contexts from all chips
> - a couple of Coverity fixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel Henrique Barboza (3):
>        ppc/pnv: fix extra indent spaces with DEFINE_PROP*
>        target/ppc: avoid int32 multiply overflow in int_helper.c
>        target/ppc: fix unreachable code in fpu_helper.c
> 
> Frederic Barrat (2):
>        pnv/xive2: Access direct mapped thread contexts from all chips
>        target/ppc: cpu_init: Clean up stop state on cpu reset
> 
> Lucas Mateus Castro (alqotel) (8):
>        target/ppc: Implemented vector divide instructions
>        target/ppc: Implemented vector divide quadword
>        target/ppc: Implemented vector divide extended word
>        host-utils: Implemented unsigned 256-by-128 division
>        host-utils: Implemented signed 256-by-128 division
>        target/ppc: Implemented remaining vector divide extended
>        target/ppc: Implemented vector module word/doubleword
>        target/ppc: Implemented vector module quadword
> 
> Matheus Ferst (1):
>        target/ppc: fix vbpermd in big endian hosts
> 
> Michael S. Tsirkin (1):
>        ppc: fix boot with sam460ex
> 
>   hw/intc/pnv_xive2.c                 |  18 +++-
>   hw/pci-host/pnv_phb3.c              |   8 +-
>   hw/pci-host/pnv_phb4.c              |  10 +-
>   hw/pci-host/pnv_phb4_pec.c          |  10 +-
>   hw/ppc/ppc440_uc.c                  |   8 ++
>   include/qemu/host-utils.h           |   3 +
>   include/qemu/int128.h               |  38 ++++++++
>   target/ppc/cpu_init.c               |   3 +
>   target/ppc/fpu_helper.c             |   2 +-
>   target/ppc/helper.h                 |   8 ++
>   target/ppc/insn32.decode            |  23 +++++
>   target/ppc/int_helper.c             | 116 ++++++++++++++++++++++-
>   target/ppc/translate/vmx-impl.c.inc | 151 ++++++++++++++++++++++++++++++
>   util/host-utils.c                   | 180 ++++++++++++++++++++++++++++++++++++
>   14 files changed, 554 insertions(+), 24 deletions(-)


