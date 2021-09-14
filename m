Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F740B466
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:19:47 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB9u-0003IM-Ut
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAnD-0006q0-0K
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAnB-0005yz-6O
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvbaR4siX+UmcDyt9P9szfpUDo4ZhL/40dNM542qLYQ=;
 b=FXjqHXziAhH3EgN08UBhpRrmB0urQYnzgotkkJLL23z9TtEktJG3Cab1OGwSs2ItYVao1c
 xlwGUScoo+E/JJLZ5UnTOco3AiWLL0a+r7ylkrtOfXerIKzU1HtxFJz9j2aEDBS10o2mJZ
 QA9xIS5eBtSwVYnQEtNyQVdACN9QU0w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-7SnGvkviP72fgzrLK5a6tg-1; Tue, 14 Sep 2021 11:56:14 -0400
X-MC-Unique: 7SnGvkviP72fgzrLK5a6tg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso2880527wrn.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DvbaR4siX+UmcDyt9P9szfpUDo4ZhL/40dNM542qLYQ=;
 b=agzqsngJlFh4QIOglx+1HeyhSSSlDUVJLngv2GQPQeUrFnEAKkCIYV9p1ozYc9L1JD
 Fb+9d2E6hgv2EjE3bIpdODdNhp+p62LEcJaG6MJ4RY46gqvx+TYC0vyxCtxE+uIpm3K9
 kWjFczk7sXCuhJIlEk3YdEh+rP6lgF2sge0bYIedd8bWQsQam5EeRTTSWBtjdNAKO00N
 /CuRtoHxl4Ipx4BrbLuP00ERbBFxIkyvklZrF/5cH5MUr+EiIvGXk7/cJkT8T8aC1nVi
 lt0n4NBrbXwJyb734co5QEXck2dWT23DayhFniwjzREUeiyJ/6rDSZSgLZrbft5pEBNb
 exUQ==
X-Gm-Message-State: AOAM533csNCYZWC944NcxYeOMDcqxJjDK4InRzfu2+YEsv1rgPuR4MKG
 vD8CtnUU51giP38t3njyrAnw2+PsvUlROMi8cgQ/Q03YLcI6VQIOdiQRVfNopSn060wH1+pV640
 FWFgxvFh8lK6MP6w=
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr20154796wrb.54.1631634972780; 
 Tue, 14 Sep 2021 08:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNaTpfNg3kUtFXOB98x/es5Ijv4KcIKwCxhmgBMiCVuz438BDqxoQhUP1UaqTtREtabfcV6g==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr20154741wrb.54.1631634972545; 
 Tue, 14 Sep 2021 08:56:12 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r25sm11735205wrc.26.2021.09.14.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:56:11 -0700 (PDT)
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
Date: Tue, 14 Sep 2021 17:56:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-43-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This will allow us to reduce duplication between the different targets
> implementing the 'info tlb' command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/cpu-common.c  |  9 +++++++++
>  include/hw/core/cpu.h | 11 +++++++++++
>  2 files changed, 20 insertions(+)

> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 4c47e1df18..64fc57c8d9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
>   * @has_work: Callback for checking if there is work to do.
>   * @memory_rw_debug: Callback for GDB memory access.
>   * @format_state: Callback for formatting state.
> + * @format_tlb: Callback for formatting memory mappings
>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>   * @set_pc: Callback for setting the Program Counter register. This
>   *       should have the semantics used by the target architecture when
> @@ -136,6 +137,7 @@ struct CPUClass {
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
>      void (*format_state)(CPUState *cpu, GString *buf, int flags);
> +    void (*format_tlb)(CPUState *cpu, GString *buf);

Doesn't this belong to SysemuCPUOps?


