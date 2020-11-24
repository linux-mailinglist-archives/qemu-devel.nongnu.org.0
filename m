Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9D2C1F2D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:56:43 +0100 (CET)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khTBq-0003IC-2f
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khTA2-0002kf-SL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khTA0-000777-9E
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606204486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHQ+RPbLZWKYKtoGTLeAABZ4kWADp49n/lQrsr0ItNs=;
 b=Uy/A3i2iz7HcuZQc7d/dEwcHM4+sR3oGh5zbwFlZ+3jIqG7ZDLRmuKQKbCbDcbgHw5Z317
 YHVl/b9yAioGMdW7/PIrHjFed5eNnj6QkGX29FhGu5G3oewGQE6UgFJ7TSbgFoyF7Nkxtr
 Q1KIaK66J/odm5yGzvpuV6VLgaul8UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-7bLPPbuRObqsD3pQG--9nw-1; Tue, 24 Nov 2020 02:54:41 -0500
X-MC-Unique: 7bLPPbuRObqsD3pQG--9nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B5D18C89CE;
 Tue, 24 Nov 2020 07:54:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-215.ams2.redhat.com [10.36.113.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 160DA60864;
 Tue, 24 Nov 2020 07:54:38 +0000 (UTC)
Subject: Re: [PATCH v2 for-5.2] tests/9pfs: Mark "local" tests as "slow"
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8f6b304b-1a7c-e16d-c413-170605599347@redhat.com>
Date: Tue, 24 Nov 2020 08:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/2020 08.43, Greg Kurz wrote:
> The "local" tests can fail on some automated build systems as
> reported here:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html
> 
> This will need to be investigated and addressed later. Let's go for a
> workaround in the meantime : mark the "local" tests as "slow" so that
> they aren't executed with a simple "make check" like in the case above.
> 
> Reported-by: Cole Robinson <crobinso@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - less noisy patch
> ---
>  tests/qtest/virtio-9p-test.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 21e340fa5f43..92a498f24925 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1456,6 +1456,15 @@ static void register_virtio_9p_test(void)
>  
>  
>      /* 9pfs test cases using the 'local' filesystem driver */
> +
> +    /*
> +     * XXX: Until we are sure that these tests can run everywhere,
> +     * keep them as "slow" so that they aren't run with "make check".
> +     */
> +    if (!g_test_slow()) {
> +        return;
> +    }
> +
>      opts.before = assign_9p_local_driver;
>      qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
>      qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);

Reviewed-by: Thomas Huth <thuth@redhat.com>

I assume you'll take this via the 9p tree? I don't have any other qtest
patches pending right now, so I did not plan to send another pull request
today...


