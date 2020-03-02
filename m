Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D264B17552C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 09:04:33 +0100 (CET)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8g40-0008BM-Rf
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 03:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j8g3A-0007hx-Py
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:03:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j8g39-0006Dw-TI
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:03:40 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36804
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j8g39-0006Dc-PY
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583136219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BspBFlWuGvkuEY9HopyUEEaII+nvvrsSYK1ffosBHTg=;
 b=ctwlLGzZH69rqv2oRry1AYIdorhM8SHglPWpg/vcqrgG5d1iVAl2c3bndubG6rM4LHIZq2
 0k8Fmv96olwDSVT8QhLGvfqpSdbyxMxvWu7N65dSgEqz63CEmrMlJKNYe7gkMoi+GrMIZa
 fhVoRaZMaYXgrTz1UL0Bz2+hEaxXcO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-oiejQHo2PFCRwV1xZaooBw-1; Mon, 02 Mar 2020 03:03:37 -0500
X-MC-Unique: oiejQHo2PFCRwV1xZaooBw-1
Received: by mail-wr1-f70.google.com with SMTP id m18so4192986wro.22
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 00:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BspBFlWuGvkuEY9HopyUEEaII+nvvrsSYK1ffosBHTg=;
 b=a6PlbkDOi/sKuC29R9TDwdqaj/o/dygKt1564HqPJ7ML+bP7SqiLF0vG4Laqg4pT45
 l2Tst5WNN1lWfKphndZ5nLmwjc2yadlL3Pp9XexWXrSyHDmGw8tAetFfwmQ1qzD9GN4I
 6DxhpSwqID60gL6T9y/J00XRv/cP2u0b2RZJbJORk1Lsg7qVnGh4Yipglpp9rBgbAURi
 uJCv3CGoWSmchPsaybhfCVqTJ5yN0afTosNrZZA750htCT2TtjdiyCO4IX36VdZNrv7B
 BfwvySKkLe3z4sJdIy4xnSPBTfSo7TKcgyLEz+NKruZD+0UBLQUUrQbR0lV67yPVxubU
 xdVw==
X-Gm-Message-State: APjAAAXqF3qCNZFAvGtjt+oAtqiUI1B57w+TTFuIANmUHbqIT2O/5y7a
 BvEE89RDvImWfaNnFX7g0EUuD/bac4zbYZZUG0h0D46I1U+Ze61ekHngHVgfHqd+Ued1ONwLzCo
 hfPNlqtsp7yOTe/I=
X-Received: by 2002:adf:f349:: with SMTP id e9mr22407445wrp.56.1583136216752; 
 Mon, 02 Mar 2020 00:03:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwln73fpNG1Ia+dIwJRp+3jjRrjaeP3vMYtwGw58ryviEMOjzxQCjQW6GdsmzhFpmTPbtcJPg==
X-Received: by 2002:adf:f349:: with SMTP id e9mr22407428wrp.56.1583136216527; 
 Mon, 02 Mar 2020 00:03:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e1d9:d940:4798:2d81?
 ([2001:b07:6468:f312:e1d9:d940:4798:2d81])
 by smtp.gmail.com with ESMTPSA id u8sm14865049wmm.15.2020.03.02.00.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 00:03:36 -0800 (PST)
Subject: Re: [PATCH v3] i386: Fix GCC warning with snprintf when HAX is enabled
To: Julio Faracco <jcfaracco@gmail.com>
References: <20200301192156.19357-1-jcfaracco@gmail.com>
 <52fadd00-d59a-0096-52a2-f44f49a85d7b@redhat.com>
 <CAENf94+9qHNvCnG05C70=NwUHwwjo050s8oTt0ZB5Q1jpCU7+g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <69ab86b9-c4b6-d40a-c8c7-4388dadd8573@redhat.com>
Date: Mon, 2 Mar 2020 09:03:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAENf94+9qHNvCnG05C70=NwUHwwjo050s8oTt0ZB5Q1jpCU7+g@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/20 02:58, Julio Faracco wrote:
> Sorry my ignorance, Paolo.
> But why should I remove MAX_{VM,VCPU}_ID?
> 
> Did you mean that check?
>     if (vm_id > MAX_VM_ID || vcpu_id > MAX_VCPU_ID) {
>         fprintf(stderr, "Too big vm id %x or vcpu id %x\n", vm_id, vcpu_id);
>         return NULL;
>     }
> 
> Wouldn't it be dangerous?

No, the check is only needed to avoid the buffer truncation from
snprintf.  If you use g_strdup_printf it's not needed anymore because
there can be no truncation.

Paolo


