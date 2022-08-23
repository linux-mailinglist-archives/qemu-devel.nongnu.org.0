Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EEC59E3FB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 14:57:23 +0200 (CEST)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTT8-0004Hp-FH
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 08:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQTPY-0007MK-2S
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQTPI-0000Qn-JX
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661259203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJC2ZwKAiqokrxDoo0oYmYm1r+iXIxonQY4CBk2eWp4=;
 b=SbieIeJ/FgpXvUwadQ5YTNIXIpw3YADXXF73JJF556o5ZrEseDDOFURWb1GHHTB31vsoox
 TrPrQIxphRVGSqY3Vhb2nzAchfm4NOdsorZ4jCmlb2R74VWoNGs9RI5Ox7icJTVMV1bl/S
 TZMcrTFOro+TNwVsfNrk187NO6L/jSU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-8jfNOhVyOUajcdCgPI6bCg-1; Tue, 23 Aug 2022 08:53:22 -0400
X-MC-Unique: 8jfNOhVyOUajcdCgPI6bCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x16-20020a1c7c10000000b003a5cefa5578so2769003wmc.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 05:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=rJC2ZwKAiqokrxDoo0oYmYm1r+iXIxonQY4CBk2eWp4=;
 b=vyMtAei7VNJCyHOJtKLTo7SKkkkaOmDJU/4uMInkn5GXH6E728SrrxqPBI+F6BiW6I
 vuXADPGep5T8QywJkPyGs76+uH/Oivah3Ex3Rfjfvd3Yblp7FzCKPwMQf/wfsgDuP5c3
 OiC3NqSF9Wp9vNs8KZM4/bdqdgI/2ahcjHXZrVJY37Fk3mu9JaXF2euZeD0Z4n4/7xK6
 ZA9G6AAMQiVbaPYb5QfTUCBW309kFajBdduupGt2TDp8bFu5bBPvobmk29dCNYVfM2A/
 X3KaPxFoLpLwS+/8NBNC5iYdOFjShBpntUZIddhwDZofjDXWkGleJZikLwVia8QmLwrR
 VZXQ==
X-Gm-Message-State: ACgBeo0PybUK/lAyeymlDW7PyA/5StVYCaIFBS9MQuE3G3dL3vPn9JPc
 tkTcLHdxkmrwBRc0/41wU5EFmt/pRWCkemnj21DtqEocthlPXC7+uoS6wDc8u1QxDePiZieXy0K
 o7vrF7eUDlTJuTaI=
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id
 d18-20020adffbd2000000b0021e7f745df1mr13316849wrs.43.1661259201289; 
 Tue, 23 Aug 2022 05:53:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/PZsZ81WskVNnAGiLOflOfXEwTYCizmQnN2PuqI1vc9NYu/leJyUciQnyALXCqprjlN399A==
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id
 d18-20020adffbd2000000b0021e7f745df1mr13316833wrs.43.1661259201047; 
 Tue, 23 Aug 2022 05:53:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:1600:c48b:1fab:a330:5182?
 (p200300cbc70b1600c48b1faba3305182.dip0.t-ipconnect.de.
 [2003:cb:c70b:1600:c48b:1fab:a330:5182])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdb92000000b0021eaf4138aesm17380055wri.108.2022.08.23.05.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:53:20 -0700 (PDT)
Message-ID: <7eea8d5d-d29b-97be-6cfe-e17f7dc2d0dd@redhat.com>
Date: Tue, 23 Aug 2022 14:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/s390x: Fix CLFIT and CLGIT immediate size
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220817161529.597414-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220817161529.597414-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 17.08.22 18:15, Ilya Leoshkevich wrote:
> I2 is 16 bits, not 32.
> 
> Found by running valgrind's none/tests/s390x/traps.
> 
> Fixes: 1c2687518235 ("target-s390: Implement COMPARE AND TRAP")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/insn-data.def | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 5e448bb2c4..6d2cfe5fa2 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -290,8 +290,8 @@
>      D(0xb961, CLGRT,   RRF_c, GIE, r1_o, r2_o, 0, 0, ct, 0, 1)
>      D(0xeb23, CLT,     RSY_b, MIE, r1_32u, m2_32u, 0, 0, ct, 0, 1)
>      D(0xeb2b, CLGT,    RSY_b, MIE, r1_o, m2_64, 0, 0, ct, 0, 1)
> -    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
> -    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
> +    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_16u, 0, 0, ct, 0, 1)
> +    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_16u, 0, 0, ct, 0, 1)
>  
>  /* CONVERT TO DECIMAL */
>      C(0x4e00, CVD,     RX_a,  Z,   r1_o, a2, 0, 0, cvd, 0)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


