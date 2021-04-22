Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB6367FD4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 13:52:22 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZXsb-00057d-QS
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 07:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZXpG-0003PV-3a
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZXpE-0006jL-EL
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619092131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4i8LPcqHMF5a7sL3hplt26szteTPb3nGOf4sc/9mYY=;
 b=I5itVw8AJTxYaIW+IWcAFv9vJnVIFC1cJqDy1AxQwOwIo8oc1GRx5dGCzLR5lT/vi+88uY
 N54KPmQ1eMXpUDwuQBSJyzfBXUnH4bGidRW5yvY9bjH0d3vIiROlvCgmQjpKbijurD9qTE
 SUzRUIHSDhl2w3h2m4TbLxDQZJP3U7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-6ZR_jTPFOZ64TohmUz8g7w-1; Thu, 22 Apr 2021 07:48:50 -0400
X-MC-Unique: 6ZR_jTPFOZ64TohmUz8g7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6574D8CC352;
 Thu, 22 Apr 2021 11:48:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A47160BE5;
 Thu, 22 Apr 2021 11:48:37 +0000 (UTC)
Date: Thu, 22 Apr 2021 12:48:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <YIFik1TKV3SaUZWv@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 01:24:30PM +0200, Philippe Mathieu-Daudé wrote:
> This silents the warning however:
> 
> -- >8 --
> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
> index bcdc45732d..2dea399904 100644
> --- a/pc-bios/s390-ccw/libc.h
> +++ b/pc-bios/s390-ccw/libc.h
> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>  typedef unsigned int       uint32_t;
>  typedef unsigned long long uint64_t;
> 
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>  static inline void *memset(void *s, int c, size_t n)
>  {
>      size_t i;
> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
> 
>      return s;
>  }
> +#pragma GCC diagnostic pop

I wonder if it works if you put the pragma around the specific
caller, as that would make the scope more limited so we can still
see valid bugs elsewhere

> 
>  static inline void *memcpy(void *s1, const void *s2, size_t n)
>  {
> ---
> 
> Oddly this code doesn't emit any warning:

Let me correct that for you

  s/doesn't emit any warning/doesn't emit any warning *yet*/

compilers get more strict all the time. The memcmp is just
a memory read, however, while memset is a write, so less
severe

>   if (!memcmp((char *)S390EP, "S390EP", 6)) {
>   ...

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


