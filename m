Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B61436B6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 06:25:54 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itm2y-0003za-Tu
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 00:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1itm1t-0003VY-Oe
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 00:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1itm1s-0007aN-QJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 00:24:45 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:36086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1itm1s-0007Yg-Hh
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 00:24:44 -0500
Received: by mail-lj1-x241.google.com with SMTP id r19so1378538ljg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 21:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgYLu+ecg66nyMT/dA5S1LUeTMvzdK1H3FONJ7AyROc=;
 b=f3vyh+5ZgceYKQQyxzLb4gmkImYWdKkM0xltQiqFWpjEffUgjMsbqapuPsS/j8uJxU
 AxllYxGd6N5YLI2e5CaS9eY6Z2Asp+9i0BS/1pv99/KPLYAdzuo55lTpGEfCtBkG8W8Q
 WPwD18qZwdfvzo6mkT8Fl57zss2yZ+L/wQZRJYPkonOkRLUoAookykFzhR3xUeoh2MLE
 MJY/g82nho9V6fzRBJnMEA4vNaf1DNvgpuV9vHbCX3gLx4hfaE6q3mw8OI14DPPin69v
 cin7zhlGTLbWSmmrLvJVp+BW2GtFb6Jju3gTUxpmpxbxYdY5Gx96rhiF+7GTZyUNcm9U
 TRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgYLu+ecg66nyMT/dA5S1LUeTMvzdK1H3FONJ7AyROc=;
 b=JrKrinmH16r7jclPPRbmMPGLw9bGk6RIaFIMeojHRL9H5ZdUz56RTHfAbdi67AwaVx
 AeVebBWB+M/jtien/zzIvcIDs4NBwqOXydHnHb0w1VHegCaGJUhsUPxKe1+clhpaAASM
 PZXlc5oPaKemyWhfECOnfhPRX0hPn8IzMEStrtvHvPCKMi5UkHsQMeUNjOxQuF/Hq7xI
 hgmnlWFMXGA1+0ufDdgqPJ79hO6gJqNc//ytLSm9zrh5r8qYCWwvz2o2+sNfBmY6HkMj
 wbivW2jNY0j9U3pJdGIM0r6gZc6wccpuXfWA4uNWh+7MCusg8oX/8pH8366Wn//Djt5b
 RrgQ==
X-Gm-Message-State: APjAAAWxVtt/XBxSmOA22upfz3USOM7doC6GoSCWj9rBdbxaKK2YuVWd
 LXzq+wh4VMHOxg+6kdxn/ItgdVT8VGD3L41+wOA=
X-Google-Smtp-Source: APXvYqz6Si8v+Rz96isOeLxdA5fFyUwBxS2XQdL9a3GyH675Hg8/hpo/nw7c44Q/BsjIj7jQZvmF8JDfWQysk9EgH9M=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr15081347lja.204.1579584282336; 
 Mon, 20 Jan 2020 21:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20200120085817.7000-1-ianjiang.ict@gmail.com>
In-Reply-To: <20200120085817.7000-1-ianjiang.ict@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jan 2020 15:24:15 +1000
Message-ID: <CAKmqyKN+B_WgRcS5Vg3MKk6Vzc6Uq0OAdW6+W9kzMw5add9bwQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix defination of TW bits in mstatus CSR
To: Ian Jiang <ianjiang.ict@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 20, 2020 at 6:59 PM Ian Jiang <ianjiang.ict@gmail.com> wrote:
>
> The origin defination of TW bits in mstatus is not correct.
> This patch fixes the problem.
>
> Signed-off-by: Ian Jiang <ianjiang.ict@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e99834856c..fb2e0b340e 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -349,7 +349,7 @@
>  #define MSTATUS_MXR         0x00080000
>  #define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
>  #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
> -#define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
> +#define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
>  #define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
>  #define MSTATUS_MTL         0x4000000000ULL
>  #define MSTATUS_MPV         0x8000000000ULL
> --
> 2.17.1
>
>

