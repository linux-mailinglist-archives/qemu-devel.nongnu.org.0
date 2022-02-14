Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156374B521D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:50:15 +0100 (CET)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbk5-0007q8-27
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:50:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJarD-0001kO-OM
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJar9-0006pr-2l
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644843189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f07RiLzLqUJTBbT5RlNYPtaBUMmuSJasFAYRVYASZQg=;
 b=R3dA+GoyQSvYPLqm6wbR2oNqlP/oEEn6FazqHP8tgCFYdEJyJbmHY5NdZEug2T8c0eF7Mh
 lN1w+cqYrKqb4uE3BCRhiU1vlglL0C6Pxh8l6P1rjCp3UcMP2KLS6fPDnOSL9xE1cjs+7b
 2beaNkGC+gb6K7MsPz1l7ayprWu/rjU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-fykFJyDkMi-SxLVAbEj9kQ-1; Mon, 14 Feb 2022 07:53:08 -0500
X-MC-Unique: fykFJyDkMi-SxLVAbEj9kQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z21-20020a05640235d500b0041092b29ad6so3949123edc.19
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f07RiLzLqUJTBbT5RlNYPtaBUMmuSJasFAYRVYASZQg=;
 b=oS8Muwk4UTkW/qNWVnd86K6vFhEzPRFRY7Tg3qUbIrLHVlztepBiy7IQvlkprbNpEU
 WNET5woBh//pe2N3vZ3TsgYZFDx51+U7aB7uBdS+AQ1FS6ddm2d3WKeoZVg9+TI3G9W+
 4XOXNfheQdzz6CXXb/i7UxaIROnqIc+y9YIKsoYqyLlE8DB2NSXgb0kINg/XVnTD1j3T
 XYqpBqytoUL4zz/08PtwfA6P9C2kuVMv+IG4dw4T7WlGUzYJQJTE/yk5hbVe7TtuFHYQ
 ScRtYLnPrfNPuT8R6Ri6M9DOaw5dARZ/wgilm5x1eLtvx20Z5Kb7IkmrZZtSWF7zPunE
 T8Wg==
X-Gm-Message-State: AOAM5317RzzegFNbTDTOXoixvyokesZtxreI5Gtewe1Yg7Rm9zy+C/gm
 XYjDqlG1JNLycO05ZHPN11atLZ9AA/1VQz3m9AD7vvtCylJNK/31FMHMC8+qXhiE0ruMczAu5CD
 cLPM+21+kH4FXVMg=
X-Received: by 2002:a17:906:16da:: with SMTP id
 t26mr5374186ejd.166.1644843186847; 
 Mon, 14 Feb 2022 04:53:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdUwYZb8oSc48Z6iIe7uB2zqfRFG2xlC3OEjSRXxUifyYJjOC1mDxjzRRKOES4SOM5+RFP5A==
X-Received: by 2002:a17:906:16da:: with SMTP id
 t26mr5374135ejd.166.1644843186149; 
 Mon, 14 Feb 2022 04:53:06 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id i14sm10553266ejp.181.2022.02.14.04.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:53:05 -0800 (PST)
Date: Mon, 14 Feb 2022 13:53:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 3/3] hw/smbios: add an assertion to ensure tables 19
 and 32 do not collide
Message-ID: <20220214135304.044ff25e@redhat.com>
In-Reply-To: <20220207113129.2701722-4-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
 <20220207113129.2701722-4-ani@anisinha.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  7 Feb 2022 17:01:29 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Since change b3cddba9c14b034 ("hw/smbios: fix table memory corruption with large memory vms")
> we reserve additional memory space between tables 17 and 19 for large VMs.
> This may cause table 19 to collide with table 32 for those VMs. This change
> adds an assertion to make sure table 19 does not extend into the memory used
> by table 32.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/smbios/smbios.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index d7de740363..800a35e9a5 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1048,6 +1048,9 @@ void smbios_get_tables(MachineState *ms,
>                                         mem_array[i].length);
>          }
>  
> +        /* we need to make sure table 19 and table 32 do not overlap */
same as in 2/3 (here and commit message), tables do not overlap

> +        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
> +
>          smbios_build_type_32_table();
>          smbios_build_type_38_table();
>          smbios_build_type_41_table(errp);


