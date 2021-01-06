Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7B2EBF06
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:49:30 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx9Bp-0004L7-EY
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx9Al-0003sP-20
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx9Ag-000754-NB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609940897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzAPtJOpJDA9oHdwaF1Ke5kcPEF7wuhLQ8M2tKmCqiI=;
 b=BtmnuhhPCJcwV7B2HDQRxN33m4nWwixdYiVGK1ACM5/i/21H0regViKaT0Y0Lr1oQfKob+
 1+FUQF+9vMDsslK/hH/P7AAsYyLDp9JjvYOeiv7w/EAnRBC2o6B5xN6x9Xru2eTvTs+9G6
 AGSvWvOLcoKNw+gjl/BRVKtmQFpsRfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-h6tjf8PNPieLxvLW3Ryt4A-1; Wed, 06 Jan 2021 08:48:16 -0500
X-MC-Unique: h6tjf8PNPieLxvLW3Ryt4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11504801AA7
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 13:48:15 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44CFF5D6A1;
 Wed,  6 Jan 2021 13:48:10 +0000 (UTC)
Subject: Re: [PATCH v2] tracetool: also strip %l and %ll from systemtap format
 strings
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106130239.1004729-1-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4e2649d6-9707-bae8-f908-f94aaed683e0@redhat.com>
Date: Wed, 6 Jan 2021 14:48:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106130239.1004729-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On 06/01/2021 14:02, Daniel P. Berrangé wrote:
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
>  scripts/tracetool/format/log_stap.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> In v2:
> 
>  - Change existing logic that stripped %z to handle %l/%ll too
> 
> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
> index b486beb672..fac911a0f4 100644
> --- a/scripts/tracetool/format/log_stap.py
> +++ b/scripts/tracetool/format/log_stap.py
> @@ -77,7 +77,12 @@ def c_fmt_to_stap(fmt):
>      elif state == STATE_LITERAL:
>          bits.append(literal)
>  
> -    fmt = re.sub("%(\d*)z(x|u|d)", "%\\1\\2", "".join(bits))
> +    # All variables in systemtap are 64-bit in size
> +    # The "%l" integer size qualifier is thus redundant
> +    # and "%ll" is not valid at all. Simiarly the size_t
> +    # based "%z" size qualifier is not valid. We just
> +    # strip all size qualifiers for sanity.
> +    fmt = re.sub("%(\d*)(l+|z)(x|u|d)", "%\\1\\3", "".join(bits))
>      return fmt
>  
>  def generate(events, backend, group):
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>


