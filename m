Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8C259924
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:45 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD9I0-0000HM-RN
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 12:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD9HF-0008BJ-Ka
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD9HD-0000nM-Rf
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598978214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrehOFfUUTXyGqKzUaG5jfBYdj5u0wgsqfFhVLcA0sc=;
 b=NnTcxH68sKujFxjHRqS24rN1gs7MEWvWg/JbG0nBooxDtHKhoVD+/Blt9TlO8XgwjRcJll
 bLw/iUSfuwjHHGQjtmSITqPuC3bKY5/sne+KHUfr8NC7ngtEJrls8fd5BZ8wWfxwGzea4F
 g8Mz11TEQ/4T+shwcLy6v3pcZv6j7SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-E3rc6bY-OzWbCrJefBOT9g-1; Tue, 01 Sep 2020 12:36:52 -0400
X-MC-Unique: E3rc6bY-OzWbCrJefBOT9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 727B6801A9D;
 Tue,  1 Sep 2020 16:36:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFF7378B40;
 Tue,  1 Sep 2020 16:36:46 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] gitlab-ci: Add cross-compiling build tests
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200823111757.72002-1-thuth@redhat.com>
 <20200823111757.72002-8-thuth@redhat.com>
 <20200901162743.GX345480@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a39b632a-5d59-0a63-b342-644f052ee1ff@redhat.com>
Date: Tue, 1 Sep 2020 18:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200901162743.GX345480@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, luoyonggang@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2020 18.27, Daniel P. Berrangé wrote:
> On Sun, Aug 23, 2020 at 01:17:57PM +0200, Thomas Huth wrote:
>> Now that we can use all our QEMU test containers in the gitlab-CI, we can
>> easily add some jobs that test cross-compilation for various architectures.
>> There is just only small ugliness: Since the shared runners on gitlab.com
>> are single-threaded, we have to split each compilation job into two parts
>> (--disable-user and --disable-system), and exclude some additional targets,
>> to avoid that the jobs are running too long and hitting the timeout of 1 h.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 113 +++++++++++++++++++++++++++++++++++
>>  .gitlab-ci.yml               |   1 +
>>  MAINTAINERS                  |   1 +
>>  3 files changed, 115 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds.yml
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> new file mode 100644
>> index 0000000000..4ec7226b5c
>> --- /dev/null
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -0,0 +1,113 @@
>> +
>> +.cross_system_build_job_template: &cross_system_build_job_definition
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  script:
>> +    - mkdir build
>> +    - cd build
>> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
>> +        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
>> +          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
>> +          xtensa-softmmu"
> 
> What does this leave enabled ?  Would it be shorter to just say
> --target-list="...explicit targets we want..." ?  It would be clearer
> to review at least.

I basically excluded all targets that have a second compile test
coverage, e.g. i386-softmmu code is mostly also covered by
x86_64-softmmu, sh4-softmmu is covered by sh4eb-softmmu etc.

The --target-list-exclude also comes in handy when new targets are added
to QEMU - you then don't have to remember to add the new targets here,
they are picked up automatically.

>> +    - make -j$(expr $(nproc) + 1) all check-build
> 
> None the less, it is functionally fine so
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks!

 Thomas


