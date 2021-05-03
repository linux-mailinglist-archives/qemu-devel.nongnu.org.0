Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA737239A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:29:31 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldi0I-0006x0-Fw
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldhxv-000636-98
 for qemu-devel@nongnu.org; Mon, 03 May 2021 19:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldhxq-0005UG-SN
 for qemu-devel@nongnu.org; Mon, 03 May 2021 19:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620084412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZgOY++UCGLVQ1iLeVBP23JRrz9kHtm0GHJQD/DAVS4=;
 b=K6pnSD2RZXkqiF5oXTizWwxOuH3THsg5V0yJp3ZsaKXoPAHiAsgeXgI8IqrrSEPHreFacu
 TUARuRzH0PWOi8iexeaUkadLuIf34NJw1Vj7D8GpkRgc0TR9FPIB1URYM14xz05nmLICIy
 OIUr7gxHuaNEBkDMwsa7Ri1gCGdmm7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-4vz9WMRcPWeNsylrba5IIA-1; Mon, 03 May 2021 19:26:39 -0400
X-MC-Unique: 4vz9WMRcPWeNsylrba5IIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F201898299;
 Mon,  3 May 2021 23:26:38 +0000 (UTC)
Received: from [10.10.116.36] (ovpn-116-36.rdu2.redhat.com [10.10.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2305A6060F;
 Mon,  3 May 2021 23:26:36 +0000 (UTC)
Subject: Re: [qemu-web PATCH] Update website to point to the new bug tracker
 at GitLab instead of Launchpad
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210503103007.1034171-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <79726acf-56b5-8d73-45e9-ec9aa19bc2e6@redhat.com>
Date: Mon, 3 May 2021 19:26:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503103007.1034171-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 6:30 AM, Thomas Huth wrote:
> We've started migrating the bug tickets from Launchpad to GitLab, so
> it does not make too much sense anymore that users open new tickets
> in the old system. Let's direct them now to the GitLab tracker instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!

> ---
>   contribute.md              | 3 ++-
>   contribute/report-a-bug.md | 5 ++++-
>   support.md                 | 2 +-
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/contribute.md b/contribute.md
> index d7e295f..cbb476d 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -3,7 +3,8 @@ title: Contribute to QEMU!
>   permalink: /contribute/
>   ---
>   
> -* Report a bug in our bugtracker: [https://bugs.launchpad.net/qemu/](https://bugs.launchpad.net/qemu/)<br>
> +* Report a bug in our bugtracker:
> +  <https://gitlab.com/qemu-project/qemu/-/issues><br/>
>     See also [How to report a bug](report-a-bug/) or [How to report a security bug](security-process/)
>   
>   * Clone ([or browse](https://gitlab.com/qemu-project/qemu)) the git repository: <br>`git clone https://gitlab.com/qemu-project/qemu.git`
> diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
> index 1cc42e7..922f699 100644
> --- a/contribute/report-a-bug.md
> +++ b/contribute/report-a-bug.md
> @@ -3,7 +3,10 @@ title: Reporting a bug
>   permalink: /contribute/report-a-bug/
>   ---
>   
> -Bugs can be filed at our [bug tracker](https://bugs.launchpad.net/qemu/), which is hosted on Launchpad. If you've got a problem with how your Linux distribution packages QEMU, use the bug tracker from your distro instead.
> +Bugs can be filed at our
> +[bug tracker](https://gitlab.com/qemu-project/qemu/-/issues), which is hosted
> +on GitLab. Note: If you've got a problem with how your Linux distribution
> +packages QEMU, please use the bug tracker from your distro instead.
>   
>   When submitting a bug report, please try to do the following:
>   
> diff --git a/support.md b/support.md
> index 252351c..b622362 100644
> --- a/support.md
> +++ b/support.md
> @@ -41,5 +41,5 @@ response. If you can't leave IRC open and wait you may be better
>   served by a mailing list.
>   
>   * If you think you have found a bug you can report it on [our bug
> -  tracker](https://bugs.launchpad.net/qemu/).<br>
> +  tracker](https://gitlab.com/qemu-project/qemu/-/issues).<br/>
>   Please see our guide on [how to report a bug](/contribute/report-a-bug/)
> 


