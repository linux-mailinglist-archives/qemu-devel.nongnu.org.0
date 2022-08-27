Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277C5A3614
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:46:21 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrSO-0001TE-DH
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrKz-0002z9-Rr
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrKy-0002lb-Cu
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70q4Upt9qxer/QhyUoKhaxTyxQqvRpRTo/K0W/Fk/ZQ=;
 b=KTeKkXvB7rMAwuNrZyTXwdGdKbMyvjcf3qmtJ9TdJw22oD1BxCudV3Uy/w4RIS0dCN7QgW
 3I+jj/ZjRZAYq1uZxtxnZlEnVBgOC5DTOjwFxxQ//y15VHLe6Y/nm8D9Jx/TC7mKwrS1Mw
 XhqYGmbxe5qdRxkBnD0DSIEENTwsNGk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-Uk40F_vKN7OiHdFInnhH3Q-1; Sat, 27 Aug 2022 04:38:38 -0400
X-MC-Unique: Uk40F_vKN7OiHdFInnhH3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so5272530wmq.0
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=70q4Upt9qxer/QhyUoKhaxTyxQqvRpRTo/K0W/Fk/ZQ=;
 b=oQE1sz/HlQD/qSAfAx6cDzhusFw7eVYtROYpLmkbE0jN9RDBrgTrRThi8AiUXsmjkE
 1lqyqgVwFiI7TwarFMpsI6l5X0+Dj3A9alo1h0+QmzYvH7rpq3CqdtbkckmwAs7EjkUO
 5QKcJAmRn8/tZnJSL5Az2aEmLBVq5fUywLd/bTYL9FUdsuIL7xGx02Yu7B7iQLqW+wsF
 /6QIwiqcPx6NhLYRGAv8UQ7SJ55gwnPqf+vmi8I/lwz9T33OYioh+qzrkD5vThRxxiX2
 /MhLOUk0WYPWCP7ewF/PcUbe2YoBfSxjIYA1SZRQA45o1sESg2XLzqPyy7sybXmJJtCB
 IL5g==
X-Gm-Message-State: ACgBeo2pgxKWjqVEhhyDNts2jnoMpGHNaDFNoQJ/d8PQ3F+5cXPdugjd
 W+SrhVtvVoS5dCLbUEHTh/16Rsfo/zhSzdTg1HCIZp0NSXFlvB2iRZl78kK2EnTeKpkHRI3RiLN
 jvwoi2eqWed+YsFM=
X-Received: by 2002:adf:f250:0:b0:226:cf7b:d5ba with SMTP id
 b16-20020adff250000000b00226cf7bd5bamr1747728wrp.570.1661589517161; 
 Sat, 27 Aug 2022 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WMoncNKl2wv8rHaFK6u5Ni/z1KZXRqOWiivniRlRXQ7HaH/xAOrRI7MsrWrlm46zGSdnPnA==
X-Received: by 2002:adf:f250:0:b0:226:cf7b:d5ba with SMTP id
 b16-20020adff250000000b00226cf7bd5bamr1747719wrp.570.1661589516949; 
 Sat, 27 Aug 2022 01:38:36 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 cc2-20020a5d5c02000000b0021e4bc9edbfsm1791049wrb.112.2022.08.27.01.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:38:36 -0700 (PDT)
Message-ID: <3b24266e-37d5-19f4-c50f-354e4296c87f@redhat.com>
Date: Sat, 27 Aug 2022 10:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 19/20] disas/nanomips: Add modifier static
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-20-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-20-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Modifier static has been added to the remaining functions that shouldn't
> be used outside of the nanomips disassembler.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


