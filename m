Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6C39E28C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:17:23 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHwH-0000kx-5O
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqHv5-0008RV-8X
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:16:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqHv1-0006c9-HR
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:16:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z8so18246955wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=T4zP+yYuDnMoshOH6fGM6G98BPMA2yxBMpD5gSkT6Uc=;
 b=bSfN66eu4inrZPKvI4pI3psur21ZhZXPryrAmPiyAdwWySLS9/31aRMtP9jsa0pEXu
 Bpw2Q7zh+vkQNxATiRbSvP/GWh2g/3TMl7w0r0ZRwphhGer5BKm66HePzvlYZDAMgmAB
 upwwDJjs4KwtCfJZt98NVIBMsrOs7EvrknyANhBkzsQ5/3scpcHGjavdH2oQCJkNwOdW
 pul6oRVhBxoDm8MNE6Bk4jbk9ExwmVdIrcNfdyiT7t2Zr6tViwo0VvAjTF3RTJ2OjptY
 D0f8CsAaodBoE0k0mI5otYU5Vq2h3cMFBFzZqGFqDAODXmbsQC6X7hYJ1OmXWlr+Ab2G
 CEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=T4zP+yYuDnMoshOH6fGM6G98BPMA2yxBMpD5gSkT6Uc=;
 b=HWEaXtTgFxsQXDmH4ky30Efg7lhSqjRF1HvtjhaCmix0+eMlsloDrzhk9iapGahyhV
 S/e+keQRSsJHSQEdCRFJXjckfAupeJmaNcOB/es2gzjswY44o5wDEMHyJZA0QeZaZ/Ie
 XkbYFy9pk4BmZ3M2S1PMJGxOZQ5Ypfbz1pFwo+K+6kv34T5dwRS3m79D3NICqRagZpqB
 6wUWR7d3TgTkAR1ImnYANu4NplS0k94rXBHjCEfGwMOC4UzXmQRTSXMtx3G0Nsqio5gr
 WzSU8vmuUIGWutcFypmrVCDaPcx49ps7IQUX/V2n6vNutChm1KiJpCRvUCj0z90EPKvD
 BBkg==
X-Gm-Message-State: AOAM532F6GCx368EI8TVsb0uZ91cRIiJxtEHOG+Dr/LSgugTbesUrHDA
 od3WWtqo41xXADyDLj1pDAokVg==
X-Google-Smtp-Source: ABdhPJxQZyQA170mFdY8WETacgnwHmEP5nI5iQPEQouufJTmc+u7Nyjf584SrJdJUuysXS4ua8pZQQ==
X-Received: by 2002:adf:a550:: with SMTP id j16mr18232147wrb.25.1623082561380; 
 Mon, 07 Jun 2021 09:16:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm11763437wrp.61.2021.06.07.09.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:16:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B62D21FF7E;
 Mon,  7 Jun 2021 17:15:59 +0100 (BST)
References: <20210607143303.28572-1-alex.bennee@linaro.org>
 <20210607143303.28572-6-alex.bennee@linaro.org>
 <YL4yRyLgD1avZdRE@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PULL 5/8] gitlab: work harder to avoid false positives in
 checkpatch
Date: Mon, 07 Jun 2021 17:14:35 +0100
In-reply-to: <YL4yRyLgD1avZdRE@redhat.com>
Message-ID: <8735ttodkw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jun 07, 2021 at 03:33:00PM +0100, Alex Benn=C3=A9e wrote:
>> This copies the behaviour of patchew's configuration to make the diff
>> algorithm generate a minimal diff.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Message-Id: <20210602153247.27651-1-alex.bennee@linaro.org>
>>=20
>> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks=
.yml
>> index 8e30872164..7e685c6a65 100644
>> --- a/.gitlab-ci.d/static_checks.yml
>> +++ b/.gitlab-ci.d/static_checks.yml
>> @@ -3,7 +3,11 @@ check-patch:
>>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>>    needs:
>>      job: amd64-centos8-container
>> -  script: .gitlab-ci.d/check-patch.py
>> +  script:
>> +    - git config --local diff.renamelimit 0
>> +    - git config --local diff.renames True
>> +    - git config --local diff.algorithm histogram
>> +    - .gitlab-ci.d/check-patch.py
>
> No objection to merging this patch as is, but I wonder if we ought to
> make scripts/checkpatch.pl set these options explicitly when it runs
> git, eg
>
>    git -c diff.renamelimit=3D0 -c diff.renames=3DTrue ...etc show
>
> so that everyone who runs checkpatch.pl benefits from the improvement.

Sure - I've generally held off messing with checkpatch directly because
of the general desire to keep it in-sync with upstream. Maybe that's
becoming less of a concern as time goes on?

[AJB says that with a totally straight face despite another patch in
this PR doing exactly that...]

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

