Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764C3BBEDD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:27:41 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QVX-0002wl-IR
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QUM-000277-Nv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QUF-0007HX-JW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625498778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHiT2/NFL43Lwxp5UCNen9cf4BmGftGqTmO51Jrb+c4=;
 b=CGeZ8jU0AtGwFK1LtK1phKP68HIpT1mof9Wtg2Xj4nmtiglUBAnc06ZHpQxAiFtpiVJ6Od
 sFwdpQf8/aq9cd93CGiGWX9bflkm2isFHOElOB2GIhAagMTwZ56JPKCVyhPXq6VWFJgb1W
 bffUJaNUZG/TPFd5vB1KnAABT44+a7o=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-uS2yrW4nN8WEkeIfq_ZLLg-1; Mon, 05 Jul 2021 11:26:15 -0400
X-MC-Unique: uS2yrW4nN8WEkeIfq_ZLLg-1
Received: by mail-ua1-f69.google.com with SMTP id
 w11-20020ab035eb0000b029029467c865a1so6363328uau.14
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uHiT2/NFL43Lwxp5UCNen9cf4BmGftGqTmO51Jrb+c4=;
 b=KVf4kBRMv4uuRf9W7/kktuethBHx39HefR+cDnsKTeZSn1AvOhhz9VrkUWjBrS4B4A
 SarhkGzvBECJdKec/xAs6z39xRSBF3tGj1uSyM+P9+I4Jl8RLVPB2oiA+TyGm/f/FbNM
 8tl9fu3Kqo7uxqnCSm8jPWUZ+cCa4naNAaJpEdjvoYkjqTN7DJjGtQbgv6s2X3UWvYAb
 4QlrsN9ulPM7oaeE+a3brRTWPV6giifxn1vXEaivrrHko1oSipoz/dOSafcT73lzHEVf
 /z+OznJEYNfEMvLNOrv88ExTfpox0Sdy01fVtxrMQb6qoCRLMoHELkucDL2SHhdhsTJQ
 BICw==
X-Gm-Message-State: AOAM533495OflDp9yip3zoiFKndBznzi9YPqBkJQY2tRPAMAQYMVuk8+
 9XRajJDnXOwrkxlS7xlaPB5sPFEujyVgcdN9liIj/kdjYCsIcpgdUoyJ+Yx+C2rle4Fxoj1fL2Q
 YtoPS7nMW63w5You4PjPuRRbMKROVQ4s=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr11019904uam.110.1625498774884; 
 Mon, 05 Jul 2021 08:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrtxA6JNoFv2lPzYZAZcJPpFpdVorw4Zlg1UOg5IcLS8uRzltd6rs63LYAJvMAOVRjuQjIS6hnCB6aP6eb09c=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr11019863uam.110.1625498774566; 
 Mon, 05 Jul 2021 08:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 12:25:48 -0300
Message-ID: <CAKJDGDa18BvohSd+JroYfvBJU+1JOOpAmqbF3_Q_8huHpykUQA@mail.gmail.com>
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:03 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Avocado allows us to select set of tests using tags.
> When wanting to run all tests using a NetBSD guest OS,
> it is convenient to have them tagged, add the 'os:netbsd'
> tag.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 1 +
>  tests/acceptance/ppc_prep_40p.py       | 2 ++
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


