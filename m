Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C890B316684
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:23:33 +0100 (CET)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9oWq-0001O9-Sa
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9oW2-0000el-4C
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:22:42 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:53586 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9oW0-0007tY-FY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:22:41 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2C719411F8;
 Wed, 10 Feb 2021 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1612959757; x=1614774158; bh=1o7/+MsEdEYQchwfbcFrC0
 47fsEZwMy+KKDwB2H2xhI=; b=oIAhJQ/lE11cmHbrDDEfwYwBj0yopHrjWSWlMJ
 vuI9tH5/u30d77pyg0BYmggwTQu2vjPo087aYovf+vJxx7YFRT1fJt99SI9dm9OE
 oFfZEN9tP+wlLA8pOX9uPiuXfFla2v3nDszqv1fvD5wDtRMKg+wKmaUixTnfkTjH
 Y8IlM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mogTVY2Y2Vum; Wed, 10 Feb 2021 15:22:37 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0C0644127F;
 Wed, 10 Feb 2021 15:22:37 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 10
 Feb 2021 15:22:36 +0300
Date: Wed, 10 Feb 2021 15:22:36 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v16 02/23] target/riscv: remove CONFIG_TCG, as it is
 always TCG
Message-ID: <20210210122236.xllr7snnl2xiofln@SPB-NB-133.local>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-3-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204163931.7358-3-cfontana@suse.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 05:39:10PM +0100, Claudio Fontana wrote:
> for now only TCG is allowed as an accelerator for riscv,
> so remove the CONFIG_TCG use.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/riscv/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 567f6790a9..60d0b43153 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -617,10 +617,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  #endif
>      cc->gdb_arch_name = riscv_gdb_arch_name;
>      cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
> -#ifdef CONFIG_TCG
>      cc->tcg_ops.initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> -#endif
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  

I'm not sure if it should be dropped because it might be readded soon
because of: https://lwn.net/Articles/830078/

Regards,
Roman

