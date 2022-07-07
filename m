Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878C56A737
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Tfj-0002K6-JW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TcS-0008EH-JG
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TcO-00023S-Sd
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657208433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5BDJvYBK03iy18xb5ZbUzvu7rGFZQoDmlMvgaRIVCw=;
 b=fTMIdEWHKGj5yLgQrs7tFAw9h6syqqEivn4rAxilkp7mlBiLg4dhFqZb36dSxbWIEFs82w
 3jrbDObyKVT4Ol4GiFxefAhwzQ8UdLJrDtVuJIKWHsv6Ogi8CwrY9p1uaUA2YAaSaJZXGD
 4vodn5t6X9CCTUDusAAtMAjC1kw/0bU=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-IGKDljD8OD-ABIdJ0Y0a7g-1; Thu, 07 Jul 2022 11:40:32 -0400
X-MC-Unique: IGKDljD8OD-ABIdJ0Y0a7g-1
Received: by mail-ua1-f69.google.com with SMTP id
 u92-20020ab045e5000000b003829dbb5419so3898624uau.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 08:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5BDJvYBK03iy18xb5ZbUzvu7rGFZQoDmlMvgaRIVCw=;
 b=2pNj0rZfy8YDy0eJCxMCCz9dhWnPUdU2zSpx2GCxRWjwVMMKi25gAP6RW4UsX3cRTy
 ifoxqgisUEHYYE1dHvV79lAYQ2Faq6yooGvf8GMBSy242ehKI8psejv31bEm53msl+/6
 cBsS2mej+32bE1FEB2CadpSX/h7D8IUWrbA8zNOA+Aj36OpZFNPvLGeP6O6bpO3+VyxK
 nMDPhjOS9QeiQE+wgNktUZwmzUJfY8U9UnqYg9fJzR93rpuuRbetphy6Wfw/xGQgn6tD
 u4Zr4gprAM+P6Z+kApz61wir9TWJpYHlWNUIAnvgTcYj8JCY0ZwaljyasuMqVT6Ox/yb
 wjSQ==
X-Gm-Message-State: AJIora8GWkg0r5tVUEDlA+MvYY4g/dTO2WomDNl1Qtncf+xgvUBdf/nA
 uFsmj8PBEYaGlT7/imWMUk2O/5p9WbHZcgucrj4SgHngWPYyxJoFWvJ3a+dKbgXmD9OxMTBcLB8
 QC7YZINondMkiKbc18wgyYIw9aPPkcwI=
X-Received: by 2002:a05:6102:101:b0:354:355b:711b with SMTP id
 z1-20020a056102010100b00354355b711bmr28119288vsq.61.1657208431459; 
 Thu, 07 Jul 2022 08:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPfe6/8uQAvAlyFBYN5zQr2N9KJ8H75pLnaBiDwKv/k0G2ql5Y4y6uZhu1gLitZi0v0Tq59vc5CbyXiIDEjCw=
X-Received: by 2002:a05:6102:101:b0:354:355b:711b with SMTP id
 z1-20020a056102010100b00354355b711bmr28119270vsq.61.1657208431275; Thu, 07
 Jul 2022 08:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-10-jsnow@redhat.com>
 <1c4bc1aa-9809-549f-8bc6-b1b2323dcdd5@linaro.org>
In-Reply-To: <1c4bc1aa-9809-549f-8bc6-b1b2323dcdd5@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Jul 2022 11:40:20 -0400
Message-ID: <CAFn=p-Z1jGjpjUE8XednXc2BSH6hPnoit6Prd_iRVBiyAz8ByA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 7, 2022 at 7:05 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/7/22 09:33, John Snow wrote:
> > 18.04 has fallen out of our support window, so move ubuntu.aarch64
> > forward to ubuntu 20.04, which is now our oldest supported Ubuntu
> > release.
>
> Ah.  Squash with patch 5?

Can do. I left it split for testing purposes, but if we want both
patches I can merge them. (Testing all of this was a nightmare.)

--js


