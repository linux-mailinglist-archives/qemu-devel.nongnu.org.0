Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D5699797
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:38:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNi-0003BZ-4d; Thu, 16 Feb 2023 09:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSfNf-0003BN-1W
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:03 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSfNd-0004kn-Dq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:02 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b5so2213495plz.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mZ/ADKBiTvAWO78SRosCTocaHFchCjCJFfT7ig3wJPU=;
 b=axNvz67wRIAcSG2aO7AGRuNcZ/29QvcG++/xJqsTASs4rUL4kvUzMK1rxTsA6WTmsa
 WwF19ML10UjI3KbtZ9r+37cmgFEFdaZlVlqRU7B/9EbHkTd75soRML56cs73q2F502k1
 fVGVu9zfBpb275Pq6Gp1shDLgC4wvzxihP0EpZzQeTRhCaVkDwFvXeahFIu5sSkk2+DQ
 Wy1Rly/2QjvxfJTIkP+/yrbIdoVpz3vxd1mxynBK+ojKjEji5UC22rRQswhdNL07TzSK
 SFCp8oZyZUziqynQ/ITvzYNpgZ2MP+8wzDnutL8QbkwhFHvOUW/lREA7oaKvJSV5c/hh
 GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mZ/ADKBiTvAWO78SRosCTocaHFchCjCJFfT7ig3wJPU=;
 b=gOeeUlKA3dpwCQsoj4Rsi0n/X4yKipgcMH8RwsJn98nfcqfBlCHkYPzrzFWKcvOpuX
 lp9o7D4v2IAWd/W8uFKu39mK6WE4n3+jB3cO2jWvi76LWrLdFxKm9j4+GisSnDOkHxxk
 ue8NCGP7cwF6qZcF3JCl0eMYFhmRT/aHye7xgFBQsA3XdG1QfNZzKbJvBpUlnBezBGEZ
 qinVcLyZe1upHMe77zhp6GOlHAaMU1yM5NwaCTbsRIahFsvPZ3WSySgzO9ZaxD5C1Ajp
 fFyrlufPezhqwUYxSN3C5RutTLCS3ur1nmx8Tk6yBdqYwxHdocfTwJe7bs/9I0hIdtCx
 IVYg==
X-Gm-Message-State: AO0yUKUfHAqN2xtEGt7kJQgYWIOYNjo8JFHJmRX3oISiqCDJ5tihywBf
 6RenZimiU/N5+F75eZOr+6QN86AksysomvGSUd4t8g==
X-Google-Smtp-Source: AK7set+evpd+dLsOmZqb0e++s2gn52AHweiJgqoNUwJeDxb+1pgFCX38BxuXmSLbvnImemjKi17B942bWLW35/S2tOs=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr668548pjb.92.1676558215707; Thu, 16 Feb
 2023 06:36:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
In-Reply-To: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 14:36:44 +0000
Message-ID: <CAFEAcA8dH+DDPHWg6xRmT=3oCu1rwyb1gbyVCXFTSDSzBrGg-w@mail.gmail.com>
Subject: Re: Runnig solaris binary(32 bit) on linux(64 bit)
To: ginu samuel <samuel.ginu2010@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 16 Feb 2023 at 14:30, ginu samuel <samuel.ginu2010@gmail.com> wrote:
>
> Hi,
>     I have a requirement to run a Solaris binary ( 32 bit ) on linux (64 bit).
>
> Since some of the sources for the binary are not available, recompilation on linux is not possible.
>
> So we are trying to run on linux using QEMU

> Following are the questions:
> 1. Is the user mode emulation (of QEMU) the right way to do this?

No. QEMU's user-only mode only supports running Linux processes
on a Linux host; it can't run binaries for any other OS like Solaris.

To run a Solaris binary you would need to boot a guest Solaris
on an emulated QEMU system (effectively, like a slow VM), and
then run the binary you want to run inside that VM.

Running QEMU doesn't need root privileges.

thanks
-- PMM

