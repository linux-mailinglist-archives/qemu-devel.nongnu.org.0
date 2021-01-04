Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7532E9EE3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 21:33:25 +0100 (CET)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwWXc-0007ss-Nv
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 15:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwWVp-0006xC-9u
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:31:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwWVn-0008Mm-31
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609792288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztbyq4TU+tNt6Qx6MlEeKqksDpPc1DR2suqYq8KBo1w=;
 b=ArbIP6rOgp/uI+EDnsSJiBUOMTsq0iOli0VWbLnMnKa6doo8dQziwtNtx1si1PAnFdXFwU
 jL29iRDcmPcR5VAw6RrOue+Zw4zzIA6wJDDaYJVY9A6PCT8O6av/sZCkWDxh/+cT9mxQIu
 0j4iUxkmzmVKvlafdg6YSZCWpaGBgtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-mJEsK4fINJaGgTYJ_59mHA-1; Mon, 04 Jan 2021 15:31:26 -0500
X-MC-Unique: mJEsK4fINJaGgTYJ_59mHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D72800D53;
 Mon,  4 Jan 2021 20:31:25 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0349614F5;
 Mon,  4 Jan 2021 20:31:20 +0000 (UTC)
Subject: Re: [PULL for-5.2 2/2] scripts/tracetool: silence SystemTap dtrace(1)
 long long warnings
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201111155654.1430860-1-stefanha@redhat.com>
 <20201111155654.1430860-3-stefanha@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <702283f5-13c1-00f9-4c83-49c469287483@redhat.com>
Date: Mon, 4 Jan 2021 21:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201111155654.1430860-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2020 16:56, Stefan Hajnoczi wrote:
> SystemTap's dtrace(1) prints the following warning when it encounters
> long long arguments:
> 
>   Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax error near:
>   probe vhost_vdpa_dev_start
> 
>   Warning: Proceeding as if --no-pyparsing was given.
> 
> Use the uint64_t and int64_t types, respectively. This works with all
> host CPU 32- and 64-bit data models (ILP32, LP64, and LLP64) that QEMU
> supports.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-id: 20201020094043.159935-1-stefanha@redhat.com
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  scripts/tracetool/format/d.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/tracetool/format/d.py b/scripts/tracetool/format/d.py
> index 353722f89c..ebfb714200 100644
> --- a/scripts/tracetool/format/d.py
> +++ b/scripts/tracetool/format/d.py
> @@ -57,6 +57,12 @@ def generate(events, backend, group):
>                  # Avoid it by changing probe type to signed char * beforehand.
>                  if type_ == 'int8_t *':
>                      type_ = 'signed char *'
> +
> +            # SystemTap dtrace(1) emits a warning when long long is used
> +            type_ = type_.replace('unsigned long long', 'uint64_t')
> +            type_ = type_.replace('signed long long', 'int64_t')
> +            type_ = type_.replace('long long', 'int64_t')
> +
>              if name in RESERVED_WORDS:
>                  name += '_'
>              args.append(type_ + ' ' + name)
> 

This patch fixes the warning with "d" format, but we have the same kind of problem with
log-stap format:

  $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
  parse error: invalid or missing conversion specifier
          saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
       source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)

                       ^

  1 parse error.
  WARNING: tapset "./qemu-system-x86_64-log.stp" has errors, and will be skipped
  BEGIN

This happens because of the "%llu" in the format string.

I'm wondering if we need to fix all the stap based format or simply replace the "unsigned
long long" by "uint64_t" in hw/virtio/trace-events?

Thanks,
Laurent


