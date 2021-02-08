Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E612131451A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:52:44 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HGl-0001fz-H5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9ETc-0000y9-Mr
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9ETV-000318-Cq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612821219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfhW7EPbhov6L+YhDdt9yz2BfX1fs1kBQIQ4s/t/ZYQ=;
 b=CdV0z3thDLazdvhfDbQ/WYz9WVlDtnL1u+CrlI77a0WTB0L1KGbHYsh1mUr+k8fPL6VSm2
 rEnNq5LuLe460wfOasDEPxePWonGK2y8ifdLJ9KBTncB0rFaEg1hrLDq4WUHV2KrvOjWR1
 D/O4pW8S5FUWFnz17h1blCArOv+/RP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XrdkkEK7OGi85o79Ku1Niw-1; Mon, 08 Feb 2021 16:53:38 -0500
X-MC-Unique: XrdkkEK7OGi85o79Ku1Niw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 354E91935780;
 Mon,  8 Feb 2021 21:53:37 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B571975E;
 Mon,  8 Feb 2021 21:53:33 +0000 (UTC)
Subject: Re: [PATCH v4 11/14] qapi/introspect.py: add type hint annotations
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-12-jsnow@redhat.com>
 <87r1lxqj2e.fsf@dusky.pond.sub.org>
 <ee95f545-7c43-0587-642b-e70589b4a0e6@redhat.com>
 <87tuqq1vii.fsf@dusky.pond.sub.org>
 <a1d1c67e-8066-3154-1117-6c86c6f8d9b6@redhat.com>
Message-ID: <c12457a3-7279-bd1a-7c5b-932aa8d4e299@redhat.com>
Date: Mon, 8 Feb 2021 16:53:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a1d1c67e-8066-3154-1117-6c86c6f8d9b6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 4:39 PM, John Snow wrote:
>>
>> I'm once again terminally confused about when to use _lower_case and
>> when to use CamelCase for such variables.
>>
> 
> That's my fault for not using them consistently.
> 
> Generally:
> 
> TitleCase: Classes, Real Type Names :tm:
> lowercase: instance names (and certain built-in types like str/bool/int)
> UPPERCASE: "Constants". This is an extremely loose idea in Python.
> 
> I use the "_" prefix for any of the above categories to indicate 
> something not intended to be used outside of the current scope. These 
> types won't be accessible outside the module by default.
> 
> TypeVars I use "T", "U", "V", etc unless I bind them to another type; 
> then I use e.g. NodeT instead.
> 
> When it comes to things like type aliases, I believe I instinctively 
> used lowercase because I am not creating a new Real Type and wanted some 
> visual distinction from a real class name. (aliases created in this way 
> cannot be used with isinstance and hold no significance to mypy.)
> 
> That's why I used _stub, _scalar, _nonscalar, and _value for those types 
> there. Then I disregarded my own convention and used TreeValue; perhaps 
> that ought to be tree_value for consistency as it's not a Real Type :tm:
> 
> ...but then we have the SchemaInfo type aliases, which I named using the 
> same type name as they use in QAPI to help paint the association (and 
> pick up 'git grep' searchers.)
> 
> Not fantastically consistent, sorry. Feel free to express a preference, 
> I clearly don't have a universally applied one.
> 
> (Current leaning: rename TreeValue to tree_value, but leave everything 
> else as it is.)

Addendum: pylint wants any non-underscored type alias to be treated like 
a class name, as CamelCase.

I guess it just exempts underscore prefixed things. So, it does have to 
stay "TreeValue".

--js


