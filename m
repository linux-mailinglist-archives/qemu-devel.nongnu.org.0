Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10033C18A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:22:09 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpyq-0003lc-U5
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpx1-0001rf-Ux
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:20:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpx0-0003TJ-4O
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:20:15 -0400
Received: by mail-ej1-x630.google.com with SMTP id mm21so67175545ejb.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uK5jXUJeQPpbW+vRQdKOqPfJz59uZ9C9pdAnb5AMj+s=;
 b=fJ+LZf2QUEHrSxIYHD6fKjjSCXBESsinK226PdLkJBdri0CA6EDhgTfpqt5RjF2ZgK
 2+uG1NIMMjja7upgsdZl9bDBZcJAEz0NODgo8ldco2yIiLrLdp9zyON4vsak2tf5563D
 l+3TBoQ0d17FyeEIlYJvr5RHhGr5qed2f5EbSqJvU6x+9hVNDXrbw+mOeTGRMoBD4r4m
 dnkcYQMZgU3h/LrCe2DovIcx7XHtFjYG/oy8MOsP1L7egcuNOG2Q4ehLhjlsTk1TpchY
 nAubP5Iek0KU98E+ouvAJYIw2xp6X3JzQDN7O9y8qOgJBCE5iNmbHCssxWoPLvBylzs1
 gguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uK5jXUJeQPpbW+vRQdKOqPfJz59uZ9C9pdAnb5AMj+s=;
 b=R65QWtQsOWD4Raik6bfyVpAOI1ERwF1lrgGywPaX1mTI6nUtbBAzK4KbxDP1fELVak
 KiO16mCkPiYB83yo1O5DLSJbx0Dd8e6L/nIxx2uQIPiy/8UAT+XXUCxfnkyhNynU4G7N
 oeufA6hAYQY0obTmjcCb5ULYyVaViwovnTMKh7J+rKf+lNiqMtdrbfrtEej0hKyw6u+C
 HBjoB6kZQdnnzsZ9KJhNju2TdqeetuVZX0c7VDaNYXrUDodDtG7QWPQw1KHP02ciAqmR
 4tv0Ppnt39LYSCNnsYWSIqhhWjTuLP5qybw8n/iJt6v4ZaD33zWG7TAkcCGCJoajVmLb
 Daow==
X-Gm-Message-State: AOAM532ou/ovx94esHvL+fOEOpQIEuB8r7lIwBcO8oXMGaw3cDQ8Ph0H
 24CzNOXbMVaxuVRD5j7ysP14aw==
X-Google-Smtp-Source: ABdhPJxhVhY9bw+pt+r4qHe3USnxXKQiBFCZsolWEziAXPPfn1dCZTJnOWeLVjwvoA0czL7AZUECag==
X-Received: by 2002:a17:906:b7d5:: with SMTP id
 fy21mr9827442ejb.153.1615825212209; 
 Mon, 15 Mar 2021 09:20:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lu5sm7713769ejb.97.2021.03.15.09.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:20:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D4A91FF7E;
 Mon, 15 Mar 2021 16:20:10 +0000 (GMT)
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-6-ma.mandourr@gmail.com>
 <dfa393ed-88ba-9c4b-e991-aeb9e73050a4@redhat.com>
 <CAD-LL6hQuCFkzwnRGh1QLA8xsrTZoLYfNfXbKaU+E=UZAcozOA@mail.gmail.com>
 <3bff00dd-34e7-10bb-ee74-45a7856be030@redhat.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
Date: Mon, 15 Mar 2021 16:15:54 +0000
In-reply-to: <3bff00dd-34e7-10bb-ee74-45a7856be030@redhat.com>
Message-ID: <87v99s8k3p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 15/03/2021 07.43, Mahmoud Mandour wrote:
>>     If it's unrelated, then maybe better do it in a separate patch.
>> I thought so but I didn't know whether it was a so-small change
>> that it didn't=C2=A0require its own patch or not. I will amend that.
>>     Since this is only a very small allocation, I think it would be
>> better to
>>     use g_malloc() here and then simply remove the "if (info =3D=3D NULL=
) ..." part.
>> I was thinking of always maintaining the semantics of the existing
>> code and since g_malloc() does not behave like malloc() on
>> error, I refrained from using g_malloc() anywhere, but of course
>> I'll do it since it's the better thing to do.
>
> Keeping the semantics is normally a good idea, but the common sense in
> the QEMU project is to rather use g_malloc() for small allocations (if
> allocating some few bytes already fails, then the system is pretty
> much dead anyway), and only g_try_malloc() for huge allocations that
> really might fail on a healthy system, too.
>
> We should likely add some text to our coding style document to make
> this more obvious...

So while there are some places where we may try to dynamically scale the
memory we allocate on failure of a large allocation generally memory
allocation failure is considered fatal (ergo g_malloc, no NULL check).
However some care has to be taken depending on where we are - for
example calling abort() because something the guest did triggered us to
try an allocate more memory than we could is a no no.

We could certainly be clearer in style.rst though.

>> I will split the patches to a two-patch series regarding the
>> util/compactfd.c file (one for the style change and one for
>> changing the malloc() call into g_malloc()) and send them
>> again, is that ok?
>
> Sounds good, thanks!
>
>  Thomas


--=20
Alex Benn=C3=A9e

