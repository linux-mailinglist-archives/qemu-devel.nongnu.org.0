Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161937B08C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:08:09 +0200 (CEST)
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZbs-0005LM-Cp
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZaC-0003tv-IG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZaA-0003Ox-E8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620767181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dpmVvKEIKulLI2H2Ho5oBSuqUzC6wBkUg5JNjEmXjk=;
 b=TaJwsCIqkLiBdIvPTk5eHmBpDwIC8dt6FjkiCKo3QZdAakEnwh05x8B01XsjBTxr2Fsuig
 YamGCi9sucP8ZHvbNYL4tc44GxehRFid2wcPHhxjgN5dFH9iJvBIiajJxo+tVlEULsrjDF
 YMvKU/hP2rrFqV7T5MqIW/W5sJJBpiE=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Si3MpMHWOIKbjIpgGk9kcQ-1; Tue, 11 May 2021 17:06:20 -0400
X-MC-Unique: Si3MpMHWOIKbjIpgGk9kcQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 d76-20020a1f364f0000b02901d17a7dfce5so2798690vka.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/dpmVvKEIKulLI2H2Ho5oBSuqUzC6wBkUg5JNjEmXjk=;
 b=VuIgaL6bn0+KyH+S2z2KB8Xkg5ijTPdcytV1MNCcD3ovPg3yzpy8mfEIeyMmThIzIT
 GGPyB7iAGMPwn+HFPMr3g+XUBFz9EC/rgL2xtw6pokV4QGBg5Cpjkb44pan6RWprpJf3
 xaCKb9cxTMuAKIfUV+3hAa+7B6wU0qjddhNrF1hGlGy/ICmwGfr1R26RUh211Sg1s7CK
 /4QLZ00kfs4+KLzAI9cx23MRymv8cAWajE8kRBViSGgcT7r+UV1luc8tzHKGq57/IRfz
 0drTVOz1Zu2UdLBKv7P3jR7CQYvj0Osf+RZLrbDz6bEJGcW31SSMjRBKKfDL1kih33VC
 Q4OA==
X-Gm-Message-State: AOAM533Uvg68TwbnxR8GSu5fsWXFPi7KhNoEV7D75DbRd9zRQzSGsOMd
 TgS+LpC6ZaBUiKfA2eSXCbbXeIYbvmiYi9IEv/iNZwaIbZmNoEe7M53dDQzagcCIIjMiLaWYsZ4
 bFfOtG5hnIOnL2mot78VTDiG1K6Z424k=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13701038vsr.1.1620767179793; 
 Tue, 11 May 2021 14:06:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0luV5TEJu7MGG9t3zDbvKrYL0k4aDLc5nQyat220oC1K7xJMa8f4gaE+3/KGK+M5d9byWyL2gUP+qSAbS/Zo=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13701011vsr.1.1620767179590; 
 Tue, 11 May 2021 14:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-13-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 18:05:53 -0300
Message-ID: <CAKJDGDZLr7Df28iqjGsanmpuRcUN0N0uB5kiKtzPi2za_ZQpCQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 / XCode
 10.2
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
>
> Per repology, currently shipping versions are:
>
>              RHEL-8: 10.0.1
>      Debian Stretch: 7.0.1
>       Debian Buster: 7.0.1
>  openSUSE Leap 15.2: 9.0.1
>    Ubuntu LTS 18.04: 10.0.0
>    Ubuntu LTS 20.04: 11.0.0
>          FreeBSD 12: 8.0.1
>           Fedora 33: 11.0.0
>           Fedora 34: 11.1.0
>
> With this list Debian Stretch is the constraint at 7.0.1
>
> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> which dates from March 2019.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


