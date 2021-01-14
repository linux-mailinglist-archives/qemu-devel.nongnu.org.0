Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A12F5DF7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:44:26 +0100 (CET)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzB2-0002IG-VC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzzA8-0001ZT-L6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzzA5-0001vT-1j
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610617403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKx+6s88YQ+o6tqdrzDkx/6PQiI1qhp6HmmeI7MgI5w=;
 b=CmPgKIkKfDW3lueBpC/KRxDvwnIRQCwDbrSHqQOd0vu3megax6laTlY2kMJTL3/eJ6eqQU
 vCV6nm0LxgYJVGnutZoOr38Q54Lgqbf/7KvtXzUxHMkVgdNZqeWOtSnroGc+celrsJ4EL2
 3DN0YYQrlT+jGour1q8vemFQvx1A5q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-rz9wXOUdNPWCFHPImGXFvA-1; Thu, 14 Jan 2021 04:43:07 -0500
X-MC-Unique: rz9wXOUdNPWCFHPImGXFvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C90107ACF7;
 Thu, 14 Jan 2021 09:43:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 581CF100AE48;
 Thu, 14 Jan 2021 09:43:01 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Use GitLab repo URLs instead of git.qemu.org
 URLs
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210113185403.276395-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <407faef7-934e-2744-2837-590bc192ff12@redhat.com>
Date: Thu, 14 Jan 2021 10:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210113185403.276395-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2021 19.54, Stefan Hajnoczi wrote:
> Switch to GitLab repo URLs to reduce qemu.org bandwidth.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>   * Added missing URL in _posts/2018-06-28-tcg-testing.md. Mark
>     Cave-Ayland <mark.cave-ayland@ilande.co.uk> and Alex Bennée
>     <alex.bennee@linaro.org> figured out the issue was that the gitweb
>     link referenced a blob object (not a commit) whereas GitLab needs the
>     commit object. Therefore the hash hash in the URL has changed.
> ---
>   _download/source.html                           | 4 ++--
>   _posts/2017-02-04-the-new-qemu-website-is-up.md | 8 ++++----
>   _posts/2017-10-04-qemu-2-10-1.md                | 4 ++--
>   _posts/2018-02-09-understanding-qemu-devices.md | 2 +-
>   _posts/2018-06-28-tcg-testing.md                | 4 ++--
>   contribute.md                                   | 2 +-
>   contribute/security-process.md                  | 4 ++--
>   documentation.md                                | 2 +-
>   support.md                                      | 2 +-
>   9 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/_download/source.html b/_download/source.html
> index 5798633..14fb6dc 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -9,7 +9,7 @@
>   	{% include releases.html %}
>   	</div>
>   	<p>or stay on the bleeding edge with the
> -	   <a href="https://git.qemu.org/?p=qemu.git">git repository!</a></p>
> +	   <a href="https://gitlab.com/qemu-project/qemu.git">git repository!</a></p>

For "clickable" links (i.e. not the URLs used for cloning), I'd suggest to 
drop the ".git" suffix, since there will be a redirection to the suffix-less 
URL otherwise.

If you agree, I can fix it up when picking up the patch, no need to resend 
just because of this.

  Thomas


>   	<h2>Build instructions</h2>
>   
> @@ -24,7 +24,7 @@ make
>   	{% endfor %}
>   
>   	<p>To download and build QEMU from git:</p>
> -<pre>git clone https://git.qemu.org/git/qemu.git
> +<pre>git clone https://gitlab.com/qemu-project/qemu.git
>   cd qemu
>   git submodule init
>   git submodule update --recursive
> diff --git a/_posts/2017-02-04-the-new-qemu-website-is-up.md b/_posts/2017-02-04-the-new-qemu-website-is-up.md
> index b9455a0..e7ed349 100644
> --- a/_posts/2017-02-04-the-new-qemu-website-is-up.md
> +++ b/_posts/2017-02-04-the-new-qemu-website-is-up.md
> @@ -15,7 +15,7 @@ developers to share information quickly with the rest of the community.
>   We tried to test the website on most browsers and to make it lightweight
>   and responsive.  It is built using [Jekyll](https://jekyllrb.com/)
>   and the source code for the website can be cloned from the
> -[qemu-web.git](https://git.qemu.org/?p=qemu-web.git;a=summary)
> +[qemu-web.git](https://gitlab.com/qemu-project/qemu-web.git)
>   repository.  Just like for any other project hosted by QEMU, the best way
>   to propose or contribute a new change is by sending a patch through the
>   [qemu-devel@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qemu-devel)
> @@ -25,10 +25,10 @@ confuse it with a qemu.git patch (if you run `git config format.subjectprefix
>   
>   For example, if you would like to add a new screenshot to the homepage,
>   you can clone the `qemu-web.git` repository, add a PNG file to the
> -[`screenshots/`](https://git.qemu.org/?p=qemu-web.git;a=tree;f=screenshots;hb=HEAD)
> -directory, and edit the [`_data/screenshots.yml`](https://git.qemu.org/?p=qemu-web.git;a=blob;f=_data/screenshots.yml;hb=HEAD)
> +[`screenshots/`](https://gitlab.com/qemu-project/qemu-web/-/tree/master/screenshots)
> +directory, and edit the [`_data/screenshots.yml`](https://gitlab.com/qemu-project/qemu-web/-/tree/master/_data/screenshots.yml)
>   file to include the new screenshot.
>   
>   Blog posts about QEMU are also welcome; they are simple HTML or Markdown
> -files and are stored in the [`_posts/`](https://git.qemu.org/?p=qemu-web.git;a=tree;f=_posts;hb=HEAD)
> +files and are stored in the [`_posts/`](https://gitlab.com/qemu-project/qemu-web/-/tree/master/_posts)
>   directory of the repository.
> diff --git a/_posts/2017-10-04-qemu-2-10-1.md b/_posts/2017-10-04-qemu-2-10-1.md
> index 6fa00fa..f20adce 100644
> --- a/_posts/2017-10-04-qemu-2-10-1.md
> +++ b/_posts/2017-10-04-qemu-2-10-1.md
> @@ -9,9 +9,9 @@ is now available! You can grab the tarball from our
>   [download page](https://www.qemu.org/download/#source).
>   
>   Version 2.10.1 is now tagged in the official
> -[qemu.git repository](https://git.qemu.org/?p=qemu.git;a=shortlog;h=v2.10.1)
> +[qemu.git repository](https://gitlab.com/qemu-project/qemu/-/commits/v2.10.1/)
>   (where you can also find the changelog with details), and the
> -[stable-2.10 branch](https://git.qemu.org/?p=qemu.git;a=shortlog;h=refs/heads/stable-2.10)
> +[stable-2.10 branch](https://gitlab.com/qemu-project/qemu/-/commits/stable-2.10)
>   has been updated accordingly.
>   
>   Apart from the normal range of general fixes, this update contains security
> diff --git a/_posts/2018-02-09-understanding-qemu-devices.md b/_posts/2018-02-09-understanding-qemu-devices.md
> index 25130b7..c201a9b 100644
> --- a/_posts/2018-02-09-understanding-qemu-devices.md
> +++ b/_posts/2018-02-09-understanding-qemu-devices.md
> @@ -80,7 +80,7 @@ treating a file in the host filesystem as raw data (a 1:1 mapping of
>   offsets in the host file to disk offsets being accessed by the guest
>   driver), but QEMU actually has the ability to glue together a lot of
>   different host formats (raw,
> -[qcow2](https://git.qemu.org/?p=qemu.git;a=blob;f=docs/interop/qcow2.txt),
> +[qcow2](https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qcow2.txt),
>   qed,
>   [vhdx](https://www.microsoft.com/en-us/download/details.aspx?id=34750),
>   ...) and protocols (file system, block device,
> diff --git a/_posts/2018-06-28-tcg-testing.md b/_posts/2018-06-28-tcg-testing.md
> index ddaf18d..29ef602 100644
> --- a/_posts/2018-06-28-tcg-testing.md
> +++ b/_posts/2018-06-28-tcg-testing.md
> @@ -69,7 +69,7 @@ tests it can support.
>   # `make check-tcg`
>   
>   With the latest work [merged into
> -master](https://git.qemu.org/?p=qemu.git;a=commit;h=de44c044420d1139480fa50c2d5be19223391218) we can now
> +master](https://gitlab.com/qemu-project/qemu/-/commit/de44c044420d1139480fa50c2d5be19223391218) we can now
>   take advantage of either hand-configured and Docker-based cross
>   compilers to build test cases for TCG again. To run the TCG tests
>   after you have built QEMU:
> @@ -133,5 +133,5 @@ results from a qemu-system emulation. Some architectures have
>   semi-hosting support already for this while others report their test
>   status over a simple serial link which will need to be parsed and
>   handled in custom versions of the
> -[`run-%:`](https://git.qemu.org/?p=qemu.git;a=blob;f=tests/tcg/Makefile;h=bf064153900a438e4ad8e2d79eaaac8a27d66062;hb=HEAD#l95)
> +[`run-%:`](https://gitlab.com/qemu-project/qemu/-/blob/de44c044420d1139480fa50c2d5be19223391218/tests/tcg/Makefile#L95)
>   rule.
> diff --git a/contribute.md b/contribute.md
> index 96901b5..307f1be 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -6,7 +6,7 @@ permalink: /contribute/
>   * Report a bug in our bugtracker: [https://bugs.launchpad.net/qemu/](https://bugs.launchpad.net/qemu/)<br>
>     See also [How to report a bug](report-a-bug/) or [How to report a security bug](security-process/)
>   
> -* Clone ([or browse](https://git.qemu.org/?p=qemu.git)) the git repository: <br>`git clone https://git.qemu.org/git/qemu.git`
> +* Clone ([or browse](https://gitlab.com/qemu-project/qemu.git)) the git repository: <br>`git clone https://gitlab.com/qemu-project/qemu.git`
>   
>   * Join the mailing list: [qemu-devel@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qemu-devel)<br>[See the list of QEMU mailing lists](https://wiki.qemu.org/MailingLists)
>   
> diff --git a/contribute/security-process.md b/contribute/security-process.md
> index 13b6b97..94eef35 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
> @@ -140,7 +140,7 @@ only be exercised in use cases where QEMU and everything interacting with it is
>   trusted.
>   
>   For example, consider upstream commit [9201bb9 "sdhci.c: Limit the maximum
> -block size"](http://git.qemu.org/?p=qemu.git;a=commit;h=9201bb9), an of out of
> +block size"](https://gitlab.com/qemu-project/qemu/-/commit/9201bb9), an of out of
>   bounds (OOB) memory access (ie. buffer overflow) issue that was found and fixed
>   in the SD Host Controller emulation (hw/sd/sdhci.c).
>   
> @@ -151,7 +151,7 @@ is via 'generic-sdhci' interface.
>   
>   Of these two, the 'sdhci-pci' interface had actually been disabled by default
>   in the upstream QEMU releases (commit [1910913 "sdhci: Make device "sdhci-pci"
> -unavailable with -device"](http://git.qemu.org/?p=qemu.git;a=commit;h=1910913)
> +unavailable with -device"](https://gitlab.com/qemu-project/qemu/-/commit/1910913)
>   at the time the flaw was reported; therefore, guests could not possibly use
>   'sdhci-pci' for any purpose.
>   
> diff --git a/documentation.md b/documentation.md
> index 41d9b3a..be4e637 100644
> --- a/documentation.md
> +++ b/documentation.md
> @@ -9,7 +9,7 @@ is the first place to go in case you have questions about using QEMU.
>   Most of the documentation is generated automatically from the QEMU git source
>   tree, however some text files have not been converted to the new format yet.
>   These documentation files can be browsed via the
> -[git web interface](https://git.qemu.org/?p=qemu.git;a=tree;f=docs;hb=master)
> +[git web interface](https://gitlab.com/qemu-project/qemu/-/tree/master/docs)
>   instead.
>   
>   The [QEMU wiki](https://wiki.qemu.org) contains more
> diff --git a/support.md b/support.md
> index 031f045..49cbb0f 100644
> --- a/support.md
> +++ b/support.md
> @@ -12,7 +12,7 @@ rest of your Linux distribution you may be better served by asking
>   through your distribution's support channels. This includes questions
>   about a specifically packaged version of QEMU. The QEMU developers are
>   generally concerned with the latest release and the current state of
> -the [master branch](https://git.qemu.org/?p=qemu.git) and do not
> +the [master branch](https://gitlab.com/qemu-project/qemu.git) and do not
>   provide support for QEMU binaries shipped by Linux distributions.
>   
>   Questions about complex configurations of networking and storage are
> 


