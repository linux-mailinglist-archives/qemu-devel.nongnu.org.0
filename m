Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D34257394
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 08:13:58 +0200 (CEST)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCd4m-0004Q2-Jt
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 02:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCd44-0003z4-Ko
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 02:13:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21854
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCd41-0006ni-N8
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 02:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598854388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32cTT9dMT3hwKBe8WDBqbSP2A29FwKJT91n29y/Goms=;
 b=dSCvVtUZ6a5kS5njV42WHMQUydp548D10UnncHWOQnogxyTx8Gxu4sST+ncggqo/sd1ygX
 wqdpkdVW3p/CHJWycoBq6Q3Q7/wOBB04CDmsJIHVoy10upSvaNewIi/ppp26WqGGBrkbeL
 tnzoV94Gw2O4ghzt4prR/d6R8ITVilY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Q_vfrY3CPZKHpbBvw2HqqA-1; Mon, 31 Aug 2020 02:13:04 -0400
X-MC-Unique: Q_vfrY3CPZKHpbBvw2HqqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79ADF801AC5;
 Mon, 31 Aug 2020 06:13:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4CD51002D59;
 Mon, 31 Aug 2020 06:13:01 +0000 (UTC)
Subject: Re: [PATCH] cirrus.yml: Exclude some targets in the FreeBSD job to
 speed up the build
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200824094410.6201-1-thuth@redhat.com>
 <20200828085954.GE224144@redhat.com>
 <79c7c98a-bb34-df86-a24f-b7df2ac89242@redhat.com>
Message-ID: <b13e0371-05f6-6de6-73a3-a4380e1245a9@redhat.com>
Date: Mon, 31 Aug 2020 08:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <79c7c98a-bb34-df86-a24f-b7df2ac89242@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:13:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.207, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/08/2020 11.54, Thomas Huth wrote:
> On 28/08/2020 10.59, Daniel P. Berrangé wrote:
>> On Mon, Aug 24, 2020 at 11:44:10AM +0200, Thomas Huth wrote:
>>> The FreeBSD jobs currently hit the 1h time limit in the Cirrus-CI.
>>> We've got to exclude some build targets here to make sure that the job
>>> finishes in time again. The targets that are excluded should not hurt
>>> much, since e.g. all the code from i386-softmmu is covered again by
>>> x86_64-softmmu.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  Not sure why the FreeBSD builds suddenly got slower and hit the 1h
>>>  time limit now. Looking at https://cirrus-ci.com/github/qemu/qemu
>>>  it seems like the FreeBSD jobs were already taking ca. 48 minutes
>>>  since quite a while, but since the Meson build system has been merged,
>>>  they now always hit the 1h limit. Could it be that Meson is slow on
>>>  FreeBSD?
>>>  
>>>  I hope disabling some of the "redundant" targets is ok for everybody
>>>  to get this working again. Alternatively, we could also introduce a
>>>  second FreeBSD job and run half of the targets in one job, and half
>>>  of the targets in the other job if that's preferred?
>>
>> I'd probably suggest we go for two jobs, as there doesn't look like
>> any constraint on running multiple jobs that we'll hit any time
>> soon.
> 
> I gave it a try, but either I'm doing something wrong, or it is not
> possible to run multiple FreeBSD tasks on cirrus-ci for one commit 

I apparently needed a weekend in between to get a clean head again. I
was doing indeed something wrong... apparently you have to name your
tasks on cirrus-ci with "_task" at the end. If you use "_task1" and
"_task2", it does now work anymore. Sigh.

So I'll try to cook a proper patch to split the job instead.

 Thomas


