Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E203CC9EB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 18:46:37 +0200 (CEST)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m59w3-0002Nn-Ns
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 12:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m59uQ-0000vG-J6
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:44:54 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m59uN-0007X7-M0
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:44:54 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m83so14034992pfd.0
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lcbuiXRH/TjBIQtcu/af8orjHwpqroAt18LsQsF0ZzQ=;
 b=MHflFMRduOfHh6RLuKlDTBOgB2GTJkMDIkDreLgOfQghzljCMphD3vx2SzjbtRsLO0
 D3ATb0QVCTBKjVBg9C1Kg+nIDPoHdj8yphH4zkOgM17O5Yz1gJ/QSb7VhcOMgjc/OR4t
 90vbMnEYS9Rb1O8ILHvfLbXJgPDJdxuNX+zeMpggEzSR4fBq56Kfe55W5f6KB4nX8Coi
 Ci+0jba/CsJKZ/bCbw4JUkU5KBbVE6qznlh41PlI8xGBCR5y0q/QPGCcvN5y/jWKcQqW
 JdqgV4kxhiBGxGBQ84EkxSiGpFiSvoxJ82lcVzqkDljhzphO13xONSY9woOUxKiuGNzt
 a6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lcbuiXRH/TjBIQtcu/af8orjHwpqroAt18LsQsF0ZzQ=;
 b=SriPZYriAfpiB/cgmj4pYNYEZmkqpnZOSs+i8HPvWKJVTzIEojZt0dfgjWMjE8Ts0Z
 nEI91XVwOhhy0FabtwN9oHk8zF/BSeTXPbmgbi6R94HLc0MaQm4vjoRu8edmpflM/zML
 8c5hrimrpZoFmrTo+x1uzjDzXPSArt69rao52+bjYsnrxDQspHSKMjv3qZZHsdt/Bj0M
 PxR8LsaK1a0P7LyMoNpp8uaN3s6KACSwZrGkyaXksrV8lkAodlMHx/SDeIH3gqLcTAnr
 aQkIp9Y9QHCrBbIuhvEY6SuB+2Op3jr1Xfr6HMFOXA4UhKGVGzuZ7gVwAtxLYGTQHpit
 KKsA==
X-Gm-Message-State: AOAM532QmElhvEiOnOJaqp+pOGszKUcGgoe38KodZqNathQrC8ktH7tQ
 PELq5hpotYKK0kV56Wdxkjl41A==
X-Google-Smtp-Source: ABdhPJy0WbuTWkXLJMXbERkiejtdrJbjv2avfyluNO3sgvMp6fWChvaa2sAG21fvfXiznUVO3xCaDA==
X-Received: by 2002:a05:6a00:114f:b029:340:aa57:f69 with SMTP id
 b15-20020a056a00114fb0290340aa570f69mr6360083pfm.28.1626626690210; 
 Sun, 18 Jul 2021 09:44:50 -0700 (PDT)
Received: from ani-ubuntu ([115.96.140.226])
 by smtp.googlemail.com with ESMTPSA id x6sm19753013pgq.67.2021.07.18.09.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 09:44:49 -0700 (PDT)
Date: Sun, 18 Jul 2021 22:14:33 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@ani-ubuntu
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/pci: remove all references to find_i440fx function
In-Reply-To: <818656b2-368a-3fb5-1eca-6d9d0cedd183@amsat.org>
Message-ID: <alpine.DEB.2.21.2107182213560.56222@ani-ubuntu>
References: <20210718131659.55783-1-ani@anisinha.ca>
 <818656b2-368a-3fb5-1eca-6d9d0cedd183@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-170569265-1626626689=:56222"
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-170569265-1626626689=:56222
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 18 Jul 2021, Philippe Mathieu-Daudé wrote:

> On 7/18/21 3:16 PM, Ani Sinha wrote:
> > commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
> > uses of find_i440fx() function. This has been replaced by the more generic call
> > acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
> > machine type as well as for the q35 machine type. There seems to be no more any
> > need to maintain a i440fx specific version of the api call. Remove it.
>
> Yay!

Thanks to Julia for making it happen. I was wondering when I shall see
these patches ...

>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> > Tested by building from a clean tree successfully.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/pci-host/i440fx.c         | 8 --------
> >  include/hw/pci-host/i440fx.h | 1 -
> >  stubs/meson.build            | 1 -
> >  stubs/pci-host-piix.c        | 7 -------
> >  4 files changed, 17 deletions(-)
> >  delete mode 100644 stubs/pci-host-piix.c
>
--8323329-170569265-1626626689=:56222--

