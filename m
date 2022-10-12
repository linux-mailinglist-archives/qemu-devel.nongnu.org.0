Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB155FC8C3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:56:00 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oie5O-0004Qw-ME
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oie2u-0002F4-VF
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oie2o-0003Ub-C2
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665589997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyDgTMEvutLKZ1Bd+HlJhQFpftzvBK+ed1rVmRyrKlg=;
 b=dMd7/imhWEjVFvBKIf3sE0bY2FnX4S+SNufbNllpk41r8C1K24JIaYG2IlPvO7BdmwbmZ7
 qXN/rrtT3UxkzG8vSF4kQK42mUNeON3WT+AS/phs57u2TQwBkKcLGkZZCWNc/m/86vsdAP
 9uUB4k94zs24roTzzaxKDCo/YhcGEl8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543-EHcUdJmRMgylo4YI7Wv66w-1; Wed, 12 Oct 2022 11:53:15 -0400
X-MC-Unique: EHcUdJmRMgylo4YI7Wv66w-1
Received: by mail-ed1-f70.google.com with SMTP id
 j20-20020a05640211d400b0045bd72f05d6so8681160edw.11
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 08:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GyDgTMEvutLKZ1Bd+HlJhQFpftzvBK+ed1rVmRyrKlg=;
 b=MyzLV0mM7Pv/vYgvkNw82k9CQJc07HctKQheyq/jmDl7mxg3XBc+Vf1CxznxZySOxj
 ittGD51Nvt+vBp+dFj5p7W01nZueuG3W26o9FY7REl3yCrKxHpkEm8Mk6NZJro2qC+YM
 sSM+yF19dNa8wDKqPWMfI4IfCiOl7WXhABKMl5RRbdcumz/1csFUsmxec2o9zTcQJ3+d
 dfp6eQlAwolVKPdxJTQ/jIkTUHeHq9c7G9fd/6Sb7r90iC6cn8Mc5mN52DrEoW9rSqBe
 RJgoFQEjVRso5RxzxoD3aGvYYhZWHVOQRJRDI43n+bM71FMbmqd529PFQUs8fdaxVHBi
 XKkA==
X-Gm-Message-State: ACrzQf05/MZUfYbvSTDb/iqweufZ+Zy0A2hZ2zBgG3bAByCXSWHttF4e
 eWgEif+v6h2A2uXK00G3SIRJ754ptQ7j1We6HZUhEfjSiAQlfGfr7vOleQSerICtfse391wlT6x
 wfjMWwTxdHEYR5n4=
X-Received: by 2002:a17:906:6a18:b0:78d:7228:7a52 with SMTP id
 qw24-20020a1709066a1800b0078d72287a52mr21444276ejc.363.1665589994235; 
 Wed, 12 Oct 2022 08:53:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42qfKSbqgpoZy7Ir8hRl4FkPbpCYQNxppTBk9sfEWw+Lu+qq/gX6rbuqxgVoz1tMcylN4NmA==
X-Received: by 2002:a17:906:6a18:b0:78d:7228:7a52 with SMTP id
 qw24-20020a1709066a1800b0078d72287a52mr21444264ejc.363.1665589994029; 
 Wed, 12 Oct 2022 08:53:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 d15-20020a170906304f00b0077e6be40e4asm1478739ejd.175.2022.10.12.08.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 08:53:13 -0700 (PDT)
Message-ID: <b461332c-cd7a-fd30-4a97-84c502123038@redhat.com>
Date: Wed, 12 Oct 2022 17:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH 2/4] docs/devel: make language a little less code
 centric
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: stefanha@redhat.com, peter.maydell@linaro.org, agraf@csgraf.de
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-3-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221012121152.1179051-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/12/22 14:11, Alex Bennée wrote:
> +QEMU welcomes contributions to fix bugs, add functionality or improve
> +the documentation. However, we get a lot of patches, and so we have
> +some guidelines about submitting patches. If you follow these, you'll

While we're at it, "about submitting them".

Paolo

> +help make our task of code review easier and your patch is likely to
> +be committed faster.


