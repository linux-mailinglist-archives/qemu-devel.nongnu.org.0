Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090FF275FA6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 20:20:41 +0200 (CEST)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL9Nf-0003sZ-Cm
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 14:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL9LZ-0003Ay-52; Wed, 23 Sep 2020 14:18:29 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL9LV-0007pI-Of; Wed, 23 Sep 2020 14:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=cvXsfW4rYpao7wCUTw9PfJH6SgCETXXqM/d0vGNA/HU=; 
 b=dQM9zWfudaS040J44WCCxWfzo8rpZ1M+b7Ncb0aSoW42OW1D00rv7kILnZlBkJ7filZbIxkWSFhHKdDLYZ8R/7p3VAVUau8uriDzySuo7HgwI/VB+T2px9QmnMzmAgvUwr/M1aNtuyKMFNpjvRqyN2Iq2ISs9Z9M4Lhg47ClSSxCv1HigNf5f0hEde+z0pH4HtLwWNe+2NM8gm8oKcsuxQWed0kwEV2qAeVdQ1+7A7Z6oNbOJmDoCroFITAKX9Fvny13+Nj94ovdWs3ndXls/NySBTZmlUsTmhYcPDG65xsepnPTyqi4RWFJV173LtsIUzuVFeuYueDJY6eOTgnYBQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kL9LP-000150-0O; Wed, 23 Sep 2020 20:18:19 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kL9LO-0005gV-N1; Wed, 23 Sep 2020 20:18:18 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] iotests: Remove 030 from the auto group
In-Reply-To: <20200904082513.GA6237@linux.fritz.box>
References: <20200904055701.462482-1-thuth@redhat.com>
 <20200904082513.GA6237@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 23 Sep 2020 20:18:18 +0200
Message-ID: <w51ft789x1x.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 11:59:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 04 Sep 2020 10:25:13 AM CEST, Kevin Wolf wrote:
>> Test 030 is still occasionally failing in the CI ... so for the
>> time being, let's disable it in the "auto" group. We can add it
>> back once it got more stable.
>> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> I would rather just disable this one test function as 030 is a pretty
> important one that tends to catch bugs.
>
>>  I just saw the problem here:
>>   https://cirrus-ci.com/task/5449330930745344?command=main#L6482
>>  and Peter hit it a couple of weeks ago:
>>   https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00136.html
>
> I wonder how this can still happen. The test should have more than
> enough time to complete now. Except if the throttling doesn't work as
> expected.
>
> I can't seem to reproduce this even if I add rather long delays. After
> 40 seconds, all jobs have moved either by 512k (which is STREAM_CHUNK)
> or not at all.

I also don't understand how this can fail... I assume the test is not
running for that long in the cases when it fails, right?

Berto

