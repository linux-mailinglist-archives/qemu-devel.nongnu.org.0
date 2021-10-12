Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E370242A013
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 10:41:29 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDLi-0007ep-Rm
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 04:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maD6o-0006QS-VD
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maD6j-0008IN-Jq
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634027154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSS80wMPJsRFNKXwFkxUV2k/uLaIRtboZtEp4CRKFAk=;
 b=i1Q/5Z5O5oJaISzHJDmz9uitjQtsw2XIoFCwZmH1r7N8GH5Am6RRltj/h5o0lci8rZ4Jp8
 nBaAIjnfSl4MbqfYEMmRoeixVGcIMqX19ViAYpFcAuH6yAD9HAzt83ZwbqPyUuBBMzv8Cf
 r38JAuD9JncXbgTKDhzXORsr8gYbWCo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-FoEcgt2uOWGnBuab52NN8A-1; Tue, 12 Oct 2021 04:25:53 -0400
X-MC-Unique: FoEcgt2uOWGnBuab52NN8A-1
Received: by mail-ed1-f69.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so18298154edj.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 01:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSS80wMPJsRFNKXwFkxUV2k/uLaIRtboZtEp4CRKFAk=;
 b=y289nOow6n3ADgzejiIP7IEbquiplqZ49Gtrcf7m/jOX1r+Qpx4JsRyeOFCXTk6sdW
 3tHFRlzAOhihKNbLKabraj9QIMYokaDtQLcCUTRaSxVOL3e1u2bbpD7Opc4yQA7Gp5js
 L64V2P+xBJdbF1FTfO7wLAmYq8QdiYsUrBPOmjQYw+lnGitSCYvrMgDXPGAQCEaRaqgH
 Ri0pLZRybgqXIjg+VqLKKcaj99TrVHVfXkymzxjI/6McN/ujs5EnveCLs3orPBmhOvXT
 3HC2ch1HWveuuFP4JnWXvLUm/X6bvSd37RiubQVB4PxIVtyejb8Y5ltvfnFoJRzhOa8q
 jLHw==
X-Gm-Message-State: AOAM53070ZIIjVXE4JqYV86uAIFHduwgBe8ZByH7l8xc10wTD4f6i1DJ
 teqrkXSqsfgoz0xj2Seuzq2O0jeALkITTekvZHPf24A4MPxOZd4AzKNNVmOIZ3IGTAsP+Owuil8
 FExS/zTNMZe0bLfM=
X-Received: by 2002:a17:907:1dd2:: with SMTP id
 og18mr26671166ejc.267.1634027152472; 
 Tue, 12 Oct 2021 01:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe246h18tZf4ISgV1gX6u5NNbxIMGO5QoZIZAvwbQRNN38NtJ/xG9j886d2VpAn57kbXVnKA==
X-Received: by 2002:a17:907:1dd2:: with SMTP id
 og18mr26671141ejc.267.1634027152271; 
 Tue, 12 Oct 2021 01:25:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d25sm5466717edt.51.2021.10.12.01.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 01:25:51 -0700 (PDT)
Date: Tue, 12 Oct 2021 10:25:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
Message-ID: <20211012102550.2d68596e@redhat.com>
In-Reply-To: <20211011174522.14351-2-david@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-2-david@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021 19:45:20 +0200
David Hildenbrand <david@redhat.com> wrote:

> memory_region_is_mapped() is the wrong check, we actually want to check
> whether the backend is already marked mapped.
> 
> For example, memory regions mapped via an alias, such as NVDIMMs,
> currently don't make memory_region_is_mapped() return "true". As the
> machine is initialized before any memory devices (and thereby before
> NVDIMMs are initialized), this isn't a fix but merely a cleanup.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..a1db865939 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1260,7 +1260,7 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
>  {
>      MemoryRegion *ret = host_memory_backend_get_memory(backend);
>  
> -    if (memory_region_is_mapped(ret)) {
> +    if (host_memory_backend_is_mapped(backend)) {
>          error_report("memory backend %s can't be used multiple times.",
>                       object_get_canonical_path_component(OBJECT(backend)));
>          exit(EXIT_FAILURE);


