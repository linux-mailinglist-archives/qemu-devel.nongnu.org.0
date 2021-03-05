Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4AD32EC63
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:40:07 +0100 (CET)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAgT-0000cF-Hm
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAeY-0008JO-Ph
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:38:02 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAeV-0006Zz-NQ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:38:02 -0500
Received: by mail-ej1-x630.google.com with SMTP id e19so3516195ejt.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VChA74ZJCn6SU0KhyFg43TE9aejq+/Oro//tYKvt2d0=;
 b=fLX2jJy9oS3COcxWtBGxlG5ZEPAHXlr/Fp3yIZLOiBmhcWa+typkiCcNlbj6zeZbYD
 oJMlOqqR0XFNmxrS8WSt11MdT3cqjEhRGOz5ClbbFdQEBB2+HEOc1yX0JLXyGEf8UlEN
 riVxARLkn8w4oHGbyLw00KeAvj0XqfiJEf4aJq0iS3tcH2K0kQglIY2zzGNdHU5nwzkR
 ou6FGyvG5KfC0eWcH6GVKtBZD4S+XWkfc7WWj3QSjsnWCtnfE6LipD110efWZUFqJXpe
 oG+4dlY5RtTBgy0lIrX4OAJG5b1Lr+QgHRtzNspx2F1W/s1vYELPY161Fe7BrSOcEca7
 +sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VChA74ZJCn6SU0KhyFg43TE9aejq+/Oro//tYKvt2d0=;
 b=c/UO9GUiFsQrvjc2i8VfvlW7GRBTSKMdweprzOwD7nwnqkv5xGyz2XDYhOrgMtlwyi
 HFw8frsjE0bmOYZuFym7e5Xa/W3G2+yzFmKfJWzVGInzcBb1nz1lJuIKv/zKHSHZvjEk
 bmh3BgpJk6QIcpKIvR/2RYT28dZvBJzxs2mXmiGLVrhpxgpIrUgUcqoy7124w3UOxXKX
 +3hov76FAq9a2k06aPkimv1INyBA4UbggqySksx8RPFeqzArq9G/ufe9gdT33L9p3q/s
 Sn7qKKM/RLafid1caYN3zwpoOWxn2Im/HiqoKdCvL83A11DZIIH3IwV4e092VfvKj3KX
 xwhQ==
X-Gm-Message-State: AOAM533OLDtmtSMkHF+T6wXJ62pkiJEwt431Nj5Z0PNwmdd18PaZoe5/
 speSyO2EIJZr4WkCPOT0Y8IbrQ==
X-Google-Smtp-Source: ABdhPJyvWra9NIJ1sumEOJCeKjFOFx7R8mBN0ncv3ZLyqZ4pBYhySnvU4FRtlBBQ7ZECZDIRMIk5PA==
X-Received: by 2002:a17:906:3552:: with SMTP id
 s18mr2276085eja.497.1614951476953; 
 Fri, 05 Mar 2021 05:37:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gr16sm1596066ejb.44.2021.03.05.05.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 05:37:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39C6E1FF7E;
 Fri,  5 Mar 2021 13:37:55 +0000 (GMT)
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-2-alex.bennee@linaro.org>
 <38b39e61-b4b9-e60a-c5d9-d80b7618ba72@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 1/9] docs/devel: re-organise the developers guide
 into sections
Date: Fri, 05 Mar 2021 13:37:38 +0000
In-reply-to: <38b39e61-b4b9-e60a-c5d9-d80b7618ba72@amsat.org>
Message-ID: <87h7lpg1qk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 3/5/21 10:23 AM, Alex Benn=C3=A9e wrote:
>> The list of sub-sections was getting a bit long and sporadically
>> organised. Let's try and impose some order on this hairball of
>> documentation.
>>=20
>> [AJB: RFC because I wonder if we should make a more concerted effort
>> to move bits of the wiki into a canonical maintained document. There
>> is also probably a need for a quickbuild or tldr section of the
>> build-system for users who just want to build something.]
>>=20
>> Based-on: 20210223095931.16908-1-alex.bennee@linaro.org
>
> ^ IMO this hint for git bots should be removed from git history.

I'll add a check for that in my patch scripts.

>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/devel/index.rst                 | 32 ++++++----------------------
>>  docs/devel/multi-thread-tcg.rst      |  5 +++--
>>  docs/devel/section-apis.rst          | 16 ++++++++++++++
>>  docs/devel/section-building.rst      | 13 +++++++++++
>>  docs/devel/section-concepts.rst      | 21 ++++++++++++++++++
>>  docs/devel/section-process.rst       | 11 ++++++++++
>>  docs/devel/section-tcg-emulation.rst | 19 +++++++++++++++++
>>  docs/devel/section-testing.rst       | 20 +++++++++++++++++
>>  docs/devel/tcg-icount.rst            |  6 +++---
>>  docs/devel/testing.rst               |  6 +++---
>>  10 files changed, 115 insertions(+), 34 deletions(-)
>>  create mode 100644 docs/devel/section-apis.rst
>>  create mode 100644 docs/devel/section-building.rst
>>  create mode 100644 docs/devel/section-concepts.rst
>>  create mode 100644 docs/devel/section-process.rst
>>  create mode 100644 docs/devel/section-tcg-emulation.rst
>>  create mode 100644 docs/devel/section-testing.rst


--=20
Alex Benn=C3=A9e

