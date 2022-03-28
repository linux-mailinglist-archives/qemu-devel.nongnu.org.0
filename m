Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DE4E98A9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:49:17 +0200 (CEST)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpkC-0001UN-UK
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:49:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYpEk-00048V-Ii
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:16:47 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=43788
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYpEi-0005Un-QO
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:16:46 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id v35so25909355ybi.10
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DLkdz0V/hl7pCwokIEg7z7bgOwF2a/LFOZjgc0AZ2U=;
 b=HVK6WA1zwxordU3dNjCxpMBwUYvKmUkBnJfhUrE4v8Ul8s9ju5E8mqzYDsSiS6B+4k
 Armb7r5MbB6QqI5ioFOrYiE98zE/I3oGeTyJpO/Gb2Ql3fhEzokz4cELjRiFVqidVvQ2
 20bZ6XKK1XMyZgK8HgmXnqz1sFF3rozS6yg8YvsEU5qOs1NeaI1jXU2jwGA3KhMJ3+E+
 3HEyB6bBJHS+tPDH25JtPyMhZqOZd7fVO+HpEMz8LL/1wRidIJJF9brP1WXRb+kRyzem
 ZbkZUDR/NOz36Wjwng2Bb/GU8h/eZBYUCgYccHwX3s+whITUVX+4gUGZWksQDeiQOba4
 4KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DLkdz0V/hl7pCwokIEg7z7bgOwF2a/LFOZjgc0AZ2U=;
 b=Q2jgaoxUX7JSF4CzHcuCG8+XMtyLbx8pCp9zAU4keIPv9whDmnT3V1fucSAd8hNdw+
 +SA3H/eBM6XRpAY0AtJfQeFTouXR6zceRKO3Ck9NortGCucXzA7PU4sZXlcM93YG8IPE
 zWFn3LwK9k4tyhEUIPFdPoaZ+h6LL8gltedKNHbu6tOOgdPq6F5/sL/BAI0eWUwJsVaZ
 DGGnW46gxB99CgDeJ47iKN/QK5OhCMb3cBhO5WAz+LCRSgoWj94VDD4kEm1yuj1UqZLn
 EDeWscaPbLHIq5D1wtVaHoZq7Gp7djy1S+mb3u3fRuOMUQeLLJ7lbvZHcW1zDIH9bhtZ
 DV+Q==
X-Gm-Message-State: AOAM532uZ0ZIXePzYI/YMPd9xiGypYtSRG2uVH/hDWRZgB+lOCqDvZqK
 nMd8gG5fO7gQg8LWPh1EgzV4umvzTOnrhDh0js/+iA==
X-Google-Smtp-Source: ABdhPJwlO9YNLpniRSjIpUEMFfW/A5S71DBwalVJ9CX876ChT6kgAg6nGEVQIlVOwD8T90xI5NMOzSWI2OggaKyjinc=
X-Received: by 2002:a05:6902:1147:b0:634:6e83:70b4 with SMTP id
 p7-20020a056902114700b006346e8370b4mr23440871ybu.85.1648473403899; Mon, 28
 Mar 2022 06:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <149i84ajr3d-149ji23ysx6@nsmail6.0>
In-Reply-To: <149i84ajr3d-149ji23ysx6@nsmail6.0>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 13:16:29 +0000
Message-ID: <CAFEAcA_-ZtiJwO858DBXGw5iL_Cs1XKNUqQT0mKypDkYm_j4NQ@mail.gmail.com>
Subject: Re: Re: [PATCH] kvm/arm64: Fix memory section did not set to kvm
To: liucong2@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 13:17, <liucong2@kylinos.cn> wrote:
>
> thanks for you explain, I will learn it later.
>
>
> in the scenario of rom bar size 8k, page size 64k, the value of
>
> 'size = ROUND_UP(size, qemu_real_host_page_size)' is 64k, kvm_align_section
>
> also return 64k bytes.  just the same size as the size of RAMBlock. I still
>
> did not understand why it is wrong.

Because if the size of the memory region is 8K, not 64K, then
we should not map into the guest 64K, but only 8K.

I'm still not sure what exactly you're trying to fix here.
The specific case of the QXL ROM BAR we already have the fix for.
Is there another specific case you are running into ?

-- PMM

