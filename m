Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E542FD04C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:52:19 +0100 (CET)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2CyA-000301-10
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Cwr-00022D-9E
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Cwp-0007n4-M4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611147053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wiZcY3ZJ/jM3eUpZnkmg8l4HaMC1TLSYqKnwEfAz0C8=;
 b=Vw6b+ZxLA7EbhhhmM3n+AQQRzqOpgD5cq/W5lXQ/xkSshNcHSTM7pr75t9bZMdZmd9JrV4
 0zyZ/k6MAyxmuhDCZdIkEJwE9vqDbdxfpbmg41FD9Ccp2FhuPy8WXuH4c02YWUPcouGIhj
 3zZH8rBXLqWmVMlpkVmg1by+rFfM5t0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-A0pNtvSFP3-R6F4t4pIkzg-1; Wed, 20 Jan 2021 07:50:51 -0500
X-MC-Unique: A0pNtvSFP3-R6F4t4pIkzg-1
Received: by mail-ed1-f69.google.com with SMTP id e25so2510807edq.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=wiZcY3ZJ/jM3eUpZnkmg8l4HaMC1TLSYqKnwEfAz0C8=;
 b=iv8UQD5K32MAQ9k6fSYxuuTmRqPjlqVXn51uvMMnR3hQ1ofb8ggPKqXJHQGX3J+NfW
 SXnVDjOy6S17Um6uxAU6NsLIdaBcsz3KOFWTkCdbrWCC12qkzlPbL03RgtUCku1hXXxL
 4077kaRjPn4fnNPXXSAgr2mijKKXykK8OPF5GlGwnaKtqJF77cPZFDdErQppMt5/rhTr
 ulc63f3iF7+XzjmXq0Vf9AdVAGfrOFgpgWPOZ4gKigaxNB+Ur4sa81qZ46zdykRBfwjy
 OUufDN+3KoxNgqZz1VeqlsdIaVb6qRcI7zO5Nzbu6yex723vl9NjFiGU1qmkPm9wZgMU
 /FyA==
X-Gm-Message-State: AOAM533BBzZxw+yXRNH9ZrKJA1px5/wKx++x1+jQWtS66jhI1fq7ojwH
 obbjXAhAGBf2OI2+GoX1O0+oMhgj4oLHgA/NZnCJoQieAikTZvOkbRNOJwWMAxsD/eFf5myvJ3G
 OxpnyIRbbgXmPaNqBk03ObwFWAuDtOvIXhLCPL4Be5K6dSXtZCXVwscdvJWuNxe6f
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr7362174edc.186.1611147050456; 
 Wed, 20 Jan 2021 04:50:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCJf9DzcMHI4fCMYawz29fu3kXr4lqOiUCCepc2khmuUnehf7j1vhkbvM+4QE1Vt3W9cl4Pg==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr7362159edc.186.1611147050270; 
 Wed, 20 Jan 2021 04:50:50 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o11sm1094491eds.19.2021.01.20.04.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 04:50:49 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: How to run crypto benchmarks tests?
Message-ID: <c72a38ac-d164-9357-4eda-2334c496c555@redhat.com>
Date: Wed, 20 Jan 2021 13:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Using the following "build tools and doc" config:

../configure --disable-system --disable-user
                                 ...
                     TLS priority: "NORMAL"
                   GNUTLS support: YES
                        libgcrypt: NO
                           nettle: YES
                              XTS: YES
                         libtasn1: YES
                              PAM: YES
                                 ...

$ make check-help
...
 make check-speed          Run qobject speed tests
...
Test targets:
  check                          - Run all tests (check-help for details)
  bench                          - Run all benchmarks
  docker                         - Help about targets running tests
inside containers

$ make check-speed
make: *** No rule to make target 'bench-speed', needed by 'check-speed'.
 Stop.
$ make bench-speed
make: *** No rule to make target 'bench-speed'.  Stop.
$ make check-bench
make: *** No rule to make target 'check-bench'.  Stop.
$ make bench
make: Nothing to be done for 'bench'.

I want to run these tests:

$ ls -1 tests/test-crypto-*c
tests/test-crypto-afsplit.c
tests/test-crypto-block.c
tests/test-crypto-cipher.c
tests/test-crypto-hash.c
tests/test-crypto-hmac.c
tests/test-crypto-ivgen.c
tests/test-crypto-pbkdf.c
tests/test-crypto-secret.c
tests/test-crypto-tlscredsx509.c
tests/test-crypto-tlssession.c
tests/test-crypto-xts.c

What am I doing wrong? IIRC "make check-speed" used to work,
maybe something went wrong in commit 9ed7247a596
("meson: convert the speed tests")?

Thanks,

Phil.


