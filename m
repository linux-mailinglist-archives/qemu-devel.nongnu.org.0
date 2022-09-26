Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638CE5E97D7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 04:07:53 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocdXD-0003g4-UE
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 22:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1ocdUq-0002Cz-2a
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 22:05:24 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1ocdUo-0002jW-GF
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 22:05:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id iw17so4966114plb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 19:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=0pIJb30YTBijZODyDpWztW1XMx1m/O2fwgYsTQ3r7Kc=;
 b=TXzbn7OCuUN9jUgMsvTuY+6Ts/GCUIui59ZXOawZ4FDCn/sDO2DOW+hs4Rs8JlCsn7
 Ck83jRKr/V1eeSMGgPc+s0YL8K8hL19skAeb51/k9LOMQFZhfcQ1N8bab4+jwhU0EpA4
 Byyf5m9bzVMAYhq+euWxtAz3h/gyQeX5fG8Ay46PNh+C3gUKo9StVimmYq0BnEPrjD38
 q9UpPC6AVwkEMwRdHt/LFB7Hpj6/RN0c64W6JwyEmuPGiIhasIN/jffaRoNVsuESSCIg
 Mkcyd6yGvgKdjvrkwlxeHPUnh06tftuLoNgaE0mFIiT1FDXCcAcHHsWCCjbA7lcHtF9a
 tWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=0pIJb30YTBijZODyDpWztW1XMx1m/O2fwgYsTQ3r7Kc=;
 b=rsJ50WVhAbtaNhlWWtkNgREcxLnXj12ZeZGOvUvXuIdqtGT8tDFL4TdBmayDEzmRwD
 mcKeoofQP+Jcove78L2JiLuY7Cf9YFBfoRXIcfDvBYSHKZT1HAkSGac7jaypu8wKUgvI
 rlZz4vo8DBMVdJpZftLH7OcQ8hZAu8nrLbyoikX9IyCjkSIdvBl6QHHxb0MYpvbtzIDA
 Ti/mYSwQICVNfV4J+XEwKS2hDYdOcMJFhT2U1JpCoB7Ffje1eVVpFBqjYHjwqFbAuGxy
 2t7eKwtX3ArgiD04v7n9olHTD5UJHGVflPZxUTI/15ViN9c4DwiaYy8iLbv2doZcsQXk
 u0og==
X-Gm-Message-State: ACrzQf0R4dn/EwVliHISUyJ2RzngaZvGLzyv6l/IOnf08bmHjQLA1XFv
 2mXTQ4vRWk9hprTEeb91GEFWqA==
X-Google-Smtp-Source: AMsMyM5a7KRo8Y0ijuttBRUtXKCAcqe40YguJzQf1dwrEVhCsFmBK10r2e+EfcW1LtLvjjaj3W94NQ==
X-Received: by 2002:a17:90a:6902:b0:202:a300:44b2 with SMTP id
 r2-20020a17090a690200b00202a30044b2mr33146695pjj.20.1664157920438; 
 Sun, 25 Sep 2022 19:05:20 -0700 (PDT)
Received: from john-millikin.com (aq206251.dynamic.ppp.asahi-net.or.jp.
 [220.146.206.251]) by smtp.gmail.com with ESMTPSA id
 r26-20020a63441a000000b0042b5095b7b4sm9593648pga.5.2022.09.25.19.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 19:05:19 -0700 (PDT)
Date: Mon, 26 Sep 2022 11:05:15 +0900
From: John Millikin <john@john-millikin.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
Message-ID: <YzEI27nhVg741tJN@john-millikin.com>
References: <20220804122950.1577012-1-john@john-millikin.com>
 <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
 <YxVtWkzEJP7WotRe@john-millikin.com>
 <CABgObfb=nS0MEG2WWA3mu=LqiqJKSFxr0A53fPkYKvT+k10cZg@mail.gmail.com>
 <Yx7lx8I6BQdLYWZM@john-millikin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yx7lx8I6BQdLYWZM@john-millikin.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=john@john-millikin.com; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping again.

I'd really like to get this ~6 line patch into mainline so I can pop it
off my TODO list.

On Mon, Sep 12, 2022 at 04:54:52PM +0900, John Millikin wrote:
> Gentle ping -- is there anything blocking this patch from going in?
> 
> It's been about a month now since I sent it, and it's not very big, so I
> was hoping it would merge without much difficulty.
> 
> If it's breaking a test or something then I'd be happy to take a look
> and send a new revision.
> 
> On Mon, Sep 05, 2022 at 09:43:20AM +0200, Paolo Bonzini wrote:
> > Probably just my screw up, or it broke something when testing... let me
> > check.
> > 
> > Paolo
> > 
> > Il lun 5 set 2022, 05:30 John Millikin <john@john-millikin.com> ha scritto:
> > 
> > > I notice this patch wasn't included in the [PULL] series last week, and
> > > it isn't present in the `master` branch.
> > >
> > > Is there anything else I should be doing to get it merged in? Sorry if
> > > this isn't a good question, I'm not used to QEMU's email-based change
> > > management workflow.
> > >
> > > On Sat, Aug 20, 2022 at 09:42:25AM +0200, Paolo Bonzini wrote:
> > > > No, I had not seen it indeed. Queued now, thanks.
> > > >
> > > > Paolo
> > > >

