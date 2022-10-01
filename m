Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5D5F19AC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:46:37 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTSW-0005KL-BV
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTQN-0003u1-6S
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:44:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTQL-0000cf-RG
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:44:22 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-353fbfa727cso61374937b3.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=rvJPif2eIVrE1lwH3+q+fN7JEAT3xqWaZMULp4jT7Sc=;
 b=fPsd8dc3KPeSCt/RmKQgadDIKI+UgpvsKtUliu/qzWbLjW4ES1D94XlQXftZz6Zx3D
 bkyf5dfG1zLZ4QwrZUdOLBsI7WwblScWZ4bsbvCR5Hlz9dzs4V1YryzBJJgwummTP7x5
 xJfXQfXt6ePDiwkGBHw+fMbcvGc0u25H7sE9hOpSUpLysWzYJUhQUV5L925S5UoiaNLY
 Vq03X4b0t4Fh8MeJ5pHCfiiwCreiGFsaAC6Idz1GHBLbiFHxx9tB3WNhzxXl3dHWBW69
 iU9v13yVAWv9hjMYU11cVtnEdhsHocPZmKC+7fTZ4ZN964zCimyWjDs/y41xkBrk2wks
 zU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rvJPif2eIVrE1lwH3+q+fN7JEAT3xqWaZMULp4jT7Sc=;
 b=w1CNavzhyfKZE34VLA4DbKhcESEbjB0E/2XNJfP0eNJe++ZRbsCRrNMe/bhvWW4Mr0
 zmBSsiWcWFEYFALKhe/rpCu/xEPJ23vlWtqStP6D4puynKiHIQ8HBt+lnd9UEhuYCQC9
 39PaFqFcZXaKeTZzY0OnC7+yfQE0vHvenOvPKHIGnOWu1Pg3ILk9I7T9ZnCP23kj3AFJ
 flWDM10I8HEBl1HowsPi78xMeuO8Y6FQWxtFh8tLHMslyuErh4PT8TQK+xUmAPpQDWiv
 3hBZEizbqqZ4QJFzkgHMB6AsccpmccBcbNxByjiXkciVVWhJsNqH/YTSYlUS5mYd0t9h
 wNGA==
X-Gm-Message-State: ACrzQf0qmcuvEgqdSJER+jHAvrltqYcMGr/644EaxCbHIhy64V/fS46H
 MVp6rPCrex4qxTn6wjgnAXdCafnCU3qPRv4Oam2tHMp1
X-Google-Smtp-Source: AMsMyM6WsuKCU1D7HgF2PLDOOCXcZLbY2Fp0xVlNCBMDNtUoG8L3LtUuV50CFr6wsYLHPZ0OrbJE1FBlPkYq7KK9UVA=
X-Received: by 2002:a0d:f685:0:b0:343:bd3d:80b2 with SMTP id
 g127-20020a0df685000000b00343bd3d80b2mr10758329ywf.485.1664595860656; Fri, 30
 Sep 2022 20:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-5-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-5-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:44:09 +0800
Message-ID: <CAEUhbmXuu54L7LkNKDpBnNBysTHPqdtSEQNja2S94EGfjPc0sA@mail.gmail.com>
Subject: Re: [PATCH v4 04/54] util/qemu-sockets: Use g_get_tmp_dir() to get
 the directory for temporary files
To: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Tue, Sep 27, 2022 at 7:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Replace the existing logic to get the directory for temporary files
> with g_get_tmp_dir(), which works for win32 too.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v1)
>
>  util/qemu-sockets.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Would you pick up this patch in your queue?

Regards,
Bin

