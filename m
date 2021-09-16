Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58040DEC2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:55:47 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtjm-0003bg-GP
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQtTr-0001S9-AM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQtTp-0001BI-84
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631806756;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGZnR418PGCFlYSm2qeQC+EAo0GuxrqqM+EMUQWr4mc=;
 b=TNLWj+LHpMFtUbOYicwl5Snz8msUaTXpRGz6azNwE7OWCkrJqqfk4BqAD2qwl2bmc5Erii
 NZ7MrzVlkBi4/PCPtlovTxywklxo2xnQtx9Uzuw0P6W83qK/EkZkstirsd/ZACPaX//Ts7
 WHPceDb3yYY/lXr4VyZHBMh6Pk7QU3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-QxiB_-riPJi73xAEpoH2GA-1; Thu, 16 Sep 2021 11:39:11 -0400
X-MC-Unique: QxiB_-riPJi73xAEpoH2GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44EE810247A6;
 Thu, 16 Sep 2021 15:39:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 809555C1CF;
 Thu, 16 Sep 2021 15:39:08 +0000 (UTC)
Date: Thu, 16 Sep 2021 16:39:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/1] python: Update for pylint 2.10
Message-ID: <YUNlGvkSDtynuH7N@redhat.com>
References: <20210915154031.321592-1-jsnow@redhat.com>
 <20210915154031.321592-2-jsnow@redhat.com>
 <YUM/n/QWlxLvp3lw@redhat.com>
 <CAFn=p-bNB9s8LPg_Y6SjD-KPdn7boauphTb8iqBin_evxRRJqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bNB9s8LPg_Y6SjD-KPdn7boauphTb8iqBin_evxRRJqw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 09:42:30AM -0400, John Snow wrote:
> On Thu, Sep 16, 2021 at 8:59 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow wrote:
> > > A few new annoyances. Of note is the new warning for an unspecified
> > > encoding when opening a text file, which actually does indicate a
> > > potentially real problem; see
> > > https://www.python.org/dev/peps/pep-0597/#motivation
> > >
> > > Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> > > terminal output. Note that Python states: "language code and encoding
> > > may be None if their values cannot be determined" -- use a platform
> > > default as a backup.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  python/qemu/machine/machine.py | 9 ++++++++-
> > >  python/setup.cfg               | 1 +
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/python/qemu/machine/machine.py
> > b/python/qemu/machine/machine.py
> > > index a7081b1845..51b6e79a13 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -19,6 +19,7 @@
> > >
> > >  import errno
> > >  from itertools import chain
> > > +import locale
> > >  import logging
> > >  import os
> > >  import shutil
> > > @@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
> > >          return self._subp.pid
> > >
> > >      def _load_io_log(self) -> None:
> > > +        # Assume that the output encoding of QEMU's terminal output
> > > +        # is defined by our locale. If indeterminate, use a platform
> > default.
> > > +        _, encoding = locale.getlocale()
> > > +        if encoding is None:
> > > +            encoding = locale.getpreferredencoding(do_setlocale=False)
> >
> > Do we really need this getpreferredencoding ?  IIUC, this is a sign
> > that the application is buggy by not calling
> >
> >   locale.setlocale(locale.LC_ALL, '')
> >
> > during its main() method, which I think we can just delegate to the
> > code in question to fix. Missing setlocale will affect everything
> > they run, so doing workarounds in only 1 place is not worth it IMHO
> >
> >
> I genuinely don't know! (And, I try to keep the Python code free from
> assuming Linux as much as I can help it.)
> 
> Python's getlocale documentation states: "language code and encoding may be
> None if their values cannot be determined."
> https://docs.python.org/3/library/locale.html#locale.getlocale
> 
> But it is quiet as to the circumstances under which this may happen.
> Browsing the cpython source code, (3.9ish):
> 
> ```
> def getlocale(category=LC_CTYPE):
>     localename = _setlocale(category)
>     if category == LC_ALL and ';' in localename:
>         raise TypeError('category LC_ALL is not supported')
>     return _parse_localename(localename)
> ```
> _setlocale is ultimately a call to (I think) _localemodule.c's
> PyLocale_setlocale(PyObject *self, PyObject *args) C function.
> It calls `result = setlocale(category, locale)` where the category is going
> to be LC_CTYPE, so this should be equivalent to locale(3) (LC_CTYPE, NULL).
> 
> locale(3) says that "The return value is NULL if the request cannot be
> honored."
> 
> Python parses that string according to _parse_localename, which in turn
> calls normalize(localename).
> Normalization looks quite involved, but has a fallback of returning the
> string verbatim. If the normalized locale string is "C", we return the
> tuple (None, None)!
> 
> So I figured there was a non-zero chance that we'd see a value of `None`
> here.
> 
> Source code is in cpython/Lib/locale.py and cpython/Modules/_localemodule.c
> if you want to nose around yourself.
> 
> I also have no idea how this will all shake out on Windows, so I decided to
> add the fallback here just in case. (Does the Python package work on
> Windows? I don't know, but I avoid assuming it won't EVER run there...
> Certainly, I have an interest in having the QMP packages I am building work
> on all platforms.)
> 
> Thoughts?

Well this machine.py is using UNIX domain sockets and FD passing,
so Windows is out of the question.

I'd be inclined to just keep it simple unless someone reports a
real bug with it.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


