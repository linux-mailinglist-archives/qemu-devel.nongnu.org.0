Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC0E73D1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 15:40:10 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP6Bk-0004Ac-AH
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 10:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iP6AY-0003Mc-4S
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iP6AW-0001qR-PN
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:38:53 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42339)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iP6AW-0001q7-Jh
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:38:52 -0400
Received: by mail-ot1-x344.google.com with SMTP id b16so6794043otk.9
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2KeoQSDaeUXBZP+4dNiSnEGONnNU3yfXPQF87eI0wM=;
 b=DOZD1xDmS5jV0Zo2gtIbBRRTyXcFl1XWuwDBCN+d1x4xynqjXD/FmuVJaYbhxQf36D
 OomDaYUAUp3uKPUx1jd+m1wkplfE1yMrM/M2RQUUow8CvFZfSH61AFlpc8TkFc0SDXUz
 Ey4UuMrWpijBgnAm0JCV9IBEP36XSEd4i/YTbf7NexFbF/FKMxtg6J7VisoJ6v8RRKnZ
 24vnHi/SObH5s0p+VNbjInHTfgv0urnC3e1nsY2PRtYWLDwOQi9z2xIeBIrMb9uQWrgo
 7URRJvk0cphgHQCFWVZ+Jpwsvcp5JmhqnIsrLvdj7fdjPJOHPOW+XWTva13cFJBWIZzx
 rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2KeoQSDaeUXBZP+4dNiSnEGONnNU3yfXPQF87eI0wM=;
 b=aGSn1FsOGL3u8gxp5Nq4LcTMyRMrpFWc+6Db2ModdJ3N9SqsOmxdSYPzzFy2OD7a3Q
 h+R6HXnDJREhusX3AzRUDPJACOyZnlP/HaiCEsNbJZYWbY953lDdW9KC68K4yxtgLkgY
 USym1MB3ZcuL8ZfMnrVBMk5Skd0WB1n4E2d0nWSy6MQ500Ynf1X47bOe27O49nGI+62e
 ARtphiaN5CLWtK9u8JU9zFvO/TDdFC8JsXTdKQaukBkRPDSHl/PF2XSZNowpDWOHw/ku
 1pQWkoRlOTkfYeG20QCCwtXQBHD2pBsCD5xWG1hZOw+XKKOf3K0S/8W7DWIf3LY5Fb7b
 0EdA==
X-Gm-Message-State: APjAAAWLTvOFhPKfDIDzfH7548GIsBNhVikgJuqz+z+lcDA6lp/PDOVk
 2bOO1WumyXHmIgbaHCyKgtS5fYY7+Q9lqtwZ4dX9yw==
X-Google-Smtp-Source: APXvYqwuG4brMuW49kDBC+0mxvf6q3RtwqhZPtwZAAOfCsOxrGPd59StVTwqh+EpWDmzAwdeANoFeFgLF21gQbR/Hks=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr13171318otb.97.1572273531538; 
 Mon, 28 Oct 2019 07:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191026193824.11926-1-mst@redhat.com>
In-Reply-To: <20191026193824.11926-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Oct 2019 14:38:51 +0000
Message-ID: <CAFEAcA85WdNnMTgtr1LoWoutDGPjUh5TxxUNGOm3=wYVRvvJqA@mail.gmail.com>
Subject: Re: [PULL 00/25] virtio: features, tests
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Sat, 26 Oct 2019 at 20:39, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 58560ad254fbda71d4daa6622d71683190070ee2:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.2-20191024' into staging (2019-10-24 16:22:58 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 909c548c539b4136e3abf2377980dad6274c4c2e:
>
>   virtio: drop unused virtio_device_stop_ioeventfd() function (2019-10-25 07:46:22 -0400)
>
> ----------------------------------------------------------------
> virtio: features, tests
>
> libqos update with support for virtio 1.
> Packed ring support for virtio.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

