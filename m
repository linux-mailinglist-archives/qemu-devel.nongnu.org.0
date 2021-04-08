Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04503357E9F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:01:14 +0200 (CEST)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQXJ-0001g5-3M
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUQUc-0000kI-BY
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUQUa-0006E1-9O
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617872303;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qAB82rB1t+tx8vqvSO5xw622pbkhvxI2CdU9o3p0oWs=;
 b=BukzwQYYV1v5B1IQwdHi3CR0IBrsIvbssTTWmcPNRQsfl8/kZ5AFxypaZIQQDR9NQfoOyx
 WYvApHFXm+xRNf/UMC3N/b93AFlL39HApRNaj2oS6yC2mYacFuy1T1w4+iWpkNqHWBuJxr
 KJIjb2xSMcFB792dFRWzTnmF7LyE2kE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-VTv1GfryPQCCaEFDp6zWXA-1; Thu, 08 Apr 2021 04:58:19 -0400
X-MC-Unique: VTv1GfryPQCCaEFDp6zWXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8F479EC0;
 Thu,  8 Apr 2021 08:58:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1E11037EBE;
 Thu,  8 Apr 2021 08:58:16 +0000 (UTC)
Date: Thu, 8 Apr 2021 09:58:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
Message-ID: <YG7FpVcY72KhQbBJ@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
 <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 04:44:25PM +0000, Peter Maydell wrote:
> On Fri, 26 Mar 2021 at 16:33, John Snow <jsnow@redhat.com> wrote:
> > Being less terse about it: Mostly, I don't like how it enforces this
> > column width even for indented structures. Generally, we claim that 72
> > columns is "comfortable to read" and I agree.
> >
> >                                     However, when we start in a margin, I
> >                                     am not convinced that this is
> >                                     actually more readable than the
> >                                     alternative. We aren't using our full
> >                                     72 characters here.
> 
> I agree, and I don't see any strong reason to hold our Python
> code to a different standard to the rest of our codebase as
> regards line length and comment standards.

There's one small difference with python vs the rest of the codebase when
it comes to API doc strings specifically. eg we have a docstring API comment
in python/qemu/machine.py:

class QEMUMachine:
    """
    A QEMU VM.

    Use this object as a context manager to ensure
    the QEMU process terminates::

        with VM(binary) as vm:
            ...
        # vm is guaranteed to be shut down here
    """

This formatting, including line breaks, is preserved as-is when a user
requests viewing of the help:

>>> print(help(qemu.machine.QEMUMachine))

Help on class QEMUMachine in module qemu.machine:

class QEMUMachine(builtins.object)
 |  QEMUMachine(binary: str, args: Sequence[str] = (), wrapper: Sequence[str] = (), name: Optional[str] = None, test_dir: str = '/var/tmp', monitor_address: Union[Tuple[str, str], str, NoneType] = None, socket_scm_helper: Optional[str] = None, sock_dir: Optional[str] = None, drain_console: bool = False, console_log: Optional[str] = None)
 |  
 |  A QEMU VM.
 |  
 |  Use this object as a context manager to ensure
 |  the QEMU process terminates::
 |  
 |      with VM(binary) as vm:
 |          ...
 |      # vm is guaranteed to be shut down here
 |  
 |  Methods defined here:
 |  


IOW, while we as QEMU maintainers may not care about keeping to a narrow
line width, with API docstrings, we're also declaring that none of the
users of the python APIs can care either. These docstrings are never
reflowed, so they can end up wrapping if the user's terminal is narrow
which looks very ugly.


So this python API docstring scenario is slightly different from our
main codebase, where majority of comments are only ever going to be seen
by QEMU maintainers, and where C API doc strings don't preserve formatting,
because they're turned into HTML and re-flowed.

Having said all that, I still don't think we need to restrict ourselves
to 72 characters. This is not the 1980's with people using text terminals
with physical size constraints. I think it is fine if we let python
docstrings get larger - especially if the docstrings are already indented
4/8/12 spaces due to the code indent context, because the code indent is
removed when comments are displayed. I think a 100 char line limit would
be fine and still not cause wrapping when using python live help().

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


