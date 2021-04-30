Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F736FBE4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:08:02 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcToH-0007KZ-G4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcTch-0004VT-82
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcTcf-0003Ez-DT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hF/EIJgJvBrv102KMNDjsSOyDqSwvQu0LcCfAAjFRMM=;
 b=GDQ5I0Ss9L66PYcnodTJEADeOh1tIqrWv2KwJjGEXOZHCGwV/KU7UJdpGLK9zgglTV1Ozy
 mBj8407TMffs/BLjtSYrz00ceveocI5J+CcvQ9t7SFB0MaOCUWG/1zEVK75SDA1AFbbsP8
 ZncrAhLk7dnfIMoHlCBTg6fvqILhrX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-4RPaQ-YuPauzLiJJTrWLwA-1; Fri, 30 Apr 2021 09:55:58 -0400
X-MC-Unique: 4RPaQ-YuPauzLiJJTrWLwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB6C2107ACC7;
 Fri, 30 Apr 2021 13:55:57 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8E42B1AA;
 Fri, 30 Apr 2021 13:55:55 +0000 (UTC)
Subject: Re: [PATCH v3 15/15] docs/devel/testing: add -p option to the debug
 section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-16-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <544b24e0-799e-c5d1-686b-9545a8b68218@redhat.com>
Date: Fri, 30 Apr 2021 15:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-16-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   docs/devel/testing.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 62902cfd2d..0c18fc4571 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -246,6 +246,10 @@ given as options to the ``check`` script:
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> +* ``-p`` (print) allows QEMU binary stdout to be shown in the

stderr, too.

> +  test console, instead of saving it into a log file in
> +  ``$TEST_DIR/qemu-machine-<random_string>``.
> +

It doesn’t allow this, though, it forces it.  That means that tests that 
use the log will fail (e.g. 245)[1].  That is, I’d drop the “allows” and 
just state “redirect QEMU’s stdout and stderr to the test output, 
instead of...”.

[1] I realize that all tests will technically fail with -p, because the 
reference output differs, but 245 will not just fail because of that 
difference, but because two of its cases actually really fail.
No need to make a note of this, though.  It’s just that “allows” sounds 
a bit like qemu could choose to put some info into the test output and 
some into the log, when really it’s all or nothing (-p or not -p).

Max

>   Test case groups
>   ----------------
>   
> 


