Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB4458FCF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:55:28 +0100 (CET)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9n5-0003b8-CU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:55:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9lI-0002qO-TS
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:53:37 -0500
Received: from [2a00:1450:4864:20::32d] (port=34644
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9lF-0004af-Ny
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:53:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so3347364wmb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXLue/Az7JqLzh01PP+RyjN3CfdOFmd0T6AHdlwVETw=;
 b=snb4Hl3bCGTNxCimSs6EZdeylWNH38L40O/AYSe4OmQcWkFatVPh37lS7qur0B9pPu
 RximtX8vCwzz5F3m7GEAw871/7xI971FGDfu1jy21xKRXff3+/5vulJDib0JP18Vaquk
 ZxpmU/uubB2giyVUFzOqH0gv+8VsOGaAT7V8IkrUxbau97wL+t4iOBFARadwKsyfN7GV
 8JAO4LiXYmagbMQ6ihEKzicGwnQXl+0KBDxdv3aPZNWOeXNLL54MDJXimEg28v0e5LZh
 XzZL4ZFipg2tg7eYixQs1y24jWRNupNExF7VhqfucM1QLb4zF8nVDIrX643LH/ALoLwr
 IoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXLue/Az7JqLzh01PP+RyjN3CfdOFmd0T6AHdlwVETw=;
 b=LoL7HzuPqZ5YR1Cb8Numic7u3UZqrNc1O59q28aEgGPuU1dINOMyrQbSwC6O3LRPKr
 yIlt0CRERhpPwgGW7SrxTR0zXAsuj2fOOnPD92XE4xBLttW+6WYEr8DPqZ5QtpG9tgac
 Njxj9hqrp6L92O40uD3NfhTyFp6N2kzQmU8ISIFikCwHSaqhxRTdNsAlqsHWXed0QpRk
 MR5nQiVOfW21CsgJc7F9A1eCeraGVoeNfHNpZB8GKdvjgqcZbOVXa4OcHUCgLHyTP0A3
 MPsV0lBdwi+BNU4XowiGjUwuPpEVJgA5sQ27BFv3I5QE7DxzZHPzSsXvlnt7GlzsMlxi
 svjg==
X-Gm-Message-State: AOAM530KTT2NnfPkUMfjnPvtGbhs/Cazcij56kqg3ooKnm9UjVNWBF8z
 tTYWdsOkp2ftg8vPZ4QxvYHUiI7cIaSwTMUIui41MA==
X-Google-Smtp-Source: ABdhPJwwlDnMYZhikdGK+lPNDxlglSViqO5J24qzEAhUD/iS2NLqLO2WrLTQSA1OP2fOrwTGGbj81nojH9PKom3UQNU=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr30183348wmg.37.1637589210512; 
 Mon, 22 Nov 2021 05:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
 <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
In-Reply-To: <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 13:53:19 +0000
Message-ID: <CAFEAcA-+38PB3aOypgbAmeJN-X3P2gzB5K+CTAveXdt7jmF3mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/11/2021 14.25, Peter Maydell wrote:
> > On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
> >> What about simply replacing it with a new sentence below the bullet list,
> >> saying:
> >>
> >> "Please also use a spell checker like `codespell
> >> https://github.com/codespell-project/codespell` with your patches"
> >
> > How many regular contributors actually do that?
>
> Considering the typos that we have in the code, not enough ;-)
>
> Anyway, it's just a polite recommendation here, not a must-do, so mentioning
> codespell here doesn't really hurt, does it?

I don't think we should be recommending to new contributors that
they do things that established contributors generally do not do.
The document has enough "things you should do or think about" already.
My preference would be for simply not mentioning spelling-checking.

(If we do want to come up with some process for dealing with
spelling issues in the codebase, then we either need to put it
into CI so it's run automatically, or we need to have something
that works on the individual patch level.)

-- PMM

