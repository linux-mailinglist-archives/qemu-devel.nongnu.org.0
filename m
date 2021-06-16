Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168503A982E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:54:31 +0200 (CEST)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTBm-0006fI-6E
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltTAY-0005dZ-8P
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltTAW-0007eA-KO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623840791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuUhwf2Dt6pE93TubdaHgW5dHWoUDeDvMeApDk7YfGo=;
 b=CJadV48/ZklZPd0JpmLwgHKPsldfwGVvPVnRuLQKRLi1IzBw2/lN3FJ5366jnZ4sgF92df
 h9QrhsrdjgU8M0QDxnhfp6v8WpehUuCoIlHHSaxRKe26sYIJ+be69LnyDf0pyU3ItDFOpx
 fdzWZRTqTiyyugPpptiQ4EiZ6xXEot0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-GKXdKmcpMUuG1NfDsdR1Rw-1; Wed, 16 Jun 2021 06:53:10 -0400
X-MC-Unique: GKXdKmcpMUuG1NfDsdR1Rw-1
Received: by mail-ej1-f72.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso766748ejc.14
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UuUhwf2Dt6pE93TubdaHgW5dHWoUDeDvMeApDk7YfGo=;
 b=ZMhHq0hjrQaxqYqhSZckiS37dpFZR6tkrl7Fsm5lo9+Xz1ukbBaB8Wd6po3bQlOeLK
 aBWVdiXvZiI0Kj8ZZsUS7P+qyOpq2PfQz9iR2CmC5y3uCNxzApz4kziOR1crm5ZCvFd6
 9fJhJzgVfKwh3QY4zDOQB7EhH0JMQ25b4dlF57hZhvboZAbojrV2QUQMNYe78PB9CrBx
 NoqtwMnhcWnkXo4+33ihko08URHQaawlG+I5EgLHVJeVhtGMQEpkg+P0sVJHpsSibTZE
 QdKU03/k1112y4aw+b1lRfcFdi8TYofgAcIDrfU/X1b+ysNan3n5hef0l4GI5MXHwUQV
 yBmA==
X-Gm-Message-State: AOAM531ESWRrJ3BgOrD0VPHgJ9AkDWvkt01r4y2yA1HGN2/y2MjlUiDv
 ksuCD3wthBgtXr0BIU3rewYcah3tAoJrug7fytP5zFnc48ipig1pxi3pjSNXpLz4MNFK1DzuZQQ
 c6moj367ZEecJmJYVH2vJ2U529NEwL8NGNmv3Fjvr7ZKGG0GYVSO6odokHAvPV1ajvBE=
X-Received: by 2002:a17:907:9d0:: with SMTP id
 bx16mr3479102ejc.72.1623840789133; 
 Wed, 16 Jun 2021 03:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWl+r2LFwOEY/iY44jPEg1c284A8fKfwbj3WU1T4xcOomFSgfp2ADJsXkwyNcnr3cNHaaVAA==
X-Received: by 2002:a17:907:9d0:: with SMTP id
 bx16mr3479089ejc.72.1623840788926; 
 Wed, 16 Jun 2021 03:53:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h22sm1498230edv.0.2021.06.16.03.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 03:53:08 -0700 (PDT)
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
 <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
 <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
 <20210615130715.lye3spkpa24x3pyj@sirius.home.kraxel.org>
 <279b97e2-d06d-b929-0265-d4bd41dc6ee2@redhat.com>
 <20210616091604.teypyrrggxe7gooz@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e73d9cd1-5db6-9b27-c99d-177cc8f1741d@redhat.com>
Date: Wed, 16 Jun 2021 12:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616091604.teypyrrggxe7gooz@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/21 11:16, Gerd Hoffmann wrote:
>> I was almost giving up... but it looks like the result of
>> extract_all_objects(recursive: true) can be passed to custom_target(). Then
>> you can match it after compile_commands.json's "output" key.
>
> Seems the custom_target commands do not land in compile_commands.json.

No, they don't.

The idea was expressed a bit too concisely. :)  I was thinking of using 
extract_all_objects on the module static library, passing the result to 
modinfo-collect, and looking up the names in compile_commands.json.

Paolo

> But I have figured meanwhile that looking for the target name in the
> command line works reliable.  That will will match
> -DCONFIG_TARGET="${target}-config-target.h".
> 
> Current WIP patch below, seems to work nicely.  Whole patch series needs
> an overhaul now ...


