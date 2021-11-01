Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9B441CFD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:58:11 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYlF-0003IU-V4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYk7-0002OT-8q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:56:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYk4-000727-5w
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:56:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b12so24090085wrh.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3UUr3srpPw4bq4Uad6lcFBBSlzySqZ4qFcW9j/7ed/U=;
 b=tVpLyGDa76PyFNWl0agVqUnFjsZodfkh8KMIRtQaa6Kstp2nzHjslTNWTtYFydx8sO
 m4ATJ7DmuFb5HQ0q2DoZU8UPuowAUmGN5JJ1K6tLCxfNY2INS3g09+Um8Tsbd11TE61W
 huvikSrJv205Bzz6I6sMxAqKfZF1teGKkgrC3vQtKJTpBNvOuKnA9FGS5+o51sl/KO3Z
 SROkGr4gxVGOnjzI3jdVzrtowYEGxWiBDA+GmYu7t0RSDcnTipRh+OF16l3GqP1ZBd6L
 Ww6LaYWhIufxl581E5zhYskAtnV+YDUyUmAyAmdSXUo20rq/QM54ArkYJqYTKegChaJv
 fFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3UUr3srpPw4bq4Uad6lcFBBSlzySqZ4qFcW9j/7ed/U=;
 b=VJ8NhIyB+SnlvDbJfN4oVInq7GDSTiQYzoWz754y3sPYGzDW6laHsi5XXiXMQP+vZg
 /DlbEp66BMCyQ9dqrpalTzUqNfQZe/tzhR/6nbFdNMFzx4hHs+ZBWl+frnDIjdIFwg1e
 jVpOqWT9vhqC8AJmw4JIFKavul83L9yGuT8jFWkueBMhY2b9fyNAblYvRxrxD/y9Ey6T
 loQBmiAOmHsK1IUvMcQJYLMmHpPLsUA1IjY6BBEMJv3kU41S7LJDcXqjnmJQTMziAKN4
 l+Yd451yCsy9D1sdMZ/m99JdFy1D8ZdOnVr7pbz8lQ3yx7UHPWgfBxqDJwdmw7uaVUrd
 eW6w==
X-Gm-Message-State: AOAM5323WHcBa94a1Qe7vJbgf7Wg5Jk3liCNQYHx5aXJ1RM2epmdM20s
 DWEviOx7vilWdnErGlE3vHcsv4BvD/4Vnaz1JfkWyA==
X-Google-Smtp-Source: ABdhPJzQe/TumGA1L7Y9aSslCYgsY82kQB+aVra8AvdA2dC1bKEIknTeEaXw9BX5GfMIVO4YW590pkS13mP97pLbmuY=
X-Received: by 2002:adf:e984:: with SMTP id h4mr34698014wrm.149.1635778614776; 
 Mon, 01 Nov 2021 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211019090344.3054300-1-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:56:43 +0000
Message-ID: <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote=
:
>
> My main motivation was to convert SubmitAPatch[1] based on a chat with
> Peter Maydell and Dan Berrang=C3=A9 on #qemu channel (on OFTC).  But the =
page
> also links to a couple of other contribution-related pages, so I
> converted them too:
>
>   - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullReque=
st
>   - KeySigningParty: https://wiki.qemu.org/KeySigningParty
>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches

I'm not sure that SpellCheck in particular is sufficiently baked
to be in the actual docs. I'd rather just drop the reference to it
from SubmitAPatch. KeySigningParty I'm on the fence about.

-- PMM

