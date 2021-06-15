Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0A3A77FE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:30:15 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3WY-0002uA-6o
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lt3VN-0001Yu-DN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lt3VJ-0001Ed-Ph
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623742136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mdiwAU2JAfZjSaDBh+GJL4FE8HT5szC21Ux1lmirwto=;
 b=RVRBfkFkMbSSeG5XwFHWxt6rXe6PZPpBepbCpqoTbANbwUMjd1PlJ9xoJga+D1hTFGHuZC
 JOOV3abReFAf0skJbgvlJ1ReaUAfkkCwO3txyrmr4C6lHsnBPRfD8V8KeZvkV8l4AIO5DK
 MAlo/HytC/IcoUArP4WZ1gr067AlKeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-xLewwAJeMlu5jRHRb2yOeA-1; Tue, 15 Jun 2021 03:28:54 -0400
X-MC-Unique: xLewwAJeMlu5jRHRb2yOeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F5F9F939;
 Tue, 15 Jun 2021 07:28:51 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 960825D9DC;
 Tue, 15 Jun 2021 07:28:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os,
 and accel labels
In-Reply-To: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Organization: Red Hat GmbH
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 15 Jun 2021 09:28:45 +0200
Message-ID: <87k0mvy4b6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14 2021, John Snow <jsnow@redhat.com> wrote:

(...)

> # OS
>
> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
>
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A
>
> Multiple OS labels can be applied to an issue.
>
> Originally, we kept this label somewhat vague and have been using it to 
> identify both the host AND guest involved with an issue.
>
> Stefan Weil has requested that we refactor this to separate the concerns 
> so that he can identify issues where Windows is the host without wading 
> through numerous reports where Windows is merely the guest. Reasonable 
> request.
>
> Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux, 
> Windows, macOS}?

Yes to splitting and using something like "hostOS:" and "guestOS:", as
had already been suggested downthread.

For the guest OS, I think we also want "Other". It can be valuable to
know that the guest OS might be doing something that is not done by the
OSes usually run as a guest, so I think this is useful information.

What about linux-user? We probably can't categorize what is being run
very neatly.

>
> This isn't too hard to do at initial triage time, but we'll need to sift 
> through the bugs we've labeled so far and re-label them. Help on this 
> would be appreciated. I would prefer we create a *new* set of labels and 
> then draw down on the old labels instead of just renaming them. That 
> way, the old label can be used as a re-triage queue.
>
>
> # arch/target
>
> Currently "target: XXX" for alpha, arm, avr, cris, hexagon, hppa, i386, 
> m68k, microblaze, mips, nios2, openrisc, ppc, riscv, rx, s390x, sh4, 
> sparc, tricore, xtensa.
>
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=target%3A
>
> The names map 1:1 to the directories in target/.
> The names in [square brackets] in the label descriptions correspond 1:1 
> with the SysEmuTarget QAPI enum defined in qapi/machine.json.
>
> Multiple target labels can be applied to an issue. Originally, this was 
> named "arch", so this was to allow multiple architectures to be 
> specified to cover the host/guest environment. If we disentangle this, 
> we may still want to allow multiple labels to cover bugs that might 
> affect multiple targets, though that case might be rare.
>
> Recently, we renamed this from "arch: XXX" to "target: XXX", though the 
> label had been being used for both the host and guest architecture, so 
> this will need to be re-audited to remove cases where the label had been 
> applied for the host architecture.
>
> We probably want to keep a set of labels that apply to the host 
> architecture. These are useful for build failures, environment setup 
> issues, or just documenting the exact environment on which an issue was 
> observed.
>
> We won't likely require the full set of targets to be duplicated for 
> this purpose: possibly just the most common ones. I assume those are:
>
> arm, i386, ppc, s390x
>
> How should we tag those? "host-arch: XXX"?

host-arch sounds good; maybe add a catch-all "host-arch: other" to catch
uncommon host architectures?

>
> What I would like to avoid is creating labels like "host: windows-i386" 
> where the cross matrix of ({host,guest} X OS x ARCH) starts to require 
> ever-increasing specificity of initial triage labels and may increase 
> the risk of overly-specified bugs going unnoticed. Maybe my concern is 
> unfounded, but I think the over-specificity will hurt more than help at 
> this stage.

I think having "host-arch:" and "hostOS:" is enough.


