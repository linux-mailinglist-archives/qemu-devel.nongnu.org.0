Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4042C7FD7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:29:51 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeZB-0000zP-NT
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kjeYO-0000aF-Dh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kjeYL-00060P-6l
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606724934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIwzCt8N2+wRzm1tY51pLHxxaxi4ES6VzhcJiuds5Mo=;
 b=c5SUCApUI6OB/N/f2lXbzyut+msM6KkFEoDr20d6B0wD/CKE/Fh3t2Y7EPgtDzmLXLWbne
 CB0n52e6MR9pO6Dk9VRMNnV0vBk9sIyUO9I3BERuoPQrO6nxJnNISLDv4dB7BU4jKryGKA
 q8r/Yr37sbLQkM9nSxxIjBa/ml0Jryg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-LCoPx1AxNIqGxDUIqljFQg-1; Mon, 30 Nov 2020 03:28:51 -0500
X-MC-Unique: LCoPx1AxNIqGxDUIqljFQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A88185E49C;
 Mon, 30 Nov 2020 08:28:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE3A60843;
 Mon, 30 Nov 2020 08:28:43 +0000 (UTC)
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org
References: <20201130042659.29333-1-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <70cc2a9e-a496-f959-3fb9-46c69903ceff@redhat.com>
Date: Mon, 30 Nov 2020 09:28:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201130042659.29333-1-acho@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Liang Yan <lyan@suse.com>, philmd@redhat.com,
 wainersm@redhat.com, brogers@suse.com, cfontana@suse.de,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2020 05.26, Cho, Yu-Chen wrote:
> v2:
> Drop some package from dockerfile to make docker image more light.
> 
> v1:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
> 
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  .gitlab-ci.d/containers.yml                   |  5 ++
>  .gitlab-ci.yml                                | 30 +++++++++++
>  tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

 Hi!

Sorry, I was too busy to reply last week ... you could also simply ping on
the v2 that you've sent last week, but anyway, let's now continue discussion
here. I gave it a try, and runtime is much better now, indeed:

 https://gitlab.com/huth/qemu/-/jobs/868942587

So:

Tested-by: Thomas Huth <thuth@redhat.com>

Patch looks also fine to me, you should just not put the version log above
the "---" but below, otherwise the version log will show up in the final
patch when it gets picked up with "git am".

No need to resend just because of this, though, I can fix that when picking
up the patch. I'll queue for my testing tree and send it once the hard
freeze is over.

 Thomas



