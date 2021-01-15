Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A42F8485
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:34:06 +0100 (CET)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TvB-0002d6-5b
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TsR-0001Mm-UG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TsO-0001Ap-59
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610735471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWePsKG224XHorSYwYw3aM2CaiWVBNqRUClkXfgpOOE=;
 b=IBZudL7dh6HjjZKlax9Lw14eaUqSa6Gwe8v5AQrMiedEog+baUzEN+V/cKCas2c3UtwSxM
 j1hJj074jwAUxSCHwdYtGnSMiOCvObI33tfX0KzMZRaVKD8V9jrdemwjbEVt1z8RnAxdEA
 fqzJkzrl57UAJRqlVqvf1IsqptOSug0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-vQo72dQBMRK4f8vkD7znKw-1; Fri, 15 Jan 2021 13:31:08 -0500
X-MC-Unique: vQo72dQBMRK4f8vkD7znKw-1
Received: by mail-vs1-f69.google.com with SMTP id g3so1831075vso.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YWePsKG224XHorSYwYw3aM2CaiWVBNqRUClkXfgpOOE=;
 b=B2e/jtRe4wR2YugxHGXEYGRhxpOj3dteBi3pOfQlTn1KgBt7Wy6K0gC/Bn60tXh2Q2
 bxVaIyz2V+enDutoPhXeo5GzEEAnpseBbDsYUFGFAAotAr/Ln/3KG3/6RJ8NYochN2hl
 Syut6GrsZW3GRK6+J7lCaHObJxYIqfAOiM6S1B/Miv12Kzrr5ewWcU5dvCi5cnSuYB4M
 CVvbzC+G5yzK71tdQeSNwF7zjE/ONyt3pLADaWZWU/7KAIZf3afcpnaW9UOceDo5xj1v
 em+NUJjF6jjzZ7JT/hrN1QscvM3z07R2PWpzjV0XJnPyDssAiHopoi8DYn0JJf2YUbZC
 rasA==
X-Gm-Message-State: AOAM530XqAtnvj5RCe4UmZFwKP6Aclkl4BV6tLjxStq59+yVIg8bnfB6
 E46W3zwmgRRHLV0JnPalmShLv2p7yTlf93yXsqkiNAk3I2V6JocOM1iPLto8g5/HPbn5IhcGma/
 Ru243nY1e8+xuTUnmX4lT1vLq1wB+H+E=
X-Received: by 2002:a67:c282:: with SMTP id k2mr11348299vsj.1.1610735467834;
 Fri, 15 Jan 2021 10:31:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjAxOWDzmiEuAK0i/MGZlhXcfkowFocgp2kZ4p6exFUOvsVVES1FF1/IMoi7fY6mdyh9IjwPy/3qjELDUpPug=
X-Received: by 2002:a67:c282:: with SMTP id k2mr11348280vsj.1.1610735467703;
 Fri, 15 Jan 2021 10:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-4-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-4-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:30:41 -0300
Message-ID: <CAKJDGDazSG=vXa8U9WMBrXC9107SuLyJE6WrLSpnPK52cOnJUg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] iotests: Move try_remove to iotests.py
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/124        |  8 +-------
>  tests/qemu-iotests/iotests.py | 11 +++++++----
>  2 files changed, 8 insertions(+), 11 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


