Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E34AD51A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:39:03 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMxg-0001Wf-BO
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHLb6-0006b5-8E
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:11:36 -0500
Received: from [2a00:1450:4864:20::532] (port=45749
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHLb4-0000cH-Mq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:11:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id l25so15339432eda.12
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uXqWmc8NZfHEoIEI2iXYOPRVYbCrc9OnQpQBUi0kIrk=;
 b=gYB+Yr2GGXZLd/mXZVhcaPMdquyFKOfqIfuxLfmypHUT7KGXGKG8zTAEpQfBwBQakC
 CfyDCep9YVE1y2B0IEJUcw26zrQgs2VOPWZuv4TwKLjCkJzNumFLPbaXLZVN9W/iCaSY
 J6uZphvljr2F6Yy1mVD1tRzBPdmA5WfLXBay7m8wZaZulK23KpcSXChJNzJPU/8+bkd6
 M2K4jghcj2IJuRkXMGQNFPBIiZnYxCRu85s7/WjJNaPM4Rj4Si2L1SfZnh5khh6W2XMm
 9bvnsTUxSj02T2giBrH/wwIGbecPTGI+7OShc81osKFB9MlfhDr2qaIZUMD06T8nuJil
 UdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uXqWmc8NZfHEoIEI2iXYOPRVYbCrc9OnQpQBUi0kIrk=;
 b=PgZDe54clSAR1BroGzrmseToA0flMRnO1XW7PYKT5lV0Sjy97aZw22Qt/z86Dyv0s5
 hLbw1EtuGAqPaXendNR6TUFyKocQWfRFyo+VRRQZou/UaRbZ3gVxe8WfJKBfVsys4rTK
 m/13rzbbAyW1OoHquh6LGU7T5g6gLxKUUWwBrWFe5Lr8eC5ruI7dYC67nanw7CUvzRYk
 DSGcwO3QMB+FqsXbIklA222NbkSipaZhsm94j/yJ0CdMSxhLcNpH/UwQuokbjLpZxzXH
 6dcxYOsGU//Ywck2ChuHpGRN3VMQNJvBJDCw6Ab8TSq8Pi1fLBYgaSI33pfVbqDmTSAe
 /4Vw==
X-Gm-Message-State: AOAM533ZEL0VIrgBNlEBlvRHypsBXSeSYtOQtJ7Y3GmJPbh5l52IvuKU
 eaOw9R2DVzY07eD/3a8Crb0=
X-Google-Smtp-Source: ABdhPJw05/pqAU8kNLsrzPncVlLyBgD7u2V3uKlypPxsNbL1qcjO8RSY30w/uYzG14C1feOYp0xtDQ==
X-Received: by 2002:aa7:cc06:: with SMTP id q6mr3316955edt.44.1644307893065;
 Tue, 08 Feb 2022 00:11:33 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id fw5sm792821ejc.77.2022.02.08.00.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:11:32 -0800 (PST)
Message-ID: <b7412059-dbcb-48dc-9f3f-6d0262c594d7@redhat.com>
Date: Tue, 8 Feb 2022 09:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <20220207032622.19931-1-peterx@redhat.com>
 <77520dd3-1e7c-efc5-0bea-d53dcea6261f@redhat.com>
 <YgD2J5zOpJFKxrZz@xz-m1.local>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YgD2J5zOpJFKxrZz@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 11:36, Peter Xu wrote:
> Yeah I can do.  Though the latter "if (!flags)" check will also start to allow
> nesting of memory_global_dirty_log_start(), and it'll make this assert useless:
> 
>      assert(!(global_dirty_tracking & flags));
> 
> I'll probably drop it too, then.
> 
> Curious: do we have any real case of nesting calls of starting dirty log?  I
> always thought there's none, but I could miss something.

I don't think so, but I think there's no disadvantage in allowing it.

Paolo

