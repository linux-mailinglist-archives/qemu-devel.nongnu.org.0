Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBC3986AB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOGe-0003xN-U5
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOFp-0003Ej-H4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOFn-0006WY-2v
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KXXpXQw0wGro9TcL+loYL2r6puq+AtejU6D233tAPI=;
 b=AZVxUVTHTHE6fYtKWsqxy6Z4s84icz3C+EaEEQr/mQhMnphzY4h29aXNHNVvcw9SxxlwIQ
 RXP+udA2c69Ob16Slhkr2LMx1yKxQ/Bj45qsiJNXTIft5R9QF9/xnkL9XR8USCZ5VSz4lB
 Wus5307uU6O8pzmKS50i4HutLQI3Zss=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-eNuwefq6NmemZbOrr9CbMA-1; Wed, 02 Jun 2021 06:37:35 -0400
X-MC-Unique: eNuwefq6NmemZbOrr9CbMA-1
Received: by mail-ej1-f72.google.com with SMTP id
 p5-20020a17090653c5b02903db1cfa514dso483791ejo.13
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KXXpXQw0wGro9TcL+loYL2r6puq+AtejU6D233tAPI=;
 b=iXXj2/q4lfl67FaWYXHiOCI4uWPH/CiXFtXFZn/TZsuriuDKgr9V+yoH+MHv2jWMk3
 ljC1kCVSy9/XoSkViWSj2Aus45YrgHvA2LCoWpIDAhmx0urepHcsmd1VMcGrWHEE889u
 fidZ70KEZ1uQwduJgBEJrXr0+lOKzTMhAQMmpbaOYcEILbEpqD9H+RqgGBwgbvfzL45g
 ElL2NsrZY6CUjSL7Nu0BgDuuMod1/0NZ9nQY2wb86zglhv3PsUawLH8KNnNi/r1gkcpP
 E8/ebo2uj4SttUGZQGWWR8wacBs4OqhbvWfQQwwT5t9fX1vYtfveyqQk1tp3q4U5y1C/
 I3yQ==
X-Gm-Message-State: AOAM530QrP6r11ed/dZ0QkwzcR3QtTDo0exXWwGKa99maDQMeKTX3yox
 nBPEYd1ScC7uU01qrDANZpPurhumhTIWeNH+iDhDXKiAXHosycavZ/r25YRRc8aQn30pXv4LjEg
 3QDmNuiuLRzqjdE4=
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr38605154edt.246.1622630252601; 
 Wed, 02 Jun 2021 03:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8nSoUl/kZ7VT67bTabNQD1yi2JByh/cumXHWf/G7PvKiOOSUpuAOeVPoRK3340QqTBurCZQ==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr38605126edt.246.1622630252339; 
 Wed, 02 Jun 2021 03:37:32 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a7sm1035940edr.15.2021.06.02.03.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:37:32 -0700 (PDT)
Subject: Re: [RFC v4 14/14] MAINTAINERS: update s390x directories
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-14-acho@suse.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <329f0492-4a96-fb50-41ff-79760961d110@redhat.com>
Date: Wed, 2 Jun 2021 12:37:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524025256.22252-14-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 cfontana@suse.de, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 4:52 AM, Cho, Yu-Chen wrote:
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directories:
> 
> target/s390x/kvm/
> target/s390x/tcg/
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  MAINTAINERS | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89741cfc19..8578927961 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -293,7 +293,7 @@ S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
>  S: Maintained
> -F: target/s390x/
> +F: target/s390x/tcg
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/
> @@ -389,14 +389,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  M: Cornelia Huck <cohuck@redhat.com>
>  M: Christian Borntraeger <borntraeger@de.ibm.com>
>  S: Supported
> -F: target/s390x/kvm.c
> -F: target/s390x/kvm_s390x.h
> -F: target/s390x/kvm-stub.c
> +F: target/s390x/kvm/
>  F: target/s390x/ioinst.[ch]
>  F: target/s390x/machine.c
>  F: target/s390x/sigp.c
>  F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
> +F: target/s390x/cpu_models*.[ch]
>  F: hw/s390x/pv.c
>  F: include/hw/s390x/pv.h
>  F: hw/intc/s390_flic.c
> 

Could you squash this in respectively:
#6 target/s390x: start moving TCG-only code to tcg/
#12 target/s390x: move kvm files into kvm/
?


