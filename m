Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF532E51A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:42:46 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6yr-0007ki-Qw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6wm-0006IM-As
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:40:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6wk-0005MO-OW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:40:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id e10so1301307wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3uVBlagyRMo5M/m6hAyUN8i7zVF74FG2/6b6vYyUyA=;
 b=PiUTyu4tnoMeKWiqiUwLBbWGl17cypQ/HYe6sOzwnKYc5DXYfxqiuR3pXtXwp7mtSI
 sh0vHLMSelxx5jLDFqmgu5qAxqn9cMpiB+eX05/1RHqD5V9Mi5Db9wpQBPjnqil6SXYW
 CFmKP2UQrs+WJITfMkpV4T/ECukPZ0APLTX6d3tR6gYx/zyToY3yzU2EcmR3LDrDGXpV
 yJc6w4rqiqSVQ/L+X7JEuge0iGqkyP50BU0eh77yJMASgm9we8kL28MT0t1Xw/rRXSq0
 Mp4uuS7MOuQgDQaO52tylCrtfxugz0P3I/F9aPb02uiLLPmcdED6pLOeanD+iSqUM5mL
 /5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3uVBlagyRMo5M/m6hAyUN8i7zVF74FG2/6b6vYyUyA=;
 b=ZsfQuVGlZ7H772e04sdUJPmvC3BrMFHr+C4BfvKShbHRcLE/GghNpOqxXTKnobhda/
 jaeWzw2c4Y60/KAjSpw9cE+LF5CFntFjlJl0nmRApWuHsHufZeFAdXUS1uhEJIWrENrM
 9sz6zIlm5zelU13yic6/iFxqbteTbjYTnfOtPrmE7+U9Uu27defQKToOkOzJLmBF0L9w
 V+nG4e7w5o29YYIC6D1q7lNdzCH2LnefeZY+qMyOk+40N0qm5r2HDKGZv361x2Gg10qs
 iIlfU9Y21PDVOM5hWZ3w04/zaPba6qCK5/6Smvland5HYzHVECxtDBQRfLt0c2rrlrw/
 zMXw==
X-Gm-Message-State: AOAM533fHECkNZmME6dImJoKR6HRdn/NOdC8B7vsq4IpiB0Jc0db1Xzi
 0c1nOV9nkRbFdV5Slsl+J5U=
X-Google-Smtp-Source: ABdhPJz93F5ZWlCbeJAx60Jf8i5eb40dFV+vjtGON7spiu37wmO0brVn5/mV4KAVoI7mm36qpXyBQg==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr8360210wrr.274.1614937233137; 
 Fri, 05 Mar 2021 01:40:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j12sm3534538wrx.59.2021.03.05.01.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:40:32 -0800 (PST)
Subject: Re: [PATCH v1 1/9] docs/devel: re-organise the developers guide into
 sections
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38b39e61-b4b9-e60a-c5d9-d80b7618ba72@amsat.org>
Date: Fri, 5 Mar 2021 10:40:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305092328.31792-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 10:23 AM, Alex Bennée wrote:
> The list of sub-sections was getting a bit long and sporadically
> organised. Let's try and impose some order on this hairball of
> documentation.
> 
> [AJB: RFC because I wonder if we should make a more concerted effort
> to move bits of the wiki into a canonical maintained document. There
> is also probably a need for a quickbuild or tldr section of the
> build-system for users who just want to build something.]
> 
> Based-on: 20210223095931.16908-1-alex.bennee@linaro.org

^ IMO this hint for git bots should be removed from git history.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/index.rst                 | 32 ++++++----------------------
>  docs/devel/multi-thread-tcg.rst      |  5 +++--
>  docs/devel/section-apis.rst          | 16 ++++++++++++++
>  docs/devel/section-building.rst      | 13 +++++++++++
>  docs/devel/section-concepts.rst      | 21 ++++++++++++++++++
>  docs/devel/section-process.rst       | 11 ++++++++++
>  docs/devel/section-tcg-emulation.rst | 19 +++++++++++++++++
>  docs/devel/section-testing.rst       | 20 +++++++++++++++++
>  docs/devel/tcg-icount.rst            |  6 +++---
>  docs/devel/testing.rst               |  6 +++---
>  10 files changed, 115 insertions(+), 34 deletions(-)
>  create mode 100644 docs/devel/section-apis.rst
>  create mode 100644 docs/devel/section-building.rst
>  create mode 100644 docs/devel/section-concepts.rst
>  create mode 100644 docs/devel/section-process.rst
>  create mode 100644 docs/devel/section-tcg-emulation.rst
>  create mode 100644 docs/devel/section-testing.rst

