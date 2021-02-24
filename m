Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE17324762
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 00:12:00 +0100 (CET)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF3K3-0000Th-0o
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 18:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lF3IZ-0008L4-Pl; Wed, 24 Feb 2021 18:10:27 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lF3IX-0007lK-AL; Wed, 24 Feb 2021 18:10:26 -0500
Received: by mail-wm1-x329.google.com with SMTP id m1so3286812wml.2;
 Wed, 24 Feb 2021 15:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cKYk1BlXdXmONJSW0juNzIv8A0kBbLqwqifbrnnfbjI=;
 b=DL1lP3nVRGCWTZNm/8OIYpSMH3qwQYZ5+OavUiHMwsGhPufcPrB3bgNMtV35o6UYgW
 Ir/ARPCnSrV3etM2NCA+xryQDzUrnEDkfr8CZBm+MbTNXW2rMvcfHkmhr1h1RNXQE9cg
 Ix7foQksCQ1XO9rhYS4ffsLRoNnL4scNTzyAzFpeFPXnPuBChGIlcmA6vTdBX70hYwkd
 m9DKYDPiJoihDgHpoMoN/qaTWvPDxLpstxJSzQ1UtNSJRf09ft84oJpkeCqKpkQsgRe9
 SFXIXyD3IMbDyarG/BceRBoMzA9xt1u9WbfNpcjLX0KJ15fnCzYfJ1bS6NiMT5im3OF6
 qdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cKYk1BlXdXmONJSW0juNzIv8A0kBbLqwqifbrnnfbjI=;
 b=AqMaxmWXzz/qPNj0RKGNq3BM1ERDFiBgo9rVIICNsYPKJujryUNfB+KhT8zzUSxfiJ
 sbrekDP9TQEKI86gO//LaayWVBXWtA01Y5j8GlSRBhCejjKik8VadYM3S9N0ht9uFCUN
 GV+V9LKv4nr+DuzJdjZp5A2fRSqAAa68SBKONa4dLNM8ZGf0ekQDMpMwLMpq1OdDG5/j
 l7jrzD+RAcoMU+zFmv6tPP7xgqByhNySLeVXMxwO+sSQu2ADs7y167t0grk/vSIeVPmw
 6QqUwtvis2uo3S3sdS4aipW0d8FSaesK6xN3xYibQ+MOXLMMA3dM1V27/DFVIUygjBQN
 9kmw==
X-Gm-Message-State: AOAM532iK4kwhINQ9gcLtwlaDOgdi3GH0bTexPY+ju8GbKQdtnmhqqTW
 BjWJauW+IG+Y8MsW5gsczFo=
X-Google-Smtp-Source: ABdhPJyaMjgCMJ7BemwaBD6vGDaigJ0mKqS5hl0H5it7LgWcu9Neua1ur0uX5iErtzMgZQy5KZ4W5Q==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr330302wmo.188.1614208223407; 
 Wed, 24 Feb 2021 15:10:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm6257477wra.66.2021.02.24.15.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 15:10:22 -0800 (PST)
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
Date: Thu, 25 Feb 2021 00:10:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas/Daniel/Alex/Peter/Paolo/Stefan/Markus

On 2/24/21 9:02 PM, Niek Linnenbank wrote:
> Hi Philippe, Cleber,
> 
> On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa <crosa@redhat.com
> <mailto:crosa@redhat.com>> wrote:
> 
>     On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daudé wrote:
>     > Hi Niek,
>     >
>     > On 2/23/21 11:53 PM, Niek Linnenbank wrote:
>     > > Currently the automated acceptance tests for the Orange Pi PC
>     and cubieboard
>     > > machines are disabled by default. The tests for both machines
>     require artifacts
>     > > that are stored on the apt.armbian.com <http://apt.armbian.com>
>     domain. Unfortunately, some of these artifacts
>     > > have been removed from apt.armbian.com <http://apt.armbian.com>
>     and it is uncertain whether more will be removed.
>     > >
>     > > This commit moves the artifacts previously stored on
>     apt.armbian.com <http://apt.armbian.com> to github
>     > > and retrieves them using the path: '/<machine>/<artifact>'.
>     > >
>     > > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>     > > Reviewed-by: Willian Rampazzo <willianr@redhat.com
>     <mailto:willianr@redhat.com>>
>     > > Reviewed-by: Cleber Rosa <crosa@redhat.com
>     <mailto:crosa@redhat.com>>
...

>     Nope, and I'm having issues with those URLs.  For instance:
> 
>        $ curl -L
>     https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb
>     <https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb>
>        version https://git-lfs.github.com/spec/v1
>     <https://git-lfs.github.com/spec/v1>
>        oid
>     sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda56380b
>        size 20331524
> 
>     Looks like it has to do with GitHub's behavior wrt quota.
> 
> 
> Indeed. Just this morning I received an e-mail from github with the
> following text:
> 
> "[GitHub] Git LFS disabled for nieklinnenbank
> 
> Git LFS has been disabled on your personal account nieklinnenbank
> because you’ve exceeded your data plan by at least 150%.
> Please purchase additional data packs to cover your bandwidth and
> storage usage:
> 
>   https://github.com/account/billing/data/upgrade
> <https://github.com/account/billing/data/upgrade>
> 
> Current usage as of 24 Feb 2021 09:49AM UTC:
> 
>   Bandwidth: 1.55 GB / 1 GB (155%)
>   Storage: 0.48 GB / 1 GB (48%)"
>  
> I wasn't aware of it but it appears that Github has these quota's for
> the Large File Storage (LFS). I uploaded the files in the git LFS
> because single files are also limited to 100MiB each on the regular Git
> repositories.
> 
> With those strict limits, in my opinion Github isn't really a solution
> since the bandwidth limit will be reached very quickly. At least for the
> LFS part that is. I don't know yet if there is any limit for regular access.
> 
> My current ideas:
>   - we can try to splitup the larger files into sizes < 100MiB in order
> to use github regular storage. and then download each part to combine
> into the final image.
>     im not really in favour of this but it can work, if github doesnt
> have any other limit/quota. the cost is that we have to add more
> complexity to the acceptance test code.
>   - we can try to just update the URLs to armbian that are working now
> (with the risk of breaking again in the near future). Ive also found
> this link, which may be more stable:
>      https://archive.armbian.com/orangepipc/archive/
> <https://archive.armbian.com/orangepipc/archive/>
>   - or use the server that im hosting - and i don't mind to add the
> license files on it if needed (should be GPLv2 right?)
> 
> I'd be interested to hear your opinion and suggestions.
> 
> Kind regards,
> Niek

Some of the unpractical options I can think of...:

- do not contribute tests using binary blob
- do not allow test image >100 MiB
- contribute tests with sha1 of (big) image but say "if you want
  the test image contact me off-list" then when the contributor
  stop responding we remove the test
- have anyone setup its servers with tests source and images,
  without committing anything to the repository. Interested
  maintainers/testers are on their own.
- testing done behind the scene

TBH I'm a bit hopeless.

Regards,

Phil.

