Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39415A6DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 11:46:51 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1pXd-00074e-SZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 05:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j1pWn-0006SA-0F
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j1pWl-0003hP-Md
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:45:56 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36562)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j1pWl-0003fx-FP
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:45:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p17so1659253wma.1
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 02:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NG5Q74p4U0R1gem/m1+/RnE1RYMvid2sFG732VYjE74=;
 b=gDNJCQQkWrHnjJ8LZww14g9RSh8A9t7+QASgv2V8YixHcBb43Ro8WlJnS4t58SNkXD
 IX2W89iChhguo5kLxuLaeQNXYOriRAAWTgxH2WBk5dEM66tKL90TYCQhDkPLL0nIK+uV
 w00/eeIIpIim28DHpNhBnmiL5aYiB/NRC9mvngdBXjZUNC0IxmnSM68Pvosc+tLyty55
 nomEGboVtdQiCH5EexrOb7OT7yDZTMyVBGQitd15mv6kQxR449wRp8fI7EU+rLRawhjD
 sBrnkm95ttOF9Nd7MZCCkBw2RdjuWTpheRB+nSf8HbKqku4Gme8V08lYMjRDPTK0K/iq
 iKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=NG5Q74p4U0R1gem/m1+/RnE1RYMvid2sFG732VYjE74=;
 b=JVeC4F1Y1r6CKhYCYaRa4XjzZZj2Db9kkgNDYdb701wrnN6hAgxm6DI68tgDdZ3Bk7
 Sw585wu0fuQcPqHyzf4BlvDOWPosz3YbpCLmUs5qItxyAgWY3pkDfmHa+yfamFlI+DhH
 m7YOeZnfeTiIotrbrH+MOTDsudBPPPqWpZLlhLyzXXlGVt1d9mjWwwQLyxgVDzZCth21
 fqpC37qp4n/Fy6nnKZ0OE/w79AtV721IqnURQjcK2KQdSkiGdgT5pOUGN1qBrfWxUETj
 AYpwQVOH7qi1pA2ZWOJjukoCpXUBL4ITaqlrWvsZEaGKy/CWV4zFKl1Eabq4BtzsvVYX
 Bs2Q==
X-Gm-Message-State: APjAAAUbukiVAAnBlGBTC2nY9SSqD3lxQYjbwfBei3xSQxgnv5laqRKb
 WBn1GHfIUKFiw4kOIDHOuDO++g==
X-Google-Smtp-Source: APXvYqy0yLwkp+a3KZ35JYrn1qwdmA+m85JxSkAkw1X06yKnhB1Ee2ObcfKdQ6jo2Fo/T2cBrowYfA==
X-Received: by 2002:a1c:ddd6:: with SMTP id
 u205mr12584857wmg.151.1581504353320; 
 Wed, 12 Feb 2020 02:45:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm156731wru.13.2020.02.12.02.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 02:45:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0FCB1FF87;
 Wed, 12 Feb 2020 10:45:50 +0000 (GMT)
References: <20200130213814.334195-1-stefanha@redhat.com>
 <20200130213814.334195-6-stefanha@redhat.com>
 <906a4b84-8f4f-fe12-3357-02d02d5dac7d@linaro.org>
User-agent: mu4e 1.3.8; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 5/5] qemu_set_log_filename: filename argument may be NULL
In-reply-to: <906a4b84-8f4f-fe12-3357-02d02d5dac7d@linaro.org>
Date: Wed, 12 Feb 2020 10:45:50 +0000
Message-ID: <87mu9oxew1.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Salvador Fandino <salvador@qindel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/30/20 1:38 PM, Stefan Hajnoczi wrote:
>> From: Salvador Fandino <salvador@qindel.com>
>>=20
>> NULL is a valid log filename used to indicate we want to use stderr
>> but qemu_set_log_filename (which is called by bsd-user/main.c) was not
>> handling it correctly.
>>=20
>> That also made redundant a couple of NULL checks in calling code which
>> have been removed.
>>=20
>> Signed-off-by: Salvador Fandino <salvador@qindel.com>
>> Message-Id: <20200123193626.19956-1-salvador@qindel.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  trace/control.c |  4 +---
>>  util/log.c      | 28 ++++++++++++++++------------
>>  vl.c            |  5 +----
>>  3 files changed, 18 insertions(+), 19 deletions(-)
>
> This patch has broken -D <filename> for *-linux-user.
> After e144a605a, all logging goes to stderr.

I posted:

  Subject: [PATCH] tracing: only allow -trace to override -D if set
  Date: Tue, 11 Feb 2020 11:10:54 +0000
  Message-Id: <20200211111054.27538-1-alex.bennee@linaro.org>

as a fix which partially reverted this.

>
>> +    if (filename) {
>> +            char *pidstr =3D strstr(filename, "%");
>> +            if (pidstr) {
>
> Also, the indentation is off.
>
>
> r~


--=20
Alex Benn=C3=A9e

