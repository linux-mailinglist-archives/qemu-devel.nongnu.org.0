Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196812BABF4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:36:43 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg7Wj-0006LY-JH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kg7VQ-0005dO-70
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kg7VM-0001ng-7T
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605882915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7Q0J+xasktWgjO1XRtaCDnri+XAug6lb4bXxzZ3yM0=;
 b=izxm1juDS360m51M5mYN+UkInFIRdWTcAXS1bxNrwK5DJtlj7GOILy29PtwNnKJvjZNmRA
 QZi0YYJFLN+fRjzxWzCUnz7enjQ+D8vga69ksEqOflDncFvN1KiJ3+DfYGVwpfqc+WdJ9f
 W+261KG1b4+qRELCTlOYL9n3bY+r/8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-3ZhSioo7OAOUN-syVHW5_A-1; Fri, 20 Nov 2020 09:35:11 -0500
X-MC-Unique: 3ZhSioo7OAOUN-syVHW5_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF63C100F347;
 Fri, 20 Nov 2020 14:35:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 816B75C224;
 Fri, 20 Nov 2020 14:35:04 +0000 (UTC)
Subject: Re: [PATCH v1 6/6] gitlab-ci: Move trace backend tests across to
 gitlab
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-7-alex.bennee@linaro.org>
 <7f383116-3974-bf41-66f1-23f884211257@redhat.com>
Message-ID: <c4c724ce-1e23-c4ae-f75f-dce0190504f7@redhat.com>
Date: Fri, 20 Nov 2020 15:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7f383116-3974-bf41-66f1-23f884211257@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 10.54, Thomas Huth wrote:
> On 17/11/2020 18.36, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Similarly to commit 8cdb2cef3f1, move the trace backend
>> tests to GitLab.
>>
>> Note the User-Space Tracer backend is still tested on
>> Ubuntu by the s390x jobs on Travis-CI.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20201111121234.3246812-3-philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.yml | 18 ++++++++++++++++++
>>  .travis.yml    | 19 -------------------
>>  2 files changed, 18 insertions(+), 19 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index b406027a55..d0173e82b1 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -415,6 +415,24 @@ check-crypto-only-gnutls:
>>      IMAGE: centos7
>>      MAKE_CHECK_ARGS: check
>>  
>> +# We don't need to exercise every backend with every front-end
>> +build-trace-multi-user:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
>> +
>> +build-trace-ftrace-system:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
>> +
>> +build-trace-ust-system:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
> 
> Hmmm, do we really need separate build jobs for this, or could we maybe
> rather simply add the options to some existing jobs instead (to save some CI
> cycles)?

I guess we can still consolidate later ... but since Travis is now limiting
the CI minutes, we definitely have to move this over, so:

Acked-by: Thomas Huth <thuth@redhat.com>


