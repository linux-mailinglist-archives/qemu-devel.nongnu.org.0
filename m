Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BD2EBDD6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:45:40 +0100 (CET)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8C2-0008SK-Vy
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx8AT-00081x-Jj
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx8AQ-0002fK-Tg
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609937037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUqv6pquVILAHIjpHqhIeqiY/Pcujg1VQXePSOK0uTo=;
 b=d8AmBDkel9myaKcR8Wse0gHJyESYb9m9oDt62PzNZgoUhsMxZBER9E4bmkjfie1TQh4qAJ
 bTkQp97T8c6C67rWGnMtp8Ryi1cEKARwEmWcWARJk9mS1GtkV7mVBfoMKWY+3Q5Izngi9B
 Rhesb0y+J2QVFyX+jcDQSTYTSF1g+pU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-uBSuNttYNk-ummYGtzYdkA-1; Wed, 06 Jan 2021 07:43:55 -0500
X-MC-Unique: uBSuNttYNk-ummYGtzYdkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3933801B13
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 12:43:54 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19151002388;
 Wed,  6 Jan 2021 12:43:50 +0000 (UTC)
Subject: Re: [PATCH] tracetool: strip %l and %ll from systemtap format strings
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106121932.1002928-1-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <22d4dba0-7a69-a9fd-f687-735e99e50da5@redhat.com>
Date: Wed, 6 Jan 2021 13:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106121932.1002928-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: William Cohen <wcohen@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2021 13:19, Daniel P. Berrangé wrote:
> All variables are 64-bit and so %l / %ll are not required, and the
> latter is actually invalid:
> 
>   $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
>   parse error: invalid or missing conversion specifier
>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
> refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
> 
>                        ^
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> This is an alternative approach to
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00550.html

Your patch is indeed a better solution.

> 
> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
> index b486beb672..7bac10784b 100644
> --- a/scripts/tracetool/format/log_stap.py
> +++ b/scripts/tracetool/format/log_stap.py
> @@ -49,6 +49,12 @@ def c_fmt_to_stap(fmt):
>          elif fmt[i] == '"' and not escape:
>              if state == STATE_LITERAL:
>                  state = STATE_SKIP
> +                # All variables in systemtap are 64-bit in size
> +                # The "%l" integer size qualifiers is thus redundant
> +                # and "%ll" is not valid at all. Simply strip all
> +                # size qualifiers for sanity
> +                literal = literal.replace("%ll", "%")
> +                literal = literal.replace("%l", "%")
>                  bits.append(literal)
>                  literal = ""
>              else:
> 

There is a 'sub("%(\d*)z(x|u|d)", "%\\1\\2",..)' later in the code,
can we have here the '\d*" case or the 'z' case?

I'm wondering if it can be handled in a more generic way by something like:

--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -78,6 +78,7 @@ def c_fmt_to_stap(fmt):
         bits.append(literal)

     fmt = re.sub("%(\d*)z(x|u|d)", "%\\1\\2", "".join(bits))
+    fmt = re.sub("%(\d*)l*(x|u|d)", "%\\1\\2", fmt)
     return fmt

 def generate(events, backend, group):

Thanks,
Laurent


