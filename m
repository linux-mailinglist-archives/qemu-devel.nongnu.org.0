Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A21B0D78
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 15:55:24 +0200 (CEST)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWtO-00077d-Df
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 09:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQWhA-0003oE-2t
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:42:44 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQWh8-0003ev-60
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:42:42 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41744)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQWh7-0003eR-QE
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:42:41 -0400
Received: by mail-oi1-x244.google.com with SMTP id k9so8744198oia.8
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Iq5bUMxxLJDAUnu4KbPQ4sg/NUtm752Qnhd5fySRDU=;
 b=X2eclLwxSs4eb22eUyxRPOi/vm5DD8Doy3Y4WLIhvPnDJ4wt1xJxMsYR7DhCSy7fEy
 NDZjkYCKtl0I6H3dKYYqbyuBhbx/LWgRY24uDiM71/xfTVRGYlCuAltFO37Bd+6zGXZp
 s4CZD2rzbqs/WR5TDRImimMxPWECcM3x4X7CuWF9+5oQcQ0RSa/4kI7MvFU93AHEcbf+
 j+WDQ8qIcfuSKaEeul/Ezd3VEJ+LJjZ2FsmD06SklfIsVKcdxJOwMV11b4OESdv0pGtm
 qMCiJ7XpynKa2hTyyqvALOISJDbjb85QHT2xdM9uv9+6K1EH92nxvxK/h/jPTV9WIJOf
 3nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Iq5bUMxxLJDAUnu4KbPQ4sg/NUtm752Qnhd5fySRDU=;
 b=Omxn1CvoIvRe8yd6Pn0+135ZDJNom9eIR8IvLpPhS58pTxMhFayTatYKbkLSkQ87OT
 7Uv9WLmMWdLCs0zXcIMQAMiUhUI9e0aPDE2ocZAZhRFeyhQ9+6BTSSEeBCG77iTNA2d4
 n4avFZg7vxnx2OhrB2zTlhJ/qkI5ORd3y8VHc4KQYfCK6QZO8pcMGQBnfUUV4ufh4nGn
 sXp5TLc/4FAJ1w/Mfq0Rm/WJwyp2HdaMji4Tlr4f5caytYTBB237uu7xuHhYgz9XFPVl
 IJKMbaUqwcY6OVJWNUvFgwi7q/0p1o+PZCA8wk0mz7CNQLNN9FG4nBK3lHAA2PdmfOc1
 3v2A==
X-Gm-Message-State: AGi0PuZTU1uWAk1BcSfox1njW/aQ1IMv0QijhWi54ppmClPiLVpYs8lz
 Ny1qlNtkb5LeDHTr63ioEEo73t8Y9WN/2hGy0JVl/w==
X-Google-Smtp-Source: APiQypJQ4by6GZvkqOQ067+mIYg6KNqeHDs9Hh4Pc3VEEx3qiFiALljax1uBY4c/6p0ovCa8GGt2oTSG2qUB5q2prp8=
X-Received: by 2002:aca:3a8a:: with SMTP id
 h132mr10135139oia.146.1587390159511; 
 Mon, 20 Apr 2020 06:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200418062602.10776-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200418062602.10776-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 14:42:27 +0100
Message-ID: <CAFEAcA9s5yyiqzC0pB4FL-0iM=QTtj2ju=DaCepkR4gU5TGeoQ@mail.gmail.com>
Subject: Re: [PATCH] block/iscsi:fix heap-buffer-overflow in iscsi_aio_ioctl_cb
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Peter Lieven <pl@kamp.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Prasad J Pandit <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Apr 2020 at 07:30, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> There is an overflow, the source 'datain.data[2]' is 100 bytes,
>  but the 'ss' is 252 bytes.This may cause a security issue because
>  we can access a lot of unrelated memory data.
>
> The len for sbp copy data should take the minimum of mx_sb_len and
>  sb_len_wr, not the maximum.


Thanks, applied to master for 5.0.

-- PMM

