Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7B33EE76
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:41:01 +0100 (CET)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTbo-00042A-AP
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTZL-00039t-3A
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:38:27 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTZJ-0000Ww-Dm
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:38:26 -0400
Received: by mail-ej1-x633.google.com with SMTP id mj10so1763201ejb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 03:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Lv+dY2bVMk3SkuMPbv6FVhQ/qjU/MvqW2FZPphULA0=;
 b=ZYYfiSlUfp27MIhG9eMA9vPCovKSrNvghGstCi4IphFpcxH8woH7v6hWsZ9EoQMg6a
 TM9ggKTv0gBMVzzZezeZiSWOQYbeDDcsc+EMpe5AS2Jne/m6ErOad+BlRJw/obO1ZPN3
 eIAr4OzviClxxHWIqwy0QT84MVeQN/KnRjXtoYEIWuubrXT82UKNTPCT9on7W5OTQCxu
 /1199znsXaJhXg7dUZI5+Rc5YLeWpl7VhFBpWEfJUCi/YpJKKA1GWxr4WJXvJ5n85zJk
 toK77lL+QInAUh+jcW/j+E7Kjym8z2lXAvLuEyKTD0CRLr/Dh1H8HF2F0dujxftTKUBy
 lf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Lv+dY2bVMk3SkuMPbv6FVhQ/qjU/MvqW2FZPphULA0=;
 b=ZnPWWgFJB+Mr9hGwbu1opPnWcrVzGqP/JjYPXOVEpNfBlDTpalDk7WoFCa7SLJjucv
 oV9iNEmquy/SOLriO6vcNTxhwTJ5pPs09m4A4WRUYG15xyHB17UhZtJJL/L+EL210/6q
 fjZ9neWb+O4PjSYk/EktCWZef+VJmm7+3WUdpk0mJMHfis84wi9i+NDaZIKP8Zt0OD1d
 ycsl/TvrHY4i6V2cw7c2rL1t8jbePaNd4v5CwI/2cgOPgrD51j7XMRWTZj6H9hnbSZb0
 AYiC0By4paMFN1eofRvujW/U8imi2xdgMAnjcDReRv1thRrspgF43p1IUOJbTvwDsCJQ
 G1sg==
X-Gm-Message-State: AOAM532O9ID2muO0ibktAscr8He1SoMT4YO6mwKWy2Y3hMybYgowjxCv
 GSRhUmnHOdA2YAc3DhIze0w/Z3be/LyhssJmWJmRFA==
X-Google-Smtp-Source: ABdhPJw67f/7IUWyDjUb0O0JVBC5wBIaJ81MPYkwFNTMP6Uw4ryyCS07/yLDFLxsmKGnXHF3zz2GQFkZyvKp4Nhyvmc=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr34296119ejj.4.1615977502815; 
 Wed, 17 Mar 2021 03:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210315201215.222539-1-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 10:37:59 +0000
Message-ID: <CAFEAcA-A1B+0FFbLX1Ru1eq7KSTROMXsdsodr+cTV+tZx18-Zg@mail.gmail.com>
Subject: Re: [PULL 0/9] virtiofs and migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 ma.mandourr@gmail.com, wanghao232@huawei.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 20:14, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit e7c6a8cf9f5c82aa152273e1c9e80d07b1b0c32c:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/avr-20210315' into staging (2021-03-15 16:59:55 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210315
>
> for you to fetch changes up to 373969507a3dc7de2d291da7e1bd03acf46ec643:
>
>   migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD (2021-03-15 20:01:55 +0000)
>
> ----------------------------------------------------------------
> virtiofs and migration pull 2021-03-15
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

