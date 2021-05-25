Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7E3903A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:15:41 +0200 (CEST)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXqO-000222-8O
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llXo4-0006TN-9Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llXny-0006ka-1S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621951988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIf9pXW/Badas7btEcGID8f5DGsEFNkgWydkRepZ4UA=;
 b=VfPXdreCXdSMHy6lig63WeAmZ2hwER91F086lEMOSR/LSp1nDqHVwugqUEjRr/cfDOvaYt
 LAjTbYmrzgriHh6FyK2r24hWVEw2PpX8JKZjhQ2CW2IRdus+3cCZ1oFCXqim12YMzO7reX
 zihWgwdZ3ihRlxEct3xrOJ9SviU5i/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-5pwt4iozNCmEQdZ3L-FD7Q-1; Tue, 25 May 2021 10:13:04 -0400
X-MC-Unique: 5pwt4iozNCmEQdZ3L-FD7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AAB4802ED8;
 Tue, 25 May 2021 14:13:03 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2A660C13;
 Tue, 25 May 2021 14:12:49 +0000 (UTC)
Subject: Re: [PATCH v6 07/25] python: add MANIFEST.in
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-8-jsnow@redhat.com>
 <YKxkMiUtNX2rYsPw@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <09618adf-ab48-342c-6aad-fc297c41154d@redhat.com>
Date: Tue, 25 May 2021 10:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKxkMiUtNX2rYsPw@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On 5/24/21 10:42 PM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:23PM -0400, John Snow wrote:
>> When creating a source distribution via 'python3 setup.py sdist', the
>> VERSION and PACKAGE.rst files aren't bundled by default. Create a
>> MANIFEST.in file that instructs the build tools to include these so that
>> installation from source dists won't fail.
>>
>> (This invocation is required by 'tox', as well as by the tooling needed
>> to upload packages to PyPI.)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/README.rst  | 2 ++
>>   python/MANIFEST.in | 2 ++
>>   2 files changed, 4 insertions(+)
>>   create mode 100644 python/MANIFEST.in
>>
> 
> I was about to propose mypy.ini to be included here, but given
> that it's merged into setup.cfg later in this series:
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 
> ---
> 
> Note to self (and to you) when generating the sdist, I get:
> 
>     ...
>     package init file 'qemu/__init__.py' not found (or not a regular file)

I think this one is fine, it's just a consequence of PEP420.

>     package init file 'dist/__init__.py' not found (or not a regular file)

This is kinda weird, but it only happens if you run sdist a *second* 
time, and it has created a dist/ folder. It shouldn't be trying to 
package its own dist folder ... !

After a 60 second look I don't know how to rectify this behavior, I will 
look into it.

>     ...
> 
> Which may not be too harmful, but deserves investigation.
> 

fwiw clean run vs re-run:

--- run1	2021-05-25 10:10:37.166975879 -0400
+++ run2	2021-05-25 10:10:48.527966676 -0400
@@ -1,11 +1,10 @@
  running sdist
  running egg_info
-creating qemu.egg-info
  writing qemu.egg-info/PKG-INFO
  writing dependency_links to qemu.egg-info/dependency_links.txt
  writing top-level names to qemu.egg-info/top_level.txt
-writing manifest file 'qemu.egg-info/SOURCES.txt'
  package init file 'qemu/__init__.py' not found (or not a regular file)
+package init file 'dist/__init__.py' not found (or not a regular file)
  reading manifest file 'qemu.egg-info/SOURCES.txt'
  reading manifest template 'MANIFEST.in'
  writing manifest file 'qemu.egg-info/SOURCES.txt'
@@ -35,6 +34,5 @@
  copying qemu/utils/__init__.py -> qemu-0.6.1.0a1/qemu/utils
  copying qemu/utils/accel.py -> qemu-0.6.1.0a1/qemu/utils
  Writing qemu-0.6.1.0a1/setup.cfg
-creating dist
  Creating tar archive
  removing 'qemu-0.6.1.0a1' (and everything under it)



at the very least, it doesn't look like it does anything actively 
harmful, but it seems to want to find sources in the dist, so I should 
steer it towards exclusively the qemu/ folder.

Thanks for this, Cleber!

--js


