Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87537A879
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:07:17 +0200 (CEST)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT2a-0005AK-Dy
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSyu-0001Kd-K7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:03:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSys-0005vF-BO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:03:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h4so20247693wrt.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9LW26CMfrHHtZsstmvVrOzHakC01b6YygA8vYBbNQ8A=;
 b=sZBcj87Z/4oC0yeJgoPJFIOrnIZdcTAdSJaeZZ1P/Bpe1XfNYP9LCUDwws70qjDROQ
 OBGZ9GqQzKolPIYceFU6Gs3PAombw1ULQoBHA9Tz9Dcgb+pxBJ8Bq9a62RVUcZyBa7Yj
 IzVqCCL32SEohE9afiSVnCHPYe3/UMkQADVvoA+9MT0kuGXpsc5LCKgOaFo2jX8i8Vli
 S0qHTFwERJ+mUBq3RCiv09P5bbhW9mGgyGB0CRDQMYp3R5gkQiIC8e+7vBRb17ikC6gP
 8VYs0c3SV/b9+d4LLSHsLbjH21lfOYjDH5ZJ564xTcRUlbRuh63tw4+qrtawlGXQNHge
 WVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9LW26CMfrHHtZsstmvVrOzHakC01b6YygA8vYBbNQ8A=;
 b=IJQE6SRrlERMiFymWEjmcNZxnuW3LJHJABrakIIETXSqGBEPCb6cTnPQall1F9S6W2
 LZI17wHXRkCejuyExqqZLLlgJ+pa3BKk/xtmV9FC2rjFwRje5uc04/BgA3oRF/4EC2+l
 7FDE27P/e6z31lPC6g+9slHNtmewiOipkAHJ83HJJEL2rvURxaWgyyA5OsYYFgw2jcal
 FBWT0nZmniQukZrEmaItlu15RLsTQebbZwkMxLYZyanQRAKAH1b8MtYociuCreSn4IbV
 m87F9LXy3Va+CWKS64RInNRRQDuMOi48UIrWXBFzRHGkGqDGuEHG/odCc6clcx24B5bM
 f6+Q==
X-Gm-Message-State: AOAM530ZM2bg3fbFAzugl1BknPXtK8dAm+l69wE3uHnWve2Vqqm3GVL5
 QMt4B6xr7HLvtxCVQwolazg43w==
X-Google-Smtp-Source: ABdhPJxLitnTDe+OtTF/F79CT4fxp/NRgZsSA0q2BdA6rDSWmcmYgIp6d4kiZT5Y7ti3wa94VnXEtA==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr38487269wrr.336.1620741804517; 
 Tue, 11 May 2021 07:03:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m5sm13879119wrs.76.2021.05.11.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:03:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C39E31FF7E;
 Tue, 11 May 2021 15:03:22 +0100 (BST)
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <YH1QJZGYQXc6x9Et@redhat.com>
 <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
 <YH1gtK/JFtVE4lF1@redhat.com>
 <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
 <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set
 of jobs
Date: Tue, 11 May 2021 15:00:03 +0100
In-reply-to: <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
Message-ID: <877dk5gyfp.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> +Stefan/Peter
>
> On 4/19/21 12:59 PM, Thomas Huth wrote:
>> On 19/04/2021 12.51, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Apr 19, 2021 at 12:48:25PM +0200, Thomas Huth wrote:
>>>> On 19/04/2021 12.36, Daniel P. Berrang=C3=A9 wrote:
>>>>> On Mon, Apr 19, 2021 at 12:20:55PM +0200, Thomas Huth wrote:
>>>>>> On 19/04/2021 12.10, Erik Skultety wrote:
>>>>>>> On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrang=C3=A9 w=
rote:
>>>>>>>> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daud=C3=
=A9
>>>>>>>> wrote:
>>>>>>>>> Forks run the same jobs than mainstream, which might be overkill.
>>>>>>>>> Allow them to easily rebase their custom set, while keeping using
>>>>>>>>> the mainstream templates, and ability to pick specific jobs from
>>>>>>>>> the mainstream set.
>>>>>>>>>
>>>>>>>>> To switch to your set, simply add your .gitlab-ci.yml as
>>>>>>>>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where
>>>>>>>>> CI_PROJECT_NAMESPACE
>>>>>>>>> is your gitlab 'namespace', usually username). This file will be
>>>>>>>>> used instead of the default mainstream set.
>>>>>>>>
>>>>>>>> I find this approach undesirable, because AFAICT, it means you have
>>>>>>>> to commit this extra file to any of your downstream branches that
>>>>>>>> you want this to be used for.=C2=A0 Then you have to be either del=
ete it
>>>>>>>> again before sending patches upstream, or tell git-publish to
>>>>>>>> exclude the commit that adds this.
>>>>>>>>
>>>>>>>> IMHO any per-contributor overhead needs to not involve committing
>>>>>>>> stuff to their git branches, that isn't intended to go upstream.
>>>>>>>
>>>>>>> Not just that, ideally, they should also run all the upstream
>>>>>>> workloads before
>>>>>>> submitting a PR or posting patches because they'd have to respin
>>>>>>> because of a
>>>>>>> potential failure in upstream pipelines anyway.
>>>>>>
>>>>>> It's pretty clear that you want to run the full QEMU CI before
>>>>>> submitting
>>>>>> patches to the QEMU project, but I think we are rather talking
>>>>>> about forks
>>>>>> here that are meant not meant for immediately contributing to upstre=
am
>>>>>> again, like RHEL where we only build the KVM-related targets and
>>>>>> certainly
>>>>>> do not want to test other things like CPUs that are not capable of
>>>>>> KVM, or a
>>>>>> branch where Philippe only wants to check his MIPS-related work duri=
ng
>>>>>> development.
>>>>>> For contributing patches to upstream, you certainly have to run the
>>>>>> full CI,
>>>>>> but for other things, it's sometimes really useful to cut down the CI
>>>>>> machinery (I'm also doing this in my development branches manually
>>>>>> some
>>>>>> times to speed up the CI), so I think this series make sense, indeed.
>>>>>
>>>>> For a downstream like RHEL, I'd just expect them to replace the main
>>>>> .gitlab-ci.yml entirely to suit their downstream needs.
>>>>
>>>> But that still means that we should clean up the main .gitlab-ci.yml
>>>> file
>>>> anyway, like it is done in this series, to avoid that you always get
>>>> conflicts in this big file with your downstream-only modifications.
>>>> So at
>>>> least up to patch 11 or 12, I think this is a very valuable work that
>>>> Philippe is doing here.
>>>
>>> I don't see a real issue with downstream conflicts. They'll just
>>> periodically pick a release to base themselves off and change once
>>> every 6 months or more.
>>=20
>> It's not only downstream distros that rebase every 6 month. Like
>> Philippe, I'm sometimes hacking my .gitlab-ci.yml of my development
>> branch to speed up the CI during my development cycles (i.e. I'm
>> removing the jobs that I do not need). And I'm regularly rebasing my
>> development branchs. Conflicts in .gitlab-ci.yml are then always
>> painful, so a leaner main .gitlab-ci.yml file would be helpful for me,
>> too, indeed.
>
> Not sure if following up this thread or start a new one, but I got
> blocked again from Gitlab, tagged as a crypto miner for running QEMU
> CI...
> [1]
> https://about.gitlab.com/handbook/support/workflows/investigate_blocked_p=
ipeline.html#trends--high-priority-cases
>
> I pushed 5 different branches to my repository in less than 1h,
> kicking 580 jobs [*].
>
> I didn't try to stress Gitlab, it was a simple "one time in the month
> rebase unmerged branches, push them before respining on the mailing
> list".
>
> I'm considering changing my workflow:
> - not push more than 2 branches per hour (I know 3/h works, so choose
>   a lower number, as we want to add more tests).
> - merge multiple branches locally and push the merged result and
>   bisect / re-push on failure

I stack my branches - so usually I have a:

 testing/next
 gdb/next
 whatever my current hack is

Every week I re-base the branches and re-build my current hacking tree.
If an actual problem shows up in CI I'll bisect on one of my beefy boxes
to fix it and then fix and re-push testing/next and whatever my tip is.

> - run less testing
> - do not run testing

I run a lot of testing locally (or rather on a beefy server) so I'm
really only using GitLab for final validation of trees rather than day 2
day.

>
> This sounds counter productive and doesn't scale to a community of
> contributors asked to use Gitlab.
>
> So far I don't have better idea than this series.
>
> Who is interested in sending patches to improve our workflow?
>
> Thanks,
>
> Phil.
>
> [*] NB I have 3 extra runners added to my namespace, but it didn't
> help, as per [1] I got blocked by reaching an API rate limit.


--=20
Alex Benn=C3=A9e

