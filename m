Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA672181D40
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:12:00 +0100 (CET)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3xf-0007K2-TS
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1jC3wo-0006t5-Ew
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1jC3wn-0004zG-5X
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:11:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50627
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1jC3wn-0004z7-2N
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583943064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UPGi8TFtwDPx6QMOQfk88wZ3GZWgJpIhXk2r1YAEx/U=;
 b=UBjB8sVuy2HRqcqDYUdII9+WyarS/Iift3SLecbvtKphxobhXUo6qEYaQQGTUEw1dU5Udm
 7kudy9lJsGuTXwlL6bKiO3pGuPaPnaajNh6OK4VZsct8NolM1F35XTuNrjpOmL6PkEU23X
 fkpumX+xAy2UsGCGGbW0jCwzWqCBNz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-HCEZmH75Niim1dkbyXWodw-1; Wed, 11 Mar 2020 12:11:01 -0400
X-MC-Unique: HCEZmH75Niim1dkbyXWodw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EBA4800EBC;
 Wed, 11 Mar 2020 16:11:00 +0000 (UTC)
Received: from [10.36.116.132] (ovpn-116-132.ams2.redhat.com [10.36.116.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D67C919C7F;
 Wed, 11 Mar 2020 16:10:58 +0000 (UTC)
Subject: Re: [PATCH v9 12/15] s390x: protvirt: Move IO control structures over
 SIDA
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200311132151.172389-1-frankja@linux.ibm.com>
 <20200311132151.172389-13-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMFCQlmAYAGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl3pImkCGQEACgkQTd4Q
 9wD/g1o+VA//SFvIHUAvul05u6wKv/pIR6aICPdpF9EIgEU448g+7FfDgQwcEny1pbEzAmiw
 zAXIQ9H0NZh96lcq+yDLtONnXk/bEYWHHUA014A1wqcYNRY8RvY1+eVHb0uu0KYQoXkzvu+s
 Dncuguk470XPnscL27hs8PgOP6QjG4jt75K2LfZ0eAqTOUCZTJxA8A7E9+XTYuU0hs7QVrWJ
 jQdFxQbRMrYz7uP8KmTK9/Cnvqehgl4EzyRaZppshruKMeyheBgvgJd5On1wWq4ZUV5PFM4x
 II3QbD3EJfWbaJMR55jI9dMFa+vK7MFz3rhWOkEx/QR959lfdRSTXdxs8V3zDvChcmRVGN8U
 Vo93d1YNtWnA9w6oCW1dnDZ4kgQZZSBIjp6iHcA08apzh7DPi08jL7M9UQByeYGr8KuR4i6e
 RZI6xhlZerUScVzn35ONwOC91VdYiQgjemiVLq1WDDZ3B7DIzUZ4RQTOaIWdtXBWb8zWakt/
 ztGhsx0e39Gvt3391O1PgcA7ilhvqrBPemJrlb9xSPPRbaNAW39P8ws/UJnzSJqnHMVxbRZC
 Am4add/SM+OCP0w3xYss1jy9T+XdZa0lhUvJfLy7tNcjVG/sxkBXOaSC24MFPuwnoC9WvCVQ
 ZBxouph3kqc4Dt5X1EeXVLeba+466P1fe1rC8MbcwDkoUo65Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAiUEGAECAA8FAlXLn5ECGwwFCQlmAYAACgkQTd4Q
 9wD/g1qA6w/+M+ggFv+JdVsz5+ZIc6MSyGUozASX+bmIuPeIecc9UsFRatc91LuJCKMkD9Uv
 GOcWSeFpLrSGRQ1Z7EMzFVU//qVs6uzhsNk0RYMyS0B6oloW3FpyQ+zOVylFWQCzoyyf227y
 GW8HnXunJSC+4PtlL2AY4yZjAVAPLK2l6mhgClVXTQ/S7cBoTQKP+jvVJOoYkpnFxWE9pn4t
 H5QIFk7Ip8TKr5k3fXVWk4lnUi9MTF/5L/mWqdyIO1s7cjharQCstfWCzWrVeVctpVoDfJWp
 4LwTuQ5yEM2KcPeElLg5fR7WB2zH97oI6/Ko2DlovmfQqXh9xWozQt0iGy5tWzh6I0JrlcxJ
 ileZWLccC4XKD1037Hy2FLAjzfoWgwBLA6ULu0exOOdIa58H4PsXtkFPrUF980EEibUp0zFz
 GotRVekFAceUaRvAj7dh76cToeZkfsjAvBVb4COXuhgX6N4pofgNkW2AtgYu1nUsPAo+NftU
 CxrhjHtLn4QEBpkbErnXQyMjHpIatlYGutVMS91XTQXYydCh5crMPs7hYVsvnmGHIaB9ZMfB
 njnuI31KBiLUks+paRkHQlFcgS2N3gkRBzH7xSZ+t7Re3jvXdXEzKBbQ+dC3lpJB0wPnyMcX
 FOTT3aZT7IgePkt5iC/BKBk3hqKteTnJFeVIT7EC+a6YUFg=
Organization: Red Hat GmbH
Message-ID: <817cfda1-373e-1e78-7bd2-3a88ed091a60@redhat.com>
Date: Wed, 11 Mar 2020 17:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311132151.172389-13-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.20 14:21, Janosch Frank wrote:
> For protected guests, we need to put the IO emulation results into the
> SIDA, so SIE will write them into the guest at the next entry.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/ioinst.c | 87 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 61 insertions(+), 26 deletions(-)
> 
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index 481d789de9e09a04..61095bdc9ffef436 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -136,9 +136,13 @@ void ioinst_handle_msch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>          return;
>      }
> -    if (s390_cpu_virt_mem_read(cpu, addr, ar, &schib, sizeof(schib))) {
> -        s390_cpu_virt_mem_handle_exc(cpu, ra);
> -        return;
> +    if (s390_is_pv()) {
> +        s390_cpu_pv_mem_read(cpu, addr, &schib, sizeof(schib));
> +    } else {

} else if ( ) {?

> +        if (s390_cpu_virt_mem_read(cpu, addr, ar, &schib, sizeof(schib))) {
> +            s390_cpu_virt_mem_handle_exc(cpu, ra);
> +            return;
> +        }
>      }
>      if (ioinst_disassemble_sch_ident(reg1, &m, &cssid, &ssid, &schid) ||
>          !ioinst_schib_valid(&schib)) {
> @@ -193,9 +197,13 @@ void ioinst_handle_ssch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>          return;
>      }
> -    if (s390_cpu_virt_mem_read(cpu, addr, ar, &orig_orb, sizeof(orb))) {
> -        s390_cpu_virt_mem_handle_exc(cpu, ra);
> -        return;
> +    if (s390_is_pv()) {
> +        s390_cpu_pv_mem_read(cpu, addr, &orig_orb, sizeof(orb));
> +    } else {

dito

> +        if (s390_cpu_virt_mem_read(cpu, addr, ar, &orig_orb, sizeof(orb))) {
> +            s390_cpu_virt_mem_handle_exc(cpu, ra);
> +            return;
> +        }
>      }

[...]
>  
> @@ -258,6 +271,9 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
>      }
>  
>      if (ioinst_disassemble_sch_ident(reg1, &m, &cssid, &ssid, &schid)) {
> +        if (s390_is_pv()) {
> +            return;
> +        }

I'd prefer a comment here, explaining what the UV checks and why we
don't have to do anything.

>          /*
>           * As operand exceptions have a lower priority than access exceptions,
>           * we check whether the memory area is writeable (injecting the
> @@ -290,14 +306,19 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
>          }
>      }
>      if (cc != 3) {
> -        if (s390_cpu_virt_mem_write(cpu, addr, ar, &schib,
> -                                    sizeof(schib)) != 0) {
> -            s390_cpu_virt_mem_handle_exc(cpu, ra);
> -            return;
> +        if (s390_is_pv()) {
> +            s390_cpu_pv_mem_write(cpu, addr, &schib, sizeof(schib));
> +        } else {
> +            if (s390_cpu_virt_mem_write(cpu, addr, ar, &schib,
> +                                        sizeof(schib)) != 0) {
> +                s390_cpu_virt_mem_handle_exc(cpu, ra);
> +                return;
> +            }
>          }
>      } else {
>          /* Access exceptions have a higher priority than cc3 */
> -        if (s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib)) != 0) {
> +        if (!s390_is_pv() &&
> +            s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib)) != 0) {
>              s390_cpu_virt_mem_handle_exc(cpu, ra);
>              return;
>          }
> @@ -334,15 +355,20 @@ int ioinst_handle_tsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
>      }
>      /* 0 - status pending, 1 - not status pending, 3 - not operational */
>      if (cc != 3) {
> -        if (s390_cpu_virt_mem_write(cpu, addr, ar, &irb, irb_len) != 0) {
> -            s390_cpu_virt_mem_handle_exc(cpu, ra);
> -            return -EFAULT;
> +        if (s390_is_pv()) {
> +            s390_cpu_pv_mem_write(cpu, addr, &irb, irb_len);
> +        } else {
> +            if (s390_cpu_virt_mem_write(cpu, addr, ar, &irb, irb_len) != 0) {

dito

> +                s390_cpu_virt_mem_handle_exc(cpu, ra);
> +                return -EFAULT;
> +            }
>          }
>          css_do_tsch_update_subch(sch);
>      } else {
>          irb_len = sizeof(irb) - sizeof(irb.emw);
>          /* Access exceptions have a higher priority than cc3 */
> -        if (s390_cpu_virt_mem_check_write(cpu, addr, ar, irb_len) != 0) {
> +        if (!s390_is_pv() &&
> +            s390_cpu_virt_mem_check_write(cpu, addr, ar, irb_len) != 0) {
>              s390_cpu_virt_mem_handle_exc(cpu, ra);
>              return -EFAULT;
>          }
> @@ -640,9 +666,13 @@ void ioinst_handle_chsc(S390CPU *cpu, uint32_t ipb, uintptr_t ra)
>       * present CHSC sub-handlers ... if we ever need more, we should take
>       * care of req->len here first.
>       */
> -    if (s390_cpu_virt_mem_read(cpu, addr, reg, buf, sizeof(ChscReq))) {
> -        s390_cpu_virt_mem_handle_exc(cpu, ra);
> -        return;
> +    if (s390_is_pv()) {
> +        s390_cpu_pv_mem_read(cpu, addr, buf, sizeof(ChscReq));
> +    } else {

dito.

> +        if (s390_cpu_virt_mem_read(cpu, addr, reg, buf, sizeof(ChscReq))) {
> +            s390_cpu_virt_mem_handle_exc(cpu, ra);
> +            return;
> +        }
>      }

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


