Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEED15CF3D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 01:53:29 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2PEW-0006Oq-UV
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 19:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j2PDh-0005dO-Ga
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 19:52:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j2PDg-0005g8-Jn
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 19:52:37 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j2PDc-0005Xq-RI; Thu, 13 Feb 2020 19:52:32 -0500
Received: by mail-wr1-x444.google.com with SMTP id t3so8986950wru.7;
 Thu, 13 Feb 2020 16:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fGVZsEDy2WXuru7gaCHW74XLxBB1DMKe5RuopNUHGRk=;
 b=d9z2eHoTsFLdKYcJ0Qj5ONpxGcov/0TnvMXAwDBZuTI34uKWb/5SenunIBYK2cfAxc
 DSC9cY95yNiK16iHCn3Qb4oMEiaoP1hF6E3+Sc8Xo4Fpjf3Q2iGo6lXCgu579LHhoUOS
 SBxgKbYNFfSHqwqVb88XswohFD91o3D8yGxiJKywIKjLYAvit05qi1xNXOTaFLJyI8le
 b3wfasctIw5MtS2xO487BhR0UarbiFnFvJQeg8wvQgLSSMJDdw+to2QUoahiWGClcUEx
 2qyzZyZmyNLOJlgdH7KCqx1ol8LSeDadVHp7kIWup8qvNZH4Yyi95/NMvNl2FtmgMeUn
 KPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fGVZsEDy2WXuru7gaCHW74XLxBB1DMKe5RuopNUHGRk=;
 b=DSG2bZ9jhJaF7bRrgWfmVrJL0IOK5qwxpE5CgcUg6o6wsDLYAK2GD58gfyU/HqGMLc
 pndDkM70Mn65o+YfzwaHyVNA6a5BbFyDSRADuvdWKTMe3wDSWXzRTJY8E4+kSnvyqvg+
 KO2tig4sFwexjBGHosdMz59ZnrcSJiAqlAcZ9z8+PPMmcjOjB3wcFozie/73PwQcFiBv
 eYVm4fnGU9G78I2FXDjaVSBrWZ/mrnlVpJTWLq2fwB8Zc48VxafwHqO/8XPuk6z99QYY
 ayTpCWSlbWXYNUz8P+MYuoc9Ob5UtXjNXK5l2rSnLUbcuVC0LzMx5osNAKSJu3klaZrt
 Sg0A==
X-Gm-Message-State: APjAAAUm2pB8zh/bbdSr3mtJmbXSS/dZOQiu/1tcgbA+aRLJLrBd0wQc
 2mGWtzKuzNLThQETX2xBgtSttOGwlUI=
X-Google-Smtp-Source: APXvYqyhE7MS+ALXV7VLVeJEVqhOq+I1fD7u5gTIRfUSnaaJl5MlSsAZ/qj3XA++vGEM0IbSoiS/TA==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr273704wrr.312.1581641551425;
 Thu, 13 Feb 2020 16:52:31 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id u4sm4832807wrt.37.2020.02.13.16.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 16:52:30 -0800 (PST)
Subject: Re: [PATCH v2 11/19] plugins/core: add missing break in
 cb_to_tcg_flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200213225109.13120-1-alex.bennee@linaro.org>
 <20200213225109.13120-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <31a6fc9f-9f61-d6f9-c720-1e41080c54dd@amsat.org>
Date: Fri, 14 Feb 2020 01:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213225109.13120-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: fam@euphon.net, berrange@redhat.com, robert.foley@linaro.org,
 pbonzini@redhat.com, stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org,
 qemu-stable@nongnu.org, robhenry@microsoft.com, marcandre.lureau@redhat.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 kuhn.chenqun@huawei.com, peter.puhov@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/20 11:51 PM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Reported-by: Robert Henry <robhenry@microsoft.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20200105072940.32204-1-cota@braap.org>

Fixes: 54cb65d8588

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Cc: qemu-stable@nongnu.org
> ---
>  plugins/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/plugins/core.c b/plugins/core.c
> index 9e1b9e7a915..ed863011baf 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -286,6 +286,7 @@ static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
>      switch (flags) {
>      case QEMU_PLUGIN_CB_RW_REGS:
>          ret = 0;
> +        break;
>      case QEMU_PLUGIN_CB_R_REGS:
>          ret = TCG_CALL_NO_WG;
>          break;
> 

