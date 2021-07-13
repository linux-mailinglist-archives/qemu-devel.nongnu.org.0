Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3823C72BF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:03:32 +0200 (CEST)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JwY-0008IG-PH
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Jtz-0005SR-5h
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:51 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Jtw-0002j8-K9
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:50 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb6so42029741ejc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xh7G3eepPC9eetpPSo6p5bU5RSKOl6XrfF0tmioEzgk=;
 b=vcfJqIuigyDEMG3WaRqpf0bwExfQhFK525JbDdU8pNW5qrDd/enzZf+JdkfmEAji5W
 CEZbjy1vuWsNvWt6yq+7WhJvv+hLSUrPr3MVqTwl5jVFCCpUG4GV8QdP+inVX2NrCtZx
 rPLLj9ebv2P/lMAFmZSPvIFAsoxWH94o4qFij+Hf/4uCy/qjQ+uNldcq7k3gsRtGlI6N
 FFkbYkfu3O2BnV1QZ1YLMw8Ceso+LhLSZrVFGJeR8IgL0h2kt/dkvxG86C2v/MGzFNG2
 OSdF4t8dbxJmAvkeK6hMqPWqfqc1xbkWHG8nJAbVF9ehY7+VXRjGhg1XxzN9hqbcOk2G
 mgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xh7G3eepPC9eetpPSo6p5bU5RSKOl6XrfF0tmioEzgk=;
 b=O51u1Ug/u04krGy8lD8HXzrvOm7oSjX0nujEawDJiwPPd8k2sTueMEMxwF9nw+KstF
 CuYMtUhOKesvA2d7D8RqyHf6H1/QTNG+NwSeigky+v1U4Lo9oc8syi2AoeVqZUiOQRx7
 op+iUCzm8lmKr0SqCFyOhnZTmIHfkhWYiy/3PKhQOhB0BrjsjhE3LldBXinY4XordM5i
 rNJrtJ8uJUzHjzXrqH6yeOEwgR7VNHGesgxs/J91FXJB7xD38DIu2DKhVr8N/vCrOBkQ
 vH8JA92VHLVRKaAM0TZlUYiJQQk7pBTSndazXy82ylM8FDZbGtSizW6JbLcLZc1/esQd
 LpmQ==
X-Gm-Message-State: AOAM532EAzj7YiJTNUG3HntOWnItRSEyTTjNbrtDtmDkbYjIcYmLTqzM
 DgA/sLtWVdLul0ZTBrIedtLAbv9hc3xWS87MtTK7hw==
X-Google-Smtp-Source: ABdhPJySPpUWydba8gKv5QxWiSWJr/9PvlUnddkLO2UTmncnBRP9256OLHNITD1Ia9ZbSkzjBo92iFQLxfUVN6va7AA=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr1665321ejb.382.1626188446573; 
 Tue, 13 Jul 2021 08:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175026.2990347-1-eblake@redhat.com>
In-Reply-To: <20210712175026.2990347-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 16:00:07 +0100
Message-ID: <CAFEAcA_TnKWOO6MnMhtYW_=apWswmnmp5sRWUa09Sjw+eoGacg@mail.gmail.com>
Subject: Re: [PULL v2 0/4] NBD patches for soft freeze, 2021-07-09
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 18:52, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-07-09-v2
>
> for you to fetch changes up to 0b9cd6b947d905b388e84df4070056fad138588e:
>
>   nbd: register yank function earlier (2021-07-12 11:24:00 -0500)
>
> Only sending the altered patch compared to v1
>
> ----------------------------------------------------------------
> nbd patches for 2021-07-09
>
> - enhance 'qemu-img map --output=json' to make it easier to duplicate
> backing chain allocation patterns
> - fix a race in the 'yank' QMP command in relation to NBD requests
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

