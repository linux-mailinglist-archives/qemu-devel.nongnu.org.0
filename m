Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD048ED25
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:31:51 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OYP-00041V-Qm
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1n8OVF-0001vZ-Ne
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:33 -0500
Received: from [2a00:1450:4864:20::12b] (port=36739
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1n8OVE-0007TO-4K
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:33 -0500
Received: by mail-lf1-x12b.google.com with SMTP id b14so12918709lff.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z/JX1tenfC5wsT84raxQ7+N7mm06NTrEeXttwvSVH1s=;
 b=HVMOxx1CWWZs07aI8GuOxGHtlmRIDjk79bMl8bTZQN3S0Eh/7fb7BkiwGObHG1AcpM
 tFF0TyTA67usku5jZ78jYaVuJ8Ys1FzbmE151T7AHDe/l0WwcgYs/D0j3fstEJjtBoGA
 NjZIJJQyzJeWb828Dr2TIvpM3mFNNe0H9mD0vdZSyAtCbg1urDNTirKS7YQDTNjpzRq3
 I5WVaKnUoD/aTvlpm09u1XInsEA6xiMdjtmjU3NHA1fasb9+Ea/MCVtD3kQ1YeC0cWJ8
 OM3sybgX/ZilgTK0PZ160/ks9sR2gCWwdA4TbX96Bz1i4JmkkUll1T9JIHpvvEChGDnN
 KDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z/JX1tenfC5wsT84raxQ7+N7mm06NTrEeXttwvSVH1s=;
 b=i3taYgvsA5WR/CrhjfJxSDAcdFZH5DxTzHiQ+mIMxzo1TgoTcl5e3+PzyBZxGC1tWp
 SVNgxPJryc3U5DrM1o1XuQglTUbAeZqxJw4EHUaBLkIWqO91S8AyzSSXRlGRb6P7ewaW
 v/02r5JRZEOT5dNrEUhDWsVlKHcyqs816dlhK2Z3uVWHM8kULJNZsrilt/Uc6wR6ipnH
 MpiXmcnLmatnO1l7x/dN9VMhIfUlvfDM3VQ/YCHBDil0zFwfWH72UlNfXS3zlXWgOwM3
 vYElhullXZpsSigk8uYInhFpg3Ao/7i4GCm7oBl1WYIyv8D0eS+saFelYTifaJY2jTRk
 jMSw==
X-Gm-Message-State: AOAM533qkFNeVRBKq95T1fIviqjEhEwrWdFLmJ+YEAQmlcC7vHlLQziB
 tYVk274hRwW6pX/CzLep6uM=
X-Google-Smtp-Source: ABdhPJyyS1pvE8ddXnMk5bssLFOBNEhQ0k1zgKsM2L3Cb72HuZCLMf945uaKUh/qx4ytVzmgXUFWrA==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr6680198ljk.343.1642174108287; 
 Fri, 14 Jan 2022 07:28:28 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f22sm611952lfg.288.2022.01.14.07.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:28:27 -0800 (PST)
Date: Fri, 14 Jan 2022 16:28:26 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 12/12] docs/devel: Add documentation for the DMA
 control interface
Message-ID: <20220114152825.GA14171@fralle-msi>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-13-francisco.iglesias@xilinx.com>
 <CAFEAcA8wykmf4ZkpEbj_DrJkmSTU0JSfsar7ysDHcHEg4AzinA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8wykmf4ZkpEbj_DrJkmSTU0JSfsar7ysDHcHEg4AzinA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -1012
X-Spam_score: -101.3
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Jan 07] Fri 16:07:17, Peter Maydell wrote:
> On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Also, since being the author, list myself as maintainer for the file.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> 
> 
> > +DmaCtrlIfClass
> > +--------------
> > +
> > +The ``DmaCtrlIfClass`` contains the interface methods that can be
> > +implemented by a DMA engine.
> > +
> > +.. code-block:: c
> > +
> > +    typedef struct DmaCtrlIfClass {
> > +        InterfaceClass parent;
> > +
> > +        /*
> > +         * read: Start a read transfer on the DMA engine implementing the DMA
> > +         * control interface
> > +         *
> > +         * @dma_ctrl: the DMA engine implementing this interface
> > +         * @addr: the address to read
> > +         * @len: the number of bytes to read at 'addr'
> > +         */
> 
> The prototype seems to be missing here.
> 
> > +    } DmaCtrlIfClass;
> > +
> > +
> > +dma_ctrl_if_read
> > +----------------------------
> > +
> > +The ``dma_ctrl_if_read`` function is used from a model embedding the DMA engine
> > +for starting DMA read transfers.
> > +
> > +.. code-block:: c
> > +
> > +    /*
> > +     * Start a read transfer on a DMA engine implementing the DMA control
> > +     * interface.
> > +     *
> > +     * @dma_ctrl: the DMA engine implementing this interface
> > +     * @addr: the address to read
> > +     * @len: the number of bytes to read at 'addr'
> > +     */
> > +    void dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);

Hi Peter,

> 
> The method says it "starts" the transfer. How does the thing on the
> end of the DMA control interface find out when the transfer completes,
> or if there were any errors ?

Yes, I can see that above is not clear enough at the moment, I'll attemp to
improve and fix this in v6! I'll also correct the other issues you found in the
series!

Thank you very much for reviewing again!

Best regards,
Francisco

> 
> thanks
> -- PMM

