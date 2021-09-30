Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5B41E155
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 20:39:18 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW0xg-0006sf-QN
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 14:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mW0wF-00060v-Ru
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mW0wA-0000Ux-R7
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633027060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+9XnuSK0Z5tuWIgc2XClN+ybyTmXcrEtQGSmVKFXqg=;
 b=TmdzeOkMFYI1CU8RJrdXOR896NgKiUBmf7X7o67vUAtIgihQL036xhYpjnSLBjvZfvkJGO
 ykLaMuOVDM6UGWwX2WK5ZeM/VKyPZfo4m1CmX+PEhdT7V1P31t4uG3Z/v3qRl+QRurORoA
 svwWgP2VTeCAUqLqcFTfgi91GEuvttA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-svWf7UQ9OQSITBNuDtwLwg-1; Thu, 30 Sep 2021 14:37:38 -0400
X-MC-Unique: svWf7UQ9OQSITBNuDtwLwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02199126D;
 Thu, 30 Sep 2021 18:37:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C50135F4E8;
 Thu, 30 Sep 2021 18:37:28 +0000 (UTC)
Date: Thu, 30 Sep 2021 19:37:27 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v3] nbd/server: Add --selinux-label option
Message-ID: <20210930183727.GD3361@redhat.com>
References: <20210930084701.3899578-1-rjones@redhat.com>
 <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
 <CAKJDGDbtCp-aecYPs-4zK4dojo=uhez=_T2iL2yKx08guuXKbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbtCp-aecYPs-4zK4dojo=uhez=_T2iL2yKx08guuXKbA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 02:00:11PM -0300, Willian Rampazzo wrote:
> On Thu, Sep 30, 2021 at 5:55 AM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> >
> > 9/30/21 11:47, Richard W.M. Jones wrote:
> > > Under SELinux, Unix domain sockets have two labels.  One is on the
> > > disk and can be set with commands such as chcon(1).  There is a
> > > different label stored in memory (called the process label).  This can
> > > only be set by the process creating the socket.  When using SELinux +
> > > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > > you must set both labels correctly first.
> > >
> > > For qemu-nbd the options to set the second label are awkward.  You can
> > > create the socket in a wrapper program and then exec into qemu-nbd.
> > > Or you could try something with LD_PRELOAD.
> > >
> > > This commit adds the ability to set the label straightforwardly on the
> > > command line, via the new --selinux-label flag.  (The name of the flag
> > > is the same as the equivalent nbdkit option.)
> > >
> > > A worked example showing how to use the new option can be found in
> > > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > >
> > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> >
> > this should be Reviewed-by?
> 
> Maybe, because of this:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07081.html
> 
> I got confused with this v3.

Yes, I'd somehow lost the original patch and picked it up from Eric's
queue to make v3.

Having said that I'm not sure what the objection above means.  Do you
mean Eric's tag should be Reviewed-by instead of S-o-b?  (And why?)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


