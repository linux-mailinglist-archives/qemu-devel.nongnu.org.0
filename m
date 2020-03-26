Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303719498A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:49:15 +0100 (CET)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHZRB-0004HY-Vs
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZQ3-0003lX-TM
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZQ2-0004J8-Fz
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:48:03 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHZQ2-0004HU-6c
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:48:02 -0400
Received: by mail-ot1-x342.google.com with SMTP id a49so7427876otc.11
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VwTRuyh67zhKy36kTR6tjW++EUwdrEkMtctprYlY2v8=;
 b=WC7rKjnpwAoamR61hi7yiWrnjzW8JhGCJx9sVSKmNjrAWa2keYbLk9TTEcJL4rMaRQ
 PyH+gCHx/91SmnD8C5i70EEzGWNCxlvNV+XiQ41zRbrvvTb4JREPpLNLqn18cGO5nFLF
 X3/ImP6Futvd5FmEOnBXcMf/TE94d2Btu/7BKiPJhsNz1Wo8ECZy8ReJ80n55jcOvFfO
 sCmQ2naWx3u04UOoJ16SUxgcYmsBfuM8qwbQj7aBpBvx+BPC6qB8y1/9ANStfPpEl7f0
 1urTmeRmGydRszkzlirH1tB7AAaXUt16URZQYfmtpyfFTn9Xe0X7b6p8z5LCQkhYX8sW
 84TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VwTRuyh67zhKy36kTR6tjW++EUwdrEkMtctprYlY2v8=;
 b=UU0O5moE5+rBIC8mp5yuQHHBXtgHG0X9zwTpvsfbw54ZJ35/yOnSmyBRPnJTwEPIhC
 qaOqb/NTq9qIgcKpM1degGU3GdVDaQvmCA0V4ywRgUw963bzrZVwaJ0l6GkKVcBo7LBH
 OoUxwSJzFDKiahj0G2BWOMlsJ8yaSphE3Azeg6PKHDbNI94b/kCPfHVs8BJB0YB301Az
 BSG23ky2AaaITD/jPEFydlWv18n4xQz8C982BOPlfO/1c7LNZ5AuKhlYCNPp24RM5t86
 D0jne8Kr9IZzteCSt1qgLrlmNNJPmH0Zm3YUJM+T66AjSRE50/AqnZwy64j/8gCn8Ns2
 xdfw==
X-Gm-Message-State: ANhLgQ3E+Mdhv3Dbb2cSmY0kBn+wMSsxJf/7jm0OpG+7l962o7SwGRHe
 UhiNDwlcaL5epROC+nAIEndzIqjLDveOrUGRcY7Qow==
X-Google-Smtp-Source: ADFU+vsuKmeL+eAye0+MX2rU3Yvzxp4iW5tRSLJbHP2wP8uTCw30r9c9CyTN/O0wk5H4wtDR6fMiJS/Jq4sUtOCJt9o=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr7955332oth.135.1585255680707; 
 Thu, 26 Mar 2020 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200326203414.18140-1-peter.maydell@linaro.org>
In-Reply-To: <20200326203414.18140-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 20:47:48 +0000
Message-ID: <CAFEAcA_3xLS_f+u3Ka5fJTx_vQq+1Jxyucz-VG4hmsNpPHkJfg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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

On Thu, 26 Mar 2020 at 20:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Coverity complains that the collie_init() function leaks the memory
> allocated in sa1110_init().  This is true but not significant since
> the function is called only once on machine init and the memory must
> remain in existence until QEMU exits anyway.
>
> Still, we can avoid the technical memory leak by keeping the pointer
> to the StrongARMState inside the machine state struct.  Switch from
> the simple DEFINE_MACHINE() style to defining a subclass of
> TYPE_MACHINE which extends the MachineState struct, and keep the
> pointer there.
>
> Fixes: CID 1421921
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Rats, sent this out and immediately noticed I'd forgotten
to commit a change. v2 coming up...

-- PMM

