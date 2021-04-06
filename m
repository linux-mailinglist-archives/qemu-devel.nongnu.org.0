Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AF3559D2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:59:25 +0200 (CEST)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTp2y-0008Fg-IO
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lToyI-0004xS-2t
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:54:40 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lToyF-0007R8-Ee
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:54:33 -0400
Received: by mail-oi1-x22c.google.com with SMTP id v25so15796098oic.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=bkUvZWewauEtfTfJhWzPiL1KDisLndnu5nx9k4Ba8J4=;
 b=lUG896dknIvIBzkp6HAuNXW87nlVoq48+QanVq5BGyzTPjrDx84nS7xw9433NVWMUr
 7Eg3GVR9ixHZzJ3F/VX8YAxl7Pcz7iw0R0+ajZddDzt5nhRTYI3qbsWMYG1eD5w6M0wz
 risqowUU0N8gI/qvqK8VAfyS0b9EobRUtQChaBU5OaRAGavNQYLURx1zgGSmnI3MuBq7
 AYZrwBBviFUZYyqNgtA3qvagkDTJJVtPnnNLeS67IeIVkpA25rg7eNT+BNkb0NNYk6am
 qo5A9maJBKqrxgznRLz6RJVR6pKafR2tBmTFJtgDaoBV+zQoxTsE4Kyp9AJ9k/8IQn5O
 n3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=bkUvZWewauEtfTfJhWzPiL1KDisLndnu5nx9k4Ba8J4=;
 b=Qms/DBtK8uSrDBdq3ZgqlV/2XtW19bun3tDPyfFVJ4Syu5yj6ZoX4D4XtUF2tboTiW
 VW1tPOIOMZas0FONFpWYdlzlLW4f4I8Tir9SCAgrlaUXvtXZrH86Y8cPIrNNfiHYe2l+
 4zIUTSp10bSljKN9STQO3tCDJaLfzosxyk6wnFVQ5UbjKsoZSVV0h+bIsjEO2Rkby6bf
 J3NSD8oGrCJ9TQ9rJ7mM17XJ8/FUralkSIj2WEajr/+TjK5hdhsj/lwFx20dTG4Ex2DD
 Qj6g4+spkzrrVapF2NT1e9zD6tTSKzDuSdlBqD8id055A2P65bhP/Vuc7chdKpwOE/12
 zq/A==
X-Gm-Message-State: AOAM532nPp4WLW31Y8nT7pLVJGB9vgBQB/AKFWLOHFuSxxH/wVEyioRR
 gJeko1vZsdS1SonTDOqh36jVdw==
X-Google-Smtp-Source: ABdhPJxS6iJS7nPG76cfJbLMbGqD0wgTFMwiY17lVcHaKDigz2WQeiIHiHNf8jGBwUG9N7feHD9hvg==
X-Received: by 2002:aca:75c6:: with SMTP id q189mr4020432oic.29.1617728069509; 
 Tue, 06 Apr 2021 09:54:29 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by smtp.gmail.com with ESMTPSA id u8sm4242041oot.24.2021.04.06.09.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:54:29 -0700 (PDT)
Date: Tue, 6 Apr 2021 11:54:27 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: IPMI Smbus
Message-ID: <20210406165427.GQ7167@minyard.net>
References: <CAO=noty9JPU7L8XXKs48TEC9SrJ6j44boA=6ZQP4b_4Z3oy4Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=noty9JPU7L8XXKs48TEC9SrJ6j44boA=6ZQP4b_4Z3oy4Kw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 09:04:35AM -0700, Patrick Venture wrote:
> Corey;
> 
> I saw you have a branch that is working on adding smbus IPMI support
> (the ssif approach).
> 
> Can you provide details on the status of this work?

There is already an SMBus BMC device that can sit on the I2C bus.  It's
in mainstream qemu now.

It does not have smbus alert support, though.  I have patches for that,
but qemu doesn't have a flexibly general interrupt infrastructure, so I
hacked something in, and it's likely to be contentious.  The trouble is
that the interrupt is disconnected from any real device, and qemu
doesn't handle that very well.  And like the other things, I really only
created it for my testing.

For doing what you are trying to do, I don't think you need any special
support on either side for SSIF to work.

-corey

> 
> Patrick

