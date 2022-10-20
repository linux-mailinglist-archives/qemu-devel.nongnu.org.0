Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A236064D5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:42:36 +0200 (CEST)
Received: from localhost ([::1]:41516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXgd-00050Y-Bj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:42:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXed-0007jq-GR
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olVwQ-0007v7-6b
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olVwO-0001WS-Fg
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666273831;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P723MNQP4wSNIpEarQKSvguEkEeWV3OEJR8ZxUu/oMc=;
 b=VyCyTNdpyz+jW4g0Q5ua/E0Wa1JPlnHPXSjUJTMHEgpwTsWZ9ILKKHsHVnd0AkGXORadhe
 jBStabfFvwxBZeuWTonC9BfuNVRTLLtUxAKHAywiAquoTXmrlkMiSdusrFL5DH0GMEym7+
 rRYdfFs334dz6qGA4Ym8IMetOm2jpfo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-Uy2RAPv2Miut3IvYJ-AUJA-1; Thu, 20 Oct 2022 09:50:28 -0400
X-MC-Unique: Uy2RAPv2Miut3IvYJ-AUJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C6883C1E725;
 Thu, 20 Oct 2022 13:50:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 389652024CB7;
 Thu, 20 Oct 2022 13:50:27 +0000 (UTC)
Date: Thu, 20 Oct 2022 14:50:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH 18/17] util/qemu-sockets: Display IPv6 addresses
 within square brackets
Message-ID: <Y1FSGsm4ThxkpK6N@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020134051.88449-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020134051.88449-1-philmd@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 03:40:51PM +0200, Philippe Mathieu-Daudé wrote:
> See RFC3986 "Uniform Resource Identifier (URI): Generic Syntax"
> section 3.2.2. 'Host' [1]:
> 
>    A host identified by an Internet Protocol literal address, version
>    6 [RFC3513] or later, is distinguished by enclosing the IP literal
>    within square brackets ("[" and "]").  This is the only place where
>    square bracket characters are allowed in the URI syntax.
> 
> and RFC5952 "A Recommendation for IPv6 Address Text Representation"
> section 6. 'Notes on Combining IPv6 Addresses with Port Numbers' [2]:
> 
>    The [] style as expressed in [RFC3986] SHOULD be employed, and is
>    the default unless otherwise specified. [...] For URIs containing
>    IPv6 address literals, [RFC3986] MUST be followed [...].
> 
> [1] https://www.rfc-editor.org/rfc/rfc3986#section-3.2.2
> [2] https://www.rfc-editor.org/rfc/rfc5952#section-6
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/netdev-socket.c | 4 ++--
>  util/qemu-sockets.c         | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> index 4ea66b4c69..65f0e01db1 100644
> --- a/tests/qtest/netdev-socket.c
> +++ b/tests/qtest/netdev-socket.c
> @@ -134,13 +134,13 @@ static void test_stream_inet_ipv6(void)
>                         "addr.ipv4=off,addr.ipv6=on,"
>                         "addr.host=localhost,addr.port=%d", port);
>  
> -    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
> +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:[::1]:%d\r\n",
>                               port);
>      EXPECT_STATE(qts1, expect, 0);
>      g_free(expect);
>  
>      /* the port is unknown, check only the address */
> -    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:[::1]", ':');
>  
>      qtest_quit(qts1);
>      qtest_quit(qts0);
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index a9926af714..19af96fa2c 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1081,8 +1081,10 @@ char *socket_uri(SocketAddress *addr)
>  {
>      switch (addr->type) {
>      case SOCKET_ADDRESS_TYPE_INET:
> -        return g_strdup_printf("tcp:%s:%s",
> +        return g_strdup_printf("tcp:%s%s%s:%s",
> +                               addr->u.inet.ipv6 ? "[" : "",
>                                 addr->u.inet.host,
> +                               addr->u.inet.ipv6 ? "]" : "",
>                                 addr->u.inet.port);

"host" is not required to be numeric and using [..] is  only
valid for numeric IPv6 addresses, not  hostnames. So you
need to actually check "host" is fully numeric.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


