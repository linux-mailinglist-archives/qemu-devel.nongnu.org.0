Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C94A62E9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:48:34 +0100 (CET)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExGb-0007cb-35
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEvbW-0001n4-Hp
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEvbU-0003Q2-IO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643731318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ec2cGKzwPDgJ95xXCUatow9ne0HB995uNwaV4LzKg+Q=;
 b=flx179d6AYth3qry1kOMM8X2R5SsYHBiokauaGlggeltO9zaB0zfKY7DZ+xT2iiF8dneZ5
 kgjbC+Y4SyC2w0M9yMnBA3Kaq5h3iFiqkGm7dvxmN87WiHztm1+q3s9n9jOi4mXKyKeODC
 OD0dzc16UyKzp0rMU9xw4qtPmwCXUI0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-CPTW6E6NNiOe4Fbdfi7xYQ-1; Tue, 01 Feb 2022 11:01:57 -0500
X-MC-Unique: CPTW6E6NNiOe4Fbdfi7xYQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 d185-20020a1fe6c2000000b0031e50f180f9so2729501vkh.19
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ec2cGKzwPDgJ95xXCUatow9ne0HB995uNwaV4LzKg+Q=;
 b=eY821dm7bT9USS63hOERhoKw12kMJKWBGeb9Q72Va5ntvtNbK1+Hm7x69QTPLJaw27
 vyKkFuRsdP61uG5/COkBkvkVIwg/HzM5dbFnSOzAuYXLnbCEza17vwgFCSFd7nVtuyP0
 wepWdSlA5o4EB28zAxwYm0kiH17DLkkCC0yYGc3haAhJWYpeU1UHr6VVY76Ejjqtweqk
 O+3QIhHnv3kd7f+tLYBWuKZF+TLpzzdykM8zDC3If0kpDbSTe+Fqw6hZx+1HeXZZ8dVo
 WdfdrvFYv4wgkj/WCSZNUZK+ujws5W7SsXES6IwADf1eW/phqF67+sppGykcwlr9jr5M
 w8KQ==
X-Gm-Message-State: AOAM53242IozTKnfHHb0ysjBr8Wk073mkJlebE8BpdnNd0oM56weRL0F
 sFte9q+BDb5JWqUgnj1/TZlgEGUnwPOpVallHNjfYPGp9FJ4842XduV53flXung0kLHQYoZTQEk
 jvYfU5FbDkCWsZhMdyRztWuB2e8j+oSQ=
X-Received: by 2002:a05:6122:883:: with SMTP id
 3mr10814849vkf.38.1643731315066; 
 Tue, 01 Feb 2022 08:01:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWXvHVAKsuhby5yaYdf0NTcPVqKCpVe3jvPJmrMcD2DuETtsOG7k2LyQ0C68689JmtDCEMcXZEkPj7vrGVelc=
X-Received: by 2002:a05:6122:883:: with SMTP id
 3mr10814731vkf.38.1643731314305; 
 Tue, 01 Feb 2022 08:01:54 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
In-Reply-To: <87wnieygjp.fsf@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 11:01:43 -0500
Message-ID: <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 6:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We have up to now tried really hard as a project to avoid building and
> hosting our own binaries to avoid theoretical* GPL compliance issues.
> This is why we've ended up relying so much on distros to build and host
> binaries we can use. Most QEMU developers have their own personal zoo of
> kernels and userspaces which they use for testing. I use custom kernels
> with a buildroot user space in initramfs for example. We even use the
> qemu advent calendar for a number of our avocado tests but we basically
> push responsibility for GPL compliance to the individual developers in
> that case.
>
> *theoretical in so far I suspect most people would be happy with a
> reference to an upstream repo/commit and .config even if that is not to
> the letter of the "offer of source code" required for true compliance.
>

Yes, it'd be fine (great, really!) if a lightweight distro (or
kernels/initrd) were to
be maintained and identified as an "official" QEMU pick.  Putting the binar=
ies
in the source tree though, brings all sorts of compliance issues.

The downloading of the images at test "setup time" is still a better approa=
ch,
given that tests will simply skip if the download is not possible.

- Cleber.


