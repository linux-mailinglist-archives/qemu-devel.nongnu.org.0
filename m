Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFD5B693B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:11:42 +0200 (CEST)
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY11B-0005p3-Mq
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oY0r1-0001df-UR
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oY0qv-0007mT-59
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663056063;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFByvypdq3GZD+RTyNd9zkEJHgwJS4tjmZCa2KzOis4=;
 b=WXWk728A4GB/joFlycPjrsKPY9YO5SwGNqeDaeIUxyC3nIvTkEP71qYohHDPRqKEWnJmYu
 yi59Ol7PN+gFG9NpFdTDeM6PahlOwm/YowUR3LQ/ypFzv+J7Sk72p3mN3/h9OmjuQxfubC
 1XqGxU/FplQRBwlfH5odQAMcOjMJd+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-AT29kLTBMnOl8ZND5pwJXQ-1; Tue, 13 Sep 2022 04:00:58 -0400
X-MC-Unique: AT29kLTBMnOl8ZND5pwJXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E6821C14B62;
 Tue, 13 Sep 2022 08:00:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7802440C6EC2;
 Tue, 13 Sep 2022 08:00:52 +0000 (UTC)
Date: Tue, 13 Sep 2022 09:00:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Mark Burton <mburton@qti.qualcomm.com>, Bill Mills <bill.mills@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Luc Michel <luc@lmichel.fr>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Alessandro Di Federico <ale@rev.ng>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Message-ID: <YyA4sbUU14R6lqdN@redhat.com>
References: <87a67kphih.fsf@linaro.org>
 <CAHDbmO3CT+7q19gj_037cBt2c4wVEEVMTDr_5Lj8-uWXEt5xRw@mail.gmail.com>
 <a209c249-bdd2-f011-a1ca-139f073b92cb@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a209c249-bdd2-f011-a1ca-139f073b92cb@kaod.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 13, 2022 at 09:16:07AM +0200, Cédric Le Goater wrote:
> On 9/13/22 09:12, Alex Bennée wrote:
> > The BoF session will be in Lifey A (the big hall) this afternoon. I thought being able to sit around tables while we discuss things would make things a bit easier. We can share note taking on the etherpad:
> > 
> > https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022 <https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022>
> > 
> > I'll run a HO at: https://meet.google.com/rac-axef-xvv <https://meet.google.com/rac-axef-xvv>
> 
> Thanks for that. I will try to join. What time approximately ?

The Tuesday BoF slot is 17:40-18:10

  https://events.linuxfoundation.org/kvm-forum/program/schedule/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


