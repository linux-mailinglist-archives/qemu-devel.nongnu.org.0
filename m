Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B022E697C2B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:47:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHBX-0005yH-Iq; Wed, 15 Feb 2023 07:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSHBT-0005xs-G1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:46:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSHBR-0000Hn-P5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676465208;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYfa9rfKDTB7EX53ES6j/CwRteIxp+5DaRaAIfbqMGM=;
 b=GhDT/dv6eVOTFyYZ0NdEjrORIkRTCE4JURYarXDchA768GuhZCjXT6ASX8rNL8WvOEpkJ9
 eeeiJ3MFWgeI3qAPX0gtPmLiqeK6X0/Pxc82gSM/NffAaPDiy2Ua8laVBIT/jL+NgUdb03
 PnuqF0V3hCcIWc50LxPXvJZuritw11w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-E9QRDiBoOO2rFlbkK1flsA-1; Wed, 15 Feb 2023 07:46:47 -0500
X-MC-Unique: E9QRDiBoOO2rFlbkK1flsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDADD101A55E;
 Wed, 15 Feb 2023 12:46:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF9AB18EC1;
 Wed, 15 Feb 2023 12:46:45 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:46:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/qtest/rtl8139-test: Make the test less verbose by
 default
Message-ID: <Y+zUMygZUSwiPRwG@redhat.com>
References: <20230215124122.72037-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215124122.72037-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 01:41:22PM +0100, Thomas Huth wrote:
> We are facing the issues that some test logs in the gitlab CI are
> too big (and thus cut off). The rtl8139-test is one of the few qtests
> that prints many lines of output by default when running with V=1, so
> it contributes to this problem. Almost all other qtests are silent
> with V=1 and only print debug messages with V=2 and higher. Thus let's
> change the rtl8139-test to behave more like the other tests and only
> print the debug messages with V=2 (or higher).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/rtl8139-test.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
> index 8fa3313cc3..1beb83805c 100644
> --- a/tests/qtest/rtl8139-test.c
> +++ b/tests/qtest/rtl8139-test.c
> @@ -12,6 +12,8 @@
>  #include "libqos/pci-pc.h"
>  #include "qemu/timer.h"
>  
> +static int verbosity_level;
> +
>  /* Tests only initialization so far. TODO: Replace with functional tests */
>  static void nop(void)
>  {
> @@ -45,12 +47,16 @@ static QPCIDevice *get_device(void)
>  static unsigned __attribute__((unused)) in_##name(void) \
>  { \
>      unsigned res = qpci_io_read##len(dev, dev_bar, (val));     \
> -    g_test_message("*%s -> %x", #name, res); \
> +    if (verbosity_level >= 2) { \
> +        g_test_message("*%s -> %x", #name, res); \
> +    } \
>      return res; \
>  } \
>  static void out_##name(unsigned v) \
>  { \
> -    g_test_message("%x -> *%s", v, #name); \
> +    if (verbosity_level >= 2) { \
> +        g_test_message("%x -> *%s", v, #name); \
> +    } \
>      qpci_io_write##len(dev, dev_bar, (val), v);        \
>  }
>  
> @@ -195,6 +201,11 @@ static void test_init(void)
>  int main(int argc, char **argv)
>  {
>      int ret;
> +    char *v_env = getenv("V");
> +
> +    if (v_env) {
> +        verbosity_level = atoi(v_env);
> +    }

*Not* something I'm requesting you to do now, just an observation / idea.

We've copied this pattern into several tests.

It is starting to feel like we should have a header with a
'qtests_env_setup()' method we call as first thing in main,
and exporting 'verbosity_level' from the header.

Perhaps also with a  'qtest_verbose(...)' macro that wraps

  if (verbosity_level >= 2) {
     g_test_message(...)
  }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


