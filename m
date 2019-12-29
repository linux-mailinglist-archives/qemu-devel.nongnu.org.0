Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A512CB5D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 00:33:38 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ili41-0002bd-5D
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 18:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ili2f-00028l-8C
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 18:32:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ili2Y-0005Db-UC
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 18:32:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28809
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ili2Y-00054o-Ki
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 18:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577662324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pwXqUzS3786TVm0X6p3HR4cPvT6LrE4zwyxudRK45Q=;
 b=iijzh1F5FVIj4tYRDQhK8xy6m7JRrdx/ysBhzcJ+K6Ho5GXsrQE1qZj+d8WQM1N/I64eCP
 NJxhkZLyq7Ab2hgwhWjZHIW3eBebuzsHq/IJ7v9baWmuK5CJSUAHhjKiBmBbcqi4WQFYYA
 n9DsAepwXFZGRLmouM3QCLPInHGCvKA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-6H7OvzXnONulL7FAVWb73g-1; Sun, 29 Dec 2019 18:31:59 -0500
Received: by mail-wr1-f70.google.com with SMTP id f10so8580686wro.14
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 15:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zE97LURMaQasjTa638wVQ9k74LhFtmB8hg69mbeUwOw=;
 b=pG0uzd8x/37Lp50Zc6AScrSCvvavK18wWhQFZRg6FUV2Cmn0Z2oI09y2hNOCKNIK8s
 QiS80bO2P1DQbM8gjuU1bLWEHBPrEvjrI5LaWboZ1bgv+PU8QG39kBreqC7VPSk3CZo3
 QlJ07XD+7J3d3ZzwiiGH7zIRiNFz356FJ0Jz/sPoZdF8tMx9UEDg45gR2dxkBUbVqFI2
 5kl6Kh1zckTLu0EuBPkaIY9xdCNF2pClPQjiokDF67RWQk3j2P6WQsiSic/pkSKFgyAn
 f/lOzYdss+d3q6oKYsMILCr1Vg66Cjuim2ISwkDUTNZ6VUZ9IhQ6P8j8MhUT/J1MkSrz
 2Tiw==
X-Gm-Message-State: APjAAAVoz9wRv5c6aYNHgNbQvAGZ9hH75v/e9A0eIqECBCdWsEY6FFzt
 ndEdYAO+m2mDX6nK1zV38jL/fCaGFn+L2hKKI7PweUO2FuUWiqjNz92SYnmzVqKmdCmsN3vO+M8
 VIzOSG57/Brk4q6s=
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr29739126wmg.86.1577662318681; 
 Sun, 29 Dec 2019 15:31:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTW2zJQlAiShA/mzcYJEaJo4GqGIE92vk4Ku5c6iccJHYIq956Pl1jcKv61koFQYZpIs0AHw==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr29739114wmg.86.1577662318504; 
 Sun, 29 Dec 2019 15:31:58 -0800 (PST)
Received: from ?IPv6:2a01:cb18:8372:6b00:691b:aac5:8837:d4da?
 ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id b68sm18855305wme.6.2019.12.29.15.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Dec 2019 15:31:58 -0800 (PST)
Subject: Re: [PATCH v3 07/29] linux-user: Include tcg.h in syscall.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191228231124.18307-1-richard.henderson@linaro.org>
 <20191228231124.18307-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <01fae7fa-a4d8-30a6-b183-bd3d21b010f6@redhat.com>
Date: Mon, 30 Dec 2019 00:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191228231124.18307-8-richard.henderson@linaro.org>
Content-Language: en-US
X-MC-Unique: 6H7OvzXnONulL7FAVWb73g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/19 12:11 AM, Richard Henderson wrote:
> Code movement in an upcoming patch will show that this file
> was implicitly depending on tcg.h being included indirectly.

Yes, it uses tcg_register_thread().

>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 171c0caef3..34825f15bf 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -115,6 +115,7 @@
>   #include "user/syscall-trace.h"
>   #include "qapi/error.h"
>   #include "fd-trans.h"
> +#include "tcg.h"

Since tcg origin (57fec1fee94) we use -I$(SRC_PATH)/tcg.

$ git grep -F '#include "tcg.h"'|wc -l
16
$ git grep -F '#include "tcg/tcg.h"'|wc -l
19

IMO using "tcg/tcg.h" is cleaner.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>  =20
>   #ifndef CLONE_IO
>   #define CLONE_IO                0x80000000      /* Clone io context */
>=20


