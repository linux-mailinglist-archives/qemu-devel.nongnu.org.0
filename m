Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B434E1F1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:16:12 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8bj-0002TF-4C
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lR8Zn-0001iA-GH
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:14:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lR8Zj-0004GS-QE
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617088446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAmEDrHSGunf/l7GAIowJJC0GL/Z91BCRI8PQi7kNV0=;
 b=U8Yn8nXxsrlF8mxbwyeppBS7jwMNcCS31K63iAn5vJRkC8mmMsZFxgR6A/8gYzA+s7TrkH
 9iJ8b8E2JsJeuivZA7lPqetfcDn9k0Ynd9KlhA10J7/+A6mUnzJMFjbNJGqWUKcBXLaPW7
 uhnc1Y6fcs+D7pVYM6tlGiGg9E9jJHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-nrmjBreLN7yvon4ChqjuKA-1; Tue, 30 Mar 2021 03:14:04 -0400
X-MC-Unique: nrmjBreLN7yvon4ChqjuKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA93107BEF7;
 Tue, 30 Mar 2021 07:14:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E57266E707;
 Tue, 30 Mar 2021 07:13:57 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210329180140.2761383-1-thuth@redhat.com>
 <YGIdduioIxRIxMMp@redhat.com>
 <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <0d20369b-1f2e-1ac6-fb7e-556453ce5666@redhat.com>
Date: Tue, 30 Mar 2021 09:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2021 22.59, Paolo Bonzini wrote:
> 
> 
> Il lun 29 mar 2021, 20:33 Daniel P. Berrangé <berrange@redhat.com 
> <mailto:berrange@redhat.com>> ha scritto:
> 
>     The obvious alternative is to import the contributor covenant
> 
>     https://www.contributor-covenant.org/
>     <https://www.contributor-covenant.org/>
> 
> 
> The Contributor Covenant 1.x and 2.x are very different in that 2.x also 
> includes conflict resolution. Unlike the code of conduct, the consequences 
> of bad behavior are hard to generalize across multiple projects, so I would 
> prefer anyway the 1.x version. The differences with the Django CoC aren't 
> substantial.

Right. I also think we should use a code of conduct that allows us to keep 
the conflict resolution in a separate document.

Contributor Covenant 1.x is certainly an option, too, but it has IMHO 
already quite rigorous language ("Project maintainers have the [...] 
responsibility to remove, edit, or reject comments, commits, code, wiki 
edits ...", "Project maintainers who do not [...] enforce the Code of 
Conduct may be permanently removed from the project team."), which could 
either scare away people from taking maintainers responsibility or also 
could be used fire up arguments ("you are a maintainer, now according to the 
CoC you have to do this and that..."), which I'd rather like to avoid.
(well, as you know, I'm not a native English speaker, so I might also have 
gotten that tone wrong, but that's the impression that I had after reading 
that text as non-native speaker).

That's why I'd rather prefer the Django CoC instead.

> However this does mean being more careful about the language in the "custom" 
> documents such as the conflict resolution policy.
> 
> 
>     The second, it isn't a static document. It is being evolved over
>     time with new versions issued as understanding of problematic
>     situations evolves. We can choose to periodically update to stay
>     current with the broadly accepted norms.
> 
> 
> This however has the same issues as the "or later" clause of the GPL (see 
> the above example of 1.x vs 2.x for the Contributor Covenant). I don't think 
> upgrade of the CoC should be automatic since there are no "compatibility" 
> issues.

Agreed. We shouldn't auto-upgrade to a newer version of a CoC without 
reviewing the new clauses.

>      > +If you are experiencing conflict, you should first address the perceived
>      > +conflict directly with other involved parties, preferably through a
>      > +real-time medium such as IRC. If this fails,
> 
> 
> I agree with Daniel that this part should only be advisory. For example:
> 
> If you are experiencing conflict, please consider first addressing the 
> perceived  conflict directly with other involved parties, preferably through 
> a real-time medium such as IRC. If this fails or if you do not feel 
> comfortable proceeding this way,...
> 
>     Also this document doesn't mention anything about ensuring the
>     confidentiality/privacy for any complaints reported, which I
>     think is important to state explicitly.
> 
> 
> Agreed, and also the part about keeping a record should be removed from the 
> consequences part because it's a privacy regulation minefield.

Ok, thanks for the feedback, I'll try to incorporate it and send a v2.

  Thomas


