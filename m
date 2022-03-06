Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87D4CEB8C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 13:32:50 +0100 (CET)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQq49-0000mF-9E
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 07:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQq26-0008Ng-IY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:30:42 -0500
Received: from [2607:f8b0:4864:20::22c] (port=41975
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQq24-0007BT-VS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:30:42 -0500
Received: by mail-oi1-x22c.google.com with SMTP id ay7so12527380oib.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 04:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Uzd9axCqVtiPJcUvPoU3jakKAWv6Y2yaExG86ToAEKU=;
 b=fjoVW5h33FdIYWWYcsbOYLQMGyWEdOrumF++2XoWkOOsaPzboglQAWWLYXhyAsmP14
 AEcGb9Yx5Sg6k1FIXRbOyrJv35vjOAuiKBDbt36Uvm+bleKGbCAFQgrvPGHUmyOVroj3
 9ijfqkY5id5dOCNjSf3T/DTPgOKb5hpLX03TqLkw0aIjJHxh/ZCmv7VxAjWV7bHb0AP9
 QbtT4Il9BvMHXh1+ilpe3eG/ovRqgU0jLtqgh3USbU4C2CZwOT5d+CcF3gMyrLGU3M4U
 wk1p14ouADufvZcFQ+JqKIOygV+9VDx6oCBmQZsdj3hEjD8Q8+bSBExuHbMuFVDYK3Ef
 eO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Uzd9axCqVtiPJcUvPoU3jakKAWv6Y2yaExG86ToAEKU=;
 b=IA/iLPexqDjW6pDr5dA9wq4J7999d+OlWzRF+egJuquzB7hsDd28mxOrxtCY9ZSo3N
 M2ojvdbmHo4E+mocJ4NGQi2LVGBT8Il6mSomsgNdO5cVB1O0ccwthBGzN944+HPeegqs
 BW3tBVWnPCkDP0BA6mlv20vyNl4XO9IhdVWLtd/43o4bqX0bxCFqj8CInFn4bIrj9X8i
 9w0iG/cy6GnUIJql48YdyP8CE8zLEAbjtwC1boc6b20UiWVKUpxhuq5a2Ki/JCabBBr1
 cr5tPZBMaNP9bZVCGtu5x80tFQ6qhIK9GmU+C94+tFJCGY4vl0AKWVq5JtMRJicSMX17
 VBqA==
X-Gm-Message-State: AOAM530MmGtNrvmXIyIij2K7V9BdUX3YjUTq5dZvZ3+sBzqgiHa0aLpY
 KTXOuNZx2BlIiizcqbuLESta+8Dkrqm3ZMlzLHs=
X-Google-Smtp-Source: ABdhPJy0l+lE5ZxTAjOgReFjZW6GH8At/euLzk90S9VC4dpLH1wHSc8paH0+bZBUngftW/B+rvBPutSXFULkGTcIxyI=
X-Received: by 2002:a05:6808:220d:b0:2d9:bdb3:15b2 with SMTP id
 bd13-20020a056808220d00b002d9bdb315b2mr2072398oib.88.1646569838536; Sun, 06
 Mar 2022 04:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20220306063949.28138-1-akihiko.odaki@gmail.com>
 <1771824.72ebOKuLVD@silver> <0fc7e092-49dd-4fb3-a365-f5399a4cb8b2@gmail.com>
 <1758606.r3f8h81gpy@silver>
In-Reply-To: <1758606.r3f8h81gpy@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sun, 6 Mar 2022 21:30:27 +0900
Message-ID: <CAMVc7JW+nc_Zr_h1KbKGbd-xZY9vBxrsg8ZrWb92dha75YLcng@mail.gmail.com>
Subject: Re: [PATCH] coreaudio: Always return 0 in handle_voice_change
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 6, 2022 at 9:16 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Sonntag, 6. M=C3=A4rz 2022 11:54:00 CET Akihiko Odaki wrote:
> > On 2022/03/06 19:49, Christian Schoenebeck wrote:
> > > On Sonntag, 6. M=C3=A4rz 2022 07:39:49 CET Akihiko Odaki wrote:
> > >> MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/Aud=
ioHar
> > >> dwa re.h
> > >>
> > >> says:
> > >>> The return value is currently unused and should always be 0.
> > >
> > > Where does it say that, about which macOS functions? There are quite =
a
> > > bunch of macOS functions involved in init_out_device(), and they all =
have
> > > error pathes in init_out_device(), and they still will have them afte=
r
> > > this patch.
> > >
> > > And again, I'm missing: this as an improvement because? Is this a use=
r
> > > invisible improvement (e.g. removing redundant branches), or is this =
a
> > > user
> > > visible improvement, i.e. does it fix a misbehaviour? In case of the
> > > latter, which misbehaviour did you encounter?
> >
> > handle_voice_change itself is a callback.
> > It is invisible for a user since "the return value is currently unused"=
.
>
> Then the commit log should be more specific and say something like:
>
> "
> handle_voice_change() is a CoreAudio callback function as of CoreAudio ty=
pe
> 'AudioObjectPropertyListenerProc', and for the latter MacOSX.sdk/System/
> Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
> says 'The return value is currently unused and should always be 0.'.

That makes sense. I'll submit v2 soon.

> "
>
> Nevertheless, personally I would not change that, but I won't object eith=
er.
>
> I read it like "The CoreAudio subsystem of macOS currently ignores the re=
sult
> of your callback, and for that reason simply return 0 for now.". It does =
not
> say "you must not return anything else than 0". ATM it simply does not ma=
tter
> what you return here.

I think it is dangerous to guess something not described in the
comment. It can lead to possible breakage if the guess turns out false
and a future Core Audio version decides to do something unintended
when it is not 0. OStatus is just an integer type and does not have a
particular semantics like enum types and errno so it is impossible to
know possible consequences in the case. Returning 0 as documented is
possibly safer and not harmful at least.

Regards,
Akihiko Odaki

>
> Best regards,
> Christian Schoenebeck
>
>

