Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E454AD5EB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:09:05 +0100 (CET)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOMq-0001mQ-8y
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHNkS-0002eS-Cg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:29:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHNkO-00063R-TB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644316155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8TXYgibWrEDDGtMoyQ9etq5TSjD54bkLThpIx2p8Dg=;
 b=FvQgzQfBad8wPdo1uMxUwJzSzTpUmI3Mv9xYemuWAVVBbeUJmFMWQuRE5lWZ6DqB+6FLcf
 h7HW40ah6m8A7LOuSzvgCmtNh5VDqGKsuZ2IHfJQefpwWEN55NQL5kc1bjxGqpfJMPyOIT
 AS1uo93IYZlW5UFfMlLHiYylKbvRJEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-TdhBRg0fPNiXar09zn6BSQ-1; Tue, 08 Feb 2022 05:29:14 -0500
X-MC-Unique: TdhBRg0fPNiXar09zn6BSQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so701593wrb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=B8TXYgibWrEDDGtMoyQ9etq5TSjD54bkLThpIx2p8Dg=;
 b=HKmZy8kgmBY8WiQCJHH5obC2NIVkD+ifBl4hkZHybrJch9CiUJ67j/Fpt6ykl6qajO
 VIfu3GY+sSXUgyEwTX3pnIeFU81Jrz89Mhz9CpMqkbqRDM3KkAICH+j+NRCI6ULyvOZQ
 Y85aRSgYb1myMdpPFVGR+BVj5BfHxzaLrpG1F80Dtt2Gsr/hHKQs+1/8nOgw2m2mWF1u
 7/tOsySEtQf1C5NjEdUAIUvuQfcQDMgpqw0LSP/SEXsCTVibfWnVRqXA51HrBHDkpAIz
 BxDpYKNheR+iN8BF5SaZqkiAlm80wdlKCic/faJxM474CZn+Tceet72JH3UCYbglsfXj
 HggQ==
X-Gm-Message-State: AOAM5318QF7BzvRbXALCRllgHpsy8P0JvhTqJujTwSmAtmn3L8w47UH2
 61nB1DReMEtRtTR3CaIRFG7zMiW9O0+S0BNwoEjmKOSLj3EIKFboos9gNUt+8F/HmD0cU1YiN/a
 7D46n4Lz60qxg7tc=
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr536820wmg.4.1644316153583;
 Tue, 08 Feb 2022 02:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5eDSF2kCfPKCZmrRNe3ZmTQ8KCK/9foDW6LjFkSzMI5m6ircWCqaJh+Vmt50aI3m+CGZQ/w==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr536796wmg.4.1644316153283;
 Tue, 08 Feb 2022 02:29:13 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id y15sm17473225wry.36.2022.02.08.02.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 02:29:11 -0800 (PST)
Date: Tue, 8 Feb 2022 10:29:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJF9SDwb93k5/fg@work-vm>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <877da5wzgp.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
> > On 7/2/22 20:34, Peter Maydell wrote:
> >> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
> >> <mark.cave-ayland@ilande.co.uk> wrote:
> >>>
> >>> This displays detailed information about the device registers and timers to aid
> >>> debugging problems with timers and interrupts.
> >>>
> >>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> ---
> >>>   hmp-commands-info.hx | 12 ++++++
> >>>   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
> >>>   2 files changed, 104 insertions(+)
> >> 
> >> I'm not sure how keen we are on adding new device-specific
> >> HMP info commands, but it's not my area of expertise. Markus ?
> >
> > HMP is David :)
> 
> Yes.

So let me start with an:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(If it's useful info for the author of the device, then I'm happy for
HMP to have that), but then - (moving the reply around a bit):


> Should this be conditional on the targets where we actually link the
> device, like info skeys?
> 

Yes, I think so; it's a reasonably old/obscure device, there's no reason
everyone having it built in.

> >                 IIRC it is OK as long as HMP is a QMP wrapper.
> 
> That's "how to do it", and I'll get back to it in a jiffie, but Peter
> was wondering about the "whether to do it".
> 
> Most HMP commands are always there.
> 
> We have a few specific to compile-time configurable features: TCG, VNC,
> Spice, Slirp, Linux.  Does not apply here.
> 
> We have a few specific to targets, such as dump-skeys and info skeys for
> s390.  Target-specific is not quite the same as device-specific.
> 
> We have no device-specific commands so far.  However, dump-skeys and
> info skeys appear to be about the skeys *device*, not the s390 target.
> Perhaps any s390 target has such a device?  I don't know.  My point is
> we already have device-specific commands, they're just masquerading as
> target-specific commands.

Yeh we've got info lapic/ioapic as well.

> The proposed device-specific command uses a mechanism originally made
> for modules instead (more on that below).
> 
> I think we should make up our minds which way we want device-specific
> commands done, then do *all* of them that way.

I think device specific commands make sense, but I think it would
probably be better if we had an 'info dev $name' and that a method on
the device rather than registering each one separately.
I'd assume that this would be a QMP level thing that got unwrapped at
HMP.

But that's not a problem for this contribution; someone else can figure
that out later.

Dave


> 
> On to "how to do it", part 1.
> 
> Most of the time, the command handler is declared with the command in
> hmp-commands{,-info}.hx, possibly with compile-time conditionals.
> 
> But it can also be left null there, and set with monitor_register_hmp()
> or monitor_register_hmp_info_hrt().  This is intended for modules; see
> commit f0e48cbd791^..bca6eb34f03.
> 
> Aside: can modules be unloaded?  If yes, we better zap the handler
> then.
> 
> The proposed "info via" uses monitor_register_hmp_info_hrt().  No
> objection from me, requires David's ACK.
> 
> 
> "How to do it", part 2, in reply to Philippe's remark.
> 
> Ideally, HMP commands wrap around QMP commands, but we accept exceptions
> for certain use cases where the wrapping is more trouble than it's
> worth, with justification.  I've explained this several times, and I'm
> happy to dig up a reference or explain it again if there's a need.
> 
> Justifying an exception is bothersome, too.  Daniel Berrangé recently
> created a way to reduce the wrapping trouble (merge commit
> e86e00a2493).  The proposed "info via" makes use of it.
> 
> >> (patch below for context)
> >> thanks
> >> -- PMM
> >> 
> >>>
> >>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> >>> index e90f20a107..4e714e79a2 100644
> >>> --- a/hmp-commands-info.hx
> >>> +++ b/hmp-commands-info.hx
> >>> @@ -879,3 +879,15 @@ SRST
> >>>     ``info sgx``
> >>>       Show intel SGX information.
> >>>   ERST
> >>> +
> >>> +    {
> >>> +        .name       = "via",
> >>> +        .args_type  = "",
> >>> +        .params     = "",
> >>> +        .help       = "show guest 6522 VIA devices",
> >>> +    },
> >>> +
> >>> +SRST
> >>> +  ``info via``
> >>> +    Show guest 6522 VIA devices.
> >>> +ERST
> 
> [...]
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


