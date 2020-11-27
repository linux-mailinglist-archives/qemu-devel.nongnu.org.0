Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B822C6066
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:17:45 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiY0m-0001I2-3m
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXyb-0000f2-5L
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXyY-0006c4-MA
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606461323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XHc5CAL2LlBtk+Qh0Wpmd1ko0+wmfuVXZ26Oi4x5AoU=;
 b=XGb2VyHUNNdbDc7rAdqvMOnwD5M3ZvVFbA+5SD+wbJ2DfhkTmTl6rTJOJTOj5NEEo09CsY
 PX8/wW8Z9bpR2i2wgTH+kOagKOA6BL83hz2/koOxdHFZz+brURuvL7kIef41RZ7AHbTNMK
 JfoBHJ5hRkzF6k61V+flZb/+qLRzUGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-p33fn5UeOMaeFmvb6NfueQ-1; Fri, 27 Nov 2020 02:15:20 -0500
X-MC-Unique: p33fn5UeOMaeFmvb6NfueQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2433100C665;
 Fri, 27 Nov 2020 07:15:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60B91100164C;
 Fri, 27 Nov 2020 07:15:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0346A1EE; Fri, 27 Nov 2020 08:15:14 +0100 (CET)
Date: Fri, 27 Nov 2020 08:15:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 09/13] audio: remove GNUC & MSVC check
Message-ID: <20201127071514.su5s4jmbtp2u6jrv@sirius.home.kraxel.org>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-10-marcandre.lureau@redhat.com>
 <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >  #if defined AUDIO_BREAKPOINT_ON_BUG
> >  #  if defined HOST_I386
> > +      __asm__ ("int3");
> >  #  else
> >          abort ();
> >  #  endif
> > --
> > 2.29.0
> 
> I would prefer to just drop this attempt to emit an inline
> breakpoint insn (which won't work on non-x86 hosts and seems
> to me to have no benefit over just calling abort(), which will
> also drop you into the debugger) and simply make it abort() if
> AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an
> opinion ?

   kraxel@sirius ~/projects/qemu# git grep AUDIO_BREAKPOINT_ON_BUG
   audio/audio.c:#if defined AUDIO_BREAKPOINT_ON_BUG

Seems this is unused, so just remove it?

take care,
  Gerd


