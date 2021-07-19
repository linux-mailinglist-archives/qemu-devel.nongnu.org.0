Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997F3CD445
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:02:25 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Rya-0004L5-KL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5RoC-00032E-2Q
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5Ro9-00054n-07
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626695495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCxRdUBdymFC/pREilYPyNuy1CTSiCq1U9PpBh67Igk=;
 b=Nypj+3jSN56hr64TL/3k2rThB4Vzw/1B4z8+ED/JvaHedqSeQtAT+6hEJ20XF7h+nofTrM
 w1r7R7Y3J8/CK/h1Pl5+zVmNWtTmv+a8VdiO/w5dkSFWp5a+lGBNJFy5kZJ4cH7iKpizMo
 c0WAL16DCahYfO21T+Cw5dX3n16505I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-2XdW7WARN_6kM-fTqgxnXg-1; Mon, 19 Jul 2021 07:51:33 -0400
X-MC-Unique: 2XdW7WARN_6kM-fTqgxnXg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d8-20020adf9c880000b0290141a87409b5so7862253wre.16
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 04:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LCxRdUBdymFC/pREilYPyNuy1CTSiCq1U9PpBh67Igk=;
 b=Eezw7BN8cuQx11lmZy45CMMp7ZaMx01A7AzOwY1YrJN0pxQLee6DzKJM/VijoopdQF
 QW0m1+HRUL9VrRETkyOg6MIK1E8ZUCOo15RuTXKg1SVq7CjFZiGd70azxOG60jmEwZE6
 7xtkiXVsasSL1A0WrVTb5mpUVg3jRB2PSdPXo3j0uV/PPS4NWcIZBLqnjgZyEkQjdQZL
 63XZU4ULLTBrbhVW73LYQQZHKbZxnx4Ha0s6c19+Sh6KSeJqj7ivbKVXXcdttWtp1YWr
 8XHl1JB6mPfxsmAi1mhEBxSBG6vGvnP8msax7BWW5txe08rE9hRK0ve0kV2isY1fDqtN
 /cTQ==
X-Gm-Message-State: AOAM5317P0Bttf0bdzzj/s5GGnaAPoLZ+UwJJ653HFU9dpXawy6YR1CB
 slMc+aHrxsbnSrLXZ+L3vuTb6Q3716CFycG6b2xv46kim9L9zN58mhWbwazuSVfyG9JxO8Bbyn/
 Vqd1AeW30LNF6viU=
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr29092259wrq.241.1626695492547; 
 Mon, 19 Jul 2021 04:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzpHHYnoMkoU/Lv7DJn2MK4V40WtbHtBrbsRtRcacMEojr0QBcXwcIGvkLTLo9YmEiUfAvUw==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr29092238wrq.241.1626695492383; 
 Mon, 19 Jul 2021 04:51:32 -0700 (PDT)
Received: from [192.168.1.33] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id o18sm19894861wrx.21.2021.07.19.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 04:51:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] qom: use correct field name when getting/setting
 alias properties
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f7807ea-8c09-01cf-6ae4-c55263eb1da2@redhat.com>
Date: Mon, 19 Jul 2021 13:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719104033.185109-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 12:40 PM, Paolo Bonzini wrote:
> Alias targets have a different name than the alias property itself
> (e.g. a machine's pflash0 might be an alias of a property named 'drive').
> When the target's getter or setter invokes the visitor, it will use
> a different name than what the caller expects, and the visitor will
> not be able to find it (or will consume erroneously).
> 
> The solution is for alias getters and setters to wrap the incoming
> visitor, and forward the sole field that the target is expecting while
> renaming it appropriately.
> 
> This bug has been there forever, but it was exposed after -M parsing
> switched from QemuOptions and StringInputVisitor to keyval and
> QObjectInputVisitor.  Before, the visitor ignored the name. Now, it
> checks "drive" against what was passed on the command line and finds
> that no such property exists.
> 
> Fixes: #484

Per https://www.mail-archive.com/qemu-devel@nongnu.org/msg821579.html:

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/484

> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qom/object.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)


