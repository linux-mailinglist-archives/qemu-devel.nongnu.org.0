Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59D341D1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 10:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY4q5-0006LH-0B
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 04:30:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY4oa-0005f9-Ej
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY4oZ-0005Zw-KM
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:29:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hY4oZ-0005Xs-Dm
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:29:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id v22so13729212wml.1
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 01:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L5bqbG5HeCipJkmbOGScph3N/xxSyKFrQkKFnfq3AlI=;
	b=pOEU8Bw/OZ/uyILMQiKiT1eDA4Epx2I8Nah64p4BmUu9LKMqI3nVWi3KaySpkq6H6j
	8AWtUwbPna0uD+gLjCzXiwfioyRdJEQWoM1w9XfKpqvOQaxv8wA+5sPwWrAFGx9VCykU
	/zgn5rTiUOIz5IpYzFmgh5DoTRYHCxRN1qizPbP+nE6b4DXKgxr3Nfkd0oU/tTBi7yOU
	EK11CYS0hVx6+I3geaLaPu1YvxvKvBkHOiKY3xhGdUEfbjDwtysz0MB2a7nn4guMS+Ya
	YP6oYtJ9NIF8Vz07+OBIrLjN2uZCPnQXa+gKu3o8mzwEob69PLnvBg2CVe1vN4T2vXV4
	/g7Q==
X-Gm-Message-State: APjAAAX4eQO5p8AL9gO7f3to/P/Z62320WuwZQD/Dc7WG83Hh7zYeNFp
	AbdLd8mGTJiuydvQlTYmMda9XQ==
X-Google-Smtp-Source: APXvYqw6eOFNQ02/QmPrYOFzUMkfFNexue2mmo1sNA7etUUuz7/GuYpab3ldfhVChSbDmBqh50hoVg==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr16924671wmc.40.1559636938292; 
	Tue, 04 Jun 2019 01:28:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:657f:501:149f:5617?
	([2001:b07:6468:f312:657f:501:149f:5617])
	by smtp.gmail.com with ESMTPSA id
	q15sm12676440wrr.19.2019.06.04.01.28.57
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 01:28:57 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190604080010.23186-1-armbru@redhat.com>
	<ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <803fdb35-f28e-c033-b5ac-02d230dacf94@redhat.com>
Date: Tue, 4 Jun 2019 10:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH] test: Fix make target check-report.tap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/19 10:09, Philippe Mathieu-Daudé wrote:
>>  check-report.tap: $(patsubst %,check-report-qtest-%.tap, $(QTEST_TARGETS)) check-report-unit.tap
>> -	$(call quiet-command,./scripts/tap-merge.py $^ > $@,"GEN","$@")
>> +	$(call quiet-command, cat $^ | scripts/tap-merge.pl >$@,"GEN","$@")
> Paolo, did you intend to submit a new tap-merge.py script in commit
> 9df43317b82?
> 

No, it's really just y vs l.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org

Paolo

