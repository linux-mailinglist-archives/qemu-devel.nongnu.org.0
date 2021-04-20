Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAC3656E7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:52:42 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnzl-00006j-Fr
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnwk-00076O-Sg
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnwY-0002hS-Ac
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618915758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZniG6MbAE018d366J7RPHmF5Rm1HTiUh5EnbkYsiJk=;
 b=M4fjuVU7iclqis48pMvKo+MCWkRk9NKFq1Cw8cUyG6DNiD2kcH8jq83osxG+kyJV7PjKnF
 ufp3uN3HgLPuWnKvxaDxREk3MgxUHHoc5tbENaimf8wnUBdOeN3AFlXD6ycq/1+01LrYo5
 gpT+8ZBEKg8JFAO+0fU3rDRRX2z+gLk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-xaeo9-1GOfW701HVkQp0Hw-1; Tue, 20 Apr 2021 06:49:11 -0400
X-MC-Unique: xaeo9-1GOfW701HVkQp0Hw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso10699082wri.6
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mZniG6MbAE018d366J7RPHmF5Rm1HTiUh5EnbkYsiJk=;
 b=sXWXc11Anvjg36GnpgeQYUykkNFG2R9GOwHhX+lzXF7L5NBFZGRIr2z/uwWHCu+3yc
 D4XoM2AfUOhx6NqLsKZFRuTF3Z3hdPPaJf5kyqmwzknSG+DBQNONDbtpsUu02muJezEs
 lvqNQZwDVLV3cSgV6XsUZdGThX4ZKGh6LcD3CfXwukny11/JtslD5gY4qC+JYBhrM6bM
 gCxH7ndFm3EDBS3oBn1q3erkG6co5ogLjTGSJxV5zHGFls+et5zjrsg8Q1ZUxywDV+kM
 9l1bUzt4Jyf8I14fa5zgp1OIB+PxIPc555UdP8224yXeIg1fBPDhrapXsAAzbkamXYVl
 J6rg==
X-Gm-Message-State: AOAM530Me4esw8B4KFU7gLnMCIEEyObV9eiDwxAci/ozJlWXw/e0JjTZ
 lRTyNXtBbSIEpZrPzZqRhMdSw62drzeNAGCM7ct2f3SHLVCkwWq84HeyEbThTPZPoBK3bbrgqRs
 +qTgFMqtdpZ8rTRE=
X-Received: by 2002:a1c:6382:: with SMTP id x124mr3822764wmb.142.1618915750756; 
 Tue, 20 Apr 2021 03:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK6wlRu7r2+cF41e6emIcwUSz5vBVnbqSnh4Tyv9ZpAHP3Y5AX9vdnD26r6XfCiBFN6Q8DDw==
X-Received: by 2002:a1c:6382:: with SMTP id x124mr3822758wmb.142.1618915750647; 
 Tue, 20 Apr 2021 03:49:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm2714129wmo.27.2021.04.20.03.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:49:10 -0700 (PDT)
Subject: Re: [PATCH v5 14/14] hmp: Print "reserve" property of memory backends
 with "info memdev"
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-15-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a3b5533-1652-9a28-26de-fc85406cd9bd@redhat.com>
Date: Tue, 20 Apr 2021 12:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-15-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's print the new property.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-hmp-cmds.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


