Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772B363F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:11:42 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQsW-0007bF-84
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQqv-00076Q-GV
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:10:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQqt-0002wk-Lr
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:10:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id y204so16449975wmg.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nj3CZbdeoS+pqD6+YWxVLcofJeagJMiHlySFNNX9Jok=;
 b=cA5/VMCUM4V9872+nVg7pdhGZg6VTxlr4LyPYjpfqCkEvdQTKWvPU8XqkR/sstpxar
 MkAN2GF0nXDf8xs9Y1VMOeXNL9T0KkKaY3P58hLe8ngKeVIIoumAehZQQTtilINvlALw
 gkP0uquziWHSViSQyGfCsuCTWm0EZn43IRK/AYyvGIpc810pzQr/xc+4rBQnvQrnzPwq
 57K4u9cMryJEtj3ZY/YEzARIPWGCibiv2SFMyPzdukXHrxr0NRxXYaxHcV+k6ygY/ks6
 ulZeueb/ryM94w6qre24tOlmSedouuCg+tVFh02s+mykRRJgZnR6e6bXxCd2d55GIwUn
 /Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nj3CZbdeoS+pqD6+YWxVLcofJeagJMiHlySFNNX9Jok=;
 b=cimgRoUmHJn3y6cyUbEGjlpIsokh0dzWTsl0dBFMQwdBWpC3jaNgXkkz1cHN/vGE9l
 CgiBfziDWlwEpW4Kp/nFZc1OHfwUX7eneqNl3V42h/szP1HpKiDKMZNls25V2nvWWE//
 pI4reFYSXN37b0Xk8JzUhftikjQSFB+IMwX7De/WyoUTqNSe2rsozgoloq0ZudRYrK60
 HS1OPcRB7eydbFzKcKH0VLIVotOA5wevBnDQdciAlvi6wxvnXo3QYT9LKivz6k80My0q
 a6Ky6xsQYS1AjpGLozEBaIo1jr4DtT6nwWQcvomL+FFXfRASzE5IhVrHMSgdG3Lpb/fl
 BBrw==
X-Gm-Message-State: AOAM530w2uyXrzdWGk+HjpnuWK1n8JLPJ50KC8r6OGT65TYgvy4IxFfq
 wxZD3HMcg5NkB7viLbGj2Us=
X-Google-Smtp-Source: ABdhPJwo8j2NGE/6riBH6+A80I/vp7UKV2X5Vb2Gno4s2yyj9dGRCB9HKG8IHDLzvThmC53/SVczCw==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21023384wmc.150.1618826998004; 
 Mon, 19 Apr 2021 03:09:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j12sm21925734wro.29.2021.04.19.03.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 03:09:57 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <YH1QJZGYQXc6x9Et@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <015bf078-35b5-5bc3-0a8b-c8d2daa7a16c@amsat.org>
Date: Mon, 19 Apr 2021 12:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH1QJZGYQXc6x9Et@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 11:40 AM, Daniel P. Berrangé wrote:
> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daudé wrote:
>> Forks run the same jobs than mainstream, which might be overkill.
>> Allow them to easily rebase their custom set, while keeping using
>> the mainstream templates, and ability to pick specific jobs from
>> the mainstream set.
>>
>> To switch to your set, simply add your .gitlab-ci.yml as
>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
>> is your gitlab 'namespace', usually username). This file will be
>> used instead of the default mainstream set.
> 
> I find this approach undesirable, because AFAICT, it means you have
> to commit this extra file to any of your downstream branches that
> you want this to be used for.  Then you have to be either delete it
> again before sending patches upstream, or tell git-publish to
> exclude the commit that adds this.

Good point. What I'm looking for is allow fork to keep following the
mainstream development.

> IMHO any per-contributor overhead needs to not involve committing
> stuff to their git branches, that isn't intended to go upstream.

But why am I forced to run the upstream overhead stuff into my fork?
I find it counter-productive for my limited set of topic I'm modifying.
Also, why should I wait >2h for a pipeline when I exactly know which
area I'm modifying? This is a waste of time and resources.

Gitlab suggested an alternative 3 months ago, it is still fresh:
https://docs.gitlab.com/ee/ci/yaml/README.html#variables-with-include
combined with
https://docs.gitlab.com/ee/ci/yaml/README.html#includeremote
and
https://docs.gitlab.com/ee/ci/yaml/README.html#multiple-files-from-a-project
we could have forks include their gitlab-ci.yml from a specific branch
of their repository.

Example, if I push a branch named project-specific-ci, and we add
that to mainstream:

  include:
  - project: '$CI_PROJECT_PATH'
    ref: project-specific-ci
    file:
      - '/.gitlab-ci.d/project-specific.yml'

The it would include
project-specific-ci:/.gitlab-ci.d/project-specific.yml in all
branches/tags I push.

In that case we could rename qemu-project.yml -> project-specific.yml
(patch 12).

The problem is I couldn't have it optionally working (when there is
no 'project-specific-ci' branch).

Still room for investigation...

Thanks for the feedback,

Phil.

