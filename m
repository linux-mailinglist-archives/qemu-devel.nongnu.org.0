Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CDF31A67D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:06:20 +0100 (CET)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfdr-0006Pr-8W
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAfWX-000309-CU
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAfWS-0005CT-6D
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613163518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNazl2RITVDHEyOqn/Gbrn9UP/hGoa7umokS0sRLxeI=;
 b=g9MITCfthZ8odpbdvbSRRLHn9ntUelVhlca1Q30H9dzBhWwAY+OiRGHkZhpdYcB+kLgz0s
 YsAzgPudN0ljL9IL7Kr2vsTnKLCASfOKO2BCe8qBGF0Cb96e9yGzWFFzIz3Fdav3bhUIt5
 yosmEfTm58g4UD8T1e4xV2Uad0RtbIU=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Ggu8KmKuN3ay_twCu_pTcw-1; Fri, 12 Feb 2021 15:58:36 -0500
X-MC-Unique: Ggu8KmKuN3ay_twCu_pTcw-1
Received: by mail-ua1-f70.google.com with SMTP id d9so283608uaf.18
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wNazl2RITVDHEyOqn/Gbrn9UP/hGoa7umokS0sRLxeI=;
 b=B/YMLXD0Ul07a1c3NZWjEdDU0TCmT2e9mVLuH15neBgg/EgykjcEC7D211V3/AC8X4
 3CwSKvFyYONgNbhEbZQZ03qRLsfwCBkAsHnquUfJa6eEI2bj24luQ54WL4OKXQddiQIC
 4PPqMO79IUE2X/MhSk7+miZ5Xkr5o0fUwiVDGhvPCZ4t3SO0mfuTbdtJpq7IkE4edbtJ
 63NreB2d9X8U7da3b9f+HEhuEtt+AQXzy3qktqDWOi6OqtaN+CIZ3vzQCzjrogwXIFwL
 HnNmkYxKS3PQ02ueQ/Sm1NnZnGqz5golce4veH8U6TDo0j+U2nTDHFHTIV38rtI3/wGc
 4YFw==
X-Gm-Message-State: AOAM530qUAHNSo7pGIZRwrjCh0KSbzB9fVq7eqXaXYhfmhhhHGLa5971
 CI/Hkp7r254jvNflFqb9TFXNQvFWFMOstGrvJR5yjbU5D5Zcoo8EUCiOFghuEh3g7p4NGIgBNIO
 k+7tTwWX3MOyKOM2l8DyRaVXwHGFMNP0=
X-Received: by 2002:a1f:c108:: with SMTP id r8mr3368681vkf.11.1613163515672;
 Fri, 12 Feb 2021 12:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhb+GJGRpVG5/uWTD7uVfxXL2rg0d2+5z0OP+0iPtdKKeUJ1cMMk9IwgW3Gkz6budmn7hyrqY2oQjT31ClLc4=
X-Received: by 2002:a1f:c108:: with SMTP id r8mr3368674vkf.11.1613163515517;
 Fri, 12 Feb 2021 12:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20210212151649.252440-1-mreitz@redhat.com>
In-Reply-To: <20210212151649.252440-1-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 12 Feb 2021 17:58:09 -0300
Message-ID: <CAKJDGDb8=45GGhMyrwXQ8jK3XUAxmZ1r9FyE7iCpuEFVoCe+0A@mail.gmail.com>
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 12:20 PM Max Reitz <mreitz@redhat.com> wrote:
>
> From the cancel message, it is not entirely clear why this parameter is
> mandatory now, or that it will be optional in the future.  Add such a
> more detailed explanation as a comment in the test source file.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> I=E2=80=99ve uploaded a build of Linux 5.10 here:
>   https://xanclic.moe/linux-5.10
>
> But I=E2=80=99ve decided against mentioning it in this new comment or the=
 cancel
> message, because, well, it=E2=80=99s my private server and I have limited
> bandwidth.
> ---
>  tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


