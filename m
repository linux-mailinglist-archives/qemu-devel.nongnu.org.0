Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C32FD298
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:31:58 +0100 (CET)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EWb-0006kv-SK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2EUp-0006Dv-TD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:30:07 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2EUg-00082Q-8k
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:30:07 -0500
Received: by mail-ed1-x533.google.com with SMTP id n6so10901059edt.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CUmdM87eibYeyJS9ud5wnJwabtjZJ/2yE6nj6kCjOAE=;
 b=DoJcXGHVm7/qLG/QqGqh8sATiOY+JBjjSkDhLRZUbaAqp5rernAvq2HEtEdZkYGCBp
 lRf3ngapmGnp8t5qr5gtymMncddnNOTGESPapr6GtMVhU+Jr/XgEcbaAKWPJ4c3jNnRb
 UJmUk6Tq0T6Uh6j+e5BveicDfVUEZH7IPN3t5ZI3oJheDDrv6V/37BH/2Uapn8UG6gKo
 FXlv4JtwQg+9qY+A3JdFWHfxvDE2UBb5yWAbuXxY/hDJDvZL3I2Tls7UxZiZm96b8bx+
 2zgescqCZck2lH4ON7/LjQ5UvhQUQCEtqwW865x5PEKigyRTJTTXTUclx6+FHttjjodR
 1HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CUmdM87eibYeyJS9ud5wnJwabtjZJ/2yE6nj6kCjOAE=;
 b=jXhI61SBYn+OIV2XDJ92+kCOVerTEKxRTmCagNFaUmIWFjeQbsIz/KYoQSLFgUbgZx
 6jGQbiULRmVDzuQwQ0gGC+G1LM0xecsou5bFqeBKyW+esviHSuOy2xISaFpfdR9kNNSy
 cUvsDGuK/y4/nowMgtbv0iT+duQiCvDTXUxFVsJTvaHKCbvbvE3OR1fkccICno5JR0QE
 2aeNvJDQCwQVUYSj8epYnI6bn4RVQXi8GFJN+fCWRwlrvzOxKwnbQ3A0E9Y579GnXaAY
 RKheVxrbMeI8fRUN2B4VFyKt2gM7Wg0g0zeLhGMCcd+Au4OBZ0jByyRGZYUDv0tcAy7b
 rFSQ==
X-Gm-Message-State: AOAM531B+mPmmixnk0Idovg3NUAhtq9qMqdM4WyjRRKh2hRPu2U0xi+y
 WMMGLMr/nlkXY2wdmMRsI3DayJ+EMh2MtZmOyfE=
X-Google-Smtp-Source: ABdhPJyYZ1tlFNSk0fzAddn7wKawklncKMjfo0vtemFCQwXRkt93vyymPBPEPhnjUeef9XByNNocs6xJbPP8Ii1PXOY=
X-Received: by 2002:a05:6402:1682:: with SMTP id
 a2mr7809169edv.30.1611152993973; 
 Wed, 20 Jan 2021 06:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
 <20201027133602.3038018-4-marcandre.lureau@redhat.com>
 <20210120141800.73j3xdew7ahvdewg@sirius.home.kraxel.org>
In-Reply-To: <20210120141800.73j3xdew7ahvdewg@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Jan 2021 18:29:41 +0400
Message-ID: <CAJ+F1CKVU2_c9n0NbOxZVnxw0e99aamsEpQPXQKJZ-t4+9S0Fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] console: make QMP/HMP screendump run in coroutine
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd

On Wed, Jan 20, 2021 at 6:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Oct 27, 2020 at 05:36:02PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Thanks to the monitors' coroutine support (merge commit b7092cda1b3),
> > the screendump handler can trigger a graphic_hw_update(), yield and let
> > the main loop run until update is done. Then the handler is resumed, an=
d
> > ppm_save() will write the screen image to disk in the coroutine context=
.
> >
> > The IO is still blocking though, as the file is set blocking so far,
> > this could be addressed by some future change (with other caveats).
> >
> > Related to:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1230527
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>
> Hmm, just noticed that with this patch applied screendump hangs for vms
> with "-device qxl" ("-device qxl-vga" works fine).
>
> Can you have a look?

Weird, I cannot reproduce. I tried this way:

$ qemu-system-x86_64 -m 4096 -enable-kvm -device qxl -qmp
unix:/tmp/qmp.sock,server -snapshot rhel8
$ ./scripts/qmp/qmp-shell -v -p /tmp/qmp.sock
Welcome to the QMP low-level shell!
Connected to QEMU 5.2.0

(QEMU) screendump filename=3D/tmp/foo
{
    "arguments": {
        "filename": "/tmp/foo"
    },
    "execute": "screendump"
}
{
    "return": {}
}

etc.. multiple times at different stages.

Can you also provide a backtrace?




--=20
Marc-Andr=C3=A9 Lureau

