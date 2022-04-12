Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80C4FE47C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 17:18:18 +0200 (CEST)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neIHZ-0001VZ-A9
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 11:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1neIG0-0000kU-Q4
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 11:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1neIFt-0002OZ-7Z
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 11:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649776589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/cSmLJnVV/fxPV1LT4VkM1WpDqpSVCPM894bG2NqWE=;
 b=IOKCOWZDgXYjZio5lAsUELF0ikkZeA3f8i+n0PYpe0PEf0cSCbjmX6oIg68jCo4AZgXQEq
 EvjZD5E47qzg33v7xCZ8ioK7gTLLHbuSpT/OUjrZbvyRkPY9vyTj5qxlzh6T1axDiT69B4
 tFSWTQac61/5yaYI2RGvexEp2zvbSXA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-dUm89VhOM1eLMP1ZNc-x9w-1; Tue, 12 Apr 2022 11:16:28 -0400
X-MC-Unique: dUm89VhOM1eLMP1ZNc-x9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so4123222wrg.19
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 08:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=/CeKknD5hYUvXezBlePd3/vGB6Nl0thBmZZNBm+Rrio=;
 b=XQ1SOSFbQIfAGUgrQHTBpeG4TdMzp+pcboAxmRWxfqplWi8sIZ1eWceovsL33EziNH
 0M6/r1MqkYzausBKYY7vnAfgycAlXaFwxNkgbe+8sa33csVPQcHNVb5UuBxI9rSu76Nc
 7mpPocw6axlSfOBsdLKJNaCxwyxygwa5Sgt8AMZMqdebo1Py71MykHGpt1QPO1Xp0p+o
 Qe38fT6gNnJSOQB1cFaDLiM0OohSjAz1fIpFoM6cIMqf76ZVjjD7U9DD9L1jXYFIceIH
 lIgf4UOOYWwYrpHrWl3LcQjt0aZTb7pX21vdEXzWAG8LU+Wm3TPfRwPCMR+JbBvXfoy7
 r02A==
X-Gm-Message-State: AOAM530FLiq+FI4jNmvZmmu24KcGkAv42+o1RlshlvCl9MoL7unOU0Wt
 DF9Z/oN1X8hJ5nLhkvhgKrBk9Cj4JxPK8ET/3SXx1b1WPjF/TkWCGwVrhsl4gZdBKQHNU+yxsDi
 6IpWc0wc4OV9vlIoPuuZ2vxPIfEklJtzeXohA/3y8fllpPeP96clF6Ialc6dc1IPWsio=
X-Received: by 2002:a05:6000:144b:b0:204:d97:8d12 with SMTP id
 v11-20020a056000144b00b002040d978d12mr30882925wrx.572.1649776587144; 
 Tue, 12 Apr 2022 08:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfiOgnLXVx95DlJFKfAGXxVzmgLatjoXoefJzCkVe6mUkN4z44qecKWxzdvwVK4QgiVMlXoA==
X-Received: by 2002:a05:6000:144b:b0:204:d97:8d12 with SMTP id
 v11-20020a056000144b00b002040d978d12mr30882897wrx.572.1649776586770; 
 Tue, 12 Apr 2022 08:16:26 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b002078d640b29sm12801964wrg.83.2022.04.12.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 08:16:26 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Divya Garg <divya.garg@nutanix.com>
Subject: Re: [Qemu-devel] [PATCH 6/8] i386/kvm: hv-stimer requires hv-time
 and hv-synic
In-Reply-To: <c9822d09-9c64-fddf-671b-389e21022e8d@nutanix.com>
References: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
 <87tuay5uy3.fsf@redhat.com>
 <c9822d09-9c64-fddf-671b-389e21022e8d@nutanix.com>
Date: Tue, 12 Apr 2022 17:16:25 +0200
Message-ID: <87r1625o3a.fsf@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Divya Garg <divya.garg@nutanix.com> writes:

> On 12/04/22 6:18 pm, Vitaly Kuznetsov wrote:
>> Divya Garg <divya.garg@nutanix.com> writes:
>>
>>> Hi Vitaly Kuznetsov !
>>> I was working on hyperv flags and saw that we introduced new
>>> dependencies some
>>> time back
>>> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__sourcegraph.com=
_github.com_qemu_qemu_-2D_commit_c686193072a47032d83cb4e131dc49ae30f9e5d7-3=
Fvisible-3D1&d=3DDwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3D2QGHz-fTCVWImEBKe1Zc=
Se5t6UfasnhvdzD5DcixwOE&m=3Dln-t0rKlkFkOEKe97jJTLi2BoKK5E9lLMPHjPihl4kpdbvB=
StPeD0Ku9wTed7GPf&s=3DAtipQDs1Mi-0FQtb1AyvBpR34bpjp64troGF_nr_08E&e=3D ).
>>> After these changes, if we try to live migrate a vm from older qemu to =
newer
>>> one having these changes, it fails showing dependency issue.
>>>
>>> I was wondering if this is the expected behaviour or if there is any wo=
rk
>>> around for handing it ? Or something needs to be done to ensure backwar=
d
>>> compatibility ?
>> Hi Divya,
>>
>> configurations with 'hv-stimer' and without 'hv-synic'/'hv-time' were
>> always incorrect as Windows can't use the feature, that's why the
>> dependencies were added. It is true that it doesn't seem to be possible
>> to forward-migrate such VMs to newer QEMU versions. We could've tied
>> these new dependencies to newer machine types I guess (so old machine
>> types would not fail to start) but we didn't do that back in 4.1 and
>> it's been awhile since... Not sure whether it would make much sense to
>> introduce something for pre-4.1 machine types now.
>>
>> Out of curiosity, why do such "incorrect" configurations exist? Can you
>> just update them to include missing flags on older QEMU so they migrate
>> to newer ones without issues?
>>
> Hi Vitaly !
>
> Thanks for the response. I understand that these were incorrect=20
> configurations
> and should be corrected. Only issue is, we want to avoid power cycling th=
ose
> VMs. But yeah I think, since the configurations were wrong we should=20
> update and
> power cycle the VM.=C2=A0 Just for understanding purpose, is it possible =
to=20
> disable
> the feature by throwing out some warning message and update libvirt to=20
> metigate
> this change and handle live migration ?
>

I'm not exactly sure about libvirt, I was under the impression it makes
sure that QEMU command line is the same on the destination and on the
source. If there's a way to add something, I'd suggest you add the
missing features (hv-time, hv-synic) on the destination rather than
remove 'hv-stimer' as it is probably safer.

> Or maybe update libvirt to not to ask for this feature from qemu during l=
ive
> migration and handle different configuration on source and destination=20
> host ?

You can also modify QEMU locally and throw away these dependencies,
it'll allow these configurations again but generally speaking checking
that the set of hyper-v features is exactly the same on the source and
destination is the right thing to do: there are no guarantees that guest
OS (Windows) will keep behaving sane when the corresponding CPUIDs
change while it's running, all sorts of things are possible I believe.

--=20
Vitaly


