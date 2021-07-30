Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F336D3DB529
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 10:45:58 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9O9V-0005Nv-K8
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 04:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9O8H-0004gi-PE
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:44:41 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9O8F-0000EI-Qz
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:44:41 -0400
Received: by mail-ed1-x532.google.com with SMTP id cf5so533915edb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZRdGf/YKwkDvNfgCZm4Et20I9AkFlynj4+2+IHH7/Kg=;
 b=Pn9FUBigwXj8rFhuyAvzWilLWEQCvGFw4I5hxRB0n0R7oOfkRz9yS3YjaO9nxTfNnW
 JhDgM/AO+YqUoz/TTNVBKyk8Loa6iYZA1Ovb+2bhn8EeQhcYybDChYx8WNCqBOziN3P6
 aDT3eQUbMbC9+Yk+HYH2E4MXXHqtnN4K1M0D9MmbvEE7uqYf+och5WUiSjEEhnzLQjzg
 zoTD2pqRgWPMDicMUmNhro6WbUR5B4rIdJ8EPzpWbQudqNBlm8msACh1n15XgqOVBcZk
 bv+axBgoWtSkSVlyK2Wb0nHfiOtYaDpqAXIXr2ZMqX2H7WntrUMnMNxwWvYxe8vGJ35O
 wLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRdGf/YKwkDvNfgCZm4Et20I9AkFlynj4+2+IHH7/Kg=;
 b=PXQYWY35xRGSRFyPSqWhocPv6T5Y1qABSyl1fYz5RI/rm6IbosIsOMOA5Pn1JGyMBN
 Dp3C3fKTlDgQ/gKtgvr6tSQPdw/rnpqfTgRpMa6bOt54LB5AiNdNdFX7lwlSOhnrmxJg
 /eyvZTmg1nXu0ysPFZgtRJwFJhf0ChGUFHycbtR90pVwS5uQ5QBkWbJY7iR2UWOJ05em
 EYUFpY5vWK5OAHL+nd2UxnsFIYgJ03vrgJ3g7GpJN3/LQtNlr+blIS0B7suZonLVn0Yl
 1UlzHaW7WRVLGeBFNHIJDd6pNZX2iu1ZpTJvi5fYWl/RxL5+PA59FqPnCxrqjlNQRA7c
 o4EQ==
X-Gm-Message-State: AOAM533ys/sbWXczS1BF4xVdl2iNnb4EjFImCv6pkDJ4PZp/2s8j00U1
 LMgyov9lvCB8cR+ywldiQIHTob7rdOF2++gCkCi/Ww==
X-Google-Smtp-Source: ABdhPJzmPmZdZ7e2BLUO0jsec847PN6hwlUem35hmLvecc6u/J7pgNbFTFHHIf/yLeNfDQzNftjw0GOd+SUkNLwCYQM=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr1743277edb.36.1627634678126; 
 Fri, 30 Jul 2021 01:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
 <87eebg43ns.fsf@dusky.pond.sub.org>
In-Reply-To: <87eebg43ns.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 09:43:55 +0100
Message-ID: <CAFEAcA8rMcRm90acsrJqUg-TKt1Tj6R9ZTGM7pnvs_M4-5=rPQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 09:18, Markus Armbruster <armbru@redhat.com> wrote:
>
> Eduardo Habkost <ehabkost@redhat.com> writes:
>
> > When there's no specific class struct used for a QOM type, we
> > normally don't define a typedef for it.  Remove the typedef from
> > the minimal example, as it is unnecessary.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  docs/devel/qom.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > index 05d045bf570..dee60a64c0a 100644
> > --- a/docs/devel/qom.rst
> > +++ b/docs/devel/qom.rst
> > @@ -20,9 +20,6 @@ features:
> >
> >     #define TYPE_MY_DEVICE "my-device"
> >
> > -   // No new virtual functions: we can reuse the typedef for the
> > -   // superclass.
> > -   typedef DeviceClass MyDeviceClass;
> >     typedef struct MyDevice
> >     {
> >         DeviceState parent;
>
> Documenting existing practice makes sense, but I'm not sure the existing
> practice to elide this typedef makes sense.

The QOMConventions page on the wiki
https://wiki.qemu.org/Documentation/QOMConventions
makes what I think is a reasonable distinction:

# If your class (a) will be subclassed or (b) has member fields it needs
# to put in its class struct then you should write all of:
#
# a FOO_CLASS macro
# a FOO_GET_CLASS macro
# a FooClass structure definition containing at least the parent class field
#
# and your TypeInfo for this class should set the .class_size field to
sizeof(FooClass).
#
# These ensure that nothing in future should need changing if new fields are
# added to your class struct, and that any subclasses have the correct typenames
# available so they won't need to change either even if your
implementation changes.
#
# If your class meets neither of the above requirements (ie it is a
simple leaf class) then:
#
# don't provide FOO_CLASS or FOO_GET_CLASS
# don't provide a FooClass structure
# leave the TypeInfo's .class_size field unset.
#
# If a change means a class which didn't provide these macros/types now needs to
# provide them, then your change should add all of them (ie move the class from
# the latter category to the former).

By those principles, we should never do "typedef DeviceClass MyDeviceClass" --
either we have a real MyDeviceClass which contains at least the parent
class field (ie is not a mere typedef), or we don't provide MyDeviceClass
at all.

I would say the rationale for the wiki's distinction is that we don't
want to require unnecessary boilerplate for leaf classes without
methods (which are by far the most common kind of class), but we don't
want a free-for-all regarding how you write things either. So we define
a standard pattern for leaves and a standard pattern for everything else.

-- PMM

