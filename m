Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1B470957
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 19:51:38 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvkzY-0003jj-Sn
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 13:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvkyR-00033H-KX
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 13:50:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=43790
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvkyO-0005zg-Gg
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 13:50:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v11so16422331wrw.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=baM27CQpWSWVTBpXBeEzDQwQXI7l766ez/0t1WCF3vo=;
 b=rjgp++8xYzoOUMzuYgZ9uusrTbVaVIxOIpQ6BLyAnyPo4g3kXdV6hDBocVv11PUFI8
 WeIPE4nDE0asyAFQMWvl3+iMq+e/PwtLLwC9fiTf4GA4YFavxxtyEFqHaFZ1reRemMWA
 YuCsDjDd3W5ZhXTl0/8lBfs5NZBaIXpLfmOi6A8GUvywLZ0TeGhl0w4nMg+JqQdWQOTf
 XeZMajKw2UVHjLMkqUAzAJAzGF6v6s8WTw2wS3456rCfvys9PGMuBIu3gaoVDdPQ296G
 McoMISC5sreEyOxB0Wl01TE/TfFZ1edwUBfreK+CjW9jPyoNMQg746atW1xKuJbqztNn
 dcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=baM27CQpWSWVTBpXBeEzDQwQXI7l766ez/0t1WCF3vo=;
 b=FuUMN0HXBbF5kZwbrO42r1Y0rXRhUCoXtAzTsCJ1V+NscRkklELS/ug/6gAb1zaXH1
 R4VE9fHDGPwVc3v3V0sQWhfKpe1AzuuVMxI1A7AjLy5kmTDg+u8qckXmVIk1wIHpUyRT
 igCc4zA9SDGBc4NotkXfdIZNEXx2sCpr0+zAIDusUChYTtMM7LyZzlke3H91Yr8LTWAQ
 oLdGksaSa1DbYFbuXVAsWzjvl4wO5HHrN6Fx9kJBS29DEJaxojgXsHEiQfR7kvL0TP1x
 RyXqMHUyjU5RLSH+uEu9zHv4nt5MqRopR7Yq4IrusxeWjfoyl1NJxgSmBHQM0Htov81V
 Qbdw==
X-Gm-Message-State: AOAM531ugeHxSXNieiu+y8IuwFfqzPwQ2HVhm8mme8ENtnGN/cXT7Dy2
 uG2kLoC/rARb5Vzeo9eE/YtxLr4iyo3KdVSoXnvc6g==
X-Google-Smtp-Source: ABdhPJwwKb3nLsY+ZhbEm0NlKC/Owz6L+4B8DxpQUa156NtBKL3svI2jn43i0GjUdzABDPAMk5VEohBHJYXXEtiomYc=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr16461354wrn.521.1639162207254; 
 Fri, 10 Dec 2021 10:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20211206141427.2395324-1-alex.bennee@linaro.org>
In-Reply-To: <20211206141427.2395324-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 18:49:56 +0000
Message-ID: <CAFEAcA9htw4yeW9U6hxzwEBEfo3mfcNASneneVqrq7VF0mpsZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] blog post: how to get your new feature up-streamed
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Dec 2021 at 14:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Experience has shown that getting new functionality up-streamed can be
> a somewhat painful process. Lets see if we can collect some of our
> community knowledge into a blog post describing some best practices
> for getting code accepted.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

(I shan't bother with a scan for typos etc for the moment.)

> +From time to time I hear of frustrations from potential new
> +contributors who have tried to get new features up-streamed into the
> +QEMU repository. After having read [our patch
> +guidelines](https://qemu.readthedocs.io/en/latest/devel/submitting-a-pat=
ch.html)
> +they post them to [qemu-devel](https://lore.kernel.org/qemu-devel/).
> +Often the patches sit there seemingly unread and unloved. The
> +developer is left wandering if they missed out the secret hand shake
> +required to move the process forward. My hope is that this blog post
> +will help.
> +
> +New features !=3D Fixing a bug
> +----------------------------
> +
> +Adding a new feature is not the same as fixing a bug. For an area of
> +code that is supported for Odd Fixes or above there will be a
> +someone listed in the
> +[MAINTAINERS](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAI=
NERS)
> +file. A properly configured `git-send-email` will even automatically
> +add them to the patches as they are sent out. The maintainer will
> +review the code and if no changes are requested they ensure the
> +patch flows through the appropriate trees and eventually makes it into
> +the master branch.
> +
> +This doesn't usually happen for new code unless your patches happen to
> +touch a directory that is marked as maintained. Without a maintainer
> +to look at and apply your patches how will it ever get merged?

I think there is a distinction here between "new feature added
to something that we already have" and "new feature that isn't
part of something we already have". In the former category for
instance you have things like "support virtio-mem-pci on the
virt board". That's definitely not a bug fix, but it ties into
existing and hopefully maintained in-tree things (the virt board,
the x86 virtio-mem-pci support) whose maintainers are probably[*]
interested and informed enough to help with review. On the other
hand "add support for new target architecture foo" is more
distinct from what we have already.

[*] There is of course the elephant-trap the project sets for
new submitters of having parts of the codebase that according
to MAINTAINERS have a maintainer but in practice that maintainer
is AWOL or overstretched.

There is also the spectrum from "clearly fits neatly into QEMU's
current design" through to "proposing something very new".
"New board" and "new target architecture" may not have a current
maintainer, but they do fit very obviously into our existing
structure and design. Nobody is likely to object on principle,
and the submitter's problem here is merely to attract the attention
of somebody to get it reviewed. On the other hand, a new feature
like "support plugging QEMU into a SystemC emulation" is massively
impactful and poses serious structural questions. A submitter would
have a massive uphill job to gain consensus about supporting the
feature at all, even before getting into the specifics of a patchset.

> +
> +Adding new code to a project is not a free activity. Code that isn't
> +actively maintained has a tendency to [bit
> +rot](http://www.catb.org/jargon/html/B/bit-rot.html) and become a drag
> +on the rest of the code base. The QEMU code base is quite large and
> +none of the developers are knowledgeable about the all of it. If
> +features aren't
> +[documented](https://qemu.readthedocs.io/en/latest/devel/submitting-a-pa=
tch.html)
> +they tend to remain unused as users struggle to enable them. If an
> +unused feature becomes a drag on the rest of the code base by preventing
> +re-factoring and other clean ups it is likely to be deprecated.
> +Eventually deprecated code gets removed from the code base never to be
> +seen again.
> +
> +Fortunately there is a way to avoid the ignominy of ignored new features
> +and that is to become a maintainer of your own code!

I think this is oversimplifying to the point of being misleading.
Some kind of commitment to staying around (ie that this is not
a "drop the code and run away" manoeuvre) is definitely helpful,
but it doesn't by itself do anything to address the primary
problem, which is "you need to persuade somebody to care enough
about your new feature to put in the work to review it".


> +A practically perfect set of patches
> +------------------------------------
> +
> +I don't want to repeat all the valuable information from the
> +submitting patches document but

For a new feature, I think the thing I would most emphasise
is the importance of a really good cover letter. It gets more critical
as you move along the spectrum from "new feature in existing
subsystem" to "new feature but which sits cleanly within QEMU"
to "new and unusual feature". The cover letter is your opportunity
to explain what you're doing and why somebody else should care about
it enough to code review it. It needs to explain the work
to an audience who hasn't spent the last six weeks developing
it, and why it would be useful to the project to accept it.
If the feature looks on the surface like it's "odd thing that
we haven't done before" but is really "quite similar to existing
thing if you look at it closer", the cover letter is a good
place to explain that. (This all applies still for v2 etc;
the v2 cover letter shouldn't assume that the reader was
paying attention and looked at the v1 cover letter or patches.)

> +there is still the
> +problem of getting reviews for your brand new code. Fortunately there
> +is no approved reviewer list for QEMU.

Something of a side-tangent, but I'm not sure about "fortunately".
There's an analogy to be drawn here with some of the points made
in Jo Freeman's _Tyranny of Structurelessness_ essay
(https://www.jofreeman.com/joreen/tyranny.htm) about how if
you don't have official structures and hierarchy you get a
de-facto unofficial one anyway -- we do not have
a formal approved reviewer list, and therefore instead we
have an informal and unacknowledged set of "trusted" reviewers.
The latter situation is not self-evidently better than the former.

-- PMM

