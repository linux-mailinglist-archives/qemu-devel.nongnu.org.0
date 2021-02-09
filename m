Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775531516A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:20:51 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Tso-0004Mn-1C
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Tp4-0001eq-KH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Tp1-0007P4-Uj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612880215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzFwCp3lQGjD/FiBJ9VjG6VkDI+YgFFFkyoOVlSzfeE=;
 b=DYCYkYJLuBXN4hGtgkI+OzAdeueVeDkSiSfnDKPkumqk7X2DYu1PY0ePxubw7wxSdc2G8R
 FcdG62z4WCxQLOZHfyn7BaKVESLp1irQstVQgQ3vNld9e0432AmG4TX5/6iV0yzUnYA79P
 BCcVx3LIwteSOy+NkpXkkpiq7LZq0vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-IpMYh4gYPmuxPU7BW7pBGQ-1; Tue, 09 Feb 2021 09:16:53 -0500
X-MC-Unique: IpMYh4gYPmuxPU7BW7pBGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F4580196E;
 Tue,  9 Feb 2021 14:16:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B1CD10016F5;
 Tue,  9 Feb 2021 14:16:46 +0000 (UTC)
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
 <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
 <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
 <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <21da6a3f-d2ce-91ff-6e9a-588af13c3369@redhat.com>
Date: Tue, 9 Feb 2021 15:16:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2021 15.12, Philippe Mathieu-Daudé wrote:
> On 2/9/21 2:41 PM, Peter Maydell wrote:
>> On Tue, 9 Feb 2021 at 13:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> Migration of this job is pending of Cleber's possibility to add an AArch64
>>> runner to Gitlab-CI, right? Then we need someone to support and maintain
>>> the hardware... I don't think anybody volunteered.
>>
>> We have the hardware already. Effectively Alex is maintaining it...
> 
> I missed to read if Alex volunteered for this task but am certainly
> happy if he is :) Although this should be documented somewhere (who
> to contact if the AArch64 runner starts to fail?).
> 
> Assuming Cleber's runner script is merged and working on the AArch64
> runner, then we need to figure how contributors can use it.
> Assuming this runner will be registered under the QEMU organization
> namespace in Gitlab, then contributors would have to open a Merge
> Request to trigger the CI jobs (similarly to when you push to the
> /staging branch). Then we would cancel the MR. We can ask contributors
> to cancel their MR once testing done.

I'm not sure, but if I got that right, opening a MR will only trigger a CI 
run on side of the requester, not of the target project? For example, when I 
look at:

  https://gitlab.com/libvirt/libvirt/-/merge_requests/65

the pipeline that is shown there ran on side of the requester, not on side 
of the libvirt project?

  Thomas


