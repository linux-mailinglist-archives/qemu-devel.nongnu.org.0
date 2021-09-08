Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9684033F3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:55:02 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqY2-0007Fi-1n
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNqWf-0006R9-Rb
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNqWe-00034g-48
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjYYIASgk6ylk1MWCKo8yh6U0TJvBaulzxRoFhnTUQQ=;
 b=SGSXWn0maLkknRVWeXNeWYFL7V7FrK2f7kzF5kiwPPA9Z+3PGDT6J7y+aRXjz/wGuJy/xY
 hEvEbX5kRdcvkrbHRcv2+9UeVIAmPin1GAoLGvqKE44N7WUxySKUARZK+fjuX6io/t+Eb/
 5ahMQ3W//LN1Y/q0FPg7UXUqhDKIdQ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-dz18BNgEP2O2EmoL5wLS4Q-1; Wed, 08 Sep 2021 01:53:30 -0400
X-MC-Unique: dz18BNgEP2O2EmoL5wLS4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c203-20020a1c9ad4000000b002f8cba155ccso555698wme.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MjYYIASgk6ylk1MWCKo8yh6U0TJvBaulzxRoFhnTUQQ=;
 b=pV9LHC5/ZpNwSmn29i98Qc0mwEi6X2XAKbP6OTuZJkCzedBcMnMH/9mOatMvtdFFvH
 N2wRHiGbFNrO5O+JBpZgPTHHXy050X2UrN42Htljqoa5f1d94e8J1kHzYmvaR9LdyIbT
 j4/kYZk/eiahTydsid+vDSvSgm+B4RGK6m4OjjAq5J4BipX/TvUTloSDCIdcS0NzJns1
 lPo2a9CcsaBkN2I7ZCYvrTVHAXkCpbI2bg6nUttGc0s1HX4oFPSpnqxZaWg2I49Sudvp
 DwpRjUfVJCl/XUPBlAoHtvrauvyQxa+wVNzOmHyn24pAsWkgkOwKNCuVJGgsvYELHdE5
 Smog==
X-Gm-Message-State: AOAM532EvW7aAb6yVM3TfK27wsEnRdTsEmwbTs2zlCmsm2HpfxFowFCC
 5gASeHBdD7W/zV4aZD8uDn1tstpBrnqh8qAqUZyNWgdwDnH+jEPHkbBDXkds6QH3qEpJXZdehjv
 YhpiI7WgDBTMkKZw=
X-Received: by 2002:adf:e606:: with SMTP id p6mr1902525wrm.231.1631080409786; 
 Tue, 07 Sep 2021 22:53:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEy/SjaqsBok7XCLIjk2zEcfTZk4nynNamCcrG9aONdVlGbXLTUnkt5dUpqSC7yCMOBbRvRw==
X-Received: by 2002:adf:e606:: with SMTP id p6mr1902512wrm.231.1631080409583; 
 Tue, 07 Sep 2021 22:53:29 -0700 (PDT)
Received: from thuth.remote.csb (pd95752bf.dip0.t-ipconnect.de.
 [217.87.82.191])
 by smtp.gmail.com with ESMTPSA id 19sm1003726wmo.39.2021.09.07.22.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 22:53:29 -0700 (PDT)
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210907110841.3341786-1-alxndr@bu.edu>
 <8995d50d-dbd5-c37c-6bd0-477e2f58d1aa@redhat.com>
 <20210907125108.44h7vpprunbb7yy4@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97821a92-b067-7527-c1ec-5b1469fcab58@redhat.com>
Date: Wed, 8 Sep 2021 07:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210907125108.44h7vpprunbb7yy4@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2021 14.51, Alexander Bulekov wrote:
> On 210907 1432, Thomas Huth wrote:
>> On 07/09/2021 13.08, Alexander Bulekov wrote:
>>> /src/build.sh: line 76: GITLAB_CI: unbound variable
>>> Fix that.
>>>
>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>> ---
>>>
>>> This change is in preparation to revert:
>>> 7602748c ("qemu: manually build glib (#5919)") on OSS-Fuzz.
>>> Reverting as-is produces an unbound variable complaint when we try to
>>> build the fuzzers in the OSS-Fuzz container.
>>>
>>>    scripts/oss-fuzz/build.sh | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
>>> index 98b56e0521..5ddc769c9c 100755
>>> --- a/scripts/oss-fuzz/build.sh
>>> +++ b/scripts/oss-fuzz/build.sh
>>> @@ -73,7 +73,7 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
>>>              "\nFor example: CC=clang CXX=clang++ $0"
>>>    fi
>>> -if [ "$GITLAB_CI" != "true" ]; then
>>> +if [ -z ${GITLAB_CI+x} ]; then
>>
>> My bash-foo is really not the best, but shouldn't there be a colon in there,
>> i.e. ${GITLAB_CI:+x} ?
> 
> I think the difference is that GITLAB_CI+x only checks if GITLAB_CI is
> set, while GITLAB_CI:+x checks that it is set and non-null.
> https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
> 
> I don't think that makes much of a difference here.

TIL, and I agree that it does not make a difference here (and if it would, 
your variant is certainly better).

Reviewed-by: Thomas Huth <thuth@redhat.com>


