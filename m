Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14E158A40
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 08:17:42 +0100 (CET)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Pnh-0005wU-Dc
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 02:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1PmH-0004uJ-1W
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 02:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1PmF-00057Y-BV
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 02:16:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1PmF-000561-7q
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 02:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581405370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvlFecUqJ+Cyuc8vSCh1t3DEPNghmM7cNhNJ2PEWin0=;
 b=OiJMAUgZriSCpqcygLjN6F0MrWFLK02fOdeSRNRS9A89gnPyRo7ka3ui5z4y3J2vnDKlrF
 t7f/ljMfjIuRf0MHYsMJ02XXLJl9GfLbMP6yAB3QRz7GozyR7iUF3q8yUBVo58dZdqCmGr
 ExKI6d8tUY6MxRMFMpLdQyqG1NnF874=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-mW14URynMIOrhTt6LAeHpA-1; Tue, 11 Feb 2020 02:16:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id w17so6454537wrr.9
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 23:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yEleeukMnWjY/QIzv0WGoyrtdL3YLnD5TblP8Dr5mj4=;
 b=KhYaHvFvNSrNIQ1iLfeE/OPfTHCm3/jyjA6YqQWz6rWbSzXye7WJGEXacQAdDyx468
 aFaXDekv8Lf/RGiJczWeQwYVf2SH9Ei6ZQxlcAaDpElS02rwk2VlANxGCVwAchHvBM55
 HF93s8zebg2Q4n/WRL0sCs9dZVF/PIdcKjjZKjuc825s5EUXsi3WoN0CVU2p+x1E7Sj0
 IiHGQNQ5ZxxVXavYlZReq78cqLFYIxU7gKznBnCAUnrO+c2rFRiqKHokH1/CXBdsQ2z8
 dZk2GLF1vsguTB4GnG0uDlJXA68rQDjpm27ddZhrrm5+gGBaRdZKeb1hSZbLSWSYlcqS
 j2fA==
X-Gm-Message-State: APjAAAWiwYRx0Jt5E9E+ljlhNzD06Lz694vyf9jUjDfThzq5LGCvoQJe
 XNqZiK0MXA02HHxcLladO2cCQlioInwEVVPVvFnXebDFmT5KrpMqL/JfY5HMvabBIIkwuMU9shf
 YTfEI2VoIU4oSdrQ=
X-Received: by 2002:a7b:c242:: with SMTP id b2mr3717186wmj.19.1581405364542;
 Mon, 10 Feb 2020 23:16:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxa4KL8EYRNjz45hM4AX0sw6yBwdW4E8tBZu9/e8UgC3ULV24GD5MKC453EIVYio1RAT4+RpA==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr3717150wmj.19.1581405364285;
 Mon, 10 Feb 2020 23:16:04 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z133sm2600274wmb.7.2020.02.10.23.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 23:16:03 -0800 (PST)
Subject: Re: [RFC PATCH 02/66] Hexagon ELF Machine Definition
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
 <1581381644-13678-3-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1eb8ba8b-e44f-85a8-8549-af5de26c5e60@redhat.com>
Date: Tue, 11 Feb 2020 08:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581381644-13678-3-git-send-email-tsimpson@quicinc.com>
Content-Language: en-US
X-MC-Unique: mW14URynMIOrhTt6LAeHpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/20 1:39 AM, Taylor Simpson wrote:
> Define EM_HEXAGON 164
>=20
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   include/elf.h | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/include/elf.h b/include/elf.h
> index 8fbfe60..d51e7d4 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -170,6 +170,8 @@ typedef struct mips_elf_abiflags_v0 {
>  =20
>   #define EM_UNICORE32    110     /* UniCore32 */
>  =20
> +#define EM_HEXAGON     164     /* Qualcomm Hexagon */
> +
>   #define EM_RISCV        243     /* RISC-V */
>  =20
>   #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


