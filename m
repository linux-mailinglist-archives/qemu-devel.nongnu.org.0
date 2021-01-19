Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174712FB56A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:43:14 +0100 (CET)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oTh-0001hH-4g
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1o5d-0003a3-If
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1o5W-0004n5-CM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611051492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+I3liXMvO30jkhE/j9XVU4hU7ZOPhK71sa0PC44dVrM=;
 b=Ue3RTceYBIsJU63OmPNu5LQeD4dpT3VtZn1QvyCd4R16TMw7TKFsVxchONXY/UpLFdCeF5
 wLN5YyeTvdfog+mu4pdt4rqIMBhT1sOB+oorCRxuRa4+5ZuGUm7u0d0MFxiLWYqlffYsJr
 tJKL4WZdaJt+Q05e5x7NJcAhgbNSNOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-Sf0DzaoxNDe3PY-aUkfc-g-1; Tue, 19 Jan 2021 05:18:09 -0500
X-MC-Unique: Sf0DzaoxNDe3PY-aUkfc-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 268BE59
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:18:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CD0F60C67;
 Tue, 19 Jan 2021 10:18:07 +0000 (UTC)
Subject: Re: [qemu-web PATCH] deploy to qemu-project.org from GitLab CI
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210119093746.293342-1-pbonzini@redhat.com>
 <2898ef99-ead9-a9bd-0138-dcb88a2155ac@redhat.com>
 <e8d7bed7-888d-1fb1-ca4f-d45fe791dfee@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <da1ed6c8-fe7d-8739-a507-81d4ae54457e@redhat.com>
Date: Tue, 19 Jan 2021 11:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e8d7bed7-888d-1fb1-ca4f-d45fe791dfee@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/2021 11.00, Paolo Bonzini wrote:
> On 19/01/21 10:58, Thomas Huth wrote:
>> On 19/01/2021 10.37, Paolo Bonzini wrote:
>>> Currently, the website is rebuilt on qemu-project.org using
>>> an update hook.  We can reuse instead the Jekyll output of
>>> GitLab's CI.
>>>
>>> To do so, a new user qemu-deploy has been created on qemu.org.
>>> The private key is stored into a file variable SSH_PRIVATE_KEY_FILE
>>> (be careful to include the trailing newline after "---END OPENSSH
>>> PRIVATE KEY---"!).
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 5fa3041..08b6d20 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -1,6 +1,11 @@
>>> +stages:
>>> +  - build
>>> +  - update
>>
>> There is already "stages" section a the beginning of the yml file, so I'd 
>> suggest to extend that instead.
> 
> Are you sure?  This is the qemu-web CI.

Never mind, I looked at the wrong yml file :-(

  Thomas


