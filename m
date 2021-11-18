Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480845562D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 08:58:12 +0100 (CET)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncJ9-0006CW-3s
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 02:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mncFk-0003Zy-8Y
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mncFh-0006q5-9t
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637222076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA0yqZOuIV9yTi4wDxsH0+KI2gJiaYUJ3n4ApiTWCds=;
 b=VIjktk35xI9yzqOTP+aODw7xYt2df5wnsMj1qpLWIkDaboRD7KZnBFibFTpDFPkGC9StpO
 JbCehLI52NWvZpIBMgipg1jctLxYZHx9Ha9iUdH1Buw+EurqAfv4ALHZYq3JnVy+tEZmhV
 0DdKw734LF0xz2DKUcXh7PsHR93M1RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-2T4cb-hBO4qb6WerYbfjkw-1; Thu, 18 Nov 2021 02:54:30 -0500
X-MC-Unique: 2T4cb-hBO4qb6WerYbfjkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D59398799ED
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:54:29 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6070A604CC;
 Thu, 18 Nov 2021 07:54:29 +0000 (UTC)
Message-ID: <cf1ec6c3-a320-d028-cf7b-e291b086cb8b@redhat.com>
Date: Thu, 18 Nov 2021 08:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH] update links to the SubmitAPatch wiki page
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211118074702.216951-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211118074702.216951-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2021 08.47, Paolo Bonzini wrote:
> The page is now part of the documentation, but it also has a redirect
> in the qemu.org web server to provide a stable URL.  Use it instead
> of linking out to wiki.qemu.org.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   CONTRIBUTING.md            | 2 +-
>   contribute.md              | 2 +-
>   contribute/report-a-bug.md | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index d5cbf07..6edc07b 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -12,7 +12,7 @@ You should also CC the website maintainers:
>   
>   For further guidance on sending patches consult:
>   
> -https://wiki.qemu.org/Contribute/SubmitAPatch
> +https://qemu.org/contribute/submit-a-patch/
>   
>   It is expected that contributors check the rendered website before submitting
>   patches. This is possible by either running jekyll locally, or by using the
> diff --git a/contribute.md b/contribute.md
> index 4802452..856e434 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -17,6 +17,6 @@ permalink: /contribute/
>     &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
>     &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
>   
> -Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
> +Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](/submit-a-patch/).
>   
>   Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
> diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
> index 96b60d8..8d7d371 100644
> --- a/contribute/report-a-bug.md
> +++ b/contribute/report-a-bug.md
> @@ -18,7 +18,7 @@ When submitting a bug report, please try to do the following:
>   
>   * Include information about the host and guest (operating system, version, 32/64-bit).
>   
> -QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
> +QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](../submit-a-patch).
>   
>   Do NOT report security issues (or other bugs, too) as "confidential" bugs in the
>   bug tracker.  QEMU has a [security process](../security-process) for issues

Reviewed-by: Thomas Huth <thuth@redhat.com>


