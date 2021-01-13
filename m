Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA12F52A1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:45:53 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzl9T-0001Fm-Jb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzl7I-0000Mu-VA
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:43:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzl7E-00083u-V9
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:43:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id y17so3200873wrr.10
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=z0wfI8hzlO0jIaMRPEeDA/YCMoXLGOw2u9bZKcxnKWM=;
 b=Fr2cJrcUKtOLT54twh1sT3lQ31jUc3GbIYOXICPByq/3Vz9FGWYmnCASQOprnIz0eL
 AHWhhY6lRdNhqAOGDXUSO9BC+UGcd+H0ST5YokkZUXwFp7aLVQq19vVAkUiwg3YYr5b7
 +qjDbO1TR87uPopyF1RireWOIwCqmxwfjin6sQ7zbqUg5QoZSrv56LncXNOuUo85E04O
 FQL/2dGsSC9h6ySrxXzOy2nAgGBIzbN9eM4vJTaVenwTvzahvkKuKWhuaZ4YW7pnyi0j
 QmBmyfLoD58AfH/o2ON/LB+P2F5SqICijIhegGqr4i8NzN06GhWiJ5CvtLeWzrfB3YIR
 xXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=z0wfI8hzlO0jIaMRPEeDA/YCMoXLGOw2u9bZKcxnKWM=;
 b=fHlj47TCCdmanv0cENYAsvgzRcrftGkmtL4D0gqqgmJYSh/4mau6DBaCHhTeJKSuhv
 agBCdC5Je1ZFzyeOyKhCw69EYbxH7orxAdZZ41vMDJ1N+LxWSxbqO5Ez/kPQUBDMSfdJ
 QGL34CEvtxBGiveGtefg0kpVXxGXtnGgqXekQz/S5a1fEHUnAkJaFOIbCyOcbmPMoU+X
 BKu+aAXUft8KJvp2ztOIiln1dRDrQk7isUI62tGH4N0EYUSuT1hHxhjxSg48YR7qxDQE
 PwRjzz8oJlIXJeOWAiQW0tZRlUNiQC9MrqcJ52eN8ySX8nx6ocTi2tLBtHW+iz8TuYMw
 Nx/w==
X-Gm-Message-State: AOAM532aGRgdxDi+s3fmvtAs0ioBHvccSRzUV2QdIQzUG2cxZruVSRwK
 4RpUshl5t5Wt4YUavbN/ReVsojWdMquvDA==
X-Google-Smtp-Source: ABdhPJxZQYOsEnupGI9u4tZ5pbH6+6fZmcELBe72yFWiMCUQwbIcfWqFft9Sjtwoadr00IGl5hKC/g==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr4060959wrq.352.1610563410586; 
 Wed, 13 Jan 2021 10:43:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u17sm4155772wmj.35.2021.01.13.10.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 10:43:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5B2E1FF7E;
 Wed, 13 Jan 2021 18:43:28 +0000 (GMT)
References: <20210113173605.273811-1-stefanha@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [qemu-web PATCH] Use GitLab repo URLs instead of git.qemu.org URLs
Date: Wed, 13 Jan 2021 18:43:15 +0000
In-reply-to: <20210113173605.273811-1-stefanha@redhat.com>
Message-ID: <87zh1clltb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> Switch to GitLab repo URLs to reduce qemu.org bandwidth.
>
> Note that there is still one git.qemu.org remaining in
> _posts/2018-06-28-tcg-testing.md. The git object doesn't exist in GitLab
> and it's hard to use master since the link was to a Makefile that has
> since changed significantly. Nevermind.

That would be:

modified   _posts/2018-06-28-tcg-testing.md
@@ -133,5 +133,5 @@ results from a qemu-system emulation. Some architecture=
s have
 semi-hosting support already for this while others report their test
 status over a simple serial link which will need to be parsed and
 handled in custom versions of the
-[`run-%:`](https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtests/tcg/Makef=
ile;h=3Dbf064153900a438e4ad8e2d79eaaac8a27d66062;hb=3DHEAD#l95)
+[`run-%:`](https://gitlab.com/qemu-project/qemu/-/blob/de44c044420d1139480=
fa50c2d5be19223391218/tests/tcg/Makefile#L95)=20
 rule.


>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  _download/source.html                           | 4 ++--
>  _posts/2017-02-04-the-new-qemu-website-is-up.md | 8 ++++----
>  _posts/2017-10-04-qemu-2-10-1.md                | 4 ++--
>  _posts/2018-02-09-understanding-qemu-devices.md | 2 +-
>  _posts/2018-06-28-tcg-testing.md                | 2 +-
>  contribute.md                                   | 2 +-
>  contribute/security-process.md                  | 4 ++--
>  documentation.md                                | 2 +-
>  support.md                                      | 2 +-
>  9 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/_download/source.html b/_download/source.html
> index 5798633..14fb6dc 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -9,7 +9,7 @@
>  	{% include releases.html %}
>  	</div>
>  	<p>or stay on the bleeding edge with the
> -	   <a href=3D"https://git.qemu.org/?p=3Dqemu.git">git repository!</a></=
p>
> +	   <a href=3D"https://gitlab.com/qemu-project/qemu.git">git repository!=
</a></p>
>=20=20
>  	<h2>Build instructions</h2>
>=20=20
> @@ -24,7 +24,7 @@ make
>  	{% endfor %}
>=20=20
>  	<p>To download and build QEMU from git:</p>
> -<pre>git clone https://git.qemu.org/git/qemu.git
> +<pre>git clone https://gitlab.com/qemu-project/qemu.git
>  cd qemu
>  git submodule init
>  git submodule update --recursive
> diff --git a/_posts/2017-02-04-the-new-qemu-website-is-up.md b/_posts/201=
7-02-04-the-new-qemu-website-is-up.md
> index b9455a0..e7ed349 100644
> --- a/_posts/2017-02-04-the-new-qemu-website-is-up.md
> +++ b/_posts/2017-02-04-the-new-qemu-website-is-up.md
> @@ -15,7 +15,7 @@ developers to share information quickly with the rest o=
f the community.
>  We tried to test the website on most browsers and to make it lightweight
>  and responsive.  It is built using [Jekyll](https://jekyllrb.com/)
>  and the source code for the website can be cloned from the
> -[qemu-web.git](https://git.qemu.org/?p=3Dqemu-web.git;a=3Dsummary)
> +[qemu-web.git](https://gitlab.com/qemu-project/qemu-web.git)
>  repository.  Just like for any other project hosted by QEMU, the best way
>  to propose or contribute a new change is by sending a patch through the
>  [qemu-devel@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qemu-d=
evel)
> @@ -25,10 +25,10 @@ confuse it with a qemu.git patch (if you run `git con=
fig format.subjectprefix
>=20=20
>  For example, if you would like to add a new screenshot to the homepage,
>  you can clone the `qemu-web.git` repository, add a PNG file to the
> -[`screenshots/`](https://git.qemu.org/?p=3Dqemu-web.git;a=3Dtree;f=3Dscr=
eenshots;hb=3DHEAD)
> -directory, and edit the [`_data/screenshots.yml`](https://git.qemu.org/?=
p=3Dqemu-web.git;a=3Dblob;f=3D_data/screenshots.yml;hb=3DHEAD)
> +[`screenshots/`](https://gitlab.com/qemu-project/qemu-web/-/tree/master/=
screenshots)
> +directory, and edit the [`_data/screenshots.yml`](https://gitlab.com/qem=
u-project/qemu-web/-/tree/master/_data/screenshots.yml)
>  file to include the new screenshot.
>=20=20
>  Blog posts about QEMU are also welcome; they are simple HTML or Markdown
> -files and are stored in the [`_posts/`](https://git.qemu.org/?p=3Dqemu-w=
eb.git;a=3Dtree;f=3D_posts;hb=3DHEAD)
> +files and are stored in the [`_posts/`](https://gitlab.com/qemu-project/=
qemu-web/-/tree/master/_posts)
>  directory of the repository.
> diff --git a/_posts/2017-10-04-qemu-2-10-1.md b/_posts/2017-10-04-qemu-2-=
10-1.md
> index 6fa00fa..f20adce 100644
> --- a/_posts/2017-10-04-qemu-2-10-1.md
> +++ b/_posts/2017-10-04-qemu-2-10-1.md
> @@ -9,9 +9,9 @@ is now available! You can grab the tarball from our
>  [download page](https://www.qemu.org/download/#source).
>=20=20
>  Version 2.10.1 is now tagged in the official
> -[qemu.git repository](https://git.qemu.org/?p=3Dqemu.git;a=3Dshortlog;h=
=3Dv2.10.1)
> +[qemu.git repository](https://gitlab.com/qemu-project/qemu/-/commits/v2.=
10.1/)
>  (where you can also find the changelog with details), and the
> -[stable-2.10 branch](https://git.qemu.org/?p=3Dqemu.git;a=3Dshortlog;h=
=3Drefs/heads/stable-2.10)
> +[stable-2.10 branch](https://gitlab.com/qemu-project/qemu/-/commits/stab=
le-2.10)
>  has been updated accordingly.
>=20=20
>  Apart from the normal range of general fixes, this update contains secur=
ity
> diff --git a/_posts/2018-02-09-understanding-qemu-devices.md b/_posts/201=
8-02-09-understanding-qemu-devices.md
> index 25130b7..c201a9b 100644
> --- a/_posts/2018-02-09-understanding-qemu-devices.md
> +++ b/_posts/2018-02-09-understanding-qemu-devices.md
> @@ -80,7 +80,7 @@ treating a file in the host filesystem as raw data (a 1=
:1 mapping of
>  offsets in the host file to disk offsets being accessed by the guest
>  driver), but QEMU actually has the ability to glue together a lot of
>  different host formats (raw,
> -[qcow2](https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/interop/qco=
w2.txt),
> +[qcow2](https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/=
qcow2.txt),
>  qed,
>  [vhdx](https://www.microsoft.com/en-us/download/details.aspx?id=3D34750),
>  ...) and protocols (file system, block device,
> diff --git a/_posts/2018-06-28-tcg-testing.md b/_posts/2018-06-28-tcg-tes=
ting.md
> index ddaf18d..bd9ce50 100644
> --- a/_posts/2018-06-28-tcg-testing.md
> +++ b/_posts/2018-06-28-tcg-testing.md
> @@ -69,7 +69,7 @@ tests it can support.
>  # `make check-tcg`
>=20=20
>  With the latest work [merged into
> -master](https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dde44c044420d11=
39480fa50c2d5be19223391218) we can now
> +master](https://gitlab.com/qemu-project/qemu/-/commit/de44c044420d113948=
0fa50c2d5be19223391218) we can now
>  take advantage of either hand-configured and Docker-based cross
>  compilers to build test cases for TCG again. To run the TCG tests
>  after you have built QEMU:
> diff --git a/contribute.md b/contribute.md
> index 96901b5..307f1be 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -6,7 +6,7 @@ permalink: /contribute/
>  * Report a bug in our bugtracker: [https://bugs.launchpad.net/qemu/](htt=
ps://bugs.launchpad.net/qemu/)<br>
>    See also [How to report a bug](report-a-bug/) or [How to report a secu=
rity bug](security-process/)
>=20=20
> -* Clone ([or browse](https://git.qemu.org/?p=3Dqemu.git)) the git reposi=
tory: <br>`git clone https://git.qemu.org/git/qemu.git`
> +* Clone ([or browse](https://gitlab.com/qemu-project/qemu.git)) the git =
repository: <br>`git clone https://gitlab.com/qemu-project/qemu.git`
>=20=20
>  * Join the mailing list: [qemu-devel@nongnu.org](https://lists.nongnu.or=
g/mailman/listinfo/qemu-devel)<br>[See the list of QEMU mailing lists](http=
s://wiki.qemu.org/MailingLists)
>=20=20
> diff --git a/contribute/security-process.md b/contribute/security-process=
.md
> index 13b6b97..94eef35 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
> @@ -140,7 +140,7 @@ only be exercised in use cases where QEMU and everyth=
ing interacting with it is
>  trusted.
>=20=20
>  For example, consider upstream commit [9201bb9 "sdhci.c: Limit the maxim=
um
> -block size"](http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D9201bb9), =
an of out of
> +block size"](https://gitlab.com/qemu-project/qemu/-/commit/9201bb9), an =
of out of
>  bounds (OOB) memory access (ie. buffer overflow) issue that was found an=
d fixed
>  in the SD Host Controller emulation (hw/sd/sdhci.c).
>=20=20
> @@ -151,7 +151,7 @@ is via 'generic-sdhci' interface.
>=20=20
>  Of these two, the 'sdhci-pci' interface had actually been disabled by de=
fault
>  in the upstream QEMU releases (commit [1910913 "sdhci: Make device "sdhc=
i-pci"
> -unavailable with -device"](http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;=
h=3D1910913)
> +unavailable with -device"](https://gitlab.com/qemu-project/qemu/-/commit=
/1910913)
>  at the time the flaw was reported; therefore, guests could not possibly =
use
>  'sdhci-pci' for any purpose.
>=20=20
> diff --git a/documentation.md b/documentation.md
> index 41d9b3a..be4e637 100644
> --- a/documentation.md
> +++ b/documentation.md
> @@ -9,7 +9,7 @@ is the first place to go in case you have questions about=
 using QEMU.
>  Most of the documentation is generated automatically from the QEMU git s=
ource
>  tree, however some text files have not been converted to the new format =
yet.
>  These documentation files can be browsed via the
> -[git web interface](https://git.qemu.org/?p=3Dqemu.git;a=3Dtree;f=3Ddocs=
;hb=3Dmaster)
> +[git web interface](https://gitlab.com/qemu-project/qemu/-/tree/master/d=
ocs)
>  instead.
>=20=20
>  The [QEMU wiki](https://wiki.qemu.org) contains more
> diff --git a/support.md b/support.md
> index 031f045..49cbb0f 100644
> --- a/support.md
> +++ b/support.md
> @@ -12,7 +12,7 @@ rest of your Linux distribution you may be better serve=
d by asking
>  through your distribution's support channels. This includes questions
>  about a specifically packaged version of QEMU. The QEMU developers are
>  generally concerned with the latest release and the current state of
> -the [master branch](https://git.qemu.org/?p=3Dqemu.git) and do not
> +the [master branch](https://gitlab.com/qemu-project/qemu.git) and do not
>  provide support for QEMU binaries shipped by Linux distributions.
>=20=20
>  Questions about complex configurations of networking and storage are


--=20
Alex Benn=C3=A9e

