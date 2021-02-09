Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC85314903
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 07:41:12 +0100 (CET)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Mhz-0003qe-5k
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 01:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Mf1-0003IP-D4
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Mew-0000Fm-2C
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612852679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc+Q/SN4h7Y5VkRVEI4e8+mykCdwwydDnWRT7LezlY0=;
 b=WCd6i9X4iCDDHQZ6wde6kakCcdsr8DYzoTom1JmVnfPI/152bGIOpbbrxjdHgKjiBylFb+
 QoTWQzkPQeIdXRme7vjoabamWXO9SxgvWrHnyuuZFbXS4zhg8WytSd/QAUKuruEeqUXWAV
 PAzVlrnPimSZlfw7vL91b+zzhai1gto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-QMoKcqWbPVGdaGwBobzqoQ-1; Tue, 09 Feb 2021 01:37:58 -0500
X-MC-Unique: QMoKcqWbPVGdaGwBobzqoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81F0CC627;
 Tue,  9 Feb 2021 06:37:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56D3760C04;
 Tue,  9 Feb 2021 06:37:52 +0000 (UTC)
Subject: Re: [PATCH 1/3] gitlab: always build container images
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208163339.1159514-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a0dd7611-6b35-0a4f-4522-58c8c4add6d5@redhat.com>
Date: Tue, 9 Feb 2021 07:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208163339.1159514-2-berrange@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2021 17.33, Daniel P. Berrangé wrote:
[...]
> For example, consider pushing 5 commits, one of which contains a
> dockerfile change. This will trigger a CI pipeline for the
> containers. Now consider you do some more work on the branch and push 3
> further commits, so you now have a branch of 8 commits. For the second
> push GitLab will only look at the 3 most recent commits, the other 5
> were already present. Thus GitLab will not realize that the branch has
> dockerfile changes that need to trigger the container build.
> 
> This can cause real world problems:
> 
>   - Push 5 commits to branch "foo", including a dockerfile change
> 
>      => rebuilds the container images with content from "foo"
>      => build jobs runs against containers from "foo"
> 
>   - Refresh your master branch with latest upstream master
> 
>      => rebuilds the container images with content from "master"
>      => build jobs runs against containers from "master"
> 
>   - Push 3 more commits to branch "foo", with no dockerfile change
> 
>      => no container rebuild triggers
>      => build jobs runs against containers from "master"
> 
> The "changes" conditional in gitlab is OK, *provided* your build
> jobs are not relying on any external state from previous builds.
> 
> This is NOT the case in QEMU, because we are building container
> images and these are cached. This is a scenario in which the
> "changes" conditional is not usuable.
> 
> The only other way to avoid this problem would be to use the git
> branch name as the container image tag, instead of always using
> "latest".
I'm basically fine with your patch, but let me ask one more thing: Won't we 
still have the problem if the user pushes to different branches 
simultaneously? E.g. the user pushes to "foo" with changes to dockerfiles, 
containers start to get rebuild, then pushes to master without waiting for 
the previous CI to finish, then the containers get rebuild from the "master" 
job without the local changes to the dockerfiles. Then in the "foo" CI 
pipelines the following jobs might run with the containers that have been 
built by the "master" job...

So if we really want to get it bulletproof, do we have to use the git branch 
name as the container image tag?

  Thomas


