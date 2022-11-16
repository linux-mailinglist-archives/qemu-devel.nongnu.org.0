Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF6E62BF32
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIHz-0001Re-LA; Wed, 16 Nov 2022 08:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIHx-0001OA-DT
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:17:13 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIHv-00079u-47
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:17:13 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso2217192pjg.5
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xu28lO4QIE+TLFhOU8ekeNoat5ZVAGAMjjQLvhkqAZk=;
 b=S0GyCJcCtysMXrxw38VVzEqQ+2bAi1nZj7aOIN0WF1uU58EpCuzfuKW9s3NdrB9G+L
 8wEzLSJuQELrGwP3zChNlzDNqFNba6F4LcK6lU9CIqZ7DF1rOSXQA7HApCb5+VnFqC5w
 UtGa7DttHZnDHEY9tMwvIGYlSQ4CCLACtjgW0BpcsUBdVa1m0hpGS0BwK0VxdYv77vIb
 MM0rloQHQ/8YmIfW7MqBSN3l6vcCpZYncHUkqos/D/tlTtpztppBGuf1WfS1vfUj0aAC
 m5kV2hUYzmSYPJlWYQ8Ua09T4dFezpLy7XFXwUD1oQcJPP13uwCzPkzBcTBZPTZNaWyQ
 AUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xu28lO4QIE+TLFhOU8ekeNoat5ZVAGAMjjQLvhkqAZk=;
 b=jXOqy+Ukv/KsJH97rg/AEninQZqoEhuLdqXZver2aQk6BZshxuFd7OajVpEaGRkeqA
 w04fn8H1s5keaxdy/he9BNHMm0Xruo96V3kfXPmY+ty0WJBuwbzjva7fEzladJhzq4KE
 itGkVv+C9GfyPCjTLT9PDOX2TNrVkCJwko66mwlNZpG5o2JyTdRinTyH6nVsNM6DqUTG
 kaXU5GxqsG+UrWcxhNcz0nNyXVkXsWQ91wPhWzBkaimqeqttQ7DBIGLk1sz0zWuVag5b
 gpovZO7U7cBslEvWgU8Ur+QAgjhDlRpWF4q/+eNW8STID6yJIphHWzfmIxbSwqA2NcDB
 dD1w==
X-Gm-Message-State: ANoB5plCEQSBfT0KK6NJx9otOxE6eQEULC3t+BNhbmJIeeb2X+cSJMAG
 oqM2zK/Bm5oOQvgXdTd4Vpi1Biv035C0FkKuGMGRFa7wk5c=
X-Google-Smtp-Source: AA0mqf4spgfA2BxxfZh+vVL4EzApMLDOltjQwynJtn2QIKNlG4hqECnGnSM/kFp9xzmJxvP0ZnOl5gmndGYEd4mTRKU=
X-Received: by 2002:a17:90a:df03:b0:212:f169:140e with SMTP id
 gp3-20020a17090adf0300b00212f169140emr3570912pjb.215.1668604629392; Wed, 16
 Nov 2022 05:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
In-Reply-To: <20221116084312.35808-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Nov 2022 13:16:58 +0000
Message-ID: <CAFEAcA_4i_V49FLcm=x64bJh--Y4sNQgLJQZ-a2aXr7-si7rDw@mail.gmail.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, 
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 16 Nov 2022 at 08:43, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> It is not given that the current master will release the bus after a
> transfer ends. Only schedule a pending master if the bus is idle.
>
> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

If this is a bug fix we should consider for 7.2, you should
send it as a separate patch with a commit message that
describes the consequences of the bug (e.g. whether it
affects common workloads or if it's just an odd corner case).
As one patch in an otherwise RFC series it's going to get lost
otherwise.

thanks
-- PMM

