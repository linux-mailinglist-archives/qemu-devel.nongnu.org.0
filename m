Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5A4ADB1C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:26:46 +0100 (CET)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRS9-0007u2-L0
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:26:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQAz-0008NM-Qn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:04:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQAx-0007z7-DA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644325492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9uBdpYGqjQbwORgu5a58ONe3YAo/EQOww1/4pKivbo=;
 b=ZRfawf3tUT4WLxhoYpnTgWi79i1dl7FI2kdTNMQdyV6NJpm04jRTgpjI+9At62vALGlM5b
 CVSRxgqxJzSqiJbnfl1BTmKjuuMaZGSKyrLjarF4pDc8tCYZRqW4B8GkujQGAEdD1CwibM
 FP2fEwvt0akTBKpLqeoNxy6WCporUy8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-c8FcpZYbP5izlQuRqgZyLw-1; Tue, 08 Feb 2022 08:04:49 -0500
X-MC-Unique: c8FcpZYbP5izlQuRqgZyLw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso6071515wrg.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Z9uBdpYGqjQbwORgu5a58ONe3YAo/EQOww1/4pKivbo=;
 b=eKo6Qq2HqDja79Ww6Vmb6o3SYvVL20CciruL0+3L+UlKrlUmhaHPnAwxMLH1A/Tk+m
 CKxPcS9lFMb1I7yNwCy1vro8wCGjtbkJardI7bz0CrlFi4B/M9CYWiP8L+EppEGcsyoG
 B12NFxRK+q2TIEYCqQYv93zQBAV2omEtxUFhivmfhDIbTabVfpMPHagjfdzO2kPgVmLY
 WU5aappRmaQvwhtkbnfEXVv1M2P92923FdyqAnfPgSWM3Pql95wVaNGIthocV28VRr2i
 b0UHziAdCsS50F9p6r5pRuaMV8X0Kp77pd3ySxvjN2+fBdpO3Atnqsjc5ZYTQJVP/sav
 3zIg==
X-Gm-Message-State: AOAM530maVObnu6VuIdI0Cv63uzXKqX7HcXi5/UE0XK2ZGtGj84VlR0k
 ELDXwed8sUMmH5prrqffWZrUs965MeyGZdsqmk5Qhowz4GtDRcPgB+J4NWLc/585Y+g2vvTeBzH
 UIhGWGHBSegk6b6I=
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr3429954wry.254.1644325486764; 
 Tue, 08 Feb 2022 05:04:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK8xGl50IbbzjCfXMx13LLrEyB69z5nQfCFODRqRxRfXeLetm/p3E6aINKMbZhx3FWN6QT8Q==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr3429929wry.254.1644325486557; 
 Tue, 08 Feb 2022 05:04:46 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id i19sm2627224wmq.45.2022.02.08.05.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:04:46 -0800 (PST)
Date: Tue, 8 Feb 2022 13:04:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJqbElD7OQM35W7@work-vm>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
 <2cad9b25-620d-66b9-d64f-7a0e3f806952@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <2cad9b25-620d-66b9-d64f-7a0e3f806952@ilande.co.uk>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Laurent@vivier.eu, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mark Cave-Ayland (mark.cave-ayland@ilande.co.uk) wrote:
> On 08/02/2022 10:29, Dr. David Alan Gilbert wrote:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> > > Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> > > 
> > > > On 7/2/22 20:34, Peter Maydell wrote:
> > > > > On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
> > > > > <mark.cave-ayland@ilande.co.uk> wrote:
> > > > > > 
> > > > > > This displays detailed information about the device registers and timers to aid
> > > > > > debugging problems with timers and interrupts.
> > > > > > 
> > > > > > Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > > > > ---
> > > > > >    hmp-commands-info.hx | 12 ++++++
> > > > > >    hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > >    2 files changed, 104 insertions(+)
> > > > > 
> > > > > I'm not sure how keen we are on adding new device-specific
> > > > > HMP info commands, but it's not my area of expertise. Markus ?
> > > > 
> > > > HMP is David :)
> > > 
> > > Yes.
> > 
> > So let me start with an:
> > 
> > Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > (If it's useful info for the author of the device, then I'm happy for
> > HMP to have that), but then - (moving the reply around a bit):
> > 
> > 
> > > Should this be conditional on the targets where we actually link the
> > > device, like info skeys?
> > > 
> > 
> > Yes, I think so; it's a reasonably old/obscure device, there's no reason
> > everyone having it built in.
> 
> Unfortunately that doesn't seem to work: whilst the target CONFIG_* defines
> are declared when processing hmp-commands-info.hx it seems the the device
> CONFIG_* defines are missing?

I'd be happy to take it down to the target level.

Dave

> > > >                  IIRC it is OK as long as HMP is a QMP wrapper.
> > > 
> > > That's "how to do it", and I'll get back to it in a jiffie, but Peter
> > > was wondering about the "whether to do it".
> > > 
> > > Most HMP commands are always there.
> > > 
> > > We have a few specific to compile-time configurable features: TCG, VNC,
> > > Spice, Slirp, Linux.  Does not apply here.
> > > 
> > > We have a few specific to targets, such as dump-skeys and info skeys for
> > > s390.  Target-specific is not quite the same as device-specific.
> > > 
> > > We have no device-specific commands so far.  However, dump-skeys and
> > > info skeys appear to be about the skeys *device*, not the s390 target.
> > > Perhaps any s390 target has such a device?  I don't know.  My point is
> > > we already have device-specific commands, they're just masquerading as
> > > target-specific commands.
> > 
> > Yeh we've got info lapic/ioapic as well.
> 
> ... which I suspect is a workaround for only the target CONFIG_* defines being declared.
> 
> > > The proposed device-specific command uses a mechanism originally made
> > > for modules instead (more on that below).
> > > 
> > > I think we should make up our minds which way we want device-specific
> > > commands done, then do *all* of them that way.
> > 
> > I think device specific commands make sense, but I think it would
> > probably be better if we had an 'info dev $name' and that a method on
> > the device rather than registering each one separately.
> > I'd assume that this would be a QMP level thing that got unwrapped at
> > HMP.
> > 
> > But that's not a problem for this contribution; someone else can figure
> > that out later.
> 
> 
> ATB,
> 
> Mark.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


