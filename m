Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0638870C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 07:58:14 +0200 (CEST)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFDh-0001mE-6Y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 01:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljFCY-00015K-CA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 01:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljFCV-0004MR-NR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 01:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621403818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv6y/uprGZOGPXt+5+Y0kfHRghbtIcPKIHUggaRq9SU=;
 b=P7h/KonFLWvx8E7CDDJDWyMlzXjF+cSUjfhiuMyCHM+ZMbgkxGTVMed9dfXyjxOSTy3fTN
 UxNUuTLRjFLap1H5IY4X1+5cH9Zjmvfu/VNr2WweMNy1Q0UD3+47jwMIVHUutNWz93zZ4E
 5l77T7cQhBRoxi/qOXyAuknd+b1xZ/4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-VAoatL8uNdOh_knD1nDEPg-1; Wed, 19 May 2021 01:56:55 -0400
X-MC-Unique: VAoatL8uNdOh_knD1nDEPg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ba15-20020a0564021acfb029038d3b33d7ffso4360150edb.23
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 22:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jv6y/uprGZOGPXt+5+Y0kfHRghbtIcPKIHUggaRq9SU=;
 b=Jlaa0UxhgxgD9WruQ0M4P4pCF/G9AJTYs+Sz/HHu25rTniZhLc/YUvBguXvcBmeqPy
 TwUvVt/bsbJ3y1/Y8irlc40cg3aGa07qKPIgOJE2ioGL8qixYHB4XSEwjHCOVtjBa2/x
 LlgjNjc5KuYhEgniJRCSU/9oq8pSwESzGNf3rktzkGm3RqzRgRoa+sFF/Byu/PF3a+rJ
 0mEVnD64kB69kEBPPhQ+9NG4UatMt7/xEdyrQeA0nIFZ/wbMW+8SL4IgNXicKyIQyuq6
 6qlIrR5X3pjEjgpFRscZNT+Gib40nOx/Hob1/CftXvw8EZwGrImtlm9MJe/v5eBbGWLy
 lnvA==
X-Gm-Message-State: AOAM532w2QqRoEUheUIwMf8sWD+47XCsA+GXnhuXbcGwdHtsUuRYc0/Q
 09mv/bmpbR8fl31hVkRwzRiUUa5fTaDReiV4K1p1J4aHXFEHPRM0R7sAzA4BvNYjvCnuEdnqSIJ
 ijScEshtbohj6lWQ=
X-Received: by 2002:a17:906:1d43:: with SMTP id
 o3mr10584024ejh.466.1621403814034; 
 Tue, 18 May 2021 22:56:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaESUi1fkKHF6LuBiDOULZSsNkEzSokpADM5tZQ8Df5eOZJwoPZleE2Hd+xPulMbW/f2HgVA==
X-Received: by 2002:a17:906:1d43:: with SMTP id
 o3mr10583999ejh.466.1621403813787; 
 Tue, 18 May 2021 22:56:53 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id jo12sm5074052ejb.22.2021.05.18.22.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 22:56:53 -0700 (PDT)
Subject: Re: [RFC PATCH 14/25] qemu/bswap: Introduce load/store for aligned
 pointer
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-15-philmd@redhat.com>
 <CAFEAcA80dcBqEeuSyMPEAC50SvArwU4Ac_zTgM_im0W8x=KPHQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <82c66450-24de-89a2-71fb-79dcdebd1baa@redhat.com>
Date: Wed, 19 May 2021 07:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80dcBqEeuSyMPEAC50SvArwU4Ac_zTgM_im0W8x=KPHQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:15 PM, Peter Maydell wrote:
> On Tue, 18 May 2021 at 19:38, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> When the pointer alignment is known to be safe, we can
>> directly swap the data in place, without having to rely
>> on the compiler builtin code.
>>
>> Load/store methods expecting aligned pointer use the 'a'
>> infix. For example to read a 16-bit unsigned value stored
>> in little endianess at an unaligned pointer:
>>
>>   val = lduw_le_p(&unaligned_ptr);
>>
>> then to store it in big endianess at an aligned pointer:
>>
>>   stw_be_ap(&aligned_ptr, val);
> 
> It sounded from the bug report as if the desired effect
> was "this access is atomic". Nothing in the documentation here
> makes that guarantee of the implementation -- it merely imposes
> an extra requirement on the caller that the pointer alignment
> is "safe" (which term it does not define...) and a valid
> implementation would be to implement the "aligned" versions
> identically to the "unaligned" versions...
> 
> Q: should the functions at the bottom of this stack of APIs
> be using something from the atomic.h header? If not, why not?
> Do we need any of the other atomic primitives ?

I'll defer this question to Stefan/Paolo...


