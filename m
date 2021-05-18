Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0738814C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:22:27 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6EU-00041h-Ry
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj64Y-0000b8-9H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj64O-0006FK-VE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621368719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtLwxEnsEfN6cj4xHan6As3MuvE7If+R0pjppMZsGg0=;
 b=i6SEj5XJBn+g6PrcEiDm5Zcm4FE4CzlrE69zvubuJCJXoeQ76SHPvjPbDCscwwhs/34ApE
 +DZb+JdvbX5JzbD6JAtnmCwDhDYc5lUwdh5fGm4yHGsPh9DikOm4c7wZM4sI1pBUoF9eN3
 TUIZcVxwhe1iNUteDJlQ3b+AyygKThQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-sW32GQ8MOS2eoN5Wcsb95Q-1; Tue, 18 May 2021 16:11:57 -0400
X-MC-Unique: sW32GQ8MOS2eoN5Wcsb95Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 n25-20020a170906b319b02903d4dc1bc46cso2859079ejz.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EtLwxEnsEfN6cj4xHan6As3MuvE7If+R0pjppMZsGg0=;
 b=OcXbnKfbe1RWiW0P+KjZa9gjyMx9E0ioUM0Jg4ymrkB4xUsmIR9ukfpcHCzd7fMfHx
 XLBkMHOQEnAuNA1C+cX7rNgC9nz+qbM3O+Oa+o8o9dxIfqiUBHIKyIRzuVgdCILQF8ar
 jDoCVMI2fIqvVi4hWTJq+tNsP22NPMx+JmJ76V1ibheIh63as8rFsj8LABobesRJxtcL
 G+0ES9VcOKE3nwJmX460jkYF3TOBHpW929kGIdWGhZW+MkTBHuHD3I1gZgToqPXd0mtB
 NSXsaYn1LMf2QKBsX0u6zpWOfoPb5gqr0Kor8bAoDA6VhVtNKcmcC5oPPi5kahXRKpKx
 K9pQ==
X-Gm-Message-State: AOAM5333TNbFu7GJvrtVHamqMyOKVHd8T/KbJVXU2gYzlVpjvTpRvuIs
 yhPN9iLJv19J4hg/xPp/TS3q7eSyhYZ18WpGLSU3Eo0efeSHodexQqlQoPsnoolcI+Q+yBxJMbU
 CzK5PczfQuRsqFRI=
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7697740ejm.527.1621368715793; 
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOvoLewqk7B22jcfp7eaqS/xLOgx1W3a4vSsHE8OXTrbHXyRAdYGK6W02CDmbGbH3LyAngOQ==
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7697730ejm.527.1621368715659; 
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n17sm13378101eds.72.2021.05.18.13.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
 <20210517200416.pt4xghxiuzuwknvn@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
Date: Tue, 18 May 2021 22:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517200416.pt4xghxiuzuwknvn@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 10:04 PM, Eduardo Habkost wrote:
> On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
>> CCing Build system architecture maintainer (Daniel).
> 
> Oops, I was misled by the subsection title.  Daniel is
> responsible only for the build system documentation.
> 
> Do we have any volunteers willing to be listed as reviewers for
> build system changes in MAINTAINERS?  meson.build has a
> non-trivial amount of code and no maintainers or reviewers at
> all.

Hmmm OK I can add an entry. Ideally with Paolo/Thomas but I don't
think they want to be listed in any new section ;)

>> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daudé wrote:
>>> Various Kconfig fixes when building stand-alone machine binaries.
>>
>> Who should merge this once it's ready?

Paolo said in v1 that I can send the pull request myself :))

I will do it in the next 48h~.

Thanks,

Phil.


