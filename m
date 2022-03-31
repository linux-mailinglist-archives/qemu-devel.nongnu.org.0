Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD54ED8BF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:55:57 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtPA-00080J-7v
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:55:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtLU-0005WR-Gp
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtLR-0008Kx-LF
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648727524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/M0AWNBJSs2dY/6c7bGdw17tn3fUKpw0NOTE+Wnikk=;
 b=Wj/iCs4z/HLtEokKf7hucdsCCNvHz6EJrwblFYslIs5vO9UC/au0CnnqkWJpeDVT3ZlD/S
 4QLbLSEURITOWEgTLjvoqZPiiEyWSpNSQzgfK0ihqRV4mX2tg1cDGJPIzV7z2TtiD4C+8h
 6mrCCTdFDYRYKYYWiAIluVD5ESd5Fng=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-KsrOB3YDPsuOAScltf3yLg-1; Thu, 31 Mar 2022 07:52:02 -0400
X-MC-Unique: KsrOB3YDPsuOAScltf3yLg-1
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso11422992ejs.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 04:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/M0AWNBJSs2dY/6c7bGdw17tn3fUKpw0NOTE+Wnikk=;
 b=zBZqPNSUnlhazXgCoNPfkF8/iVd4sZRtYTDYFrm8bq5WvPKyBZkZwDR2Ld6MDJ11Mh
 hyh61VbgZUlADmVxw7rpX7pCaoxY0QB/AGrwYsU40ldOq5w9eHBPY1wHMwY54tqVASKK
 cKYKMEOF1MtKfzqkw0RcKF7dZgsxRuATd2ejMiTI0NJ00M0sgEcRQKiyXt3M5Mz5V1SZ
 RfLToTGf5K5YNFjwdCUPYd21o/u6h3KhSWZWtCBNmwNKqKLUaqHmz6MSxOebcwd1XS45
 nXyaGi19J6HhzG0gp6F6JdD7nl5xiDbcvGWo8+JFSziKkwyJtmpeVMJXlxt7v2f5Sx9o
 P43A==
X-Gm-Message-State: AOAM531vbhqsdGaR5y0BoKvy0vZY1vYIlmUm78w9pzdWUxFH25DnqFz0
 D2TnFtDC7gHOtlvaYWdwaZgaitCr5+selz2S6S8lk/NmhiXzWrA4nAfGmk3VC8u5yGY2N3TiHdJ
 32UVYRklFdLVv4TQ=
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr4440906ejc.343.1648727521670; 
 Thu, 31 Mar 2022 04:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwobGmv5wU+UmgGm5AuyHG+jFSXdqfdUZ00BZQIqwgV2BaSdLaIcwZrSSxrrvJti5uG+KTuWA==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr4440881ejc.343.1648727521450; 
 Thu, 31 Mar 2022 04:52:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 fq31-20020a1709069d9f00b006e4b8ca9675sm233560ejc.19.2022.03.31.04.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 04:52:01 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:51:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Maxim Davydov <maxim.davydov@openvz.org>
Subject: Re: [PATCH v1 0/9] Machine type compatible properties
Message-ID: <20220331135159.60051a31@redhat.com>
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, armbru@redhat.com,
 crosa@redhat.com, qemu-devel@nongnu.org, lizhijian@fujitsu.com,
 f4bug@amsat.org, wangyanan55@huawei.com, marcandre.lureau@redhat.com,
 chen.zhang@intel.com, jsnow@redhat.com, pbonzini@redhat.com, ani@anisinha.ca,
 den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 00:15:30 +0300
Maxim Davydov <maxim.davydov@openvz.org> wrote:

> We need to be able to check machine type after its definition. It's
> necessary when using complicated inheritance of compatible features. For
> instance, this tool can help to find bugs in the machine type definition
> if the name of the device has been changed. Also, this tool was created
> to help with MTs of other projects such as vz branches.

a comment to all patches where "after initialization" is mentioned.
Pls rewrite commit messages so that it would be clear what that means
and describe in detail why current code needs fixing.

> 
> Maxim Davydov (9):
>   qmp: Add dump machine type compatible properties
>   pci: add null-pointer check
>   mem: appropriate handling getting mem region
>   msmouse: add appropriate unregister handler
>   wctablet: add appropriate unregister handler
>   chardev: add appropriate getting address
>   colo-compare: safe finalization
>   qom: add command to print initial properties
>   scripts: printing machine type compat properties
> 
>  chardev/char-socket.c       |   9 ++
>  chardev/msmouse.c           |   4 +-
>  chardev/wctablet.c          |   4 +-
>  hw/core/machine-qmp-cmds.c  |  25 +++-
>  hw/i386/sgx-epc.c           |   5 +-
>  hw/mem/nvdimm.c             |   6 +
>  hw/mem/pc-dimm.c            |   5 +
>  hw/pci-host/i440fx.c        |  17 ++-
>  hw/pci-host/q35.c           |  17 ++-
>  net/colo-compare.c          |  25 ++--
>  qapi/machine.json           |  58 +++++++-
>  qapi/qom.json               |  69 +++++++++
>  qom/qom-qmp-cmds.c          | 121 ++++++++++++++++
>  scripts/print_MT.py         | 274 ++++++++++++++++++++++++++++++++++++
>  tests/qtest/fuzz/qos_fuzz.c |   2 +-
>  15 files changed, 613 insertions(+), 28 deletions(-)
>  create mode 100755 scripts/print_MT.py
> 


