Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B50155734
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 12:54:02 +0100 (CET)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02Cv-0007lw-G0
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 06:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j02Bv-0006mx-Bo
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j02Bu-0005gN-FP
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:52:59 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j02Bt-0005fB-AT
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:52:58 -0500
Received: by mail-ot1-x344.google.com with SMTP id r16so1917607otd.2
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MN/OqGK1IQbiS5ZbKwMB5LeuO+WjhCQbCIPHYneNIC4=;
 b=rfkFHCLMb+H3zTVilR5CDUgWV0MFa0E4O1XbHLZhnbp87vH7TNYA9xX4xgmhcX7Qan
 qUQoLItnfLPB2Yq4kfrHu7dcPUMc/JroSKmNwN/mSblpO4+nqYOljKwRTXp7LMpJNHcA
 ymOCWJTBlm63zZHJrOo/YWjxEbGMES81+bcFzRTcH+BJ73M3FGVMFjkrYUNO2bzKrfZt
 vg82jW5llUn5GPnD0WUuWCUQm5avI0I7WQdmuy5WV+iwYs989cn/GYbT9dByy0dJPB+3
 tXVRQauuJRIOLuz9+FZ6molsL5VxJY5opRJWVOOq8qpQK2HtALl6zDgnt4dkKbYyMrmL
 TZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MN/OqGK1IQbiS5ZbKwMB5LeuO+WjhCQbCIPHYneNIC4=;
 b=IphDjAQzopEDQKoQ3C23vaQ2k7UQVUK0Jp3tlkTLOLrSb9NOQDo7Vu9Gjfm6zms60A
 HoKNrIjiKr3O5Hm2ngqlmqHCVBzExnnCO3ca2oBWcdGKBfX91ZIJeq/B7KIu2I3Y0ISM
 0bkheOX8/+R1mJMKGMVjNU6uPQ+bbSg/9o0ShGiOS2b2UXhuOINrpcTLSBZBd0TkXqq9
 QdjiIU1GuY9g68OnVIrwsmwKTPqK43zCLbHtZCnLRIendOzqDdYkBUmjNsf9WKvj41b8
 ldKeeNZ+dzj8RckNjrIWMPGCW12Z57XGLKHVYGwT8QDqvSwrfxNHtSj2nrzpaCHyicRO
 CSQQ==
X-Gm-Message-State: APjAAAWgeolt5pbng75rJ+EumxcqEnk+LZx6JpA28sj78WuK4/0sVThD
 epl1fB5jlwE3UqwBOUeBIdSMIgT5y3oWJ/tLSMhET8Vi
X-Google-Smtp-Source: APXvYqwpLyeXXuJglWEnMejBnX5l2PfqK15FXG8jUVizc/2sLhpPkS+2w5r5LOmrXAAVfwD66XMf3usZELr/GfYgjck=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr2448271ota.232.1581076376661; 
 Fri, 07 Feb 2020 03:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20200206105448.4726-1-richard.henderson@linaro.org>
In-Reply-To: <20200206105448.4726-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 11:52:46 +0000
Message-ID: <CAFEAcA83vHKOYdxnAG9ouF9OJTGh+3z_RuB1yEc6dCpErZ4pZw@mail.gmail.com>
Subject: Re: [PATCH v7 00/41] target/arm: Implement ARMv8.1-VHE
To: Richard Henderson <richard.henderson@linaro.org>
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

On Thu, 6 Feb 2020 at 10:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 7 has one more tweak to the vhe tlb flushing
> that Peter asked for.  All patches have reviews.
>
>



Applied to target-arm.next, thanks.

-- PMM

