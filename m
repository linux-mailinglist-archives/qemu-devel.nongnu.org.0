Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D75AB36A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 16:27:14 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU7dY-0003Ux-QR
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU7bF-00018M-CW
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:24:49 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU7bD-0002VH-Mr
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:24:49 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id d1so1557880qvs.0
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=N2VN/CyXq/i2AlG3cmb+/8xDog4z1L8syaCGZF4w1h0=;
 b=b08oecFGBAUwgNQ7pChRxhkn17Gn+8HAPozyMpx8VMQ0Fe7Yj+WqnU5394kzjxVODh
 iXJ8IfxHbNxGQU4VpTzqO4eLsmS60wik/ZbGS5lsr5fhN7WfLqScgqfZWTgPlFxSdrE1
 hCtg2Cil0FXvyLDd6FP4hvCItyyGveNc3KVmXULPyCrxri/N1wD8cfHuG8jN2C1NiODD
 vh/Lu7vYpqpycx4j1oRQQsM+yo2qAcjRr/XDjNm99z1XphV9OkcDqsLi28fw1DHGSSDh
 +VHFDrqsIK8hmn5ZsyZVznFN49QudSpbOGmhkc9h2j/QodG3gB1EwV5lDoQQ0YaXOKk/
 DRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N2VN/CyXq/i2AlG3cmb+/8xDog4z1L8syaCGZF4w1h0=;
 b=mMLYLBD7jf8pMrZTlKqXGaeQ51zA5viojHriWfyTZDRB6EROD4Tp/afw7XQErCmUJV
 EOeHl6Gj4EoaHhH5kdeSFwbZToAJ5ANroYB9gihzZbxZJ9M6ipX/EEFocXW5Ejqdgd85
 NS4VjROyU8dqJY69m2Xi01u4eLwbi4ghEW9SIwDJdJn812ypkkArydeuQbK7c8+4uHZx
 Ii2AIRA/7jyrbEC3vdy0fVMrUzIpxv9Y7TqCby4iizdWGVn9+NDLQ8YyYzYEQHEEz1ft
 XEmzbUNVCV5QpcYlAVTUwc7Go7eTG9fxKRN+xsf2c1d/TEE4TTi9My87rEinXkHF9fjO
 rk/A==
X-Gm-Message-State: ACgBeo25eojNWjJJvipxorhJdIt2MZK5JUfYW/j93jOa110lAfi/abdi
 ufdKnFTEbVTsLgbiXm+JkjwP82lNtq/3Ek+inrM=
X-Google-Smtp-Source: AA6agR6sDh5eralCMDbO08/HL9UVrOfNp2+3VLFnm3eRT/0XaMYPk5MvIpnwb34Ipqu2XjLYGs2iiViSxS1PXoZr6T4=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr28825018qvc.12.1662128685721; Fri, 02
 Sep 2022 07:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
 <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
 <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
 <91c5a3b9-555e-51d4-1daa-9a4692ea437a@redhat.com>
 <CAJ+F1CJNt1d2uymwy-ONdAbqWd+MGMvw46B3VOTPPhd8FrVJMw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJNt1d2uymwy-ONdAbqWd+MGMvw46B3VOTPPhd8FrVJMw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 22:24:33 +0800
Message-ID: <CAEUhbmW0GeOyac4VPyZNByYbExeJcLED5s+MUP59tNqa9yc36g@mail.gmail.com>
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Aug 31, 2022 at 10:06 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Aug 26, 2022 at 10:27 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 26/08/2022 16.59, Bin Meng wrote:
>> > On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth <thuth@redhat.com> wrote:
>> >>
>> >> On 24/08/2022 11.40, Bin Meng wrote:
>> >>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >>>
>> >>> Socket communication in the libqtest and libqmp codes uses read()
>> >>> and write() which work on any file descriptor on *nix, and sockets
>> >>> in *nix are an example of a file descriptor.
>> >>>
>> >>> However sockets on Windows do not use *nix-style file descriptors,
>> >>> so read() and write() cannot be used on sockets on Windows.
>> >>> Switch over to use send() and recv() instead which work on both
>> >>> Windows and *nix.
>> >>>
>> >>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >>> ---
>> >>>
>> >>>    tests/qtest/libqmp.c   | 4 ++--
>> >>>    tests/qtest/libqtest.c | 4 ++--
>> >>>    2 files changed, 4 insertions(+), 4 deletions(-)
>> >>>
>> >>> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
>> >>> index ade26c15f0..995a39c1f8 100644
>> >>> --- a/tests/qtest/libqmp.c
>> >>> +++ b/tests/qtest/libqmp.c
>> >>> @@ -36,7 +36,7 @@ typedef struct {
>> >>>
>> >>>    static void socket_send(int fd, const char *buf, size_t size)
>> >>>    {
>> >>> -    size_t res =3D qemu_write_full(fd, buf, size);
>> >>> +    ssize_t res =3D send(fd, buf, size, 0);
>> >>
>> >> This way we're losing the extra logic from qemu_write_full() here (i.=
e. the
>> >> looping and EINTR handling) ... not sure whether that's really OK? Ma=
ybe you
>> >> have to introduce a qemu_send_full() first?
>> >>
>> >
>> > I am not sure if qemu_send_full() is really needed because there is an
>> > assert() right after the send() call.
>>
>> That's just a sanity check ... I think this function still has to take c=
are
>> of EINTR - it originally looked like this:
>>
>>   https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc3e5704af19ac6
>>
>> ... and you can also see the while loop there.
>>
>
> Agree, that would be the correct thing to do.
>
> Fwiw, the SOCKET vs fd situation is giving me some nervous feelings, some=
times.
>
> For ex, as I checked recently, it seems close(fd) correctly closes the un=
derlying SOCKET - as if closesocket() was called on it.. but this is not re=
ally documented.

Really? If you use gdb to step over close(socket) on Windows, you will
see a Windows debug message is thrown to gdb saying that:

"warning: Invalid parameter passed to C runtime function."

MSDN only says closesocket() should be used on socket. This is why in
the QEMU codes we map closesocket to close on POSIX, and always use
closesocket.

>
> And it's easy to mix fd vs SOCKET in QEMU code paths (we cast/map SOCKET =
to "int fd" in general), and reach a close() on a SOCKET. That wouldn't be =
valid, and would likely create leaks or other issues.
>
> Maybe we should introduce a type for safety / documentation purposes...
>

Regards,
Bin

