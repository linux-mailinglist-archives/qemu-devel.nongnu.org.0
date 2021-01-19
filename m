Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B262FB612
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:26:46 +0100 (CET)
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1q5t-0001LA-BB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1q4U-0000RQ-F7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:25:18 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1q4Q-0007hZ-E0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:25:18 -0500
Received: by mail-ed1-x52b.google.com with SMTP id n6so6182236edt.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROQS75CwoeGHnrR7zarYxU5G5UH2xxKfLscH/Gg5QdE=;
 b=kkrvcrvbBlX+crUQ+r+A55sqSj62075u/mnOj3C0ePK8mG1WTqsoTrJqAQ25VX8MXG
 yMrnRNPje6JsqwbAPaWVfHQb3/22jVt/mqfzxAQTJhruLRIlKQCKGoeU0sBTJwQP1HCa
 rOcw8yUkyukDety/cTlEtMLxUfHMwS5M40QWvMuxxFk4YnJhoPM5vov7Nh4jDF4d+u4a
 3QnA59YyKisOBspB29KSJdp28V1r+UP0ROw9xBMOlljHnX9HCS6bJ1nFK2aDbTrIZc1n
 caimeCUkk5GTKt/sSPPzfFZ2hYVgvhXFqkpkFcUijG/iwftb6y0+CNxjz5GP+z05ICjR
 NNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROQS75CwoeGHnrR7zarYxU5G5UH2xxKfLscH/Gg5QdE=;
 b=aKx0PrzOhdsoEolZjq99cvbzgzlUgzI1zGIfEF2Q5bncN0wN947IU35ioDTr2PQLf4
 Klkicw1tZiAd2xfYs1GWApkSH7kvQrlAreYmoqgbouHlw7+2OojjNpZuwdPQuiqRl9Ox
 gvqdXCJUXTMJ+m5QoMDRf8D5gpa8sJE7dtSnifCH1vA+0aNo5UWMl82mxK7GKEzMFwHE
 OVSAQ+cSZjUVhYbSboFFw5ryYqMDMFwzgY4K6dp1gXrOGmXSHMMmvGNlQJyfKLwPSuwz
 sAGG/d6A1GQGSuHwdOoAtx2pkYd+4OPomZh1pWHoP8RVgJ46pQBE9zjUaIgIurrC0B+V
 RNyg==
X-Gm-Message-State: AOAM530BRFwpMCBSWbNYz8neaSr7GFfE0r+KG9Ct187ZPEE1PtnUf+J3
 wF/Qlm12tovtL0lt8rOjQZ001ssn0raPlFz9v+k=
X-Google-Smtp-Source: ABdhPJzHDs60D/FPksD2fKMnYzpdvKuaFeZNJGwjoMWOzYFeZuoCfgCy8Mrq3MwTzT2SwaadICS3o/OfR7sZRXg2e3U=
X-Received: by 2002:aa7:d4d7:: with SMTP id t23mr3054318edr.321.1611059112466; 
 Tue, 19 Jan 2021 04:25:12 -0800 (PST)
MIME-Version: 1.0
References: <93d438bc-4e41-5d97-9759-bfbf455fcf83@redhat.com>
In-Reply-To: <93d438bc-4e41-5d97-9759-bfbf455fcf83@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Jan 2021 20:25:01 +0800
Message-ID: <CAEUhbmWrp_GfZbH9fUZw_in2FuxD-Azmaoy7ytP87XvU+zpA-g@mail.gmail.com>
Subject: Re: git://git.qemu.org/qemu.git now pulls from gitlab
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 8:01 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The qemu.git repository on git.qemu.org is now a mirror of gitlab. The
> git mirror is updated every 15 minutes.
>
> New changes to qemu.git therefore must go through
> git@gitlab.com:qemu-project/qemu.git.
>
> As a result, the "qemu" and "qemu-stable" groups on the qemu.org server
> do not exist anymore.  The following repositories are now read only (no
> one can push to them):
>
> - qemu-jeos.git (last commit Wed Jan 18 10:22:32 2012 -0600)
> - qemu-stable-0.10.git (last commit Mon Aug 31 04:58:19 2009 -0400)
> - qemu-stable-0.14.git (last commit Wed May 4 13:50:56 2011 -0500)
> - qemu-stable-0.15.git (last commit Thu Nov 22 17:19:35 2012 +0100)
> - qemu-stable-1.0.git (last commit Sun Feb 19 16:31:27 2012 -0600)
> - qemu-stable-1.1.git (last commit Wed Sep 5 10:38:39 2012 -0500)
> - qemu-stable-1.2.git (last commit Tue Dec 11 15:09:44 2012 -0600)
> - qemu-stable-1.3.git (last commit Mon Jan 28 10:38:28 2013 -0600)
> - qemu-stable-1.4.git (last commit Thu May 23 17:12:44 2013 -0500)

I see the following error in a previously cloned repo:

$ git fetch origin
fatal: remote error: access denied or repository not exported: /qemu.git

$ git remote -v
origin  git://git.qemu.org/qemu.git (fetch)
origin  git://git.qemu.org/qemu.git (push)

Is this expected?

Looks I need to set-url to the new gitlab URL?

Regards,
Bin

