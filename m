Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956F48AF1E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:06:39 +0100 (CET)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HnK-0001aX-3z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7HRz-0006zw-TO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:44:35 -0500
Received: from [2a00:1450:4864:20::333] (port=35526
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7HRv-0004aA-8n
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:44:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso869712wmj.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fDRYT65PEFLsAC6SJwSUCkf9AX8lvPxo81UgLH8rag8=;
 b=R8eFMgGgIYZrrRdDSai0k3wyJSc7GaxfOchvkkCog0XqDeYen5MZ+0NoVyc05cHP2B
 5pm/waWQhkqjKnBTXeYVq0/1fLshgC8o2h3yOhXYsHZ2qMJzg0rAPldjCitsDQS8pILl
 719RkPINfDxBCsRyC+eXQw3NcwxGwmVeUL7KvVPj0qpHd7xQIDbinXGFoXAm89pnjk7H
 EKvhYj0crpddGj6Xtzq519QZbC79tSoZdREF/yGqavrAFnwzByUxbytucw1kuU/qLXK7
 PxrxqiHGfywNwglHU/asz5xT7hZMGVkOwqPhoVpp3FlsxM/w0O4EFRr8tlTzHTQXak57
 kKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fDRYT65PEFLsAC6SJwSUCkf9AX8lvPxo81UgLH8rag8=;
 b=FdngKBOTq4QfbcFEhut7lYMtfPlqr4o6YlipLxalFbP6/UjAKBlq01IKpNi0bmrUmS
 eB96AbB9AiXeZUA6H57Qc39BsBDM+jR1kyOH+sdu4YmPNZMzJj9QMHxbQ885kERXNVhS
 iGA+jQ7gkZRsD7SMNHP+3MJkKIMH1gcdwLwYCESe449qrMRYtRKTGeYitM2lm4t12AYX
 FCnU9L8iX4G7C1wjTGA12HLAH6qm1eF/rpGvJG7SLfNbk+n3vlGhR7IjbZDMsw4+cYGE
 Y8gCAk0WN88C7hrX3vqacGc7MF2JRNKrpaASWIhYYlGUC6ox944yZSv26UCXBtOcW1rk
 l0ZQ==
X-Gm-Message-State: AOAM53146pYENUTzlxmbWbTwP75SA+dPi/ZTs1m5WPEvWYBiGfZc5eIT
 maw3lG18Vehv98s5DiHd68s=
X-Google-Smtp-Source: ABdhPJzwT5nwLGfEJc4gqv5baLwV8+pKUPxQ84qXsN6hwBSiFa+1oQZ0+P1IeQvVBkDXhpv3dQQKRA==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr2520377wmj.168.1641908669834; 
 Tue, 11 Jan 2022 05:44:29 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id j26sm2090179wms.46.2022.01.11.05.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 05:44:29 -0800 (PST)
Message-ID: <174daad7-6153-b85f-32fd-9884052cf03a@amsat.org>
Date: Tue, 11 Jan 2022 14:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/6] migration: ram_release_pages() always receive 1
 page as argument
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20220111124556.4892-1-quintela@redhat.com>
 <20220111124556.4892-4-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220111124556.4892-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 13:45, Juan Quintela wrote:
> Remove the pages argument. And s/pages/page/
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> --

Note, you need '---' (3x) to have git tools strip the rest
(otherwise this text will be committed).

> - Use 1LL instead of casts (philmd)
> - Change the whole 1ULL for TARGET_PAGE_SIZE
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

