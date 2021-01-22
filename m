Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02D300897
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:26:42 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zGj-0006oc-To
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2zFe-0006Nw-6y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2zFc-0007O7-1Y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611332731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQ/fNW72cv7sl2JgibY+razpP3N/bbCgA/YHTsWp20Y=;
 b=hORMBHC3GsBDYXrP9q/BeRrVbI2fENq4oKnrxmSfPhkdTI4PW7B1sOq4u/oJLXabcsOEG5
 uCZ9zoV1GKw2qc/Wg9Ei3TDUAO2A2KKzbsws6k1LgV6RD1JzoOe4ReaQRD4AVMzeTlZlk+
 UWddknHFs24+dENjbbPmHlzD8o/ENJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-fO6FwZjtNjGWYLRMEuDGbA-1; Fri, 22 Jan 2021 11:25:28 -0500
X-MC-Unique: fO6FwZjtNjGWYLRMEuDGbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B3F61800D41;
 Fri, 22 Jan 2021 16:25:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03D605DA34;
 Fri, 22 Jan 2021 16:25:19 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Use the whole tree as artifacts to speed
 up the CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210122100722.705375-1-thuth@redhat.com>
 <20210122101833.GC3150238@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3d6e194a-4c18-a6f3-6783-c93daf1c2114@redhat.com>
Date: Fri, 22 Jan 2021 17:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122101833.GC3150238@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 11.18, Daniel P. Berrangé wrote:
> On Fri, Jan 22, 2021 at 11:07:22AM +0100, Thomas Huth wrote:
>> Currently, our check-system-* jobs are recompiling the whole sources
>> again. This happens due to the fact that the jobs are checking out
>> the whole source tree and required submodules again, and only try
>> to use the "build" directory with the binaries and object files
>> as an artifact from the previous stage - which simply does not work
>> anymore (with the current version of meson). Due to some changed
>> time stamps, meson is always trying to rebuild the whole tree.
> 
> This used to work in the past didn't it ? Did something change in
> meson to break this, or have we just not noticed before.

As mentioned by Philippe already, there seems to be a problem in current 
meson which triggers a rebuild of the whole tree in some cases. See this 
thread here:

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05409.html

>> So instead of trying to marry a freshly checked out source tree
>> with the pre-built binaries in these jobs, let's simply pass the
>> whole source including the submodules and the build tree as artifact
>> to the test jobs. That way timestamps get preserved and there is
>> no rebuild of the sources anymore. This saves ca. 15 - 20 minutes
>> of precious CI cycles in each run.
> 
> I'm a little worried we might end up hitting the artifact size
> limit which is supposedly 1GB on gitlab.com.  Im guessing this
> must be measuring the compressed size though, as a src checkout
> with build dir  and .git dir is already way over 1GB.

I've added a "du -sh" in one of the jobs and the size of the directory was 
indeed 2 GB already. But I did not see any problems due to that size. So 
either the limit must be bigger, or it's about the compressed size. Either 
way, it's working at least right now.

We could maybe also simply exclude the .git directory of the source 
checkout, I think that's the biggest chunk there and likely not needed for 
the tests.

 > For to ask, could we address it by using  'meson test
 > --no-rebuild' perhaps ?

Interesting idea! I'll give it a try, and if it works, I'll send a patch for 
that instead.

  Thomas


