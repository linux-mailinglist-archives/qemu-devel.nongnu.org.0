Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6F34844D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:01:45 +0100 (CET)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBZQ-0007HE-E0
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPBWa-0005b2-Q1
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:58:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPBWZ-0001oc-CH
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:58:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id x13so281485wrs.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PiYi6fPBf7I63Q27vZe0linrtlihECcZpFV68UGAfP8=;
 b=j3507NcIsdKfOMbe2zqmvEwZ1MteSLgAyaH/QPNctJNPaKKGA4Mjcw2iNdYnUoqdk+
 Vaegv7P/araYDL9Iql1/tmuKLW66zMYYcvfdU6HeChxC6XTJxQxASb66pV2BCtQeCZgd
 QnEbmNzj4AkanyfrKW5GLFUAHqtQhwC+dZjlYoym2eykB9uF8TfcWHHqVxSVmAqD+ke2
 01rJSGbavVf2Yw96sGj1WnDP7R60URKt5ZUn6k7iTD5C10/KwXcZavrpBfrG50m8VkHQ
 DTKkCEVQrZVYBagmnAwzrg/o5hccz1PKiFOjs/In6Dr8TtojHYv0dV2JDDqJpdZwx0Fa
 +g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PiYi6fPBf7I63Q27vZe0linrtlihECcZpFV68UGAfP8=;
 b=IfDeYDgS04BSVIt5h3wTfUC9xWIuZTlmG5Gh3Qzu+aEyRfmZgTekGvt++hM8GoW9sz
 GedszB3nrGO+e8IPVkLg5XsuQOCTp5AknpiXPhhQk/YSCIH8+UwWxQn2V71+TPqyXJE5
 hX7klH7PddLp5RJRh5NYMH7YiuBdsbQ2kM4ZfRcp/sX4SqvKm+wrbPzhayvpu0nrb1Xz
 2QeHF9YgQMWBOmkRasrEKELP4nAqizUiNuUd/gNFOy2WPdcDSAgg97kzKj33GIJ3t3Qc
 Jql35ETGEq1feEH4MAnOkw9xCwOCq+N+dw3ykzJcShDRw5c2i4sfBPtxtQe5ncxNCvEd
 IbfQ==
X-Gm-Message-State: AOAM531vfFOvbZWTziNhhisHQFK5ZlFOD8TfFfn/pV7fmjfgF55WZqOd
 yuvferh4EA44ygWU7+hJrD0=
X-Google-Smtp-Source: ABdhPJyEBojjvQPRM4VUvjBecQlPY694pTk5KTfXdwr8AQ1xv4vIcb0CQiJ/ASfnUM8nlLDzkTF18A==
X-Received: by 2002:adf:f150:: with SMTP id y16mr5617580wro.414.1616623125720; 
 Wed, 24 Mar 2021 14:58:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm4690787wrv.47.2021.03.24.14.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 14:58:45 -0700 (PDT)
Subject: Re: gitlab-ci: Only build /staging branch?
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
Message-ID: <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
Date: Wed, 24 Mar 2021 22:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 7:33 PM, Philippe Mathieu-Daudé wrote:
> On 3/24/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Peter's current workflow is push to /staging and if his
>> testing succeeds, he pushes the same commit as /master.
>>
>> IMO there is no point in building /master branch, as it
>> has already been built earlier as /staging.

Similarly with tags. Although we don't tag often.

Suggestion:
- staging: always build
- tags: on-demand build (manual)
- master: no build

Thinking about reproducible artifacts, we could have a tag job
to produce the archive with submodules, but someone still have
to sign it.

Thoughts?

