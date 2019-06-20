Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61124CA5D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:10:56 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdt5q-0000ZK-Aj
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hdsjE-0007SI-JG
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hdsZX-00009J-9p
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:37:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42541)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hdsZX-00008m-35
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:37:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so2058900wrl.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icMDHJml4YzNC2+uMQPTyHMHzAQGuNXRDvXQiyxryo4=;
 b=gaYF1vmT6vHvxLgZw3Aa2OfOFmMEWMSbqDkrj/EM6vRv6MXAY5V8Lglgb6AZGDzvZk
 SmSUjPSYkKujh4PsWjZiv8QWtpjGEb6QSx2RVH7pfWbpbASJ0X3VJD/cJ8d/x6eKcKVT
 s0tXaOD2Y5nyVMXOQS2SgzgMrpdz3PkocfaEzW64wqiNewJHxw6xuZay5raoEfqayHGT
 GwVRao10RAGPYrWFQvTiFZCVB4eNdA0Sze6PjMbjLirovLZdWqZYWGIdfDvZv9P3Yu8N
 aIO47IGtzjvFn28uThTJNJ/C5pFjWbmj2EZU1+HiN/SzcdjFyCBh33HRYaA6QJY3RK8d
 YOgQ==
X-Gm-Message-State: APjAAAUu+Y/r7Cnsh5e88qNgFJm+e299BmGgIOY9aNeD1z8vmPe+Indp
 5bGGsk6ElxGfQHBYRXgJYf/YGg==
X-Google-Smtp-Source: APXvYqwdFvmhkOrT2UksJKAm8rN3pkMsvsfh368tDHeYshk1gk8WpjRmdZK8c82iJRJmPia2Asc/Fg==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr30107683wrj.51.1561019849912; 
 Thu, 20 Jun 2019 01:37:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7822:aa18:a9d8:39ab?
 ([2001:b07:6468:f312:7822:aa18:a9d8:39ab])
 by smtp.gmail.com with ESMTPSA id d4sm17877488wra.38.2019.06.20.01.37.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 01:37:29 -0700 (PDT)
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-2-armbru@redhat.com>
 <e0595422-c115-ca7f-9e3c-cfb69602d5e2@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <faad4d88-cd53-cd77-390d-088fc51d0f9c@redhat.com>
Date: Thu, 20 Jun 2019 10:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e0595422-c115-ca7f-9e3c-cfb69602d5e2@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH 01/17] MAINTAINERS: new maintainers for QOM
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
Cc: kwolf@redhat.com, "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/06/19 22:31, Andreas Färber wrote:
> Am 19.06.19 um 22:10 schrieb Markus Armbruster:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> QOM is not a particularly active subsystem now: 51 commits in two years.
>> But, we need active maintainers to review and merge patches, and Git
>> shows the following top committers taking on QOM:
>>
>>     Markus Armbruster <armbru@redhat.com>
>>     Eduardo Habkost <ehabkost@redhat.com>
>>     Paolo Bonzini <pbonzini@redhat.com>
>>     Marc-André Lureau <marcandre.lureau@redhat.com>
>>     Eric Blake <eblake@redhat.com>
>>
>> I volunteer myself, and also volunteer Eduardo and Daniel as reviewers
>> since they understand the code well.
>>
>> Cc: Andreas Färber <afaerber@suse.de>
>> Cc: Daniel P. Berrange <berrange@redhat.com>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Message-Id: <20190607113737.13473-1-pbonzini@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> I'm pretty sure I gave an Acked-by that's missing above?

Yes, and Markus even replied to it:

https://patchew.org/QEMU/20190607113737.13473-1-pbonzini@redhat.com/

Paolo


