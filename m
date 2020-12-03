Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56C2CD462
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:14:31 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmZC-0002qk-DS
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkmWf-0008Gn-Cd
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkmWc-0007ug-Ey
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hphSpfOFLEMtpIx1tQJhaIhBn6U+5/Dv65k9WXUG7Q=;
 b=L41ry+7xv13ArIdmHIq14QOy04p42EnQO48eE+fH0Dh5axe6EbsIEnWL+8yoj4yQa1XY+G
 TWtzC0riI8LiHvRbfzACDuwEJNDDwOPL0Na8oWC3Gr/VcX58F59x35R95gOM1+Vioh86T0
 TbCprZ48iuLEcO01YC/P5187JKkjWpU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-Ufb1VjdPO2mfKYZzs2jutA-1; Thu, 03 Dec 2020 06:11:44 -0500
X-MC-Unique: Ufb1VjdPO2mfKYZzs2jutA-1
Received: by mail-ed1-f70.google.com with SMTP id f19so789299edq.20
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3hphSpfOFLEMtpIx1tQJhaIhBn6U+5/Dv65k9WXUG7Q=;
 b=RRivkW1mX83hiA0G6pW+qy6wLO0GvJir1Fazazw1mIja22s/+5YtHJmqDHsl30LQdN
 6sIQskL7nkQTnBs5Z+chq9QtJZkvQlG4AWyBrXHvgctjc8LF96QfWIE1KTSxrSXuzvrL
 HhlCsgke1w42NN7zx/IjvxdwLcdRo5l3I6srUtOnYaLh7DQDRPR1H5EqQYXg0yvEpMzX
 v+3vLHDDhSLdbgzih1uWQFHcwMpg9yDrdUod7WhCgpBmUMvn9cRjV2LIgpoVRKe1Oc1o
 2ToivPEhmY6hRYxybo3t3nfbvLrRRRSRcpvC7WA/am3IsD/uDfFejN/uGV1mVArpKA46
 w3BA==
X-Gm-Message-State: AOAM533ESyH7DXBa6KYl+d7qb5++vXCaW3DUIowIBp06wlPO8ZAPDcoz
 ntOGYdDUZRIbMlSICL/9UcXQUDSuSlD2Hx+sPXblTp8lNu50UuMOvW2+B2JlhIcooLUsitczT+P
 j7Cb4fyFHXRsXiik=
X-Received: by 2002:a17:906:1a19:: with SMTP id
 i25mr2024387ejf.206.1606993903330; 
 Thu, 03 Dec 2020 03:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5MfWbSf6wKQoZwJuApVQd/MeJNahtbZ46/rrleKsReyE5yN80dh1PYcEk9TjmStPjoxY1Qg==
X-Received: by 2002:a17:906:1a19:: with SMTP id
 i25mr2024364ejf.206.1606993903073; 
 Thu, 03 Dec 2020 03:11:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z12sm621940ejr.17.2020.12.03.03.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 03:11:41 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net> <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net> <20201202173506.GH16765@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
Date: Thu, 3 Dec 2020 12:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202173506.GH16765@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 18:35, Kevin Wolf wrote:
>> Could we have an intermediate state that doesn't require any
>> duplication and thus have no separate code paths that could
>> diverge?
> 
> The one requirement we have for an intermediate state is that it
> supports both interfaces: The well-know create/set properties/realize
> dance, and a new DeviceClass method, say .create(), that takes the
> configuration in parameters instead of relying on previously set
> properties.
> 
> I assumed two separate implementations of transferring the configuration
> into the internal state. On second thought, this assumption is maybe
> wrong.
> 
> You can implement the new method as wrapper around the old way: It could
> just set all the properties and call realize. Of course, you don't win
> much in terms of improving the class implementation this way, but just
> support the new interface, but I guess it can be a reasonable
> intermediate step to resolve complicated dependencies etc.

I sketched something at https://wiki.qemu.org/Features/QOM-QAPI_integration.

The main difference with what we discussed so far is that it doesn't 
subsume the complete/realize step, only the setting of properties.  The 
idea is that user_creatable_add_type does the following:

- calls an oc->configure method on every superclass of the object

- takes what's left of the input visitor and uses it to set properties

- then calls ucc->complete

So in the end the only new step is the first.  If the first two steps 
are bundled in a new function object_configure, they can be reused for 
devices, machines and accelerators.

The QAPI code generator can also easily wrap them into a C API for QOM 
object creation.

I glossed completely over the generation of properties within the QAPI 
code generator.  Making properties read-only (or, in the 
field-properties world, having a default allow_set of "return false") is 
already a nice improvement over

> It would be much nicer to do the wrapper the other way round, i.e.
> setting properties before the device is realized would update a
> configuration struct and realize would then call .create() with that
> struct. To me, this sounds much harder, though also a more useful state.

This sounds much harder.  However, based on the RngEgd sample, going 
from a basic QAPI struct to a full conversion is not too hard and makes 
code shorter.  So it's win-win even though it's human work.

Paolo


