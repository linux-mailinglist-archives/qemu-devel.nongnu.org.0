Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFE39E63B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:09:32 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJgp-0001p8-Rj
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lqJfR-0000dH-7p
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lqJfN-0005eF-68
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623089279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUJUR0sQeeMUnNQPGIg1qTnnNHt8FrUANsh+IInuKCA=;
 b=XJryq3t6/3+Deg1nY4xoVbQhgMnRbTQ+yTlI7dtconAOuDcBNJV0iz9YIz/duLVp9rAEez
 stoAo+QZobGS3wzUkAGvRMfwbGnmIHyUFI3/Je7R/RtONh+O+yGnoCEYctYmIPMprdNwan
 pWnYTfzE2y8DGzlbybPF8AzZRqbc6Kk=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-TDKf4u_NPxGQH2H5PsVi8g-1; Mon, 07 Jun 2021 14:07:58 -0400
X-MC-Unique: TDKf4u_NPxGQH2H5PsVi8g-1
Received: by mail-vs1-f69.google.com with SMTP id
 u4-20020a67c8040000b029025d0c69e47dso3881836vsk.16
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 11:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zUJUR0sQeeMUnNQPGIg1qTnnNHt8FrUANsh+IInuKCA=;
 b=Bn8baJfh2RroeFVtRqBxPmEk/AQhe/MNYxeG58e4DLBEtAtkJUdNg6NCJd3nt8OLbF
 Ihntgy2pgTTOVapIgNhxAvzCvEFwNU80AN5FIN5+iYVbUG4mg2wxMzTJpGP0e3wSCg6F
 cWqEIM7YYc0RdqfBx12SVjFZBw2llLrvRBNwdGNLdORtcLHgaAC8tq7JdTECQqG+gWav
 IvW0by29A/8J4kDL9d1jMQkGIs83QtmA8A+EMJoPBGi6gUSJri2cJ8j8HSr9w4Vsbwlf
 cRU6EY/8FqgkPHv/Jz+zO6YXQekn4q0I/i8iKSgmJ7jOU6Mws0idWtkFNQRRHsDgM2hl
 pd+Q==
X-Gm-Message-State: AOAM5316BLhRZTNVBFsJrAFnYYWxKAFuBi+MSM50+Prxj3U+vfyWA5an
 qMWfY+kkwpZHnDJe+43EizCYdLbfAt4JZayQ5m5UdvFBff9qmk6XKpI4MdGDnXFUymBStcPGURz
 ajBAfhgx6950J+B2Ssch+J84L/YYnFc4=
X-Received: by 2002:a1f:93c2:: with SMTP id v185mr9574632vkd.2.1623089274499; 
 Mon, 07 Jun 2021 11:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcD9w0RyZja1NmGPzogICHo6bre/ewPfhJZG62IxlXBWo9E56pq+x511vcKWWBpOquRXIhAwpib+H2HpQDAHc=
X-Received: by 2002:a1f:93c2:: with SMTP id v185mr9574486vkd.2.1623089273177; 
 Mon, 07 Jun 2021 11:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210607171829.25111-1-alex.bennee@linaro.org>
In-Reply-To: <20210607171829.25111-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 7 Jun 2021 15:07:27 -0300
Message-ID: <CAKJDGDaU0iQ4dTwU8=CjFW8uw4J177Oa+hpWgqPOP7LZA8apAA@mail.gmail.com>
Subject: Re: [RFC PATCH] scripts/checkpatch: roll diff tweaking into
 checkpatch itself
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 7, 2021 at 2:18 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Rather than relying on external tweaks lets just do it inside
> checkpatch's direct commitish handling which is QEMU specific code
> anyway.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/static_checks.yml | 3 ---
>  .patchew.yml                   | 3 ---
>  scripts/checkpatch.pl          | 7 ++++++-
>  3 files changed, 6 insertions(+), 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


