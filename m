Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E794C58FBEC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:09:36 +0200 (CEST)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM70J-0002xJ-DW
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oM6ug-0006kc-48
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:03:48 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oM6ud-000743-7j
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:03:45 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id m10so13136539qvu.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=VU+VPlJI2dsH1NAaVvnTh4uMElUqOx1aPQBtYVSLDXM=;
 b=F5XXXpt4uxJHrBHetiN+z5b18BsZJSWEtYBKZ8ofWIoK/4Kt2WADAdmkD7XQnNJKKR
 H1QIPP2JBQwZYIqKhIyYFx5wl4HEq7O7bBitlvsnyZ6q+KtrR2laU34Uz/nMfC1AjuCM
 3Xa2uqWRYdCjRJ1BpMvAOJR3hY5omWTslzRP2tCSx+L868r6mdf/3x+4wDb46Om+GnGN
 zAqxsc7dK3F1CgdutO7ha9OZgHza5mfiH3bCVGq2cLQUKDBmkFZNwwaDaQmRcS95qU0O
 KlI0gNxzQ59qZq+rm+Cfv8E7wROXJlXuqAOED5A6BcJYETKEH9/byBTaZb2zJgPt+3ni
 s/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=VU+VPlJI2dsH1NAaVvnTh4uMElUqOx1aPQBtYVSLDXM=;
 b=XNEmDCexa8N91IWmvAePvYn4b7hA97Cnzfo6NSrC8qmmTqw1yY37t7KqtgyifLgBDW
 g8coYhY72/fJCVF60OBEpV+3spYAijsAQFbt0d51rqscmPv1XiSfvolU1zTcLHY2QNaM
 nwMhjPwJjs5O4CcFqBXnXvpdLuPKjSKTpXFinDcaLlSBRp9PaoLHcu488K19xHJqAtzU
 tqlXM+e0DzP6qZTOAjKJ493mvPz31EV5M3stuQHJ6u4oNDMzFAT357zg++VX3JxePlCi
 IogEqitbu4vr7eJfwFIKIpGpc4vlyti4zYlxiEpkwZVv1ImXRVf4p5yXAcDktorJt7tZ
 uNgw==
X-Gm-Message-State: ACgBeo07v54lVVrspoPt2ymdvniCFxywLGkfUUGRpZXeaiSYiDcviW54
 jA3Hm5b+9znF8kDjt3YJM29TqsebWaei4QEMd+M=
X-Google-Smtp-Source: AA6agR5/uL/Bu4lcE2bpZkoSZIsh5kdmPMBlP/Hd8f5yiew1Ec5YWRElzT4Ot1o2lf3G3hxLe7Jc9EsDJutceoNIW4k=
X-Received: by 2002:a05:6214:27c5:b0:477:2e17:10e7 with SMTP id
 ge5-20020a05621427c500b004772e1710e7mr26956890qvb.114.1660219421054; Thu, 11
 Aug 2022 05:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
 <CAJ+F1C+KqH7Egr_9f=w=qn4AXVEgaGsZ0nmpHL08PfHaZJ4wzg@mail.gmail.com>
 <CAEUhbmUC-aRi4o7G3TELNmJ5DnEZDjdnw5PJNTeQMbeT5TcUYA@mail.gmail.com>
 <CAJ+F1C+-0P01vUdD_sJA0JGOXj1Z6R1zOQ_K38Kr8x1aMhHV-A@mail.gmail.com>
In-Reply-To: <CAJ+F1C+-0P01vUdD_sJA0JGOXj1Z6R1zOQ_K38Kr8x1aMhHV-A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Aug 2022 20:03:30 +0800
Message-ID: <CAEUhbmUt=_+YXbdej4vUUZBpqk0iaUC4cd3oZvNNbN8GxBMwow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
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

On Wed, Aug 10, 2022 at 11:57 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
>
> On Wed, Aug 10, 2022 at 7:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Wed, Aug 10, 2022 at 1:06 AM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Tue, Aug 9, 2022 at 8:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> From: Bin Meng <bin.meng@windriver.com>
>> >>
>> >> The maximum number of wait objects for win32 should be
>> >> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>> >>
>> >> Fix the logic in qemu_add_wait_object() to avoid adding
>> >> the same HANDLE twice.
>> >>
>> >
>> > Please make that a separate patch.
>> >
>> >>
>> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >> ---
>> >>
>> >> Changes in v2:
>> >> - fix the logic in qemu_add_wait_object() to avoid adding
>> >>   the same HANDLE twice
>> >>
>> >
>> > Still NACK, did you understand my argument about array bounds?
>> >
>> > "if (found)" will access the arrays at position i+1 =3D=3D MAXIMUM_WAI=
T_OBJECTS. We need the +1 for that logic to work without OOB access.
>> >
>>
>> The delete logic was updated in v2. If position is at
>> MAXIMUM_WAIT_OBJECTS - 1, the loop will break.
>
>
> Ah I missed that. That new condition looks wrong to me. Not only it is re=
dundant with the loop condition check if w->num =3D=3D MAXIMUM_WAIT_OBJECTS

Did you mean the "w->num >=3D MAXIMUM_WAIT_OBJECTS" check in
qemu_add_wait_object()? It's necessary because it prevents the OOB
access to the array.

> But you still access the array at MAXIMUM_WAIT_OBJECTS index, which requi=
res arrays of MAXIMUM_WAIT_OBJECTS+1 size, since it's 0-indexed..

There is no OOB access in either add or delete. Am I missing anything?

>
> Unless I say crap, which happens sometime :)
>

Regards,
Bin

