Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C4349AAA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:51:45 +0100 (CET)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPW1A-0005Ff-W0
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPVwu-0002af-Nw
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:47:27 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPVwr-0003QA-HG
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:47:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e7so3738833edu.10
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=j6UiWGBEV5A20yNn5AApmDzeamcVZZYMsmGlfKEK1xk=;
 b=YvZuD+UsbirbwtYCifPc35IBySwKTNtO8eLrybjpgn9fZQR06cmWyrFHsbQqbeKq+u
 HpJbbrb6D8zLpJlzgU04nPDTnfHm0gscJVbBwYuLXdKDd+UhWmMzdIkpovsV1c5bPqsK
 FFY76yHbt3//HvEm3TiU7djJyG3l7KUEbp1YmtTRPKpzc9xBiSptMhM/3MN6H2vTC0O7
 PSv25ts5MPR9CtqjqvTsb5IMiYfU0Eah8Gq/bzcgl3C/MgnZ4Zn0guyG8FXG/iYX5zWd
 TSZF3C3aW+/MPGtQ7iT4c/HkQwiO6RjSxF2F+bOsfnhD+1hHv+MjwnL/oV0q7o1ZpOnM
 U2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=j6UiWGBEV5A20yNn5AApmDzeamcVZZYMsmGlfKEK1xk=;
 b=ff4gmgg67grAn5ACSLgI7IqYieIj5FVB8OjEYeRSBVnEokO0oN8UXCYo2i5151ADmV
 HrpClRYhrd1f/ENH5IqapLjFESrBbUYZxDMOViZzgiiWUcfn/GUXgCAIkF8n1Zg9k98K
 sGD0CLIQNXNAyBJBJ5beYVanQhe7kBglSGBbpTINDQGmIRWiQx/mvcJzzO3Z9MMAHOSL
 wmJldHj6TfMt7+xKsDhDG+cBt9rUd0lsRRSLDR+Vb0QgBpJAI/qkbKlYVCG8kfXx/meP
 jYhpoebhPrA3fXz1MHVnXgOEO84+0oHW3MhuYPzBS7Fkef9MVNA0HIftktw5bqAlyfkP
 AahA==
X-Gm-Message-State: AOAM531ZIflOIstgQ4PW71ApOKQOu0f5ztKPAArwh2YySQF4XMyXnAqi
 FbTHQ65617+OuSrjAy/tyFXlDg==
X-Google-Smtp-Source: ABdhPJxR7jR6RSABg7iq7LHdr/vRbNeBZpjyQdA8AhGbM6zJdOoUDvV9XgYeAVBhBxd8Ib6fCHqntQ==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr10934341eds.166.1616701635764; 
 Thu, 25 Mar 2021 12:47:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r25sm3165003edv.78.2021.03.25.12.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 12:47:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3633B1FF7E;
 Thu, 25 Mar 2021 19:47:14 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v1 0/8] GICv3 LPI and ITS feature implementation
Date: Thu, 25 Mar 2021 19:44:44 +0000
In-reply-to: <20210323041238.133835-1-shashi.mallela@linaro.org>
Message-ID: <87k0pv10e5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shashi Mallela <shashi.mallela@linaro.org> writes:

> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are=20
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.

OK I've finished my first pass. I didn't want to keep repeating myself
with the later patches. So in summary:

  - use REG/FIELD to avoid the manual mask definition/manipulation
  - define registers in the patch that first uses them
  - check LOG_UNIMP vs LOG_GUEST_ERROR (and possibly assert if it
    shouldn't happen)
  - and of course pass the kvm-unit-tests ITS tests ;-)=20

Thanks,

>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC
>
>  hw/arm/sbsa-ref.c                      |   26 +-
>  hw/arm/virt.c                          |   10 +-
>  hw/intc/arm_gicv3.c                    |    6 +
>  hw/intc/arm_gicv3_common.c             |   16 +
>  hw/intc/arm_gicv3_cpuif.c              |   15 +-
>  hw/intc/arm_gicv3_dist.c               |   22 +-
>  hw/intc/arm_gicv3_its.c                | 1417 ++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |   17 +-
>  hw/intc/arm_gicv3_its_kvm.c            |    2 +-
>  hw/intc/arm_gicv3_redist.c             |  155 ++-
>  hw/intc/gicv3_internal.h               |  176 ++-
>  hw/intc/meson.build                    |    1 +
>  include/hw/intc/arm_gicv3_common.h     |   14 +
>  include/hw/intc/arm_gicv3_its_common.h |   12 +-
>  target/arm/kvm_arm.h                   |    4 +-
>  15 files changed, 1869 insertions(+), 24 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c


--=20
Alex Benn=C3=A9e

