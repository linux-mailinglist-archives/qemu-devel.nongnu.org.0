Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31143876F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 12:09:43 +0200 (CEST)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw1qA-0000a1-F0
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 06:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw1pV-00009e-OV
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw1pU-00064P-Sq
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:09:01 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw1pU-00063Y-OC
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:09:00 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5so130598067otk.1
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7IGRGSMi062/RPHWLcLPqvU9LtOyEnSJmPOD3J1MyTI=;
 b=LLXUgnbhj/ZiOV74m5vZYGrYo32cP9TaQ4WMMBj5epqzbNZsdlCu1h+vOMne/MS9n8
 gnLINkEnY4xMA/GdwFe5EqpNVy18a5WblgvOIxqZ8SRo/haf9hF1aHjHe6HKALhdPUKD
 TiNdr7Xp1bXEAvnnhf/KCeXWWbrUBpCQc7k27MldHGS0c+5AGAzNDOHBVnkRmeJlFAj/
 rEJv8ilaDV3xf5QZApLJ2pMIg1dgzpgEDgHBTJ1ALvdyJSf7WKZstBXZdkpwsnETsQDM
 ktnLqukQ4qcMJNADen5FRjJ37cIBqL1lul0nvfqU5DRnuRhw5l23qBbqWhjXQBhoxGlm
 PH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7IGRGSMi062/RPHWLcLPqvU9LtOyEnSJmPOD3J1MyTI=;
 b=HrxZIbJ11vNrTQTyiXgjSeSwz652k6iwZJiqxjsI7covUhxz120QWnFo2VCvMk5ZwA
 qGPSRLJcKeJXACWJu7yk+9KBCAoi3t9JY9uuHAxoTrm9HBMQxOnAxHTkZ+o8fDzqejfP
 tj3QXT0eNdgIBBQhn/89oXNy2y1naZpKP/O9DIHYqKYpQji12bgAYKYPFUL0CSKE4A1I
 bq+61ak4Nh82SMGNi9l+128sOfw/tm2oTQVVz5IC0pFVpClagFMaxLNdnrn7tdq5sNCg
 z/vYqUntBv645eX+uE6U6pVhVwMLhCV/Vh8ZfWVBwJPWyBYcz6wSew3uEQLWmWKwn0SI
 02lQ==
X-Gm-Message-State: APjAAAW6EuQ41ubALIW2tfKXqeVhC8Saj16mN6eg7fZbacWiJjJnTlzn
 3Nc9CzMJVyemzXuggo0QgdoDDX5JWSaXBPTgBVVuwg==
X-Google-Smtp-Source: APXvYqwPH+UtAnrur3ZJnCp0kmE/Yl8sxnxxOU5IYugnPhtso6AjEJIodSGLemxxrr96HY5DY8oKjcGGBR0i87MxGX0=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr15671453otj.97.1565345340023; 
 Fri, 09 Aug 2019 03:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190808164117.23348-1-alex.bennee@linaro.org>
 <20190808164117.23348-2-alex.bennee@linaro.org>
In-Reply-To: <20190808164117.23348-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 11:08:49 +0100
Message-ID: <CAFEAcA9i4igz8+DrmfcfDbBJEoR4pyvqCvKEuB=Vrt6_6y4onA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v1 1/7] fpu: move LIT64 helper to
 softfloat-types
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Aug 2019 at 17:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This simple pasting helper can be used by those who don't need the
> entire softfloat api. Move it to the smaller types header.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 2 ++
>  include/fpu/softfloat.h       | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

I think we should be trying to get rid of uses of this
macro, not making it easier to use in more places...

thanks
-- PMM

