Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885B639C39
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozM60-0004b9-QR; Sun, 27 Nov 2022 13:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM5z-0004ax-K8
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:09:39 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM5x-0007Wn-9h
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:09:38 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3876f88d320so85707487b3.6
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pxf3yQoT2JdrJFMp88Hw9pI9ZHtIS+z3n4u/0qRtxqk=;
 b=TEvYWa31MQOrNt7S4b7z9HckeM0Qfl7imkXmzHuDkT0ToG+XQnxRijrfi7P2CGqVzY
 dMP+eYh1TnaV9OWBpm0VNtgnWYDXPQtjfm02EhApYZTS6h+7F7WFLa95BW9miXgLr3kT
 WYtG3qPoZNagcMeUVRWC6BxeUWEjZgJm/ikSnygKtDYl6cYxUUG6lyQ4pzrPkfU7MF9R
 IM0hfJCJNRORj//4oygQwYB4WGWuDDiQbsRF9IPzdci2zESzINeb5y5csBmgg1elHmaz
 djZWTT68DBj6u8Noln2OV6cYi3MJE8F5AnYn9+Zldp7joIj5qr0/9uRpdEOX7QJUWW8k
 1VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pxf3yQoT2JdrJFMp88Hw9pI9ZHtIS+z3n4u/0qRtxqk=;
 b=2pa1pnqV+gs2HrY+7KEKVhKZ+pGUeQi2poAMWF+7bqxvANAFPNzSc9XjCQkkAed0xA
 9dUIqqbD3MgdBNa479lW90xSKF4FtKEH600JlT9J/Nb+bV5pXM84epyKgR192yeW3YkJ
 tMlImGvZn/v4mDdtU0E741hfvnMS7Iyp9n70RfLF5N7ustEkjWpREero4l+4VeDzoUsA
 IDQCfxOmldukf/RWghr2X4qM1qzAmRDBAdkZ5wFqcX8MB+nGD+vtHWydi42IYE8CB+JC
 wVG3fJisR5cTT4jCNFmDJs2ha3EEnZEY/rLoLOVi00GeEKNDF9yq8LoHwgfGg6iFdRrc
 xI+A==
X-Gm-Message-State: ANoB5pkIqiv8/tbt/u4Ws1w1guwd4izr4Q3Dw0K1xKwPz4Tr4vJUJYQ1
 5bn0Qd+P4eEFPgr5+m0zWOTQpcjNPyWqzhYRrt8=
X-Google-Smtp-Source: AA0mqf64Ac0BCkl63DL13fvdggWUIXnjuG0blyuBjn/ip31D6oi/fr64DbAspCD9kPkDUSVzoPc6itSgLe7lu3bocuU=
X-Received: by 2002:a0d:d202:0:b0:370:1a06:1b4a with SMTP id
 u2-20020a0dd202000000b003701a061b4amr26708264ywd.206.1669572576264; Sun, 27
 Nov 2022 10:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221126152507.283271-6-sw@weilnetz.de>
In-Reply-To: <20221126152507.283271-6-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:09:24 -0500
Message-ID: <CAJSP0QVqm-BpgKpdD2p8F-k2s9yaE4gRrDPRSju7jKh20H1ExQ@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 5/6] MAINTAINERS: Add subprojects/libvhost-user
 to section "vhost"
To: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sat, 26 Nov 2022 at 10:25, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf24910249..6966490c94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2005,6 +2005,7 @@ F: docs/interop/vhost-user.rst
>  F: contrib/vhost-user-*/
>  F: backends/vhost-user.c
>  F: include/sysemu/vhost-user-backend.h
> +F: subprojects/libvhost-user/

Requires agreement from Michael. Also including Marc-Andr=C3=A9 who
originally created libvhost-user.

Stefan

