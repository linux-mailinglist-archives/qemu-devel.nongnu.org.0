Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC32447E43
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:47:39 +0100 (CET)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk2Be-0007UW-C2
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:47:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk2A0-0006nW-Pm
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk29x-0004rs-KD
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636368352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7SJAg8DOQlnUEeaB5g9xe77uXYVz+wEafamS56aVQw=;
 b=EaC+VMbFlFt4/gcrEdDVECEFUWtY8K1c70sz9SoOWwKD1rDD5+sbr36muEzZhYaufALxMK
 osnYMp+HZC+rm0x734t6+LAJdwPZk9fNyzPLNyziL2HJ1sm/yRlSZPAi1ZhDwk4/fed8g8
 gakok8hC3Ar9FYV6QXkVep54J3fxnew=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-UUEqSprdMjmip2AJD1IdFg-1; Mon, 08 Nov 2021 05:45:51 -0500
X-MC-Unique: UUEqSprdMjmip2AJD1IdFg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q6-20020a056402518600b003e28d92bb85so14469809edd.7
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 02:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P7SJAg8DOQlnUEeaB5g9xe77uXYVz+wEafamS56aVQw=;
 b=GmArVIwNEokKVuH7Eh6Fgz+P0tzZivDlfZFAa7cmwp7gJZ/ZUZLXBsm1stzCAfPfJa
 6h3SDCk92eeoRCdwR1K+XXDHgN3/fKzbG+otjKbwE6iCOBSJ3oGIACpRvweKEe5R+qHO
 WvFMa8x60jlzoApUavczDW/DOhW7KjifpIqsgwZ/Y9lE1cIqXuwC3iwre7ez6MN1WJO+
 l+SDmsJBxohMP2nhtbceDVYaddMBgnD5HUmzD/0IbZnO5xRuHdJKfng1sYO2c+mkWHuE
 JNZaJuj9oPViYyoO6IxIomSF6Ly/qLn5Fo85ZmUlEJh4OaNdO+LDDoZDbN1v/U6tO+9p
 z0Cw==
X-Gm-Message-State: AOAM530RCNIC1D3np0/Y37BI+Q5g3/cC2Ybi3gcrVZsnkaYic8hCe/Ho
 DjpTf2DAaEMEvGgV7E/MeMAbcny8/njUKMA6UxsjcvyppJg+oaCY2eDFIJ3yO/IAoQ6bdvo5Lzv
 b8mdonm2dy4mtOUQ=
X-Received: by 2002:a17:907:9707:: with SMTP id
 jg7mr66782696ejc.533.1636368349982; 
 Mon, 08 Nov 2021 02:45:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmg5RqqKPL2VWE+hVXaV6BRN4xQctIt/pytHUHT0KgX+Xc0x0QUv2Yjo+iFWarQ+HM/uIUSw==
X-Received: by 2002:a17:907:9707:: with SMTP id
 jg7mr66782666ejc.533.1636368349734; 
 Mon, 08 Nov 2021 02:45:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ck4sm9001896edb.72.2021.11.08.02.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 02:45:49 -0800 (PST)
Message-ID: <452dc7dc-f494-5296-2e11-64419ddd1613@redhat.com>
Date: Mon, 8 Nov 2021 11:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] configure: ignore preexisting QEMU_*FLAGS envvars
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-5-pbonzini@redhat.com>
 <3d3762c0-425f-3a04-216f-4a0915cff29d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3d3762c0-425f-3a04-216f-4a0915cff29d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:17, Philippe Mathieu-Daudé wrote:
>> -    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
>> +    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
>>       CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
>>       for arg in $QEMU_CFLAGS; do
>>           case $arg in
> update_cxxflags() should keep previous QEMU_CXXFLAGS. But since
> we call it only once, we don't use it to update. IMHO we should
> inline this code where it is called, then overwriting QEMU_CXXFLAGS
> makes sense.

With Meson 0.60 it's possible to link-test a C source with a C++ 
compiler and then all this stuff (including the link_language detection) 
can be moved to the proper place.

Paolo


