Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36DB2B7AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:53:03 +0100 (CET)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfK98-0000Om-Jf
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfK7u-0008M7-8F
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfK7r-00005M-QK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605693102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFW4YfaKyhzyt0wFc6BjGV0G0wg27Y0/+aSLoS4gkg4=;
 b=WO3xAe9PM0m/taYSXr3zvnNaOHaCf7GR9jODTudsp0ntSINsg/4xc8qPaBxWaIksngL/CT
 +fRiluJ3hm1+wDQ5cy5j+ZFl7YRsJf7JOxAcAJLjRqw3VYvKaXFRPC7zJvSnuuxYjEafnk
 wOt6QZCmibHebfzGGRiadZz9/fT3LDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-S5XJB9A5OCWflPjGARS0UA-1; Wed, 18 Nov 2020 04:51:40 -0500
X-MC-Unique: S5XJB9A5OCWflPjGARS0UA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31BE880EFA7;
 Wed, 18 Nov 2020 09:51:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A6345D9CD;
 Wed, 18 Nov 2020 09:51:30 +0000 (UTC)
Subject: Re: [PATCH v1 4/6] gitlab: move remaining x86 check-tcg targets to
 gitlab
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d19f1bc0-9716-e0f4-0b6c-f2add5578f7d@redhat.com>
Date: Wed, 18 Nov 2020 10:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2020 18.36, Alex Bennée wrote:
> The GCC check-tcg (user) test in particular was very prone to timing
> out on Travis. We only actually need to move the some-softmmu builds
> across as we already have coverage for linux-user.
> 
> As --enable-debug-tcg does increase the run time somewhat as more
> debug is put in let's restrict that to just the plugins build. It's

"so" or "," -----^ ?

> unlikely that a plugins enabled build is going to hide a sanity
> failure in core TCG code so let the plugin builds do the heavy lifting
> on checking TCG sanity so the non-plugin builds can run swiftly.
> 
> Now the only remaining check-tcg builds on Travis are for the various
> non-x86 arches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201110192316.26397-10-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 17 +++++++++++++++++
>  .travis.yml    | 26 --------------------------
>  2 files changed, 17 insertions(+), 26 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


