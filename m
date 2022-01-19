Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931F493F6E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:56:10 +0100 (CET)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFBp-0004jk-LL
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAF1b-000561-Iq
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:45:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAF1X-00016P-Pw
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642614319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uurtoFP4wmVV+28RZXTPo6gsr6GPowevWK+MxmWQvFw=;
 b=Q3u/iqUVvapPMBHypTN97ZVfYVBZCFf/lV4oV0HBouX+jlV78pN9tQYb9K+/zSjEOnqiJA
 V4yqBJXJUCHm58/oBV+wzqI208LPFOsXde4DuXaljUGUM+kUsJr7ex9JS6jyN38opclaLe
 Bf22UobCpu4soc6hW8Zn0IDauzupHLc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-t7VOLUb2MYG5t6STl1YIrg-1; Wed, 19 Jan 2022 12:45:18 -0500
X-MC-Unique: t7VOLUb2MYG5t6STl1YIrg-1
Received: by mail-yb1-f199.google.com with SMTP id
 x9-20020a25ce09000000b00612eb11922aso6063976ybe.9
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uurtoFP4wmVV+28RZXTPo6gsr6GPowevWK+MxmWQvFw=;
 b=TTE/Fo1v4drs8x0YEKAfgQKRHHj6zr4ys/9rS3mNzgZYmckDhwJmj12DpC2/a0jJLU
 J6tH5y/xWpoxeTytl3nbWa8QS1kfcHnEvL8ISV6YZ4r69WAfbhl5iQ6oO7jH8gHSCYpw
 7QABB/SNXQaC/22leieI8+BMWr2eEmTlYK1kbGVJ8yjv+/FiZunbbusbR/jEPHSvqDut
 Cm9tm5mOYb6Uh2DbsInlZf+RSVwS+Vy5+1HlIuPzbdCKHT4h+avUBkpvjpt/ljOyZxeh
 zuR3LgomTkkRyMaz6u8vg7d9F5Zyu7W7SMdeKfcSqabuqRUzi3cV/JfgB3+PFdPkGjNo
 qmgA==
X-Gm-Message-State: AOAM531O2eNF9RDlmtc2onwd1RPdmBMgL8ALMS2wnjht8jzKg68qlDpo
 MtsatZdyZ8cBgiBQee/NIh/KUivCtAJkUHpxzza5hx5bmYYOgKBg8fn3eAH7gOBqEqNR6vo6lBN
 Dth4f/gPlYBEpWeyYRPcRjaS8FSAj21g=
X-Received: by 2002:a25:d313:: with SMTP id e19mr1470058ybf.234.1642614317748; 
 Wed, 19 Jan 2022 09:45:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFRRo2a16o/9yY+d2rQX/17sAJpFgRe6kZp5UlfXJlM3Qlk9G/S3rgxc0HBL552qrG8faTHQyCDJ2HXVZhhdQ=
X-Received: by 2002:a25:d313:: with SMTP id e19mr1470028ybf.234.1642614317555; 
 Wed, 19 Jan 2022 09:45:17 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Jan 2022 09:45:17 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20220119171800.491703-1-abologna@redhat.com>
 <YehMnmZp3z+Cr0Od@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YehMnmZp3z+Cr0Od@redhat.com>
Date: Wed, 19 Jan 2022 09:45:17 -0800
Message-ID: <CABJz62NE5M4gXtbLgxHrLduAFx6yNVBsDYhTb3aUMQ471jR3yQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] meson: Don't pass 'method' to dependency()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 05:38:38PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jan 19, 2022 at 06:17:57PM +0100, Andrea Bolognani wrote:
> > See [1] for recent discussion about libgcrypt specifically, which the
> > first patch is about.
> >
> > After writing that one, I realized that there is no point in
> > explicitly passing 'method' to dependency() because Meson will do the
> > right thing by default - hence the next two patches.
>
> This whole series is effectively reverting
>
>   commit 1a94933fcc3d641bda9988244cde61769baae2e5
>   Author: Paolo Bonzini <pbonzini@redhat.com>
>   Date:   Mon Aug 31 06:27:00 2020 -0400
>
>     meson: use pkg-config method to find dependencies
>
>     We do not need to ask cmake for the dependencies, so just use the
>     pkg-config mechanism.  Keep "auto" for SDL so that it tries using
>     sdl-config too.
>
>     The documentation is adjusted to use SDL2_image as the example,
>     rather than SDL which does not use the "pkg-config" method.
>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> which IIRC was done to get rid of mesons' confusing/misleading
> attempts to probe for things via cmake when the pkg-config file
> is not present.

I guess I stand corrected on Meson doing the right thing by default
then :)

The first patch should still makes sense though: libgcrypt is like
SDL in that Meson implements special handling for it, and we should
allow the pkg-config file to be used if available.

--=20
Andrea Bolognani / Red Hat / Virtualization


