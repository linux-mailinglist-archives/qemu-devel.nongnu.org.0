Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD94B4F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:06:37 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJa7o-0000Gz-B9
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJZwZ-0000LB-81
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:54:59 -0500
Received: from [2a00:1450:4864:20::62d] (port=35646
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJZwX-0004jM-JQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:54:58 -0500
Received: by mail-ej1-x62d.google.com with SMTP id qk11so16488233ejb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1KM4shW25H0d6A4dfVMHlVjIamPNSg5NqGTtZDFuqVg=;
 b=U6iBGBRrcl66fdzxqKjqyWKpdvvf9sUGT/tsDXlqd/KzcoQ8kdyGQSoS0M4JvIjXev
 b8r9ZU5vtpuJmONm1H8ONyX+vKj9lASrAjZ5flEKJR77hTeeFi5yAWkj6E6IUU2fHetB
 /AzBzS1nE6jvzDg1YMxzxFNK1cIA3jkrdS6fxFZSaVRQw0yBK6DB99c/DOtp+NHsHLH7
 yqW+Muv+cTHvqVnbGlFsnyHpBlxn5bbk4lTVhUxyNVsXOtdP9h2Pv9vo3g2uhXfA16NK
 skDgPsHOqE+IGMMD5YyIXovqsC5I4vMpXQ5yosDav3lyWP5pMIvV7G81iHtn6yh14E9o
 w27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1KM4shW25H0d6A4dfVMHlVjIamPNSg5NqGTtZDFuqVg=;
 b=wwhn+OL3lRl4HdIuQsZ+QYRCLab0qFJ4X7PEUHvx0O7IOrkgSyXmaxfrFwBE6/U8T7
 b0JhL6at9UTBzL74vmr5Bd1EbJtAjjOLtUZ3tWvFlXhzEGB3usloKwaPKuf3iFkyzVAz
 8vXJTdNUFJ3RAWvs6ScdsyjLXBvTDAtfvR3dliwh/J5I6Fz1Jty+CdesXjHegu2Qgvwc
 +iJXpshKIN5K4y2hpCtr0hsxJULlGVXctg24xPvWRry9tUB+YQ2AjtEPu1TfoI0wAxYE
 3NWXAlYCxzj560PL+6vc3MhiH0eBkTSiu69aPOrNJEBHG6vRihVdjNNm8kBq2xfWrZNi
 OrQQ==
X-Gm-Message-State: AOAM533YAw8kHbYJHRx2B/4PUIe10U8lg8X4UiqiPZ4lAvYGLvadA2ye
 5j5wqNxksq8tLkFyiRe4NmMDGg==
X-Google-Smtp-Source: ABdhPJzEyOlUlB6iOUpPFgqinC9Df6q7rfcPQwvE2VhkPblPuX+C7TKMDYXq2UqBcBsXDfW1EdcT+A==
X-Received: by 2002:a17:906:74c2:: with SMTP id
 z2mr11163377ejl.156.1644839691951; 
 Mon, 14 Feb 2022 03:54:51 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id o3sm10128195edt.67.2022.02.14.03.54.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 03:54:51 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
Date: Mon, 14 Feb 2022 13:54:50 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ilg@livius.net; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 8 Feb 2022, at 21:58, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> I've cc'd some people who might have an opinion on whether this
> something we want to add upstream. ...

Well, given the comments received, it is obvious that we have different =
use cases, and, in my opinion, a one-size-fits-all approach cannot be =
expected to satisfy all of them. :-(


Since QEMU is now a hard dependency in all my projects (for running unit =
tests), I had to commit myself on continuing to maintain the xPack QEMU =
binary distribution used by these tests.

Thus my desire to minimise maintenance during updates, for example by =
keeping as little things as possible in a local fork.


So, if the Linux maintainers do not find a compelling reason for adding =
`--with-branding-prefix` and are concerned that this might break their =
distributions (which it will not, since they will not use this option), =
what would be an acceptable solution to allow more flexibility in the =
main QEMU greeting message? Personally I use only qemu-system-arm and =
qemu-system-riscv, so we are talking only about a change in `vl.c`; I do =
not use the other tools, so not having them updated is not a concern.


Would you agree on a multi step approach, first a minimal patch that =
would solve my use case, then, if there will be others needing it, a =
more elaborate solution?

For example I don't mind having to pass a preprocessor definition to my =
build; so how about something like:


```c
static void version(void)
{
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
    printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
           QEMU_COPYRIGHT "\n");
}
```


This would harm no existing distributions, and would add no maintenance =
efforts for none of you, but would save me some recurrent maintenance =
efforts with each release.


Would this be fine with you?



Regards,

Liviu




