Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE49309420
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 11:13:03 +0100 (CET)
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5nFW-00056d-BA
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 05:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5nEL-0004Qd-9K
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:11:49 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5nEH-00081a-Rn
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:11:49 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g12so16630812ejf.8
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2sKnqExdK8GF7+L9pscIGnQekSslaMdaTCx8hPm13xA=;
 b=MSJ6/GN2YfQibEMY+ZJ7rBfz07aL+oGWypZxNCoatSwSryjDadSqXtZEOrpe4t3p3P
 A/e/p8sDu/Hr9ei3y0Cn+SWFqBLHFjjLK57ZfNpuL7w7c8ekVIRZLd50m3dt3UVBc2wk
 GNvdpbhVSrmrjqzrjkMRi2xMrmtPBSMjNXBGUk9bE7+XAAhWaLeyuwrH3/+UhPu+JbwU
 eEgLN6BGo5clIkkpkDqyXK7UAsS+AfybMU9Bd8TZUmL7KOQRAdvw7ByWlaXbkLDgC6HA
 iqCkFdeID+SIawGYNAV8pfRjjRnGpzlcJQIQAySHD534KCqOsyYtf0fqnaSF6WjRhYut
 MULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2sKnqExdK8GF7+L9pscIGnQekSslaMdaTCx8hPm13xA=;
 b=d1NJT9xB8JXTIpq+Z/pSmXNkIsMBRfo4ynYKzcWGqH/BAzQelbdSXS9Ct8tmumGxA2
 gu8oi2V5ItOF2iO8tTKy5btWZRiSElLcDAZBbl1HRqWOEZ0+5Xs1TSw9T/AwA+Pb/0ya
 MUf3ctL6uec3S7R32BrvufjdAPs571SW0bXHawyXgnY2aFhXxyipifor/SnGaYwjmwXw
 1z5lDNHlJ/l2mwbDxypBHL4mk9qx0VqeUbxkRlHAr7XTcVOmEg2Nahi1P3wUeCvFYW5J
 4O5/Wz1j8s/a5bIFqUxWK+ci80LLqdcKR9znidOLKivbSir7XP7mOgsCorTbnKPDWmdb
 dMVA==
X-Gm-Message-State: AOAM533vi5fN+8sjSZxWDZpinfoVd+yirRD47rzVc7QhZYbWs3YtsAJK
 VWIOERnrSaOoP+AUKwfI61FyhYOJVOsH7UVqi9c=
X-Google-Smtp-Source: ABdhPJwEp+hYX2JT95aQqxHycK/stVuN0qtRhN2NdRLbGG55W2D2kJAWSJ+OyoUoYmnoF8p2RWx87jWhwZzcYgh2NdI=
X-Received: by 2002:a17:906:4d8f:: with SMTP id
 s15mr8507851eju.389.1612001502613; 
 Sat, 30 Jan 2021 02:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20210129111814.566629-1-pbonzini@redhat.com>
 <CAFEAcA-CPcVyo2fzUX3sSdMoS6xJbxn7V4AwRFFSB+mU9bGGYQ@mail.gmail.com>
 <48eb40fc-8c5f-e2c8-3f51-9a45dc1ee128@redhat.com>
In-Reply-To: <48eb40fc-8c5f-e2c8-3f51-9a45dc1ee128@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 30 Jan 2021 14:11:30 +0400
Message-ID: <CAJ+F1CKmVLWT4HVmcDRBGwQcGfWfpSbHyG_1HFdXfXTD4Z+SqQ@mail.gmail.com>
Subject: Re: [PULL 00/36] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 29, 2021 at 11:56 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 29/01/21 20:49, Peter Maydell wrote:
> > On Fri, 29 Jan 2021 at 11:33, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> >>
> >> The following changes since commit 0bcd12fb1513bad44f05f2d3a8eef2a99b3=
077b6:
> >>
> >>    Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into=
 staging (2021-01-28 12:30:30 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >>
> >> for you to fetch changes up to 6c52f4644c9c8a18b8495e169e539632a897f13=
5:
> >>
> >>    accel/kvm/kvm-all: Fix wrong return code handling in dirty log code=
 (2021-01-29 10:38:38 +0100)
> >>
> >> ----------------------------------------------------------------
> >
> > Fails to build, OSX:
> >
> > ../../subprojects/libslirp/src/slirp.c:131:17: error: unused variable
> > 'old_stat' [-Werror,-Wunused-variable]
> >      struct stat old_stat;
> >                  ^
> > ../../subprojects/libslirp/src/slirp.c:143:10: error: unused variable
> > 'buff' [-Werror,-Wunused-variable]
> >      char buff[512];
> >           ^
>
> Hmm this is the same slirp failure that in theory should have been fixed
> by Marc-Andr=C3=A9.  I'll check again on Monday.
>
>

That's weird, https://patchew.org/QEMU/20210129111814.566629-1-pbonzini@red=
hat.com/20210129111814.566629-24-pbonzini@redhat.com/

-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 5dce846e3ee82d93462bc637bb0db2fd49f0fc5a

I can't really explain why the submodule wasn't updated to include the fix.

Peter, did this fail on various CI builds or during a manual build?


--=20
Marc-Andr=C3=A9 Lureau

