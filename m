Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B512E8C86
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 15:10:04 +0100 (CET)
Received: from localhost ([::1]:49578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw455-000409-DE
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 09:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kw43y-0003aH-6O
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 09:08:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kw43u-0006UT-Hk
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 09:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609682927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmeKX9tBQWtSHfBkbXgDjwA9Ki2IzBw5KnK2Nd9De9g=;
 b=AkXEprW39vm7TbnDGIp9VTWFvpb77eiLThDAIand31iO2R/S4uF9Jp/gMJcY08A49A8A3S
 tb5Nh3fLCY6fv7HGz4qaaCiEkBpaFYSirCH94BFdE2He0XM/kZSaN5vcJ0/QZdr34yvyeU
 OjGYBveCRo5JUh5JtdyqlmZPf7jqhPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-FMjJJminPYuxYAF1pE2dXw-1; Sun, 03 Jan 2021 09:08:44 -0500
X-MC-Unique: FMjJJminPYuxYAF1pE2dXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61C0E800D55;
 Sun,  3 Jan 2021 14:08:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF3260CCC;
 Sun,  3 Jan 2021 14:08:35 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org
References: <20201229085046.8536-1-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7c736b93-c948-66c3-10eb-bfaf765aa456@redhat.com>
Date: Sun, 3 Jan 2021 15:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229085046.8536-1-acho@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: fam@euphon.net, lyan@suse.com, philmd@redhat.com, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/12/2020 09.50, Cho, Yu-Chen wrote:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
> 
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
> v4:
> Add package tar and fix python3 version from 3.8 to 3.6
> Add acceptance-system-opensuse back.
> 
> v3:
> Drop the "acceptance-system-opensuse" job part of the
> patch for now to get at least the basic compile-coverage
> 
> v2:
> Drop some package from dockerfile to make docker image more light.
> 
> v1:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
> ---
>   .gitlab-ci.d/containers.yml                   |  5 ++
>   .gitlab-ci.yml                                | 31 +++++++++++
>   tests/docker/dockerfiles/opensuse-leap.docker | 55 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> 

Thanks, works now for me, too.

Tested-by: Thomas Huth <thuth@redhat.com>

I'll queue it for my next pull request.


