Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F24D9FEE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:23:27 +0100 (CET)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9xG-00085m-Ar
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:23:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9ve-0006qE-O4
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:21:46 -0400
Received: from [2607:f8b0:4864:20::b36] (port=37768
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9vc-0000hR-HE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:21:46 -0400
Received: by mail-yb1-xb36.google.com with SMTP id m67so4921184ybm.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZmWGquUbwVc/lV00yY1WFb34A8MkNVhRe64Lts/5YKI=;
 b=LwQfg0nm/mHQZLf7G2vmAdXqaKudN5BqNwgZhR7LCK6pNj1jXpRD2UiVm6GPfYcBT6
 rrourjviPfPECmQqZKg47EYG2d7Vkr6L1J0o66C5NxmMfywWxmmq9DcKaZsuinbU+Sx0
 INrerll8VAh3TxQJBA7ZdXQ9IVZ2sojTPtEUqkczI/+W9nzNtmQMH2TX6iHlbBI6EKo7
 4mt8X2Q4EmdRTxlDkR0PuY9G5MMiImWhZ1ZelkQyBZw5icJoTW8+g3FaXVCSceX8870s
 mLAxBBy2mZBM0sq/xsMilFEmGagw4Ud5ZehE87IvhozPgId6wrKvqr7+aG9qHgmEJQKo
 2+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmWGquUbwVc/lV00yY1WFb34A8MkNVhRe64Lts/5YKI=;
 b=sFTg5jBztpUxmV+HWxH3MUWIllI1SHmDTKMztFZW5i5Z3PMkSjIhW7SbvQbvPn86fl
 z/pm3Zsub2++f3AfErNqLQjS0b4xk9UCjvBeuyrEKrFflEXOJYLu6zxc+QQ/ximvTB7K
 1KYioT2+Ti101qH2AsSpbLtyL/l1LsfD/JXUU+GnOzJSSGGuw65KZwx0/OgloYd+75Hc
 ZIYIidksTSsrwNukUAMbfnm+TTYs0ExXIlKo7eZJjYomOASyTOA7MTvs4x2eHOpmJLQa
 uTsADZwWlpbPL3NM8Oc08+w4sU6ddZk/eGsOY4AyxWxnK0ATKTz+R3CEB/jC9Bj4JOSV
 ptnw==
X-Gm-Message-State: AOAM5335ekxwTfvaG/SXO84DivHThPnj7hJUlAhxCPQfBnE9bpsTeVcr
 PIJMCBCrXwlI65RVOu0UOxFuKO5bEMMhno1TRjMPhQ==
X-Google-Smtp-Source: ABdhPJyAkmBYKdYgY8TXobTZwC6olOyZz/U+zxzE4u5lLqvA0aW+s5KU2hRWjMafiDG9fFSV/3WLLx8hrRis8hQDvuA=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr3795851ybt.193.1647361303331; Tue, 15
 Mar 2022 09:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
 <YjC7fLmIvB+o95nA@work-vm>
In-Reply-To: <YjC7fLmIvB+o95nA@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 16:21:32 +0000
Message-ID: <CAFEAcA83G2F4MHhO96Te5=-iJa3pvvczX24J-tSqRkPtdrD5VQ@mail.gmail.com>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 16:15, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> The initial description of compressBound being wrong doesn't
> feel like it would cause that; it claims it would trigger an error
> (I'm not sure how good we are at spotting that!); but then later
> in the description it says:
>
> 'Mistakes in dfltcc_free_window OF and especially DEFLATE_BOUND_COMPLEN,
>   (incl. the bit definitions), may cause various and unforseen defects'
>
> Certainly looks like a 'various and unforseen defect'.

Mmm. I couldn't get the testcase in that bug to fail on the machine
I see the migration-test fails on, so it presumably is a different bug
(or just faintly possibly a QEMU bug that's only tickled by the
specifics of the accelerated zlib behaviour).

-- PMM

