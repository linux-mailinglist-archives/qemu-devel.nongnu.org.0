Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C33ADBCB
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 23:33:39 +0200 (CEST)
Received: from localhost ([::1]:43718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luiav-00077h-Sv
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 17:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luia6-0006R9-3g
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 17:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luia3-00036G-3h
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 17:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624138361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fwu9y3DFhCuCr3DhlYR1rnFXvVtRMUyJ3rb81c/RiiY=;
 b=iW3XI7H9wYJBtglqIkHKioy9ymEcAImtEEELZGWx/Qvq441dP+jpcdg+pzAJL9coZDEp0A
 UDK1pCOx+Q5A2tvRnd1p3nE6e4pieQZlbRAw7CDs3HiX9SJJYKdD13hl7iOPyRLzMGO3k/
 v2VZ/73UphQmsavyKH3TrhAyTkf4SKg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-YvMIclb3NvO1gT-hL0R3cg-1; Sat, 19 Jun 2021 17:32:39 -0400
X-MC-Unique: YvMIclb3NvO1gT-hL0R3cg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso5308520wmj.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 14:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fwu9y3DFhCuCr3DhlYR1rnFXvVtRMUyJ3rb81c/RiiY=;
 b=hb2RgEzdHGc8kJCPOSvUJNBoQTqlftpelO/SSXii49lCLrvQAYKdpabJ4gQik48Eir
 oA/xh+lTceOMN7Qr1/Sz2gyE0IYwPff1vBWib8aljhS2u/w5/crlAGJYpkzIazCFCcrf
 CNRm0oY/3BspJNTmSy+w4881gU7Pf4NGbvtlvoWbZiZkifbRblfdrJyh8SBUpktkfIaX
 tlmTRNW0HANnW0dKiI62oMv9p4F11iF+uyknAdYld/FsX/c2KeIo9VKwZMGxBAMhSeRX
 Y+MakvC6wwxR5DiFHnTh8oGh1OePkKs48OgLUc+XixxxrDqmI/8hjnNmCy/7NL/kg6HH
 lKMg==
X-Gm-Message-State: AOAM531WxLf5Dtu9bM1vHFV1hakoogmlqSPdlSrz98YnzMXflle3snQ1
 xaQEaJbMON6rVt+6k66Dy7PSjktgGEN6ZwfSkKyB1/7TpCdkyfYfFXmmJ50KTS2JvdyTR1CrHAn
 DbjCPvRYsMkUBgXY=
X-Received: by 2002:a1c:4954:: with SMTP id w81mr18393635wma.182.1624138358840; 
 Sat, 19 Jun 2021 14:32:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzjt28s7RG4vw2vkz0gmwVf1KhFMtvkgoVZcQn0rDstIwyJJKae3pCbwQZbWqQMWkVI3y1wQ==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr18393608wma.182.1624138358656; 
 Sat, 19 Jun 2021 14:32:38 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id w2sm9987885wrp.14.2021.06.19.14.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 14:32:38 -0700 (PDT)
Date: Sat, 19 Jun 2021 17:32:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 19/23] hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
Message-ID: <20210619172924-mutt-send-email-mst@kernel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-20-philmd@redhat.com>
 <20210618133720.459491bd@redhat.com>
 <a9e25c7f-2cff-229f-49ab-3f18b9cb1e1f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a9e25c7f-2cff-229f-49ab-3f18b9cb1e1f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 10:45:17AM +0200, Philippe Mathieu-Daudé wrote:
> On 6/18/21 1:37 PM, Igor Mammedov wrote:
> > On Wed, 16 Jun 2021 22:43:24 +0200
> > Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > 
> >> pc_madt_cpu_entry() is specific to QEMU 'PC' machines,
> >> move it to acpi-pc.c.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  hw/i386/acpi-common.c | 40 ----------------------------------------
> >>  hw/i386/acpi-pc.c     | 39 +++++++++++++++++++++++++++++++++++++++
> > 
> > it's used not only by PC machines but also microvm,
> > which didn't use acpi-build.c (aka acpi-pc.c)
> > it only links fine by virtue that PC machines
> > are object files are also included.
> 
> Is that something new? I can't see this in mainstream,
> the microvm machine builds fine without this code.

I think Igor means this:

hw/i386/generic_event_device_x86.c:    adevc->madt_cpu = pc_madt_cpu_entry;

and

hw/i386/microvm.c:        DeviceState *dev = qdev_new(TYPE_ACPI_GED_X86);

Admittedly given it's not limited to pc the function name is wrong ...

-- 
MST


