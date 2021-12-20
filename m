Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4252247B2F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:36:21 +0100 (CET)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNWF-0000sa-Pq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKu7-0006Uj-S4
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:48:47 -0500
Received: from [2607:f8b0:4864:20::d32] (port=37875
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKu5-0003hV-9p
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:48:46 -0500
Received: by mail-io1-xd32.google.com with SMTP id k21so13866048ioh.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=XJr9ohjSbY2mtqEGDUiSRXtOeTpWdTfoJN+NgFRGTw4=;
 b=y/3sqiALMDYsr42Ls7geAa1ShUBCm549GMgJMEKjYF5v+Dbm12HrBpimyTl7xqc73O
 2GLMFchjyepIOxolov5zo0w0M2tyeJDd9gWgqOjtrg0oiNmZNYBF0sjr0kzmthmCnru6
 v+62K0/4ky4ON5D5X5pIZq3X1bOhaO8I0Qb1oO0GGdTogkGXxwK9TAUcGLSkxx6COoEA
 oc+/IVAENKVLKZ5hTMuLdH2vYdxVCo9Qt7zbAEf0wypWiQ82sD9kSbOsE5fF0nAi6Rhk
 Y/hZjFcYpCL3/VIhUFDk5OMqKEtKsy2reJYJ2Mjr9AGHh3kVZoI8GBOt43KsNTVw+Yhf
 L9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=XJr9ohjSbY2mtqEGDUiSRXtOeTpWdTfoJN+NgFRGTw4=;
 b=GhVCoPh2mnpeqku5gCK/bagwnnIkp9y21IWCEaT0vdf/LyRoaSkWnB1KJpcebuJbNH
 3GaV7jQb0MHHQyoiGD6kcT2mDRJQz2q/ltM0yvECQcSMGPg6HWWgYh1IYECUB4r9sVkK
 xq9xDlyd5n4XbP9UAOHPosOC7muIqvLoea5P9BoMDlkdvvTe3F7kCOah7NYsA1hIHHJF
 iIrPw9y8+UTNpCcfaKHDTHx6tBrZrbPdx6GDOLBMeBaL40QOwx4p8DJWy7bmdCZsRbhS
 Ok3hnN8+HDBi1KBWHhqL6RnwoNZiE7mSYv0eNvxQvzggLq7uK+qoodRXr2wAXGl9bolq
 uqQg==
X-Gm-Message-State: AOAM530du+qc24pbbKSYgREgQkekDQybmOn/FMk+I8bCM2v8QwnC8jQH
 YDybkMEF+2PAlOWWWXpQ5twnX8qz+yCypQ==
X-Google-Smtp-Source: ABdhPJwJaIj70oXcHEFJNVpppfzsnxVXCCCyKC3ce5JL8ZQxCZyOs7egxl2sBnEeD92LwXGoKPuPKQ==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr7067642pgm.373.1640008549226; 
 Mon, 20 Dec 2021 05:55:49 -0800 (PST)
Received: from [192.168.1.5] ([203.212.246.92])
 by smtp.googlemail.com with ESMTPSA id 59sm17373907pjz.34.2021.12.20.05.55.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 05:55:48 -0800 (PST)
Date: Mon, 20 Dec 2021 19:20:24 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Thomas Huth <thuth@redhat.com>
Subject: Re: build qemu on Monterey?
In-Reply-To: <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
Message-ID: <alpine.OSX.2.20.2112201919570.23921@athabasca.local>
References: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
 <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 20 Dec 2021, Thomas Huth wrote:

> On 18/12/2021 15.38, Ani Sinha wrote:
> > Hi :
> > Has anyone tried this? Yes, I know about
> > https://wiki.qemu.org/Hosts/Mac
> >
> > but I am getting
> >
> > $ ./configure --target-list=x86_64-softmmu
> > Using './build' as the directory for build output
> > Disabling PIE due to missing toolchain support
> >
> > ERROR: glib-2.56 gthread-2.0 is required to compile QEMU
> >
> > when glib is already installed using brew.
> >
> > Any ideas?
>
> 1) Check "config.log" to see the exact reason for the failure
>
> 2) Check .gitlab-ci.d/cirrus/macos-11.vars to install the same packages on
> your system, maybe that helps...?

I ended up using a ubuntu docker to build qemu on my mac.

>
>  HTH,
>   Thomas
>
>

