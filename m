Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E604B30EBB4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 06:07:03 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Wr8-000727-Hj
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 00:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Wph-0006Wm-Rs; Thu, 04 Feb 2021 00:05:33 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Wpg-0003KB-CI; Thu, 04 Feb 2021 00:05:33 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id r2so1928342ybk.11;
 Wed, 03 Feb 2021 21:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W8dNi3TeI03E93Dcf4/DMKgEVoXyYVS2f5dXQKw8j5U=;
 b=WHqdoD5bjQmigjT661nipv1F7SHGz5wX61uPSKRpCzz2USJdplr711+XaHE2K4wCjG
 9nX281fS4zbR97+f5SppJ48uDcDwQc81YjtGo3Okw7Njt2zqZsGuSpLGqERy+JmxSbfW
 1N6Xv26zSWK83hTnb74VQMoZiMuiGNSsxyHRp+nre4H+UBXXHG8/DXoD0OixqM1r9fpI
 01vEfuAFTy9ne6qI+ljGuQs2M/bTpfSkVzt0fZKi4fLB5ZyE6zRWZC4REDZxMxb2Q/LV
 v4ILDBkJSYa2YGz4Mtl/gvwTlAu9oxnu/4X5Is8ChyFT8Mn5vR73nFMY4arH2wzcNT2/
 qbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8dNi3TeI03E93Dcf4/DMKgEVoXyYVS2f5dXQKw8j5U=;
 b=YXLrrP6uNfoBrbj+gTD7v8O9lOwPEPsMtBR+i3DYMq/a2O15dYpxkBODxtOK08AT7m
 IgWgKdQuZXaU9qDbgDwQ3bBa4J6Tmq+f+UUWLQssEBf080z0t1rSbEsQ+UddUONQSQoV
 sxSjaCCfefHB+2TxGPqOpV42lqLjmUPS66i4LbPMDu5GoMxzxwhJTbPYymPGjIKzDaBk
 +QPZlfCPaTung+TWFjFrmLcFmEHAQZMasMYGDSCmSiep/jmz+oDKdxx8HhiV1dalPsg4
 xtHHzejZQuu1caZLdhiwR/KczlhBHH+t3+69iuLS+tV3bB165a6NfjE1XmZHh4diTNq5
 gt6A==
X-Gm-Message-State: AOAM531E9BkFekg4pJoP3Irs/tKEdtvxeWsEDcB3MaUDxVIXmlBsaUEs
 lwJ54i6zwvgjJMuniuHQsCNYORA6VkpYJdZ1o7w=
X-Google-Smtp-Source: ABdhPJzDauU/FOHRdisRV6j1pzghOcHYd+gnArNy3kpcUVSq+tQVL39Mjxb9cWrOCDASPDNlK9HyHbtfuR74Ef/QP3Q=
X-Received: by 2002:a25:5f43:: with SMTP id h3mr9905103ybm.122.1612415131120; 
 Wed, 03 Feb 2021 21:05:31 -0800 (PST)
MIME-Version: 1.0
References: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
 <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
 <20210204025953.GE4729@yekko.fritz.box>
In-Reply-To: <20210204025953.GE4729@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Feb 2021 13:05:19 +0800
Message-ID: <CAEUhbmWVCur36ZS4QNjiDfYrotsH-8=-uDn=rpxOiwAnwSGf6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ppc: e500: Fill in correct <clock-frequency>
 for the serial nodes
To: David Gibson <david@gibson.dropbear.id.au>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 4, 2021 at 12:58 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Feb 03, 2021 at 10:24:48PM +0800, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the <clock-frequency> property of the serial node is
> > populated with value zero. U-Boot's ns16550 driver is not happy
> > about this, so let's fill in a meaningful value.
>
> Are you sure this is correct - that is that the serial clock is really
> the same as the overall system clock?  Quite often there's some kind
> of divider in between.
>

Yes, see the U-Boot codes include/configs/qemu-ppce500.h

#define CONFIG_SYS_NS16550_CLK          (get_bus_freq(0))

get_bus_freq(0) eventually returns the platform clock frequency which is 400MHz.

But the value doesn't matter anyway for QEMU. We don't emulate any
baud rate specific thing for a serial port. We only need a sane value
that is non-zero.

Regards,
Bin

