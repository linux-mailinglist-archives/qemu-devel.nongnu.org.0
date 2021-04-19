Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582533647F6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:10:46 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWU0-0007WF-Vb
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWOO-000185-VY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:04:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWOM-0008VY-Q6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:04:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id k17so1884586edr.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGda2mp6+a0qPDsf0SagMc3tg4UG0CMVO8ADFfEK/Uk=;
 b=RzguDAjAOaNadKYe12bwjdHymKxJZu1Qw9sX3FroVlNeUnVm+bmOo4SSMdyqWp+6ZH
 NkNI/qzpbM8YGwsiDB52ApUjxydjIuwubyG94rKHvgf5RQcPEQ2I8PhQKhGqBwdKfnWJ
 wXTftXJw9zSswV2IMv/z0TLlECccpfUcy37in9WMZOBLw4lg/M6FjrSQGpLlMsekG/el
 Jy/8knOeL1OhMhxG2ZEpnlf7U8blbWt3TcOwIpj6TcpSPNtkWxTcCZiqDS6qbFioWVED
 9AO8rzhTSJDqQgME6TuqiwN7Z80gYkasWLps7r4KvQPVb16+6k+IHB7avwnycYnDPIAK
 CrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGda2mp6+a0qPDsf0SagMc3tg4UG0CMVO8ADFfEK/Uk=;
 b=NNYyvTBLO1CzrShXbuT1Ey0hX1Eui8aH7WAOUbccCLmAl8OOKRQAAaJYc9mwBOXuJ8
 he53+3ldgKrWX6Ke2sEKa4uinUtOG4WmuCxyKFKdL2VInS7Ob1sIRY7RPe82GWce/hIM
 KBXyhDDMiFA2F8mRJ7COZgBUKm8pQstDW2E+TKJQVlt0I7SmVqckoQ6VJ6e604/r3eqj
 Hq4WGlruYlQ5Us09W2VoswWbmI+pujtCHGZpmL0go4jlA3UVP5PXKoGpdFrBzvQwmjVH
 saNx7rOvg6KhKy6g0qnAFqfTXhAOtLH/rHEgVnXCpccm8U57yTtQLmg7UFZlGtmcaVKT
 DAQQ==
X-Gm-Message-State: AOAM532c/6b7juvqOzZWGIkDEyhPFVUhwOQISIc8Pa4/CS+nUpf4i5Pg
 U2K2aa1t2JjM9uwzH/OGpe32u5+3m2V/dY6cNh6drA==
X-Google-Smtp-Source: ABdhPJxx0tnifqVkCcQSNT0+quox9nFimUyhsCjYp8lGIo2BlvD0X9cFd0arsuYJeK6MZ70cUBNEwEX4NzR1tLB87Q4=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr26104483edu.100.1618848292943; 
 Mon, 19 Apr 2021 09:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210415094954.GA84874@paraplu.home>
 <5e885bb5-63a1-b109-e3bb-c731a4c387df@redhat.com>
In-Reply-To: <5e885bb5-63a1-b109-e3bb-c731a4c387df@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:04:01 +0100
Message-ID: <CAFEAcA9d1-cN9=h5VAnz9J8U3UoHg+4WF5V=NegknEO99mD+9Q@mail.gmail.com>
Subject: Re: Upstream bug comments on the mailing list and Launchpad
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 at 16:52, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/04/2021 11.49, Kashyap Chamarthy wrote:
> ...
> > PS: I recall there was discussion on the list of moving to a different
> >      GitLab tracker.  As Thomas Huth mentioned on IRC, more people seem
> >      to have account on GitLab than on Launchpad.
>
> I think we basically agreed that we want to migrate to gitlab, but e.g.
> Peter suggested that we copy the open bugs on launchpad to the gitlab
> tracker first, so that we don't have two active trackers at the same time...
> thus this needs someone with enough spare time to work on such a convertion
> script first...

In the meantime, can we disable bug reporting on gitlab? It's
confusing to users to have two places, one of which is not
checked by anybody. We already have two stray bugreports:
https://gitlab.com/qemu-project/qemu/-/issues

-- PMM

