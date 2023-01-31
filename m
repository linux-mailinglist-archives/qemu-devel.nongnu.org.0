Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4C683198
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsfh-000506-MX; Tue, 31 Jan 2023 10:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMsfN-0004ic-Bo
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:35:25 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMsfL-0002Qm-QR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:35:25 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-501c3a414acso208220817b3.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LVEVjh1tOM4d8CD9HmE5LsrkAQtIbaf6oHxZzKhYESU=;
 b=Ik94ffZo3khUEmVj9ovQJfrfSQ+wrxu21z3fMduhQ1GeyHfGdm6ZqzPK3ho1DM3p/f
 kREtQc4ze2WotTCW+4hJyQai8ml6BjFGx+vCHPTJPtwgLB3KedAHyot3wZtuXqCy3ElZ
 evUacBNNVIzY1V1PIZhZljnPE56LPtkNe23wzSU9pPxXtSOl9E3pp/NOZnTzBfvL+HZ5
 5TNX12DZnxeK2rcJU0CMlzAnASrE2AEzM6QCJxHu94ZelRf1FDVn0kgoS6kv9t7/PpTP
 YoStf1+Rt/r0zg+rSIUq8GhcFUdiIhEFDpDPWCqPsyBrudUzhPX0vnDxiyjoiM7F34W7
 d4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVEVjh1tOM4d8CD9HmE5LsrkAQtIbaf6oHxZzKhYESU=;
 b=kiWcTsrnMmJLkJAdhenQYdSZErxVCluTHn8eUndASaFC/p+wTkNRURVmzW19yzGNyA
 LWGVUULqA37SAwHRtTvuDROLd4jl9MVaNC67E0QIsUl1/V+fJ5jKuErBOwPuynQNon32
 Bcp/UqMnXWTBFV+kO4PLf3xZlDhuFPUHfd/bVszcPX27I68CEWu9ILZ4szqD6kfVR2QV
 ngbY3W4pccV9TWgi3mPMGz2d8BHiGrceQUT9TNNem8O+jNGxT9MEXp8cy2rhGWrrnW3w
 UJlJADYDmG00/gnjIYUbVqbyMePWB9EAKC6yVIO6EmRwZexukuFWWBvS5RAl3mX1VqXE
 9swQ==
X-Gm-Message-State: AFqh2kq5wDJecTiT+hbqMenIpHsXwP9gDcBqH427xlp4dINppHuxmIcI
 O6oQlFZWSvNzpzB5zBYb8kJkmJLE9vaYxTnhd88=
X-Google-Smtp-Source: AMrXdXtzHgmysRxi2ebUSe35xZdd7+SY5pHSzUy/ilcBIoTJ7zHjnJbXdu3hABnUsTluZHaOGTwS0wDuHzG0nC7dzyw=
X-Received: by 2002:a0d:e611:0:b0:4ff:b3a2:5962 with SMTP id
 p17-20020a0de611000000b004ffb3a25962mr5758867ywe.111.1675179322281; Tue, 31
 Jan 2023 07:35:22 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
In-Reply-To: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 Jan 2023 10:35:10 -0500
Message-ID: <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
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

On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> Hi Shreyansh, Gerd, and Laurent,
> The last virtio-sound RFC was sent in February last year. It was a
> spare time project. Understandably it's hard to complete the whole
> thing on weekends, evenings, etc. So I wanted to suggest relaunching
> the virtio-sound effort as a Google Summer of Code project.
>
> Google Summer of Code is a 12-week full-time remote work internship.
> The intern would be co-mentored by some (or all) of us. The project
> goal would be to merge virtio-sound with support for both playback and
> capture. Advanced features for multi-channel audio, etc can be stretch
> goals.
>
> I haven't looked in detail at the patches from February 2022, so I
> don't know the exact state and whether there is enough work remaining
> for a 12-week internship. What do you think?

Adding Anton.

I have updated the old wiki page for this project idea and added it to
the 2023 ideas list:
https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound

Please let me know if you wish to co-mentor this project!

Stefan

