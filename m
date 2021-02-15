Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD531C0E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:47:00 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhxa-00088m-T3
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhv5-0006jn-Nq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:44:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhv3-0002pS-OT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613411059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBW8GAPO8nV9sbvHGqa7X0MCAzyy/jooHpSPE9j6v+4=;
 b=Axo+iYBn/HAhr+uKgq6ruR2YaRopMb3S9ZueUUVVCzj9xgRBdU6yUopD889U02Vne7X3A8
 4H7fddZZn+bvJhqchp+1DdfAsnp2aB2EJBoINLqxX11rmcMm+Sk+a486NwAtCy8IGS1xYg
 8o+je8QqoMTKqVU7THHxuXhNHKaRDcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-40sdEXSZPWKTUJ5kkPGPjg-1; Mon, 15 Feb 2021 12:44:18 -0500
X-MC-Unique: 40sdEXSZPWKTUJ5kkPGPjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 456266EE20;
 Mon, 15 Feb 2021 17:44:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AB05B697;
 Mon, 15 Feb 2021 17:44:06 +0000 (UTC)
Date: Mon, 15 Feb 2021 18:44:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH] acpi: Remove duplicated code handling OEM ID and OEM
 table ID fields
Message-ID: <20210215184404.7e342872@redhat.com>
In-Reply-To: <20210213102233.11428-1-posteuca@mutex.one>
References: <20210213102233.11428-1-posteuca@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list:ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Feb 2021 12:22:33 +0200
Marian Postevca <posteuca@mutex.one> wrote:

> The code handling OEM ID and OEM table ID fields had some duplicated
> code and was using unnecessary dynamically allocated memory.
> This change fixes that.
> 
> Signed-off-by: Marian Postevca <posteuca@mutex.one>
[...]
>  24 files changed, 190 insertions(+), 159 deletions(-)
hmm, looks like adding instead of removing

[...]
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -25,6 +25,7 @@
>  #include "hw/boards.h"
>  #include "hw/i386/x86.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  #include "hw/pci-host/gpex.h"
>  #include "qom/object.h"
>  
> @@ -106,8 +107,7 @@ struct MicrovmMachineState {
>      Notifier machine_done;
>      Notifier powerdown_req;
>      struct GPEXConfig gpex;
> -    char *oem_id;
> -    char *oem_table_id;
> +    struct AcpiBuildOem bld_oem;
have you considered, putting this field into X86MachineState?
(that way you will be able to handle both PC and microvm in one place,
without duplication io init/property setters)

>  };
>  
>  #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")



