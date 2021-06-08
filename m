Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9839FCF0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:57:07 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqf2I-0000Si-87
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqf15-0008BJ-GN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:55:51 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqf13-0004jg-UE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:55:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id f5so20324300eds.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iAxNI2hQ7VVl3AGKwz1KJjB7b6Sbo4lB6VANr+8arVY=;
 b=dDwAfNn4AZgvGcA3KC+ftF1dHXe3hCrMuX/MakminbQgNUW1JvFbl4RTtlLHeoqs3J
 KHLH4/GS26IGaLCvlKrHJ1ND/UoJPXc7fwngxQY7+bYvlmdETG31PI5+kkfaX38u7juK
 qUel0M3BFq693jMkRc+Bs7lchAFvjrQr+1wUOrzT9S7EabFjyEEgz46h3pupPxzONaoR
 rnOmkItRhY3jnLz8LVqM7zcgfkaPrYhJsJE7qc8VsYw++LZBvz238hAJOded6PisJt/v
 2Z3QOj4DfLPh8j8nRbGanFcRv25bojU7yt031IanCwuY6hiK2TojN5hNRSu5H7Cc7oKE
 6eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iAxNI2hQ7VVl3AGKwz1KJjB7b6Sbo4lB6VANr+8arVY=;
 b=KU188F7PMpDKSLwQyRmeS+FTD9cqB1k3+lIVXX6+lQUiGex2BZV7XbOoFsX5M+APUj
 46JMqTjatif3jy5dRcHe2Cqlb1mKN5kRwhY2vRcFvy0/b7EuW7wjdpgWx7DNG45lbz9L
 /DdTQmyioCQkiJqgQC1TeAfvvf+Z3vzbAYJu24OWZm3yDJzcYwv+0Iw/nzROJaiVwlVN
 Ue7HRUMMmenJCvMEBQUBSUU6MhtMf6W1bk5Bdql9NfukDFYieLcdoUP5rJ/Y4dhb5EdH
 HVrBWC/M/lbZiuUgJfR5tvgxqAmr1sA2Iq7OT24PSrcXx1j3HZaA9qvaZOKiM+ojhFma
 ygtg==
X-Gm-Message-State: AOAM532pASE1syEE6fJlgU1XmiZiEYKXVsYQjinr9gJJbc/p2qtwYNlv
 DM2KUfWUGuRyZwfyW7x4KSdQwsJbDPogaypayNEXEw==
X-Google-Smtp-Source: ABdhPJwgiBtKggTr1K8bMtzyh5p/Beay3VPEuke0jLEYJNTxyqYT6hxs7PW2mQjXE2GsR+TkrTfvU8HtX1q5wIiPVT0=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr26960262eds.146.1623171348231; 
 Tue, 08 Jun 2021 09:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 17:55:14 +0100
Message-ID: <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 16:55, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Jun 7, 2021 at 4:17 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:

>> >> clang sanitizer build: link failure:
>> >> subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
>> >> function `arp_table_add':
>> >> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/l=
ibslirp/src/arp_table.c:51:
>> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> >> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/l=
ibslirp/src/arp_table.c:51:
>> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> >> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/l=
ibslirp/src/arp_table.c:51:
>> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> >> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/l=
ibslirp/src/arp_table.c:34:
>> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> >> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/l=
ibslirp/src/arp_table.c:34:
>> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> >> (and lots more similar)
>>
>> > I don't get this  when running make vm-build-netbsd. What else am I mi=
ssing?
>>
>>
>> This isn't NetBSD related, it's just a clang sanitizer build on Linux.
>
>
>
> I am running configure with '--enable-sanitizers' --cc=3Dclang --cxx=3Dcl=
ang++ --host-cc=3Dclang, I can't reproduce.
>
> What's your distro? (or meson + clang versions)

Ubuntu 18.04.5 LTS (bionic); configure arguments
'--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
'--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
-Werror'
clang version 6.0.0-1ubuntu2

-- PMM

