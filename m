Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6764EDCE9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:32:45 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwmy-0000Q1-5w
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:32:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZwVW-00049t-L3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:14:42 -0400
Received: from [2607:f8b0:4864:20::1132] (port=36125
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZwVU-0002Cl-Va
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:14:42 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e64a6b20eeso1988717b3.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEoFDYnOjy8aJZngZxyz7cnB9yIX8Lh9txgFB4k3ymQ=;
 b=BAozc2S0HvOnFHGKbLj0Ge100HhXAHh8PpGehzlKB6A72yvVrds8d9TqHYN+moWHFH
 HF9/NERpiZ0YOdKY1V8b8zvT+bkOCHiouN2VehPA44x9XFwQAdWo4Gn068oMMGqtGm6v
 9QEjzrNhxwO+IG0RVav/MaGbn6v78Qw4bWuYgz/cVifnjbpl2tQphzFIps1T8l025NIW
 VPdbMvOc+63qfWYZ+jAGxyBJorbHhe3PT2asYjDIdHNhCC+EA2Hd2QaLw6nTzp7liDGz
 LdhEdI/y9LgSiyqbbYdLxAqsgkt3dRSoECvv3eC08GDr8IonmBUTTvAYh55oic+k0WYL
 GwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEoFDYnOjy8aJZngZxyz7cnB9yIX8Lh9txgFB4k3ymQ=;
 b=WTAPXQ0biQtV1HuRuOg1a2cg48XtCYuJBcMlBqedyse83vPN6XBRkZafN+SczHg0gW
 S8psrbVDcFLl8ejdRmMjjDvf55e2lJwc5w9pA3ps5bUEYPuqrmuE8irrsgWNJc0tkha3
 bg4KRrHRy1H2ZitcHZEwO4vh7HkXNKSp5ju+VrUwNh83M+6Sr83QtiVrHvfrqs3pP5vp
 Uiji7iZypX05Zh8yJORnfyQ5SLvndS9/So/udsU5r1yPlqK/cyj+kFk99Vd5YaM9q/wn
 8wiAjEjqFthoW2rjmwhxO3Kl9t4SQKJSpUS/tOs3z63jdHIEzvnPdM5QxAEFvhi5a9DM
 ROQw==
X-Gm-Message-State: AOAM532aQIokDL8b24B2XbT9kBPpXOfRQ5EfjJd3POpl5KnwMTCWuOot
 wY4Y1Jh4aUyyMpG81g08TZfnd8qpeNDaDawBsbxdVA==
X-Google-Smtp-Source: ABdhPJw+EqwSYPDKgvFQDL5fBpSulBb8ltgGjKQyRmRPcEr8/HZovtrElNfNJqd8hxupFjd/115ZGZIz0dj7Cg5oQuc=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr5139479ywk.455.1648739680011; Thu, 31
 Mar 2022 08:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220331105344.3471295-1-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 16:14:28 +0100
Message-ID: <CAFEAcA8n_BV=u8GS9=QYrxB-wcvqYL1s6ABG5cCava+-VSqq1g@mail.gmail.com>
Subject: Re: [PULL 00/15] QAPI patches patches for 2022-03-31
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 11:54, Markus Armbruster <armbru@redhat.com> wrote:
>
> I double-checked these patches affect *only* generated documentation.
> Safe enough for 7.0, I think.  But I'm quite content to hold on to
> them until after the release, if that's preferred.
>
> The following changes since commit aea6e471085f39ada1ccd637043c3ee3dfd88750:
>
>   Update version for v7.0.0-rc2 release (2022-03-29 23:32:18 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-03-31
>
> for you to fetch changes up to 4375cf9868fbb7abcaae119ac993b13f72dfe8f2:
>
>   qapi: fix example of dump-guest-memory (2022-03-31 12:35:59 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-03-31
>

Docs-only changes seem fine to me at this point.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

