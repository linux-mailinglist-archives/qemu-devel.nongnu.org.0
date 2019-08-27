Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F639EB96
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 16:53:51 +0200 (CEST)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2cr0-0008U3-NO
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 10:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2cpn-0007yM-PQ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2cpm-0000Cy-Jq
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:52:35 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33473)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2cpm-0000CZ-E4
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:52:34 -0400
Received: by mail-ot1-x341.google.com with SMTP id p23so14751998oto.0
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e20eEGGlxiscm15ulS4D+7oWV3ZX/SusM9gwMhMNq24=;
 b=oJyXeFOX49yUIi6ZQu7UfKLc5+27RFgyqgNJfzdpg2hY+r195uV8y/tJs71ACJ7Syw
 j8Yy+O+aZV+ncLkEKQdTymkCNOg2EaTDuMk6Mt9udKUW5RFe7g7zXKvTpcR5bFlh4EDX
 Dt3feaC+BkmNPV4xIEnmHGBsyMFUfuzr/PR6GmDXldTar79bVfiSbKnZ5LZD/xR/YA2T
 d3sR+PlOuvq3cVWpCtrG/qxNi6CD2yUv1c+Ksnj67eJR0RkTrX0W0YjYLDmm3Cu7waAR
 0EsRTyOjnUelzycW2yyR2OF+GVpRwisxcBZDo+3QRDj9sTBwiBVntW+bctFengp1yhRm
 Ttng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e20eEGGlxiscm15ulS4D+7oWV3ZX/SusM9gwMhMNq24=;
 b=OKQ+TH1lqodbjU7CavZeLiCze0ybPOr1Qp+yExlbGwgjRxg3GfhgyxTEA+4ndk2jKn
 OWNuK3urbxw1dhEbU2Kq0ZcO/rXq9HKpIcLHDJOG1Kjc0wlnEFv3PSnYxw1h5gn4NiZj
 xXNMeAxjgDatEnP0nnc7Oiz5Zph2kLausA9IdsbFv7Kz6+qbKZsVYLi+8NRNxS+agaim
 HtyN1WDIbwdBnw9mbb3T+35uWcdQ1SZCtXDClzrGCG9Hin4WUYnQh++j4864D8+T9J4r
 ItnuNHjFjOkrJbBwteIG10oORcraFJ13ARRLOLJl0WotlduiDI3CekxRtfOj80AMBh6H
 MOzA==
X-Gm-Message-State: APjAAAW6BHq2AgurtO1kJqSbxwMmqi5MJHsXy+jexzKs9KCfGs3GcAtG
 7N/6GQZ7Hj0RcqHhiKUB1jTO2+bvUkrZCLZzUlQV4g==
X-Google-Smtp-Source: APXvYqxVUudc4OmFaTYRrIqAXtAcS1Boylip2bgqsZUS3SEQuwQpT3dUxkhM4YnAzmWYtolefa/W2/bwsg33YMb3PAY=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1959912otf.97.1566917553495; 
 Tue, 27 Aug 2019 07:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190827140241.20818-1-marcandre.lureau@redhat.com>
 <20190827140241.20818-2-marcandre.lureau@redhat.com>
 <e3b0333b-848f-62b6-f12a-23b6a83afb0e@redhat.com>
In-Reply-To: <e3b0333b-848f-62b6-f12a-23b6a83afb0e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 15:52:22 +0100
Message-ID: <CAFEAcA_a8xShCR_owqC_QhZU=iGaG_E0fLH8GciTpdk66HRVHw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 2/2] tests: fix modules-test with no
 default machine
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Aug 2019 at 15:46, Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/08/2019 16.02, Marc-Andr=C3=A9 Lureau wrote:
> > Fixes: eb062cfa733 ("tests: add module loading test")
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/modules-test.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/modules-test.c b/tests/modules-test.c
> > index a8118e9042..d1a6ace218 100644
> > --- a/tests/modules-test.c
> > +++ b/tests/modules-test.c
> > @@ -1,12 +1,14 @@
> >  #include "qemu/osdep.h"
> >  #include "libqtest.h"
> >
> > +const char common_args[] =3D "-nodefaults -machine none";
>
> "-nodefaults" likely does not do much with the "none" machine ... OTOH,
> it also does not hurt here.
>
> >  static void test_modules_load(const void *data)
> >  {
> >      QTestState *qts;
> >      const char **args =3D (const char **)data;
> >
> > -    qts =3D qtest_init(NULL);
> > +    qts =3D qtest_init(common_args);
> >      qtest_module_load(qts, args[0], args[1]);
> >      qtest_quit(qts);
> >  }
> >
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> Peter, will you apply this directly as a fix for the travis builds, or
> shall I take it through the qtest tree?

I'm happy to take it directly (assuming patch 1/2 doesn't
have anything too big in it -- it hasn't arrived here yet.)

thanks
-- PMM

