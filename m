Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103F39EEC3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 08:31:08 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqVGU-0006iT-T2
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 02:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVFQ-0005wX-0R
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:30:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVFN-0007dk-V5
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:29:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id y7so15542976wrh.7
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ltCrYOMvfWBFZ75rBRb4ra/XPRFfSnpgqeegsbCU07k=;
 b=Fdj6b6DGROIMkeBNZ0AjwCqxDz+AQlAuNQwly7irAzdSUKEz73zzR+PSiIAC7ozNqU
 yoQmykXliotqWKT3g9bLiwq3zP2FSyFHRGj5GR3uBu1HraMnnfWtX818Y2hFsRcY1mLt
 R0Rxa7xsF4ZORcKB9I/7bytaI8txZqWRLWN2txijt8hese2HeB3dm4AHeKye3D1/+60S
 ZVHxaIiRanX/Q4E+rgP9eaJjzPzeZt6HXhY+M11S8uM5sRY95kEzdpDqKdUwHMstEtb5
 9ysPlv/bj3zKSaidzSAzTFyEvTqTmabTW5ZE7/gsFXSUt9Mt0GpVVj8PLukjDU+aQwqN
 1OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ltCrYOMvfWBFZ75rBRb4ra/XPRFfSnpgqeegsbCU07k=;
 b=Da5YN+bZMdBFPSElqZ89boLCB6kdZ1zYVp4kEIbJpg9gQyH1D22NDk2Vx/STZhD4il
 85aBogu7PbOju3ZEJG50zLjeJFnDUQiJ9OVHN6EFKsT6Os+9mg8Yxw1bTFECosWxdNNy
 QYOtMTX47i3Tq9kfOm0TJmgjUo2J2hiug2G/0pUlfwV8/tHGbeueiL+f5h/Bgow4Ozey
 nw/HEAF5b3hmZ8WjFi6NClnjP/DXQZZdzeDsG2+B1RmnBEQEz9VP3rPk+kfupyccbYVk
 H975dc7phE27F4rIQprAoj7FrHykwUS0R1oSLhUhnjpA51+lTnDY4+064vq+qBqTl/mb
 AQng==
X-Gm-Message-State: AOAM533Bamsm2GhlkmhdDAYP6kMtcUAKyRQAbmuC8RUQNLqYEL4MWE/O
 FEnLH6fj7ufXve3Tap5NsVQ=
X-Google-Smtp-Source: ABdhPJxYZtJXqB5WNKaWaZJ7tgoyseW4Z25hMDMrjFPx61gRzy3LLmHJN60TNd/xsJdRlEYOF4uH7w==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr20285850wrw.392.1623133795971; 
 Mon, 07 Jun 2021 23:29:55 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q5sm18870594wrm.15.2021.06.07.23.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:29:55 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
Date: Tue, 8 Jun 2021 08:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-5-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex, Stefan,

On 6/8/21 5:14 AM, Cleber Rosa wrote:
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.

AFAIK there is more hardware available to the project, so I'm wondering
what happened to the rest, is it a deliberate choice to start small?
What will happen with the rest, since we are wasting resources?
Who has access to what and should do what (setup)? How is this list of
hw managed btw? Should there be some public visibility (i.e. Wiki)?

Is there a document explaining what are the steps to follow for an
entity to donate / sponsor hardware? Where would it be stored, should
this hw be shipped somewhere? What documentation should be provided for
its system administration?

In case an entity manages hosting and maintenance, can the QEMU project
share the power bill? Up to which amount?
Similar question if a sysadmin has to be paid.

If the QEMU project can't spend money on CI, what is expected from
resource donators? Simply hardware + power (electricity) + network
traffic? Also sysadmining and monitoring? Do we expect some kind of
reliability on the data stored here or can we assume disposable /
transient runners?
Should donators also provide storage? Do we have a minimum storage
requirement?

Should we provide some guideline explaining any code might be run by
our contributors on these runners and some security measures have to
be taken / considered?

Sponsors usually expect some advertising to thanks them, and often
regular reports on how their resources are used, else they might not
renew their offer. Who should care to keep the relationship with
sponsors?

Where is defined what belong to the project, who is responsible, who can
request access to this hardware, what resource can be used?

More generically, what is the process for a private / corporate entity
to register a runner to the project? (how did it work for this aarch64
and s390x one?)

What else am I missing?

Thanks,

Phil.

> This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>  1 file changed, 208 insertions(+)

