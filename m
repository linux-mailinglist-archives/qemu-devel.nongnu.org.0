Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E527366DADF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHj84-0001Xc-OK; Tue, 17 Jan 2023 05:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHj81-0001XC-CX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:23:41 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHj7y-00045N-SY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:23:41 -0500
Received: by mail-pg1-x532.google.com with SMTP id e10so21579978pgc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YGj1cZssHqUOaoj976UwvI38MWnPUveV71ih13lRi9M=;
 b=q6nsoqXHMS3tHhovcV+wy7UnoSV31i6Mnmnm2Uco/ZXIj/8Y6kXBB6o06Cl2iRHhG8
 xLSaxPHBUQKxEhOpXpKwgZF67SgkDRXodbK4gp7mdnEv5ZynqeCQYd3OtrUcNNbNW+cN
 vJ8odZH6gV3whegD84suUWlEoWdYL6RIW2GAzSI1fLLM7zkqd2JrcUKE+uqZTJiGKNwP
 WxcwtTmjup54UAnllFu5TJHqbpjYzDNWLO5pPtZLkqsfhh+AzC+OgDOr78SSbBFJi7rY
 xmG9TWmzIXL2mky1YoIEnVy6w44x6T1PbNwbhw0cM7CeFVNy7Q3I4fi10NNnpW4N6TY8
 S75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGj1cZssHqUOaoj976UwvI38MWnPUveV71ih13lRi9M=;
 b=ga2iWYSVPCZptyKuy/kXLKsrQHwIbAKAm864uDPwV0LNFcSqFx42jibnNagimenQ2a
 wIfmqTfOzG/5gNHTMJO2FCTwQACNX4Bvz/yZubGf6RopIziuzRnHpJCLzcRVH3mKxjdS
 cnb/8iAF8t2FGHbGtsyW3xUpCTJJxbs4kFQR0dmPVNOX8bS9myLCkgfPjNcVUDngRnf5
 HsSmLMhxQjdV6qNeeNHJuB+HAMbzrdJmRtIZLiZOcG34YPbTDlp/eMaksVbiMvyVyZ1p
 8We920boyMfhKMv2LPhZ0K7RGppzOk529ty9WPZlo4LvpL5sK9NRxbaPWO3W+YaBjCWr
 7jkQ==
X-Gm-Message-State: AFqh2kqBB9cnXpQi2nEsvBYTG/YVbbpcFBVXnJG6yCPQjPBLr1Q2Fh0Z
 tlN4rmJ7LforMUYR1v0o2D+v0dLZEk6QlKyZ+bXDzA==
X-Google-Smtp-Source: AMrXdXvtKehezn7PVbo1ne4v2xBxgZgw/HilRH7xwVG1I5X28PhXFKfY6zduBzfRYqRCXj3LaaITaf0YmkaYvfhaGIQ=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr243733pfb.26.1673951017149; Tue, 17
 Jan 2023 02:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
In-Reply-To: <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 10:23:25 +0000
Message-ID: <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 16 Jan 2023 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 15 Dec 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
> >
> > We're still running into the problem that some logs are cut in the
> > gitlab-CI since they got too big. The biggest part of the log is
> > still the output of the qom-test. Let's stop printing the properties
> > by default to get to a saner size here. The full output can still
> > be enabled by setting V=2 (or higher) in the environment.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  v2: Use atoi() to do proper checking of the verbosity level
>
> Applied to master in the hope of improving the CI logs; thanks.

Looks like we can still hit the gitlab log limit in some
cases, even with this patch; here's an example job:
https://gitlab.com/qemu-project/qemu/-/jobs/3610621992

thanks
-- PMM

