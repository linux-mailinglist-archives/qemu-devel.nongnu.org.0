Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C472430F5BC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:04:32 +0100 (CET)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gBL-0003n5-OT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7g94-0002MW-MA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7g93-0002Ed-1Q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xY/jssD5lYkxn24kAZLXbRuJaj/j9B8Dt8qWSnWzADM=;
 b=KHdFBvbNAZUQEQGsG1vpIa33EvPijkAvyYXe1AxOFfvfwF69I/Nfb3szeUWrXcWIfwftHk
 dNwP2HKhfRcL/whFfD36jK44ref1qns6G8KfBsTw7dxXhQV4laWTu4rFnuj93KR7hbjrPI
 3ZpvSgFjNQ+9isObCr5GAAFWfdGsaug=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-_EQSVFzYOkyXwMkbxWFRLw-1; Thu, 04 Feb 2021 10:02:04 -0500
X-MC-Unique: _EQSVFzYOkyXwMkbxWFRLw-1
Received: by mail-ej1-f70.google.com with SMTP id ia14so2698386ejc.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xY/jssD5lYkxn24kAZLXbRuJaj/j9B8Dt8qWSnWzADM=;
 b=Zksp97oy7JJhBHRxUCZcTFwPxQ1oBPML4E7+Wk4T/oqP6uX+knVqK+DppcSpbxGTJe
 OEPNCK2HBGgh1ZQQp9B0m8BTIDUz/HreWvif7WMH/RJVDArLo0UqdGbEzQlUr11b4JG6
 ohwCPs8wo+7zvr5RJO43B25uYHBJmpKwCuQhXn832RAKUK3YdAsEiIMXiIu+h3T8MUEh
 cnmuu1dhPC797T36nD/lvBoXtbDAt8WU3jgQGE1OkUx0aC61AUjUfJHdGVzm9MEMTed0
 Dx7V8a2jAQHHLmZlqAhbyIIgCcA7c35xLPQ9FEbOYBuJD0FkAovtqdTVk2mhD2M90gj2
 m9Lg==
X-Gm-Message-State: AOAM530dur8RM8VEto3KWKRlzoQ7Oiui74WNM0Sl0TMZUZQvZYd8cdAC
 7cw9cL6nXri/VAlqFzuArfLCMDnBVCDlMJXaTB8kWFhsl48uHE1GKvJE7DWCR+HyM7eTCbYcCoE
 uSpkpSn77T6m7EzU=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr8275200edb.240.1612450923566; 
 Thu, 04 Feb 2021 07:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXIPtyuvpTgNRw8z6c9SviMPEUXlXW7VMFt623SNFobO1VIvM9QAPzESWbLcITcg1AY5vP/g==
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr8275185edb.240.1612450923360; 
 Thu, 04 Feb 2021 07:02:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm9sm2609837ejb.14.2021.02.04.07.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 07:02:02 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box> <20210204144700.GN549438@redhat.com>
 <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
Message-ID: <6339c78f-e77c-85e7-8e3f-6c2c514f3206@redhat.com>
Date: Thu, 4 Feb 2021 16:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 15:50, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 14:47, Daniel P. Berrangé <berrange@redhat.com> wrote:
>> The distinction of contrib/ vs tools/ is supposed to be more a
>> reflection on the quality of the program.
>>
>> contrib/ should be considered demo-ware, no back compat guaranteed,
>> may or may not work, no testing guaranteed, no man pages.
> 
> On this definition, why do we have any of it in our source tree?
> Interesting but unmaintained side things can live quite happily
> elsewhere (other peoples' git forks, blog posts, whatever).
> If we care about a bit of code enough to keep it in our source
> tree we ought to care about it enough to properly document
> and test it and give it a suitable place to live.

That's indeed what happened with libvhost-user; it has graduated to a 
separate project since it is okay for use in other (production-ready) 
vhost-user backends.

Most of the software in contrib/ is essentially a reference 
implementations.  They are "perfect" for that task, but not meant to 
grow more features or to be used in production (compare vhost-user-blk 
with qemu-storage-daemon for example).

The other four can be classified as follows:

- elf2dmp and rdmacm-mux should be in tools/, probably it's in contrib/ 
because nobody uses it and there's no tests so it might bitrot.

- systemd is just a couple files meant for distros to pick up, possibly 
with customizations.  gitdm is just for people who want to get QEMU 
development stats, so I suppose these two are in the same group as well.

Paolo


