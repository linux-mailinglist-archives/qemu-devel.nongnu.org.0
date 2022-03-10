Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A74D41D1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 08:27:30 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSDCr-0000Ar-D2
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 02:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDAv-0007hK-AJ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:25:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDAr-0001o2-R5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646897123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHTUtkF9mkSax7gjL3aydaK/j7S7+5uM5lSi0IPCMUg=;
 b=Gads0pDPg9bRm0SZzb7X7bgSfAM+SQeHpX184tyFJi88DbsSrlgXHBv98SJ4HxzUAfcvys
 rmvJDWm5S3G/Qfp6dzGh2tUvqitezjf7Wapmn6AIJBbNisDgciUr9lqkS9xJy9KxJ8dSFz
 GWro31cr55dZjTnbT2ECEwhysKUY/rI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-efY7TGgdNi-lpCJYgs4iAg-1; Thu, 10 Mar 2022 02:25:22 -0500
X-MC-Unique: efY7TGgdNi-lpCJYgs4iAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o21-20020a05600c511500b003818c4b98b5so1793228wms.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 23:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OHTUtkF9mkSax7gjL3aydaK/j7S7+5uM5lSi0IPCMUg=;
 b=lWhGYamE2FW2TEN/Ec7TZzCb/2vmKaqRN/76vQf3p2Uc1li3cabMKk/lVtdyY4oUVO
 zMm9I+bwn48V+nnRMRsfju3unJi/LosTevu5RTxG4zHatbVxvfFoCM06sls2ytag7Yf+
 dZzz4zt3r3fNWp2ICG0wfyuFbvkmcY+OoASIjxCxiqoddyQnmfdXk2OfIIz15+05CjQI
 TB53W+Pz4+xRJks55jsp3eDYjO3t1SRLH10j3/UCpjL5xs9LP2tFMLCyFZgwKwyNC9vM
 4K8ueyrqjOGUEXvzHV+JEFJzrZX3onfpaqjVfbDc4H7GcMMkXUAP1Ixkhqci6hkTSkd2
 C8gw==
X-Gm-Message-State: AOAM530aySPGFZ5sAqv5DTWGnf7RPbtOLVT3R0KObzSd3e9+ENK2OsyS
 4JQU3osoKaNuk6RBc8eUYw9WQ6i/4ew7D9YOEbPEjOmz4OM4DEqv/AJLcxfYJ8iiP0LBF4uv+eI
 ESbB1XuJxntND0HY=
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr10609408wmp.41.1646897121631; 
 Wed, 09 Mar 2022 23:25:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxztqdfyn86lfrk7K3odH66g15cOxLKBQMvQhsxks0tNuNPB+kdzZIGJ1KXbD/dFlv8Tck3w==
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr10609393wmp.41.1646897121366; 
 Wed, 09 Mar 2022 23:25:21 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm3855349wma.2.2022.03.09.23.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 23:25:20 -0800 (PST)
Message-ID: <03b4c16b-ba29-2521-ebcf-8e8e5328d00a@redhat.com>
Date: Thu, 10 Mar 2022 08:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
 <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
 <CAFEAcA-Db_ThUpbdPkzKn0d3CMPBH-GufHAZtERb0XQpUyKz4A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-Db_ThUpbdPkzKn0d3CMPBH-GufHAZtERb0XQpUyKz4A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2022 19.44, Peter Maydell wrote:
> On Wed, 9 Mar 2022 at 09:47, Thomas Huth <thuth@redhat.com> wrote:
>> Since the fix is not available in any meson release yet and we're in QEMU
>> softfreeze now, I'm now also not quite sure anymore whether we really should
>> go forward with the TAP approach right now... maybe it's indeed better to
>> revert the patches for QEMU 7.0 and sort it out later?
> 
> I'm a bit lost about where this discussion thread ended up,
> so to be clear: are you OK with me applying this pullreq
> from Paolo, or do you want more time to talk through the
> issue? (I have another half dozen pullreqs still to merge
> so it's not like I'm waiting on just this one.)

This version of the pull request has a merge conflict and won't apply 
anyway, but Paolo already sent a v2 of the PR which does not have the TAP 
revert patch in it, so you can certainly go ahead and merge that v2. We 
should have a decision by next Tuesday hopefully whether we revert the TAP 
code or go ahead with it...

  Thomas


