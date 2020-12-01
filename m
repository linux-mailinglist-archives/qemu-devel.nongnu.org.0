Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6C2CA1C8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:52:12 +0100 (CET)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4CZ-0002TU-L9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk4BS-0001zZ-Ve
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk4BQ-0005as-A2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606823458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ay9ItD6Kzh25y4pze0iPQOTVfknUuyVxyktssHh8Ios=;
 b=F2rhxDxGoGZVg/V+i793HglBmDFm137/eFHDSXSeoisZr2Ln30yrtEv+7mIpz0BzjOWnzs
 qKJPFeQLG5VCFpe867JlwBe8SIyPcJpJkQSV67OdnqEk3DnC0ZD+IdXPhno0ap/l2t4BC+
 fegTSX2f+62n45kcmzMqOIP24Yfg2/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-CgMN2nTtMV2UUlP0nhldsA-1; Tue, 01 Dec 2020 06:50:57 -0500
X-MC-Unique: CgMN2nTtMV2UUlP0nhldsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 905BF817B91;
 Tue,  1 Dec 2020 11:50:55 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB4F6086F;
 Tue,  1 Dec 2020 11:50:49 +0000 (UTC)
Date: Tue, 1 Dec 2020 11:50:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 01/11] memattrs: add debug attribute
Message-ID: <20201201115047.GA15055@work-vm>
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
 <CAFEAcA8eiyzUbHXQip1sT_TrT+Mfv-WG8cSMmM-w_eOFShAMzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8eiyzUbHXQip1sT_TrT+Mfv-WG8cSMmM-w_eOFShAMzQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 ssg.sos.patches@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 16 Nov 2020 at 19:28, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> >
> > From: Brijesh Singh <brijesh.singh@amd.com>
> >
> > From: Brijesh Singh <brijesh.singh@amd.com>
> >
> > Extend the MemTxAttrs to include a 'debug' flag. The flag can be used as
> > general indicator that operation was triggered by the debugger.
> >
> > A subsequent patch will set the debug=1 when issuing a memory access
> > from the gdbstub or HMP commands. This is a prerequisite to support
> > debugging an encrypted guest. When a request with debug=1 is seen, the
> > encryption APIs will be used to access the guest memory.
> 
> So, what counts as "debug" here, and why are debug requests
> special? If "debug=1" means "can actually get at the guest memory",
> why wouldn't every device model want to use it?

SEV has a flag that the guest-owner can set on a VM to enable debug;
it's rare for it to be enabled; so it's not suitable for use by normal
devices.  It's only there for debug if the guest owner allows you to.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


