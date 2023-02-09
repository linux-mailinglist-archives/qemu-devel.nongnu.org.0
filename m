Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B3F6912DC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQErc-00009j-LI; Thu, 09 Feb 2023 16:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pQErb-00009b-FG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:53:55 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pQErZ-0000K8-J6
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:53:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qw12so10733723ejc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 13:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itT7CNNYwIbGw/NdhBVioMq1qk/0q2en8jeZiTvu8fM=;
 b=gvkdPO+ea8gbJrkwujaXuq7jqd/x4q/yoZr/60V6ZoeTTF6CXPrsxdbDvp58h25VsY
 gMCOWNcSa8jF3Z7//UFAWiQIDoN9oOAvoPxiQpMeFziN3CCAwwMJ6GJ1zrartjupv+ZG
 grh6lZGDFObX5DwdUHW8wwXlMMISHQubCBP0pXVVualrI4IHsFeFvDXp61y6n9JvotOr
 JW4rtSkplS8r0DJZxifuoVbFWSom8YloiJ9CKfnW6TaK1TNNHrkkBsjuAFxpML2kCxV1
 wTt4V7NnWFpOa80BgYPhVfH+Hgk2Wqb47ehOk/qi9VoRyjUzG3edsXPnpzq+Ca/44qoP
 KE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itT7CNNYwIbGw/NdhBVioMq1qk/0q2en8jeZiTvu8fM=;
 b=7roDZe+Lxf0U4RMkOHcKD1oi+fWRklk+KkmqJ/LDPIXjZm7yXn0siSvNirCipqQieZ
 xHEhE+K4ttowNSfXfvkR9voLR4/WsFNx7xtRUhOnVY6E6VxWDjOQiBo3WkjgF7qp+MUO
 oHsqCLbPxUiIre0952dl3vJvnqPqFtGnmy/rkrG6lTeQxMIj2+4GcE23eqhRMRKTB7sP
 DlTpxFk6phUe/v4Av5myrChXJJD4v6+r4JQ1QYM2FNJ9km+6iV7XruPuIB4rCz5Qck+6
 Eke+bKckNg+r7y6F/r9GxQlEILjmneCwa+hjxgJmAitfLkXyEzLuLrmUUH6480UYlHFe
 2LDg==
X-Gm-Message-State: AO0yUKV9wK5j49nBTF8Cw3H035TKiH/V3Yt5jsoVppcL34EQHYXq/1ch
 Kpi8enVG0yOaNamyVzIV1wo=
X-Google-Smtp-Source: AK7set+8AOKT8imCofnKhSOXuWnoO7CZmbZIKmaAC/5ETBa5KX7LXmOcaqdQ1HR9CDMB3Tr6dFoSnA==
X-Received: by 2002:a17:906:1252:b0:889:7781:f62e with SMTP id
 u18-20020a170906125200b008897781f62emr14288663eja.22.1675979631428; 
 Thu, 09 Feb 2023 13:53:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-177-219.77.11.pool.telefonica.de.
 [77.11.177.219]) by smtp.gmail.com with ESMTPSA id
 q25-20020a50cc99000000b004a24b8b58cbsm1318598edi.16.2023.02.09.13.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 13:53:50 -0800 (PST)
Date: Thu, 09 Feb 2023 21:53:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
 <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
 <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
 <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
Message-ID: <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 1=2E Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>>
>>
>>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Epera=
rd@citrix=2Ecom>:
>>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and final=
ly removes
>>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make=
 Xen in the PC
>>>> > machine agnostic to the precise southbridge being used=2E 2/ will b=
ecome
>>>> > particularily interesting once PIIX4 becomes usable in the PC machi=
ne, avoiding
>>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>>>=20
>>>> Looks ok to me=2E
>>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>>=20
>>>> Feel free to merge through Xen tree=2E
>>>
>>>Hi Bernhard,
>>
>>Hi Anthony,
>>
>>>The series currently doesn't apply on master=2E And a quick try at
>>>applying the series it is based on also failed=2E Could you rebase it ,=
 or
>>>maybe you would prefer to wait until the other series "Consolidate
>>>PIIX=2E=2E=2E" is fully applied?
>>
>>Thanks for looking into it!
>>
>>You can get the compilable series from https://patchew=2Eorg/QEMU/202301=
04144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let =
me know, then I can rebase onto master=2E All necessary dependencies for th=
e series are upstreamed meanwhile=2E
>
>Ping

Ping^2

>
>>
>>Thanks,
>>Bernhard
>>>
>>>Thanks=2E
>>>
>>>> > Testing done:
>>>> > None, because I don't know how to conduct this properly :(
>>>> >=20
>>>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>>>

