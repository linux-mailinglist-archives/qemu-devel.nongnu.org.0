Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92D6DFEBF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 21:31:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgAO-0002AC-5I; Wed, 12 Apr 2023 15:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmgAM-00029u-NS
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:30:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmgAK-0003e3-I9
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:30:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94cfe3db2aaso160827266b.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681327799; x=1683919799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G+njkr8Axt3/Pua7rwY/g+bbPzfIQi0WvJUjU/7M5aw=;
 b=MuVnAKSH74MKvILxj3E9plyJi9BjIgqBhGGxzO0cHtVP6FKhJkXV8khMTfIT3QRA3+
 uD45Bc/j8hQMzxTIyCTiMUGmUDrYxhrXTLUZWPApBhgTHRI4tIc9SR0CoH/FDoqLb+gx
 dn9+7RSBofUBNH7vSzapcAvQUGJf/n6VvyJlt+jjuBy0mxXAAU9WDtEcEMcfxGdbAKug
 Tl67RMn+/l01fP+NF0Yz0lBmBR6UzLzCwuW9G17u9qPt6InckcwB6DCOI/HMLkPBCoz4
 hjMZWqyyiV7xZEoGjeWFu38ryQmbKdxBgPxeIM4M1ogfRkj9JuqyRXFPSy4kos1DwDAF
 EIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681327799; x=1683919799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+njkr8Axt3/Pua7rwY/g+bbPzfIQi0WvJUjU/7M5aw=;
 b=ZoaIlXuZvuBZN5PoAsNoJrUgNPM5DjE6wEH41ZWeB7TjSFmHg3nPF4TaUvE6gVejJu
 3lK0Czz66iHjjKe8dvz2k7qIvGKAc/p12Jqi/VQ2JVNO9CWFV5aT19fRFHNPXjZAaCE2
 Yap0e1Fo19FJsV6m8KqJEWHg6IPiFdgTlu4s60E+9m7mCIwqyofmi7ezNhKuYeoA5EZ/
 Hw4JWqKItGTN2JdYWF4slc0Y7kfzR9z+dgHqm6KZav388U5mp+ff/Ea9xBvHzH7Sm5Sv
 sl05La4Y5fGLEG8CNvhlTBEfNY3CfYxBoHtf65XFNIVtwdjP6hRnGya8C3ZBBqYsWvMy
 l4Zg==
X-Gm-Message-State: AAQBX9cCG5FQJynaZ9Ex/A3DsV3CpvEwFFFrkvNMJlrLZJsieYJEjwRH
 6Z+7miSW49VGx48NP7U63YTSdgwTnFbaUPVvOBTdvw==
X-Google-Smtp-Source: AKy350ZbizCgvDw3HetUbLB+5WNWsbt7XUZ7g05nZ8EUBxJlbI4H4vtWgNTQO5Jsctsm2bBqLR3wj+TiMxHNcfUI6HI=
X-Received: by 2002:a50:9b11:0:b0:4fb:7e7a:ebf1 with SMTP id
 o17-20020a509b11000000b004fb7e7aebf1mr278580edi.6.1681327798700; Wed, 12 Apr
 2023 12:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412162927.112101-1-pbonzini@redhat.com>
In-Reply-To: <20230412162927.112101-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 20:29:48 +0100
Message-ID: <CAFEAcA9iBde7eJBM6Lyrnc3Z10ADBCcHwakyRa5-AYXHYXDQxQ@mail.gmail.com>
Subject: Re: [PULL for-8.0 0/1] NFS changes for 2023-04-12
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 12 Apr 2023 at 17:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit abb02ce0e76a8e00026699a863ab2d11d88f56d4:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-04-11 16:19:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3fe64abcde55cf6f4ea5883106301baad219a7cc:
>
>   block/nfs: do not poll within a coroutine (2023-04-12 18:26:51 +0200)
>
> ----------------------------------------------------------------
> Fix NFS driver issue.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

