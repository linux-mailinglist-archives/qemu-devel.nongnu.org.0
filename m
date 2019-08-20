Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11A9690A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 21:08:09 +0200 (CEST)
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i09UF-0001zO-DI
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 15:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i09J7-0000qW-95
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 14:56:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i09J5-00026y-CI
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 14:56:36 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i09J5-00025g-5J
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 14:56:35 -0400
Received: by mail-pl1-x642.google.com with SMTP id y1so3189318plp.9
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JXey3K8HHpDM8pTrA4soHw+gJbE6eLoaGQ3v0TyLczo=;
 b=PKw1EJB8b5neL/QKI55nCNO/RC6ZJ8SzxB/6eAfXkAe03yRNe+LoYX3KJnaWNErjEj
 1LRd2CbaQEryCLv5TrshpAjrqln0TvIYz0OdZz3V5ervEqo9GPeQNg+9WPs4asEIrtYD
 zIiwuKVYwr3ASyiZjlWaYfrW7sshEG6va+Zh5TMzaOdUjHFUN3sJ9KOwmE0rcMUVmn+s
 ofhkgMYdGlalQJb66FImWol20UbE04swD/W9jRA8M3kUVYjXcdQNxitAsmy5uQTa2Ypr
 1cJQN/4JjTR/3dz/U0zH8itpyUG+Ued0vUYxxKLbhOl585HTAI3ZKmQ4oWG5NJZoaVWH
 OlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JXey3K8HHpDM8pTrA4soHw+gJbE6eLoaGQ3v0TyLczo=;
 b=SXUccwh0MBdM53rJJuWHH9G+uAvbHgT8ibALZatT49iS5NkzKZZ7VeZ3JbRNhccOrA
 LiQU+1casksU3rC3o6ZYg8oL8Zqv6t1FuZDAPB1PLGo4IKicKiHQYvK72TgrRoKIGT0c
 l3NxCkQX6iMlvCL4YkiSOpjliP9mkBTX3mNZA019pL0w7ScVgKmhigbyr44wKrddPg78
 6WQXeaTduVivKck+dfLAJQUYg0f8fh53egQiz1aK9Hio1Rd8v7oYv3c8k6NzFpY9PNow
 vBr0Ypq8Pf/rzoaFcWdVI8bABr03nza5rFd67neZsJ2A0oVJDArM/fh4cqX3JS6wF2TQ
 BRZQ==
X-Gm-Message-State: APjAAAUjMPy2LLUg62A7v9rSCLhPbx8zK247y1l9frsoGM63iAEx8TNn
 j+4NRyQKQ7/TO2+xyjaF99zB+rnMhpA=
X-Google-Smtp-Source: APXvYqwckXYwndF6J7IVFSowso7lGKVdJGR9gxU5qR4jwOqZdnyhhPXfs/ozk8Bu+HhQmNISmXk6rQ==
X-Received: by 2002:a17:902:28c9:: with SMTP id
 f67mr30096818plb.19.1566327390287; 
 Tue, 20 Aug 2019 11:56:30 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p1sm21363363pfn.83.2019.08.20.11.56.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 11:56:28 -0700 (PDT)
To: "Paul A. Clarke" <pc@us.ibm.com>, david@gibson.dropbear.id.au
References: <1566321964-1447-1-git-send-email-pc@us.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b5a38b88-fee6-5469-623e-892e819fdfc1@linaro.org>
Date: Tue, 20 Aug 2019 11:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566321964-1447-1-git-send-email-pc@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH] ppc: Fix xscvdpspn for SNAN
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/19 10:26 AM, Paul A. Clarke wrote:
> From: "Paul A. Clarke" <pc@us.ibm.com>
> 
> helper_xscvdpspn() uses float64_to_float32() to convert double-precision
> floating-point to single-precision.  Unfortunately, float64_to_float32()
> converts SNAN to QNAN, which should not happen with xscvdpspn.
> 
> float64_to_float32() is also used by other instruction implementations
> for conversions which _should_ convert SNAN to QNAN.
> 
> Rather than trying to wedge code to preserve SNAN in float64_to_float32()
> just for this this one case, I instead embed an embodiment of the
> conversion code outlined in the POWER ISA for xscvdpspn.
> 
> Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
> ---
>  target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)

Perhaps a better description is:

---

The xscvdpspn instruction implements a non-arithmetic conversion.
In particular, NaNs are not silenced and rounding is not performed.

Rewrite to match the pseudocode for ConvertDPtoSP_NS() in the
Power 3.0B manual.

---

The term comes from the ieee spec, in that "arithmetic" operations (like add)
are required to notice exceptional conditions like NaN but "non-arithmetic"
operations (like abs) are not required to do so.  Thus a valid implementation
of abs merely clears the sign bit without otherwise transforming NaNs.

The code does match the pseudocode, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

