Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259EC20B344
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:09:51 +0200 (CEST)
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jop38-0005iR-3P
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jop22-0004L9-73
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:08:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35804
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jop1z-0006sh-FW
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593180518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vEMG0/wcB2O7zv991ojSZZn6omyF904By/r+ZV6+Zz8=;
 b=FwTNgtOxsBQjxw6dNGNSMhIP3bg5j4Se6PFdYeyLIzcNBMHdd2ZYhsH5/j3x4f7v4M9EmJ
 pXMaifOfKudiyownJLh9KkzHiKAYJNlmN1z9/m+kVcEjFizrXSC8YutbCG230drNqZ5/si
 0OIG91l4ifjRc3FLrOT5CR1kGnySvPc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-YE0F2NgVO8i0fHJ79-TaGg-1; Fri, 26 Jun 2020 10:08:36 -0400
X-MC-Unique: YE0F2NgVO8i0fHJ79-TaGg-1
Received: by mail-wm1-f69.google.com with SMTP id b13so9048186wme.9
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 07:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vEMG0/wcB2O7zv991ojSZZn6omyF904By/r+ZV6+Zz8=;
 b=CsCKQR/tvooGAhO2qqVO4iMmAwOsP7hCVL8BXLcGa0sctxnJXfh7jepSsAszWBC4H4
 yMua4pL5vZvi/frph05vd/3mvYB/y+2/APPiisVUlMSQElYlgod57o2O+Lj07COLv9Fj
 6lFi7LKqa4T4EQJotHwq1rGu3DN1NIujxNF/2pHtrxfsY8eEZHi8MjrOZsqkFS7kv+k7
 agDxyNIKkLts1KMXDlJC2wIyTvtPJsTRPNDnNwZLR6lA/3/wPdSU+UAT0XGC5ccexIgi
 +9zHM1VW1yBbr7ywCRNY/0SPBmZa9d8QN2oD+cSrgIqcUM01tolFWjLm+9gYryISNmOA
 gBPQ==
X-Gm-Message-State: AOAM530wVIFEPkLvIkX0ol3TOYS6vqwpw9gnh2zIAqrpcMyeuiubbqig
 5OFgwXI60AOXnsJpIeKkz5h3lQMHEDQpX4mEv0xj6Ol6Wbr0UbLu1GS0494Nx6H4DJAwSF/RI88
 FYS7phd/8KiHCY8E=
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr3817891wrs.4.1593180515074;
 Fri, 26 Jun 2020 07:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKrTgs+S8bSNruFPN1HAEEgyKYSe9YGg77MEF0t1N6eAWc2KWeDX+D+cN9CxLnHa5CBeZlXA==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr3817883wrs.4.1593180514911;
 Fri, 26 Jun 2020 07:08:34 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id p17sm16971872wma.47.2020.06.26.07.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 07:08:34 -0700 (PDT)
Subject: Re: [PATCH 2/3] define SIGIO for haiku
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqzMSoD6Y6FVLk1MC6JgL-+GXWXBBe=gJiKAtLa8sW1LdA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <51bd8e50-0621-2a43-ce99-2a4cf8931905@redhat.com>
Date: Fri, 26 Jun 2020 16:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqzMSoD6Y6FVLk1MC6JgL-+GXWXBBe=gJiKAtLa8sW1LdA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 02:19:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Maybe "Define SIGIO on Haiku OS" as patch subject...

On 6/26/20 4:03 PM, David CARLIER wrote:
> From d36aba6190152c626f668fef3704ee6b61bfc323 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 13:45:04 +0000
> Subject: [PATCH 2/3] define SIGIO for haiku
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  include/qemu/osdep.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f88fe23936..860bb3c16c 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -388,6 +388,10 @@ void qemu_anon_ram_free(void *ptr, size_t size);
>  #define HAVE_CHARDEV_PARPORT 1
>  #endif
> 
> +#if defined(__HAIKU__)

Maybe safer as:

   #if defined(__HAIKU__) && !defined(SIGIO)

> +#define SIGIO SIGPOLL
> +#endif
> +
>  #if defined(CONFIG_LINUX)
>  #ifndef BUS_MCEERR_AR
>  #define BUS_MCEERR_AR 4
> 

Preferably with the suggested changes:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


