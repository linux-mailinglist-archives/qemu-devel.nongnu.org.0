Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D8F8CBF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 11:24:53 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUTLw-0001Bh-7k
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 05:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iUTKx-0000bi-KG
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iUTKw-0006cz-IZ
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:23:51 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iUTKw-0006cT-Cw
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:23:50 -0500
Received: by mail-ot1-x333.google.com with SMTP id c19so13795429otr.11
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zk4H5Fb2C9/OyHfKzcFu5lj/hifo+H6WMeqces/a3OM=;
 b=bxm4Yqpe5lSBViAYrxqkubY+oyT1O3pBXdugW0d+FbyJ22BPrxvBiT0nAPRtGCo09K
 jN7HRLUYxlzimyPxr8uTUnaDRnn8/ho2qhqthF+2jKpxZs+R1gi6sNKppH/SZkTgBFDN
 8GyVCxI6fcznbsItvKh4W0/Cvf1CaZYF2MEJ+Sj9+kbtjBRdV1a3LeRit6lyX/TYehPd
 0FIS50hbCs5WX6tcjN4rsqDrR8J53aElnFYOahgdrfcdGn/M3U2A0Q1+LF9WT5HXZZNy
 RbzG5sBua5iJccOPvHWJsJyX+fGXpcJs82DUY/tCvn29C1hRu0yjSCw+vYkoXR62oFbu
 O9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zk4H5Fb2C9/OyHfKzcFu5lj/hifo+H6WMeqces/a3OM=;
 b=Js+Or0TjMxhzObZkgGOXGmmuC7hkVH10t2ERRHuBkwmKGzwcbgPTBBZjY5QpVW9Bbu
 28+rETORf7W/AJjjqlQLj9oqRgWFBA94gFsUqNbngkYJ6YVVfCC5rsMVctgiGIts+B+D
 zZKVzfl/utb6jAtYE5mujlzjGOA1IEcFc+bmQ9e/kiAe5BTT3zpaBLHDdr9w/cv44M9n
 D5rOW5rOpKqERmmbHIVy+n11/4Cu1T3xV41IC5CfJF5qnzH5d5lvLlSpI4KAr7K7M/RR
 gcQmmyQUB2bjPPc5AfSvqbhEpYtDU+vzAdiQl650jY/xSQFvT02fIuq4t8gLXlEzC+6g
 v1uQ==
X-Gm-Message-State: APjAAAXPC2/0hXPKcnbtdi4QC8vexWtg1L9dhSLzlpgztXD09q3MN6zf
 QRj7LQvdHByzFcK4LQaVvmBPkV0AGkjm316q+grMoErxvao=
X-Google-Smtp-Source: APXvYqwGNI4exQRY9vSgmVyaguMl3vFv4cFCxoJtCDMkq2YlXxDCetB0GIfgzoQ1bkdQE3uubbImCg2sdXb/OlcuHLg=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr23319891otq.221.1573554229112; 
 Tue, 12 Nov 2019 02:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <20191101085140.5205-5-peter.maydell@linaro.org>
In-Reply-To: <20191101085140.5205-5-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Nov 2019 10:23:38 +0000
Message-ID: <CAFEAcA-xYWLzsfDAWWmEk4DhXcO5zqKVZMrRp9=4t9MBAasaMA@mail.gmail.com>
Subject: Re: [PULL 04/11] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
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

On Fri, 1 Nov 2019 at 08:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Andrew Jones <drjones@redhat.com>
>
> Introduce cpu properties to give fine control over SVE vector lengths.
> We introduce a property for each valid length up to the current
> maximum supported, which is 2048-bits. The properties are named, e.g.
> sve128, sve256, sve384, sve512, ..., where the number is the number of
> bits. See the updates to docs/arm-cpu-features.rst for a description
> of the semantics and for example uses.
>

Hi; Coverity complains (CID 1407217) about an "overflowed return value":


> +static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
> +{
> +    uint32_t start_vq = (start_len & 0xf) + 1;
> +
> +    return arm_cpu_vq_map_next_smaller(cpu, start_vq + 1) - 1;

"Subtract operation overflows on operands
arm_cpu_vq_map_next_smaller(cpu, start_vq + 1U) and 1U"

Certainly it looks as if arm_cpu_vq_map_next_smaller() can
return 0, and claiming the valid length to be UINT_MAX
seems a bit odd in that case.

thanks
-- PMM

