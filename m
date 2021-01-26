Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31D3045CF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:58:49 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Sc3-0007ak-56
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4Sa1-0006e1-2i
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4SZx-0005Gh-84
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611683796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OZkC4ITzOfhARFAmObI1CIjRqQMGB5e7dLDblyFpug=;
 b=Rt7i5HMzicJd7ZnLHwGSvPlVojgPsfhYqmCCm4wWSc4/cfir7QlIavHa9NlZK64SPRt3Or
 3LrhqpuveImEGcFpdThFUKqcEYdvhrJVoicCPronzwU57oJoPiNJKhC+boF6sAshgZq8PB
 PsZ+lh9ZMM7j5uC0DaaNSfwXkB7tnt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-fmFSZm7ZO9O1a7hH3md7uQ-1; Tue, 26 Jan 2021 12:56:32 -0500
X-MC-Unique: fmFSZm7ZO9O1a7hH3md7uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B34C180A093;
 Tue, 26 Jan 2021 17:56:31 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C395C3E4;
 Tue, 26 Jan 2021 17:56:27 +0000 (UTC)
Subject: Re: [PATCH v2 3/2] MAINTAINERS: Cover fuzzer reproducer tests within
 'Device Fuzzing'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210126111638.3141780-1-philmd@redhat.com>
 <20210126112849.3145695-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6958c1f5-e561-05b3-60aa-909a60e19470@redhat.com>
Date: Tue, 26 Jan 2021 18:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126112849.3145695-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Li Qiang <liq3ea@163.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 12.28, Philippe Mathieu-Daudé wrote:
> When we started to commit the fuzzer QTest reproducers to
> fuzz-test.c in commit d8dd1095019 ("qtest: add fuzz test case"),
> we forgot to add the corresponding MAINTAINERS entry. Do it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e275c81fd49..1b88753b325 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2571,6 +2571,7 @@ R: Stefan Hajnoczi <stefanha@redhat.com>
>   R: Thomas Huth <thuth@redhat.com>
>   S: Maintained
>   F: tests/qtest/fuzz/
> +F: tests/qtest/fuzz-*test.c
>   F: scripts/oss-fuzz/
>   F: docs/devel/fuzzing.rst

Reviewed-by: Thomas Huth <thuth@redhat.com>


