Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151783006AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:08:17 +0100 (CET)
Received: from localhost ([::1]:47756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2y2q-0003w5-4C
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2y1L-000332-Ae
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:06:43 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2y1J-0006g8-Fg
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:06:43 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s11so6921194edd.5
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJKkrqaCvgh/3PONcV14evJME2wAxTbpPG75qi12edQ=;
 b=jQ3dfuCNdFIwaPaeMxL5pKuyMED7LAFqCq/fo8JxgJ+FqpCgi1fWeu1bQojT7HBPDF
 VLUjx02y2UCD+JuZIVnPqYLhy82Ravt7RX3UdFwTCNNGqKOTHdAyT2WX2XItwD+Mb1MS
 V7b7g+jDj0LQAiYLG3rYjzOWHK3hVk4kC42ITtjPbSck5q1IVWW0JkAJx1XeBfewsA4A
 y7Q3zHDlT/ow7VTGOl95BZrd2Rj2USzzD3nENhORv3b3m14guWPuF+VNPkS5vEymF7nw
 xCLKnfnU3NzUKFDlbywnZr72rt2eYirQpbeVphM2MQICq5UaDq2c8LkE3GQHbVQuYbuV
 1a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJKkrqaCvgh/3PONcV14evJME2wAxTbpPG75qi12edQ=;
 b=k7JzIu4IBHFXsV2ST+8JkpyNfAzhFuBTFWi+ZE9LlVjxjLODO+EPzc30qRyLDYZBJ1
 l8OrKs674QkVUBOtJZanS8QXV4duA2GJoQA9wgzmla9pmVzGGvOE8nQU92wMTDz6g2s8
 Gsr9K3ZWopcwd370klLYwlwVnPWkAA9KJ08imYD8atgz7NrlT1K0TubI7yz7SceOCSaB
 vXPmgDfwEZ64EhZk6dDthXi7JJ8PVykJm0HEpZNHxlnIhXQvDlfugR1iW7IxSQr5CV36
 Zq4DhRIidRs7kOtaaTRfHI2W8REA1lnNfbI9jOc2LFIhmehho44ijKR70g8bzlAyE4c8
 gtVg==
X-Gm-Message-State: AOAM533BSjQdCf3pT4O568fkFIGCTkAnb2mqr5hav6n+TPlcTSvNaWlH
 2UpWpp4Yxm4pPWG2lzYcC6oCyVu+aNgPvmpKlXFWcQ==
X-Google-Smtp-Source: ABdhPJxqXQEGsS0sBQeiYIS7SHB2RJZPH1ZjO4bdFwxTffZlvBdH0ULsSiwEAM4vIM2XPXtrOS6o/NB1Af5gzGjAB1g=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3526023edd.52.1611327999943; 
 Fri, 22 Jan 2021 07:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20210120174456.275312-1-alxndr@bu.edu>
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:06:28 +0000
Message-ID: <CAFEAcA8QNMiFe5p=-agvvnfFY_teMR3s-8AfT3OEa6GCK-Y=kg@mail.gmail.com>
Subject: Re: [PULL 0/7] 2021-01-20 fuzzing patches
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 17:45, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Hi Peter,
>
> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/a1xndr/qemu.git tags/pull-request-2021-01-20
>
> for you to fetch changes up to fae446ae7b6f746377186b3e19fd3f732a8b4325:
>
>   fuzz: add virtio-9p configurations for fuzzing (2021-01-20 12:30:26 -0500)

Hi; some of these commits seem to be missing Reviewed-by: tags;
for instance "ignore address_space_map is_write flag" got a
Reviewed-by from Darren Kenny, and that tag is visible in the
(second) copy of the email for the pullreq that you sent to the
list, but it isn't in the commit that's at the tag you name above,
and it's the commits in the git repo that end up in master, not
the patch emails sent to the list.

Also, are you in a position to get your GPG key signed by
anybody else? I appreciate that that's pretty tricky right
now given Covid, but if you have the opportunity at some point
that would be useful.

thanks
-- PMM

