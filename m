Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D10526364
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:02:17 +0200 (CEST)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVs0-0008Uz-GF
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npVn3-0004eC-Vh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npVn0-0007QI-Bt
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652450225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxUeZgAGYZn6G6liC2f6IZfmAnKG8SV7LOrwRNa7OUA=;
 b=UkJdZxQFk/Q8+iH2G//iN7yTJfqM5v+454ZS6oJeD7pWf3V8eXLi71VZ/CdjNF5U7c/IYh
 X8EZZ+8P7b09MD52CkwuObI9Aq6iR/2tW7NK1lTAa73GHOJA6lapRzGq9qdPpt96TZcODP
 X4PO9Bl1pl9cY4E+pJQtqw6JsWdKkdY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-cjrxCGr2Mieu3DYlNDD7gA-1; Fri, 13 May 2022 09:57:03 -0400
X-MC-Unique: cjrxCGr2Mieu3DYlNDD7gA-1
Received: by mail-ej1-f69.google.com with SMTP id
 jx8-20020a170906ca4800b006f88b28f2f6so4179867ejb.11
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 06:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=SxUeZgAGYZn6G6liC2f6IZfmAnKG8SV7LOrwRNa7OUA=;
 b=30t9mxZqOAqQf5IGwsWY90XJXQZ5MS65iqGNo+vuRyGY2EZa74fKfW6uH4uB6cSWuq
 CiRxbv6PK6r+75xoVpNQ2FBI/vgsDTHZHkOqe6ClQRI4IgTMnQB5CrfwbyiNMQyfE2/g
 /f0YHekBv1wDM2+F8hnRkA0Rni0RTYXcGNeFAY6mFGLCpyDGKv8gmSPwmIkDBkpqYYw9
 Sv0F7xRUlXUd8+NgS4GurgfnQ2xjcnEZczrK2bqZL2cth34MHNqmKjyGyFYSnQYavava
 e2Gmv5K6RUJbGRRj/YwZTgvam7JizfVcj2vQMryKCqKWJ6uGcNlTC0cA0BcjTu58FKi+
 jB5Q==
X-Gm-Message-State: AOAM533INBLCaQo3pPHsqA4qpLXU+25KCXQBrlXKrXeNef/lxC1kaPOM
 fG1HgR5kWsz799XGU2eoEY6P7N03p77vVtTakmxE485A/cmArTMsEsYedGjzd+sT/NIHtxuCxC7
 Bteb6sCOhGehKCPQ=
X-Received: by 2002:a17:907:da7:b0:6f4:ed59:c4e2 with SMTP id
 go39-20020a1709070da700b006f4ed59c4e2mr4401228ejc.83.1652450222332; 
 Fri, 13 May 2022 06:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE/m2j+QmGWm19SgMNK09yXs9FokLRXsUjYl4xf4TMpwCc9sfndpQy5Jl+UaIs7yCbBloJvQ==
X-Received: by 2002:a17:907:da7:b0:6f4:ed59:c4e2 with SMTP id
 go39-20020a1709070da700b006f4ed59c4e2mr4401206ejc.83.1652450221997; 
 Fri, 13 May 2022 06:57:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cq5-20020a056402220500b0041d527833b9sm1006154edb.3.2022.05.13.06.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:57:01 -0700 (PDT)
Message-ID: <51586997-467c-0209-7319-fc82e1796809@redhat.com>
Date: Fri, 13 May 2022 15:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mark.kanda@oracle.com, berrange@redhat.com,
 dgilbert@redhat.com
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com> <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
 <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com>
 <87ee0xy3w0.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
In-Reply-To: <87ee0xy3w0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 5/13/22 15:10, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>> On 5/5/22 15:28, Markus Armbruster wrote:
>>> This means we'll acquire yet another introspection system, unrelated to
>>> the introspection systems we already have in QEMU.
> 
> ... ^^^ needs justification.  Explain why passing the kernel's
> existing interface through QEMU is useful, and to whom.

There are two justifications.

The first is the contents of the schemas: the new introspection data 
provides different information than the QAPI data, namely unit of 
measurement, how the numbers are gathered and change 
(peak/instant/cumulative/histogram), and histogram bucket sizes.  Unless 
you think those should be added to the QAPI introspection (and IMO there 
might be a case only for the unit of measure---and even then it's only a 
very weak case), the separate introspection data justifies itself.

So the existence of query-stats-schemas in my opinion is justified even 
if don't consider the usecase of passing through the kernel's descriptions.

The second justification however is indeed about the dynamicity of the 
schema.  The QAPI introspection data is very much static; and while QOM 
is somewhat more dynamic, generally we consider that to be a bug rather 
than a feature these days.  On the other hand, running old QEMU with new 
kernel is a supported usecase; if old QEMU cannot expose statistics from 
a new kernel, or if a kernel developer needs to change QEMU before 
gathering new info from the new kernel, then that is a poor user interface.

Gathering statistics is important for development, for monitoring and 
for performance measurement.  There are tools such as kvm_stat that do 
this and they rely on the _user_ knowing the interesting data points 
rather than the tool (which can treat them as opaque).  The goal here is 
to take the capabilities of these tools and making them available 
throughout the whole virtualization stack, so that one can observe, 
monitor and measure virtual machines without having shell access + root 
on the host that runs them.

> How strong do we feel about the stability of the stats exposed by this
> command?  Separate answers for *structure* of the stats and concrete
> stats.

I'll try to answer this from the point of view of the kernel:

- will "some" statistics ever be available for all targets that are 
currently supported?  Yes, resoundingly.

- are the names of statistics stable?  Mostly, but not 100%.  If 
somebody notices the same value is being tracked with different names in 
two different architectures, one of them might be renamed.  If the 
statistic tracks a variable that does not exist anymore as the code 
changes, the statistic will go away.  If KVM grows two different ways to 
do the same thing and the default changes, some statistics that were 
previously useful could now be stuck at 0.  All of these events are 
expected to be rare, but 100% stability is neither a goal nor attainable 
in my opinion.

- is the schema format stable?  Yes, it is designed to be extensible but 
it will be backwards compatible.  Don't break userspace and all that.

And for QEMU:

- will "some" statistics ever be available for all targets that are 
currently supported?  Yes, and this will be true even if other 
QEMU-specific targets are added, e.g. block devices.

- will other providers have the same guarantees of stability?  It 
depends.  Statistics based on the current "query-blockstats" output will 
probably be even more stable than KVM stats.  TCG stats might be of 
variable stability.  We can add "x-" in front of providers if we decide 
that such a convention is useful.

- is the QEMU schema format stable?  Yes.  What we have is more or less 
a 1:1 conversion of the KVM schema format, which is pretty 
comprehensive. But if an addition to the schema proves itself worthwhile 
it can be added with the usual care to QAPI backwards compatibility.

> If we're confident neither structure nor concrete stats will change
> incompatibly, the commands are stable without reservations.
> 
> If we're confident the structure is stable, but unable or unwilling to
> commit to the concrete stats, we should explain this in documentation.

Based on the above text do you have a suggested wording and, especially, 
a suggested place?  For example, do you think it would fit better in the 
query-stats or query-stats-schemas documentation?

Thanks,

Paolo

> If we're unsure about both, the commands should be marked unstable.  We
> can always upgrade stability later.


