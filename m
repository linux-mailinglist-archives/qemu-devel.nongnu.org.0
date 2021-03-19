Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A93423EA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:02:14 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJRs-0002cz-NN
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNJOx-00029N-5H
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:59:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNJOu-0003bX-OR
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:59:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so11103289ejc.10
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KJHq3RERaMvNYsE2ObJAkwNV+j+Fd+aV9jB09QG+gKA=;
 b=lTO7WMHe7P5MKuzBrlsiTHdEFe59tqZUgrP+VETnJH8hB8u0QJ7nE/JHWWZGjF25ra
 4JRy9rJVBTjEVbeAdOQ0OhtkOkUzIJq12HYJMBY/UWLDS2yyt88o8yAu/hIweRny9ybc
 IIbTjrIZf679eiji31woZ8KzOjWwzr5fOJsoHhDgQu723uTW2Hjmaw1wmnhN1AJjirif
 Q6lgHkTK1QUFkHNuKoMibW700P94iMhZT8+IcXopAncFi9sbO+8ePed6iUNYrzCA8R8G
 OJpzDmiWVwC/2wRT2ttTpi0XWgB9t8Mxx1aMIojkAwI+3/6w+muV9MIT2YBxJVyf+Hjg
 d9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KJHq3RERaMvNYsE2ObJAkwNV+j+Fd+aV9jB09QG+gKA=;
 b=s9rFm7Kw8auezKO0ukxTH6faFkb9N2yBsmupir7rlBdXVpOsFNk8iIdH4B3nHnzAVd
 KySRRQXFai3opqjz8ZqcNgENrRukvN6VhaBQAzG0SGRryeAAY/7ejBymKPDOo11m7KWl
 dhZlvzwCj8oQsbJvRapD+bKJg8MTskitH6IggoDA38E5jSCyCU+VGi7LFXD8AtEB9sYA
 uIb2geII3pVPV6is8NShtcQfFiheel1LVeQf0EiLTbOf7mvwaSK5m6urxXlHLR5qyOCF
 QxETobtLNzA4WEAQKQYVJXlBKGubOtGy+S5j7rZaB45PlN9136BLuccBGYS2I7YSNj/V
 g1pQ==
X-Gm-Message-State: AOAM531a7Qh4C7kkb5RXAITV8MES05ByLMkxw8H2TSIyBwuoYpWJUDXP
 pPCUnAkplokfhU/ti5r+axhiCA==
X-Google-Smtp-Source: ABdhPJxkxAAnkn1xxiEB49kIl2EyL6KRRhM50dvy8FWPoIvtrXfUFgTUQfwkfiPRDWzTJgkEnuhIsw==
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr5799210ejh.408.1616176747272; 
 Fri, 19 Mar 2021 10:59:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id yk8sm4068409ejb.123.2021.03.19.10.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:59:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AB161FF7E;
 Fri, 19 Mar 2021 17:59:05 +0000 (GMT)
References: <20210317143325.2165821-1-eblake@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 0/2] More qemu_strtosz fixes
Date: Fri, 19 Mar 2021 17:58:53 +0000
In-reply-to: <20210317143325.2165821-1-eblake@redhat.com>
Message-ID: <87blbf9g9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: berrange@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Blake <eblake@redhat.com> writes:

> The MSYS2 build exposed a latent problem in qemu_strto*l, which in
> turn now causes failures ever since test-utils added tests for
> qemu_strtosz that depends on a particular behavior when parsing "0x".
>
> https://cirrus-ci.com/task/5180846782021632?command=3Dtest#L543
>
> Eric Blake (2):
>   utils: Tighter tests for qemu_strtosz
>   utils: Work around mingw strto*l bug with 0x
>
>  tests/unit/test-cutils.c | 171 +++++++++++++++++++++++++++++++++++++--
>  util/cutils.c            |  33 +++++---
>  2 files changed, 189 insertions(+), 15 deletions(-)

Queued to for-6.0/fixes-for-rc1, thanks.

--=20
Alex Benn=C3=A9e

