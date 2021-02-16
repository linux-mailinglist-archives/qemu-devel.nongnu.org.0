Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6731D1F2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 22:18:32 +0100 (CET)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC7jq-0007hA-Q2
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 16:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC7ir-00074L-66
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:17:29 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC7ip-0002pP-G1
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:17:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id z22so13965837edb.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6cgNVgvm4gZkKvSNMvQNLWbl/uvu9oFY4ps1XjBGUMM=;
 b=R7LTATcRbQuy9aP2YhmYMMv5xAU5Q19s8Bj2X5PKzKhmsWP6ztxUKR47c54kdMR1QH
 cVA11EqjJq8S5tOBsIwJqREY/RfKZgA4k1cfuQkJXkNYoKPyIF+yPR1oO+DFh893Q5yW
 kMUbTYRxX+LMKs2VJsfuahnboNVQczCC5nlXflKDNqdDKiQTIomWM8CVW91beay1agsP
 xKhUZt6Kn5UU96hWL+1mWM9Nsls5aZfWM4HVYM8Vduz3Rxx9iG6XzMEnNCEsZvB1xaBM
 8WJVk3QEZ65kL134LTDOABPYghNcX1N1lRIxNGGjnGR1B3UYUX0aPYc2N7wCrxfe/r1T
 wOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cgNVgvm4gZkKvSNMvQNLWbl/uvu9oFY4ps1XjBGUMM=;
 b=ThNSIjvEudw+urjHyxKD1FJ42LC6SuQJ2XE1FQME2gvAeWNJxD5w8lJOTncFm89oa9
 Nnt9uolOIryVf1v255MmKxat4y+mdPzZaDq7jZ80/vlYQLj/iMFNdNeQAYxEA9cc3bk8
 KspiQhdaI600LpxXDn6Cfk0T+DZ0bbN/ecz8IpPJvCemSxk1qeNJOLc6sATzG5f2PKsc
 bT3gls7nyn7sAJC7lQvxi5Ht7K2YLlxqCIUAc22sJDdkeJ89ponGu2WiazyVwhyzDCX1
 tEbZ1uF7FD6/l+RVmmHQ5OCpqLQ23BbVMIvbc6Nydh5z2h/NwvygtOn+puq4c+3cN3gf
 RyDg==
X-Gm-Message-State: AOAM533o9nIKvRVtgvC87bwQ4+URISI2Z8SwLOB5dTrTyM+GyeLk29BL
 dVRESY6STmG4N7x8SHar+lDY90VVNFLDTmY0qBGgZw==
X-Google-Smtp-Source: ABdhPJwYjPl1X/r/Qk5abTCRJGodjUUlpaAmM0Jso3B0RR9QxD+phFmO3SBj4GnjgSTFUo0upNYcQTozyMDsBInjCPo=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr22570290edd.100.1613510244695; 
 Tue, 16 Feb 2021 13:17:24 -0800 (PST)
MIME-Version: 1.0
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
 <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 21:17:13 +0000
Message-ID: <CAFEAcA-5XGrmJ2DrJZtH0Tq8ic=V6Te7o-KJZ_K26Yzk4X79vQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/35] Hexagon patch series
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 20:59, Taylor Simpson <tsimpson@quicinc.com> wrote:
> > -----Original Message-----
> > From: Richard Henderson <richard.henderson@linaro.org>
> > I've completed review of this round, and there are some nits.  But they're
> > minor enough that I wouldn't even mind them being addressed via the
> > normal
> > development process.  I.e. I'd be keen to not look through that diffstat again.
> >  ;-)

> > Any objections from anyone else on that?
> >
> > I don't suppose you and Peter Maydell signed gpg keys when we all met in
> > Lyon?
>
> Nope.  Peter, please advise

We effectively are operating a TOFU policy for gpg keys,
ie put them on a public keyserver, to the extent that you can arrange
to get them signed by other people who also have gpg keys please do,
and at some point we may be able to meet up and get a shorter
trust path.

For this patchset, I would prefer it if Richard collected the patches
and sent me a pullrequest. First pullrequests from new submaintainers
are higher-effort for me, because I need to look them through carefully
to be sure that they're the right format and so on; so I'd rather
not do that with an enormous patchset. It's easier for me if that
work is postponed and done with something smaller later.

thanks
-- PMM

