Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9235F81CE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 03:13:05 +0200 (CEST)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogyOm-0006Dh-IK
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 21:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogyN5-0004sV-Qc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 21:11:19 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogyN4-0002J1-8s
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 21:11:19 -0400
Received: by mail-qt1-x82a.google.com with SMTP id d12so2597810qtp.3
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 18:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LaTQY9Au03o9VD7XLVGYU9vAl3bd1u0k8BTf3Cclk5o=;
 b=VUyBYT/T2iZy3ifMR5RZrzh7foDbN6VPpSaoJ7XnBVzMV6w2PzO7x99nMYeb/lt9ts
 E4PepP8lF5J/EGTd0L+jJ9P6xB99Bw2ITKKFCVdJVi5LXecYP1SmDPa5JuHOL4lADBW3
 Ro5orSXNWzURNd9Ex3uqSBNi1ryY+1khd8tobjfAz66xRGyVCXGdR1+XPq0vYlnZm39j
 IAfhiq9mo8QMHG497AQ0/SbL9jFNYDjyUxOg4NMsxf1zsU4/10zY5yARoBJX6MIIw02s
 UoPeeYSnRjG8JU81ZxmWQQGD9g+8XFDUMejlZgDqA1fjmD7g5BPjZuFWokqBD4YkpheR
 oihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LaTQY9Au03o9VD7XLVGYU9vAl3bd1u0k8BTf3Cclk5o=;
 b=Nd/loWaSJMtPRUBCSCQJy27pxfd6olg/tw0c/VOUsYdqdyGkXESh9ETLitjUoqkMN3
 P0DWBpqRBVozVEpDQiJwigD9G8f9s04Sc8DTtZfrhLlk4UkzOZwV3YMSbhIplIlYWlOd
 koHm7+dSXG46coPMB6a6gfOLFUvAVNmTRPtUdF+gStn60DAZhRTwI4OJTHxVVbgSyFAU
 Da+o3NyWzGbu6VlqSDnmKi5ydc9PJfchuHxX8osEKsBsa6bCAqxRPYMrF1ONBCwzBahZ
 J7zbEba7VxylvRcq8J04f7z0cFyQAHz6MqTTTSeoPx7UqvodSWDWmNHTpmEEw5dBSOAt
 gDGA==
X-Gm-Message-State: ACrzQf0WIkxppvGOQP7RhO+u4osdTTHJXQw98hzi5JnG680RuVbbjAdz
 FsQzn7HJlokOSQf+0vFmsDPmkCkxdQDxVyr2oG4=
X-Google-Smtp-Source: AMsMyM4MN30y+Uxi9iOeV18/gWEtFF5DhQdoTJ0XPUmOv7dUB4oAUNap8tmcWyw2C/S0Mydy6aeLLePLLTUElMS82K4=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr6671955qtc.334.1665191477119; Fri, 07
 Oct 2022 18:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-18-bmeng.cn@gmail.com>
 <CAJ+F1CL4DPuZtL461E1X_L8FySvbH_94iDfEJu2ELk+WU+2E4w@mail.gmail.com>
In-Reply-To: <CAJ+F1CL4DPuZtL461E1X_L8FySvbH_94iDfEJu2ELk+WU+2E4w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 8 Oct 2022 09:11:05 +0800
Message-ID: <CAEUhbmUAcbHhCwx7osgfiAg394gMAOwC2xvmoGhTBdKryA0Hbg@mail.gmail.com>
Subject: Re: [PATCH v5 17/18] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 7, 2022 at 5:57 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Oct 6, 2022 at 8:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using -=
-without-default-devices"
>> changed to compile QEMU with the --without-default-devices switch for
>> the msys2-64bit job, due to the build could not complete within the
>> project timeout (1h), and also mentioned that a bigger timeout was
>> getting ignored on the shared Gitlab-CI Windows runners.
>>
>> However as of today it seems the shared Gitlab-CI Windows runners does
>> honor the job timeout, and the runner has the timeout limit of 2h, so
>> let's increase the timeout to 90 minutes and drop the configure switch
>> "--without-default-devices" to get a larger build coverage.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> Given the discussion in "[PATCH v2 36/39] .gitlab-ci.d/windows.yml: Incre=
ase the timeout to 90 minutes", maybe we should drop this patch for now?
>

Unfortunately there is not a good solution to make the CI complete
within 90 minutes to finish the Windows qTtest CI without
"--without-default-devices"

Regards,
Bin

