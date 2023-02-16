Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D226992E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScFb-00074K-8e; Thu, 16 Feb 2023 06:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScFY-000724-WE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:16:29 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScFX-0005pN-9y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:16:28 -0500
Received: by mail-pg1-x534.google.com with SMTP id z6so1063766pgk.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2TvbhjPzzO56vOshkwAuBdjvkU74JGCV6WczIvctXo=;
 b=GuEeOLA75EdQMVJHd/ON8xhHP0KYeIpklWmpZ9ygZI8TfG4YTX2XzGPdG7NHNlvUTQ
 c2nmIdYJk9E2VqZPotq6oT/rRO8vbHWauOS3mAFCG2+b0r4adfXhj5c7L8o/KT0f3oLU
 K6ydzqT7dur7ObJiFNGgxLfnxjBnWu3rFu0eI+IBwaJORc9gSVDpbeZviNJPQIrk/mRo
 DUcoRK8WrJuCnpwruiIjKENLdJ0oM/NevAMeKJ7VvC+KB3JIVoiuAph1dwt+z0PLt033
 mAVSAGVQ2eEUFohhU/VEO7P+vZWfyi1Lh+rwgIK9Y7+94eowzQzy7R0+6fnv4YRMMcoS
 chhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2TvbhjPzzO56vOshkwAuBdjvkU74JGCV6WczIvctXo=;
 b=oo2xVZlPEMazqcWtSzbXXTItwGK4RzDE7xhMUQY7/ZEMyZe1jSFtrfboss2YNSeWMy
 yQtluMEWz4lXikxFCnTgWOaFxxQNZYbHnFj4M9luLd2qd5C8A+T+ZAaMKvF4S4sHZ+LB
 YaLep8gfdpUXxepvQYkQFubmld62uc/AN5UgYemO6IMBB9zgjV3VFopSBMFpnVLHHPz+
 tpOU2+9qAbn8f4MGGj3vqbdmALCUCq6B8ok0lI2QXofJse37pvirzJv/KnQ7Nj9Eo9Sm
 CJderKI5OwUxgOuhHZXVeGKhdWvLwK6grXlyuP2Tk454xhj+XuFpE3CQQkjdMAlA8Ntb
 4e9w==
X-Gm-Message-State: AO0yUKWag7o3XwsAVt4XirWJQf9I7X2R8995MFo5GBZukLo0NnpixtTH
 Ikba5vnBx3ot+QQJXCD56IWHFKID8mtD9YYUCkmbPQ==
X-Google-Smtp-Source: AK7set82/xmQFyU4VGXi0rGbLIXE1RzWHai4PRgGIpk9jkl+XmkqwRV3rhZsYnki9blAGmo4EgR+S+ynEOTKLYhnqXo=
X-Received: by 2002:a63:360c:0:b0:4f9:cd40:f59a with SMTP id
 d12-20020a63360c000000b004f9cd40f59amr658748pga.21.1676546185732; Thu, 16 Feb
 2023 03:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20230215174712.1894516-1-berrange@redhat.com>
In-Reply-To: <20230215174712.1894516-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 11:16:14 +0000
Message-ID: <CAFEAcA-UrRqgU1PUsrkEJdSoNz2+LwEa-xdOo1CZSnwWOGOxTA@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 libvir-list@redhat.com, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 15 Feb 2023 at 17:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f3=
1e:
>
>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu in=
to staging (2023-02-14 14:46:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-next-pull-request
>
> for you to fetch changes up to 36debafddd788066be10b33c5f11b984a08e5c85:
>
>   ui: remove deprecated 'password' option for SPICE (2023-02-15 11:14:58 =
-0500)
>
> ----------------------------------------------------------------
>  * Document 'password-secret' option for -iscsi
>  * Deprecate iSCSI 'password' in favour of 'password-secret'
>  * Remove deprecated 'password' option for SPICE
>  * Fix handling of cached read buffers with TLS
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

