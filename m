Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE1367271
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:23:21 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHVQ-0003rr-DS
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSc-0002Kq-IZ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSY-0003ST-5i
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF8pwH1AoPgZwETv8LalqZeU7/O3wZDY5gSB4UfxAdY=;
 b=gwbTJ7QXUduK3jQDHfkO2SpHC4rCHwDoPp58fkwNkZ0Ub9mZBhOhFYxgsjptlY7UJOdFG/
 BWkSEyNsg8Bb385ZquLVPZvzQilggPM7+PY5fKw8b3EoilJIHFFt3BYuW7CmNOd3gYemIl
 6EJAeXAAK6JnTnmZbKx5ATE4IgTEw8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-08zjRR1aPHaZ0_GMZkRZ0w-1; Wed, 21 Apr 2021 14:20:17 -0400
X-MC-Unique: 08zjRR1aPHaZ0_GMZkRZ0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540A184B9A1;
 Wed, 21 Apr 2021 18:20:16 +0000 (UTC)
Received: from [10.10.118.152] (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83E515C1B4;
 Wed, 21 Apr 2021 18:20:15 +0000 (UTC)
Subject: Re: [PATCH v4 16/19] qapi/expr.py: Add docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-17-jsnow@redhat.com>
 <871rbckiuf.fsf@dusky.pond.sub.org>
 <f958a02d-7c14-f6ee-4337-fc85ef567ee5@redhat.com>
 <878s5hyrqa.fsf@dusky.pond.sub.org>
 <6778db51-f0da-a4cd-079d-b577954acb75@redhat.com>
 <87y2db20za.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9e47e216-a4d4-841e-872a-96944230ad7e@redhat.com>
Date: Wed, 21 Apr 2021 14:20:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2db20za.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 9:58 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> [...]
>> I've made a re-spin. Let's try something new, if you don't mind:
>>
>> I've pushed a "almost v5" copy onto my gitlab, where edits made against
>> this patch are in their own commit so that all of the pending edits I've
>> made are easily visible.
>>
>> Here's the "merge request", which I made against my own fork of master:
>> https://gitlab.com/jsnow/qemu/-/merge_requests/1/diffs
>>
>> (It's marked "WIP", so there's no risk of me accidentally merging it --
>> and if I did, it would be to my own "master" branch, so no worries about
>> us goofing this up.)
>>
>> If you click "Commits (21)" at the top, underneath "WIP:
>> python-qapi-cleanup-pt3", you can see the list of commits in the re-spin.
>>
>> (Four of these commits are the DO-NOT-MERGE ones I carry around as a
>> testing pre-requisite.)
>>
>>   From here, you can see the "[RFC] docstring diff" patch which shows all
>> the edits I've made so far based on your feedback and my tinkering.
>>
>> https://gitlab.com/jsnow/qemu/-/merge_requests/1/diffs?commit_id=3f0e9fb71304edb381ce3b9bf0ff08624fb277bc
>>
>> I invite you to leave feedback here on this view (and anywhere else in
>> the series that still needs adjusting, if you are so willing to humor
>> me) by highlighting the line and clicking the comment box icon on the
>> left. If you left-click and drag the comment box, you can target a range
>> of lines.
>>
>> (You can even propose a diff directly using this method, which allows me
>> to just accept your proposal directly.)
>>
>> If you leave any comments here, I can resolve each individual nugget of
>> feedback by clicking "Resolve Thread" in my view, which will help me
>> keep track of which items I believe I have addressed and which items I
>> have not. This will help me make sure I don't miss any of your feedback,
>> and it helps me keep track of what edits I've made for the next changelog.
>>
>> Willing to try it out?
>>
>> Once we're both happy with it, I will send it back to the list for final
>> assessment using our traditional process. Anyone else who wants to come
>> comment on the gitlab draft is of course more than welcome to.
> 
> I have only a few minor remarks, and I'm too lazy to create a gitlab
> account just for them.
> 

(You'll need one eventually, I think. There was talk of requiring 
maintainers all to have one in order to run CI by submitting a MR on the 
main repo as an alternative PR workflow up to Peter Maydell to reduce CI 
hours.

Humor me and make one? I really would like to try it out. Maybe for part 
5? I want to see if it helps me be more organized when making a large 
number of edits, and I think it might help me implement more of your 
suggestions. At least, that's how I'm selling it!)

> * Commit 3f0e9fb713 qapi/expr: [RFC] docstring diff
> 
>    - You mixed up check_name_lower() and check_name_camel()
> 

@_@ oops. Too many nearly identical code regions. Thanks.

>    - Nitpick: check_defn_name_str() has inconsistent function name
>      markup.
> 

Good spot. It doesn't matter to sphinx, but you expressed a preference 
for seeing the empty parens to help intuit the type of symbol being 
referenced when reading the plaintext and I agree.

>    - I'd like to suggest a tweak of check_defn_name_str() :param meta:
> 

Sounds good, thanks! Anything that makes "type" less ambiguous is 
graciously welcome.

>    That's all.  Converged quickly.  Nice!  Incremental diff appended.
> 
> * Old "[PATCH v4 17/19] qapi/expr.py: Use tuples instead of lists for
>    static data" is gone.  I think this leaves commit 913e3fd6f8's "Later
>    patches will make use of that" dangling.  Let's not drop old PATCH 17.
>    Put it right after 913e3fd6f8 if that's trivial.  If not, put it
>    wherever it creates the least work for you.
> 

OK, I can un-plunk it.

> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index f2bb92ab79..5c9060cb1b 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -124,7 +124,7 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>                        permit_upper: bool = False,
>                        permit_underscore: bool = False) -> None:
>       """
> -    Ensure that ``name`` is a valid user defined type name.
> +    Ensure that ``name`` is a valid command or member name.
>   
>       This means it must be a valid QAPI name as checked by
>       `check_name_str()`, but where the stem prohibits uppercase
> @@ -147,7 +147,7 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>   
>   def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
>       """
> -    Ensure that ``name`` is a valid command or member name.
> +    Ensure that ``name`` is a valid user-defined type name.
>   
>       This means it must be a valid QAPI name as checked by
>       `check_name_str()`, but where the stem must be in CamelCase.
> @@ -168,14 +168,14 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
>       Ensure that ``name`` is a valid definition name.
>   
>       Based on the value of ``meta``, this means that:
> -      - 'event' names adhere to `check_name_upper`.
> -      - 'command' names adhere to `check_name_lower`.
> +      - 'event' names adhere to `check_name_upper()`.
> +      - 'command' names adhere to `check_name_lower()`.
>         - Else, meta is a type, and must pass `check_name_camel()`.
>           These names must not end with ``Kind`` nor ``List``.
>   
>       :param name: Name to check.
>       :param info: QAPI schema source file information.
> -    :param meta: Type name of the QAPI expression.
> +    :param meta: Meta-type name of the QAPI expression.
>   
>       :raise QAPISemError: When ``name`` fails validation.
>       """
> 

Thanks! The list of fixes this time was indeed short enough to keep 
track of the old way :)

Re-pushing without the "pt0" pre-req to my gitlab for CI reasons, and 
sending a proper V5 to the list.

--js

For giggles, I updated that "merge request" also so I could see how it 
tracks patchset diffs and changelogs and stuff. Or, rather, it's the 
case that by force-pushing to the same branch to run CI, it 
automatically creates a new "version" of the MR, but I did have to 
update the "cover letter" myself. You can see what that looks like at 
https://gitlab.com/jsnow/qemu/-/merge_requests/1


