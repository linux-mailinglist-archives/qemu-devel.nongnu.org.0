Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4D536898
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 23:38:08 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuhep-0007e3-0S
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 17:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <superbisquit@gmail.com>)
 id 1nuhdI-0006RY-MT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 17:36:32 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <superbisquit@gmail.com>)
 id 1nuhdG-00027p-8x
 for qemu-devel@nongnu.org; Fri, 27 May 2022 17:36:32 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id j7so5407826vsp.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+HHW4vQ8WbYPUuwn6Xw8UZTnYW+9EwkeWSORs8Db9zM=;
 b=lHkULsqJl2q7hWvX/l+XymGPIvgCg6WampVn+inLxceWtmoOEgIh9H7JjojHqWiB+K
 awLJ1ewqk478AyeLxFbYNEg0Tubf5MZA1n7rer7brafOychWKQ6zofpyfDvjUvII501B
 EA32KqxGOfXal8mzxtg84Ns7Q1Z5Eh+cNL+weREe88CiNnX4n0CtlMBEDhMOe3TyySsv
 GcE3an6muV0o+aWXXrTopBOW38qBvzzv0T1NweFXvkselwhEjv4CF88+HSRFoFSydmdd
 D5wU7tlaYjVbmqJFsdelKNKz2NWyK68+jckciYwzLWUsxZPWYOsrmMt/0TO+wtiL/Ugt
 HwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+HHW4vQ8WbYPUuwn6Xw8UZTnYW+9EwkeWSORs8Db9zM=;
 b=TgkL7HmII25tZrZ47pfm79SpvqAtZL9Gl0IIHpAY2lu6LrUdjcW3WVpHiaed/ay2o4
 hW7viSVJDpuCJ87ybRlVryDBCNs+bNcs+6/8ccJuLkXmQZmfzRAJIp5M83n+RCi29TpT
 /9KOY6OB9VQ60rtUXoYqyVBLOhHNDTE5CVW2zzt3eFMe8dmyTPI7KV8Ct2n0NDi39HUb
 qS8a6EbABIfpwoggNzJvlnejKoqp2qaS+teMY6FhAIITpTNO9mPlNC7ZvqENDGRxQt0o
 57gMaXBpr4Y29o4SXlTK6zs9s8/oVWOUzSksGj/srIb4ieEb/J236byF50wVxHgsM1AL
 E0eg==
X-Gm-Message-State: AOAM530SdTI7U5O2mViXM4MO3+WgNrrFgsZ6bfmSt2jidVacjra+nu9V
 iG36gGpojw0y+us2u9kf2+LoOn5sbB8GELFWKvO01CGbDMg=
X-Google-Smtp-Source: ABdhPJxeu7rlHArjUfxwgX6D5h0I8PraTr/JTZRBnmgFP1jAgm9Nsk4sVFkv+lbudrd2RcK5wLHFExD+b8lNVHPY1x0=
X-Received: by 2002:a05:6102:3a0b:b0:335:c75f:54ed with SMTP id
 b11-20020a0561023a0b00b00335c75f54edmr20166386vsu.81.1653687388984; Fri, 27
 May 2022 14:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+WntOtM1J2C1607kWW_n9iTBctgMW26iF5JVYaWy9FSt8qqag@mail.gmail.com>
 <CAFEAcA_i5Q-5OEjoHFk=aKZSOB5cA-6i4acUKAeHo_Yx0qznjw@mail.gmail.com>
 <CA+WntOu0w7kNSMfT-2QDL2vVFKjaKG-pXXNQ2aGHA-p3a0-oZg@mail.gmail.com>
 <CAFEAcA8X5bwb0LrABtqF0VBXQPDwN3xirJZds6n8uzZbuqOL-A@mail.gmail.com>
In-Reply-To: <CAFEAcA8X5bwb0LrABtqF0VBXQPDwN3xirJZds6n8uzZbuqOL-A@mail.gmail.com>
From: Joe Nosay <superbisquit@gmail.com>
Date: Fri, 27 May 2022 17:36:17 -0400
Message-ID: <CA+WntOstQABHiQ_zxFYkwJiS7-uZPWDR9ODGNO+BC_Fh-romcA@mail.gmail.com>
Subject: Re: building e2k qemu errors
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000063da5805e00519ec"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=superbisquit@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063da5805e00519ec
Content-Type: text/plain; charset="UTF-8"

Will do, thanks

On Fri, May 27, 2022 at 1:42 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 27 May 2022 at 16:16, Joe Nosay <superbisquit@gmail.com> wrote:
> >
> > Does the newest qemu source at github include the e2k cpu?
> > And, what is the exact address?
>
> Please keep emails on the mailing list, not on private email.
>
> thanks
> -- PMM
>

--00000000000063da5805e00519ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do, thanks<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, May 27, 2022 at 1:42 PM Peter M=
aydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Fri, 27 May 2022 at 16:16, Joe Nosay &lt;<a href=3D"mailto:superbisq=
uit@gmail.com" target=3D"_blank">superbisquit@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Does the newest qemu source at github include the e2k cpu?<br>
&gt; And, what is the exact address?<br>
<br>
Please keep emails on the mailing list, not on private email.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000063da5805e00519ec--

