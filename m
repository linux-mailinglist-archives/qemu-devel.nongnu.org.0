Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5955B800
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 11:27:00 +0200 (CEST)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhsaR-00014F-B7
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 05:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hhsZ1-0008Gt-CV
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hhsZ0-0003XV-Eg
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:25:31 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hhsZ0-0003WU-7U
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:25:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id m29so13900327qtu.1
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 02:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ACWMxD4prjF3RaD3oYlQ3n0u3XdGgrroQgSRyA83/v8=;
 b=WW6XAS+NRV1idToaoFXv5YJ/JFsNX8NkntnPpPxH/Rl9615kGeVIhUFMbEfs8g/nF+
 zKj1AyHpXuOgwG3H7XfybOA5mwhrRQ7w/h/3c93zB7p7AGqrM1EuynCU24Oak27OMvXr
 weIiFyzj2062/VluODIU3bAbEBVlnGk1BUXCKlLQr024vAPbNkrN1zYYVlURM8NNg9ge
 Ku61omMaCHJDhV0w2APoQ/4tRT3hOQcEE2EddAfhJmTHOUKcRkeh6Ch7bG4QDoIZ//jG
 SklRXaparZ5mjWVjyvVKEopxeKeiye/cxofjzfT64S5mfOPD1nMw2tqmvGafjpDbknYj
 1F3A==
X-Gm-Message-State: APjAAAW++nV6rZmQSZRHhi4vvLpV6LJ0b6JMwnKYo0zBR9889aLDkk/n
 NsRfozDgS+b5uldu3J5HVjXccQ==
X-Google-Smtp-Source: APXvYqxu6NwtGhOCqzl8v5Gzx1RUcJ2phSKNVXLdcmBNL8vOL99tGZ10WFp3lT+UUZs2DJc4voFTRQ==
X-Received: by 2002:ac8:124c:: with SMTP id g12mr18626119qtj.57.1561973129598; 
 Mon, 01 Jul 2019 02:25:29 -0700 (PDT)
Received: from redhat.com ([37.26.146.159])
 by smtp.gmail.com with ESMTPSA id u1sm5212054qth.21.2019.07.01.02.25.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 02:25:28 -0700 (PDT)
Date: Mon, 1 Jul 2019 05:25:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190701052511-mutt-send-email-mst@kernel.org>
References: <20190628115349.60293-1-slp@redhat.com>
 <20190628115349.60293-2-slp@redhat.com>
 <20190628200328.GI1862@habkost.net> <87lfxlwfko.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfxlwfko.fsf@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.193
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/i386: Factorize CPU routine
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 11:44:07PM +0200, Sergio Lopez wrote:
> 
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Fri, Jun 28, 2019 at 01:53:46PM +0200, Sergio Lopez wrote:
> > [...]
> >>  /* Enables contiguous-apic-ID mode, for compatibility */
> >> -static bool compat_apic_id_mode;
> >> +bool compat_apic_id_mode;
> >
> > We can get rid of this global variable, see the patch I have just
> > sent:
> >
> >   [PATCH] pc: Move compat_apic_id_mode variable to PCMachineClass
> 
> Nice. I'll adapt the v2 of the patchset to assume this has been
> committed.
> 
> Thanks!
> Sergio.


or include it for completeness.

