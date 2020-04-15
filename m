Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3081AAAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 16:54:45 +0200 (CEST)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOjR7-0004N2-2F
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 10:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOjQJ-0003qt-Py
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOjQI-0003wp-BE
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:53:55 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOjQI-0003wW-5R
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:53:54 -0400
Received: by mail-ot1-x330.google.com with SMTP id z17so165486oto.4
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yfe4xoX8UDAN6njj0x/TCQyoHuh8xDzC48Atuq+2O5I=;
 b=DHJ0L0DjgpKzN3L8fSiDgxLa3sAmsyLYE2BpWsv+gF3E1pO8Dn22Aq1mxC/I1zHORh
 2+uxWDrzp/DwmP6uGDCoYfFaN70zTHfp8I1oXGvW6Cj/LpD55DQ6vOHpWodOUNl7m9NG
 YAqbcXdCnkBX28pOErd7XZXeEjN2x8HKnh6DYelNT/h80kJbTNmDiygbnAYoN7MfR6QQ
 fcbA5UWJAjobFgtNP5kmoX/b0yuhfnhUjVxPKC/W3XSUQqdEMA+p0GkH4+5Qf8iCDo+2
 zO7jrd/uKWBt+ZvlxauajQhDeZMP2lh9B5kHDhAy0psDjKjpepIQQnqIweo9EKCDgUCY
 zv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yfe4xoX8UDAN6njj0x/TCQyoHuh8xDzC48Atuq+2O5I=;
 b=DJNA72lAyVKxliX1mcXDfNJcq7C0Z2G5QVf3ynw1NfWJbOi2Xy+DAQ2eAbZuR4jydx
 K6M7Z9vn8C2J1DYc0vMGID7mudMbXdTyHjXGNaqxXG+1aIZaSwXIPJlTWUM6HKWr1pEn
 44coQw9+F/dnDXSeAz+yy6w5XnFFMcAWxVUoZXyzS06EWjgXrwDK2g4+JoNS1Ix7QOv/
 gcHjlpn1W9Nb2B3kI3wzNYYj/t5CzmSMvrOvHHshQ9AmeGGkFd40UuiED7RrTFN7X1G1
 QAwbsPsHuED9gGa7/oUuTMM1P8yPD81xK5p6cUkorLH5aD5zwIk6xiWZJgWIRIDLTONC
 bd0Q==
X-Gm-Message-State: AGi0PubUbRH0kcZxRB5ShD9cbVaHMSFp9RT5iSNAPVwBdQlGK6tp4cKS
 P+3L/5KBV1QdnKTCeJuZnN66vMyJEG7Ern+ZzVkBRQ==
X-Google-Smtp-Source: APiQypLTdymMggrq7/sgX+1zWYAFGdZ9cxIU22rb2GVSPeqPDnEVGsg3ddcl8NK1OlTcigIlsL9IT02H74eYFnGatYk=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr4539111otj.91.1586962432936; 
 Wed, 15 Apr 2020 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200414124114.5363-1-peter.maydell@linaro.org>
 <20200415145055.GA4583@redhat.com>
In-Reply-To: <20200415145055.GA4583@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Apr 2020 15:53:41 +0100
Message-ID: <CAFEAcA9gugr_W-+VgjqzhqBowvdK8KLLUHuqQf_dZPHdJm6e=w@mail.gmail.com>
Subject: Re: [for-5.0] docs: Require Sphinx 1.6 or better
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Apr 2020 at 15:51, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> On Tue, Apr 14, 2020 at 01:41:14PM +0100, Peter Maydell wrote:
> > Update our needs_sphinx setting to indicate that we require at least
> > 1.6.  This will allow configure to fall back to "don't build the
> > docs" rather than causing the build to fail entirely, which is
> > probably what most users building on a host old enough to have such
> > an old Sphinx would want; if they do want the docs then they'll have
> > a useful indication of what they need to do (upgrade Sphinx!) rather
> > than a confusing error message.

> > Trying to get our docs to work with Sphinx 1.4 is not tractable
> > for the 5.0 release and I'm not sure it's worthwhile effort anyway;
> > at least with this change the build as a whole now succeeds.
>
> What happens if you try to build QEMU on   RHEL/CentOS-7 / Deb Stretch,
> with the new (unsatisfied) needs_sphinx version ?  Does the build fail,
> or does configure automagically disable the building of docs ?

As described above, configure will fall back to "disable building
the docs", unless you passed it --enable-docs, in which case it
will fail with the useful indication:
 Warning: $sphinx_build exists but it is either too old or uses too
old a Python version

thanks
-- PMM

