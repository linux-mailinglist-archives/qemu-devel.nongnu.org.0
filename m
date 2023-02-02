Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E7687AE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXEL-0007Ue-Tp; Thu, 02 Feb 2023 05:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXE8-0007Hm-Rs
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:54:01 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXE5-0003Qx-L9
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:54:00 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 7so1024441pgh.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dm94UnULUznJtMZuDqV437DSjoSGB0HDOxQjdO7Vx3Y=;
 b=Vd4jXMWn1T/h38GbUGkvd5ygjPAnpK4t2co0iaZ6nf3utv70nxYLqTX+XSaL0PTyTG
 T4Bl2pX7kWZG5z1I+2Ulm/GPuQIz33VxtBojFno9zovWAPMvsknSMgPrJtpLovAM7uWz
 KcrDWb/X388ksMsbSdemZS7Pv6JpU0/7EwGyXFKvuNZonQxDguTW09A8hi3vP1x+K0mm
 9pSyuxBN3HnRPgB5eB/B0cm+Dd4WLPt40O75DJ5woNH7nLoFGYAZJHvLbxL1MIuiQhOj
 1dPe0Lkql0StPXBNSG2WAJLhgpClldTKCCxiMm455XKmZog0PFkkO5WGL8/s4ja5E5VJ
 zPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dm94UnULUznJtMZuDqV437DSjoSGB0HDOxQjdO7Vx3Y=;
 b=PL4gk7aLYzMie/I5bHDTkw9uZQscGzNXPZRNFAMLpWGT1x8ZdPIxEQ8SA/kj/urCGv
 LY27OPxbTatTpqMC9g+0u2gq/YO7Hc/XBf0hDPh3sIeEQZ2Wt4Fyg2CD4E/677Zq6HHP
 F4Fccjk/EZYxCvK7ZNrt4LWKMhXZwZLcHkjJgkzJJOl0QnPIjnCPc35H7Wnke5kQ+j1R
 ucv9MhOq/lAh0LT2BSouXPQYADM5o9hl3aafvkEu+TicwliRB4lhGvSCYeisVt5pZZ/p
 WoxxlCTQdbSW0W338kjT2bOcj61uYHcXnqHFZ3OyLC5bzgpRf/cv3Kvs64Zk0f2Q2mH7
 f7Xg==
X-Gm-Message-State: AO0yUKUe7hw4PYxLsAkFXLG15fJDaAODPT2OmGUWe/Dw2VfTbFagMB2V
 JsVzcClGVld5VvUX/rSHvwqn/3BwOM3ryKXFuq/Oh0D5/7QoZQ==
X-Google-Smtp-Source: AK7set8dr03WzwuMuPwXpzy4xRPYTN5vEa63PKbnGPpwfw+w+nBZ2i+OJ6ELFhyD9Eph4/I1lFmHALB9M+pUX6Sf9xM=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr1372867pfu.23.1675335234609; Thu, 02
 Feb 2023 02:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20221031054105.3552-1-richard.henderson@linaro.org>
 <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
 <211b40bc-2bbb-63be-191a-42e03e049b98@linaro.org>
In-Reply-To: <211b40bc-2bbb-63be-191a-42e03e049b98@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 10:53:43 +0000
Message-ID: <CAFEAcA8cbfqy-eBY=gjj6ttxJ-RbzBn_XhyjjVfj303=R+uV5Q@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Eric Auger <eauger@redhat.com>, iii@linux.ibm.com, qemu-devel@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 1 Feb 2023 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/1/23 04:20, Eric Auger wrote:
> > What I fail to understand is why this code is called with a kvm
> > accelerated qemu (the test runs by default with kvm).
> ...
> > #2  0x000002aaab1500f0 in vmsa_ttbr_write
> > (env=0x2aaac393850, ri=0x2aaac3c90e0, value=2154950976315703518) at
> > ../target/arm/helper.c:3784
> > #3  0x000002aaab14e5a8 in write_raw_cp_reg
> > (env=env@entry=0x2aaac393850, ri=ri@entry=0x2aaac3c90e0,
> > v=v@entry=2154950976315703518)
>
> This is indeed very curious -- vmsa_ttbr_write is supposed to be the "cooked" .writefn,
> not the .raw_writefn.  We're not supposed to arrive here at all.

If you only provide a cooked .writefn and no .raw_writefn,
the default is to assume that the cooked function will also
work as the raw one. None of the ARMCPRegInfo structs that
use vmsa_ttbr_write specify a raw_writefn...

thanks
-- PMM

