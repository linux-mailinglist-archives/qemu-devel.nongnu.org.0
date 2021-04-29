Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E336ED47
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:20:18 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8Sf-0000aa-Pc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc8RQ-0008PO-DA
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc8RO-0000da-OL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619709537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nI5Wee8n+rzelknQJpg7wWjTtersx+6unNzJz84cJ4g=;
 b=WsestubKiUEjUOseGRtnIWbxi7f7mH5cJ98iq3kp8RwKot0ZqSToHCRwmgVWep9T0v9fdW
 Fb6bPcPmu28SNursTJ4BCh7MsnHyPpjxFj9vkpuIyqcVun0kZfLla41qoNLY3o2zkIDiJa
 wjRjWd08lAuUOTBZWCh3no1DNFIKqH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-GFgbDhrqOLmGn2kF0iDR2A-1; Thu, 29 Apr 2021 11:18:55 -0400
X-MC-Unique: GFgbDhrqOLmGn2kF0iDR2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4457EA40CA;
 Thu, 29 Apr 2021 15:18:54 +0000 (UTC)
Received: from work-vm (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69E59100763B;
 Thu, 29 Apr 2021 15:18:40 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:18:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] meson: Select 'have_system' when virtiofsd is
 enabled
Message-ID: <YIrOTUsI4pAhBSnO@work-vm>
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-2-philmd@redhat.com>
 <4823bd07-2b96-5503-7959-853fc61372ef@redhat.com>
 <2656ae7e-248d-90e3-a1ae-b13a78226ad0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2656ae7e-248d-90e3-a1ae-b13a78226ad0@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> On 4/29/21 3:50 PM, Connor Kuehl wrote:
> > On 4/29/21 3:33 AM, Philippe Mathieu-Daudé wrote:
> >> When not explicitly select a sysemu target and building virtiofsd,
> >> the seccomp/cap-ng libraries are not resolved, leading to this error:
> >>
> >>   $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
> >>   tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel
> >>
> >> Fix by enabling sysemu (have_system) when virtiofsd is built.
> >>
> >> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  meson.build | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index c6f4b0cf5e8..f858935ad95 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -51,6 +51,8 @@
> >>    have_system = have_system or target.endswith('-softmmu')
> >>  endforeach
> >>  have_tools = 'CONFIG_TOOLS' in config_host
> >> +# virtiofsd depends on sysemu
> >> +have_system = have_system or not get_option('virtiofsd').disabled()
> > 
> > I don't think we should satisfy virtiofsd dependencies transiently by
> > depending on system emulation targets.
> > 
> > It's my understanding (and I'm happy to be corrected on this) that the
> > virtiofsd binary is orthogonal to system emulation tools. Consider a
> > situation in which someone wants to develop virtiofsd but doesn't want
> > to wait for the rest of QEMU to build and instead use their own
> > qemu-system-x86_64 installed by their distro.
> 
> This is what I understood in your previous thread with Mahmoud.
> 
> Peter questioned this orthogonality in v1, asking why virtiofsd is
> in the QEMU repository then...

People were insisting that there was an implementation in when accepting
the qemu side patches.

Dave


> > Connor
> > 
> >>  have_block = have_system or have_tools
> >>  
> >>  python = import('python').find_installation()
> >>
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


