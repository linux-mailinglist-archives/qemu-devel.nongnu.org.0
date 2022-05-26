Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29874534F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:39:51 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCmM-0003I1-6v
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCYL-0008Fa-MV
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCYI-00034i-MG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiK7oLaNyQ97Rr7aPIZFSL6fAgvz9b/oxgmxveTBSqk=;
 b=Sh64cucb/OICSXEMXICcWXRtgHXp+q2evJvbuaWsNYTQMV19eFtiAHJlfyh2QlR7Xkd98f
 Vu2/2IoPRuVwOaNnLicOO8/du9ZSD0xDv6tNRsisaqiJJ5uHcW7XFDYVMmnQ50cxY5qOvr
 GPYwLimzRS+Gk5ADxgnrGC0A+yOqdqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-m-RO4rPkPsybzHYzIZu69w-1; Thu, 26 May 2022 08:25:16 -0400
X-MC-Unique: m-RO4rPkPsybzHYzIZu69w-1
Received: by mail-ed1-f69.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so962769edr.14
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiK7oLaNyQ97Rr7aPIZFSL6fAgvz9b/oxgmxveTBSqk=;
 b=N5LOe3zoIFhtSSv3jbvuSgxZHwy20YIxGlxQgL0SgzFmYz/cBS+pVsykMXs27INxYj
 PPUW4b014X1vHa9hXXSLhtdA3yCJgCNiUTXIR7UiXm3U2x09BzclnduCk43AZV2mAh/7
 K0zt9rsfRXnBBA3O7s4v4SZncGLWyYJG9SS7RoMuR2kRnpLDyvgJr/ibI9bM9EvPHxIA
 65r99MYCnGIAV1Z0iu9lJy1e405CRlY2GXC9YwvFGO4/aCgwivMzt9zV/r9zarA1yvp8
 eY0fuPNp6w/cnwPnwqU/eY41OMLjPiO6/oIAx7FTCtjH7mMq8od3DB2NRKHaPEUUcUuK
 KXZg==
X-Gm-Message-State: AOAM530SaDbLTanat+i77sd4BE65NkGPtXjVEtA1lOp79xuyXVOxBf+W
 4zTPt7Fi15LH68ADh+cpVJqx3G8M6fFox/5GKGi9RAKokgJa3+9zioyRkzdZE+Ok3kcLcXzW+yr
 2xuNxnDD+L0wjQYU=
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr32606479ejb.398.1653567915603; 
 Thu, 26 May 2022 05:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpVAxpOmBkRwv3Mirr+P30PDtdhpAw7K2opD7X32/cE5trOlvEvqti0LLofhpNzrhnbCHB4w==
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr32606454ejb.398.1653567915381; 
 Thu, 26 May 2022 05:25:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b006f3ef214de7sm478722ejz.77.2022.05.26.05.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 05:25:14 -0700 (PDT)
Date: Thu, 26 May 2022 14:25:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 2/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220526142512.32129b2e@redhat.com>
In-Reply-To: <20220518092141.1050852-3-gshan@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
 <20220518092141.1050852-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 18 May 2022 17:21:40 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The {socket, cluster, core} IDs detected from Linux guest aren't
> matching with what have been provided in PPTT. The flag used for
> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> nodes.

To permit this flag set  on no leaf nodes we have to have
a corresponding containers built for them in DSDT so that
'ACPI Processor ID' could be matched with containers '_UID's.
If we don not build such containers then setting this flag is
not correct. And I don't recall QEMU building CPU hierarchy
in DSDT.

> In this case, Linux guest takes the offset between the
> node and PPTT header as the corresponding IDs, as the following
> logs show.

perhaps it's kernel which should be fixed to handle
not set 'ACPI Processor ID valid' correctly.

> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>   -accel kvm -machine virt,gic-version=host -cpu host        \
>   -smp 8,sockets=2,clusters=2,cores=2,threads=1
>     :
> 
>   # cd /sys/devices/system/cpu
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>     36  36  36  36  36  36  36  36
>     336 336 336 336 336 336 336 336
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>     56  56  56  56  196 196 196 196
>     356 356 356 356 496 496 496 496
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>     76  76  136 136 216 216 276 276
>     376 376 436 436 516 516 576 576
> 
> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> what have been provided in PPTT.
> 
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>   0 0 0 0 0 0 0 0
>   1 1 1 1 1 1 1 1
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>   0 0 0 0 1 1 1 1
>   0 0 0 0 1 1 1 1
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>   0 0 1 1 0 0 1 1
>   0 0 1 1 0 0 1 1
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/aml-build.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..89f191fd3b 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2026,7 +2026,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>              core_id = -1;
>              socket_offset = table_data->len - pptt_start;
>              build_processor_hierarchy_node(table_data,
> -                (1 << 0), /* Physical package */
> +                (1 << 0) | /* Physical package */
> +                (1 << 1),  /* ACPI Processor ID valid */
>                  0, socket_id, NULL, 0);
>          }
>  
> @@ -2037,7 +2038,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  core_id = -1;
>                  cluster_offset = table_data->len - pptt_start;
>                  build_processor_hierarchy_node(table_data,
> -                    (0 << 0), /* Not a physical package */
> +                    (0 << 0) | /* Not a physical package */
> +                    (1 << 1),  /* ACPI Processor ID valid */
>                      socket_offset, cluster_id, NULL, 0);
>              }
>          } else {
> @@ -2055,7 +2057,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  core_id = cpus->cpus[n].props.core_id;
>                  core_offset = table_data->len - pptt_start;
>                  build_processor_hierarchy_node(table_data,
> -                    (0 << 0), /* Not a physical package */
> +                    (0 << 0) | /* Not a physical package */
> +                    (1 << 1),  /* ACPI Processor ID valid */
>                      cluster_offset, core_id, NULL, 0);
>              }
>  


