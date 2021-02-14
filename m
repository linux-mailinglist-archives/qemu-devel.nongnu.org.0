Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F431AEF4
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 06:02:48 +0100 (CET)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB9YV-0006KS-Ai
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 00:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lB9VX-0005fg-Qj
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 23:59:43 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lB9VU-00065h-B2
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 23:59:43 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id b10so3859314ybn.3
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 20:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TEWAUO5MFsgh+0YfNb56EcWMHDN8bZwFigmucghgLbY=;
 b=tFYS7Vh7BfzyAcNLU9lFfyN6ZRKOuTptQyLGK3Qbd3o8VNb5H7zYfyYGO34CwlT03b
 tgmp+y2zgj+sW1rDzGESD+8TXDgUmUzofF562SgRr6j5wpSKxMRbhPjs5OzxK5vzXieU
 ETws+2xVineHxGZwhmNLDxpJXptD29JckrKkABzRO++ubhTOSlkXnASJWbzDr0s4G15n
 MdVOzDl2eN4PHlGhyusz1VvGWnlJBcmA1JPFGZ7vlVBs0WMx3xLsEbtTW0lwu9hbk9d2
 atLNXXbCmgaQn6kbQ+oLOhvPbbg/hKIyR4Q1rWII7s5O4mJEiOgUeM9FpInLCNqm4gNk
 klTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TEWAUO5MFsgh+0YfNb56EcWMHDN8bZwFigmucghgLbY=;
 b=myVSX6Yl11UHahr15uw0B36PhprNMEVBMbcBE3D7ZHZIOBkzf2oa3zqExn0+lNV5lb
 Smou+Cup58GDensO5uIAP+o6Ggcc8BYihtuUFQ83MNjXdmGDyQEYrcNhofrcsDl2Ht2I
 hCZr2i1g1RtJfDxj+s5brlESaLY/8NRHxGpaCYudTMS1MkVa5iPNX+9l+f7XtfrT9Hjl
 EAl6N9zzLbozPuvtUqof/h6Vxf2JkjDltMpM4h6iGNUtQb2s0TgpOaHbteih0TEV76jl
 IxR5i6FdgH0jK5+Y+CmBzrflc5sWWNN0UrnrjQMIEoxq9qrDYVjy4KpESWU+9m+P35Sz
 urXg==
X-Gm-Message-State: AOAM533GKF0UnpArKdeml43KhugnVKDRfepzBJC6EcPEQL67lwEJzwqa
 dBCksu2G2riX1bF92gwPxI3EwwAsRHSQihzJ2vE=
X-Google-Smtp-Source: ABdhPJwvswzDLVg+BaYpNp761VqSLIsjjXBM53Du5F+vRliekhLKZTO6GHxwtgo/jkTEBoiE28TOpERXaiEOcsgNMWo=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr15376404ybc.152.1613278779080; 
 Sat, 13 Feb 2021 20:59:39 -0800 (PST)
MIME-Version: 1.0
References: <CACAZ_0-0Ei17mzWhQJmjiqmcGY7s7uNvX=VYh1zezoyYTreHHQ@mail.gmail.com>
In-Reply-To: <CACAZ_0-0Ei17mzWhQJmjiqmcGY7s7uNvX=VYh1zezoyYTreHHQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 14 Feb 2021 12:59:27 +0800
Message-ID: <CAEUhbmVfv6Tr2EEmC23g2Bwr1KL2TGmRaBg=nrFLz7Y24EnTgw@mail.gmail.com>
Subject: Re: hifive-unleashed board
To: Sanskar Khandelwal <kdsanskar07@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, xiaoguangrong.eric@gmail.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Sanskar,

On Sat, Feb 13, 2021 at 7:27 PM Sanskar Khandelwal
<kdsanskar07@gmail.com> wrote:
>
> Hii there,
>
> I want to know, what are the devices(e.g., networking, UART, flash, etc?) qemu support for the platform sifive risc-v hifive unleashed board .Also if you can share any document related to this will be a big help.

Please see this patch which is the documentation of the sifive_u
target which is the emulation of the SiFive HiFive Unleashed board.
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210126060007.12904-10-bmeng.cn@gmail.com/

>
> Actually I am new to embedded systems and this is for my project where I have to add support for a few of these devices in the bsp.

Great. Hope QEMU could help you support these devices.

Regards,
Bin

