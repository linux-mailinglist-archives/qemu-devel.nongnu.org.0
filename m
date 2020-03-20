Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFC18CF6B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 14:51:16 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFI3O-0007uI-6t
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 09:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jFI2J-0007O9-Pr
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 09:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jFI2I-0008BT-AO
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 09:50:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jFI2H-0008Aw-U1
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 09:50:06 -0400
Received: by mail-oi1-x243.google.com with SMTP id e17so1809780oie.11
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3636sysYGJTBzFD5ZtpReGLwp2VHaRoisV/UEboAcaY=;
 b=gSzax4/ZM6sZSkChwKtu/AfqENgziVvB5BlinEpnRtEPUfuYZ5xgz3WYgf/dKCiael
 w9s1giqm3Ls1pjWsqYsNBvd8W3Dy2sqY/8mucOzxXjPYUnZkaLUVDMzIXb/juC6sQ0bZ
 5OZlfrJWDKGOpvXM3n/7wlBoynQYd0RXPqqqpNrLfTnPW5FD3gFmKJprHIXsUwIzm6zV
 NeJXMoeQelHtrSfrMXEwkrRqOEEHHoMcmXJL2NvDi97Vc77xAHqG31++ksBfzq0rCarX
 45FKgh38bgVIzbgmTTP1RFGeeSKneLdXC3kZTrQaWR3mzJdzNC/7vIsEDgEqDtbk5NXB
 ntew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3636sysYGJTBzFD5ZtpReGLwp2VHaRoisV/UEboAcaY=;
 b=Jzid0RNBylcSpS7FlBsSFuqc+sAOrejlhqsL3LX82op7vACB6GzSx+tjX+thMqgqxl
 35aQ25CjJ2UPsRULIHiNPOCHlJoMD5O8zCupaK3ZITSA5ljnWO7XXMwkABm/gkqou9tM
 c1CpKaZLRhepAnr/Zf3OJAmDySJIKDBX6pY6wyjt3i7FZXt0fdTH+vlmF/YjgnTTH+6B
 JLNjB81h/+EejTBYfSvj41yjcjcYKdfhX0kIY3FAFBxTw/iG3Xhu/8wXSGJEIymV/mXS
 2FMI0aNKYo+3iaqHynhglTAl7HORX9aWS1ejWMFCAllTfBFbU6XfG2LvyyS8OOOGbdxE
 IiTQ==
X-Gm-Message-State: ANhLgQ1w24tMb/Q/Wq9XyIYo11F1b2WX46EcZupdRf511tWeFOLC1P1F
 eaP3LU5bwMlBkBeT2kiLRZ3g2AfsNNrBS/WW1XPlAQ==
X-Google-Smtp-Source: ADFU+vuWYqEp8FOPSQOtdiROtbx64txgy6wrpVAjZvt3ArP5hI8ZtklObvJryQZoaR9bJyztsU3aguV4TDj4ltqPDnE=
X-Received: by 2002:a05:6808:8f3:: with SMTP id
 d19mr2001796oic.146.1584712204486; 
 Fri, 20 Mar 2020 06:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <1455053236-22735-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1455053236-22735-1-git-send-email-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2020 13:49:53 +0000
Message-ID: <CAFEAcA9_yGg4cDc4rxVUeemaPQk_qn9=BqrT_Ck8hB3EK5F92w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] qga: Support enum names in guest-file-seek
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2016 at 21:27, Eric Blake <eblake@redhat.com> wrote:
>
> Magic constants are a pain to use, especially when we run the
> risk that our choice of '1' for QGA_SEEK_CUR might differ from
> the host or guest's choice of SEEK_CUR.  Better is to use an
> enum value, via a qapi alternate type for back-compatibility.
>
> With this,
>  {"command":"guest-file-seek", "arguments":{"handle":1,
>   "offset":0, "whence":"cur"}}
> becomes a synonym for the older
>  {"command":"guest-file-seek", "arguments":{"handle":1,
>   "offset":0, "whence":1}}
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Hi; dragging up this patch from 2016 to say that Coverity
has just noticed that there's some C undefined behaviour
in it (CID 1421990):

> +/* Convert GuestFileWhence (either a raw integer or an enum value) into
> + * the guest's SEEK_ constants.  */
> +int ga_parse_whence(GuestFileWhence *whence, Error **errp)
> +{
> +    /* Exploit the fact that we picked values to match QGA_SEEK_*. */
> +    if (whence->type == QTYPE_QSTRING) {
> +        whence->type = QTYPE_QINT;
> +        whence->u.value = whence->u.name;

Here whence->u.value and whence->u.name are two different
fields in a union generated by QAPI:

typedef enum QGASeek {
    QGA_SEEK_SET,
    QGA_SEEK_CUR,
    QGA_SEEK_END,
    QGA_SEEK__MAX,
} QGASeek;

struct GuestFileWhence {
    QType type;
    union { /* union tag is @type */
        int64_t value;
        QGASeek name;
    } u;
};

So u.value and u.name overlap in storage. The C standard
says that this assignment is only valid if the overlap is
exact and the two objects have qualified or unqualified
versions of a compatible type. In this case the enum
type is likely not the same size as an int64_t, and so
we have undefined behaviour.

I guess to fix this we need to copy via a local variable
(with a comment so nobody helpfully optimizes the local
away again in future)...

> +    }
> +    switch (whence->u.value) {
> +    case QGA_SEEK_SET:
> +        return SEEK_SET;
> +    case QGA_SEEK_CUR:
> +        return SEEK_CUR;
> +    case QGA_SEEK_END:
> +        return SEEK_END;
> +    }
> +    error_setg(errp, "invalid whence code %"PRId64, whence->u.value);
> +    return -1;
> +}

thanks
-- PMM

