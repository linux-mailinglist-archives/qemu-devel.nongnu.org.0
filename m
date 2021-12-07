Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFC46C499
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 21:26:57 +0100 (CET)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muh39-0007H5-T6
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 15:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muh0f-0005F0-1B
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:24:21 -0500
Received: from [2a00:1450:4864:20::32b] (port=55029
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muh0d-00071Q-0u
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:24:20 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i12so253697wmq.4
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=he1+55OMQrhPzn/Du0g9rhBuLpjE5wn6quFfOCTwcD0=;
 b=KNQjSbf/TdPbqMQEq0JvNed7qlINYd9P8mcpAo/fjXBCIXA/bzc000NI9Y8fzR8P2d
 UsJPqUY6fnHE9pebFfnLvZGuBRynz30nkX+4sPm2l0Sup51Bnos+JbCJWpWtTuhpMHda
 V8CAqU6f0oVJN18ir8pOjy6wQQl5X/AZ9t1woQuxpP49oQvtCxKXeaypi13v45ngqaeB
 wi3RN5HrklXeJvb4c7wh/lvbY0Qgs//+b/aWkqz6EU2EqGdi5/vVlWzhcQQsU18CKMy7
 SDjkDNWF1oPBR2z138EY7hprF7dF4zgRK77MFeKve2gKk71u85eN4mOc5doAt+qYNvJf
 RvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=he1+55OMQrhPzn/Du0g9rhBuLpjE5wn6quFfOCTwcD0=;
 b=vyl8re+tfQ4IV6MTfO0sDuO8ixj0rhEHHOA0jeO8kYjdmIirVtUkS5G89mzP4bhdQO
 Y3AvB6JPOhuy6GQxJd598w8mLob1xG7SAC2gDtWZyjwoVfrVZOrhSrC+BCE20OPa3dUP
 m0DGDxHqI/6D/pG8tyKvoqDvmava474/tLwWJF9N/2TZ/oWD39GO9UYv9vsWePlSv1Ut
 icZfQeJtxX1G7RWFqOSZl0IJhDf3ui9oy1hYD3zuACGxm52IuWxJdG07q7BVXcnk4YfP
 bf/4S6/0czWQ7rD14HBwuCnz4fSLj5iOOMA90K2j9LC2ibE5sgL4ifhWi12J5NQVDEeh
 DqNw==
X-Gm-Message-State: AOAM531jjVyhoiOPhUMPpZtMs4/TKe8wGV6BRaAcd01BpSMcXnBBrVxF
 T6n9l84xkO/uEe+ADwlh2W9cHp8SqxA1YrH8/NCQrw==
X-Google-Smtp-Source: ABdhPJwvBZb6K9XZdtCjqpOh5vtxVaLyY9ZeXnyeZMoOmGWLvRVVL6cvb8fASljARtpqZjt+1Jpbe4XksKQkCvFB8GE=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr10069090wmd.133.1638908657078; 
 Tue, 07 Dec 2021 12:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
 <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
 <7c9d97ab-1662-106a-5b51-630a4d2375cf@greensocs.com>
In-Reply-To: <7c9d97ab-1662-106a-5b51-630a4d2375cf@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 20:24:06 +0000
Message-ID: <CAFEAcA-29QMZ0CX-irpoa0mpa_WUTBAAYhS9QUhCzBsEiWbYhg@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>, Sid Manning <sidneym@quicinc.com>,
 Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 15:49, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 12/7/21 16:45, Peter Maydell wrote:
> > On Tue, 7 Dec 2021 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> The bug is a bug in any case and we'll fix it, it's just a
> >> question of whether it meets the bar to go into 6.2, which is
> >> hopefully going to have its final RC tagged today. If this
> >> patch had arrived a week ago then the bar would have been
> >> lower and it would definitely have gone in. As it is I have
> >> to weigh up the chances of this change causing a regression
> >> for eg KVM running on emulated QEMU.
> >
> > Looking at the KVM source it doesn't ever set the LRENPIE
> > bit (it doesn't even have a #define for it), which both
> > explains why we didn't notice this bug before and also
> > means we can be pretty certain we're not going to cause a
> > regression for KVM at least if we fix it...

> We are perfectly fine with this not going into 6.2.

I thought about it a bit more, and realized that we could
end up giving KVM spurious maintenance interrupts even though
it doesn't set the LRENPIE bit, because the incorrect OR
meant we'd send a maint irq whenever the EOIcount was nonzero.
So we've put this fix in for 6.2.

Thanks for the patch and the discussion.

-- PMM

