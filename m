Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804734D9F51
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:51:49 +0100 (CET)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9Se-0001MW-Ks
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:51:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9NN-0002Vt-6y
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:46:21 -0400
Received: from [2607:f8b0:4864:20::1130] (port=44994
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9NL-0003ek-9x
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:46:20 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so206576567b3.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y7xgcnnemRRgL+tWG/DxaF5emMS7Q4PMoBbqNN3XnEk=;
 b=Sa/SrnFvRRxlK7FdLEsih9w40ClXqtU0xH7Em2ANFlVAXModnx3PO9r5dckWFe+n8m
 Ry+dBCpC0ZgyeVQQRKw69tB95ysVCB3M7u9K8qtzgXXnBcdJM+7efqSo+t9as9tisaIX
 rDQP6M09BjDbHSkcZdang3KZlg2BLP4gJcUa0TUhicIOI7am+lMamdv4plWOlYjwXgoE
 8AeFhUckGLTVSXWTWTM8+suDLVuoIeELRWIm+GqD2VnmAtzlWQjwsq2jbTHKGvd+n9Mi
 scjcCsHWzrqrhJ6vD3+6nDYxoRH6cwn77hUwOcSsQ1AMlrOzfFQFPGQwNz4M5VhLdCvN
 AUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y7xgcnnemRRgL+tWG/DxaF5emMS7Q4PMoBbqNN3XnEk=;
 b=iNfnH9Z8D4EqjzgYjZ/qJfHP/G3chaiOPwm04KTjQfQcKSIZh+Zm/5sNty8uS/lgTj
 yMKTHBCzY+7MInMpRULywe8fWjoFRzILSsw0MXzArf1AL/Pfcd182vtN8i3uMpsmQTry
 sJdV9/jvj9WDoV3+4ohDwWshYTXFNzQTBY3YdlPHN0EMzgY+mmC50liRSJC7jZ3yqCD+
 d4kDMNcHPvc69GpXYxyqI8RLbRj/ydnqyPWTqJ7l79RtSEgJICUzv2V1I1eMMs2x69WU
 ayHgGA/4SFa8V5nKgbXduL7cbqMrhd966JjeSHVhmTbtuukazkxvlb5HqjEnKC6pcTwh
 Ms1g==
X-Gm-Message-State: AOAM532nYe5QyXGAu6NB6/ELPNEnGJlW03K5Z8sdarPjK1rYP4n2APyn
 SaNXnsmikeMIoRfsxL0fc/s/SCUi8dICeKWTvvS4DQ==
X-Google-Smtp-Source: ABdhPJxb4490Ch6LBsXzUS48ul4hTZfEttQg/0B5+laivrWqy0Z6FYbVE0PTepUzTa2bzI4uRtOISRtthA66oyAZceA=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr26014053ywf.469.1647359178265; Tue, 15
 Mar 2022 08:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
 <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
 <YjCzhhCLHzpDoKl0@redhat.com>
In-Reply-To: <YjCzhhCLHzpDoKl0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 15:46:06 +0000
Message-ID: <CAFEAcA9uQ+Z63kmSx04WjN4Um5AhNZ4R9ZfVj9XQgYt0XadAog@mail.gmail.com>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 15:41, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> So if this is a host OS package bug we punt to OS vendor to fix,
> and just apply workaround in our CI ?  eg
>
> $ git diff
> diff --git a/.travis.yml b/.travis.yml
> index c3c8048842..6da4c9f640 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,6 +218,7 @@ jobs:
>          - TEST_CMD=3D"make check check-tcg V=3D1"
>          - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_=
TARGETS},s390x-linux-user"
>          - UNRELIABLE=3Dtrue
> +        - DFLTCC=3D0
>        script:
>          - BUILD_RC=3D0 && make -j${JOBS} || BUILD_RC=3D$?
>          - |
>

Yes, that seems like the best approach. We also need to
adjust the gitlab CI config for the s390-host jobs. (In that
case we control the system being used so if there's a fixed
zlib we could install it, but for the travis stuff we'll probably
need the workaround for some time.)

-- PMM

