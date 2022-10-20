Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26196062F0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:26:05 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWUm-0008Bl-30
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:26:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWQt-0007Cc-1N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olTzB-0003dq-J9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:45:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olTz8-0004y7-V1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666266313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw3Ir9VfWrfjPV4hrdmmAKBgtOMIyc0LxQgAEr4gqCA=;
 b=YU8QUB10QTMRx3KaW0FVsNApVHOp7oD8YIjES5RoOXDijEM0GjwKipQkFjFZKMNLa5KfPq
 u/+CugwsZ8yNhOuNl1m/UpIhVjs2seAUg+DEsQO5mwuKEIeMhdY0+Tndn4ICbv8ggEodst
 UYW33+KazuvgRWauugTu3l4bu9+KIfE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-kJUQsXr7NmWJt0vdijju6w-1; Thu, 20 Oct 2022 07:45:10 -0400
X-MC-Unique: kJUQsXr7NmWJt0vdijju6w-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq13-20020a1709073f0d00b0078dce6a32fcso9407299ejc.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lw3Ir9VfWrfjPV4hrdmmAKBgtOMIyc0LxQgAEr4gqCA=;
 b=xaIec/yQ/5vJBKIVjufW916HSlvZNtZgK95it2KRe9vbsF3IAkJ7jhdbWPvBHOSq5G
 rhMnga13C9WvStsAhQYwxmWu8Wpb8UtnVqxO69oKnrqkbQIoOiq/bn/4mcZ+Y+Yz1ozF
 6HbmNAzEiPFOu6zJ9hwMFJxjyWNnZk5PPooJBLgRQcrC+h0BaW4mLJJaOqixBmyTZIEd
 F4lXtq5Q1qnFW8XleKrM2gxB7VTUmHVeEELTULmK43suDzAKCwlPZrgVvpaHE49wHKe+
 qVsyKtVqoLtOG+wliM+MdVD3EdLCk4+PQh5DQN+CZmrx6ZeGSw6T7YLNHLtZuoO8804c
 62sQ==
X-Gm-Message-State: ACrzQf0/mXyeuuOmYsSQHWQHAQisD+CUSLlM1q6VEf0zwJvn5PrMijqM
 qrExSy7jPiCgkGgokt19y9+XvkOPIhET+eB8SgHiyNphOlh4eQCp5Xo9EseUg12rL7hgKKzkTy9
 umaur/IJUGjIkOSY=
X-Received: by 2002:a05:6402:42c6:b0:45c:fc58:bd0f with SMTP id
 i6-20020a05640242c600b0045cfc58bd0fmr11975019edc.19.1666266308978; 
 Thu, 20 Oct 2022 04:45:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5w08J481Rpi6U5iLJJYZSPLBZcC+cWzobrDDSkQ99JA9jKzekemGIYCTwlne59SbcOUXnHRA==
X-Received: by 2002:a05:6402:42c6:b0:45c:fc58:bd0f with SMTP id
 i6-20020a05640242c600b0045cfc58bd0fmr11974999edc.19.1666266308742; 
 Thu, 20 Oct 2022 04:45:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hx15-20020a170906846f00b0074134543f82sm10307124ejc.90.2022.10.20.04.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:45:08 -0700 (PDT)
Date: Thu, 20 Oct 2022 13:45:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 jingqi.liu@intel.com, qemu-devel@nongnu.org, robert.hu@intel.com
Subject: Re: [PATCH v4 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20221020134506.64647015@redhat.com>
In-Reply-To: <20220922122155.1326543-5-robert.hu@linux.intel.com>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-5-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 22 Sep 2022 20:21:54 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W}, which
> deprecates corresponding _DSM Functions defined by PMEM _DSM Interface spec
> [2].
> 
> Since the semantics of the new Label Methods are almost same as old _DSM
> methods, the implementations here simply wrapper old ones.
> 
> ASL form diff can be found in next patch of updating golden master
> binaries.
> 
> [1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
> [2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/nvdimm.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index afff911c1e..a3b25a92f3 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1243,6 +1243,7 @@ static void nvdimm_build_fit(Aml *dev)
>  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>  {
>      uint32_t slot;
> +    Aml *method, *pkg, *field, *com_call;
>  
>      for (slot = 0; slot < ram_slots; slot++) {
>          uint32_t handle = nvdimm_slot_to_handle(slot);
> @@ -1260,6 +1261,100 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>           */
>          aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
>  
> +        /*
> +         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
> +         */
> +        /* _LSI */
> +        method = aml_method("_LSI", 0, AML_SERIALIZED);
> +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> +                            aml_int(1), aml_int(4), aml_int(0),
> +                            aml_int(handle));
> +        aml_append(method, aml_store(com_call, aml_local(0)));
> +
> +        aml_append(method, aml_create_dword_field(aml_local(0),
> +                                                  aml_int(0), "STTS"));
> +        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(4),
> +                                                  "SLSA"));
> +        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(8),
> +                                                  "MAXT"));
> +
> +        pkg = aml_package(3);
> +        aml_append(pkg, aml_name("STTS"));
> +        aml_append(pkg, aml_name("SLSA"));
> +        aml_append(pkg, aml_name("MAXT"));
> +        aml_append(method, aml_store(pkg, aml_local(1)));
> +        aml_append(method, aml_return(aml_local(1)));
> +
> +        aml_append(nvdimm_dev, method);
> +
> +        /* _LSR */
> +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> +        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
> +
> +        aml_append(method, aml_create_dword_field(aml_name("INPT"),
> +                                                  aml_int(0), "OFST"));
> +        aml_append(method, aml_create_dword_field(aml_name("INPT"),
> +                                                  aml_int(4), "LEN"));
> +        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
> +        aml_append(method, aml_store(aml_arg(1), aml_name("LEN")));
> +
> +        pkg = aml_package(1);
> +        aml_append(pkg, aml_name("INPT"));
> +        aml_append(method, aml_store(pkg, aml_local(0)));
> +
> +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> +                            aml_int(1), aml_int(5), aml_local(0),
> +                            aml_int(handle));
> +        aml_append(method, aml_store(com_call, aml_local(3)));
> +        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
> +        aml_append(method, field);
> +        field = aml_create_field(aml_local(3), aml_int(32),
> +                                 aml_shiftleft(aml_name("LEN"), aml_int(3)),
> +                                 "LDAT");
> +        aml_append(method, field);
> +        aml_append(method, aml_name_decl("LSA", aml_buffer(0, NULL)));
> +        aml_append(method, aml_to_buffer(aml_name("LDAT"), aml_name("LSA")));
> +
> +        pkg = aml_package(2);
> +        aml_append(pkg, aml_name("STTS"));
> +        aml_append(pkg, aml_name("LSA"));
> +
> +        aml_append(method, aml_store(pkg, aml_local(1)));
> +        aml_append(method, aml_return(aml_local(1)));
> +
> +        aml_append(nvdimm_dev, method);
> +
> +        /* _LSW */
> +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> +        aml_append(method, aml_store(aml_arg(2), aml_local(2)));
> +        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
> +        field = aml_create_dword_field(aml_name("INPT"),
> +                                                  aml_int(0), "OFST");
> +        aml_append(method, field);
> +        field = aml_create_dword_field(aml_name("INPT"),
> +                                                  aml_int(4), "TLEN");
> +        aml_append(method, field);
> +        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
> +        aml_append(method, aml_store(aml_arg(1), aml_name("TLEN")));
> +
> +        aml_append(method, aml_concatenate(aml_name("INPT"), aml_local(2),
> +                                            aml_name("INPT")));
> +        pkg = aml_package(1);
> +        aml_append(pkg, aml_name("INPT"));
> +        aml_append(method, aml_store(pkg, aml_local(0)));
> +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> +                            aml_int(1), aml_int(6), aml_local(0),
> +                            aml_int(handle));
> +        aml_append(method, aml_store(com_call, aml_local(3)));
> +        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
> +        aml_append(method, field);
> +        aml_append(method, aml_return(aml_name("STTS")));
> +
> +        aml_append(nvdimm_dev, method);
> +
>          nvdimm_build_device_dsm(nvdimm_dev, handle);
>          aml_append(root_dev, nvdimm_dev);
>      }


