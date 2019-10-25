Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3EE4BD9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 15:13:22 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNzP6-00034T-3D
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 09:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNzNp-0001ox-5i
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNzNn-0000nO-U8
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:12:00 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:43360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNzNn-0000nE-Nu
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:11:59 -0400
Received: by mail-oi1-x236.google.com with SMTP id s5so1579160oie.10
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4FtF/4RymXGP+GbjRu/xpYgBRjIvKvuDkY51XwhESZE=;
 b=dKlrsO6zFUlk27nXgSUZZmhIWJGM0lmHYej6iSpAINnCpUVF8WBzxjhCjgidQcSuom
 sRwuUNg1WNXb8o/h2MeR/06RMjIbkiNoz5cEZekJN+AOD/3Cd3hp+s04qi/JDkZhxJC6
 fyJsKRQn8IkUJhxCbyZ8VBncyFkXL/YHkLfhcsEu/bo+spMsyWzKMBNzA6m0s8PB+12l
 QT5yIj/2dSw3hhU5egXb8BP/ZiH+MhuMjz28FGtEb3qRVGANwZf9kphBtvgrUTPDcv2u
 nZuyRGN77HufgQ/y7kB20qXF3Sox0MTlgjzuZI8ugnvV1BvDgOPgbRWn0QY6J2U+fd7y
 gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4FtF/4RymXGP+GbjRu/xpYgBRjIvKvuDkY51XwhESZE=;
 b=S5ZZEzk0+Db+ow0n8PJDnHlYN2UnLbcIhoe1Zjr+/m/oA4DJnGmodelrCSP3qpbpl1
 o0NvecEciX81Cgzd7pJsB6zK/2eJpRonrL2gRpRw/wGoOoZCcaiD2c30alCL3e02SbAh
 o6S0U1l1DrImEWiHQI74BJVSY4n80kPTw1KrsgJeAPqwyjaw3VsTxNUxRH7sUv7qrIT+
 lXHadbVB/l+9CIad0xwxkfpbqMVGf/Aldw79ksxuPb0EDELGN8pPNs4A0dkMMkeSDa08
 hkFKmYja/7nI5AIRBdk8UMcJi24K++QvbqZezhzV8V6UzspzzvBKHWqtvf9nBkq1u1wq
 QBwg==
X-Gm-Message-State: APjAAAW1lcCNOlewJAKnqNhuSNRUiv6BFYmwz5bin1NEO39TNuJlLrdx
 ZvzL90j4XdEeNq25wBCaHvAoeNfqqkvvgNgzi4nUJjN2p8U=
X-Google-Smtp-Source: APXvYqznM2UAnKOGdGT4UFHDvQV9P34vpDSIjc7dT1w8sY87Z3wu4jZYF+irxhzHc1iYMsab6tYGiKJzH4DDKG1n79k=
X-Received: by 2002:aca:451:: with SMTP id 78mr3028647oie.170.1572009118454;
 Fri, 25 Oct 2019 06:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191025121201.18485-1-peter.maydell@linaro.org>
In-Reply-To: <20191025121201.18485-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 14:11:47 +0100
Message-ID: <CAFEAcA9kbj_mpevw2gRBX9zxc3gTQhgN4Qp-2YyK3fmVEGn2Wg@mail.gmail.com>
Subject: Re: [PULL 00/42] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::236
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Oct 2019 at 13:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Changes from v1: dropped SVE patchset.
>
> The following changes since commit 58560ad254fbda71d4daa6622d71683190070ee2:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.2-20191024' into staging (2019-10-24 16:22:58 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20191025
>
> for you to fetch changes up to f9469c1a01c333c08980e083e0ad3417256c8b9c:
>
>   hw/arm/highbank: Use AddressSpace when using write_secondary_boot() (2019-10-25 13:09:27 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * raspi boards: some cleanup
>  * raspi: implement the bcm2835 system timer device
>  * raspi: implement a dummy thermal sensor
>  * misc devices: switch to ptimer transaction API
>  * cache TB flag state to improve performance of cpu_get_tb_cpu_state
>  * aspeed: Add an AST2600 eval board


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

