Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D5341BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:47:58 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDbh-0008E6-3D
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNDYC-0006wp-SD
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:44:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNDYA-0003bj-Bv
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:44:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so4825656wmd.4
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+JUi5tcYBoLBWeLxbPk5mij5PCiHrCOOqEI3HcHURDg=;
 b=tGYyfss9p1wGbcx9RkiKmSrv7f6mKqCijRnYbykmAWq9dyCAyL9l1Z8VdsOBg4zXPp
 cb8aR4AiSIj98imbmYXsN9cpBPs1IcY1gphnjVTRsMuVIso3bNOsiS5MEDpmYOreXOd7
 yn67+IRRreADBVgndf9BVxV7ykoLZIIT8cbVOEIW0I1s4YNZ8q4cvUsnwt9yEzi8aA7l
 GlXfqa0+zPx+w0vsVaoQPUFeFaPE2Iqf+PCRLahaU3PkczG4m6DoBz+rXjEhpnoqvaZT
 /xpoVywhJ5+9oVsZ3tabylhDSm23mODE+7HT3709WSQKmXmCyQYdkVVSewUarZpz8s1i
 wYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+JUi5tcYBoLBWeLxbPk5mij5PCiHrCOOqEI3HcHURDg=;
 b=bxHR6aCYwwjXZe9K4WAKIiKj6nMMC9urffQtMLT9bGljmVysakModBOvEp2wOzfV5L
 qTzMmEvytKv6y5qL8PwkbAklkas9MJ6cEBsCNcxAumOEywzTLpvGsZHeOFdutSCo0jqD
 rThol4pneqHq2zBJvv8xjiQtuwAAibgcb9pT5MDI65FJM/UJHslChpleI2vfYKEHg/hy
 JE0jsSH6vvuBsoT3I6ov4hjIl0CkbxD6vPchkMnGNEXHFO+D4UlTy15mM09STnSA5NSz
 DSD4Vuots8/+GbF3qVUuKA35IgIwsplZeN+pIKuVFrFTpAM3svI2UYia27lQaeKI5a6b
 qx4w==
X-Gm-Message-State: AOAM533IaCqBt9fXrjn3Q3DlI8vOXRjgSzG7uxMtV7tm4kmRFJhQ/2CD
 Y0beL3asuRqk+HgcZ53kKB4=
X-Google-Smtp-Source: ABdhPJxmXQV5D2JC16X5xHyMHiDAk1HLVEDjuLUsSqcQRfAOghdVtjuwM8zMt4zh3cxKhFRVJzVQQA==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr3296469wme.158.1616154256531; 
 Fri, 19 Mar 2021 04:44:16 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n4sm5798940wmq.40.2021.03.19.04.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:44:15 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <ea7bf28e-c0e2-8350-04be-b7052c2238ee@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4aa0812-d20c-1822-9383-80d7e2153229@amsat.org>
Date: Fri, 19 Mar 2021 12:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ea7bf28e-c0e2-8350-04be-b7052c2238ee@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 10:41 AM, Paolo Bonzini wrote:
> On 19/03/21 10:33, Stefan Hajnoczi wrote:
>> On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
>>> On 18/03/21 20:46, Stefan Hajnoczi wrote:
>>>> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
>>>> GitLab Merge Requests so that anyone can submit a merge request and get
>>>> CI coverage.
>>>
>>> Each merge request consumes about 2500.  That won't last long.
>>
>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>> on slow machines or if we'll hit the same issue with dedicated runners.
>> It seems like CI optimization will be necessary...
> 
> Shared runners are 1 vCPU, so it's really 41 CPU hours per CI run.
> That's a lot but not unheard of.
> 
> Almost every 2-socket server these days will have at least 50 CPUs; with
> some optimization we probably can get it down to half an hour of real
> time, on a single server running 3-4 runners with 16 vCPUs.

Yesterday I tried to add my wife's computer she use at home to
my gitlab namespace to test Laurent latest series.

Specs:

- Intel(R) Core(TM) i7-7567U CPU @ 3.50GHz
- SSD 256GB
- 16GB RAM

So 1 runner with 4 vCPUs.

With 9 failed jobs, and 2 not run (due to previous stage failure),
the pipeline summary is:

130 jobs for m68k-iotests in 623 minutes and 49 seconds (queued for 31
seconds)

Network bandwidth/latency isn't an issue, I have a decent connection
IMO.

# du -chs /var/lib/docker
67G     /var/lib/docker

^ This is a lot (fresh docker install)

This matches your "41 CPU hours per CI run." comment.

Regards,

Phil.

