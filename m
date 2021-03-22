Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27AC344CCE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:08:37 +0100 (CET)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOO2f-0008PA-0l
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONxj-0005DK-8z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONxh-0001xi-KH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616432608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plbDcuFsUHkYScQFCpJrpsSuWlYgbnvud6R1+w+l4jE=;
 b=QgCa3ForHltMOY2gaPifHDyHfpdorfKIVu1+VKZUJEIip6fANuJ7zEnaOuf2mQu0tuEN8Z
 q9TIptBb6ba9p5uqJqVTdujtT6eev7Hb6A/YQ6aGjLy0iSqYFU1OjrRAOoZuP8lxxtt6yb
 p44LhOe19XKXSAHb22R3dtXZ/K/um/g=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-IfLIQmWXPmKlhqx07h-7MQ-1; Mon, 22 Mar 2021 13:03:27 -0400
X-MC-Unique: IfLIQmWXPmKlhqx07h-7MQ-1
Received: by mail-vk1-f199.google.com with SMTP id p6so6965608vkf.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=plbDcuFsUHkYScQFCpJrpsSuWlYgbnvud6R1+w+l4jE=;
 b=gPFi9b7BOj1qSaj0oXUtu1A16jvp9oGMEbdRWUbtq2wTLE8MZMx8lhdLJNAQagTWMs
 bhLcjVCUU0aYmHxbOg1kIsvx7zJSRtd1EtYUFAoafinXJGTuzqlbSwn16Q0Npb2T6CoR
 WLSjU0qSUMf0xQnHrgwFUN8ugYWomOzinu7joMf/b+JY8BEy69yjO5bdofHk2U3qYA73
 pUY0TugdGdVErWKZGcv4QoMXP/KbesdDx1ix/q/tYlBE1hd8O08SiiMX5a16iEA+VooH
 UQr+OR8PWJ6UiGr1WCbk6td6eytYv1zva7r9da3QRn5fZ+2TpqUFc1cf0+3d68oXcvIq
 V12w==
X-Gm-Message-State: AOAM532Hf2aVgaafNDO98olTDHc0+Fzc2JWYuCftDFz6E6o30VKgzVdS
 sXPMrihYp38VLNrRwJF2lzZMWmSTvseXovM8uWlJ9hHAzN0A3AqONgJwKO30GvoKy3tD/CZkhm5
 50UDvzTayh63B1JzQEucxSU8k5ze/47A=
X-Received: by 2002:a67:3241:: with SMTP id y62mr583893vsy.45.1616432606599;
 Mon, 22 Mar 2021 10:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo94HvEJUg9gNqEYUos7N8LZYKFqhgDYzwyDrGLauS0pfSNxEdoW+/5BxLa2cRGh7arDpiTJf1UlE7Z9P3r+Q=
X-Received: by 2002:a67:3241:: with SMTP id y62mr583849vsy.45.1616432606303;
 Mon, 22 Mar 2021 10:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-11-alex.bennee@linaro.org>
In-Reply-To: <20210320133706.21475-11-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:03:00 -0300
Message-ID: <CAKJDGDZmjE4+vM9VZ+2DioyzRprfikTZvbZuk03faV9=vF1pmA@mail.gmail.com>
Subject: Re: [PATCH v1 10/14] gitlab-ci.yml: Merge the trace-backend testing
 into other jobs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 20, 2021 at 10:37 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> Our gitlab-ci got quite slow in the past weeks, due to the immense amount
> of jobs that we have, so we should try to reduce the number of jobs.
> There is no real good reason for having separate jobs just to test the
> trace backends, we can do this just fine in other jobs, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20210319095726.45965-1-thuth@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 30 +++---------------------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


