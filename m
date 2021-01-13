Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D935B2F54F3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:39:17 +0100 (CET)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzonM-0006B0-B2
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoly-0005Jq-Bb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzolt-0002x4-ME
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610577464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsVhQTPK/jR6cdBubVrQII6gt4Zudg7Qf4p3dS8MBII=;
 b=IveeRt2HSaSs/dEqlYazheQk9DcVi7G147w5EXLVCroUsDOmTschwixir8Jyb/nRDdH+IR
 CXFZKn7r7JD3y/hAIqCFmii4P3Zl7CPZsTwP5jwyBuWvK2Dysk3wcKUiV8sEIEEF4RWoWz
 VM4J+5vRreMkps4FFPaHAUfP2fHjnUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-JskM-g_RPnCHgYdJ6FWY_w-1; Wed, 13 Jan 2021 17:37:40 -0500
X-MC-Unique: JskM-g_RPnCHgYdJ6FWY_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4242380DDE0;
 Wed, 13 Jan 2021 22:37:39 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 858721F0;
 Wed, 13 Jan 2021 22:37:38 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] iotests/277: use dot slash for
 nbd-fault-injector.py running
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e695fcd6-2dd3-543e-14d7-1f17f3682c37@redhat.com>
Date: Wed, 13 Jan 2021 16:37:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 6:26 AM, Vladimir Sementsov-Ogievskiy wrote:
> If you run './check 277', check includes common.config which adjusts
> $PATH to include '.' first, and therefore finds nbd-fault-injector.py
> on PATH.  But if you run './277' directly, there is nothing to adjust
> PATH, and if '.' is not already on your PATH by other means, the test
> fails because the executable is not found.  Adjust how we invoke the
> helper executable to avoid needing a PATH search in the first place.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/qemu-iotests/277 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As this one touches NBD, I'm happy to queue it in my next NBD pull
request if the entire series takes longer to collect enough reviews.

> 
> diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
> index d34f87021f..a39ce2d873 100755
> --- a/tests/qemu-iotests/277
> +++ b/tests/qemu-iotests/277
> @@ -42,7 +42,7 @@ def make_conf_file(event):
>  def start_server_NBD(event):
>      make_conf_file(event)
>  
> -    srv = subprocess.Popen(['nbd-fault-injector.py', '--classic-negotiation',
> +    srv = subprocess.Popen(['./nbd-fault-injector.py', '--classic-negotiation',
>                             nbd_sock, conf_file], stdout=subprocess.PIPE,
>                             stderr=subprocess.STDOUT, universal_newlines=True)
>      line = srv.stdout.readline()
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


