Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDA2FB75A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:24:11 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rvW-0001BQ-3W
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1rsG-0006SM-HK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1rsE-0001op-NG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611066045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2l5EvuQiToRh0uMOYHPiqPiuhdtJUfMUnq2tWs1Wtrs=;
 b=TBQdbHO9CPJfVSZx01GEDSyAHod52zkF9lpE5gnTXK3uXAxxfvdVJwPIQEF+aQN+/+okSC
 VXFuq/WUmipvY6AwP3I96CZisI7jHsEu14KOP+DnF6+PWaAlUNTjMFEif3eu4twgRqH63X
 fmpvoMyxKpWH2dXurwiMcj6z/ekMVfA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-DH7maXKIMp2EPHx11MjA9w-1; Tue, 19 Jan 2021 09:20:44 -0500
X-MC-Unique: DH7maXKIMp2EPHx11MjA9w-1
Received: by mail-ej1-f70.google.com with SMTP id m4so6328870ejc.14
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2l5EvuQiToRh0uMOYHPiqPiuhdtJUfMUnq2tWs1Wtrs=;
 b=h0O5unLtcSqTeJevLtReB7R2584x1geG6+RiVzLeZx/w9N1OjuT2avXLRu25Qpg2jL
 zpx4p+5ikC42cT1E1S1wrQOurNQ46WVdVvCgtB4oV0daeXjGk8aFyPQ4zEIhajx/JgUB
 O5C8U5BnonCphxKKBoKPoK6gFC41gLuo5J+PiQ0bJun415rRKptflcGEQ19Vj4fB+J+I
 ai5jMnXJQkKxSi8tlnxJNXZbIeqiBYZfhY6GQpQCyipEuUuelzKouczYZgDcyqV8Upkx
 po3IydmkzksGWL6B3YT7FpGOBnrSgHX4kNlPk+E+eXvZDq2rerJuYFcLUYEHJp0emaQk
 fImg==
X-Gm-Message-State: AOAM531EqPCS2hLzsOktEKXjYV3YrDC/PadEcI3qwnkBXeKfOlSkpO8M
 4UBPkV1BlTRkHFOSMpDaRTP/HeDYqO6++HAa6Vg3TLVZ4n8DjIC+FdK0Vl+WNzie6wZaSp04fo5
 yLTo0tUn3S0dGx3U=
X-Received: by 2002:a17:906:af15:: with SMTP id
 lx21mr3063971ejb.6.1611066043131; 
 Tue, 19 Jan 2021 06:20:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+LsAu4n681BY0KdRoW5vhYIIj40EWlMZ1EMkRXX9K5zpWqECkxNI9jgldqwK8M63ZBZZUCg==
X-Received: by 2002:a17:906:af15:: with SMTP id
 lx21mr3063959ejb.6.1611066042854; 
 Tue, 19 Jan 2021 06:20:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r7sm10813850ejo.20.2021.01.19.06.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:20:42 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
 <87y2gpxc2q.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
Message-ID: <0802f4d3-f9b1-540f-b83a-977c01ce8f62@redhat.com>
Date: Tue, 19 Jan 2021 15:20:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2gpxc2q.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 14:58, Markus Armbruster wrote:
>> qemu_machine_opts ("-M")
>> 	qemu_find_opts_singleton("machine")
> 
> Gone since your commit 4988a4ea4d "vl: switch -M parsing to keyval".

Which is part of this series and not yet included in QEMU. Hence the 
commit message talks about it in the present tense.

> If the user passes multiple -boot with different ID, we merge the ones
> with same ID, and then vl.c gets the (merged) one without ID, but the
> other two get the (merged) one that contains the first -boot.  All three
> silently ignore the ones they don't get.  Awesomely weird.  I'd call it
> a bug.
> 
> Test case:
> 
>      $ upstream-qemu -S -display none -boot strict=on,id=id -boot strict=off
> 
> vl.c uses strict=off, but fw_cfg.c uses strinct=on,id=id.
> 
> Outlawing "id" with .merge_lists like this patch does turns the cases
> where the two methods yield different results into errors.  A bug fix of
> sorts.  Should the commit message should cover it?

Yeah, I can add that.

> [qemu_action_opts]
> should not use QemuOpts at all.  Use of qmp_marshal_FOO() is an
> anti-pattern.  Needs cleanup.  Not in this patch, and probably not even
> in this series.

--verbose needed.  Why is it an anti-pattern?  I found it a clever way 
to avoid code duplication. :)  Doesn't matter for this series, anyway.

>> command line is considered.  With this patch we just forbid id
>> on merge-lists QemuOptsLists; if the command line still works,
>> it has the same semantics as before.
> 
> It can break working (if weird) command lines, such as ones relying on
> "merge ignoring ID" behavior of -name, -icount, -action.  Okay.

Right, I wrote that down as a feature.  The important thing is keeping 
things the same if they still work.

> [If !lists->merge_lists], if id= is specified, it must be unique,
> i.e. no prior opts with the same id.
> 
> Else, we don't check for prior opts without id.
> 
> There's at most one opts with a certain id, but there could be any
> number without id.  Is this what we want?

Yes, positively.  Example: "qemu-system-x86_64 -device foo -device bar".

>> Discounting the case that aborts as it's not user-controlled (it's
>> "just" a matter of inspecting qemu_opts_create callers), the paths
>> through qemu_opts_create can be summarized as:
>>
>> - merge_lists = true: singleton opts with NULL id; non-NULL id fails
>>
>> - merge_lists = false: always return new opts; non-NULL id fails if dup
> 
> This renders the qemu_opts_foreach() silly.  Cleanup is in order, not
> necessarily in this patch.

Agreed.  This one is already tricky enough (though I like the outcome).

Paolo


