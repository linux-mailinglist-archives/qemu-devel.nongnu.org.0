Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BB1CC209
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 16:11:14 +0200 (CEST)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXQC9-0007dv-60
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 10:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saket.sinha89@gmail.com>)
 id 1jXQBM-00077S-1e
 for qemu-devel@nongnu.org; Sat, 09 May 2020 10:10:24 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:38376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <saket.sinha89@gmail.com>)
 id 1jXQBL-0006mK-1a
 for qemu-devel@nongnu.org; Sat, 09 May 2020 10:10:23 -0400
Received: by mail-lj1-x22a.google.com with SMTP id e25so4666053ljg.5
 for <qemu-devel@nongnu.org>; Sat, 09 May 2020 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUYUEwy8dLIv29gpzfiyhWf1G94vEClnolgqWqKZEK4=;
 b=WB3QgaVkNFVostklofx4bySLQFoAFAq/plQG97vX4A8EHlJ0e7EbCqB5qohJUAGh03
 WhERgQvQcG5gqnGfWHGlu4dScH6oMpabtvR7GfeEVtA2c8e/wuk53kiW8CpmvTAgcnLX
 uphjvrEI2X8ULip7RiGbcaOn5AKCMQvcnzTq+/m/hbDzjQk0i2Ov6N/Su/JS6HU1OJNM
 a8DYj4sn4uVLMG3m7bPmWBxJivN/AOScnlGUxWPZyXO5DRRyrjfw2DFg/5pkapnn1fdv
 /wNpJ6aYUfCPpcmkZObuAEoT32WhR8C8AdwFRolN7fGW0mWX6J/44Gt0UFLyPC0nTNbo
 2DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUYUEwy8dLIv29gpzfiyhWf1G94vEClnolgqWqKZEK4=;
 b=YWlXLRl2UaMHRPvaiSkj5tZzDL0SuNqVEbmE3A/HmIjxQ8dzTzFkQ6HikAhKW+shAo
 exc7Hy2bFJU/thXXUADP64ln6bwUH3V9p206nYItQ09X/JkDm5Dv7BQBDOR0YsiJm1ce
 dwjBL2IKredEB6Wk/yu5nAVNjgQj6UHcQm9bAcQHgdJ77sg/ofBe2JsV71fIYsvCSXPP
 yxMPf0Y42My5dnT+xw/jhQt8OlYcsoCnYiLd7UccsRH4fBOyQrHwfZ767O20BQMSbdf9
 oTj9H+OaFxV42xaW/Io9bQTr+QrX+2IZZ/LBPJt/wUP9EFMIl3QynI6Rcc+kd6mh3OU1
 sBkQ==
X-Gm-Message-State: AOAM531t01eJc5+e9qs1JDUq723D493dH7FoKOwqdu1t3o1+gHCpIQzo
 nuwQh/vVIjbvGIhgbLcq46E2/n3QqQxbPbHLJtg=
X-Google-Smtp-Source: ABdhPJwYhG+6G0WUDgBfFw4n3t4vQ0LxhD2Lr2rpz1f+FT3CMPvskMzIfwoUyRU4EA7f33U6TcAxAYXPVP+dZEsIpKc=
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr4805339lji.117.1589033421167; 
 Sat, 09 May 2020 07:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
In-Reply-To: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
From: Saket Sinha <saket.sinha89@gmail.com>
Date: Sat, 9 May 2020 16:09:45 +0200
Message-ID: <CAK25hWMj5PyQFZVN5AToHjdySvi6iZ4zjZeUJQR85jNgoeLeAw@mail.gmail.com>
Subject: Re: Qemu Support for Virtio Video V4L2 driver
To: Dmitry Sepp <dmitry.sepp@opensynergy.com>,
 Kiran Pawar <Kiran.Pawar@opensynergy.com>, 
 Samiullah Khawaja <samiullah.khawaja@opensynergy.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=saket.sinha89@gmail.com; helo=mail-lj1-x22a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As suggested on #qemu-devel IRC channel, I am including Gerd and
Michael to point in the right direction how to move forward with Qemu
support for Virtio Video V4L2 driver
posted in [1].

[1]: https://patchwork.linuxtv.org/patch/61717/

Regards,
Saket Sinha

On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com> wrote:
>
> Hi ,
>
> This is to inquire about Qemu support for Virtio Video V4L2 driver
> posted in [1].
> I am currently not aware of any upstream effort for Qemu reference
> implementation and would like to discuss how to proceed with the same.
>
> [1]: https://patchwork.linuxtv.org/patch/61717/
>
> Regards,
> Saket Sinha

