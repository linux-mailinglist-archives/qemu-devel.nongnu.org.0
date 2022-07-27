Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4025822F2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:20:41 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdDc-0004a3-Fp
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdB7-0002o9-4N
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdAz-0001RT-95
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658913468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rbg9pPc1G/kotU6wh69svSiP7Ut6zjRk6YyhhRlYPMs=;
 b=AqCwBJ8OnFULo+cvLcALZqMiqcApDimAxEMWbFKhd5roRteRDaej11ZHOsEiCbWAZZMFlR
 y3R59DzYfIe0fQq2VqUxzXLM2X+yxxHefXgwU6nnC/7mtP5yO6gc2jRvOD6/c9TZeIl2ux
 /7ufzonL8QxkZvyb4vPjkLrMKKaZP9w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-y1n5PV0wMVeaeFrNMYStJA-1; Wed, 27 Jul 2022 05:17:44 -0400
X-MC-Unique: y1n5PV0wMVeaeFrNMYStJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so1687115wms.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rbg9pPc1G/kotU6wh69svSiP7Ut6zjRk6YyhhRlYPMs=;
 b=vYwQaVfx1MBHwvtbsIpVZJG1UZAmELPa/qaEH+nU6/Hluo8qJzqWoMqtNmD+phxk7r
 tafBIIcsaOw88settosTlBacWjEgbbffHHSZLTCZc/IdDrne2Xn50uE6WUkoVMPnJuzA
 O3o7Bj6ThOTY0/WYLGdUerNr7FnJQGKLmNmde8h7BXt/8803n6nifBP9f03K+Jz28NUF
 so0YV1qTi1R+5kO3m7HkO2vrwrUpGSqAvBQyrGMj3yDaIIAtQAEUR8afI+YBGYWnCmVQ
 wge36GMg3Ig9OIqN/P7B9UkVhvLeHODhDYgZqlgyWzD4Fmlo8bc5ZhotbHuU0OCHXb6C
 chvg==
X-Gm-Message-State: AJIora+XONP/+4eFMYgag8kQuW9YqsRB9R7JqCssygYUmcZbQxhZC2oj
 S//0IOnExX7DE/vS8G2obVPBBzcjEoYqtBJkj5KOF1QpC6gyVlXe175yks6F867/pOH4VAVmZbh
 yccQCDivfwGHEwT8=
X-Received: by 2002:a1c:7407:0:b0:3a3:1d8:5c12 with SMTP id
 p7-20020a1c7407000000b003a301d85c12mr2283115wmc.191.1658913463656; 
 Wed, 27 Jul 2022 02:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0QIJHZcWhYSbMxbrTkVgxK9nGNIiL8HXBo/7AgnhzpF1kFG5uWvLcOjsrmOZa83NA81ZaOw==
X-Received: by 2002:a1c:7407:0:b0:3a3:1d8:5c12 with SMTP id
 p7-20020a1c7407000000b003a301d85c12mr2283094wmc.191.1658913463359; 
 Wed, 27 Jul 2022 02:17:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-164.web.vodafone.de.
 [109.43.176.164]) by smtp.gmail.com with ESMTPSA id
 z3-20020adfec83000000b0021dd08ad8d7sm47855wrn.46.2022.07.27.02.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:17:43 -0700 (PDT)
Message-ID: <5b88dcf7-5247-fa84-e625-4099ca8c4930@redhat.com>
Date: Wed, 27 Jul 2022 11:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Content-Language: en-US
To: luoyonggang@gmail.com
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
 <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
 <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
 <YuD9YuSbmCbzo9kB@redhat.com>
 <d90aa096-352a-fce4-4931-523cbea406d3@redhat.com>
 <CAE2XoE-A5S=P0nCzPvi4cxKnT3oG1kbxfNfHaBaj58xh=9pmiw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAE2XoE-A5S=P0nCzPvi4cxKnT3oG1kbxfNfHaBaj58xh=9pmiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 27/07/2022 11.11, 罗勇刚(Yonggang Luo) wrote:
> I've seen the cirrus ci always succeed, maybe using cirrus instead?

IIRC the free tier of Cirrus only allows two jobs in parallel, and we're 
using that for FreeBSD and macOS already - we could maybe add another manual 
job like we do it for NetBSD and OpenBSD already, but that means that the 
MSYS2 build won't run by default anymore.

  Thomas


