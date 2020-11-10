Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE442AD402
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:44:55 +0100 (CET)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcR8w-0007sS-HL
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcR78-0006vO-Il
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcR76-0002fj-3m
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605004978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvMlj36kArw9OoBbcDHVnXLRb2pSuFgMAiRI7Q2/Xzs=;
 b=ZVptz2MAlGu/TZADqfClOYXF//QkXPzfKkNlESdwQ4ILjImlsmc/P0/8GMfFioopNbM6tx
 Mpmmwb2tnUULZoSDI82nXADIfUQLrK0oALnpy1uKtkPhNTRqC0G0q8jIvnKxuUgg2ISXv6
 6TmhSZqRJ+nV1exVB04peWdwLGrEEKo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-vz4n0fZGOOqGTPNl6nQnMA-1; Tue, 10 Nov 2020 05:42:54 -0500
X-MC-Unique: vz4n0fZGOOqGTPNl6nQnMA-1
Received: by mail-ej1-f71.google.com with SMTP id 27so4540333ejy.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gvMlj36kArw9OoBbcDHVnXLRb2pSuFgMAiRI7Q2/Xzs=;
 b=eq68sLVJeAOS95nQPS1C0KkO3Z1SyRnEBgP7PbDUJz8r+4YWJ+QO5hhmb8Lr/8UxRi
 OW+zprKc0WtzHghd7c8/00YG6f4L1LS+0MUORwD/YT8gxjivUXJUaMp7M2clOqqOay6r
 IpsonfSTqqvH1TkIM8yWa8dtfcIIe1zXIsTfBOVwgSCPwPSqzMYDAVU3xK+l199eHOxs
 5DF2PMRqlVH5i4dycH+07M+c+KCWvhiW/Bl/hPXZVBFtkiddLhMjOa8pAfiy9Idj/tqS
 X0bbmzkAcPgXbNxJMMfNl0FLFwqt2slEnDNK0TFue4v+GyK8ymYSKMD6Wj47A2+WCL9J
 DfTQ==
X-Gm-Message-State: AOAM532aO0RAVnFHlQSGZIYF6MARwh7sRfSQyJrRhdfC1ncu8x9yybdV
 La6B4pMBtcF+0hmS1TsYzx14akaFcDOoEgFk97gRzPbSfGN7IOwJZTdvcJs2W+2AyKDL30U3Fd3
 yLewSfgirZBmxosI=
X-Received: by 2002:a17:906:1c84:: with SMTP id
 g4mr20527083ejh.155.1605004973733; 
 Tue, 10 Nov 2020 02:42:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8YTDzMveYxV9KXw3NfuG2wmeSuO8jlEhH3MTPHaG0CNRx8EWbxxq3Wm8LJihbleLNUF9C1Q==
X-Received: by 2002:a17:906:1c84:: with SMTP id
 g4mr20527061ejh.155.1605004973504; 
 Tue, 10 Nov 2020 02:42:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b6sm10841527edu.21.2020.11.10.02.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:42:52 -0800 (PST)
Subject: Re: [RFC v1 07/10] i386: move TCG cpu class initialization out of
 helper.c
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-8-cfontana@suse.de>
 <3855be8b-0488-4fb3-f794-cab91382cc28@redhat.com>
 <2dbed61d-b4be-aedf-fe62-f97b72308927@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d7b1571f-ebf4-e1c8-f5b3-a159e43df3dc@redhat.com>
Date: Tue, 10 Nov 2020 11:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2dbed61d-b4be-aedf-fe62-f97b72308927@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 11:05, Claudio Fontana wrote:
>> Up to this patch I think it's a no brainer, modulo the bikeshedding on
>> paths.
>>
>> Paolo
>>
>>
> Ok, the paths: I kinda liked the symmetry between:
> 
> $(top_srcdir)/accel/kvm
> $(top_srcdir)/target/i386/accel/kvm
> 
> but yeah, minor think that can be dropped if necessary.

You can instead mirror hw/i386/kvm/. :)

Paolo


