Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C039080E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:46:05 +0200 (CEST)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llb80-0005PY-My
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llb5z-0002Mz-24
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llb5v-0005CJ-PM
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621964634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JSJZ7JPqsjQm7TPWstMXXXjT3psjBrXjGCIpoXZWGQ=;
 b=Lj4Aqgh0iGXzOZ5E73/VTFESrJfZxsuWAV5feSJ7SVruFe65EN13NG+nrCsV0XpoTh6LKg
 Y+fIqoCgfOU7jD4s04IDLHITLYdCGVycW/HJhKxO5A6NgDqPp36Vw35lNLp9A3dL7P5ors
 UUilFy4gEG784b2TUyj5NY6zPFofUBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-q9fobHlrNyWXxBtj-fRWsA-1; Tue, 25 May 2021 13:43:53 -0400
X-MC-Unique: q9fobHlrNyWXxBtj-fRWsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD473107ACE4;
 Tue, 25 May 2021 17:43:51 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0A0100E113;
 Tue, 25 May 2021 17:43:43 +0000 (UTC)
Subject: Re: [PATCH v6 20/25] python: add devel package requirements to
 setuptools
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-21-jsnow@redhat.com>
 <YK0iRgCDgKfVogKD@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <840fc0a4-45f9-7ce8-3f1c-a10303c44fbc@redhat.com>
Date: Tue, 25 May 2021 13:43:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK0iRgCDgKfVogKD@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 12:13 PM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:36PM -0400, John Snow wrote:
>> setuptools doesn't have a formal understanding of development requires,
>> but it has an optional feataures section. Fine; add a "devel" feature
>> and add the requirements to it.
>>
>> To avoid duplication, we can modify pipenv to install qemu[devel]
>> instead. This enables us to run invocations like "pip install -e
>> .[devel]" and test the package on bleeding-edge packages beyond those
>> specified in Pipfile.lock.
>>
>> Importantly, this also allows us to install the qemu development
>> packages in a non-networked mode: `pip3 install --no-index -e .[devel]`
>> will now fail if the proper development dependencies are not already
>> met. This can be useful for automated build scripts where fetching
>> network packages may be undesirable.
>>
> 
> This is a fairly exotic feature of setuptools, with very very few
> packages that I know about using it.  With most users (I believe)
> relying on pipenv to get the exact packages, the setuptools/pip use
> case may fall into obscurity IMO.
> 

Fair enough.

The intent is:

- Pipenv is more for CI, to deploy a consistent set of frozen packages 
that are known to behave in an extremely stable manner. My hope is to 
avoid breaking changes introduced unknowingly by pylint et al.

- pip install qemu[devel] is intended more for external/normal use by 
developers. It grabs the latest and greatest and it may indeed break as 
dependencies change beyond my awareness.


Some packages like aiohttp use that optional dependency feature to 
install optional modules -- `pip install aiohttp[speedups]` installs 
optional dependencies that allow that module to work much faster, but 
aren't required.

Since these linting tools aren't *required* just to *use* the package, I 
am doing users a courtesy by listing them as optional. That way, they 
aren't pulled in when using "pip install qemu", and if I have to pin on 
specific sub-versions etc, it won't include conflict dependencies for 
people using other projects that DO declare a hard requirement on those 
packages.

I can amend the PACKAGE.rst file to mention this usage, though it's only 
useful for folks developing the package.

(Still, part of the ploy here is to attract outside help on developing 
the QEMU SDK, pull requests welcome etc, so it's worth a documentation 
blurb for now.)

> So my suggestion is: consider better exposing the fact that this is
> available (a documentation section perhaps).
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/Pipfile      |  5 +----
>>   python/Pipfile.lock | 14 +++++++++-----
>>   python/setup.cfg    |  9 +++++++++
>>   3 files changed, 19 insertions(+), 9 deletions(-)
>>
> 
> Either way,
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Thanks! I am taking your R-B and I have applied the following diff.

Note that the PACKAGE.rst blurb references qemu[devel] instead because 
the PACKAGE.rst file is what is displayed theoretically on PyPI. That 
exact invocation will fail currently, because it's not on PyPI yet.

A little weird, but I *think* it's correct.


diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index 1bbfe1b58e2..05ea7789fc1 100644
--- a/python/PACKAGE.rst
+++ b/python/PACKAGE.rst
@@ -31,3 +31,7 @@ official `GitLab mirror 
<https://gitlab.com/qemu-project/qemu>`_.
  Please report bugs on the `QEMU issue tracker
  <https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
  the report.
+
+Optional packages necessary for running code quality analysis for this
+package can be installed with the optional dependency group "devel":
+``pip install qemu[devel]``.
diff --git a/python/README.rst b/python/README.rst
index bf9bbca979a..954870973d0 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -24,6 +24,10 @@ which installs a version of the package that installs 
a forwarder
  pointing to these files, such that the package always reflects the
  latest version in your git tree.

+Installing ".[devel]" instead of "." will additionally pull in required
+packages for testing this package. They are not runtime requirements,
+and are not needed to simply use these libraries.
+
  See `Installing packages using pip and virtual environments
 
<https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
  for more information.


