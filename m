Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB519D6D4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 14:36:39 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKLYs-0001j1-Uv
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 08:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jKLXk-0001Ck-Q3
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 08:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jKLXj-0002AU-RX
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 08:35:28 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jKLXj-0002AA-Hl
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 08:35:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id e9so7512733wme.4
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=dpESpO8aTr8pgvgRO6vwygG/EoOgtGErhywXRIcQWWg=;
 b=bjz8oRyZu1U0nPP40998OtzYBUruO7JQYXtooke2EAYEq48eIs63vxPPlS3njb5JyX
 xIjCoqWvp0af2dLiCUZdk3pm6yj+iDZihg+C8V6rtEfVj37B3GDBkgghNwIh98YRLBRB
 gilwghbFTLzvrO/VQKhtuDLHTc8jJPz7WwRBsEpiNpl1/pcTtQ0ODm3/XzS7UoKaF7FP
 B6HHHi8CY0mu9mVWsGaXtmA11bISjKtkSE7PwGUmGLrtunTILGzcwIo7y+xdDcW2pHzL
 IinWj0T83ZqT73LH80klZvz4PZoet0LlVDfg0dEqNIzqYop52Jd68jceQsH8QwGyL9kM
 22zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=dpESpO8aTr8pgvgRO6vwygG/EoOgtGErhywXRIcQWWg=;
 b=CvZMuWQ9cDCcNNv951Ay8ye6Xahlwbmk97uCwumKlQPD9yZahfEc3pvut+F0nkTBsq
 FKNVpX1D1WwNVoABtK7vDO+IrcrPrDzQ24YjZUw7+WtIORRGrteOBix8Ew2p9+yBo8bP
 AhHP3G+mbPTYqFKoYk1bj2kq4zxWuourkVTIbIRd7rgoop0+VpRJ+QQyqfs/7oDCgITH
 dbhwQx9Dn+9oEkZPz7Vq64Gc04S6ziGmD97mChv2DVJ3UbqoMUcq7ut5BTgfFuNm87zj
 z57SF6LomznNy1LqSYQ8lG4X5+ZRD396AmebuyfLQJqrJaEdQXlO8w62LBmPLU5IvpFs
 3eIg==
X-Gm-Message-State: AGi0PuYPw769aZ62Cgj7DiF1vvKi/fji88mitatw1aUAKOf25yZLzRJ5
 eUasSm1vycW4mmCKaz6dYHkClg==
X-Google-Smtp-Source: APiQypL/Zb3ej6kMFg5awPOxASZYIlLOrBIBiyehx9Hfqii44p31xsNb2srWLTz99QldZ9GABq1A2w==
X-Received: by 2002:a1c:de87:: with SMTP id v129mr8654489wmg.68.1585917325908; 
 Fri, 03 Apr 2020 05:35:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm12095325wrm.66.2020.04.03.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 05:35:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C21D01FF7E;
 Fri,  3 Apr 2020 13:35:23 +0100 (BST)
References: <20200401094759.5835-1-alex.bennee@linaro.org>
 <20200401094759.5835-9-alex.bennee@linaro.org>
 <9efb706f-e296-a1b8-6c77-b859a68a8357@linaro.org>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/10] linux-user: factor out reading of /proc/self/maps
In-reply-to: <9efb706f-e296-a1b8-6c77-b859a68a8357@linaro.org>
Date: Fri, 03 Apr 2020 13:35:23 +0100
Message-ID: <87blo8eohg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/1/20 2:47 AM, Alex Benn=C3=A9e wrote:
>> +typedef struct {
>> +    uint64_t start;
>> +    uint64_t end;
> ...
>> +                errors  =3D qemu_strtoul(fields[0], &end, 16, &e->start=
);
>> +                errors +=3D qemu_strtoul(end + 1, NULL, 16, &e->end);
>
> uint64_t vs unsigned long -- you want qemu_strtou64.
>
>> +                errors +=3D qemu_strtoul(fields[2], NULL, 16, &e->offse=
t);
>
> Likewise.

Actually I went to using unsigned longs in the structure as that is the
natural size for host map info.

>
>> +                /* A bit ugly as strsplit doesn't skip multiple separat=
ors */
>> +                if (g_strv_length(fields) > 6) {
>> +                    e->path =3D g_strdup(fields[g_strv_length(fields) -=
 1]);
>> +                }
>
> And if the path contains spaces?

interesting bugs I guess - I'll see if I can do a cleaner pass.
>
>
> r~


--=20
Alex Benn=C3=A9e

