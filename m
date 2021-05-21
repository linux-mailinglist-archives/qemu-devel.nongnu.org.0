Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105038C08D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:18:28 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzQR-0007M9-AS
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljzOy-0006Dd-Lq
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljzOv-0006EU-Kn
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621581412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+hLjuQ64vmuAnUmwowLfI+1Ab2JGLvYlh/ae84x6bU=;
 b=SUWoOefT2cSu5M1dt/GsmY6Qs5q/XhM7L/THezgHEoXCVBsiITvGoVk4q4glZG2+oPrVmF
 G9S6NFPIOD0gFs8jTpriVJdF4CvUtbIn1wbrHb8yBmLNWTJQ4An5i4QViZBhmRToqshWoq
 Jyst8Z88WTgYvjZ0gSI3BR3Kj8HClto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-u-7WYjLyMUGFNkav-jlzQw-1; Fri, 21 May 2021 03:16:49 -0400
X-MC-Unique: u-7WYjLyMUGFNkav-jlzQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34555107ACCA;
 Fri, 21 May 2021 07:16:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 360095D74B;
 Fri, 21 May 2021 07:16:37 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Message-ID: <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
Date: Fri, 21 May 2021 09:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 22.28, Philippe Mathieu-Daudé wrote:
> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>> Conceptually speaking, acceptance tests "are a series of specific tests
>> conducted by the customer in an attempt to uncover product errors before
>> accepting the software from the developer. Conducted by the end-user rather
>> than software engineers, acceptance testing can range from an informal
>> “test drive” to a planned and systematically executed series of scripted
>> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
>> also refers to user's agreement in the final state of an implemented feature.
>> Today, QEMU is not implementing user acceptance tests as described by Pressman.
>>
>> There are other three possible terms we could use to describe what is currently
>> QEMU "acceptance" tests:
>>
>>    1 - Integration tests:
>>        - "Integration testing is a systematic technique for constructing the
>>           software architecture while at the same time conducting tests to
>>           uncover errors associated with interfacing. The objective is to take
>>           unit-tested components and build a program structure that has been
>>           dictated by design." [2]
>>        * Note: Sommerville does not have a clear definition of integration
>>          testing. He refers to incremental integration of components inside
>>          the system testing (see [3]).

After thinking about this for a while, I agree with you that renaming the 
"acceptance" tests to "integration" tests is also not a good idea. When I 
hear "integration" test in the context of the virt stack, I'd rather expect 
a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe 
virt-manager on top and tests them all together. So we should look for a 
different name indeed.

>>    2 - Validation tests:
>>        - "Validation testing begins at the culmination of integration testing,
>>           when individual components have been exercised, the software is
>>           completely assembled as a package, and interfacing errors have been
>>           uncovered and corrected. At the validation or system level, the
>>           distinction between different software categories disappears. Testing
>>           focuses on user-visible actions and user-recognizable output from the
>>           system." [4]
>>        - "where you expect the system to perform correctly using a set of test
>>           cases that reflect the system’s expected use." [5]
>>        * Note: the definition of "validation testing" from Sommerville reflects
>>          the same definition found around the Internet, as one of the processes
>>          inside the "Verification & Validation (V&V)." In this concept,
>>          validation testing is a high-level definition that covers unit testing,
>>          functional testing, integration testing, system testing, and acceptance
>>          testing.
>>
>>    3 - System tests:
>>        - "verifies that all elements mesh properly and that overall system
>>           function and performance is achieved." [6]
>>        - "involves integrating components to create a version of the system and
>>           then testing the integrated system. System testing checks that
>>           components are compatible, interact correctly, and transfer the right
>>           data at the right time across their interfaces." [7]
>>
>> The tests implemented inside the QEMU "acceptance" directory depend on the
>> software completely assembled and, sometimes, on other elements, like operating
>> system images. In this case, the proposal here is to rename the current
>> "acceptance" directory to "system."
> 
> Are user-mode tests using Avocado also system tests?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html

We've indeed got the problem that the word "system" is a little bit 
overloaded in the context of QEMU. We often talk about "system" when 
referring to the qemu-softmmu-xxx emulators (in contrast to the linux-user 
emulator binaries). For example, the "--disable-system" switch of the 
configure script, or the "build-system" and "check-system" jobs in the 
.gitlab-ci.yml file ... thus this could get quite confusing in the 
.gitlab-ci.yml file afterwards.

So I think renaming "acceptance" to "system" is especially ok if we only 
keep the "softmmu"-related tests in that folder... would it maybe make sense 
to add the linux-user related tests in a separate folder called tests/user/ 
instead, Philippe? And we should likely rename the current build-system and 
check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or so?

Alternatively, what about renaming the "acceptance" tests to "validation" 
instead? That word does not have a duplicated definition in the context of 
QEMU yet, so I think it would be less confusing.

  Thomas


