Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780A31518D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:28:35 +0100 (CET)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9U0I-0004BY-CF
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Tc4-0004vS-FU
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Tbx-0001dy-0s
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612879404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMqRnvVBAIUl679RTywkJe7iPD36vokFh6MNh04rUWY=;
 b=BTGZZWpgHSBodhTkRPIbS28x9izGoleV15nzix7c2l93qR2QlBMvG8cV4/pKB0uKhBk0+S
 cB8wesSCWPTWck0ueKy4eW0MT3VLk/r/q7a7Tmq4570q71w4uIAzU18UZGSWbA3ry5XdRN
 Fye3VVjxq7adTOVQQYfa0EcMjBuy3RU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-HNsAgvlROyGfC_dy4_9p1Q-1; Tue, 09 Feb 2021 09:03:15 -0500
X-MC-Unique: HNsAgvlROyGfC_dy4_9p1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A487B801981;
 Tue,  9 Feb 2021 14:03:14 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 859221820E;
 Tue,  9 Feb 2021 14:03:08 +0000 (UTC)
Date: Tue, 9 Feb 2021 14:03:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] travis: remove travis configuration and all
 references to Travis CI
Message-ID: <20210209140305.GK1166421@redhat.com>
References: <20210209135011.1224992-1-berrange@redhat.com>
 <20210209135011.1224992-3-berrange@redhat.com>
 <4e8492ab-9c10-d698-077a-9299b1a5b260@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4e8492ab-9c10-d698-077a-9299b1a5b260@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 02:58:46PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/9/21 2:50 PM, Daniel P. Berrangé wrote:
> > The Travis CI system QEMU has been using has removed the unlimited free
> > usage model, replacing it with a one-time only grant of CI minutes that
> > is not renewed. The QEMU CI jobs quickly exhaust maintainer's free CI
> > credits, leaving them unable to test with Travis. This is not a
> > sustainable situation, so we have no choice by to discontinue use of
> > Travis. GitLab CI is now the primary target, with Cirrus CI filling
> > in some platform gaps where needed.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  .travis.yml                        | 439 -----------------------------
> >  MAINTAINERS                        |   3 -
> >  configure                          |   1 -
> >  contrib/gitdm/filetypes.txt        |   2 +-
> >  scripts/travis/coverage-summary.sh |  27 --
> >  tests/docker/docker.py             |   2 +-
> >  tests/qemu-iotests/079             |   2 +-
> >  tests/test-util-filemonitor.c      |  11 -
> >  8 files changed, 3 insertions(+), 484 deletions(-)
> >  delete mode 100644 .travis.yml
> >  delete mode 100755 scripts/travis/coverage-summary.sh
> ...
> 
> > diff --git a/configure b/configure
> > index 7c496d81fc..058a7c7967 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4872,7 +4872,6 @@ fi
> >  ########################################
> >  # See if __attribute__((alias)) is supported.
> >  # This false for Xcode 9, but has been remedied for Xcode 10.
> 
> Not related to this patch, but I don't think Xcode 9 is supported
> anymore.
> 
> > -# Unfortunately, travis uses Xcode 9 by default.
> >  
> >  attralias=no
> >  cat > $TMPC << EOF
> 
> > diff --git a/scripts/travis/coverage-summary.sh b/scripts/travis/coverage-summary.sh
> > deleted file mode 100755
> > index d7086cf9ca..0000000000
> > --- a/scripts/travis/coverage-summary.sh
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -#!/bin/sh
> > -#
> > -# Author: Alex Bennée <alex.bennee@linaro.org>
> > -#
> > -# Summerise the state of code coverage with gcovr and tweak the output
> > -# to be more sane on Travis hosts. As we expect to be executed on a
> > -# throw away CI instance we do spam temp files all over the shop. You
> > -# most likely don't want to execute this script but just call gcovr
> > -# directly. See also "make coverage-report"
> > -#
> > -# This code is licensed under the GPL version 2 or later.  See
> > -# the COPYING file in the top-level directory.
> > -
> > -# first generate the coverage report
> > -gcovr -p -o raw-report.txt
> > -
> > -# strip the full-path and line markers
> > -sed s@$PWD\/@@ raw-report.txt | sed s/[0-9]\*[,-]//g > simplified.txt
> > -
> > -# reflow lines that got split
> > -awk '/.[ch]$/ { printf("%s", $0); next } 1' simplified.txt > rejoined.txt
> > -
> > -# columnify
> > -column -t rejoined.txt > final.txt
> > -
> > -# and dump, stripping out 0% coverage
> > -grep -v "0%" final.txt
> 
> This script can be run on other CI.
> 
> Keeping scripts/travis/coverage-summary.sh (moved to
> scripts/ci/coverage-summary.sh):

I notice that the "gcovr" program used here should be able to output
an XML document in a format that is supported by GitLab, which can
then pretty-display the results.

If we do that, perhaps we won't ned this coverage-summary script
for post-processing the text output format ?

I guess we need to make sure  gcovr is actually installed in all
our dockerfiles used by gitlab.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


