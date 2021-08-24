Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1B3F5AFD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:27:05 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISi0-0005xS-Uy
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mISgv-00056b-3V; Tue, 24 Aug 2021 05:25:58 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mISgq-00046y-Fz; Tue, 24 Aug 2021 05:25:56 -0400
Received: by mail-lj1-x235.google.com with SMTP id w4so34926895ljh.13;
 Tue, 24 Aug 2021 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qwjqmJXd8NF3e13kmo7qeA4SaK+C9QIuzEROt/j3J2Y=;
 b=q5xvh0fMMeuKy0qSt2DAZOwuWhC1YoFXUwT6M5xZkDNYBUkjzCARqltGLHiYlT7PkI
 8eHYST71JOe8tF+A9sK7koMXl7RurQsJFVNEtZ7+bhVaI6shP7TcwB2b040jvHPu7Ajo
 1byFT93Cw+UQzfwxY/8Pv+mUO/r8zuLYxSLZ8d4nPRfaRrQMexzIOJmKg/uKsxGtMqk0
 AjOPsrBogQ2RHX+69Gp6nIr+H9kaj0S2ahVF210s9AbpSbeR+N/CukQO+ATOEt0pp67d
 zLG7muSw+qI7tys8yr7tLAvnuznNR2S9mC37jyORTOARLn9JpYlQCgYm6RoiAdqjhTiW
 jegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qwjqmJXd8NF3e13kmo7qeA4SaK+C9QIuzEROt/j3J2Y=;
 b=erBXR7+GPAHMSOvxXYb4edABx40Ei+RgTGnczLoXNPKIc8MRjr7Zi+DmxetQJNFLEL
 xZZ8/kWYnRWKbIeRqP1nvIECN8DRGNxT5XATN3wa/nHsYyX8BjeGi6MLYYX2aK5M6yVG
 XLkLZj0knKGMy85ujZiKjkTq0br5IRUQNYaynvhVqXNQe1ZyZ3T2g2l2Y9qA14ZE4/lb
 7Go6FQ768TKc2X7FbHii8u6TbFp//arKiu1B76SfriGlZ4ZPnEFagABg/BRjqT/JPUPq
 0oxqlh6S6ybCfuACGFSxPvn2rJnXDRAfbOzO7zBQhvM+zdwP2FUkZhU3F/nUbQFWFBCf
 d2YQ==
X-Gm-Message-State: AOAM533RBopMB5/Go++DB3LW3JGIZQdQdQm2cyNhUegzn33b4lykPf+b
 8CUfStHB9G+1Z4SjbglW3A8=
X-Google-Smtp-Source: ABdhPJw4GycoB9IX97N2whZojNzngQFqVTKSKCqGEfYs8l121fYPX5IgFxRo4BZO5ZFIRVSeGSeAjw==
X-Received: by 2002:a2e:93d0:: with SMTP id p16mr16987617ljh.348.1629797150341; 
 Tue, 24 Aug 2021 02:25:50 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 28sm1699742lft.154.2021.08.24.02.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 02:25:50 -0700 (PDT)
Date: Tue, 24 Aug 2021 11:25:49 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <20210824092549.GK3586016@toto>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > This series aim to kill a recent class of bug, the infamous
> > "DMA reentrancy" issues found by Alexander while fuzzing.
> >
> > Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
> >
> > - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> > - MEMTXPERM_UNRESTRICTED (allow list approach)
> > - MEMTXPERM_RAM_DEVICE (example of deny list approach)
> >
> > If a transaction permission is not allowed (for example access
> > to non-RAM device), we return the specific MEMTX_BUS_ERROR.
> >
> > Permissions are checked in after the flatview is resolved, and
> > before the access is done, in a new function: flatview_access_allowed().
> 
> So I'm not going to say 'no' to this, because we have a real
> recursive-device-handling problem and I don't have a better
> idea to hand, but the thing about this is that we end up with
> behaviour which is not what the real hardware does. I'm not
> aware of any DMA device which has this kind of "can only DMA
> to/from RAM, and aborts on access to a device" behaviour...
>

Yes, I agree.

Having said that, There are DMA devices that do indicate to the
interconnect and peripherals if they are targeting "normal" memory
or device (together with cacheability, buffering and ordering
attributes). Accessing registers of a device with "normal" memory
and cache attributes is not a good idea and may lead to all kinds
of weirdness on real HW.

IMO, it would be better to model something like those attributes
rather than permissions. And it's probably a good idea to not
call it MEMTXPERM_RAM_DEVICE since in the AMBA documentation
it's Normal Memory vs Device (calling it RAM_DEVICE is confusing
to me at least).

Adding a "memory" attribute to MemTxAttrs may be enough?
If it's set, the access would only target memories. If targeting a device
it could perhaps be logged and dropped rather than aborted?
If not set (the default), accesses would target anything...

Cheers,
Edgar



