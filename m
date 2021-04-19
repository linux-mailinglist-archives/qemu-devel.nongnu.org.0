Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AB3647EE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:05:53 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWPI-0000vZ-D6
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWKY-0005c9-1s
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWKP-0006oP-GE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618848045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXDLueHelNM3v/5im4G9bBgQ10UkWRHeKU/KOF06cxg=;
 b=a131+pZQ1KqHlfwSc8k3UjXg4LSFo+hRJ+w5VyY72VoiOFjAtPzAETPMSZ1gKNO9U4ij/T
 uw2TuHH0rlYXIJq5djXPdOE1b5D3/ES1TlZuOFLeEu4xA+DNHXQzVxlihrm8Uy8GsIxMIM
 yKCbZyrZ8yM9PNphBbC5U06svNe892c=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-tJxXPfipMROCq8hcfFBszQ-1; Mon, 19 Apr 2021 12:00:44 -0400
X-MC-Unique: tJxXPfipMROCq8hcfFBszQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 l185-20020a1f57c20000b02901d909b5e911so5227546vkb.15
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TXDLueHelNM3v/5im4G9bBgQ10UkWRHeKU/KOF06cxg=;
 b=CZJpyn5xrVmVlZdQw7SRFnSDwT8AptO8R+j1hTAgmENZ3m1EWcQA3h/z79PuA5dAyQ
 f/Xk4GztgT+0cPXOvTx3A11pxkgwo+pQuKOfQXbG/DmAi803trnhswZVVVFYuWN8F8rH
 X/XthLQQuhD7NL/6RdNmUSIscqneAYT/iXH2Kv2O0uXaZuhRRsEJqe2i0LNThz3yl2gw
 q36ZHxMe5RWoBn4yV214fbU4SXBun4ZeGzJ6sNh6kJGVvjFN9VLbjJXUHXh/obVp88of
 HoZhunOhyeHQRZOOeEVJhLTqu/eqLknI02hTKJ7SVmt/koX6/SjHSNDhwvq1iBpEJXSW
 RGRQ==
X-Gm-Message-State: AOAM533wjySFDozw5EZIVosLjhoMmw0IVwCmllNR7FulO8FOEJCN36pR
 PK+cBIGoOOzX4VGGe2vRP+xEkRFsC1fbHk1oPpQNRSPILy909oq2av/pNK5yxjR2kMoyoIyC0nG
 N3tHSQnh2pjilQeW/XnFzKh4UG3WJE/0=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr4130125vsg.45.1618848043890; 
 Mon, 19 Apr 2021 09:00:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxthMZtFKYcwRb46W5iTSuM/4mPdMTIZBxsStirXMFxNJ8VwETHLv6ldg1q5K6Ga86lCnhdwmcpCFLTOaVt4R4=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr4130104vsg.45.1618848043690; 
 Mon, 19 Apr 2021 09:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-27-f4bug@amsat.org>
In-Reply-To: <20210418163134.1133100-27-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 19 Apr 2021 13:00:17 -0300
Message-ID: <CAKJDGDYTxd0fFUm=g6DaMys8+0RcQW1X-pvO3WgL4XFVoGwm-w@mail.gmail.com>
Subject: Re: [PATCH 26/26] gitlab-ci: Add KVM mips64el cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 18, 2021 at 1:33 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add a new job to cross-build the mips64el target without
> the TCG accelerator (IOW: only KVM accelerator enabled).
>
> Only build the mips64el target which is known to work
> and has users.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


