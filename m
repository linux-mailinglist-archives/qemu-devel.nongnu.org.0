Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4629D017
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 14:40:06 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXlgK-0005f9-S5
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 09:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXlfc-0005EJ-EG
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXlfZ-00019Z-HX
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603892355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k0bpxSy8VFxYCReXY2poOb0uol0HGWfO0lF1MqgWxY=;
 b=Q0fkvTGTjfMRxDRZHI4VFioFV/5tagqFFemvUfuDsSCI7W0hDZmooLiysx1aH2z3F4QQ0T
 UbzCxLZ3vBgUbM4Js1G56bDjBw8G05/xVEJsOUq9u/++ehbT0AUhoPaTwsOALmEcsPNzqP
 L8WsySfcTI23mXC0pU5pdIoqTA7zLzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-F2nVyswaMEm5Y6FOEGTvWw-1; Wed, 28 Oct 2020 09:39:13 -0400
X-MC-Unique: F2nVyswaMEm5Y6FOEGTvWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2349D1882FA3;
 Wed, 28 Oct 2020 13:39:12 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D90615D9EF;
 Wed, 28 Oct 2020 13:39:07 +0000 (UTC)
Subject: Re: [PATCH 4/5] python: add .gitignore
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20201027223815.159802-1-jsnow@redhat.com>
 <20201027223815.159802-5-jsnow@redhat.com>
 <f9ea6ce1-f464-0376-29ac-6071f680e63b@redhat.com>
 <871rhi1zim.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <3c86b845-31ad-0956-d095-6a6323679a90@redhat.com>
Date: Wed, 28 Oct 2020 09:39:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <871rhi1zim.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 5:16 AM, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 27/10/2020 23.38, John Snow wrote:
>>> Ignore build and package output (build, dist, qemu.egg-info);
>>> effectively these are "in-tree" builds of a kind.
>>
>> Since we recently moved away from in-tree builds, could these also be made
>> out-of-tree only?
> 
> The build should only write to the per-build spaces: the build tree,
> per-build scratch in /tmp, ...  Writing to shared space such as the
> source tree can break parallel independent builds.  I consider that a
> bug.
> 

It's not really a "build" in that traditional sense, but if you were to 
execute "make venv-check" in parallel, I'm not confident it would work 
right. Don't do that, I guess.

This has nothing to do with QEMU's build step. We don't need to "build" 
or "install" this package to use it during QEMU builds or (most) 
testing. We *do* need to install it to a virtual environment to test it 
with an explicit set of linter packages, though.

See also: why do we ignore *.pyc and __pycache__ files in the whole 
tree? These are in effect build artifacts too. I'm not sure I would know 
how to avoid those being created. Maybe it's possible? but... I don't 
think this is a problem that we have to solve, actually.

OK, all that whining aside, I will give it a legitimate try. I just 
wanted to prepare you for disappointment. I might be able to move build/ 
and dist/, but I have doubts that anything can reasonably be done about 
qemu.egg-info, __pycache__, .mypy_cache, or the like.

--js


