Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B724369F657
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpxf-0007xh-87; Wed, 22 Feb 2023 09:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pUpxc-0007xB-VG
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:19:08 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pUpxb-0008KF-Ij
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:19:08 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-536e10ae021so68744027b3.7
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xeXNeYsytf/Poa/WHVt4e0Q9fxA0xdexEIMhiC68Mv0=;
 b=LeIzqDFA/+0kCyr1aZ6xOhNCXkFhK8UrCSXG/20wyVVVKj+AnVkL9OF2tOdyO3XjtQ
 bHL2HyCYeDo1hGgh1K2L1F8iDQwaaiwr0LRbJEmgZaJNmVtNv/I2Q4MfZnwurzyGqUol
 ZSKQv7BupcpYlrkSjHbgflWYp+S/Fsc8CvJ9oTjnu5ZlqA4tODMlZs9cyPkjCO+yqrJA
 f5YBATAnH1CS6joWwGifWxjhxzYSale5P4kYACPAWYRtC1GQYXDOQaJO9DSlef20Pnu/
 W7Xze8bthD093vCZc1kLs3qC9RvM8vs4hXLUwOA69h6DCR48U0/lftu5Eh9ZRTVwsAlf
 hS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xeXNeYsytf/Poa/WHVt4e0Q9fxA0xdexEIMhiC68Mv0=;
 b=WARjxTWiMz7oiYSmGcgHM3TJ6upaq3ebQoG/qVU1G6xK6R+SYl2Ja+yOlx8H8+Ivpw
 s/cmjicBPChY/eCqaGihhkwZcgrP8SfcCTld6Ys1g1akp/LM+4NhOfz76G09C0twbri0
 QDY2dYGevbej99veVIEklUVdjSai/6fd2Jtbkoz+fTgKyr/UKIg6N8fkf98SARJHn2bX
 rSKfcJWV0DlQVI3305y3XfcU3ohmYuiUBadt/D2ISaKDu75NuFqcfe1Koi42NXs2VKfj
 MS+alpQ58vt+74alouJy+YUDzBytL/tbz2b62CCEtuePYTZkR5kSqACE4N0ayyZUUuwb
 k8rQ==
X-Gm-Message-State: AO0yUKXKsVsWVo76qMNPUq8OQwpqgKcVY9zP9gMVsLNGTHPT1jFuZLo0
 VMOpmccd693xK4MGWuV4nZo/v/jQyMsSZW5/Qec=
X-Google-Smtp-Source: AK7set9lXjP32ipDm15sJO2RU2Vo3t1XhKeC+sbugekq1qfzHU8bPJCJeXdeZqtR8D5jUdClD6u4456NCvBH7yDGUdg=
X-Received: by 2002:a0d:f803:0:b0:534:c231:cc2b with SMTP id
 i3-20020a0df803000000b00534c231cc2bmr1275714ywf.9.1677075546237; Wed, 22 Feb
 2023 06:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
 <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
In-Reply-To: <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 22 Feb 2023 09:18:54 -0500
Message-ID: <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com, 
 peterx@redhat.com, armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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

On Wed, 15 Feb 2023 at 15:22, Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> ping
>
> [add Stefan]

I'm not familiar with the Coverity models. Peter Maydell is the maintainer.

Stefan

