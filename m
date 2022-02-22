Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D34BFD36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:39:40 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXGN-0000pb-TU
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMWhJ-0005hs-TQ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMWhI-0001CP-9K
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645542194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5hBArfeew1sZWWbwvUMWJ55fOOZk5dLDf47r8z0dBQ=;
 b=JMIZuiyg11iwwD6FMC/OFZSa0XhTtKNpEly7ZIc4/Fn30XHrph5dSVI+GKWgjgpdqRxfbf
 jAY8vWM+SXKsOFzv5bBYVisWof5WQozjiQ+QFFKISzi5JL/l1Uo+rne/0CepxjKlW01aXF
 GaxkKpgsPnDGSt8cGhzetUmBMa6iAic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-2bv9aWz6OayfXtq8pg4NGg-1; Tue, 22 Feb 2022 10:03:11 -0500
X-MC-Unique: 2bv9aWz6OayfXtq8pg4NGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k30-20020a05600c1c9e00b0037d1bee4847so957593wms.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=/5hBArfeew1sZWWbwvUMWJ55fOOZk5dLDf47r8z0dBQ=;
 b=ZwltZ+/pbGWdh2yZ/2I8HOX+c+xEpX9xVFajOWVFcMifUz2jLvcmF9U2CvS0wXmMW4
 WBE42b3v5kpGqHi4HNJ3Tw7gNT0o9WZfCqk+6d1YlVLeWjETvnMyY9PequG4gzeKkDxz
 bDnKjZPURubImGFTQaeu+xcgXp1vHnG78bmwsUcy4HdYYahC3JnvmA45D9pA/HaJKuXX
 3iJcN5qGIGUsTGqoc1SBLfOVG8Ev20QGDYMOvE1afIqVMu53PZsjmbUc9XCrkpxy3bnx
 EkDOTfiTPP15X7D3CyBTENJnEB5BS/SQc7oYKQnFRXOUyfll62TM7fqYknmhVQWtGsut
 GvzQ==
X-Gm-Message-State: AOAM531meXp8s9ic/1m6oTgAPKieo+x+Xy9mSFoyIBJ0S6c9dJfAnm1J
 m/36D3y9t+JhUa3v8dgLhR/ev0v0OkdksjkkslSnFv9bVaIVH160OU22LtGTILHlI462vCJbpjl
 S46Nhx0/dOQbjOQI=
X-Received: by 2002:adf:c509:0:b0:1e3:19a9:9606 with SMTP id
 q9-20020adfc509000000b001e319a99606mr19753210wrf.276.1645542190283; 
 Tue, 22 Feb 2022 07:03:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDlHZ8lEYCt44/5Fj6SrSrkI9+Ylw7wj1jrZFW009ds3QYk7rqzvPfHF7rV53ScP2wzCu4lw==
X-Received: by 2002:adf:c509:0:b0:1e3:19a9:9606 with SMTP id
 q9-20020adfc509000000b001e319a99606mr19753190wrf.276.1645542189997; 
 Tue, 22 Feb 2022 07:03:09 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p2sm2661619wmc.33.2022.02.22.07.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:03:09 -0800 (PST)
Date: Tue, 22 Feb 2022 15:03:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YhT7K43xgXVS7YlL@work-vm>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
 <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
 <YgJrx2ygQmiF4TYx@redhat.com>
 <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
 <YhPH1BYRetB0Ks9C@redhat.com>
 <972e0e9d-1d4c-335b-139c-bb5230f2419f@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <972e0e9d-1d4c-335b-139c-bb5230f2419f@ilande.co.uk>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mark Cave-Ayland (mark.cave-ayland@ilande.co.uk) wrote:
> On 21/02/2022 17:11, Daniel P. Berrangé wrote:
> 
> > On Sun, Feb 20, 2022 at 05:18:33PM +0000, Mark Cave-Ayland wrote:
> > > On 08/02/2022 13:10, Daniel P. Berrangé wrote:
> > > 
> > > > On Tue, Feb 08, 2022 at 01:06:59PM +0000, Mark Cave-Ayland wrote:
> > > > > On 08/02/2022 12:49, Daniel P. Berrangé wrote:
> > > > > 
> > > > > > > I was under the impression that monitor_register_hmp_info_hrt() does all the
> > > > > > > magic here i.e. it declares the underlying QMP command with an x- prefix and
> > > > > > > effectively encapsulates the text field in a way that says "this is an
> > > > > > > unreliable text opaque for humans"?
> > > > > > 
> > > > > > The monitor_register_hmp_info_hrt only does the HMP glue side, and
> > > > > > that's only needed if you must dynamically register the HMP command.
> > > > > > For statically registered commands set '.cmd_info_hrt' directly in
> > > > > > the hml-commands-info.hx for the HMP side.
> > > > > > 
> > > > > > > If a qapi/ schema is needed could you explain what it should look like for
> > > > > > > this example and where it should go? Looking at the existing .json files I
> > > > > > > can't immediately see one which is the right place for this to live.
> > > > > > 
> > > > > > Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
> > > > > > there. The QAPI bit is fairly simple.
> > > > > > 
> > > > > > if you want to see an illustration of what's different from a previous
> > > > > > pure HMP impl, look at:
> > > > > > 
> > > > > >      commit dd98234c059e6bdb05a52998270df6d3d990332e
> > > > > >      Author: Daniel P. Berrangé <berrange@redhat.com>
> > > > > >      Date:   Wed Sep 8 10:35:43 2021 +0100
> > > > > > 
> > > > > >        qapi: introduce x-query-roms QMP command
> > > > > 
> > > > > I see, thanks for the reference. So qapi/machine.json would be the right
> > > > > place to declare the QMP part even for a specific device?
> > > > > 
> > > > > Even this approach still wouldn't work in its current form though, since as
> > > > > mentioned in my previous email it seems that only the target CONFIG_*
> > > > > defines and not the device CONFIG_* defines are present when processing
> > > > > hmp-commands-info.hx.
> > > > 
> > > > Yeah, that's where the pain comes in.  While QAPI schema can be made
> > > > conditional on a few CONFIG_* parameters - basically those derived
> > > > from global configure time options, it is impossible for this to be
> > > > with with target specific options like the device CONFIG_* defines.
> > > > 
> > > > This is why I suggested in my othuer reply that it would need to be
> > > > done with a generic 'info dev-debug' / 'x-query-dev-debug' command
> > > > that can be registered unconditionally, and then individual devices
> > > > plug into it.
> > > 
> > > After some more experiments this afternoon I still seem to be falling
> > > through the gaps on this one. This is based upon my understanding that all
> > > new HMP commands should use a QMP HumanReadableText implementation and the
> > > new command should be restricted according to target.
> > > 
> > > Currently I am working with this change to hmp-commands-info.hx and
> > > qapi/misc-target.json:
> > 
> > [snip]
> > > i.e. qmp_marshal_output_HumanReadableText() isn't protected by the #if
> > > TARGET guards and since HumanReadableText is only used by the new
> > > qmp_x_query_via() functionality then the compiler complains and aborts the
> > > compilation.
> > > 
> > > Possibly this is an error in the QAPI generator for types hidden behind
> > > commands using "if"? Otherwise I'm not sure what is the best way to proceed,
> > > so I'd be grateful for some further pointers.
> > 
> > Yes, this is pretty much what I expect and exactly what I hit with
> > other target specific commands.
> > 
> > That's why I suggested something like a general 'x-device-debug' command
> > that is NOT conditionalized in QAPI, against which dev impls can register
> > a callback to provide detailed reporting, instead of a device type specific
> > command.
> 
> Ah so this is a known issue with this approach then. David mentioned earlier
> in the thread that he'd be okay with a HMP command if it was useful and
> restricted to the required targets, so would it be okay to add "info via"
> for now as just a (non-QMP wrapped) HMP info command if I can get that to
> work?

I still am from an HMP point of view; it sounds like the right way in
the future is to get the info devices or whatever;  I suggest you keep
it as close to a QMP implementation as possible, still with the
HumanReadableText stuff.
(Others might still be nervous about an HMP special; but I don't see
it's worth holding this trivial stuff up for it).

Dave

> 
> ATB,
> 
> Mark.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


