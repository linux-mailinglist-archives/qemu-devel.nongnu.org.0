Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6694237B1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 07:54:48 +0200 (CEST)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXzt9-0008TZ-9k
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 01:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXzrw-0007i7-BQ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 01:53:32 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXzru-0003kL-AX
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 01:53:32 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k23so1385327pji.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 22:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=duqjDqBWBOEfuBVZn++CC17cm3r42So7dL0pa/nbBSA=;
 b=hLcH5xsKgbEz3ZVEas+JpBNdkhiJuLre9w6ZjF27HnSbtqKnc5kWPX4uqTVKoFDev1
 bjg2jS43bBnOj+tIuAyHk/hkW5Q/ccDjf0JzCgSy21lzy38W8QzgoOzLTTOPD8yiok3n
 o0lBIv1zl8In87H+AvYfhF6vysYnC4PVl26FzdIB8GpWRJ4e06MALiErS5yMCmHSeEYe
 4aLe/uGupuhQdCfQB53RRILzNFrJ3CYLB2zC3guarhG33K1Y1OjRNqnD4LPIVhqFvQNP
 vrgXVqps2yuWwpLO+r2yT15wI5U3bCdI/f7p0WZftgE3qItB5bUCCM9t2aTbIdqVh9Vb
 hSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=duqjDqBWBOEfuBVZn++CC17cm3r42So7dL0pa/nbBSA=;
 b=VR99RYLUTAmxdeoV3XgNPjm0L2WkDPQOJQ8YYGXZ/vKg8Q6hyzWMeilpnwfcm5cBef
 EapR+un1YdjfyYxL4sz2vvgP/o30fi/9XalIpJq4nPKIMR8Pr3GCpgu0fMTZE4oelr3V
 i4y6jEKtDCutP95xtWP3XsvljaJbBD0Zy7GGjOaMyWYm4FiUyOII/OS2JvBgbnLGPr19
 ddRaUmrYdO2gUKauvB3aofOQpcCShyJWK0f1JSttpkP7lTaWLi0bOAOkP13okABnXCY8
 iyiBQsv8Fx7YgkpKBJVd0EbbcphWYX96Wy4SbvGQc8rOeumN5qr+YY2yyTmZ/Ta9/9cQ
 wXnw==
X-Gm-Message-State: AOAM531/jNH/R+5WoDKoqtMaCOigx+SZgmshYQGQ+c9NKGq1x/vPMRQf
 XTadlJf1Udm6pAooYY8pNVF6dQ==
X-Google-Smtp-Source: ABdhPJzMMaPnZxr036hgT9nb8c6i+f/0cuNre6vT/kyW2vF7GibLFDEx5fERZyelYaiEajt7pKC5Dw==
X-Received: by 2002:a17:902:bf43:b0:13e:28f8:9e84 with SMTP id
 u3-20020a170902bf4300b0013e28f89e84mr9186437pls.58.1633499607437; 
 Tue, 05 Oct 2021 22:53:27 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.129.122])
 by smtp.googlemail.com with ESMTPSA id
 r130sm12006444pfc.89.2021.10.05.22.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 22:53:26 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 6 Oct 2021 11:23:21 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
In-Reply-To: <5b30770b-ef21-b3e7-96d4-92bb22f3aa2a@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2110061121580.820442@anisinha-lenovo>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211005111401-mutt-send-email-mst@kernel.org>
 <5b30770b-ef21-b3e7-96d4-92bb22f3aa2a@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 5 Oct 2021, Laurent Vivier wrote:

> On 05/10/2021 17:14, Michael S. Tsirkin wrote:
> > On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
> > > Failover needs to detect the end of the PCI unplug to start migration
> > > after the VFIO card has been unplugged.
> > >
> > > To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset
> > > in
> > > pcie_unplug_device().
> > >
> > > But since
> > >      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
> > > Q35")
> > > we have switched to ACPI unplug and these functions are not called anymore
> > > and the flag not set. So failover migration is not able to detect if card
> > > is really unplugged and acts as it's done as soon as it's started. So it
> > > doesn't wait the end of the unplug to start the migration. We don't see
> > > any
> > > problem when we test that because ACPI unplug is faster than PCIe native
> > > hotplug and when the migration really starts the unplug operation is
> > > already done.
> > >
> > > See c000a9bd06ea ("pci: mark device having guest unplug request pending")
> > >      a99c4da9fc2a ("pci: mark devices partially unplugged")
> > >
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >
> > Laurent, are you thinking of addressing Gerd's comment?
>
> No, because as said by Ani, it's not the scope of this patch. The patch only
> aligns ACPI to PCIe Native to be able to manage failover.
>
> The problem reported by Gerd and Daniel has been introduced by another patch,
> globally.
>

but I thought Julia's fix commit cce8944cc9efab47d4bf29cfffb3470371c3541b
addressed this for native pcie and since it is at a high enough level, it
should catch the acpi hotplug path equally as well.


