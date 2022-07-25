Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66458005E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:07:17 +0200 (CEST)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyjs-0002uH-KO
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oFycz-0004Xf-JH
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oFycu-0007XK-W2
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658757602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jmWNwqYk5kwgiHXWIIm8ioSuwQvgvWEkAx+DPb/4q0=;
 b=UNXS0rzEIUcNfsMXP1yd7ZwsEsKJ5vxzRX1GHWPQLaaBiC4UHNx2R4oo9bQkyf0kcI9wg8
 S0GPQHiEVzy9N+aI3yUf0HHgSSA9PkMdANCW6b3IP3CYxhlbCr2tiyvBhwCZfDcIziuG/h
 4hF7BAdNLR2dHpc2NbXqJgfvyE2RFd8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-wxnKbkVJOwiymnvbUt0B-g-1; Mon, 25 Jul 2022 09:59:59 -0400
X-MC-Unique: wxnKbkVJOwiymnvbUt0B-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so6330879wms.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6jmWNwqYk5kwgiHXWIIm8ioSuwQvgvWEkAx+DPb/4q0=;
 b=jOBsisPmrcnsT2Slvz2y3wZCeRO+G0vWahFambxaYyRfN/cW/B64RMMHk5I7OuaBX/
 nAenMTma84DTzh5QcIRwXaXnN6N4iaOshEVY4lUA23mOs/vOiq48FQQg16SObIlS7zhX
 gkKfKm117/bJmmagRoZBMKE+PxXvPemp3oQ2iTRnxCw26VNEEppH0sLS//PRBqcp4u8R
 oqAq/yVeBob+6VvtS5Wl0rwGkQFx7/CtyaHcQtSokB5KwGysuwa6uzVd/xRLOGMSF6S+
 212IbOdUutpk40kFXBqIhGrQW1ZJS+/JLANbOs7XlUfRQzEg4tJOFDnuAjYyxm4Hq8S0
 9N1w==
X-Gm-Message-State: AJIora8j+YCRj/ns8MtkXPWMNkOY0JChTD95O5jS8+MSze1I9V0b9hlm
 syKCbIiK5c/OC1k51HZHLqTu07MpLwdK7FmCX/gzwJsTsf3bmRZI5m3b5+PTaTfFeaZQ319OTFC
 Vzqvhal19W5dKQRI=
X-Received: by 2002:a1c:288:0:b0:3a3:5332:9d16 with SMTP id
 130-20020a1c0288000000b003a353329d16mr5029392wmc.168.1658757598748; 
 Mon, 25 Jul 2022 06:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tK1ke9a5M7sdM8yIy37zhZPWTTlK+N/f3l7d3p6eI+vBa5Jvx9rEfem+qpyRj4CKE/SM+drQ==
X-Received: by 2002:a1c:288:0:b0:3a3:5332:9d16 with SMTP id
 130-20020a1c0288000000b003a353329d16mr5029366wmc.168.1658757598535; 
 Mon, 25 Jul 2022 06:59:58 -0700 (PDT)
Received: from [10.43.2.88] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n124-20020a1c2782000000b003a2c67aa6c0sm16714652wmn.23.2022.07.25.06.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 06:59:58 -0700 (PDT)
Message-ID: <d57f77e1-e547-88da-8c97-c8976224bb22@redhat.com>
Date: Mon, 25 Jul 2022 15:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 7/21/22 14:07, David Hildenbrand wrote:
> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> Michal.

I've skimmed through patches and haven't spotted anything obviously
wrong. I'll test these more once I write libvirt support for them (which
I plan to do soon).

Michal


