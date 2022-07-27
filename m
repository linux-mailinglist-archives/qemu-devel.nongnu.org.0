Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35B582649
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 14:22:08 +0200 (CEST)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGg3B-0003is-He
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 08:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfyq-0000lj-UW
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:17:36 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfyp-0006Zh-9u
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:17:36 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id v2so2537263qvs.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FfdQi5tOETpAdmUoN/awJYJxpP0zg9vEqGNIhBMSGWg=;
 b=pRVqB+CKWNd8of2P/8qji8dhAtFC41hPktdyz13DXRw4KlV9DhmLkwTAGLiT3Udi9S
 QmcnKwOGojEx1glDCnXufLv5Fjv4nMY6PF8rBkZgpe+Pk6wJhv16pTCyehi3eoZw06mC
 OeGgvdDH37Z7cW6AHZSAIc8ClT0UVaf/OpmaJf7Ms8RgdOrgUVFuPZ4W/mdI0hTAqio8
 25PL1OEINkwSOGNiBeeRswLmW/5v78E/rZUFes1SGBv1JJ/03WvNzGjpEVSK492RMlzq
 D8zg15G3vRnGRUhHXxacN/tLAfkkVSnQCNyyhcmRJ5/9WcNlyVsmoIIl1DUxvK3eIXHa
 p4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfdQi5tOETpAdmUoN/awJYJxpP0zg9vEqGNIhBMSGWg=;
 b=x6Fi98DmF8OghPsxEM2/OsWIU3ncfZu9uEYxoP6HUwBS2w7iS+cW4JZ/28VS4hFHfh
 O+u/N/yOOYm3nhfyDR+1zblZUCtT6kFj9xCBAcOLVD8B3SoLCqORQOPUHrFPsbMGtwQM
 3NsQrrtat/WqyH+KclXQROBmNX8klRhfWBg0vZnprAh96VQk8RjgmfekgVANmGhC/zPa
 hmi3cIL/IgUQA3vVhxK7gNh8AAzbyuRr/RYTx4sg+VUuxjvkoHM4XSKg11Xy1h5hTP2S
 6aKsTo4wrXeSaPS8wAWcyPpO6x/Cyxa0K1zhgdE6tO3OCz6VZDTrL2x7S5H4QMODmm2P
 b5ug==
X-Gm-Message-State: AJIora+hyS0ySa9CEshkNYcWOulbnSWb9XaUal18cBNSaeg6OlE/jo+K
 QoKBGPXQyM3NNyMpfJpfDr/3jCSgi9BHnvBuuNg=
X-Google-Smtp-Source: AGRyM1ud70Txfv6cYN/M5FCfVZ4Tu6M3KB/+0nJX3wZL6Y81GLvv9jNfY4UkJArcn3LLU0FTWltkRniasffy4Tf/t3A=
X-Received: by 2002:a0c:a947:0:b0:474:55c3:21bb with SMTP id
 z7-20020a0ca947000000b0047455c321bbmr9765103qva.51.1658924253213; Wed, 27 Jul
 2022 05:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <YuD/+ehoLlwvzopk@redhat.com>
 <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
 <YuESQP8hEzJiDc7D@redhat.com>
 <CAEUhbmUW2nDnwFRfhCxNot3io7m3LRBAjk3xSbo7rok5977JXw@mail.gmail.com>
 <c596f6c7-d1d2-3387-5368-c79696c353d5@weilnetz.de>
In-Reply-To: <c596f6c7-d1d2-3387-5368-c79696c353d5@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 20:17:22 +0800
Message-ID: <CAEUhbmVNXVpyzFMwu43KVz0aDyaxKRtsD_mKReUDORtHU2caLA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable unix socket support on Windows
To: Stefan Weil <sw@weilnetz.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 7:45 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 27.07.22 um 13:37 schrieb Bin Meng:
>
> > On Wed, Jul 27, 2022 at 6:24 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> >> That isn't qtest, that is basic unit tests. I would expect those to
> >> be able to work with this series
> > Ah, I see. Agreed, will do in v2.
> >
> > Regards,
> > Bin
>
>
> In v2 you might also call RtlGetVersion directly instead of getting the
> address (that is only needed if we want to support old Windows versions
> which don't provide that function).

I can't find a way to directly call RtlGetVersion. This API is
exported by ntdll so we have to do the indirect call via
GetProcAddress.

Regards,
Bin

