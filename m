Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DBB1A7A9E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 14:23:59 +0200 (CEST)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOKbe-00075t-9L
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 08:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOKaT-0006E2-FY
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOKaS-0003Qo-Eq
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:22:45 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOKaS-0003QZ-5o
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:22:44 -0400
Received: by mail-ot1-x343.google.com with SMTP id k21so1023036otl.5
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XwFPBNqmtc1cHYX6paJTvA6Lr2EfVZK3kehPui9rTaQ=;
 b=RcOKD/PEronnwQZjqDhEgsmmi7Cg6RbQuJtEGg0fyO4KSj3SvFjwCmOgBS1WTRyHpy
 FqmnVAu06P1tAOTV2vTqalwm7XcvRCPBZ0MbjMMYs7Pd821oKBY3hs/tSsH0NpYKVUV/
 Rr9knVmpe7Ic3ePzsB4D9fkt3d/mPgnBOxsXSzl1lE+Qtguyql0e5misRqXbwgcM5gAr
 t1d6bdcXSJoNEO+RyTvRVrCm4eREM/NYo/7HrLPkugykBqQUs3au5Atsy2yUZ3FBwloU
 SkgxcwLmb/pZCzPAi8Zru3xJbJl4oKXsKtkFtRpwideZRIarWeuiNL5J9TVkVbaK8OeT
 ON3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XwFPBNqmtc1cHYX6paJTvA6Lr2EfVZK3kehPui9rTaQ=;
 b=cwRNL+hjKYXzgmWB4R0Fr3njz5MgbRohRk9ttObmll0xtYRbDc3NTGYwJpVcZbAyz8
 Ut28WSNJ+wgycdO2049dw5otNrEPalSpfZDDDDCE9bhc53+z1yei7KzHdYuWh/BYeXwC
 fCKI35T9nfw8PE3o5iEOsj6xnR8NNsDuw53ADNOToc7wTLhkiUINsp1VNltpftZQ9cTo
 o3F433vQskPnJWfuA8vUGhe21ClzJ1CxPA9ooqyxZOKKOp/kk42+8Ua1SUMKIFNl0nlj
 4N2FtRxchzGPObvgdTTkeBqMYCyn57cUoglhnyITVmn9XdmW7YW/qXXlgrMveddD7PBI
 SMfQ==
X-Gm-Message-State: AGi0PuYaz19xdMuPmWB1eKWPAxXXVJ6dQ0dbxU3B20Lv/TS7Fuy+ksym
 RJZ0lRThW1b4EPXDopd2r4tlDRzCVFm/mHwAj6Qh6g==
X-Google-Smtp-Source: APiQypLEDms4PTReOqdGombZAhdDnEo4LYbmM2pO5DlLbcG/M356wg9YjiNmj3v+UvrYInVFa878vNDcKaY8/t57vW4=
X-Received: by 2002:a4a:4886:: with SMTP id p128mr18294282ooa.63.1586866963256; 
 Tue, 14 Apr 2020 05:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200411182934.28678-1-peter.maydell@linaro.org>
 <4873c74c-f590-62bf-bd64-dd5ab391c252@redhat.com>
 <CAFEAcA-oRGxEK9xqrU1o88xga-Zn4Xpb5Nr84NhRA=GD2JCoQg@mail.gmail.com>
In-Reply-To: <CAFEAcA-oRGxEK9xqrU1o88xga-Zn4Xpb5Nr84NhRA=GD2JCoQg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Apr 2020 13:22:32 +0100
Message-ID: <CAFEAcA_yGgzO2ivkXDZQkcrx2icYtcr+oZZnPsq9M2fG0RivXA@mail.gmail.com>
Subject: Re: Supported Sphinx Versions (was: Re: [PATCH for-5.0? 0/3] Make
 docs build work with Sphinx 3)
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Apr 2020 at 11:28, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> PS: why 1.6.1 and not 1.6.0? You don't list 1.6.0 in your set of
> things you tested, was it just that you couldn't find it?

Aha, I have just discovered that the Sphinx changelog
explains that 1.6.0 was "=EF=BB=BF=EF=BB=BFnot released (because of package
script error)" so 1.6.1 was the first real version in the
1.6.x series.

thanks
-- PMM

