Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F72F6BB6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:04:54 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08rV-0001Wa-OW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08i2-00021Q-LF
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08i1-0004xW-2d
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AIa99/NN3zu8C8tOHZ9gw5twP7+smBZ9otMtK/5iUU=;
 b=RaCfk6y1I1iIYmVgZt9jPeM7TtcRzxqGaOACxyV3DieV6/v9nzHA1AfLs/ecFR7DhIxh1m
 Wrg75a5jbMpNyE3ZbatAQDOORnAISs92YZXRSrW8ePK37V3ACRfZTWNshoZDpW3Ute5rEk
 MniVnj6W1mFJ3lnFsZd/yL9mYjKA+3A=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-rQWko0fTP9e87siD18k-9w-1; Thu, 14 Jan 2021 14:55:02 -0500
X-MC-Unique: rQWko0fTP9e87siD18k-9w-1
Received: by mail-vk1-f198.google.com with SMTP id t9so2747556vkm.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3AIa99/NN3zu8C8tOHZ9gw5twP7+smBZ9otMtK/5iUU=;
 b=CKMpVjeuThTjYr5W9+1tl6qb5rIzjPRTJlev6MyirRsTuO12OuaSnkVVw73hSdIDa/
 yfg1GeWdiDig8zJFAHZ1+vAytEuemy7YoDJt9Ak3kQxZO6qQAEf/0TJUOgGRPlDYgCFA
 SbTNlH+nkwgNcQihLBVLS6xSzmi7rJJQqn/PaA6ptc0kxZzFemWz+sW91+Uzayxlj2DR
 eWTOSIVOVhizsXeuIGM4r7iRZqsfQ9L9xUHcariK1uls/BpONiXC18M/ToWw6e7ntPUb
 xvHy7oLrM3cxdHqe29Ak4jtHPiWfhGV5bd8VUXehFU7sufX7lXLP02XW4jXdCDcFCove
 928w==
X-Gm-Message-State: AOAM531z+RPc6Cwv4aYLCOILXtMOe0aUCbJTXHXb+GxR38uHnz8Ysmie
 zNgOn9vgkL+UT0GWgYYL8SxO91NHYbTsYMVrAXXo4xbOaKfgi6sGWSogwZNaLsX3u3JhgWkC5q6
 nEDcNS5zlT2JbKaSPSb7rzgA+JjRYB2I=
X-Received: by 2002:ab0:1ec6:: with SMTP id p6mr7497662uak.113.1610654102479; 
 Thu, 14 Jan 2021 11:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUyS3NktkNJRbl6bW5uNb82BaPX4n5UMnFdLnWWXVQFUnLoPRoT+CoUqVHczXN0BPWFr/deUHw4vrFeM4xbn4=
X-Received: by 2002:ab0:1ec6:: with SMTP id p6mr7497653uak.113.1610654102281; 
 Thu, 14 Jan 2021 11:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-10-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-10-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:54:36 -0300
Message-ID: <CAKJDGDaP4sC9e8JGDORbho_c1s3wUXiB3qBWHAtctw0gJpxjeA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gitlab: move docs and tools build across from
 Travis
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:46 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> While we are at it we might as well check the tag generation. For
> bonus points we run GNU globals htags into the public pages directory
> for publishing with the auto generated pages.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
>
> ---
> v2
>   - explicit disable-system/user
>   - add some comments, reduce size of HTML dump
> ---
>  .gitlab-ci.yml | 28 ++++++++++++++++++++++------
>  .travis.yml    | 16 ----------------
>  2 files changed, 22 insertions(+), 22 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


