Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072B355B7A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:35:59 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqYQ-0006Yv-4j
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTqWi-00061s-Bf
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:34:12 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTqWg-00022d-GE
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:34:12 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so15556522otq.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=PgGiMhZvX4Ueq209/OPqDWsykG8QNhRq1CzWXUZmjR0=;
 b=YRTB697FC2OQKLR92IujvsG2j9UV31hrf4RD+KDKxeLAU8m6Jl2sT/xMqDZ7aWR+fc
 bx+36GfuSwLbgdXpWaCsbN3k0oqmTP02NgXhEJsJN8m77B9KMZJNFhZNqKttDBuBWPT3
 o9Me19vquC/MBGohn4QrnyVFcBh/LQzLSzuUxRM0NpuLWi26Ter2SlllJn8sSDgSnDPi
 ksknilrpM7pJ0QnlC1yicQl9fIhIuNEWeGPfdhefQgh594DI4S1wvuPYC/Eezqm9zXQc
 spylZZ9kmn+teHfrcjO4nhttGIAoO0p/F8XHfmN6u1LvY64wLs96pbRNeotp5N+VnOrN
 au4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=PgGiMhZvX4Ueq209/OPqDWsykG8QNhRq1CzWXUZmjR0=;
 b=YXXhpGnPgeqs2fn0eKQHUsqoLyOFsPJcOrDgEejKaBfE3sgaUrwlmglRQb3nI8wbt7
 Q+hLDbtfwC22sy04Ka+RjO0WCGb9929K+EcZPaVRrUNa+zrytV3iuURvv5/wDVf6XX9D
 zfDbev9aOxt4vcX9XZUuVmvWuF0cINzY3ta5GFdwA8sFxbO+dF2j6HxLOLieMhA+J9ME
 T5Wgd1BAZ1Hc7jPl1S1kIXnbks5WQT4Jo/EY1U84q3Fg7EbVZxRdBFf/aio2Q2BQBkd/
 TrcNikCsNSgeucwIaQ1sGHPrbv292ND7dEWj/lA2CWmjGsIsJ/WUWum69XqQ8ZooNJEY
 znjw==
X-Gm-Message-State: AOAM533kKNMgQWq4ucYjE+G2W/LjUAiOdVbhf+cK6/2jU2cYJZCmT85V
 6qKkr9Wf3C2zclJFT8Vo7A==
X-Google-Smtp-Source: ABdhPJw7kw9OdJxDi/TDOpF9dO0tzkN6Zk/I53FnVINcoiriISWt0UoMTkmVajpoiMcKSMeB58WjRg==
X-Received: by 2002:a05:6830:243c:: with SMTP id
 k28mr26343894ots.306.1617734048593; 
 Tue, 06 Apr 2021 11:34:08 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id r20sm4821182otd.26.2021.04.06.11.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 11:34:07 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by serve.minyard.net (Postfix) with ESMTPSA id 44F2C180052;
 Tue,  6 Apr 2021 18:34:06 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:34:05 -0500
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: IPMI Smbus
Message-ID: <20210406183405.GA7166@minyard.net>
References: <CAO=noty9JPU7L8XXKs48TEC9SrJ6j44boA=6ZQP4b_4Z3oy4Kw@mail.gmail.com>
 <20210406165427.GQ7167@minyard.net>
 <CAO=noty0eTbxf0OXLgqVVv4he2mwXJTRtZWBM2-1Os8zAjXMvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=noty0eTbxf0OXLgqVVv4he2mwXJTRtZWBM2-1Os8zAjXMvQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 10:06:09AM -0700, Patrick Venture wrote:
> On Tue, Apr 6, 2021 at 9:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Tue, Apr 06, 2021 at 09:04:35AM -0700, Patrick Venture wrote:
> > > Corey;
> > >
> > > I saw you have a branch that is working on adding smbus IPMI support
> > > (the ssif approach).
> > >
> > > Can you provide details on the status of this work?
> >
> > There is already an SMBus BMC device that can sit on the I2C bus.  It's
> > in mainstream qemu now.
> 
> This device:
> 
> github.com/qemu/qemu/blob/master/hw/ipmi/smbus_ipmi.c
> 
> So this device gets added to the BMC's i2c, and it's just that there's
> no host-side support to then master this device?  in a multi-node
> simulation.

This works two ways, there is an internal, simple BMC simulator, or it
can make a connection to an external BMC.

> 
> I'm asking because my team is currently working on implementing ssif
> support (between two nodes).

Ah, there is already a protocol that I developed for this that others
are using already.  At Google I think, among others.  It's described in:
https://sourceforge.net/p/openipmi/code/ci/master/tree/lanserv/README.vm

The rest of that directory is a BMC simulator that can connect to qemu
and manage a qemu session, starting, stopping, monitoring, etc.  The
idea was to use IPMI to manage qemu, and some people are using it for
that.

There is obviously already a bridge on the host side to handle taking
the SSIF messages and transporting them over the wire to something else.
I know people were working on the BMC side, but I don't know the status.

-corey

> 
> >
> > It does not have smbus alert support, though.  I have patches for that,
> > but qemu doesn't have a flexibly general interrupt infrastructure, so I
> > hacked something in, and it's likely to be contentious.  The trouble is
> > that the interrupt is disconnected from any real device, and qemu
> > doesn't handle that very well.  And like the other things, I really only
> > created it for my testing.
> >
> > For doing what you are trying to do, I don't think you need any special
> > support on either side for SSIF to work.
> >
> > -corey
> >
> > >
> > > Patrick
> 

