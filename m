Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B822E81C9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 20:18:21 +0100 (CET)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv3Sm-0001Xw-2c
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 14:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv3Qm-0000v9-B0
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 14:16:16 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv3Qi-0007ga-S3
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 14:16:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g24so18885894edw.9
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSseRuKR+Slu8vdeES5lQmRQKx5yXkkW+SKP84cz2NM=;
 b=c8U4BXNcVB7BECBA/0oqZHP03Ia+IxKiDPgQzFzgccQqCGHMvMsNxlxs0USxH8OEwA
 1k2yUhvBhB6/TTCWxSeuEjirVwOFQ3GtwzwMNwEV+F38SF3na7HbEh3S3ex0mn6bMk3i
 yIfGIKFE04NKteJcSrcMbx8zgk9lUQ1j3vOgKZzxGks/6evBJNp7NOU60g7a61CpX7uJ
 xUzB62S83g7i+dBkHCqlSPQn7gJ8ETt8p0mmWDn/6RAKkjCMq0LsUjju78i9TSCThX4n
 HTITr4DSI1RgO+VTg3qu1mgJoebj5yqFpVGKjviscudjbulx6wzk/yIxhIjpNY7SBlYo
 O1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSseRuKR+Slu8vdeES5lQmRQKx5yXkkW+SKP84cz2NM=;
 b=CDdEBQxTlnEn/48HrWn/1K6qEcQcjw1eKipBl03ynkJ/MuAPWNICPD0tl/+0jZ4Dng
 idzUKfAtcAfJjapPUhSQd7LbCIXIIOAs/Nh0rCqolJmtH39rpYURvqKqrQKaEIcdxP4q
 3B/4nHcTCq/CkJAU96XToY5maS+rnjmN3o6BdYH86tIIQrqOs0WR7dRjtWKY2QXggThs
 l7R2GV/iWQjgbJm9C6plTrbAuEkmO3PzmrZ5W2fn1qR67r1+mPzf6kQHM0/iA2ho4rHN
 KKCuDrkWydZEH+ZN+FpqTvBGEx70ai2OdUSFJhXmiajSeJPco9qdCjqiNEeu+Mss/7Bq
 KWGg==
X-Gm-Message-State: AOAM531Hx4t0TpMgiFqhPALUOmGDTsZfsnb281259deBnfvgCxTg4oSY
 UNOHfAvxQWw2lOZJAHXAN0OL/JdrGeRDdc0KrSDaEQ==
X-Google-Smtp-Source: ABdhPJxnCShUI6bxRRJqpbhj+Wb/3aDZqUZh8Pyt+5zv/HotGl3Wd9mUEaeo8CzuPpFlaEHLm8/5zXNYH1ASZDfLsvA=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr55780829edw.44.1609442169870; 
 Thu, 31 Dec 2020 11:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20201218104117.199096-1-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 19:15:58 +0000
Message-ID: <CAFEAcA_dCSyN3+dsCSQ2xDzke_eptosy+DH8_Zv=4yN8nMDMVg@mail.gmail.com>
Subject: Re: [PULL 00/15] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
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
Cc: Tuguoyi <tu.guoyi@h3c.com>, Juan Quintela <quintela@redhat.com>,
 aiyutao@huawei.com, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, AlexChen <alex.chen@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 10:41, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20201218a
>
> for you to fetch changes up to 36d0fe65160d83cb065de9b6fe60114ee127d9f0:
>
>   migration: Don't allow migration if vm is in POSTMIGRATE (2020-12-18 10:08:25 +0000)
>
> ----------------------------------------------------------------
> Monitor, virtiofsd and migration pull
>
> HMP cleanups
> Migration fixes
>   Note the change in behaviour of not allowing a postmigrate migrtion
>   rather than crashing
>
> Virtiofsd cleanups and fixes
>   --thread-pool-size=0 for no thread pool (faster for some workloads)
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

