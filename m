Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E0131093
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 11:30:04 +0100 (CET)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioPe7-00020U-4n
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioPdJ-0001QU-Hj
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 05:29:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioPdH-0002Nh-MG
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 05:29:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43658
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioPdH-0002NR-J1
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 05:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578306550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVPmSfFDhprm8sZZ++uO1ZTHZXMMpITF0TvzVY+539w=;
 b=JJBH4Ud8yGwklPfIckLDIxBDXj+YdU0R7Xr/O/UlwXCNeMhioWXvoQ8lvFwvWGI1obmxF6
 Oxb2DX++mJhfYMr91pP03ckBseugboLKc7DM9GbTgurRqt3UfddUb8dnI1YftX3AhA3KBn
 K7OYQuxvoa064IHt5I/iuj26g/GWHAA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-PJ88ql2BPh-mQA8jdhcBMw-1; Mon, 06 Jan 2020 05:29:09 -0500
Received: by mail-wm1-f70.google.com with SMTP id f25so2679003wmb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 02:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ADHKU9NrC+3H1uHkdGTAdErgV8UUJhffJnpzDvtATk=;
 b=i960tJ4dg+WM+mZEgDcytipnGzFmrNIXEzDof6J4Y6BU0DHrB0Ehd508CoFbYlguCk
 82AouP1F71ESM7fYhSGNK/j3X6QfrrVANlAiwt//YbqAYKpgo7Yd/DMSnhZX/LZW0dM3
 CzhEBxKQ0zXVIu5uWuzyQnMG0kZOpr4DbWs4n+t9qbQhpJsR6u5lDBkl8RbEhv+bsmn3
 5ufoJMxsUSrLgdTEXXXvT8RBMZ6Rl68bmcNeLhT0gALjajTqcYqParkT1aDYGOAasuOF
 w9oyPANvn2j2SQDXgvqCLWBriBF/j96UTutpquhYtjQO7UTkXKobm3aIRml/s8qbqdcp
 YtuQ==
X-Gm-Message-State: APjAAAVkdPVs0WkYC/mV02DIQVuq5IgVH++BInyaXk+E2PdO6zVmHM4R
 fuvcabnnS0rZDUQXKB9QBfeXu3ohMUBaH0enS3q3NZB0Btf0NN8IVSCIFKN0eTn6CelMRa5W9aX
 fhi/ERkm0IsXaCy8=
X-Received: by 2002:adf:ea05:: with SMTP id q5mr103667978wrm.48.1578306548200; 
 Mon, 06 Jan 2020 02:29:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgVnV3Yz2lgGPgveaZ6L/8B/BzkwjntyG4lv+JRIKAFJJaYsi5xfMW9nQ6riAlkepeoNq9zA==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr103667947wrm.48.1578306547940; 
 Mon, 06 Jan 2020 02:29:07 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id l18sm2568731wme.30.2020.01.06.02.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 02:29:07 -0800 (PST)
Subject: Re: [PATCH v2] MAINTAINERS: Replace Claudio Fontana for tcg/aarch64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200106063423.10936-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdc183e8-e6fc-5739-b84e-e85add2239a5@redhat.com>
Date: Mon, 6 Jan 2020 11:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106063423.10936-1-richard.henderson@linaro.org>
Content-Language: en-US
X-MC-Unique: PJ88ql2BPh-mQA8jdhcBMw-1
X-Mimecast-Spam-Score: 0
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <claudio.fontana@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/20 7:34 AM, Richard Henderson wrote:
> Claudio's Huawei address has been defunct for quite a while.  In
>=20
>    https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg06872.html
>=20
> he asked for his personal address to be removed as well.
>=20
> I will take over officially.

Thanks for this!

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Cc: Claudio Fontana <claudio.fontana@gmail.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f453fc94c..1f5f3ca21b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2384,8 +2384,7 @@ F: plugins/
>   F: tests/plugin
>  =20
>   AArch64 TCG target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
> -M: Claudio Fontana <claudio.fontana@gmail.com>
> +M: Richard Henderson <richard.henderson@linaro.org>
>   S: Maintained
>   L: qemu-arm@nongnu.org
>   F: tcg/aarch64/
>=20


