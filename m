Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21E5718CC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:43:44 +0200 (CEST)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEIo-0007SZ-Pl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBEDG-0003Df-Ex
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBEDD-0001zv-1J
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657625873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1i2cZgWyf2pGJEg7SlgJ7GEdXXIyaVzMypfPgHu2w0=;
 b=QpiyjPpV27OiSYn2tECpVuHRZFtpkEU2OrLvk/QuoaFeO6vJuv71XTJ2lS3HDyJgSnBAxr
 FRHxbRw4uCQmthcVINiJ2iGyGmgLijCXYopd+g2HmeEGyfOWo5c9i44VoLsYgkwVYxrAAh
 JtELJuhV6ED9j9+/snsaNWNutQ5jurA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-S8fb4NSFN3iiedl2Qw7vbA-1; Tue, 12 Jul 2022 07:37:46 -0400
X-MC-Unique: S8fb4NSFN3iiedl2Qw7vbA-1
Received: by mail-oi1-f198.google.com with SMTP id
 r24-20020a056808211800b0033a0214cfd0so2908150oiw.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 04:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c1i2cZgWyf2pGJEg7SlgJ7GEdXXIyaVzMypfPgHu2w0=;
 b=uwKzEdmjEH6VJetcDFLCQ5IF7s1LH+FQmPcaHd8nR+4EKPRCCVcLKmsW9s6dW9HQZn
 8N4hkfjMhc6VoFGnMOeuxJvsBl3EWZjBpnPfZv6NV1ZO8Ezn3B9q8wCnaS6Q4HfkEnKX
 OpOhWTw2lNwzBW7xkkCiRDsaazjABC85nr4yHwrJLlW4yH3568M4UCGV3sD+qJ8W1KY+
 4jtKA5Vp3JblRAKeOQ+bPXsiZO9N4qMTYdbDsDKDciRe1fW71W+4+B0MnaP52d8paiaP
 e4FvjdoHCP6CHAO4PStTx5ss5CVJMtmDQf7pAo9lIjZ3OLb8oubkfFcoKH+V6B7j1eQL
 NmnQ==
X-Gm-Message-State: AJIora9v5Jl9lU6WY9p77W0Ry3eScmk7ru1uAHzbN1Hjs28RQOSwy32t
 BF1IDa8ofPV4P1oEuoWapQm0FFXWkr5n4Ftcqa74WvS+zB4UU+hDQoJ53qniUkHuKH4FS2UXamJ
 OsMNEnTT7Tkmx0T+12V73me/s/b7PRU0=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr1617321oib.205.1657625865770; 
 Tue, 12 Jul 2022 04:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vY7oKUeTkloKoHxnHo7DHUh2zf9uYfDTel5PE5g7GXFDjlHtjEv7qK90e/3ZibL0ccAwGElMCB6ZdjHllC3ck=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr1617313oib.205.1657625865609; Tue, 12
 Jul 2022 04:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
 <ec9ce92e-4e91-6ff6-49d0-bc694eef5fa8@linaro.org>
 <61f9c4ac-5600-46ef-9c4d-724c1d7bf400@linaro.org>
In-Reply-To: <61f9c4ac-5600-46ef-9c4d-724c1d7bf400@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 12 Jul 2022 15:37:34 +0400
Message-ID: <CAMxuvaxobAZdKZtNY3yc_n00zUWCgiiD5GNdTF=7ZfJM8MODRQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gitlab-ci: msys2 improvements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Jul 12, 2022 at 10:10 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/12/22 09:24, Richard Henderson wrote:
> > On 7/11/22 13:26, marcandre.lureau@redhat.com wrote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Hi
> >>
> >> This is a small series to attempt to debug "Intermittent meson failure=
s on
> >> msys2" and improve a bit msys2/gitlab reports.
> >
> > Thanks.  I've pushed this to staging for a test run:
> >
> > https://gitlab.com/qemu-project/qemu/-/pipelines/585473909
>
> Amusingly, both msys2 jobs passed the first time, but I reran and now hav=
e a failure for
> your investigation:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2707801937
>

Hmm, there are no artifacts. How come? meson-logs/ should be there..
Anyway, I am not sure it would have more details about the failing
command.

Sadly we don't have any stderr output, and ninja doesn't log the
failing command exit code either. I guess I will try with a custom
ninja build now.


