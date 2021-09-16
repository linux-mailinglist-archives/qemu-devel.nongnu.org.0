Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C740DA94
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:03:31 +0200 (CEST)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQr34-0004Du-SZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQqzD-0001JP-Nd
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQqz5-0003Sh-9P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631797162;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CEImmixDLEcbAuVQodxqOvRJmrCOWYTqsmoe7OD1DBc=;
 b=BehLZpLJPZ7HrrwxYarDqy1ytJC2b4ozd/cV+uhcSl5/5ou0QyxiTQB8yXroXXVG3ZBash
 LKwE+kgR2apH98FudYaq2SImE1LbA/7fx2Mp108Po6LscjaeN2vdTlRgssZx5gQUn3hevk
 Y3RxjpTGSVnJv6ANFRXhGFveCp0Lugs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-jen5_laiNlSR9soNXy4KMg-1; Thu, 16 Sep 2021 08:59:16 -0400
X-MC-Unique: jen5_laiNlSR9soNXy4KMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00AD9126B;
 Thu, 16 Sep 2021 12:59:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F5A5D6D5;
 Thu, 16 Sep 2021 12:59:14 +0000 (UTC)
Date: Thu, 16 Sep 2021 13:59:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/1] python: Update for pylint 2.10
Message-ID: <YUM/n/QWlxLvp3lw@redhat.com>
References: <20210915154031.321592-1-jsnow@redhat.com>
 <20210915154031.321592-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915154031.321592-2-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow wrote:
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
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 9 ++++++++-
>  python/setup.cfg               | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index a7081b1845..51b6e79a13 100644
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
> @@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
>          return self._subp.pid
>  
>      def _load_io_log(self) -> None:
> +        # Assume that the output encoding of QEMU's terminal output
> +        # is defined by our locale. If indeterminate, use a platform default.
> +        _, encoding = locale.getlocale()
> +        if encoding is None:
> +            encoding = locale.getpreferredencoding(do_setlocale=False)

Do we really need this getpreferredencoding ?  IIUC, this is a sign
that the application is buggy by not calling

  locale.setlocale(locale.LC_ALL, '')

during its main() method, which I think we can just delegate to the
code in question to fix. Missing setlocale will affect everything
they run, so doing workarounds in only 1 place is not worth it IMHO

>          if self._qemu_log_path is not None:
> -            with open(self._qemu_log_path, "r") as iolog:
> +            with open(self._qemu_log_path, "r",
> +                      encoding=encoding) as iolog:
>                  self._iolog = iolog.read()
Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


