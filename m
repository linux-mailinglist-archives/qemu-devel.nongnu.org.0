Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A5322BC0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:56:10 +0100 (CET)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYAb-0002Dm-T2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEY9S-0001mJ-E8
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:54:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEY9Q-0003DI-IA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:54:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id o82so2503202wme.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 05:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n4ov823aqu5x8MFCo38CeHaZT1h/UNpobk6L0oHB28Q=;
 b=CNnFNjQ9ZRgsDCOFkD7rg95/DYGEdGPvTzZzBEUeIWkYBPndlSn2q0EE/yoe2tllTa
 fDNyHnYNlFiN3YB2y8krSne443OEaeykNQnE9yMeXSFb8UxXaFWqivHKpjJ48sSq4cSf
 x29201hW3Gc2G4Ei3TqGQZNcWfcSP1mlPZPXpnlQhp/2nr98/DXxEtNEYJ4v0AyLKUF8
 8fVR1ejuHxeteKyjjfWsVtqVrf6gBeRl1mL4xsYDWPf4fOXtH9TLCzUb/1521h61Blh5
 KVl4dElU17ckXz5UNvWdoPTnVNpsc9NUvnYIh5So7371B58ParwMGJkAjVIz+wrHpGEK
 zT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n4ov823aqu5x8MFCo38CeHaZT1h/UNpobk6L0oHB28Q=;
 b=DVOXGLOJh80cu+BC4eX/qhteVgT/wpIHtMfMI/j/lPjF26KOac+k17R/F+0RwLFNu7
 nc1Mpqmhrj0DDvjwRopri57RprGbFD4VnnMd6vf0sNpzzawiXYdoRoGpCvVrDMW3UFT4
 M+/yE0NjDDGO6/Wkg/CHJwPNoEuF5wRcmqtYqvmc6ame7xhKPSnyAEGFj+QdbrLB4oil
 s2/xfLVg0385yRdJBGyzTUClsyl8F3yW80ui59j8XhxidDh1zLjNmoYtDIoYnDScaEV9
 Bx/qMnbENryWhsJerKSAim80wcip6Iz4ervJTxF6ZQfWExe2DyR62EaeWs2q3AqPrRWu
 U2LA==
X-Gm-Message-State: AOAM533ObcnYHmveEuJe4NDChPxpD7+nupjn/LNgxdFiae/ISC7vGgZ3
 KBY7bN8VM4PkN+01UUtU9p/YhA==
X-Google-Smtp-Source: ABdhPJxStZU6gqGM1wcc09TIVR+FRBfAxZ7WJatXELTosMejUSbsDhMTiyjOb3s6HtcIFnWh9/VdUA==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr24620074wmc.43.1614088494972; 
 Tue, 23 Feb 2021 05:54:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm4072773wrn.88.2021.02.23.05.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 05:54:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41CFC1FF7E;
 Tue, 23 Feb 2021 13:54:53 +0000 (GMT)
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
 <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
 <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Date: Tue, 23 Feb 2021 13:37:45 +0000
In-reply-to: <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
Message-ID: <87lfbe51oy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, CONTENT_AFTER_HTML=2.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 2/23/21 12:29 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 2/23/21 12:07 PM, Peter Maydell wrote:
>>> On Tue, 23 Feb 2021 at 10:02, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> There is no particular reason to keep this on it's own in the root of
>>>> the tree. Move it into the rest of the fine developer manual and fixup
>>>> any links to it. The only tweak I've made is to fix the code-block
>>>> annotations to mention the language C.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>> diff --git a/README.rst b/README.rst
>>>> index ce39d89077..f5d41e59b1 100644
>>>> --- a/README.rst
>>>> +++ b/README.rst
>>>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to u=
se 'git
>>>>  format-patch' and/or 'git send-email' to format & send the mail to the
>>>>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>>>>  a 'Signed-off-by' line from the author. Patches should follow the
>>>> -guidelines set out in the CODING_STYLE.rst file.
>>>> +guidelines set out in the `style section
>>>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
>>>> +the Developers Guide.
>>>
>>> This is the first instance of a qemu.readthedocs.io URL in the
>>> tree. Do we really want to have our references to our documentation
>>> be to a third party website ?
>>=20
>> We can use https://www.qemu.org/docs/master/devel/style.html:
>>=20
>> $ curl https://www.qemu.org/docs/master/devel/style.html
>> <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
>> <html><head>
>> <title>302 Found</title>
>> </head><body>
>> <h1>Found</h1>
>> <p>The document has moved <a
>> href=3D"https://qemu.readthedocs.io/en/latest/devel/style.html">here</a>=
.</p>
>> </body></html>

I think if we treat the qemu.org domain as being the canonical URL and
then let it redirect where it wants.=20

> Or even better since we have a job pushing to Gitlab pages
> accessible on https://qemu-project.gitlab.io/qemu/:
>
> https://qemu-project.gitlab.io/qemu/devel/style.html
>
> Maybe the https://www.qemu.org/docs/ redirect should
> go to gitlab page now?

It could do either, I think the result is exactly the same.

>
> Phil.


--=20
Alex Benn=C3=A9e

