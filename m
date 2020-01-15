Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70713BA0D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 08:02:47 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irchS-0003cu-Dc
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 02:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1ircgg-00033P-03
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:01:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1ircge-0008N3-QN
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:01:57 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:34020)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1ircge-0008MC-Lj
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:01:56 -0500
Received: by mail-il1-x143.google.com with SMTP id s15so13964376iln.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 23:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/7uM1z04a3cmQI7L3hhEoytfKbw7NDu/46ErD1QMcA=;
 b=amioCn7NJhCGrwcpTU910RlYDxJecsyywDeWeYf/+qelvxgzk9SfQix9539CmfVIQz
 HDWfp3diTUfzq58N2EWbX7B6aklJ6912Zgg4W7WASnHEugClPm5i54ChaaYuMgKOushE
 fiqdzypnSewnYuFVhpoe2Tpzm2HCBm/6sDLJKAsuTxs2vVoi4npohv0oedTs4kx17XLW
 wycPZkhpP3m/McwxHWwi3KxBXsj91Jq+CO10Dxv7OKmQDe82x7J5KT4fw0/aHr954ZNT
 NLTBwYjj/3PT96gRGB3MFm2i9gJuPTghY3hHN5ChH/obie0NVR5DEenQYxE5eBhjXIXh
 cUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/7uM1z04a3cmQI7L3hhEoytfKbw7NDu/46ErD1QMcA=;
 b=R+UJCzttZ6gMepkB5JZG5KacF98hUtW1SU3HCj5tCL1PaHsplGvLHsMF1Rip0OlP6Z
 +1af2StdjK0t4xwtMzw91Zok1QkjimUFfKuBDP+zCg73fSxW2UZWQsOKt8G89dtTVYO7
 fpy7JX6M1pT9a0eA1Y6c+KRZs406IIfAiJsyksP5eXUyn9uzQjULrCoJ8ca1BTpVx8uE
 E4lKPBqjR2MdTFANXvMamlKEL1Lk/4b5khKSwAn2G5s5xHVbIEt70r+OphvMpL5iPk4+
 WgQ/BiZj8i5si2CyC0rJVdKj+O7dYXyEf/O6e76L/jv8bG301XF3Pe+XByK4vtmA5IKz
 Mxpg==
X-Gm-Message-State: APjAAAWdPYiRZYJepAybUteRVppvdPtwDqU/inpdrXbqe8G9la5RMjK3
 D0rl8zJG9H7gOWHmokuj7pDCapTOMyWsN8UXZYA=
X-Google-Smtp-Source: APXvYqy3J8ybuwtxsWN+LG4LNJSTScxT39U07ILhL9TKthH1bd1VBI7CvAQ4fcYS48CKLig6QtNtHnWaEJv1l8yl2EA=
X-Received: by 2002:a92:d2:: with SMTP id 201mr2379225ila.22.1579071715238;
 Tue, 14 Jan 2020 23:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20200114210921.11216-1-richard.henderson@linaro.org>
In-Reply-To: <20200114210921.11216-1-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 15 Jan 2020 08:01:43 +0100
Message-ID: <CABoDooOCOPzKR5N6OtYecZ88jUSpVk2Xp=bXoutfjGvuGE5_MA@mail.gmail.com>
Subject: Re: [PATCH 0/3] linux-user: Implement x86_64 vsyscalls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::143
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 14, 2020 at 10:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> I vaguely remember someone (Paolo?) implementing something like
> this many years ago, but clearly it never got merged.

That was me back in 2009:

https://lists.gnu.org/archive/html/qemu-devel/2009-07/msg00881.html

Glad it will finally get an official fix.

Thanks,

Laurent

