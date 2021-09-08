Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85833403D8D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:24:09 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Mq-0003Bm-Iu
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mO0Ll-0001sE-Q4
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:23:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mO0Lk-0006ED-7n
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:23:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2079512wmb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uyCEqiZpFPbhNhLUHk+jlAm0SG8m8+ljOTRADMgnNIs=;
 b=HnHtfQG5BNpDiDQ9TdlrcbueXohaFMNdHoEIte5tzTEboRsFO3ua4K53pqAZSiLHnj
 9/CgnY0h4YmMSlMBxmkhjWXN2axyNNqckYFDpLC7C0LBXi/s51AZeCOSLOzD0aaxxsHd
 ZREXyk79UBhqfyhUxtFfuqlpxcEIhT3Oy7wmZpTJbua0EmgqOiU7emo40srG3B/wcaL4
 tCHZTdwjkGN2WLN09XooRZdqQ2f+3Gc78MHFsn2Uj11KTEIDWvxNEiugceIbf0jf+6pL
 kJbDsma6hYjvlcYe5CDFM+M7Z5HK1u+wYuynqqc0LF7614ve9aMiCN9KM2g7aDFhNhTM
 vNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uyCEqiZpFPbhNhLUHk+jlAm0SG8m8+ljOTRADMgnNIs=;
 b=pAXZM8p3wd5BP7yB53kSi5F2qgn+Zw8rUafPkBhHJehX4V1yQGb48rIwgZPGDk2gRn
 CSCgE0oOeXZvGsGuFnAouJAZApe2JHtJ6oSBIVz2auDZhI79yLpsPST80H06GdOfd7A9
 mLhABSJ1ojFoEmk5e2NIA6o3wx+4EKTp0BOKNnmBJhaU+R4DMQE7wBI1AyCmMO4ajbkG
 YeBRYgC24Uy94cRnTdyUQZnIo5wo/GVGl/JK1s0zaeMN4eb0HawHVdd8zovB1fVMU6zl
 EMqOzwO6AZdTAo3oxmiKVuQMN7toczDg2w0wGXPgMajtV75quG4CbyqPae7iRJrHvsyn
 0maQ==
X-Gm-Message-State: AOAM531lFjkt/E4rgQFbRPPh6djzKeKtNw7zWGtgpgQQfmhroW65ZtZW
 hjtVXQYK8WpCHk/ZQ0v7egDkcOS+RQPvF2F9wT780A==
X-Google-Smtp-Source: ABdhPJxSiYgJorncs8Wm86XAcx4l02tY6OKCb/Rul2P0lHjmRGxM2keZLa52HVmxVKw/lkmbXr028yji2UurixWJw6Y=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr4491564wmj.37.1631118177458;
 Wed, 08 Sep 2021 09:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
 <24888.56575.675507.669862@mariner.uk.xensource.com>
 <CAJ+F1CJ4bhzXd0ASrtcGzn63i04HMWHDbgoAoWqizKnhRqiWjw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJ4bhzXd0ASrtcGzn63i04HMWHDbgoAoWqizKnhRqiWjw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Sep 2021 17:22:07 +0100
Message-ID: <CAFEAcA_oTZ0YZtdcV_kdWqnqabZA1bTwPyiSK19=-7UdLnK2=A@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Ian Jackson <iwj@xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 17:17, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Sep 8, 2021 at 7:55 PM Ian Jackson <iwj@xenproject.org> wrote:
>>
>> Marc-Andr=C3=A9 Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-so=
urces"):
>> > Hmm, I do "cargo vendor --versioned-dirs ../rust/vendored" to vendor c=
rates.
>> >
>> > It seems cc was updated, and I didn't update the submodule accordingly=
. For
>> > reference, this is the dependency tree that WFM:
>>
>> git submodules are just awful IMO.
>
>
> Yes, but it's often (always?) the user fault.

I tend to agree with Ian -- submodules are badly designed, and
have lots of sharp edges that it's easy to cut yourself on.
Yes, you can say "well, the user should have held it by the other handle
because that one isn't fitted with the spring-loaded razorblades", but I
would argue that fault is better placed at the door of the designer in
that kind of situation...

-- PMM

