Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C83C194E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:38:51 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YvC-0005k6-9c
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Ypn-0005m0-B8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Ypk-00021U-JA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhQj2DtOYFHa6QoQ2Phssy75MD/MD+R3UrCLg1/8F/8=;
 b=cD28copUHarcLPw9UoVTe/d9Tjatf6x73X77cs4ZijpHb4/zuGVHarcqFz3VHk/SYm+tsG
 0QJAVdrIrIzxRvKFOVNEgjQmLKAmVI1TbzQedlKqFWB++xSgF+vz2BZuInjmimZXyeSv9V
 mH13MVB5aup8fgxLcgaj/K9Ckm/kURU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-TH6WbLBMPGS-_kn-R9Slvw-1; Thu, 08 Jul 2021 14:33:10 -0400
X-MC-Unique: TH6WbLBMPGS-_kn-R9Slvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092F3EC1A0
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:33:10 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 550A484A29;
 Thu,  8 Jul 2021 18:33:09 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:33:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 04/18] crypto: use &error_fatal in crypto tests
Message-ID: <20210708183307.yqct233djo7ch6wj@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-5-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:10AM +0100, Daniel P. Berrangé wrote:
> Using error_fatal provides better diagnostics when tests
> failed, than using asserts, because we see the text of
> the error message.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/unit/test-crypto-hash.c | 12 ++++++------
>  tests/unit/test-crypto-hmac.c | 28 ++++++++--------------------
>  2 files changed, 14 insertions(+), 26 deletions(-)

> 
> diff --git a/tests/unit/test-crypto-hash.c b/tests/unit/test-crypto-hash.c
> index ce7d0ab9b5..b50e28f212 100644
> --- a/tests/unit/test-crypto-hash.c
> @@ -243,7 +243,7 @@ static void test_hash_base64(void)
>  
>  int main(int argc, char **argv)
>  {
> -    g_assert(qcrypto_init(NULL) == 0);
> +    g_assert(qcrypto_init(&error_fatal) == 0);

This is a side effect inside a g_assert().  It might be worth cleaning
it up while you are touching here.  But since it is pre-existing, it
doesn't affect my:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


