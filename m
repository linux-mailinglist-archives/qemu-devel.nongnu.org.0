Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72D2F18B9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:52:31 +0100 (CET)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyYY-0002l5-SN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kyyWr-0001X6-Mx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kyyWo-0008Qh-Mc
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610376640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGLiINRfGR69MtioZgMtIY0xiH764O89p3ULwrPZOd8=;
 b=EFwsq4KRPY3YlErSrw7CgUibThDB7cKTx5yVVxA4SyoDGCg5VFwLsSpaFhl5bJcabwRagi
 +gzMO/CoiwqLub15kMZQlV4JoZi7tBhF/DT1hTSFRtvbY6w2Rk/gsShw1jxLPrW+Slyp2Y
 yY/Cit57qi+d5uELXWnwsZoOX4+qFOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Kb-tjj9BN3CJ0enZ3gxkBg-1; Mon, 11 Jan 2021 09:50:37 -0500
X-MC-Unique: Kb-tjj9BN3CJ0enZ3gxkBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C352C7456;
 Mon, 11 Jan 2021 14:50:36 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51EF15D9DB;
 Mon, 11 Jan 2021 14:50:30 +0000 (UTC)
Subject: Re: [PATCH 0/6] Update git repo URLs to GitLab
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <384e33a0-d202-1911-1c3a-73dac1a5cedb@redhat.com>
Date: Mon, 11 Jan 2021 11:50:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/11/21 8:50 AM, Stefan Hajnoczi wrote:
> Several places in qemu.git reference qemu.org git repo URLs. Let's switch to
> GitLab repo URLs in order to enable GitLab as a gating CI and in order to
> reduce qemu.org bandwidth consumption.
>
> Paolo has already set up GitLab mirror repos. sgabios was missing and I added
> that today. It is now possible to replace git.qemu.org/git with
> gitlab.com/qemu-project in URLs.
>
> Stefan Hajnoczi (6):
>    .github: point Repo Lockdown bot to GitLab repo
>    gitmodules: use GitLab repos instead of qemu.org
>    gitlab-ci: remove redundant GitLab repo URL command
>    docs: update README to use GitLab repo URLs
>    pc-bios: update mirror URLs to GitLab
>    get_maintainer: update repo URL to GitLab
>
>   README.rst                |  4 ++--
>   .github/lockdown.yml      |  8 +++----
>   .gitlab-ci.yml            |  1 -
>   .gitmodules               | 44 +++++++++++++++++++--------------------
>   pc-bios/README            |  4 ++--
>   scripts/get_maintainer.pl |  2 +-
>   6 files changed, 31 insertions(+), 32 deletions(-)
>
There will be needed to change the description of all repos on GitLab, 
they are said mirrors still.

For this entire series:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!


