Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4F4E6898
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:22:53 +0100 (CET)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXS6m-0000r2-Kf
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:22:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXRnY-0005N0-Ia; Thu, 24 Mar 2022 14:03:00 -0400
Received: from [2607:f8b0:4864:20::c2d] (port=45724
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXRnW-0000dN-Qw; Thu, 24 Mar 2022 14:03:00 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so901974oof.12; 
 Thu, 24 Mar 2022 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eIXl971ltfr4gU3bYFd/Lyjp7tVb4akwRoT48cZAicA=;
 b=MBR10WHLLH21u2TuZbaUKitri/uubCfdS+99iZL288Tmo/333MHSecyC1W451ySvgb
 T92eLbcweMbrvvISB6bv4bVIWsLC9N05z+ZHTMxhT1WtG2pjAuDUrXKALxfsSB1n9IgY
 4Rp4DcBXWKODtTqWf0f4yrYqNoqYFYktRqItzzsM5Jkecyl0jcO0OR3geDh1PF+wVb1M
 mmpzm5gRr/p5tZ+8iE31zoA5fxLAlD8R+PhQVlY6VWR7cuueitZG3P+OQ0h1tdx8/pzo
 JYePTDL9ggCZvzAg7hJatpyoeSW4X/NntpGwZCxe2/VIt90vKhCNkDk9T16tIv/5Kq9d
 NhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eIXl971ltfr4gU3bYFd/Lyjp7tVb4akwRoT48cZAicA=;
 b=0LUeICGELF8V4pfKSK/7mhnWkcWhMB4Ym9BpkQjCEijlOEB8QTYqGDgh56UjYxtUXC
 Mmt79Sa3qNCc7GwB8rX4aMIGiEgJezDrcVVX6oMyWoT1vv6o5M0z5f2LVvFj4+5/Zv1a
 Hbnx+P4KzRX3I6pEBo6BsOQ1vMUS+v35vQFi+vJYi1aYZwosg76mB62F8gMnnnF1A+jz
 fnwNI/0gUT5mONhBgtLN7bREdkQG/5jScUu4hqS9XfTW3gkA+FnvUBIHdj/xdHxHLrxQ
 YCb/sYttkAqoQeI+mJH5GNwdoEIkbQ1iJjM0S+VhUMIVVKQwDPat9Ci/CBUeHFac7Z6F
 LIOw==
X-Gm-Message-State: AOAM533Q/nQAFuHDSUipAvns7u93jMZxHVDBZBfmOJEAdIZjXcoNciB8
 zVl1CVR2ovyeZiHtslwX+NOemlH/AF0=
X-Google-Smtp-Source: ABdhPJydBH/SDNZJpFXGHkij5d6S2Ha3dpaCpPNMTed4Ft9tzibCrtMD6/0DzdBf9Ls83CYMmT/e9g==
X-Received: by 2002:a4a:2556:0:b0:324:bd36:f020 with SMTP id
 v22-20020a4a2556000000b00324bd36f020mr1919700ooe.13.1648144977297; 
 Thu, 24 Mar 2022 11:02:57 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05687010d400b000de9c6d81e3sm449132oar.58.2022.03.24.11.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:02:56 -0700 (PDT)
Message-ID: <1d9769e6-91a9-93ea-8a0c-916015a09364@gmail.com>
Date: Thu, 24 Mar 2022 15:02:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/5] ppc/pnv: Introduce GPIO lines to drive the PSIHB
 device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323072846.1780212-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/22 04:28, Cédric Le Goater wrote:
> Hello,
> 
> The PSIHB OCC and LPC interrupts are driven by a complex framework
> using Object links and class handlers. Simplify the whole with GPIO
> lines.


Series LGTM. All patches:


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




Daniel


> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (5):
>    ppc/pnv: Fix PSI IRQ definition
>    ppc/pnv: Remove PnvLpcController::psi link
>    ppc/pnv: Remove PnvOCC::psi link
>    ppc/pnv: Remove PnvPsiClas::irq_set
>    ppc/pnv: Remove usless checks in set_irq handlers
> 
>   include/hw/ppc/pnv_lpc.h |  8 ++------
>   include/hw/ppc/pnv_occ.h |  7 ++-----
>   include/hw/ppc/pnv_psi.h |  7 +------
>   hw/ppc/pnv.c             | 30 ++++++++++++++++++------------
>   hw/ppc/pnv_lpc.c         | 19 ++++---------------
>   hw/ppc/pnv_occ.c         | 16 ++++------------
>   hw/ppc/pnv_psi.c         | 36 +++++++++++-------------------------
>   7 files changed, 42 insertions(+), 81 deletions(-)
> 

