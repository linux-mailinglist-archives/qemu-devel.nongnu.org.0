Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F764456C29
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:13:21 +0100 (CET)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzxQ-0007Q2-JD
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnztt-0004ee-Ib
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnztq-00043U-5Y
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AepwMSz/MM1BBTJm3PySJXVESXSRuyN/wyx6YGfYFXM=;
 b=RxMUMLI2aOO4frvthYYamALJVnQICpH+ymMwrv+ErkeT3LClt4DrzpPjyQxICUCG/E/APK
 0JzIvrvVC2CGxFTrxEeVoz/zGMx1uWO62zSYMZ/QoTfKA/j0hFbjeic0jIEzwGQCEkY/od
 A4zjixhPUXPhqIa0+rK3MEuVaHtf6Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-x0LveJ0PNwmI7YqA8DyFjQ-1; Fri, 19 Nov 2021 04:09:30 -0500
X-MC-Unique: x0LveJ0PNwmI7YqA8DyFjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95B139F92A
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:09:29 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDCD46788F;
 Fri, 19 Nov 2021 09:09:28 +0000 (UTC)
Message-ID: <99a6b686-c2c4-dd5e-fe8c-9940311cdaca@redhat.com>
Date: Fri, 19 Nov 2021 10:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH] Update URLs of "SubmitAPatch" wiki doc
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211118170028.820558-1-kchamart@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211118170028.820558-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 18:00, Kashyap Chamarthy wrote:
> We've recently converted[1] the "SubmitAPatch" page from Wiki to in-tree
> docs.  So update the website to reflect this.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df03 --
>      9f73de8df0 (docs: rSTify the "SubmitAPatch" wiki, 2021-11-10)
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>

Hi, I'm applying instead 
https://lore.kernel.org/r/20211118074702.216951-2-pbonzini%40redhat.com 
(sorry, you couldn't know of the magic redirect since that's done 
directly on shell.qemu.org's Apache configuration).

The report-a-bug and security-process pages of the website are also 
candidates for moving to docs/devel, by the way!

Paolo

> ---
>   CONTRIBUTING.md            | 2 +-
>   contribute.md              | 2 +-
>   contribute/report-a-bug.md | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index d5cbf07..b6fc0bd 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -12,7 +12,7 @@ You should also CC the website maintainers:
>   
>   For further guidance on sending patches consult:
>   
> -https://wiki.qemu.org/Contribute/SubmitAPatch
> +https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html
>   
>   It is expected that contributors check the rendered website before submitting
>   patches. This is possible by either running jekyll locally, or by using the
> diff --git a/contribute.md b/contribute.md
> index 4802452..77cd5f4 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -17,6 +17,6 @@ permalink: /contribute/
>     &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
>     &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
>   
> -Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
> +Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html).
>   
>   Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
> diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
> index 96b60d8..b24c759 100644
> --- a/contribute/report-a-bug.md
> +++ b/contribute/report-a-bug.md
> @@ -18,7 +18,7 @@ When submitting a bug report, please try to do the following:
>   
>   * Include information about the host and guest (operating system, version, 32/64-bit).
>   
> -QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
> +QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html).
>   
>   Do NOT report security issues (or other bugs, too) as "confidential" bugs in the
>   bug tracker.  QEMU has a [security process](../security-process) for issues
> 


