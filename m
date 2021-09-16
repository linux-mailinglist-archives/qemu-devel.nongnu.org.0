Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB140EA17
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:41:55 +0200 (CEST)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwKW-00024f-6o
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mQwHp-0000hP-U7
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mQwHl-00025T-RX
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631817540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bUCHdbeLh5/AwaYXFwV8UaVI3MXGRlu0iffEH3Cuuo4=;
 b=iVMUSjzE/kXDw2GDl7JmPh925+9RGYsujvRMXIn2G0AdMo/vHQZ/ymOTKd0XUrd0k0ajeC
 MOPrAxI5zuGkp+or1pc6ugm36WQj0h0LHw/BCdMVAMxcHSADMBDsaWjO2eucJa93CUjyoa
 N+pk7gaCfWO1XPFuCHjKcRH51tfCKGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-R5qmqeMENhWwYvB3WFa6sg-1; Thu, 16 Sep 2021 14:38:58 -0400
X-MC-Unique: R5qmqeMENhWwYvB3WFa6sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 603C7362F8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 18:38:57 +0000 (UTC)
Received: from localhost (unknown [10.22.8.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6C569FC8;
 Thu, 16 Sep 2021 18:38:57 +0000 (UTC)
Date: Thu, 16 Sep 2021 14:38:56 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] python: Update for pylint 2.10
Message-ID: <20210916183856.zksc533l4tlfsikq@habkost.net>
References: <20210916182248.721529-1-jsnow@redhat.com>
 <20210916182248.721529-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916182248.721529-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 02:22:47PM -0400, John Snow wrote:
> A few new annoyances. Of note is the new warning for an unspecified
> encoding when opening a text file, which actually does indicate a
> potentially real problem; see
> https://www.python.org/dev/peps/pep-0597/#motivation
> 
> Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> terminal output. Note that Python states: "language code and encoding
> may be None if their values cannot be determined" -- use a platform
> default as a backup.
> 
> Notes: Passing encoding=None will generate a suppressed warning on
> Python 3.10+ that 'None' should not be passed as the encoding
> argument. This behavior may be deprecated in the future and the default
> switched to be a ubiquitous UTF-8. Opting in to the locale default will
> be done by passing the encoding 'locale', but that isn't available in
> 3.6 through 3.9. Presumably this warning will be unsuppressed some time
> prior to the actual switch and we can re-investigate these issues at
> that time if necessary.

So, in the very worst case this will trigger a warning that is
currently suppressed.  And that will happen only if we are in the
unlikely situation where we have absolutely no information about
the encoding being used by other parts of the system.

Sounds reasonable to me, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 7 ++++++-
>  python/setup.cfg               | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index a7081b1845..34131884a5 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -19,6 +19,7 @@
>  
>  import errno
>  from itertools import chain
> +import locale
>  import logging
>  import os
>  import shutil
> @@ -290,8 +291,12 @@ def get_pid(self) -> Optional[int]:
>          return self._subp.pid
>  
>      def _load_io_log(self) -> None:
> +        # Assume that the output encoding of QEMU's terminal output is
> +        # defined by our locale. If indeterminate, allow open() to fall
> +        # back to the platform default.
> +        _, encoding = locale.getlocale()
>          if self._qemu_log_path is not None:
> -            with open(self._qemu_log_path, "r") as iolog:
> +            with open(self._qemu_log_path, "r", encoding=encoding) as iolog:
>                  self._iolog = iolog.read()
>  
>      @property
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 83909c1c97..0f0cab098f 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -104,6 +104,7 @@ good-names=i,
>  [pylint.similarities]
>  # Ignore imports when computing similarities.
>  ignore-imports=yes
> +ignore-signatures=yes
>  
>  # Minimum lines number of a similarity.
>  # TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
> -- 
> 2.31.1
> 

-- 
Eduardo


