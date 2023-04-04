Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0616D5DF2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 12:48:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjeCO-0005ca-RS; Tue, 04 Apr 2023 06:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pjeCN-0005cJ-6n
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 06:47:35 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pjeCI-0007Ho-AB
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 06:47:31 -0400
Received: by mail-lj1-x235.google.com with SMTP id o20so30393625ljp.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680605247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vTFjSbAatVV/uDGOat4nJpCcR0zlplA9EarDO5LbQo=;
 b=JVf9Pqna28GYGM2Nm/nfSHclCif+090C24Ou0dykqojgJMneXPTy5WVabh+S6wRy5W
 RRQr2AOlzeREASDsY09/zAtr45ZGQFAW2uFBIn/2FvfUOZq1j/KP8b+AASl6YP9fgO8P
 ABNjmeXwAO8skec+PgwYTDtWpDmpk3HvdnrwgKFrJ4xCb5K582B3SHFJIMJisZ1nTZ+g
 Jp4J0s5kefKoejTcKKLzJE4lcEfF71Qe/3ZhwAjfUmeqZWaYBxY5LYNuoUza7wioJmsy
 eE3ZYAhEONESW00dy7JWsupbWZoM/fxQNPauiGlp8IFk5fqIzMSkkHq9xmW/7rDkfL98
 B12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680605247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vTFjSbAatVV/uDGOat4nJpCcR0zlplA9EarDO5LbQo=;
 b=bErvBRCd6UL4ekYJ6te7Msc7LeI2GrE/PKV6h1I6OtBtZG/eYIOzOe1+cUqLXRrwuV
 7z1C98KPf6ggIzQXByX9Vtg2K7xXMZk6Xls4RaKCDPR4as8WDRghn9Yko7bIxig5S8Lv
 n5yd9ayfb+yPJqLqxsIrJfojSoR1dfiDmHyiSahkTEUtaYn2mu5ADbIGrecTgW7QEgkn
 L35P56Hokmw8hzDilPpWbVrh9RuczU2zt2efxMdBdr4joqwI8dyqPNPJcNQF8EhwB4XM
 jX5cxeT6uCdRMxSJp/5JhOduPZUjvwII17PYtc7W3z6pvnmUja4Yxe7ANN+deRy/lNTh
 hEFg==
X-Gm-Message-State: AAQBX9eb5jFLq0lME5sA4DrFQoaTS7nsy/ScQkIWQDiooYHwckzK+iaq
 FlLyU0Uv1zpsiCy1+Eb2RZKklDOIkR8jQKmuaxM=
X-Google-Smtp-Source: AKy350aeksuTPohSDOSJqzIPdiYbVNa/YxnFrY+meJxBALUttzoVFT8mx/ySmaobuVjWBuKPX5E5pJsQdl9qNdorrzk=
X-Received: by 2002:a2e:9416:0:b0:295:acea:5875 with SMTP id
 i22-20020a2e9416000000b00295acea5875mr760522ljh.2.1680605246793; Tue, 04 Apr
 2023 03:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230403202053.80737-1-dbassey@redhat.com>
 <CACzuRyzGL6H_452-vJ4qXkEcmZrAd9uSgDEHFYsUT7Y-iTqsLg@mail.gmail.com>
In-Reply-To: <CACzuRyzGL6H_452-vJ4qXkEcmZrAd9uSgDEHFYsUT7Y-iTqsLg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 4 Apr 2023 14:47:15 +0400
Message-ID: <CAJ+F1CLtm8PrheLbggupPY-9mWPZsR802z1H51Ak=Mzz7__-GQ@mail.gmail.com>
Subject: Re: [PATCH v10] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, vr_qemu@t-online.de, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Dorinda

On Tue, Apr 4, 2023 at 12:36=E2=80=AFAM Dorinda Bassey <dbassey@redhat.com>=
 wrote:
>
> Hi Volker, Marc.
>
> I have spent a significant amount of time revising the patchset and I'm e=
ager to see them included in the project. I understand that reviewing the p=
atches can be a time-consuming process and I appreciate the effort you've p=
ut into providing feedback and guiding me through the revision process. How=
ever I would appreciate any information you can provide on the expected tim=
eline for merging the patches. Let me know if there's anything else I can d=
o to help move this process forward.
>

QEMU is in freeze, until next week or the week after
(https://wiki.qemu.org/Planning/8.0)

It is expected that newly introduced features or code take many
iterations before they are accepted. For the pipewire audio backend,
none of us is an expert afaik, so we are also learning about it, and
trying to make it better than the existing one if possible. Once all
comments are addressed and the patch has a few "Reviewed-by", the
maintainers can queue it. Then we can address further issues as
users/developpers start finding them. In any case, the pipewire
backend will not be "released" before QEMU 8.1 (in about 4 months,
depending on planning)

thanks

--=20
Marc-Andr=C3=A9 Lureau

