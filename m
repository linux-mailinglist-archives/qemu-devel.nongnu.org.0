Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E16922B7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:55:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVj7-0000f9-GX; Fri, 10 Feb 2023 10:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVj3-0000ef-CZ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:54:13 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVj1-0008FW-La
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:54:13 -0500
Received: by mail-pf1-x435.google.com with SMTP id s20so3745335pfe.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676044450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0nDHn2k0XZgqgliNfxyN9EGssbq+GBBMLySNrVwQK8=;
 b=YfxoiGBD0AtwvINTLCfJT+lgUaIup5OarM+yRTb6kt1fMyi9WYlNH3YA20AePuc8gW
 FgLPfyEPOp6MlgdmsrujPqaVNIHSpVD5qx5u3of0z+HxfiwOyXbYGncr2f8Wwx+VhL7r
 hjNIMu02k8QQrC87saLCLXjIi+KJY2vV+aMnS5FXSPCedbinpyDxKAvir5JXGw/ynZqf
 QDVtBEZ0qB39gcmZWXtnw6MO3+mTuTs9q1nzYgD7CuFmMQpDUMXkym9aAdVCKdMvFkZD
 geDR6+XfIk/4k/eHbw3NoKz/fYqh8gPAxrV4mOT7GKSlDB8DUoxFFQLDRtKh5+XQnd6E
 iU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676044450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0nDHn2k0XZgqgliNfxyN9EGssbq+GBBMLySNrVwQK8=;
 b=qhVz1NcdkC4fmcC44Z0jVDqMpc2jy1OfuYilKySB9iRSo7hLASMAIc2zwo5JvDHZAs
 zwOWS21QqKhHDuohqr7uWTru9YYGWWJU29M+6+3NRC73Uz4SySmuh61aDneqqnRyCHUT
 aHzj3HLrDLDoXNWroEKDrG8baPbVBQV4O/4usKWKM0y9QD+fkQTBnVtXsjuHydhhelOy
 X34PQ1GTAjFResxtzqs/Ksag5cSjIt22KhQJZ140Y8POa9zM17HE1jm/cWlOy46gEiI/
 WbWK3Fu9wF/oeUBH0wf1uVxUkf/JDvljKVAggoYTDW/orpTVCu1bKe+nzA3/piRzlBas
 5MCw==
X-Gm-Message-State: AO0yUKW23T1zIfj6Co3PwbNuobVrFyVBT+VE7FrqJQPPVlDbcp1PbPEC
 xVz6iW+0MbVvEg8c/wvyX9cu5zQFj0bDee2RcpU1dg==
X-Google-Smtp-Source: AK7set+6TvcTG+5zhekLpyDgPDbrGG5jaosjzZA29X4xZkIEZ6c6oReYMoyrYpTjv9fuCo99mSegwdAWejy29/+7M0M=
X-Received: by 2002:a62:484:0:b0:5a8:447c:b45d with SMTP id
 126-20020a620484000000b005a8447cb45dmr2322015pfe.23.1676044450031; Fri, 10
 Feb 2023 07:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
 <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
In-Reply-To: <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 15:53:58 +0000
Message-ID: <CAFEAcA-tL90w6-saYVTwAVB32p1rbQ5K6UFxzGz75POYy32ieA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
To: John Snow <jsnow@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Feb 2023 at 15:28, John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Fri, Feb 10, 2023, 5:46 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 2/10/23 01:31, John Snow wrote:
>> > +for binary in "${PYTHON-python3}" python python3.{11..6}
>>
>> This is not available in e.g. dash, so we need to use {11,10,9,8,7,6}.
>> Just a nit, I can fix it myself.
>
>
> What platforms use dash by default?

Ubuntu and Debian default to /bin/sh being dash. The BSDs will
also have some non-bash /bin/sh I expect.

shellcheck will catch this non-portability:

$ cat /tmp/foo.sh
#!/bin/sh

echo {11..6}
$ shellcheck /tmp/foo.sh

In /tmp/foo.sh line 3:
echo {11..6}
     ^-----^ SC3009 (warning): In POSIX sh, brace expansion is undefined.

For more information:
  https://www.shellcheck.net/wiki/SC3009 -- In POSIX sh, brace expansion is u...


though if you try it on configure right now there are a ton
of unaddressed warnings (some of which are harmless and some
of which are probably technically portability bugs) so it's
a bit tricky to use to sanity-check new changes.

thanks
-- PMM

