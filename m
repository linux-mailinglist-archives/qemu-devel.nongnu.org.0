Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AAD11560A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:04:22 +0100 (CET)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idH1h-0001Wx-Ou
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFpx-0003Tf-Mp
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:48:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFpw-0000di-J0
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:48:09 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFpw-0000cZ-Bm
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:48:08 -0500
Received: by mail-ot1-x341.google.com with SMTP id i15so6156975oto.7
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGxGqg7GQyaVMrHzLqAC9Yhmj/jnKys9PXUiHGz3F34=;
 b=iYT9vZ22yk1jeHBZ5scHCYoheRdjTO5CSHh4YvJ1oFzfXfkBHCZkqFoxNhwzJHyNfo
 QAD7cj7TwroE6CeyIP5LmYiqzSEyjgMbKKMvTk21zNLQ/khhQqRrKXe9OhaU7ghIPdWE
 kYtbKVGAgQa9qVyHjlvNfdLGLcIVhVIhUQNeelU6SzelP3tZ1+1uwo2wUaiK6JHUL/TH
 x8YBaUoj6nXUk4grnafrVmzIDJkIScLz+LI71moqWNXBhmmbEkao5sKWyt9OEPbrltZR
 cSF1ojvY1L7Q9rDMu8Qz5fY/4kVy7doCCmMwgOQgaL9YgnVv3x83Wl9K5dwctVE02M/q
 aD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGxGqg7GQyaVMrHzLqAC9Yhmj/jnKys9PXUiHGz3F34=;
 b=DPE8H8gm2oApYI0xGqpPXTpqYxLFf7EVVbI6NjpMKKEm5q062lrl9u906SIwJP32Ip
 fLNGGNFfUNsVM+h3GAl5lEBzG2XUhaZUEtE+g46IIRhuieja1l8lkIOHmQym6QEy6Q9I
 009cxOpUb17r34/HekBWgncRAjTaSACC4BHR3KTn5mbJzihIiiRGQ0l7QiYSBvkmpnRT
 /sYnpgBEv9juXWAWZPpJuLn6aHrWcKVa4Fxr7KXZXScIj4TpHuKXv3Ci05K8wuGZgouZ
 1oG70cQuFbdrJzH5F/OshGhuuvxTjALduj/iWf5WfKPetx1ziHdtR+aA5wtUtQxigJu+
 xa8A==
X-Gm-Message-State: APjAAAVm/OWwyU4OHLHRXvDZW2umqEuB/gpSWDaXggeUI1euQA69Hqc4
 TlISxwH5DbhOKgtDT1UtcE6iCNzpywfhATMrgKwhKA==
X-Google-Smtp-Source: APXvYqwyL/GJORA2Onuu4DMyrYwLhyPhAUHc/RORSoZE89GnrFbyLJJpVInNxCm/73wkOGfHwVg3RM/6GvhMNsIhRqY=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr10623162otp.97.1575647287600; 
 Fri, 06 Dec 2019 07:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-12-richard.henderson@linaro.org>
In-Reply-To: <20191203022937.1474-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:47:56 +0000
Message-ID: <CAFEAcA9V8m2Qmfq-eig0TCLkmckXxa3-POo2LBQOij5KnyaPZg@mail.gmail.com>
Subject: Re: [PATCH v4 11/40] target/arm: Rename ARMMMUIdx_S1SE* to
 ARMMMUIdx_SE*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Dec 2019 at 02:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is part of a reorganization to the set of mmu_idx.
> The Secure regimes all have a single stage translation;
> there is no point in pointing out that the idx is for stage1.

...until we do support secure EL2, and then there might
be a stage 2 again.

-- PMM

