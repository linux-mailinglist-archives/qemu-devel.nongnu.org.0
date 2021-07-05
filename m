Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBB3BBA41
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:35:59 +0200 (CEST)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0L1C-0006rP-6G
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0Kz4-0005Hr-Ur
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0Kz3-00045d-G0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F13z4RKpfmbFGA0W6p8rYIem5hbXHw/Nn8rHddkdZI0=;
 b=C8Y39BTN4kd4urx9XgK6AhLTkcu4VQzYbyI8KgcR0MtixJrjmMwY7F6/OPAg0iNZ6JYisD
 DyR+KFrcvarhQOxGf/RI9DvtW3lbWG4yttFTJ3yrLkRFAgNvkv+oamxYuyedlIZ2LJh1UY
 xI0/Eq9WHyBVLu3n3DdelPh8DFPcctY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-GUuEXFWaMtGiy-K7jqPw-A-1; Mon, 05 Jul 2021 05:33:43 -0400
X-MC-Unique: GUuEXFWaMtGiy-K7jqPw-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so2839161wrr.19
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F13z4RKpfmbFGA0W6p8rYIem5hbXHw/Nn8rHddkdZI0=;
 b=KwwdBOUezPpvz2Q1D31BZSSGhPlPvNeOQSC/jaoeOQzPUkB5VwTWO+MohPwsflZQAj
 UWBj3txpKoe6+GTv+SXTFDB7bCe2AlMOrMdAu7VKY12Y/VrdD0QeRw7ckNGZ3gp9S5uF
 AdZG/zmiWKpbMVTb19eGgKy585Xv3Ch5MwDJjO+IwEB/0Y/ZRaiZp1caX1zA6sLcCyyN
 MHST+RX6hq5U8zOSgtLjJhkAcpHXLksnylOmVymz80AhwJbRb3RrS43iYL7TVK2zOXkP
 2nwLZIHPLQJIg2xtfo6mo0nb2yeUQ55SNDJXq9Vc44lMH4dugCHgTBJy6wSyhIzGIZCr
 eFKw==
X-Gm-Message-State: AOAM533dybsfM4KS/b1FF4M4NyJQIU6WhQ/jNjR/um30CTuohrK7/g/Z
 jUtp3n/t1wSdj1CzVVMnYCdGfyOvE6qANcFQmV46wt2JGhvokaa3vf8FYRne5CweG2mxXB5Lmyr
 +11JTSrSfHcHJIyA=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr13253236wmh.183.1625477622373; 
 Mon, 05 Jul 2021 02:33:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaV18QdHRfZdbFYfNXvyLZwmlQ6jk9S9N+39XnGhS16OuZBuKoJlMSvjj2m0qcd19D7bDBAw==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr13253212wmh.183.1625477622105; 
 Mon, 05 Jul 2021 02:33:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e1e.dip0.t-ipconnect.de. [217.87.94.30])
 by smtp.gmail.com with ESMTPSA id m12sm11356421wms.24.2021.07.05.02.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:33:41 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY SUM
 LOGICAL
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210705090341.58289-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <32680adc-edb8-a24c-a4eb-ae9bb4de1451@redhat.com>
Date: Mon, 5 Jul 2021 11:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705090341.58289-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 11.03, David Hildenbrand wrote:
> The element size is located in m5, not in m4. As there is no m4, qemu
> currently crashes with an assertion, trying to lookup that field.
> 
> Reproduced and tested via GO, which ends up using VMSL once the
> Vector enhancements facility is around for verifying certificates with
> elliptic curves.
> 
> Reported-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/449
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/translate_vx.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
> index a9d51b1f4c..0afa46e463 100644
> --- a/target/s390x/translate_vx.c.inc
> +++ b/target/s390x/translate_vx.c.inc
> @@ -1783,7 +1783,7 @@ static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
>   {
>       TCGv_i64 l1, h1, l2, h2;
>   
> -    if (get_field(s, m4) != ES_64) {
> +    if (get_field(s, m5) != ES_64) {
>           gen_program_exception(s, PGM_SPECIFICATION);
>           return DISAS_NORETURN;
>       }

Looks right.

Reviewed-by: Thomas Huth <thuth@redhat.com>


