Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A112D8FB1
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 20:05:38 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koWgb-0006QI-No
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 14:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWfL-0005qp-Ik
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:04:19 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWfI-0006sV-So
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:04:19 -0500
Received: by mail-ej1-x641.google.com with SMTP id w1so14895549ejf.11
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 11:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j0NYrno7+/a+lc7xZFPAcM7hD6rNZwF5bjkMU0YChUI=;
 b=xzGVv2/UfyemM4rvmBrUB4SlBpCmKvZaZ3QJYbis9Z2eIOaGAL6lDZ/7E4/C0A0XVn
 2cVXCnaCTy0mWXA5apjOgy1TsyFXq6NLJ4NPhOuz0/J2i4lli37AnXjgHJpuxRAOlolC
 Fj3JJhpQkoZfV2VRZ/AVZqeMoGSUuaqifPgg8YuT/ARoyinqTgseQF15eq4+38M7U8wC
 +Tng4/GRgjuL5arjpMe1K55lIAq8BOpEFPrd/eZwy/J56OspFjN7cY1LkNTU+Ay7YhXY
 BK1AKNqGzkF5jzEs/XX5HETLjHX5amsBJkbu48q7OHWsiEHmJMVLPL2yoDAnyqwTIaip
 kGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j0NYrno7+/a+lc7xZFPAcM7hD6rNZwF5bjkMU0YChUI=;
 b=fICVPiqiEJ3rlnuvJXqT1e80jiy3S9L7V4WtOufwoPFhEp1C//R3NlS1aLi98mPtuj
 NIjJOZ2jLDEPQ7bgFMszNJBbEuM/tym3M5xkwGBKsGBCQTqOm9KZPaH/QkDjMt82khln
 zjkCaUftld4PLFCMhJPotApLsU84Ul8Qbo9PGScHmTWJmjA60YBQ7HPGIhG3q0Ia6jfs
 onJ1GDxfG26sUOKWJ2NJyeXxlqWqQvHkz/NbHULWLb5FrMqZxFyuQbRtRGMVytxFGPKz
 T+jDdiIcmcpXMUezG3IhJ/p+Iap+EoxHPbn3yLWP9/+xccamEdR9X5CSQW4Xag7xL6FY
 5tyA==
X-Gm-Message-State: AOAM531D7VXJ7rzFWiXCF7ycAIsCOVVitNXvMdhKxKAPjwAS7cz9rq0/
 DLVtjZUeb0V1UUapyCbPhtg5/pNV0hjWX0jiZTE0Fg==
X-Google-Smtp-Source: ABdhPJzCn2l075u5AR+/mFubKk+5wXEnbzlQnPd7iPuKY5fl27FyQkWwkq0UQSiyA2mQZWOmhufYtR2q6MyTfsc9I/c=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr19909712ejb.56.1607886255504; 
 Sun, 13 Dec 2020 11:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-3-r.bolshakov@yadro.com>
 <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
 <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
In-Reply-To: <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Dec 2020 19:04:04 +0000
Message-ID: <CAFEAcA_XA1FcQos+m0vv6DVkbaybYwX5ytsM5gMaLAtL0jGGgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Makefile: Require GNU make 3.82+
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Dec 2020 at 17:22, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 12/10/2020 =C3=A0 11:47, Thomas Huth a =C3=A9crit :
> > On 25/08/2020 22.27, Roman Bolshakov wrote:
> >> QEMU build fails with cryptic messages if make is too old:
> >>
> >>   Makefile.ninja:2655: *** multiple target patterns.  Stop.
> >>
> >> To avoid the confusion it's worth to fail the build right away and pri=
nt
> >> a friendly error message.
> >>
> >> +ifeq ($(filter undefine,$(value .FEATURES)),)
> >> +$(error Unsupported Make version: $(MAKE_VERSION). \
> >> +        Please use GNU Make 3.82 or above)
> >> +endif
> >> +
> >>  # Always point to the root of the build tree (needs GNU make).
> >>  BUILD_DIR=3D$(CURDIR)
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> >
>
> Applied to my trivial-patches branch.

Commit 09e93326e448ab4 says that the switch to ninja from
ninjatool removed the requirement for Make 3.82. Is this
change still required?

thanks
-- PMM

