Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB035DC79
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:28:54 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWGHu-0005kc-32
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWGEr-0004EI-2z
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:25:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWGEn-0004oY-5Y
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:25:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id 18so18778171edx.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZZ86QaIOU1bnIL805ycVlBLuftIZ8+5H6yW2bkw8VKY=;
 b=Eferg9Ky131FZox110HnvqGW2f/rolY3f9xwRVH4p9w11A4s4dKkbU3h/XGOaxBSWv
 AykmFwgxVUlbs5xR4EHQJ8pnjvmQ1UxGSWS6ciWrBR46p9ko3oawuXdfZNX9X6luJu3T
 D0NAN6hSifWY3yFqR0CD2a+iuo+1ybE/stpQ/+tXXTfhrPXtNWHQThLNDcVv4OvgOtNb
 hzstIdOvC7ueE5/vdvDNH6OrpgzkL9xhmsUuLnwEN7yGMgx21NbjeSd55GU6M/fa/viK
 JAlEgc48UoC3B72i7d/ljrAW5hHF6TDrp3cNtWJoJghpOX+nQetx/ylHBsol8L004WqN
 y8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZZ86QaIOU1bnIL805ycVlBLuftIZ8+5H6yW2bkw8VKY=;
 b=C+x+fWogu1QBJ6XNmZYUkRZVEJ+rclq0vXTltHKgZnrPn2jX8Z71CtMAJOXl633K0Q
 t3v2jpNk2POAjXl2HzolDYQOmErmtbJ6+5GiZeSxaatrH/4MrtqVZ3TqtXNyWtsa68S9
 eBe07FAgrzT4w2ZapN1Zf658XXtHiOQftQ47ExpeJHojbXd/Evb93K7eoLsJ30JOQ5oH
 VeD+SZ3Bya2RNY4UR4EitpaktYjozHiaGEaq7mn1ZvEZxjscAoZn7GHSeXpMljatmebm
 klWJTFXe8fX3bp+zM7RE9ZGddiCM+Jyu7LZJ/ppcfH/1XHCT8o7Ldclm+rGA6gzQ2SCq
 BPtQ==
X-Gm-Message-State: AOAM533hstJSJl9Em4DW8U7erKfFTOnNmOg8h11e8e1WN1qFxZKIiH/x
 ZzaWhoQx1d5RZDcjPFKK/xqwLKsEISP34/86FteCPg==
X-Google-Smtp-Source: ABdhPJyaBJKbkLd85/uRnxR0TPOCIRwCv3PP3NnBS8D3g3/HCbqeCGyLm/3rrZshAcymEr2i1cKUujX0fzmRCr5kKqI=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr33611290edv.44.1618309539543; 
 Tue, 13 Apr 2021 03:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box>
 <87wnteus7k.fsf@linaro.org> <YG3SyTLha8a9Itlo@merkur.fritz.box>
 <c388d16d-4230-c828-08e0-d3c684f88106@redhat.com>
 <007fd217-c660-1f7d-835a-07a309d24d8c@suse.de>
In-Reply-To: <007fd217-c660-1f7d-835a-07a309d24d8c@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 11:24:54 +0100
Message-ID: <CAFEAcA-9J79hCm-ROkLH-j2rg3+O64wjRC2-jPK3XAj-z5ap4Q@mail.gmail.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 11:23, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Or consider the case you get a bug report not copied to the public
> mailing lists from someone you don't know. Then I would still expect to
> be allowed to attribute a commit via Reported-by/CC to that person, as
> it seems in his/her interest to get the bug fixed and be notified,
> unless explicitly requested otherwise.

FWIW, in this kind of situation, I generally try to explicitly
ask the submitter if they're OK with my adding a reported-by
tag, just as a matter of politeness. Not everybody is OK with
having their email address publicly recorded on mailing list
archives and in git history forever.

thanks
-- PMM

