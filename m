Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD4303D78
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:46:01 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NjM-0003Bk-8y
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4Ng0-00020t-Ct
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4Nfu-0003tw-21
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611664940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEIa8C9KTTwu1Awz1bS1gXKFtxdIj8OyQgUn2qU/1x4=;
 b=MInznCDRMHwursIWdA+1lC1MPuKHAL41MYfgJ2oZ8l3fUbjcUKeghRWflK+wAYoW9bIs8J
 LW3hvgpb7oQ1uNzYPYAfrcRgEm9GMwI20qIHE6TMIl87eqZCLk+okk+stN5iCBbI5d8yaH
 0xLn6VPSUtZf7M1kM81khWLG99C//3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-jMCQoRW3Ofecz8GnFV8XKQ-1; Tue, 26 Jan 2021 07:42:19 -0500
X-MC-Unique: jMCQoRW3Ofecz8GnFV8XKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DA8C73A7;
 Tue, 26 Jan 2021 12:42:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273856E53E;
 Tue, 26 Jan 2021 12:42:13 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Avoid some submodules to speed up the CI a
 little bit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210121174451.658924-1-thuth@redhat.com>
 <bd0ff3d1-56a4-ba1d-8129-521937b092b2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <42e698a8-f764-6e38-eba6-55137fc9802b@redhat.com>
Date: Tue, 26 Jan 2021 13:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bd0ff3d1-56a4-ba1d-8129-521937b092b2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 13.08, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 1/21/21 6:44 PM, Thomas Huth wrote:
>> Since the meson build system rework, the configure script prefers the
>> git submodules over the system libraries. So we are testing compilation
>> with capstone, fdt and libslirp as a submodule all over the place,
>> burning CPU cycles by recompiling these third party modules and wasting
>> some network bandwidth in the CI by cloning the submodules each time.
>> Let's stop doing that in at least a couple of jobs and use the system
>> libraries instead.
>>
>> While we're at it, also install meson in the Fedora container, since
>> it is new enough already, so we do not need to check out the meson
>> submodule here.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.yml                               | 6 +++++-
>>   tests/docker/dockerfiles/centos8.docker      | 1 +
>>   tests/docker/dockerfiles/debian-amd64.docker | 1 +
>>   tests/docker/dockerfiles/fedora.docker       | 3 +++
>>   tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
>>   5 files changed, 11 insertions(+), 1 deletion(-)
> 
> So now which are the jobs left building from git submodule clone?

All the jobs which don't have a depending test stage jobs should still use 
the submodules, e.g. build-oss-fuzz, build-tci, etc.
Also the centos7-based jobs still use all submodules, e.g. 
build-crypto-old-nettle etc.

  Thomas


