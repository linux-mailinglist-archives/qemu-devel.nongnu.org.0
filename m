Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D010E35A732
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:36:57 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUww4-0002im-FL
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwsy-0000TE-Vk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:33:45 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwsw-0001Ul-SA
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:33:44 -0400
Received: by mail-qv1-xf35.google.com with SMTP id es6so3276823qvb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 12:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEvqqfA2j4DDS4JvDoHMM1dQM7AjBlWdKxEXkdhBR5E=;
 b=b2Wn++WYNO+Q/KyRqv6Pdyure3pAgQnX7ZG7uVo3KF3Ead3hzsNsH+v75XY692mFcX
 L21Q0rWbKfzCtKGZ0Xvejr5ms9HlW6AHZyD8gRCGCwNQpAMcasrIF/vrHZ5q13bBDcMQ
 R3RyMd+cnhklKZAMl6/s0+DsvUnzSce5agFu09ATauOxRLPuDTc4e3bZSPBuvF/rufM/
 VTCcXx/NuqX1l0K8/uxmzqXUUqX1T3lBnxvuTGIooJCgbOe0S1BV37AAmHJvwSwglhBB
 PiNJPbF8DcLcjg4QEBnxxWDosEWPBrxYguCmKgpCTze1ppozhmAbVdoIGwtS1XpHT7x7
 DPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEvqqfA2j4DDS4JvDoHMM1dQM7AjBlWdKxEXkdhBR5E=;
 b=G0STLDbNWNV+ZoEv5LOtWonJpZ/dBFZEp9jU5QBanuhOo/8CpjuTmLXqfCMDuam4Li
 YwQaR00XNIKNulUejzqvvHWKvZtdD2VXmhll1UaH8pZnInGWcdm4qXtLh75+oFivcV7I
 FXZvU3OdK+Eh1PSWIq9xZC1Td1AfmKrVjv8bFwniD7dCKccrwTXScrFpiJEh2ye3Epov
 Zv3DyIUVuHiPxzuRfnyJmWl9AjerMk/I5HBqx3FQz9JtfHqC0kkyUL6pQjfjEKB8EAs3
 pOef0w3ppZnqFPhRZYeMVfAyDFPRTpCGs8vOsnJMq/K9KN/HGDMgJBcPWl14JsBtKb2E
 aZbA==
X-Gm-Message-State: AOAM532zdpL7/jvBmmNGfqraYx7jZrvHsRsjLRmN+06agOseDgbfeYDc
 4p+yygGb4EnJ7VgKMPE5Sga9reMwzovO1KaEzlv6Nw==
X-Google-Smtp-Source: ABdhPJwvtwwB07pSIWhm9UlTLT+xkx/cwzaFTjwd4jiVPF/vmNPLvG5gTw/40sf02LzRz2LfDCHSJzfquFUVSiKPi14=
X-Received: by 2002:a0c:e88a:: with SMTP id b10mr15806685qvo.21.1617996821620; 
 Fri, 09 Apr 2021 12:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409183114.GW7167@minyard.net>
In-Reply-To: <20210409183114.GW7167@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 12:33:30 -0700
Message-ID: <CAO=notzGGKFBAVwJUs4OFiN_v9GukSZe-SXMB2bY=S2=Rx5m+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/i2c: Adds pca954x i2c mux switch device
To: Corey Minyard <cminyard@mvista.com>
Cc: Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=venture@google.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 11:31 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Fri, Apr 09, 2021 at 09:25:41AM -0700, Patrick Venture wrote:
> > The i2c mux device pca954x implements two devices:
> >  - the pca9546 and pca9548.
> >
> > v2:
> >  - the core i2c bus now calls a match method on each i2c child, which
> >  by default will only check for a match against itself.
> >  - the pca954x device overrides the i2c device match method to search
> >  the children for each of its buses that are active.
> >  - the pca954x device now owns an i2c bus for each channel, allowing
> >  the normal device model to attach devices to the channels.
>
> I like this design.  Avoiding hacking into the bus code is a bonus.
>
> Can these devices really have multiple channels enabled at the same
> time?  That seems strange, but I guess that could be useful.

I believe I saw that in the datasheet, and it seems reasonable that
someone might want to do that.

>
> I'm not sure if you need to add a vmstate structure for this.  In
> general most new devices have them; if it's ever included on an x86
> system (or a system with vmstate transfer capability, probably more than
> x86) that will become an issue.  I'm not sure what the expectations are,
> though.

I am perfectly willing to add the vmstate structure in a future
patchset.  My team is actively developing Qemu now for BMC automated
testing support, and we will be adding other pca mux configurations,
and other support, so this will be active.  I don't anticipate a host
system including this device yet, but that's a consideration I had not
considered.

>
> -corey
>
> >
> > Patrick Venture (4):
> >   hw/i2c: name I2CNode list in I2CBus
> >   hw/i2c: add match method for device search
> >   hw/i2c: move search to i2c_scan_bus method
> >   hw/i2c: add pca954x i2c-mux switch
> >
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/core.c                    |  55 ++++--
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c.h             |  16 +-
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  8 files changed, 382 insertions(+), 14 deletions(-)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >

