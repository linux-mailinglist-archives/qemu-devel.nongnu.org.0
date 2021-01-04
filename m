Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592C2E9BDF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:20:14 +0100 (CET)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTWf-0007zR-7h
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwTU9-0006EH-56
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:17:37 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwTU5-00039m-Qb
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:17:36 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r5so28090438eda.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WeBRAqHEBJcmnpXorbin17XGYb2UEYFAfftcfzYljkg=;
 b=KMMUi5nrNfcfUAyUH+l74fkNdKRyBzY1Bynbjgd7NX9QWplwhW55lfynP5vz5kLtj5
 JaDnVCbukqULvRvH6HJIGBxNiFjYcTSNoHICI6bGBzhBpQf3WueLS2U6gGp1PhxZmPOY
 bYZ02fhXxyuo1CsoBLBt9pfmuc1cS3yw4p5tqqOEwfmU4hmvcDKX3buD1hY33pUTt/89
 tVyyOeGuMyvR40h9RTQXzRvF5Co1oOHzrglndM/uYSjpYBE8kRroHeXq/9L5KK7zJyXE
 EwVqKPxiirl4eFGtRCRdWSxroXNxga3ImuLE6rpPkCC2rymRcVucnc0zieqEosbP4jOR
 YLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WeBRAqHEBJcmnpXorbin17XGYb2UEYFAfftcfzYljkg=;
 b=YmZAZRomE2RQOka0cOI7EBwWIKNYGe+yFpSDavrbGtMZGqiP78+n0GwjkLRGdbilYr
 SL3Qs4RZQgaePy5kyrB+C6HVUM72GDYdn7AVRERltU3wlOn1Lk3XNT9NxIysLgRY2QFP
 mMhnXAZW9c7cvKMujzJm+NDSDf0xKs6gOnIJ+jj+U/ODZWbE06l81aO4mFNfnEdxoWQ2
 aFRGNCtnqEnwmT9XPDiMv5/SqtHF0z8gYdos3/n6wXWrDn98/cEtNTUceBNG+HGCDLFA
 sV5uUdWh90Cf5SlGmIctVMiPhfPCDGgiXaPWzBsfBgjh3WqJMv4FZDPbx4PoSITEdLSh
 3cFg==
X-Gm-Message-State: AOAM530Mnzrj/SICLf/uBAK8JDg0ZEteqrY2OB2sR2Wj43obui7U4OGm
 WLm3/J3qtORPUYJGi059IpSq7e2ZmfUl03mfkjqp7Q==
X-Google-Smtp-Source: ABdhPJzzUZlhBhKJ+qgBXUKS+cYrt2eWF69YhvX2JRIv66UmZMzI2Motdz4vkRzKK5JjBBQmhdKqtNNEm544NWjp3U4=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr16884332edw.52.1609780651396; 
 Mon, 04 Jan 2021 09:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20210104142304.461097-1-stefanha@redhat.com>
In-Reply-To: <20210104142304.461097-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 17:17:20 +0000
Message-ID: <CAFEAcA8eFWhWn5r4KLKeJETfSzFGd48H9GCc0WCjP_H3R6RAMA@mail.gmail.com>
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 14:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 41192db338588051f21501abc13743e62b0a5605:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-01-01 22:57:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 593621f36b716eb091c4ec791db72dd4461789da:
>
>   readline: Fix possible array index out of bounds in readline_hist_add() (2021-01-04 11:13:39 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

