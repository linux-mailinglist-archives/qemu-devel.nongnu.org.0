Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1474954E6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:33:29 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdBY-00006b-FK
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAX3c-0001YD-Qr
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:00:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAX3Y-00063s-EO
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642683645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Noe12sQe/XMn7uQk2MmjrF7/Y0Sj1B4XcqzN+SKnCHk=;
 b=iTV6WwSDKoT6FCIDi3jK3P3Aa8DQb+V2LV6jVP9RrNzZ5jToUe4jw3DDZ4olu4WVV85gdH
 jvYF2CNzdGhCi5P9F+IdWGkdJv6sutnhj4/rvaB/v9DoMRFMsFQyo/YrqKwImcJuMfp8wP
 YYQpbRKOvJ+j/r20kgFah91LYU2H5Zk=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-L8QLM0fHNouXjA952HOf9Q-1; Thu, 20 Jan 2022 08:00:38 -0500
X-MC-Unique: L8QLM0fHNouXjA952HOf9Q-1
Received: by mail-oo1-f72.google.com with SMTP id
 a7-20020a4ad5c7000000b002dacfc3d40cso1138708oot.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Noe12sQe/XMn7uQk2MmjrF7/Y0Sj1B4XcqzN+SKnCHk=;
 b=vBbkA6S5G0sZaXMSGjQEOXAkLj8rK0iEELwtdcSIHZhNJzpv/r6XmlBlLZ0pCNc2sV
 lxFg1w30ZA5PUTCE07NfHbYSSQs86Yf/metOq5uXGqkDgarpNnhegEXNeKWKLTVTGPRS
 O0hCJA6fjE6gwEn5ZkLwdmTq+bSCAstlpU9B1w88vRWudaQWD/l3K4v+BJicQSpbwk4E
 N1RnaBrzc87E4a6gW1MSpv4DAGE2oVDAQhm5XDmR/Pgs4C19Sa7LLpl+roG8jndtX9Xs
 GEqKqVaoDjZ59wl/iypipe88MY5DRivaui0puvHs/DOI2fzLAOIXIs0ONspcqqEKM7II
 vyiQ==
X-Gm-Message-State: AOAM531Ujt5CrV9/pbkn/ov3smxLKe1sQWScN/+9psmX6dhJsJj9dLO/
 I32PxNDxPuWzijksfY7EfRARF7Jf4STWXpZ5yoY6z5X2RZVTklC1g2bqfe1oi4AVIxbW6JWZ+iS
 y2BPiz4FzKDInKeA=
X-Received: by 2002:a05:6830:242f:: with SMTP id
 k15mr7037975ots.298.1642683637310; 
 Thu, 20 Jan 2022 05:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYspnb1W3S5rrwxcxkPdDDSwSAMLaVLcxckf0clCXRMsqF26H7Mm7q+JuqYCYTsVZrAXnnZw==
X-Received: by 2002:a05:6830:242f:: with SMTP id
 k15mr7037947ots.298.1642683637069; 
 Thu, 20 Jan 2022 05:00:37 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id bj19sm1630351oib.9.2022.01.20.05.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:00:36 -0800 (PST)
Date: Thu, 20 Jan 2022 09:58:24 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Message-ID: <20220120125824.42w63qqc2khvxpot@laptop.redhat>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
 <f2c56e2d-572a-09f9-8f46-6410275e347b@amsat.org>
MIME-Version: 1.0
In-Reply-To: <f2c56e2d-572a-09f9-8f46-6410275e347b@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 06:13:48AM +0100, Philippe Mathieu-Daudé wrote:
> On 18/1/22 00:27, John Snow wrote:
> > On Mon, Jan 17, 2022 at 9:11 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > 
> > > With the current 'qmp-shell' tool developers must first spawn QEMU with
> > > a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> > > pointing to the right socket.
> > > 
> > > With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> > > just pass the QEMU command and arguments they want. The program will
> > > listen on a UNIX socket and tell QEMU to connect QMP to that.
> > > 
> > > For example, this:
> > > 
> > >   # qmp-shell-wrap -- qemu-system-x86_64 -display none
> > > 
> > > Is roughly equivalent of running:
> > > 
> > >   # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
> > >   # qmp-shell qmp-shell-1234
> > > 
> > > Except that 'qmp-shell-wrap' switches the socket peers around so that
> > > it is the UNIX socket server and QEMU is the socket client. This makes
> > > QEMU reliably go away when qmp-shell-wrap exits, closing the server
> > > socket.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >   python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++---
> > >   scripts/qmp/qmp-shell-wrap   | 11 +++++++
> > >   2 files changed, 68 insertions(+), 4 deletions(-)
> > >   create mode 100755 scripts/qmp/qmp-shell-wrap
> 
> > > diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
> > > new file mode 100755
> > > index 0000000000..9e94da114f
> > > --- /dev/null
> > > +++ b/scripts/qmp/qmp-shell-wrap
> > > @@ -0,0 +1,11 @@
> > > +#!/usr/bin/env python3
> > > +
> > > +import os
> > > +import sys
> > > +
> > > +sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> > > +from qemu.qmp import qmp_shell
> > > +
> > > +
> > > +if __name__ == '__main__':
> > > +    qmp_shell.main_wrap()
> > > --
> > > 2.33.1
> > > 
> > 
> > Adds some new failures to the python linters; try "make check-dev" in
> > the python sub-dir.
> > 
> > ... Though, due to a bug in avocado, this helpfully doesn't actually
> > show you the failure output right now ...
> > 
> > making this little edit should fix that, sorry for the inconvenience here.
> > 
> > diff --git a/python/avocado.cfg b/python/avocado.cfg
> > index c7722e7ecd..a460420059 100644
> > --- a/python/avocado.cfg
> > +++ b/python/avocado.cfg
> > @@ -1,5 +1,5 @@
> >   [run]
> > -test_runner = runner
> > +test_runner = nrunner
> 
> Cc'ing Beraldo, Willian once told me the nrunner switch was scheduled
> for QEMU next release.

Thanks Philippe, for the Cc.

We solved a few issues on the nrunner side recently and implemented a
set of changes regarding the logging logic aimed to improve the
debugging process.

Currently, our legacy runner ('runner') is in "dismantle mode," and its
usage with the latest versions of Avocado is discouraged.

Because of the nrunner's new architecture and how Coverage works [1], we
spotted an issue when using nrunner + Coverage [2]. We are also
investigating a possible alternative [3] in parallel.

[1] - https://coverage.readthedocs.io/en/stable/subprocess.html
[2] - https://github.com/avocado-framework/avocado/issues/4765
[3] - https://gitlab.com/beraldoleal/qemu/-/commit/c7aeb34505aab4357421890575cc9ddd7e83d04f

--
Beraldo


