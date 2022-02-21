Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B24BDAB6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:58:28 +0100 (CET)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMB51-0008Ex-EC
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:58:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMB1s-0006NI-88
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:12 -0500
Received: from [2607:f8b0:4864:20::1132] (port=45346
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMB1q-00027E-Mo
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:11 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d641c31776so142880537b3.12
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kJ44wSfSehxy+YyZNHGh4CZ/JS/CGXR9xhtjgqmdt8=;
 b=e9wntwBN4Rzp4MoeeyQwKpqzJMA1Z/87sARgA6jwkZIZmE+TuwqaPV/AByChrp39vS
 Q59a4XVSgJTtF2GAwkQt+odrSGep8KPGz/C6SQB1m+nM4j/7c1h8uRP1kSRou2kq4nMs
 f0z3vkUIcm0ac6f1Lp1VpAQvd6u/aHL60PeLMn27DiLs6Gahei1stf4r+vx9RKsNA8pd
 rpY0CG5W8akQEhmvFL9IpUXIVA5sQWJAxweCBmLdawGiQPeWSuiR7/ak7AqWkItnNKLh
 6lPe1o6JKnhbZuuZV46vrb+d/1utS+bUhtWwXXQoCPCeanHE5OLm2ddchXZr5ltWPozt
 zVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kJ44wSfSehxy+YyZNHGh4CZ/JS/CGXR9xhtjgqmdt8=;
 b=GN1Z4OknMOQJWiXnJDnJZgsZgxNu3rk9Eqi9wFMunQdlYzFiigtTneL/Xcd92wwR3Y
 bw2KEHKxghu4aGem2WITs5Mil/QR6gXIBYebBJ2NTWHv7ykM5lADjQAhuqVcigClxZe1
 69yAGGJ/iIFrzzFhLa3ixPzjliooqcPNa9g0vPhDQWPpk0zF4qs3fwcGgNB4XrEfso41
 Blb5aJrOojaGpi+f/i2IqoAw1sJ9oAGLmgxrOJe+Ahq6IOXY6kmU/upOgAlceCYt0V3u
 8NBCXnmpPrpBuY01kMLORNI2kDj23LBVps75tv/jl89cZnbnLyNMW01Wo5HjQ6Rs/AQw
 HeBQ==
X-Gm-Message-State: AOAM531UVWH6PyeGuduY1iXuB2ej2qa9YI6DE9RLY/JZ/3j0ZI3q/xP9
 l8ihnV/Q6ZaImu3CyRcq6fCxP2Qw0GtjVJfDyCH8Mw==
X-Google-Smtp-Source: ABdhPJyWGqpzDncoOv6+6MQgsNf3U5/wNuCjYcngaq+djOXmgPgBltyZLyraGkS7sQYblISP93r5Uc2vO9kUG4taaPg=
X-Received: by 2002:a81:1006:0:b0:2d6:e14a:ca72 with SMTP id
 6-20020a811006000000b002d6e14aca72mr12367340ywq.455.1645458908542; Mon, 21
 Feb 2022 07:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
In-Reply-To: <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 15:54:57 +0000
Message-ID: <CAFEAcA_JXxiX-k_bu+uk9SpewxzU4qOPmTE-eVVZ6-gDTN9P-Q@mail.gmail.com>
Subject: Re: [PATCH v1] aio-posix: fix build failure io_uring 2.2
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: Haiyue Wang <haiyue.wang@intel.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 15:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> So the QEMU add_poll_remove_sqe() function would do:
>
>   io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);

__u64 is a linux-kernel-ism -- we should use uint64_t, I think.

thanks
-- PMM

