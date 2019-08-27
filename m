Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5659DCBF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 06:47:06 +0200 (CEST)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2TNp-0003Hj-Bd
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 00:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shorne@gmail.com>) id 1i2TKC-0008JZ-4r
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shorne@gmail.com>) id 1i2TKB-00056D-8k
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:43:20 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shorne@gmail.com>) id 1i2TKB-00055x-3P
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:43:19 -0400
Received: by mail-pf1-x443.google.com with SMTP id b24so13292605pfp.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 21:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TQv+ti99nn6QcjzMpDYmQHnFsyEGeexnezIGZ/VzKZc=;
 b=bYTLeb7MM2AtabzgUN/9ioC/Gt3RB79VY6KL2pJiCc0ukxbjT0LexobgkTdLUIG4j/
 Y0mXgpMIFENY+atmOOesJM2Wzouz9341mpBpB5EaeghWdL6b/w8mstwN1sjAGutsEU4Y
 kJS3s295ugfAyrkvTLL+v6sqmZIV5Zrz5JaEoEIQXH4Jf4SyDvS+V9Y1NqXNH0wiVeTS
 wvUtvu/U756D+XE0hSKJ6cQbqtPvKQWmK8ApC3jOwQ6s5NeWvTkaJcy4lyMxtBMA2nln
 bjZSQfFEUiXGuesBPwdKtgvp5ihyrvVKrgvVtch1LJX0O3UpM0VH9f4gI6Sj3FAo23kC
 ZvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TQv+ti99nn6QcjzMpDYmQHnFsyEGeexnezIGZ/VzKZc=;
 b=GiNwpx59pAJU8yBb0enV03LixIUh1FGk218ty/8ydfI+Ss3ThrMYAm2kVFILiICuLB
 1Gd8GIyr5ZZtu3IvGLZ5iJHlFBpg19PHWMjqqHe+UItFjOI18ULKNfpPUvo+GKQFplkm
 U6Poxnk3s8ryI2BYLJMYdTv4T9KfGsmZsrSMn8mKxWKf4uoO65BVg6sqPUg3EZTogZrr
 eA09DJQOBBePQWy08jrRb8DEZ4B90I5RfSjbGZ3BdtkCScCxDjNWbPwWEzvrZrsANwPn
 B0b4puskapuBlnHOiLWGWEalPoG9kdE1AE2/Qh0/mskP6rwTSV44Ot4enbzUMdY45zsO
 ozVQ==
X-Gm-Message-State: APjAAAVmAQLMb7Vb08OmfTkqRxnA9RXRaYRBJIzL2Xe1uBdfCn3T785t
 DB0IUt+NJ3xg0/VHk5eDBuc=
X-Google-Smtp-Source: APXvYqwxmRE+t+R77vP39rFk8mSlugNXEutpqPoDMe0EipLgsHe+f/UJ78Kne7xxuyCqI7DWGcnO2g==
X-Received: by 2002:a65:430a:: with SMTP id j10mr20127944pgq.374.1566880998069; 
 Mon, 26 Aug 2019 21:43:18 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 a186sm14510174pge.0.2019.08.26.21.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:43:17 -0700 (PDT)
Date: Tue, 27 Aug 2019 13:43:15 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190827044315.GQ24874@lianli.shorne-pla.net>
References: <20190827000745.19645-1-richard.henderson@linaro.org>
 <20190827000745.19645-13-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827000745.19645-13-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 12/13] target/openrisc: Implement l.adrp
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 26, 2019 at 05:07:44PM -0700, Richard Henderson wrote:
> This was added to the 1.3 spec.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>
 

