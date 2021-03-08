Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692E330F05
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:20:06 +0100 (CET)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFnp-0004PK-1U
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJF4r-0001I4-WE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJF4p-0002Yd-Te
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615206814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lBmIHFbfOJtocikMMqxDTcqd8zFsvSrvNEZkYY0BLI=;
 b=bCPN1R7gOweAKAilgp2tpBWagP88MDbLu61ktvWqvW6Ig7TTWhBCi1VAJoNbRAyqDy98RX
 9vtwbDFVsezMbQzqRCiPD3AWW80eQarXjEB9AHUN+4Rgx6ZfPGQH4yTJyEXvc2udGkE7Qj
 /SIdtCRHStppe8L4zQ1USnqB0+z0soE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-tVHes7RZOGqKcrX73lfIHw-1; Mon, 08 Mar 2021 07:33:31 -0500
X-MC-Unique: tVHes7RZOGqKcrX73lfIHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4265E814314;
 Mon,  8 Mar 2021 12:33:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 698D019709;
 Mon,  8 Mar 2021 12:33:24 +0000 (UTC)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210307113403.11028-1-thuth@redhat.com>
 <878s6xam83.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the generic
 CI section
Message-ID: <e9809c0e-1dc1-bb42-475d-ac1c032bd075@redhat.com>
Date: Mon, 8 Mar 2021 13:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <878s6xam83.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 12.57, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The status of the gitlab-CI files is currently somewhat confusing, and
>> it is often not quite clear whether a patch should go via my tree or
>> via the testing tree of Alex. That situation has grown historically...
>> Initially, I was the only one using the gitlab-CI, just for my private
>> repository there. But in the course of time, the gitlab-CI switched to
>> use the containers from tests/docker/ (which is not part of the gitlab-CI
>> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
>> completely for the repository and will soon use it as its gating CI, too.
>> So it makes way more sense if the gitlab-ci.yml files belong to the people
>> who are owning the qemu-project on gitlab.com and take care of the gitlab
>> CI there. Thus let's merge the gitlab-ci section into the common "test and
>> build automation" section,
> 
> I have no problem with this, might as well keep it all together.
> 
>> and change the status of myself to a "reviewer"
>> there instead.
> 
> Can we not have multiple maintainers? Considering how important keeping
> the testing green should be wouldn't it help to keep the bus factor
> lower (not to mention holidays/breaks and just plain busy with other
> things periods). It shouldn't be to hard to track as long as we mention
> when we queue things to our trees?

Sure, it certainly makes sense to have multiple maintainers, but I think in 
this section, it might be better to also have someone who's also a 
maintainer of the qemu-project at gitlab (in case there's something to 
fix/setup with a custom runner for example, and to avoid wrong 
expectations)? Maybe Peter finally wants to join here to get finally away 
from his exclusive merge tests?

  Thomas


