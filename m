Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39E389E02
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 08:36:10 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljcHx-00049L-Em
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 02:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ljcGi-0003Tg-VJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ljcGe-0005Mq-Md
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621492468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ke9wOtija8rbcDjULbQAXuGaiJEdtTCqDHR/23oOq5U=;
 b=Hnd/I9YmgzMF18SV2IYvEypBaOJduTFbPP+RV29bHo/kfQv/wq2PddO7ZSvMU3M1q+B1Jb
 1gl22m5nZ3bwa+Vl0cViKQ+rjKTLIkIdBI0/948406DZnz35TVv2C3RMMnEtNgJNdVRoDQ
 DPdJ3taCdXKY0iONcsG/uStYQswdfzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-76-ScgzrNce7etfg1HXacg-1; Thu, 20 May 2021 02:34:25 -0400
X-MC-Unique: 76-ScgzrNce7etfg1HXacg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2763E6D255;
 Thu, 20 May 2021 06:34:24 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D30D60C04;
 Thu, 20 May 2021 06:34:18 +0000 (UTC)
Date: Thu, 20 May 2021 08:34:15 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] Gitlab: Add "Bug" issue reporting template
Message-ID: <YKYC505NAm89qslG@angien.pipo.sk>
References: <20210519213202.3979359-1-jsnow@redhat.com>
 <20210519213202.3979359-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210519213202.3979359-2-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 17:32:01 -0400, John Snow wrote:
> Based loosely on libvirt's template, written by Peter Krempa.
> 
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab/issue_templates/bug.md | 52 ++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 .gitlab/issue_templates/bug.md
> 
> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> new file mode 100644
> index 00000000000..3f31b5e4a09
> --- /dev/null
> +++ b/.gitlab/issue_templates/bug.md
> @@ -0,0 +1,52 @@
> +<!--
> +This is the upstream QEMU issue tracker.
> +
> +Before submitting a bug, please attempt to reproduce your problem using
> +the latest development version of QEMU obtained from
> +https://gitlab.com/qemu-project/qemu/.
> +
> +QEMU generally supports the last two releases advertised via
> +https://www.qemu.org/. Problems with distro-packaged versions of QEMU
> +older than this should be reported to the distribution instead.
> +
> +See https://www.qemu.org/contribute/report-a-bug/ for guidance.
> +-->
> +
> +## Host environment
> + - Operating system: <!-- Windows 10, Fedora 34, etc. -->
> + - OS/kernel version: <!-- For POSIX hosts, use `uname -a` -->
> + - Architecture: <!-- x86, ARM, etc. -->
> + - QEMU flavor: <!-- qemu-system-x86_64, qemu-aarch64, qemu-img, etc. -->
> + - QEMU version: <!-- `qemu-system-x86_64 --version` -->

In the libvirt templates we've refrained from mixing lines to be filled
by users and comments. The users might fill in the required data into
the comment and thus it would not show up in the default view.


> + - QEMU command line:
> +   <!--
> +   Provide the smallest (but complete) command line that reproduces the problem.
> +   Example:
> +       ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
> +   -->

Same here, if the commandline is put into this example section it will
not be visible unless editing the issue. I'd suggest a single-line
comment including the comment tags ...

> +   ```
> +   Insert command line here.

... and put the example here to make the user edit it.

> +   ```
> +
> +## Emulated/Virtualized environment
> + - Operating system: <!-- Windows 10 21H1, Fedora 34, etc. -->
> + - OS/kernel version: <!-- For POSIX guests, use `uname -a` -->
> + - Architecture: <!-- x86, ARM, s390x, etc. -->
> +
> +
> +## Description of problem
> +
> +
> +## Steps to reproduce
> +1.
> +2.
> +3.
> +
> +
> +## Additional information
> +<!-- Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
> +<!-- See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to configure additional QEMU logging. -->
> +
> +
> +<!-- The line below ensures that proper tags are added to the issue. Please do not remove it. -- >
> +/label ~"kind::Bug"

Unfortunately this doesn't seem to work if the user doesn't have
permission to tag issues, which is the default. I'm considering removing
these in libvirt.

In addition, after committing these you should consider copying this
template into the default issue template, which is set via the
repository settings (it needs to be copied and pasted into a textarea in
the web) as gitlab doesn't have a possibility to pick one of the
templates as a default.


