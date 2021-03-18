Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302B34027C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:52:24 +0100 (CET)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpKJ-0007Oo-Me
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMpIf-0006P0-Qo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:50:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMpId-000673-Vl
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:50:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b9so4788227wrt.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hLkdZk3dMfqoBrYahapYWDE3tM3+E8bhOgu1WEoJcvE=;
 b=LWzgNetWDt0IHeBP//PNUyGExkZN8Ff+pxvEtYrRzFS+dJcKllPGXg45yvfpfXmbWU
 WbfI0Swf3wjewrix7yZ+qGbFiQ3QTuy95bsBM55rVFu/QGYxhz+HvhiqiiW3u04iSpX2
 EBZjRnUu7ktRBDLSf8ge4k1GRnBwQt5zQLW2EwwbqV7QTeVJHGBrP6MV37Oyds+SQwFv
 J7ntYExzImc+QiQt9i6IYhc36Xc+fdxnkl/lbFv2yTHBZNAhHVAYtrFEEFVfKrbn/piG
 nfTXkw39c38jbJTj8lSKiCKpLtY8jopm/oY0tzYITa99ozwXnl8sa9++Ie8aa02EdSaA
 sv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hLkdZk3dMfqoBrYahapYWDE3tM3+E8bhOgu1WEoJcvE=;
 b=WULZja4PcpOHaSB0pHHK4LNfeNIwoZdV3uFKhiQhwPLoDAfvTvIcPHchrQ546NDWt9
 J73dQTWm7M3Uftb6tM8Af4O25+0/0KBwhsS7q5u7vqZ5tCqNCEwm4z3zMOw0L+MrDIGl
 rdtL+to3spFniwMO6GEuAZ/P20jh3ngZBeOalP/iBkAdL5+YgFYEhdlUWAydjJNvrNme
 YlcnconXBgIRjPgZ28hqvALpV3HMtVgGU0jhPcFlNMuXL4qEdPcluiUp+98yELoon3PJ
 nKhAEAtugrPbC+srRSoLvkrY/BQqOhU8VuRmalHZTgpLIIuEnSvSBXldNvxbOo2D/lIb
 BITw==
X-Gm-Message-State: AOAM532f03oU9IafcRKaoNge9+b4RmIxzUbvP+4qlDVnUJLvyHXUS+ni
 9aDrL2hmBPD4risWuP1ind8=
X-Google-Smtp-Source: ABdhPJwxkXA7iUOdnZMcG563Yn7RUTM7+sl0VMiyph6KiMmhDP98oTWOCmAhprdDnKvu+ljDjPP99w==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr8821071wrs.229.1616061038230; 
 Thu, 18 Mar 2021 02:50:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m17sm2214307wrx.92.2021.03.18.02.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:50:37 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFMegwL6SXX2/+kZ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c804b8a-fc98-0619-21e5-cc5dfe7d4567@amsat.org>
Date: Thu, 18 Mar 2021 10:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFMegwL6SXX2/+kZ@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:33 AM, Daniel P. Berrangé wrote:
> On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> For some (unclear) reason I got my free tier Gitlab account renewed and
>> lost the privilege for users opening account before the quota limit.
>>
>> I pushed a single branch to my namespace repo to trigger a pipeline.
>> 1h later I was surprised to see the pipeline was stuck, having completed
>> 99 jobs of 119. Looking closer there is a red comment on top of the
>> pipeline:
>>
>>  philmd has exceeded its pipeline minutes quota. Unless you buy
>>  additional pipeline minutes, no new jobs or pipelines in its projects
>>  will run. [Buy more Pipelines minutes]
>>
>> So I exhausted my 400 monthly minutes credit.
>>
>> From this FAQ:
>> https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd-minutes-usage
>>
>> Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
>> purchase additional CI/CD Minutes?
>>
>> A. You will not be able to run new jobs until you purchase additional
>> CI/CD Minutes, or until the next month when you receive your monthly
>> allotted CI/CD Minutes.
>>
>> Q. Will I be notified before I hit my limit on CI/CD Minutes?
>>
>> A. You will receive notification banners in-app when your group has less
>> than 30%, 5% or exceeded your total allotted CI/CD minutes.
>>
>> I indeed received 3 warnings in 7 minutes.
>>
>> Now I'm having serious doubts about Gitlab usefulness for the QEMU
>> community...
> 
> Per the discussions in the related Forum postings about CI limites, the
> 400 minute limit is still only intended to apply to projects that are
> marked as private.  Public projects are not even being tracked for
> accounting, let alone have a limit enforced. They also said they want
> to make sure they don't impact ability of users to contribute to OSS
> projects hosted on GitLab that require use of CI.
> 
> It feels like what you hit here is fallout from your account accidentally
> getting blocked, rather than something which is hitting every contributor
> to QEMU. Did they restore projects as private perhaps ?

Yes my repository was restored as private and I had to switch it to
public. I'll try to blew everything (after backing it up) and recreate
it as public from start, and see if I get the unlimited minutes back.

Thanks,

Phil.

