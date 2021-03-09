Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522443325DB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:54:47 +0100 (CET)
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbss-0004BV-Be
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJau9-0004Sj-3v
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:52:01 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJau7-0003rq-Dj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:52:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so14926484wrz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hKLKkvqTt8fVKSsr/he4F0H2bv2OeUBpS/aK4WcnMV0=;
 b=EXgk/N47kwYuDwq4S/D1ue0ClbCQLvSktJlGOjCvVJMSGSCA+Yp/KnXQ2f0IUAyN4k
 t3BpphtVCdVF+gjTVwQtWyTqHtbcunwAXH9vaoscA0EWVjLDPbdgFC2KVv3uqH+oAgws
 2SjaWyNwmfBUo60XKsyMFf2giHsL0RmA/ehc46g3AfkZLEK9C/d0/Whb+CCXQuYVMAVm
 yw3mRyFnDAhhRA7hDXOwhYQIq1F1rJJIZz2e9hflywc3CUSgVYqxX6aaWe8pOfE/EIoS
 fJX2mBQZGcp0kLO1BK6A3Khu7wy4SVG6i/vH8iyt1jh2Qvs1BMSZSWsVg67Mbnwt8fQo
 yJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hKLKkvqTt8fVKSsr/he4F0H2bv2OeUBpS/aK4WcnMV0=;
 b=mt+W2c1FParX/aSkhDpGWodFD/r/tW5yr5UQkVxALqm4nv8WFEoZnEwkXUB+Q7XDuC
 xfJUHoFTGHWgViifprA70VmmS9wztoOY/avfOfndmwVIDU/FLhji/c7xSwvFiRdpbQ11
 x2XWqe+zOSXdI80gNUa5DMqicdMc7t3EmTBmCWVSxTn3vA5F1QASJGBBgEB3/l+w9Z6n
 Oocgat5X6iAjTcX22mUreVs8zxoBLfxDd8zFfAy0iIPcTSnJNfHlf+aFhNN3kV1o9CpN
 Fg8z9rx4Sal/Ie7RS03oddW0Uddqbsh1vS+vfsdSYnSalDXYTPpcQR5pwBdAyxSh/vDC
 seAQ==
X-Gm-Message-State: AOAM5330YMW7phrV3Dx+H9/HtKzZ1t4u7siqFEpN8q3s5ne7c4pYLVFt
 z2/veNV8bZRySx7hvbsJaBA=
X-Google-Smtp-Source: ABdhPJz9b+Pi37HTUd5jycpo6Ga5R3JC5rEiwvhlHIKAF1MdusAa4fJrlM0WBjd1kHsOTmAChwMagw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr27596467wrc.3.1615290716646;
 Tue, 09 Mar 2021 03:51:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k12sm18153813wrx.7.2021.03.09.03.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:51:56 -0800 (PST)
Subject: Re: [PATCH v3] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210309112356.737266-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11cf79b3-46f3-7b7b-67cb-6f95b6dde242@amsat.org>
Date: Tue, 9 Mar 2021 12:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309112356.737266-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 12:23 PM, Thomas Huth wrote:
> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
> 
> And while we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again. I'm also removing the Patchew URL from this
> section now since Patchew's files are not tracked in the main QEMU repo
> and it is also not maintained by Alex, Philippe and myself.
> The maintainers of Patchew are still listed more accurately in the wiki on
> https://wiki.qemu.org/AdminContacts & https://wiki.qemu.org/Testing/CI/Patchew
> instead.
> 
> Now to avoid that Alex is listed here in this section alone, Philippe and
> I agreed to help as backup maintainers here, too. And Willian volunteered
> to be an additional reviewer.
> 
> Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Acked-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

