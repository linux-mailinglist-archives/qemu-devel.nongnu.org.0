Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C42AB78E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:53:25 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc5jf-0006W3-W1
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kc5hm-00064f-N2
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kc5hk-0005Ic-2J
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604922681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBuokcFnB1VIhKn2ynIs5x3Y84iRO4ASAeW3vCUPNOI=;
 b=a8sCzyzl83aHMw8CaYF4sEUqhQ3ZVQKL6FuaYFx+XbzndINQWNcAtUOxHX9DIZobq79q0O
 ZQmIcHDdlYqn7WjSSe+/rrZ4SlBnTmpCeSP0YarB2+68R23bATHFUd8tmD+MzUWEBPfoL1
 TL1/ovlg+N06tlwVoChGu6NMJo1HNe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33--EymspudM3SUqJA3WciaUg-1; Mon, 09 Nov 2020 06:51:20 -0500
X-MC-Unique: -EymspudM3SUqJA3WciaUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337568030CC;
 Mon,  9 Nov 2020 11:51:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69795C22B;
 Mon,  9 Nov 2020 11:51:17 +0000 (UTC)
Subject: Re: [PATCH 1/2] tests/9pfs: fix test dir for parallel tests
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <cover.1604046404.git.qemu_oss@crudebyte.com>
 <73a2acc5ca29f95d6d2e5ce60ec69c62bd55f637.1604046404.git.qemu_oss@crudebyte.com>
 <20201030123214.50806454@bahia.lan>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <aff54ce4-58d3-da85-b466-0332aa601384@redhat.com>
Date: Mon, 9 Nov 2020 12:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201030123214.50806454@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/2020 12.32, Greg Kurz wrote:
> On Fri, 30 Oct 2020 09:19:46 +0100
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
[...]
>> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
>> index d43647b3b7..6b22fa0e9a 100644
>> --- a/tests/qtest/libqos/virtio-9p.c
>> +++ b/tests/qtest/libqos/virtio-9p.c
>> @@ -35,7 +35,12 @@ static char *concat_path(const char* a, const char* b)
>>  static void init_local_test_path(void)
>>  {
>>      char *pwd = g_get_current_dir();
>> -    local_test_path = concat_path(pwd, "qtest-9p-local");
>> +    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
>> +    local_test_path = mkdtemp(template);
>> +    if (!local_test_path) {
>> +        g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
> 
> Just per curiosity, is there a preferred way to output error messages ?

I don't think that we've ever agreed on a common way here... but as far as I
can see, most tests rather use fprintf(stderr, ...) for error messages,
while g_test_message() is rather for normal log messages?

 Thomas


