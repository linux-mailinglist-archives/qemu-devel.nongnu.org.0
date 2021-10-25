Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF7439ADD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 17:52:09 +0200 (CEST)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf2Ge-0000Tk-C3
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 11:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mf2EJ-0007ha-3B
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:49:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mf2EG-0006C5-0T
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:49:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w15so10022842wra.3
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Do0mSR6Bp4v82q8g0hbBqxuQxsyeMCzzZ1TSnvKqeBI=;
 b=dxhSMd8gI3wyIKE5r/4m38VWIIY30YAxrWqrQQF16Gz9pwh+5iUFafuHWGZ+fsl0yw
 tS3Tjn4beX6Z5jPG1Mm1KV8H8AahG+k3lkjSf1q0mVBKvrgnQ8rr9xS1AZ7o/q+qq2Vp
 Ek/+r7YtYDuDVDCy0r9BczY7wgdoGGf9uN8lDE7OiXw0qAd4qZ1oooV8/rVtlzy005Gq
 EHyAe0vfLqu4B4Hpz6KKX/ZJEjrrybW1PYWmiHDecw/vZUBmzca/TV8KClOVzuQUGUmZ
 XlUDmE17tyh8+JzdNFZPuTQ8Z73HNSy1lYuw/cIakjH/tYVtdtPcY/OmIrXronAgDRuQ
 86Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Do0mSR6Bp4v82q8g0hbBqxuQxsyeMCzzZ1TSnvKqeBI=;
 b=05pQWg+M9L9LcUDJWD4PO1LqlRn+d3QkOUOZOb+8WrE8YpFmbpvvdzDNyJ/5Z6wjc9
 pQV1W397eYnu54C3gEaYHP8/TAyS/ovFFaLwZAJWx6tm4fmcYTqJ6QSjfJCy4aH7+cBs
 3uGmMo87RMFEvn7pzsp9rb+OwaDJcNK0f2hyC59q0tot/Gepd0OK0XEReSkoekWUoExp
 vaaNkTANJO0pt39LHrJX7Oep/J2LgGSgefSzfe150yXjFJ9wFuA6GCxPLpLJ3fUS7CpB
 cQnIV8MAnS/R4Jx+qGWfAneM8bdOdiOB1G2Ule0ibFmL7t/MSrgafGAKccPsbEjkVc8Z
 dsFw==
X-Gm-Message-State: AOAM530Xf3nn3yRQDm1ytfoCw4dKmw1Lg/QwtyOfOfVZYCK2Luaf/nXP
 Kxb+2Rw3nhYAyQfYhx9MXfFAqw==
X-Google-Smtp-Source: ABdhPJwM8TgAKvrjZaxZ1MYGZJNjO4hRNpAkzJE+Usnfb7GKbjM7gnUh7jVNr7wAjTNJq19T2TexqA==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr24536897wrq.157.1635176977468; 
 Mon, 25 Oct 2021 08:49:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o194sm10176375wme.40.2021.10.25.08.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 08:49:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25ED51FF96;
 Mon, 25 Oct 2021 16:49:35 +0100 (BST)
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
 <163491882316.304355.6955215012706902188.stgit@pc-System-Product-Name>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: NDNF <arkaisp2021@gmail.com>
Subject: Re: [PATCH v3 1/3] src/plugins: sorted list
Date: Mon, 25 Oct 2021 16:48:55 +0100
In-reply-to: <163491882316.304355.6955215012706902188.stgit@pc-System-Product-Name>
Message-ID: <87zgqx14vl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arkadiy.ivanov@ispras.ru, qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


NDNF <arkaisp2021@gmail.com> writes:

> The list is sorted to make it easier to find missing characters
>
> Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
> ---
>  plugins/qemu-plugins.symbols |   52 +++++++++++++++++++++---------------=
------
>  1 file changed, 26 insertions(+), 26 deletions(-)

Your baseline must be old because we already have a sorted list since:

  1156a03372 (plugins: sort exported symbol list)

--=20
Alex Benn=C3=A9e

