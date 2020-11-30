Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E312C839B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:00:13 +0100 (CET)
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhqn-0001Jf-2U
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjhpu-0000mn-2Z
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjhpq-00024e-NN
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606737552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rce51J3/ksoLeQdRVuH8M4HKokn2PkV3E4le6O5NEiA=;
 b=POmQlkEXhbiuSsFYuVz1BYmPYm46UbvwPHQpFzQLONCR81xiST2wO276hZsz1UPzwFufNT
 uMxGQfeseVqd9WcQHgZj4d9W7Ss6w38aazD01bFpvkaneiVKuJDREZovUw/U9t86Mb5E8U
 PxzTIcms7SgUjfZ8RQCpiLHb2Jb7jfc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-tKe9iGmkPGGO6caeVcMWRg-1; Mon, 30 Nov 2020 06:59:08 -0500
X-MC-Unique: tKe9iGmkPGGO6caeVcMWRg-1
Received: by mail-ej1-f69.google.com with SMTP id t4so3972391eju.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rce51J3/ksoLeQdRVuH8M4HKokn2PkV3E4le6O5NEiA=;
 b=X3h6R3ViBjCoUSjVZrzO+gtCFzRAB8vgAMhcZ+8r//UgHY9weNhGaBBtvu6IguuTbB
 dblLTUWUe6iCiHGCuba7CK9sol3lLgMijSIaomfU3ecOX/W8MUzg8ogUG/Gu+JaKUNeh
 W2t6hEqbHTE7AWUHk/ubjv++B5TTY34JMAF+cM+zCF+CDzJdwNqFGgzZLOmxIQgRsHAT
 QLXI9lzcfZqcFRwf4KfKW5n5Eon/uczu/xvKTsGPhUnN3oK/tRvR54BUBM8iSulcIRfn
 oyPMisiZz0y1dBzaJjLQK4QvSm2t3WcM3fh5mOb2Ov9f1EtHhxBcx29qD1udN2z8fo5z
 xBEQ==
X-Gm-Message-State: AOAM531cIuRdWJ9g0IIcZFQ9msdUZHQ3Y/mN57l+8eOv2SprFO1P2nsr
 e+spyUYAHz9GAoK+HnYzLFs5hlHU1NuhJj6+Zp3hiw+aPR5VwaQ8yCRDotvDMi8PaXzdefWcU5C
 l/1p8r7llS71rVtMf5j588IgSNyNl/mEbaMgfrMAzuhWW3UOZK6PvWPAVGHjxYmttybQ=
X-Received: by 2002:a17:906:604e:: with SMTP id
 p14mr20991007ejj.515.1606737546685; 
 Mon, 30 Nov 2020 03:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/s1NNkrSEI3K1FWvbbvgnXWohRe0TBzAsEJTn5184xfMy5wVBsILsWhzV+tGKjOW9ggGDMg==
X-Received: by 2002:a17:906:604e:: with SMTP id
 p14mr20990983ejj.515.1606737546431; 
 Mon, 30 Nov 2020 03:59:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd18sm590091ejb.53.2020.11.30.03.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 03:59:05 -0800 (PST)
Subject: Re: [RFC PATCH 00/29] kernel-doc: update from Linux 5.10
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201117165312.118257-1-pbonzini@redhat.com>
 <CAFEAcA-D0A=xvR7JZU55QiXDmMbhaBtxOA3PObMTcz6YtpF4sg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <442137b7-10c4-70a9-41f6-affbebcfc4a4@redhat.com>
Date: Mon, 30 Nov 2020 12:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-D0A=xvR7JZU55QiXDmMbhaBtxOA3PObMTcz6YtpF4sg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 12:28, Peter Maydell wrote:
> If we wanted to completely make the series bisection safe we could add
> a patch at the start that simply comments out the five kernel-doc
> directives in docs/devel/*.rst, and then have a final patch at the
> end that reverts it. That seems like it would be simple enough and
> it would avoid anybody doing a bisection run on a newer host having
> to remember to put --disable-docs in their configure arguments.
> 
>>    scripts: kernel-doc: allow passing desired Sphinx C domain dialect
> 
> Your port of this kernel commit is missing the hunk which
> must be applied to our docs/sphinx/kerneldoc.py:
> 
> More generally it would probably be reasonable to sync also
> kerneldoc.py -- we're only slightly adrift of the kernel version
> and we don't need any of the changes the kernel has, but syncing
> it at the same time we sync kernel-doc is probably less confusing.
> 
> I did a diff of the final kernel-doc against the kernel version.
> Mostly the diff looks like changes we want (and it's pretty small,
> which is great). This hunk, however:
> 
> @@ -1758,7 +1758,7 @@
>       # If you mess with these regexps, it's a good idea to check that
>       # the following functions' documentation still comes out right:
>       # - parport_register_device (function pointer parameters)
> -    # - atomic_set (macro)
> +    # - qatomic_set (macro)
>       # - pci_match_device, __copy_to_user (long return type)
> 
> is an unintentional change from QEMU commit d73415a31547, which
> did a global search-and-replace of a function name.
> We should probably add a patch to this series to
> revert it, so we stay as close to the kernel's copy of the
> script as possible.

Ok, I'll clean these up and resend.

Paolo


