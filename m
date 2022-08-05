Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5500C58AA49
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:44:21 +0200 (CEST)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvkX-00088m-2y
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJvhM-000541-Rn
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:41:00 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJvhK-0005yv-Mo
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:41:00 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id n8so3413907yba.2
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Di1+6iFO2KCpNDKVqT9zITDzzl+yYJz2Jq+UgtxN/tw=;
 b=O0vYTGiSScoZ78Ap6ANgWsO/kwqHjdYFT0D+GkHnanBQXw8ZWMe53XuGfb6G4orlla
 nvS3J7ceQNPSeZEkTShArcKiM9pEG0sfDDP3mNiuzugj38BV6D15B/CX5qHL8F4/xGbE
 sdFhf2rHD6jjJe6wc0WeBY1+9yMECCxxaS8vgVB/l7MsJtbG6gYhdjMDEVJ7Pc4cubhK
 bsBpzzMd0lxBNxHElQpbx8BT9oW24YPnq+PgxAnBsh1j+Y4WbQ5J529RPD6W9R6jwwTz
 R+ZqBBg20Lg+UEIl8aNTDOpyJJaP+5qKkMuoe55xRCJp6ryABPnZPMprG2WlCmOE91sJ
 058A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Di1+6iFO2KCpNDKVqT9zITDzzl+yYJz2Jq+UgtxN/tw=;
 b=hVtZ8MM7VNySBfWAa6VlpJY/5+XcZS4kxJpL8vinoM10m1+x1S4uTnjzB6RN2vU9Yu
 cS8LupQFHaBbsPagKu4F1sJChJFdyCroiBE3X5ud56hm4rqQYkblCwGDFFIQ6CFGhbtQ
 ym4qtODw7pJHEJY7Ei+YTueUqcaMSf1BIqwdb6pEsFEaWWauDIFd2ATCuDIecBtz0R+y
 LzdQwRuqjJWvvppCIoPpw8YdgC/X8k1bSmEVLJQl1wA4L/rluF6A57NxVCj/a/axZllh
 XO/3os2FNluyDaVimG7mAUUiLLngS+3ex+i6djUcaB9AsV9lxnBWoBgoQIbsqVtoCjsJ
 YZIA==
X-Gm-Message-State: ACgBeo0w4S+8Xiku/9n1oQC7acO2PWFVJEBfn+J50ugHBIk//+NWycxW
 U50W7nmgWqgPFeJksf/UCdC/PHZcjKKfGuI93OsTqg==
X-Google-Smtp-Source: AA6agR52+cSpl/vLWxkTbEW6XiSUNi6oQApa4tK6GBn4PkOhhO0yUdw4Cc/GLac5kI9mGND7VHRCxszVpGep7rHQ9Jk=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr5027005ybn.479.1659699657563; Fri, 05
 Aug 2022 04:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <4561100.0A2huPDW8y@silver>
 <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
In-Reply-To: <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 12:40:46 +0100
Message-ID: <CAFEAcA-ApDzJvYoWMP9un1p+bgNNe6g+J09QPfxUv4Ee=WMyeQ@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
 Nikita Ivanov <nivanov@cloudlinux.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 5 Aug 2022 at 12:27, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> On Fri, Aug 5, 2022 at 3:11 PM Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
> > I was thinking the same as Marc-Andr=C3=A9 before:
> >
> > commit 1dacd88ddcf33eb6ed044c4080e3ef5e3de4b6b6
> > Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Date:   Wed Mar 23 19:57:27 2022 +0400
> >
> >     include: move TFR to osdep.h
> >
> >     The macro requires EINTR, which has its header included in osdep.h.
> >
> >     (Not sure what TFR stands for, perhaps "Test For Retry". Rename it =
?)
> >
> >     Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >     Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.com>
> >     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Wouldn't it make sense to first rename TFR() to something like
> > RETRY_ON_EINTR() and then doing this consolidation here on top?
>
> Apparently TFR often stands for "Temp Failure Retry" (looking at
> github code search)
>
> LOOP_WHILE_EINTR ?

At the risk of getting into bikeshedding, since glibc's unistd.h
defines a TEMP_FAILURE_RETRY() macro for this purpose, maybe we
should use that, with a thing in osdep.h for "provide this macro
if the system headers don't [ie musl, BSDs, Windows, etc]" ?

(There is a subtle difference between our TFR() and the glibc
TEMP_FAILURE_RETRY(): TEMP_FAILURE_RETRY() casts the result
of the expr to 'long int' before comparing for equality with -1.)

More generally, I think we should either use this macro rather
more widely, or get rid of it entirely. The current situation
where we use it in some of the net/tap code and a few chardevs
and basically nowhere else is not very satisfactory.

thanks
-- PMM

