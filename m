Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395C31F9AF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:11:57 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5Zc-0002Ae-8l
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD5Y2-0001NX-KG
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD5Xx-0004me-LD
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20w4oIXe8bo1i/SVHlteNQK7mOmHJEXirPM4ehoLG/A=;
 b=WPLPcwFs37c+swAgo2qUJmQPKN5jmaz80hBMZMnheHIB2J7lS3F/Ti/SRqDrfgMrnRKv1l
 1yTVes0cueArWGPXXBGFGSHOv2p1gsMl3T4LhvHRRIFEGlCx8xKyfFlmPHSAuTD1tk4C4N
 t0SE0q1PFwujCZ9qCaIeIponn7Q2VtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-jkWqMgWYOKe578r9saXwWg-1; Fri, 19 Feb 2021 08:10:10 -0500
X-MC-Unique: jkWqMgWYOKe578r9saXwWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA79E80196E;
 Fri, 19 Feb 2021 13:10:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 131036086F;
 Fri, 19 Feb 2021 13:10:08 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210219110950.2308025-1-thuth@redhat.com>
 <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
Message-ID: <c429f806-ae37-9939-d215-fe98bffb84dd@redhat.com>
Date: Fri, 19 Feb 2021 14:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/2021 13.00, Philippe Mathieu-Daudé wrote:
> On 2/19/21 12:09 PM, Thomas Huth wrote:
>> We're building a lot of containers in the gitlab-CI that we never use.
>> This takes away network bandwidth and CPU time from other jobs for no
>> use, so let's remove them for now. The individual containers could be
>> re-added later when we really need them.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/containers.yml | 92 -------------------------------------
>>   1 file changed, 92 deletions(-)
> 
> I'm not enthusiast with this patch because I use various in this list
> from time to time for testing or cross build/disas binaries.

When I look at our current huge list of containers, I wonder how do we know 
which containers still get used (in the sense of not only build), and which 
ones are likely already bit-rotten? And why do we need that many containers? 
Why both, debian-arm64-test-cross.docker and debian-arm64-cross.docker and 
not combine them? And why do we need that many individual cross-compiler 
docker files if we already have debian-all-test-cross.docker that can be 
used to test most of them? ... for me, as a docker ignorant, this is all 
very opaque and some clean up IMHO could really help here.

> Not having
> these containers used mainstream probably show the failure of the
> project to add good testing coverage on these targets. Most of them are
> for hobbyist with little time. Removing them will make it even harder
> to add tests.

Do you really use the docker files from the gitlab registry? I'd rather 
expected that people build those locally in case they need them...?

> Can't we keep them disabled? Or put them in manual mode?

Well, I guess manual mode is fine, too, as long as they don't waste CPU 
cycles and network bandwidth anymore for most people who don't need them.

  Thomas


