Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DDC4D5F15
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:04:20 +0100 (CET)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSc8B-0002zq-2F
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc6B-0001Ox-AP
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc69-0002Ed-Pw
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646992933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tNmzlgRJAEY2MZe3uhAKK4Ra3BWZwD/xWpjuWQY514=;
 b=Zss1kBNb2k8Di/MZliPWRlemmuofukcBvwEcxFPJgzuCWdyk4O/FJiXvfFZzWRZ+KjIzj3
 IdLs4KehIPzbltxt7DMNBJkCkVPXhPvx5kEbL2h1b4tWYkFQbzufwqKKpYxHZtKsVWMk47
 4/lBQOOQfqytW5x2o5ovWR4+ZF+2kPM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-_l_UlQ2DP6Oi10CnGjpWCw-1; Fri, 11 Mar 2022 05:02:12 -0500
X-MC-Unique: _l_UlQ2DP6Oi10CnGjpWCw-1
Received: by mail-ej1-f71.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so4673232ejc.11
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tNmzlgRJAEY2MZe3uhAKK4Ra3BWZwD/xWpjuWQY514=;
 b=fIJpXi1XWOWHXLHAhRXd8S4uiAc3k732LrILPUtUYBKZKuUVYefBvh+H4Lz2G77LMC
 CdsfP3jYoSy0EiislEOxVR/HIUxmdna9eAsZEAVykvKXkBR0ZRGOrSpw0JbglBQEqvhM
 jm4r3PyXdkMJldIpoZLTALnVtW50gf9015Ohp3e4E4Nt90GRYXkfeKn697UYQX7DUzPR
 GQbK5rgkADMeIJ0qQbR11++lPh64QnMg5Ko9qB5REl9f5WEmRma+GP4AbZdrFRb05R+L
 m7ZN+/bczbzdWYeexAZl1urYWklV3FkntQ7cTMmwGvXdmSiyq9T6WhYPRQtYdCMDglVH
 C4hg==
X-Gm-Message-State: AOAM532H8QKqe1VZxlSZQzLblbfoaP1Lf6FM2FYrAT9Xnu+qh5gClAON
 FGAztN7StgI/76/6IBhW48A9amT1HdYQriv0/z+D8KnQ6BnQCBacQByCg3jIBbQLfQ634lhgqGz
 Yz10S8irIOd36O6A=
X-Received: by 2002:a17:907:3d92:b0:6da:8247:cbf1 with SMTP id
 he18-20020a1709073d9200b006da8247cbf1mr7621135ejc.205.1646992929774; 
 Fri, 11 Mar 2022 02:02:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTL1xlegyMPaeq69N56KOtvMd8CJNpeancysZAFuBzXu+thiAsDqDwushbZRyYhZ+FUUO1xg==
X-Received: by 2002:a17:907:3d92:b0:6da:8247:cbf1 with SMTP id
 he18-20020a1709073d9200b006da8247cbf1mr7621116ejc.205.1646992929546; 
 Fri, 11 Mar 2022 02:02:09 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1709062dd200b006db26396622sm2734852eji.212.2022.03.11.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:02:09 -0800 (PST)
Date: Fri, 11 Mar 2022 11:02:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 07/11] tests/acpi: update expected data files
Message-ID: <20220311110207.0ce4d254@redhat.com>
In-Reply-To: <20220311053759.875785-8-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-8-kraxel@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Mar 2022 06:37:55 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> The switch to edk2 RELEASE builds changes the memory layout a bit,
> resulting in a acpi table change.
> 
>  DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
>  {
>      Scope (\_SB)
>      {
>          Device (NVDR)
>          {
>              Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
>              Method (NCAL, 5, Serialized)
>              {
>                  Local6 = MEMA /* \MEMA */
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x02))
>                  }
>              }
> 
>              Device (NV02)
>              {
>                  Name (_ADR, 0x03)  // _ADR: Address
>                  Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x03))
>                  }
>              }
>          }
>      }
> 
> -    Name (MEMA, 0x43D10000)
> +    Name (MEMA, 0x43F50000)
>  }
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/SSDT.memhp | Bin 736 -> 736 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index 375d7b6fc85a484f492a26ccd355c205f2c34473..4c363a6d95a7e2e826568c85f5719127748e7932 100644
> GIT binary patch
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqx43uD@;sZodHo~2HXGu
> 
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqy0v%D@;rmodHrj2HXGu
> 


