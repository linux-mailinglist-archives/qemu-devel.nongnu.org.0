Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87C46F26E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:47:04 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNVX-00009f-2g
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvNTZ-0007Ua-WA
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:45:02 -0500
Received: from [2a00:1450:4864:20::435] (port=44809
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvNTY-0007IB-DP
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:45:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id t18so10982245wrg.11
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATNrjhV0qYKrVraOxsn5NhdGIEnYY4JEkvnbNpmMSKo=;
 b=BdPQC9UmMjQhG9kprXqR8s/n/fS88uLe8FDMNxUMj6AgIM7+qqmL8froFskgmDKHVv
 29VbpoxaNg3xbO0CwEkdYQ6MFzRChsoI+Z24pgY+kSbPb4XHpVxaqMjyjT6Q1+JFEn5a
 AWpGJKwAVnoacyz+W7rPJZu7+hq+tMemDA6JxtIa4YW62vYfO4V03BDdQLFZONjBCJZI
 s/OiUeyPHUY6vlekdgWj4h08oNopxioRsSfEKe3i7CEPxHDHlq0gtBnE+Gngv2jdpfwc
 3iqycog+kPFz4hClTLQzuzZbD9SSNbDW5Xc6rMXZZFto/eWisyZm9sJqc2Z90Zyf8VHC
 zzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATNrjhV0qYKrVraOxsn5NhdGIEnYY4JEkvnbNpmMSKo=;
 b=pVGKlBJRTXaVhaESsEqlbcsXvvcDqBcLiCiVkmVh2FkPEcT4Tn7xMRtDaFg+PkOL+t
 tvSViQQ5bEeXNsRWmFQwtPsL3SKiU36AZQ+4Bz0balZc7Y6gi6MWhHSbAJHceU0670ie
 97sN2wZaHxlOrhLJz64XLWVP4j+UbJmL3BnI5/ZM3tx/GXepifAfcpVA70Jzk8vuB5e1
 trZDYBTwJXKLx0GwPlU0cdctcGdaq4teQVmhpAxvsEIH4CMJxSxKwNCzFJFz8EaTWWIO
 JKiKIgOHrPiqlIMgiAV0KhBRtxl6kRdNN5/YTsN/+Wdr7pJNTHICsAbgwabSLDb7oL7W
 VOXg==
X-Gm-Message-State: AOAM5323hzbXRwd2NAvsvOdQ65P6NoYwixeejymUduWqE3LLtId/OSPL
 cIH8pEuF+GLnRChxehoBqvAyy+wl7MI213q5w8b6xw==
X-Google-Smtp-Source: ABdhPJwyUo95qesO6KKxlWwygh2Sh5um2HKNOBREZSxDEktpf1WhTLzTRqqa2cVdPe0CAkWCBENeAOfPaZYJYtRWAl8=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr8280552wrp.4.1639071898877;
 Thu, 09 Dec 2021 09:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20211209173431.172710-1-thuth@redhat.com>
In-Reply-To: <20211209173431.172710-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Dec 2021 17:44:47 +0000
Message-ID: <CAFEAcA-oEZWkuH8zc1m1EvZyupjTGBtCtb8Jafk6EhSRcY9hDA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Explain the difference between linux-headers and
 standard-headers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Dec 2021 at 17:34, Thomas Huth <thuth@redhat.com> wrote:
>
> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/update-linux-headers.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index fea4d6eb65..96c7daef94 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -9,6 +9,13 @@
>  #
>  # This work is licensed under the terms of the GNU GPL version 2.
>  # See the COPYING file in the top-level directory.
> +#
> +# The script will copy the headers into two target folder:

"folders"

> +#
> +# - linux-headers/ for file that are required for compiling on a Linux host

"files"

> +#
> +# - include/standard-headers/ for files that are used for guest device emulation
> +#


We could expand on this a little if you like, eg:

- linux-headers/ for files that are required for compiling on a Linux host.
  Generally we have these so we can use kernel structs and defines that
  are more recent than the headers that might be in /usr/include/linux
  on the host system. Usually this script can do simple file copies
  for these headers.

- include/standard-headers/ for files that are used for guest device emulation
  and are required on all hosts. For instance, we get our definitions of the
  virtio structures from the Linux kernel headers, but we need those
  definitions regardless of which host OS we are building on. This script
  has to be careful to sanitize the headers to remove any use of Linux-specifics
  such as types like "__u64". This work is done in the cp_portable function.

-- PMM

