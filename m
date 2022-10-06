Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AAD5F6B08
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:50:13 +0200 (CEST)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogT8W-0007Zt-95
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSci-00023q-1u; Thu, 06 Oct 2022 11:17:20 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSce-0005ht-Oz; Thu, 06 Oct 2022 11:17:19 -0400
Received: by mail-qk1-x734.google.com with SMTP id a22so1199137qkk.7;
 Thu, 06 Oct 2022 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NloKOhLMCoYVdjRzNM4CC6u6VM+xP8Vqn+MEDxyy3cg=;
 b=En9ul84NSIsTAtC6ajGOokt0nzviGrMXHXnLBxpKPTPm1hicgJbNV2Q5NjvVrVrhsh
 qrTgKorFFzx75AMM6GnjUTNXNpWDazakVNINBQWacUDhRcYQliiSTs3TLk8X+MtS5JrD
 J37baaaiGKJNLogJk41tPZ3kXBFXiviIAreLtLDMUyaUA41gz1bxru04vR8qPvMZ3RQw
 J9iaxMnu9WF8XtXUz3Cln+EmxYLU4Lq+Yztwp7MvcJjgfnMMEmaburhR7He41s2fQLKA
 FPOtMPOuBzjt+JNhcMD6AyYSJO8RjXDuHhnXWWcV7O9U9ynf8/6xUqKa/j4RYu56udNl
 mZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NloKOhLMCoYVdjRzNM4CC6u6VM+xP8Vqn+MEDxyy3cg=;
 b=Ghg3IO0M4Hs6cxjKrv/QB3totrU0G4d40z+fOtIdfE3r+WZ55QoEGI/R/npB+MOWsD
 4IyFtd+BlPxTl7dEXFPYGrBi/zDk1HucXZzNVTOYqQW3TbWnDEilQqlpVT7OZtXmXLj4
 GFu/0E5KzjiJyuz5D7qa2svxSyQ27letZC60M7YPiwh7MtruNjmenQBTvrtA3fYQRNhx
 4GqNmi37aIijNNFzcyhY6ewvN2uwsYUd2EqMSqJHG7rWcDfNnP5KGJomxq+hewq2kiak
 5s0VQNTuxrcIzj5wr2wqzjSMADyFgzwvH5ZDRYDXYJnk3/ixeKaBgjubx7z25bYwxnDV
 MknQ==
X-Gm-Message-State: ACrzQf1Hg0HZwScYoJ+yqs9mx7r1WRKhLjPs6IXHFz/Kc+E4uRNn8ha8
 IkbKqbHlFz+fXKZ4L/8HQ8aZYKRDAAhv/rGtn5x7lw+W
X-Google-Smtp-Source: AMsMyM5bzLAW077CPQGcN9DuktWqQADd2fFWlnAz/Hs+6Bz6ink+vqeiTb+Xl8rpqipVbht/bHp7PcSdtjZj+vd9Y/0=
X-Received: by 2002:a05:620a:439f:b0:6e2:a440:b10b with SMTP id
 a31-20020a05620a439f00b006e2a440b10bmr485141qkp.94.1665069433896; Thu, 06 Oct
 2022 08:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 6 Oct 2022 23:17:01 +0800
Message-ID: <CAEUhbmW8TvUjP-Cyk=yHM4BaaX4cbJciNL3nPJyeJ88GwJG2Hg@mail.gmail.com>
Subject: Re: [PATCH 00/18] tests/qtest: Enable running qtest on Windows
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x734.google.com
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

On Thu, Oct 6, 2022 at 11:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.
>
> Changes in v5:
> - Rebase on qemu/master
> - Drop patches that are already merged
> - Use g_autoptr(GError)
> - Restore to v1 version which does not touch the posix implementation
> - Replace sighandler_t with its actual definition, since it is not
>   available on BSD hosts
>

Sorry, forgot to add the version PREFIX. Will resend.

Regards,
Bin

