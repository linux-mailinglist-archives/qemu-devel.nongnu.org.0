Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA153588D1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:47:52 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWsp-0002M1-7H
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUWqd-0001HL-Jv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:45:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUWqb-0006sk-QK
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:45:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id v6so2591147ejo.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hn5TMbb2yUea4oSJcqirkLQfgPQCJitWgbF3SFgszjY=;
 b=GTyN5C12iKkmS42ip00wFWoeZO6Yyh+iBPX2jmb4YYkMPc7Oc5W+X9w8eQomMiKuHA
 K4LRuY2VyrXSXWhoVhVEXYp1b7dC655VQpX6QVN6FWlXf67742DH8B/r9im8jN6habei
 LK1Ju94uFRc0rGcD/C3VwktbzoSYlEqXiEZxqinioFmXmywyZD0fUkeQm7DaEMm2x0JX
 gslJIi9e/GOLBD+7RwE+hEB4pDKhhTK8MvVUkFj4GmYR8WjsOSLMgHrsAvBfNZDkiuLN
 PZ9hbDBOeOQqYwJIJ7vIe0ig5HKOE3ZUQNTcp82lLCHDhjrWOAQIeeypusGrwQ5XRLHj
 oiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hn5TMbb2yUea4oSJcqirkLQfgPQCJitWgbF3SFgszjY=;
 b=P4g+hWtdqh5qjCjkranPRMvRlDpfjV82FBFDANQkK8N+SxhFtqpcGrG2VjWcRK+XfW
 y3X1CTVVvNd3jqhvrS6clM4TPcbKa0jCzPww8xhtXlLww0NA9P7JFPu9sjhRGcPpkgsm
 AlEY4IioggIoWy/Bs7ih9xQOfNg4uBgvtc88Gf0SJTxv5U5cY6Ial0kN7MJbu+HCwyq5
 RDJIuxhJOkeCYv70PNrS6hrRTM7IlpstIqTfUQDtCHbRIM6KXvZG9AtughB1TTz0PnTi
 Hf4vRLsZPjrSJYTm/KWNy6Y5aRMsZvhyzws/j3+F5wWlQgTO5qJyXxx/RC1CQRD+wPqs
 vv5g==
X-Gm-Message-State: AOAM533+f1/Pr+DoLTg1jzLk1hmHkrj+B1ODaaH9Eg8g6hfOZTS9XJqN
 MDg/yVARTq408VjyuUax4uJ1m+KPrqRtfug33KXR8Q==
X-Google-Smtp-Source: ABdhPJxj9jIRWJBEmk0p0ftMOlSju5xL12a9joXb280bLoYYeh6jmDtOizOVlRxDGwCDTbZozitMLqchg0yABmwTB9w=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr11362528ejc.250.1617896730245; 
 Thu, 08 Apr 2021 08:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210407175416.201555-1-dgilbert@redhat.com>
In-Reply-To: <20210407175416.201555-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 16:44:49 +0100
Message-ID: <CAFEAcA9MA3+-agpC1SQ3kzSF20Onw+stgZ19Lv=Uzmj0AOjVKw@mail.gmail.com>
Subject: Re: [PULL 0/6] V2 migration + virtiofsd queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: huangy81@chinatelecom.cn, QEMU Developers <qemu-devel@nongnu.org>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 19:02, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210407b
>
> for you to fetch changes up to e999fa47b220274082cb238d5ccb2c9bacd42bf1:
>
>   tests/migration: fix parameter of auto-converge migration (2021-04-07 18:37:56 +0100)
>
> ----------------------------------------------------------------
> V2 migration+virtiofs fixes pull 2021-04-07
>
> A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
> a migration test fix.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> v2
>   Fix for !linux build


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

