Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B24448AF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 19:56:56 +0100 (CET)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miLRN-0002PM-PD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 14:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miLOE-00007z-7z
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 14:53:38 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miLOB-0002fy-Vg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 14:53:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id t30so5019650wra.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=87BUNoCOELFAMAzfZuXYmxLTmjCzJZcWT+KZ8rMKX18=;
 b=Rl8kLYdFhRm6JB3bCzTDZxePcfks4sVe/g4ELnmuyJzBLPM/MXBx/qjE29HUCxVZxl
 7PCIlLEjapOWo4Et559vCLZVJaTUGJrxk1qLt6QCNxcZp6BiaFCuYEqZeqwT6moBoTt2
 WPoIdRlHJ1LB6jAs2eYMkZMANrn1vq+E0qtdYBQvEjqRtjiEwEv40CRBlRxUnYHC7gvy
 f3XMzyPv3cQl6WRY77Mdu8o+CQHxuZ/vZ4C2YJThQdlSDChzyh1OXGGcSySw5e+fKFk5
 5HQmnT3afPe5GIVOqoUass50nQo2NqElmYOnYSfRCP/actbPUOaEVseYOJZAFg15wBaN
 sb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=87BUNoCOELFAMAzfZuXYmxLTmjCzJZcWT+KZ8rMKX18=;
 b=lU1D+9jPYcRaRp4Fph0mR1O25QlMrAs+pKejGKaUrNpF4/qoR+WeV4gke4FqrImuum
 iaD5rXgV5PV5hA0VXwo+oKIcrZ8pItWHyIRdrBWfP/VHATG5RBvTHlfU+iutU6ed0LJ0
 uFlAuQDs9nvg7iXJxQjGPMsScAeMfmdoyFAbwsE0drQ9oltzLRNtHijVB3ZMXnHtMWzo
 d7mfzffcYkLiSc945DO/lS90EioOFnlSPbvm3WVR4BOs2Qa+tE0Kr3DYD5Ig7JnIpfOG
 EfWWF5HYl2ngIlXZWRTbxSkhIG5nrenAVC8u17Mlyb6wlMS+3tsTXzzGsCXd28xG0N/Y
 tKiQ==
X-Gm-Message-State: AOAM532fOX5Cpf3rIHGMXik7G0i5H9SwXEOVJVdaG8jEdctzcNHpenwW
 oWKp737nrVaZM7TiSiCaONE=
X-Google-Smtp-Source: ABdhPJxEibZc4/s4slwsdq2IXvXrLxwEKM7+8ySg/FR3UMQTw7lPM8vEHxYaIMlwvCDJmRRVafrPNw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr22455133wrj.325.1635965614401; 
 Wed, 03 Nov 2021 11:53:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g18sm2821982wrv.42.2021.11.03.11.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 11:53:33 -0700 (PDT)
Message-ID: <3e5bb588-f5c8-cf87-786d-74ac43ba8be8@amsat.org>
Date: Wed, 3 Nov 2021 19:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/6] docker: Add Fedora 35 container
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-7-jsnow@redhat.com> <YYK/2WugmOrTA+62@redhat.com>
 <CAFn=p-Z4ic6=LWdRCjgtYYO2crQbw8=aCgLrbkTwW-5X2=O4iA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFn=p-Z4ic6=LWdRCjgtYYO2crQbw8=aCgLrbkTwW-5X2=O4iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 18:51, John Snow wrote:> On Wed, Nov 3, 2021 at 1:01 PM
Daniel P. Berrangé <berrange@redhat.com
> <mailto:berrange@redhat.com>> wrote:
> 
>     On Wed, Nov 03, 2021 at 10:48:44AM -0400, John Snow wrote:
>     > Or, more accurately, update our current Fedora container to Fedora 35,
>     > and then add a new fedora34 container and build test.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
>     > ---
>     >  .gitlab-ci.d/buildtest.yml               |  16 ++++
>     >  .gitlab-ci.d/container-core.yml          |   5 +
>     >  tests/docker/dockerfiles/fedora.docker   |   2 +-
>     >  tests/docker/dockerfiles/fedora34.docker | 117
>     +++++++++++++++++++++++
> 
>     We already struggle with having too much work in the CI pipeline
>     and will be in trouble when they start enforcing CI limits.
> 
>     With that in mind I'm not sure that having both Fedora versions
>     brings large enough benefit to justify the CI CPU time burnt.
> 
> 
> Fair. I'd say having stuff like ubuntu21.10 is more important than
> having both f34/f35. I have a keen interest on pushing forward into
> bleeding edge releases to identify potential issues sooner rather than
> later; and can generally trust that the older releases are well traveled
> through developer's personal machines.
>  
> 
>     If we did want both versions though, we should be consistent
>     with file naming - ie fedora35.dockre, not fedora.docker
>     to match fedora34.docker.
> 
> 
> OK. I was originally considering the "unversioned" file to be the "most
> recent one" that would update on a rolling schedule. On IRC you made a
> good point that when we fork a stable branch, we actually don't want
> this behavior. Explicit naming is therefore the best policy.
> 
> I am still somewhat interested in having the F34 image, but we don't
> need it on the CI platform right now. Maybe it could be included later
> on as a target of lesser value to only be run occasionally, but I can
> worry about that a little later.

I agree with Daniel, this is not ideal on mainstream CI.

However you can add it to your fork, see commit 8b185c815ce
("gitlab: Document how forks can use different set of jobs"):

+# To use a different set of jobs than the mainstream QEMU project,
+# you need to set the location of your custom yml file at "custom CI/CD
+# configuration path", on your GitLab CI namespace:
+#
https://docs.gitlab.com/ee/ci/pipelines/settings.html#custom-cicd-configuration-path


