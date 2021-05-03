Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA63715B9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:09:12 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYJz-0004xG-3U
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYGv-0002X0-6k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYGt-0003v9-CP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id g65so3285754wmg.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rsb44y0SUmupFmD59f2h4e0sN2j4pDhrnBecr1FXJ34=;
 b=k+ZithvVD+l9buo3L6ZWmhWRRBmQNTougrQL5rTAohLaw1U6gvXYiXK03AVo5E2kkk
 cVI7MhYsTcttPCH2WQ6gK66FEv1S+uH5fSgmapObsQsrjs+nQJZ3h9PWSkvMfFsm5E4U
 1M/u2ft1MdnYWh6RgC728xWR2DILyrmmL7xpdM386T8iNUGA8VbDQGmdBLeSEokpnJSO
 qE1eXA4tplrr99gwjo4YSLda7JTl8Pxjf/Mn5JxcmJAh4qJpCFlT1oVzEvLH5QuFKuR6
 SUQV6SndeO6qwZXBNEtvt+wUW9AuwINHGI/IE4kjPdaxKe0+ls+/FbPw1rIjNFfYOOiE
 HJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rsb44y0SUmupFmD59f2h4e0sN2j4pDhrnBecr1FXJ34=;
 b=UFZcFoIb4NOAhT8OcqOS3l/sQ8l9vcv5XN0gGi84U9L/M++NqUQ5TwUFUgizOdd+Dp
 JcpYqqsZXU9E08R6Xiveb9Im4ze8ppJ8sKfL6GYYjYb78vKPlWPe1ugAEb2sdXT7J9O8
 EXfrPKxW6tQ7cEA17VguifgoJqxyyLTxIqMu8BwN1TVA4Ce51JsVN6ta/wfI+uNGTsLE
 Xkb0TkmoreAIFPOzyJ/LKwOIK0eLQjra37f4hRihzCdEBOJrLNBu4CV23u4NrZ0GfOQs
 LCf18jdyA9EWXpyJdTa7toPgDAs0SEhIKlad6mizhLu6XAiHVd7Kr7FAr2eKvr2qbClQ
 MROg==
X-Gm-Message-State: AOAM530VP4QxX1zQKNUovSWxg96ZdPlOE9uGRU8KW3WT7cghy4dDQfvv
 aEz6408dyFbhrxMPebGbWew=
X-Google-Smtp-Source: ABdhPJwKXWUuS0wPPA268Wd8xjkSiDMoApGMejRpERmsmCcMq6BiOOVletd6VW+bs5ySA7yNBFTatA==
X-Received: by 2002:a7b:c017:: with SMTP id c23mr31512408wmb.175.1620047157572; 
 Mon, 03 May 2021 06:05:57 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x4sm5277636wmj.17.2021.05.03.06.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:05:56 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update website to point to the new bug tracker
 at GitLab instead of Launchpad
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210503103007.1034171-1-thuth@redhat.com>
 <92c95d95-dd59-4e52-ee14-a6b3925d43e0@amsat.org>
 <0cc06563-a543-fcdd-0fe3-c5a6eec4c514@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f81fb38-10c5-039e-2f81-d4513abdec49@amsat.org>
Date: Mon, 3 May 2021 15:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0cc06563-a543-fcdd-0fe3-c5a6eec4c514@redhat.com>
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 12:56 PM, Thomas Huth wrote:
> On 03/05/2021 12.47, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 5/3/21 12:30 PM, Thomas Huth wrote:
>>> We've started migrating the bug tickets from Launchpad to GitLab, so
>>> it does not make too much sense anymore that users open new tickets
>>> in the old system. Let's direct them now to the GitLab tracker instead.
>>
>> We should document the user has to request a Gitlab 'Reporter' access to
>> the project, and warn there might be a delay of some days before the
>> request to be accepted, before the user be able to fill the bug.
>>
> I think it is possible for everybody with a Gitlab account to file bugs.
> We already have two tickets that were created by non-members:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/47
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/45
> 
> AFAIK, you just need the "Reporter" state if you want to add labels to a
> ticket, or if you want to assign it to somebody else.

Yes you are right!
https://docs.gitlab.com/ee/user/permissions.html

  On public and internal projects, the Guest role is not enforced.
  All users can:

   * Create issues.
   * Leave comments.
   * Clone or download the project code.

I indeed got confused with the "Assign issues" permission:

https://docs.gitlab.com/ee/user/permissions.html#project-members-permissions

Sorry for the confusion,

Phil.

