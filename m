Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC53DA731
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:09:29 +0200 (CEST)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97f6-0004xk-J7
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97dd-0003GW-1M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:07:57 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97db-0002RK-7t
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:07:56 -0400
Received: by mail-ej1-x62e.google.com with SMTP id x11so10322255ejj.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PA5s8+QTelAqsKLUkYwcBeWlj85qW47gbMKSh8aubrM=;
 b=CKeMpe0Oy81QjjykARN0ZhOL7mmlUbyFyrvUwLjkfhrHBhxEmbGpwplB3+kTm9Sce1
 NeS7i/BsJb208a68HaF0wNf4g5Vo5TvvF6Enq1e9fFuHNLJUFGRu/vY1PRa3emNkPIA7
 OFl+VosmdqF8TNypPZaASV2N/HiqF4GksGCpssVbm6868AvqQZVyt4k8DYQF5NRfl9v4
 syQzNmkpYnIuvjn/2Ue4mZUarD4g0c81FxzyDCcvURD0MQlgZ5j4dI5vuOZS35OsCg2E
 JNXuyB4+bMegd3DPr3tHjhw/FPj9Y68tHURM1XYpIa8KI/4al4DJiyF7efMVSWijoJhh
 4xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PA5s8+QTelAqsKLUkYwcBeWlj85qW47gbMKSh8aubrM=;
 b=KP2tFe3nfcu8jDphkCO8wYgKmdI0KmQx29483yy3UvUs56tUC//xVrftI5+sXsvJZV
 xJWEi7n1V1tYzD4FhnUG20eIWj/UzIdXMiPiuDDBB32Cq60Rksh1vKM8aUEWY/zbai4F
 NR9q86XQX+EgVVZFhRhdIRKKB/95J1V3YmQV1dx2Zx4B+1oxX+TdcKPKICgKd5Evd9Fe
 tmkwMtx4ZYsv+jp9RX55gryUCJ755Hx6TsyOGUe+0kQ49SH6eLH548Mrqy1tECd3kXR4
 BmvsDsev5EkM3/JHfBWEjlqZTuziAU7Tv/HGpzNR7vIW8lA97gaOoxJ1+vvEgMZHc4QR
 ugPw==
X-Gm-Message-State: AOAM530chNKH+c8QNPsHTIqblM3AvLsGaILXvq6TpQZPDP81hhz8vUlR
 uNDhR4yHpEtQwGZP6wuIoomYQdczcUdP4QtMDLLvYA==
X-Google-Smtp-Source: ABdhPJwAKV+qyTF3h4J4I/IIAC2qCZkzpffgVpvYXi8HnCoP4Zhy3sqsSM424LllodJUbdxo3CsrjoQdz12PEZo5uUs=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr4994825ejy.407.1627571273913; 
 Thu, 29 Jul 2021 08:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210729124713.208422-1-pbonzini@redhat.com>
 <20210729124713.208422-7-pbonzini@redhat.com>
 <CAFEAcA8UO1J-N1cXdJiaeXUEX_MkhmTqHzgdSHNmogtTcpkqtQ@mail.gmail.com>
 <bca156a1-d567-b003-4dd9-9b72ad2c4572@redhat.com>
In-Reply-To: <bca156a1-d567-b003-4dd9-9b72ad2c4572@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 16:07:11 +0100
Message-ID: <CAFEAcA-n5XkS86AJgHQeZtmDTYqm6f5OHoUb+biHgKeK0mArCQ@mail.gmail.com>
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 15:05, Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/07/2021 14.58, Peter Maydell wrote:
> > On Thu, 29 Jul 2021 at 13:56, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Meson now checks that subprojects do not access files from parent
> >> project. While we all agree this is best practice, libvhost-user also
> >> want to share a few headers with QEMU, and libvhost-user isn't really =
a
> >> standalone project at this point (although this is making the dependen=
cy
> >> a bit more explicit).
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>   subprojects/libvhost-user/include/atomic.h       | 1 +
> >>   subprojects/libvhost-user/libvhost-user.c        | 2 +-
> >>   subprojects/libvhost-user/meson.build            | 6 +-----
> >>   subprojects/libvhost-user/standard-headers/linux | 1 +
> >
> >> diff --git a/subprojects/libvhost-user/include/atomic.h b/subprojects/=
libvhost-user/include/atomic.h
> >> new file mode 120000
> >> index 0000000000..8c2be64f7b
> >> --- /dev/null
> >> +++ b/subprojects/libvhost-user/include/atomic.h
> >> @@ -0,0 +1 @@
> >> +../../../include/qemu/atomic.h
> >> \ No newline at end of file
> >
> >> diff --git a/subprojects/libvhost-user/standard-headers/linux b/subpro=
jects/libvhost-user/standard-headers/linux
> >> new file mode 120000
> >> index 0000000000..15a2378139
> >> --- /dev/null
> >> +++ b/subprojects/libvhost-user/standard-headers/linux
> >> @@ -0,0 +1 @@
> >> +../../../include/standard-headers/linux
> >> \ No newline at end of file
> >
> >
> > Should these really be missing the trailing newline ?
>
> It's a symlink, so yes, there does not need to be a newline in here.

Interesting. How does it work on Windows hosts ?

-- PMM

