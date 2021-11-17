Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFC454355
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:10:52 +0100 (CET)
Received: from localhost ([::1]:34102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGxu-00049L-1R
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnGwe-0003TJ-1b
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnGwY-0007kZ-6q
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637140164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHCUqR9BrseW+uuf2Y421x/5EuAlcOKc1BOh4XUvbKE=;
 b=YdaAqEZjjbS9zCVVFBGLuibr7hJqApB/ZgvuyyGoN2pE1HNmt7k5GAkBRLCBNkcyc60ldS
 OnZEhAJIbSCY5ysExo+9ADl0EWGmq1V5MmtyGvzUkTwCq895l5MzQ0RiuAdw+b4fjqVeFL
 q9sS5qQeyByNk0lGhZvVeEUjM/sB+jQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-7PygOPLxNcG7lygouqWyeQ-1; Wed, 17 Nov 2021 04:09:18 -0500
X-MC-Unique: 7PygOPLxNcG7lygouqWyeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE12D804141;
 Wed, 17 Nov 2021 09:09:15 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E06B57CD3;
 Wed, 17 Nov 2021 09:08:53 +0000 (UTC)
Message-ID: <e0229a36-b8bd-3822-9994-46279bfa138c@redhat.com>
Date: Wed, 17 Nov 2021 10:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211110144902.388183-1-kchamart@redhat.com>
 <20211110144902.388183-4-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 3/3] docs: rSTify the "SubmitAPatch" wiki
In-Reply-To: <20211110144902.388183-4-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2021 15.49, Kashyap Chamarthy wrote:
> - The original wiki is here[1]. I copied the wiki source[2] into a .wiki
>    file, and used `pandoc` to convert it to rST:
> 
>      $> pandoc -f Mediawiki -t rst submitting-a-patch.wiki -o
>         submitting-a-patch.rst
> 
> - The only minor touch-ups I did was to fix URLs.  But 99%, it is a 1-1
>    conversion.
> 
>    (An example of a "touch-up": under the section "Patch emails must
>    include a Signed-off-by: line", I updated the "see SubmittingPatches
>    1.12"  to "1.12) Sign your work")
> 
> - I have also converted a couple other related wiki pages (included in
>    this patch series) that were hyperlinked within the SubmitAPatch page,
>    or a page that it refers to:
> 
>    - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
>    - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> 
> - Over time, many people contributed to this wiki page; you can find all
>    the authors in the wiki history[3].
> 
> [1] https://wiki.qemu.org/Contribute/SubmitAPatch
> [2] http://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&action=edit
> [3] http://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&action=history
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/devel/index.rst              |   1 +
>   docs/devel/submitting-a-patch.rst | 456 ++++++++++++++++++++++++++++++
>   2 files changed, 457 insertions(+)
>   create mode 100644 docs/devel/submitting-a-patch.rst
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 816eb7b7b0..c3cfa9e41f 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -47,3 +47,4 @@ modifying QEMU's source code.
>      writing-qmp-commands
>      trivial-patches
>      submitting-a-pull-request
> +   submitting-a-patch

I'd suggest to insert this before the pull-request entry, in case anybody 
reads the manual sequentially, it might be better to learn about the patch 
submission process first before reading about pull requests.
(I can fix this up when picking up the patch, no need to resend)

> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> new file mode 100644
> index 0000000000..c80dad47fa
> --- /dev/null
> +++ b/docs/devel/submitting-a-patch.rst
...
> +Split up long patches
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +Split up longer patches into a patch series of logical code changes.
> +Each change should compile and execute successfully. For instance, don't
> +add a file to the makefile in patch one and then add the file itself in
> +patch two. (This rule is here so that people can later use tools like
> +```git bisect`` <http://git-scm.com/docs/git-bisect>`__ without hitting

That hyperlink showed up in the rendered output. I'll fix it up by removing 
the "``" quotes.

> +.. _write_a_meaningful_commit_message:
> +
> +Write a meaningful commit message
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Commit messages should be meaningful and should stand on their own as a
> +historical record of why the changes you applied were necessary or
> +useful.
> +
> +QEMU follows the usual standard for git commit messages: the first line
> +(which becomes the email subject line) is "subsystem: single line
> +summary of change". Whether the "single line summary of change" starts
> +with a capital is a matter of taste, but we prefer that the summary does
> +not end in ".".

That ".". looks a little bit weird in the output ... maybe we should replace 
it with "does not end with a dot." ?

> Look at ``git shortlog -30`` for an idea of sample
> +subject lines. Then there is a blank line and a more detailed
> +description of the patch, another blank and your Signed-off-by: line.
> +Please do not use lines that are longer than 76 characters in your
> +commit message (so that the text still shows up nicely with "git show"
> +in a 80-columns terminal window).
> +
> +The body of the commit message is a good place to document why your
> +change is important. Don't include comments like "This is a suggestion
> +for fixing this bug" (they can go below the "---" line in the email so

That --- gets translated into a — character ... I'll replace the "---" with 
``---`` to fix it.

  Thomas


