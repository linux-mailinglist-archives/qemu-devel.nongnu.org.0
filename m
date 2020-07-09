Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57E21A563
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 19:02:30 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtZwL-0000fJ-Q6
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmattson@google.com>)
 id 1jtZvA-0008Or-A9
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 13:01:16 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jmattson@google.com>)
 id 1jtZv8-0001Lo-AZ
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 13:01:15 -0400
Received: by mail-il1-x141.google.com with SMTP id r12so2647591ilh.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pxQ/zQslbyaatj+4DJo+g49oP9bHc9a3pxOIionupIU=;
 b=HBL5n2hQ7tibKH6zFDuRXYrP9hRloa1TzUfffPq+NooSnREa1Jaymkrrt4Is/M5tHS
 kTTG4BCuByDfp2MlTAa2TWRVIpY7NnbAIvu890asuhTMtUAoM48V/bYxx1g5zv0uX67L
 flt/bCaGZg4WF+96ax4CNYIB4eWvr/qblC4GWbaM8qOKF5+bGI4GuGQpRkRK1ohdnUdB
 /CObCJ7g8T/ORyY9d4xrOpd1yu1mBLMpHskU1rjo7HtxQ/qWQXLH7i1b/8+qpD8ZzrqV
 3dXsjdyPnuQLla5+ohnngw2m/CYSN8tXsZEnPrzW3OhoZJwW5UQ39tlhfptatlw1aS/m
 u4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxQ/zQslbyaatj+4DJo+g49oP9bHc9a3pxOIionupIU=;
 b=Aql2VH3MbzWDZ9cXx4xlxyPyquXkdlcBMBOQrRNMcUXmHk6kI1upR7ao3W7WuaPS1Q
 wPH3jdCXyy7msmcBmX6c/qmpdrLhVbEeBexaO5aOkUyn4+kBwZ+C7PJxHR1zaUSxGlWF
 Nwabc1D8NbD3b0hM3/mU9c8M1Oqh70I9/3dKzYIjjuG4G6D/+SXhjWs79ZKKAZkaiSFn
 Lg3+QtKAaxBx3Did0uL2rhNTGyc8YuQFAMT+nM7GyGyQMKg0lwlSRKv8RPYciSMmjprF
 f8D1toya2JFjJD7ZgSIDXfUytH6PplkBsaIaTJeIGgYoIDZZL0z7xGNtZvi9v/3wM47x
 4bTw==
X-Gm-Message-State: AOAM533v3bc6HFETLtL94ng/lWYVwRPW0NqvLDAEyizHVpUppnRd2OWr
 bOIVg4o8TgP6Ie2TsE2PQStgpCkt2kvqwblB/0qJ8Q==
X-Google-Smtp-Source: ABdhPJzRVQ+Y0SpPndi+v89rrOa93UbwDZyHhDi/MzMpDt2JtDC3aQsTkwCRFg4KJ211U/NpWuVphPV2BKWDHBB3U98=
X-Received: by 2002:a92:c989:: with SMTP id y9mr38741154iln.108.1594314070847; 
 Thu, 09 Jul 2020 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200619155344.79579-1-mgamal@redhat.com>
 <20200619155344.79579-3-mgamal@redhat.com>
 <20200708171621.GA780932@habkost.net> <20200708172653.GL3229307@redhat.com>
 <20200709094415.yvdh6hsfukqqeadp@sirius.home.kraxel.org>
In-Reply-To: <20200709094415.yvdh6hsfukqqeadp@sirius.home.kraxel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 9 Jul 2020 10:00:59 -0700
Message-ID: <CALMp9eQnrdu-9sZhW3aXpK4pizOW=8G=bj1wkumSgHVNfG=CbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cpu: Handle GUEST_MAXPHYADDR < HOST_MAXPHYADDR
 for hosts that don't support it
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, mtosatti@redhat.com, 
 Pedro Principeza <pedro.principeza@canonical.com>,
 kvm list <kvm@vger.kernel.org>, 
 libvir-list@redhat.com, Dann Frazier <dann.frazier@canonical.com>, 
 Guilherme Piccoli <gpiccoli@canonical.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Christian Ehrhardt <christian.ehrhardt@canonical.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Mohammed Gamal <mgamal@redhat.com>, 
 Laszlo Ersek <lersek@redhat.com>, fw@gpiccoli.net, rth@twiddle.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=jmattson@google.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
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

On Thu, Jul 9, 2020 at 2:44 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> (2) GUEST_MAXPHYADDR < HOST_MAXPHYADDR
>
>     Mostly fine.  Some edge cases, like different page fault errors for
>     addresses above GUEST_MAXPHYADDR and below HOST_MAXPHYADDR.  Which I
>     think Mohammed fixed in the kernel recently.

Doesn't this require intercepting MOV-to-CR3 when the guest is in PAE
mode, so that the hypervisor can validate the high bits in the PDPTEs?

