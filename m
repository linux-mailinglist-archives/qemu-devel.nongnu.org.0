Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18352BB85
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:38:53 +0200 (CEST)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJt6-00083s-7N
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nr9vy-0000kn-8s
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:01:10 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nr9vv-0003MN-Tv
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:01:09 -0400
Received: by mail-io1-f48.google.com with SMTP id e194so855241iof.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJw99M66db42SzBbYRac2ofCzEPbYgs56G2YWOojmhY=;
 b=v+aAmh6kk5Nuyt3qRc60QxljHhKwbVS5UWKyZI6rQcLC3QQRgYPcvCnuFi0NVQGHyl
 ioto0FKakRKbVDXU3p09qmxWif60qQ5IE5SNRrtuq0+IZVMsi4j95KwDLqC3G5XmsD2W
 A/Efu5GEPK7cKioDBdZdr0p7KfppLKWMkG1JGwVJ8ALjzSHQS788pLPe1g1efgxSkPAi
 r3TTXOSvTOgSDWhV4PQS3s2sCBSSDRUwO07K9QSu7zb3A/eZfdxD1CDSqXXzBZ2LfO5L
 kYiaBeA3hllr2LcvL2xofodiCwJHHAKlJfS8WkPKTZlvmXoGI2iEENuZfTVhvvgLXB8A
 Bxow==
X-Gm-Message-State: AOAM5304tlxfhLBUWDOd50/QWUjvG/36p6aAbyymhwp1eGxKyhCC6I9T
 fi+qNLwFDCGn4ZdtaxqocqXc9FKfytZByQ==
X-Google-Smtp-Source: ABdhPJxBvxjRBjZzZLidXmD4jJFDxGpBBYSPgEwqg4QCoic9I85irHLUrTimUNixco0nFJXiC/vGjw==
X-Received: by 2002:a05:6638:14cb:b0:32e:3bcd:78ac with SMTP id
 l11-20020a05663814cb00b0032e3bcd78acmr6276893jak.220.1652842864532; 
 Tue, 17 May 2022 20:01:04 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 t197-20020a6bc3ce000000b0065dc93eae5dsm333941iof.7.2022.05.17.20.01.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 20:01:03 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id m6so895060iob.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:01:03 -0700 (PDT)
X-Received: by 2002:a05:6638:34a4:b0:32b:b205:ca82 with SMTP id
 t36-20020a05663834a400b0032bb205ca82mr12831492jal.165.1652842863144; Tue, 17
 May 2022 20:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220317172839.28984-4-Vladislav.Yaroshchuk@jetbrains.com>
In-Reply-To: <20220317172839.28984-4-Vladislav.Yaroshchuk@jetbrains.com>
From: osy <osy@turing.llc>
Date: Tue, 17 May 2022 20:00:52 -0700
X-Gmail-Original-Message-ID: <CA+E+eSBJUWGqA_KQDX4RRhXpVj6GM1suNDtUxv+-qavOiwJ0vA@mail.gmail.com>
Message-ID: <CA+E+eSBJUWGqA_KQDX4RRhXpVj6GM1suNDtUxv+-qavOiwJ0vA@mail.gmail.com>
Subject: Re: [PATCH v22 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com, 
 Markus Armbruster <armbru@redhat.com>, hsp.cat7@gmail.com, hello@adns.io,
 roman@roolebo.dev, 
 Peter Maydell <peter.maydell@linaro.org>, dirty@apple.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu_oss@crudebyte.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 May 2022 09:36:15 -0400
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

On Thu, Mar 17, 2022 at 10:28 AM Vladislav Yaroshchuk
<vladislav.yaroshchuk@jetbrains.com> wrote:
>
> Interaction with vmnet.framework in different modes
> differs only on configuration stage, so we can create
> common `send`, `receive`, etc. procedures and reuse them.
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Hi Vladislav,

Thanks for the patches. We ran into an issue integrating it into UTM
when we discovered that by targeting a lower macOS version (we like to
have one binary for all macOS versions), newer features were compiled
out. This commit resolves that and we think it would be beneficial to
others as well. Since it does not appear the submission has made it to
mainline yet, it could be integrated into your patchset.

https://github.com/utmapp/qemu/commit/6626058f225c9c6a402f9ac6f90aa0b7e94d175c

Thank you!

