Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E531FCCB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:07:45 +0100 (CET)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8Jk-0005op-2M
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lD86N-00029M-NW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lD86K-0006IT-S9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613750029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6PH46BMGMXu2vv5NZsGFSfhfB9mAKlJ+KOM6v6BCtE=;
 b=Ne8zV2DfB9Zi3fJ7sLzFMab3vrp/E/oZbA1yW6df6h8ATtCR3Qh4mEFSYOMz/7b6hq1O5r
 f7JqlO8iO7SWmjRdzRY8772p+DcWDdFE1qcLAuPob4fk5VfsbPZNiTGAQK6A7289417UzA
 NqxtvwZU9DtzNJme33sxW43wCZKJAuc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-k08wIA_OPAmy66FBCd5rKg-1; Fri, 19 Feb 2021 10:53:48 -0500
X-MC-Unique: k08wIA_OPAmy66FBCd5rKg-1
Received: by mail-ua1-f69.google.com with SMTP id z24so2675931uao.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 07:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R6PH46BMGMXu2vv5NZsGFSfhfB9mAKlJ+KOM6v6BCtE=;
 b=E9eS1Tqv4/8EhGM4D1G67lO4dzoYKcq+XS3T4ujNWJheaFWWg96f23ZWjUu5uOILzm
 enWgVdRQI68dcvlr3cjOGSRBbwFDJXf+HpMt8pM7jdfBWD8KqKEGb/teS5lBDnyt+jHd
 Ig9fydycKxhpljX/6LgyBgOmetm9TpXugU7N8agEiKbAU7jAwpjrX/TYeLMSsosOuxjh
 VK225UAlnWccH9gPTMqm7FZnUR1E4h3Sea/1VPZLMAur79bxWHOBbNHLqw8/ODme4CEe
 iNyIqS3AeeOz+EbSFAei4/rzdBBqb19Ypt3XKwX9SNm6/s0vlvZ9rRv9bvEAvPL0xVhO
 afjg==
X-Gm-Message-State: AOAM530Rxyz6W5HbXw+sV0tEJZhNHu2dH9/BwvMzq9XuY4yWalOhlzEf
 E8jrevcrZJj1yZrEGrPQkhCuyOtFWZ0pYw5NeShnxmpugefCdgNmMk8z8ih5nRNE2rUFCdgN3zi
 Mm58uA1geRfhbDX5SDhXMZCxLqhA/EEY=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr7026089vkf.7.1613750027735;
 Fri, 19 Feb 2021 07:53:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZdRmNLjrvOfq/kwkpdKzjxGHlatO8KYtgvCR71YD1UuMpepDS6Cw6no4ELjhVfmOifhn9TNWj4X7mGWUXnv4=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr7026065vkf.7.1613750027502;
 Fri, 19 Feb 2021 07:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20210217121932.19986-1-alex.bennee@linaro.org>
 <20210217121932.19986-7-alex.bennee@linaro.org>
In-Reply-To: <20210217121932.19986-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Feb 2021 12:53:21 -0300
Message-ID: <CAKJDGDa8aUFLoaFxXBwU7M5wWttHg480DDjJ1VsX2DmJ7YN-xg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] tests/acceptance: allow a "graceful" failing for
 virtio-gpu test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 9:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> This is a band-aid with a TODO for cases when QEMU doesn't start due
> to missing VirGL. Longer term we could do with some proper feature
> probing.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


