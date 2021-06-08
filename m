Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6A39F665
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:21:51 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaju-0007pI-KS
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqabD-0003OB-PZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqabC-0004Dq-7w
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hnf6aHp96XobMJDpqUFNJkxzlxfq/654EOQoI2LrYPs=;
 b=T/F/d7jS3yEbDwg//2IrSLgTbZPqX8STWR9DCcmLkuhFzD3ibkW7mBFiDpkUVuSIbcLwmq
 RcNQjEXd3wz4O6BEi2tmytW1CE+d0nfXnQVNmzvqGTijTY+kgC+128wKIRF39E6hogidCe
 kTDLweyeKY7gxC2lesHM+I7ZlBl6iwE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-48iqqiNRO5y_xITBUJx3-Q-1; Tue, 08 Jun 2021 08:12:48 -0400
X-MC-Unique: 48iqqiNRO5y_xITBUJx3-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so9394037wrq.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hnf6aHp96XobMJDpqUFNJkxzlxfq/654EOQoI2LrYPs=;
 b=djBpjbkzUOKKRGnliAXsUcOzpp6uMgk3Jnd9C6xUzjihoOgA9+0Db5pb3TnLzrpDhO
 6Po5h3iwZNGOwQXSWBdQyGS/MmInFllN6W1C0C92+hQfLkd11Q/n2fXeNwK7Rgnp/hfs
 sOcDJiznQN7wBWz7puga1tYogI9llCeEUWWbsarHCqre79RuCzpmKc03JQxXX/DQiKLJ
 XyEJedwZSYKTDpF5uYTYl1A79UNSJWH/6kjB1MjRJ1oiIMtrToXkXzkeqmo6Vl1FfD3m
 7ERRO+fDXq8E+6qtL22vfFWE1YXyXBeUT5He3wNaNKpsy9GNkJZXtSouuJY1wX8seedp
 kPmg==
X-Gm-Message-State: AOAM5338t5zicNl53F1OU3QvRpBXBmq+9nWqYPn+F5gOUyRmgMAPv4ZR
 tsFGRhmu5IzoKbWfU9qGwDb+YKrusEGEj7LIpmWZysUlkDdg/lPiyCTDCua/jB7Uqu6cGWTujZ5
 dN/jUrp5amIPEwRM=
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr22028254wrt.5.1623154366899;
 Tue, 08 Jun 2021 05:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoKseX2mpQqoWSSAnVzs1MlBM1kwwURH7rq0Vx/rufean0q/2PAkj6uNkUq0QIpOzz3YLrzA==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr22028239wrt.5.1623154366724;
 Tue, 08 Jun 2021 05:12:46 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c7sm19797369wrs.23.2021.06.08.05.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:12:46 -0700 (PDT)
Subject: Re: [PATCH v8 1/9] i386: avoid hardcoding '12' as 'hyperv_vendor_id'
 length
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-2-vkuznets@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <961e01f6-4f86-a5c1-91fe-799bd2920736@redhat.com>
Date: Tue, 8 Jun 2021 14:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608120817.1325125-2-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 2:08 PM, Vitaly Kuznetsov wrote:
> While this is very unlikely to change, let's avoid hardcoding '12' as
> 'hyperv_vendor_id' length.
> 
> No functional change intended.
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/cpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


