Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1057176F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:35:14 +0200 (CEST)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDEX-0004di-JL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBDAz-0007gs-1j
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBDAv-0002uL-4F
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657621886;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Esm+4otGl9dvM3CmdyjexSop2mJhhgaZ7sb1onAtT5I=;
 b=dnOn+ypSkFWkgEDdwCxoxudMTL4ASL/vXXKlFel6J5MILFUGs4iiM9iUAQu7B8T3mmER+r
 6MMPUA+do/+/wsdcGeCHMt3MySEjNTE5jByswcG8JjryODZ116vuBKhG2G8BfNVFT7HM9c
 1CxSlVyNsnDWMT1mcvPIRDtjfSfijiA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-JMQm22AAN1KWpSiUCxnR8w-1; Tue, 12 Jul 2022 06:31:19 -0400
X-MC-Unique: JMQm22AAN1KWpSiUCxnR8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E2143810D37;
 Tue, 12 Jul 2022 10:31:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 808952026D64;
 Tue, 12 Jul 2022 10:31:18 +0000 (UTC)
Date: Tue, 12 Jul 2022 11:31:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [COMMITTED 0/3] build fixes
Message-ID: <Ys1Ncx+gyEBw/uIM@redhat.com>
References: <20220712095901.212353-1-richard.henderson@linaro.org>
 <Ys1JMetNPT47lpbV@redhat.com>
 <d9bd8b54-868a-6f0e-09b9-754f23c12cbb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9bd8b54-868a-6f0e-09b9-754f23c12cbb@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 12, 2022 at 03:56:54PM +0530, Richard Henderson wrote:
> On 7/12/22 15:43, Daniel P. Berrangé wrote:
> > On Tue, Jul 12, 2022 at 03:28:58PM +0530, Richard Henderson wrote:
> > > This is a collection of fixes required to get CI back to green.
> > > Given that 2 of 3 apply to cirrus, I had to push them to staging to
> > > even try them.  Since it worked, I've now pushed them to master.
> > 
> > FWIW, it is possible to test Cirrus CI fixes in your own personal
> > fork too, but it needs a little extra setup first, detailed in
> > 
> >    .gitlab-ci.d/cirrus/README.rst
> 
> How many of the 'github' strings therein should really be 'gitlab'?

None actually, this is all part of the (gross) hack. Cirrus CI officially
only integrates with GitHub, so we need a dummy GitHub repo there. Once
the job starts though, it actually pulls the real code from gitlab.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


