Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB6115733
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 19:34:40 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idIR4-0008WU-Rx
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 13:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idIOD-0007MC-GS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:31:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idIOC-0004yv-I9
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:31:41 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idIOC-0004wD-BS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:31:40 -0500
Received: by mail-oi1-x241.google.com with SMTP id x195so649753oix.4
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 10:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfhvuPbds/YLdg45NFJDaUPOSfgQsOz0YuW97XoiAE8=;
 b=wzOh1GZCC6uRlMeeFne0YY7MeoxZhO338dPIewV/M8axDwVFvJ4DvQ/ozHE6fSAgLj
 U79GVCUkEKTTxgagwQ6OcEorC4yX6CnyisGd1BhhXZdAC2ob/R1t+TW7Av4QALUl1bcr
 yuv14uBLSsn7BGnXlxtPSlbeqbkdiOaPyQqIDzWqQi85igH671lHJypnQKNZy2/cEkER
 p4FbuVQhNlwp9EotWlH3sJUU7DdTTNItl9+MBLor+K7RXI84+yzeJyQOpW9RZJhlyF8+
 AeBfOgE5d1U4veVLfp7J6GATzWV6TYZ497DbHtClXLTM4l4Bm1X2V14N82wgnXUSoYsG
 siLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfhvuPbds/YLdg45NFJDaUPOSfgQsOz0YuW97XoiAE8=;
 b=YyihF7H8eUV+0IoWdgpwhttvoI7IhQgkMpKhTwiOx1zLZLkkpcrzbJYRjyr9bRBxyW
 5b3I8e9FHFZIoaHN+c3NCzd29ClPmP2og4XUh5Ya+m9eIp2hrh+1q+KzPwT4LIUaKmXI
 YBCibcLQyZaS/L+LyWaVPXUf4NDDRowW/DTw0Tr+tQIzKlHlZm5Gylb9G4ERpAgDK42u
 XuNdC4oCfQreX8lVv5gX6gY4fI+2BFZ2623MwtoETExAEULpjTlPm3+mQmgmMZzUrviS
 ai+0C+v+R70ZhltoxFSnHewPygWNH7MWVwDViNUlBbfovCduuYfLBT73IFfJcUlBv093
 F8mQ==
X-Gm-Message-State: APjAAAXDn1HvMb/jQUDfPEa70oOX/i+Icd8/vRKjoqiBHIsUdK/q1H6m
 3FL2vVpeyIbAErUwtQt5TdKUQfZIoNZQW232ML3TJA==
X-Google-Smtp-Source: APXvYqybxLl6PeQEuR6peSWmI395y+PGco8HyXac0IuLJGYJNhvUGGAX6OMXztyskr5FF1P6h1pnvnDEnnz5NQ8BMDY=
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr13779767oih.163.1575657099595; 
 Fri, 06 Dec 2019 10:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20191203234244.9124-1-richard.henderson@linaro.org>
 <20191203234244.9124-4-richard.henderson@linaro.org>
In-Reply-To: <20191203234244.9124-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 18:31:28 +0000
Message-ID: <CAFEAcA9MVG1=x5LMYYeBZYh8-ZmK_JMe3DhXn1NT9G=iUuuo+Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Implement UAO semantics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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

On Tue, 3 Dec 2019 at 23:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need only override the current condition under which
> TBFLAG_A64.UNPRIV is set.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 41 +++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

