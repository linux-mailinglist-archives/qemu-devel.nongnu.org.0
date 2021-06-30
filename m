Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9C3B80E0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:34:53 +0200 (CEST)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXYS-00011C-Jj
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyXXZ-00086I-RM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:33:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyXXY-00028k-9u
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:33:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g7so2982472wri.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+E8ipXTUywZlsqv0ArzJ/0tfWosDU2LqqAUfH25Bt7E=;
 b=lhj6XxYnTEhG9CiOidpzwz0VlgSS2QyTH5zoMvTSNpIIQ0/SWtJmebNB30mQ6ZYbJd
 nSNLwjTg0gXgowMLsunImJvwJSH4ICu/aq0dpyws591X32JbPWSz8pGY/aB3RB8qB8hm
 +ub/GoYPn6NlzoW/r1J4gkZxrOaihzQXIWEsenmEnHsACPnH56iM9G0PvvIUJvGjcq0W
 uZtQebZuUSoA6k+3Usn4Uicz66CKF+99LV9sm89tR2uAQ71oRoCq1QpVLXLan704s2au
 JjZQZ/bfvNBCazOdAtrnrVj/PcutaC8nUH60oxRa5SxCOmHP8OEJgh16UXURwAyMVYiO
 M5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+E8ipXTUywZlsqv0ArzJ/0tfWosDU2LqqAUfH25Bt7E=;
 b=EB/Gj/+rL7gqiQpCDHOcIFR5f6Ue3gAlREzZ+u1TZjNOkgxVujz7cfgnlKDnojW9yb
 b8LajeeCWfqD9v27Qmi5UlNoxHmEOQXwiBEU/0v596QACJ7qbtalgiVH/CoEGCNd5uje
 4I1TnDdTQCCeIciD71roIkMi+l5VHLkeLGQGMSNzTBwmKw0dKo5r+F56+/lS6RA/irNO
 3Fp1afYGpfXtE5esARHqJ3YA6XjtMsTk2gOc9An1oy/j7tFtS90UtCBTL2yhbZwZfccr
 BGyFQpNWVX7H+4W2TRoEIa85xHXVx7lkHt264l/kySSW2pOzY1i75HVJgewMwJZTSK/6
 oIWw==
X-Gm-Message-State: AOAM530tAFgbqzUfGr/EBtDz8GfOLHbtKCIDOBoiisLwdnp1/veV/QYh
 i91csEx0eCEzHNKSnHCtTNE=
X-Google-Smtp-Source: ABdhPJyHYxk9UoWv1yz8a1XSPzEXkIY2Xvuscz70jtknLK1gdRIoyv+ho3IJ0/L/xfcYXJlQoi7U2g==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr2581259wrv.98.1625049234920;
 Wed, 30 Jun 2021 03:33:54 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-55.mobile.abo.orange.fr.
 [92.184.110.55])
 by smtp.gmail.com with ESMTPSA id y19sm3164292wmj.33.2021.06.30.03.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 03:33:54 -0700 (PDT)
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.9
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a523ec0a-2544-3dc9-e6dc-5b4d2cd07e77@amsat.org>
Date: Wed, 30 Jun 2021 12:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 4:01 AM, Brad Smith wrote:
> tests/vm: update openbsd to release 6.9
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/vm/openbsd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index 4d1399378e..c4c78a80f1 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>      name = "openbsd"
>      arch = "x86_64"
>  
> -    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
> -    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
> +    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
> +    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
>      size = "20G"
>      pkgs = [
>          # tools
> 


