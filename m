Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6713539651E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:23:15 +0200 (CEST)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkh8-0002LV-Gp
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkdw-0008UJ-Fj
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkds-0000cJ-DA
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622477991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJl9O3DrYqdNIdJzkwhpo2UhKWM8aSBT7qXbnRcCIHg=;
 b=Q81+1m/bVpuiLp4O/E3xuxwaPuykkSZxGCedsL8YozA06vqmJ1YIhLOXqujWIyDPCKEDFA
 m/4Plzb5fc0SIR85qgBMiYe3dVQXkHCUqlt09+cdEUcylh5jUwRnJLi0UZs75+aZTSTFSF
 Yrlq9dUCg/aUFgtlH0S2VP/6QnJt894=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-LGcYFq5oPjCF5Zw01xHB2w-1; Mon, 31 May 2021 12:19:50 -0400
X-MC-Unique: LGcYFq5oPjCF5Zw01xHB2w-1
Received: by mail-ej1-f70.google.com with SMTP id
 i8-20020a1709068508b02903d75f46b7aeso2575986ejx.18
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FJl9O3DrYqdNIdJzkwhpo2UhKWM8aSBT7qXbnRcCIHg=;
 b=bSAWBVAAHYBfpD8QKcI+qNMkjN+IsNbgK1PjDUSWd0CSbJwmisqM7zaetjahzZKTZ8
 AfX8hoy71Mxe1JJ6fJi3ynQu+BuIMB+7K9V4uKuhpFYbgJozBgReZo3OwQWBCMT6NLGf
 w84AER2kvbj5ddBLrpLipaKiic8V2+P0gbF6TqoAyhxpMKK8K/c4GPxeZuI5uwTwmIMP
 DT8Ewkj8fIXLJyWCMLdXHr3VuZBCTYzKrySj3fzKtzAFPWh7p1uIimMYHC92fpKDjgyt
 GP1ceFE6cDmIqezByzxVYps07Q7cPkPlhkAh9ZiY3+zmEMPGAP5fg1QP/IGLY3cUOJwu
 2woQ==
X-Gm-Message-State: AOAM532fmlmjzXlsmKSVgdpYNfTUyKZfo6GeYsbItPeigXEbl/B85t3T
 gILR157KsZdmVViiVb/bT5tpkLZ8Pf9d+XYPsuM6jShFVs5Wpx94MuSKG5jvGq6fTLzDRDU2KOV
 LKs4FXBgvBbT6Rb0=
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr26482025edu.304.1622477989004; 
 Mon, 31 May 2021 09:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPQ+gTXv7Sx4McBSbTpR9KvoOnbp9gSOVyRcH0dB5M0o2t2fvIzPzr2WFodGO0jQ2pQ++0Zg==
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr26482007edu.304.1622477988853; 
 Mon, 31 May 2021 09:19:48 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 u19sm3171725ejt.74.2021.05.31.09.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:19:48 -0700 (PDT)
Subject: Re: [PATCH v2 12/33] block/copy-before-write: drop extra bdrv_unref
 on failure path
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-13-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <237daee6-4910-7459-dff9-d6dd0b7b0dc7@redhat.com>
Date: Mon, 31 May 2021 18:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-13-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
> by hand here.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


