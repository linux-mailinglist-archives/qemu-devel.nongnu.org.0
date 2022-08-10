Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0308E58EF5C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 17:23:54 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLnYm-0005SI-KS
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 11:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLnVs-0003v3-HP
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:20:52 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLnVq-0000gn-VL
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:20:52 -0400
Received: by mail-qt1-x829.google.com with SMTP id cr9so8154860qtb.13
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=zUwa9XSOqkOiure5YMhQQ6yWyUHod1WX7FgC8MPGZa4=;
 b=hYtJUvTBLydZtUdmLbM4yT82IUrRorHYv/xvsRw5TDxiLNua1g7tGJppxfiTjcW6GS
 YXrM9mQabA7UgoYZwgbgNdRsD9NTVvRw4GQ0jwHKdlpraU+IvxYy4jBSImYP25rPuvZB
 8Kyk6NBmMavmbxHIsGhSb9ceWxzTvdmzGPqlKLcIYZxCkqy/kTkvaczanPPCI2UPZRyP
 xFfZKPRm1Ow5SOZ5i+iJ5HAnnvY8cd6JXhGKpDDPuvyqoa9/CVu0WV/Zxf4zyqoVTNVu
 FnbPlVfqMsIAaao5fCR/uSbGUfz8bp0jt0aNvs9YY1G0fHKVI5ojQF+DtS05pR9RhlJ2
 Itrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=zUwa9XSOqkOiure5YMhQQ6yWyUHod1WX7FgC8MPGZa4=;
 b=qMGnG3M1KDB9RDkybOmvqSe7KJGmhwis8WWS4kDWCfBwdKVdMQ9F0ZMVoBIhThfuuQ
 qUxifWsiqqRxBCZZRUlDV/09gnAqpJ7nZt7G1o22Ncw4N3sLLcDNBrULWKXwGfbzPH3b
 cQQKEb0X+FJKPwL1qoW18HGt81J+pQAC3z+bVyePMG3DxZP/gt2DOKf09R+pNlIoecjR
 SAbBL8Fxeu5sRvfvKsKYQ6teM/nptYr/o56NLdVu66TE0pdSX7oY+1mZOE5TTR5mpa4k
 7dofA9WbowV7VDZcZi4h02BreqoDePlXevuxIpFt7UaWIHHUH8vz3l7oGXO02AjJY3pB
 k6/w==
X-Gm-Message-State: ACgBeo2fXvq/82kUlDo26TRNQksMKA86NdaEPK0lqSWbZOk0Rp6Y2+TR
 xy0xzN+wiMX+pYQJbprrgFn2/GG3LK+rCiNwtis=
X-Google-Smtp-Source: AA6agR7YD/K/SVWNnEcduxao8txciCfCGEpLmE7w3DBeIvKTHQE74mILDo7fo/XQoQGuxLwlv+MFrBrx1zJQ5bKGhpA=
X-Received: by 2002:a05:622a:152:b0:31f:1ff1:b394 with SMTP id
 v18-20020a05622a015200b0031f1ff1b394mr25076713qtw.543.1660144849920; Wed, 10
 Aug 2022 08:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
 <CAJ+F1C+KqH7Egr_9f=w=qn4AXVEgaGsZ0nmpHL08PfHaZJ4wzg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+KqH7Egr_9f=w=qn4AXVEgaGsZ0nmpHL08PfHaZJ4wzg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Aug 2022 23:20:39 +0800
Message-ID: <CAEUhbmUC-aRi4o7G3TELNmJ5DnEZDjdnw5PJNTeQMbeT5TcUYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 10, 2022 at 1:06 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Aug 9, 2022 at 8:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The maximum number of wait objects for win32 should be
>> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>>
>> Fix the logic in qemu_add_wait_object() to avoid adding
>> the same HANDLE twice.
>>
>
> Please make that a separate patch.
>
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v2:
>> - fix the logic in qemu_add_wait_object() to avoid adding
>>   the same HANDLE twice
>>
>
> Still NACK, did you understand my argument about array bounds?
>
> "if (found)" will access the arrays at position i+1 =3D=3D MAXIMUM_WAIT_O=
BJECTS. We need the +1 for that logic to work without OOB access.
>

The delete logic was updated in v2. If position is at
MAXIMUM_WAIT_OBJECTS - 1, the loop will break.

Regards,
Bin

