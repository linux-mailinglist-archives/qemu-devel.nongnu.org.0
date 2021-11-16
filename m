Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B946452B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:07:39 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmsZ8-0005oL-0S
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmsY7-0004Xb-H9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmsY4-0003le-JB
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637046391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEWkY+ZXhLo9QvbDqm2iFv57LhFPOihAnhRGvApHz8g=;
 b=hoWwasNRPmuw4H9UwlyQkxP5uU4C/N1yLypSnXpxUlu0zJcG+qRruJT7YWpYyXbPDugEOK
 +hBeZ0+MUxiCOZ8x2FFlw6iNuVa88jDWFCCeCuCjVD1WHbUg0XqlFlViTyQvfVx5cDWdYg
 vvDWVzlZjR4ewBtClqvhbBCFnyrYD/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-SidQKjUyPaCLAul5jCiGcw-1; Tue, 16 Nov 2021 02:06:28 -0500
X-MC-Unique: SidQKjUyPaCLAul5jCiGcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00C1BAF84;
 Tue, 16 Nov 2021 07:06:26 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62D0A60BE5;
 Tue, 16 Nov 2021 07:06:04 +0000 (UTC)
Message-ID: <9ea4ede4-f1aa-c430-9e94-cb2db9b1d372@redhat.com>
Date: Tue, 16 Nov 2021 08:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for 6.2 v4] nbd/server: Add --selinux-label option
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20211115202944.615966-1-eblake@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211115202944.615966-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 richard.henderson@linaro.org, rjones@redhat.com, wainersm@redhat.com,
 f4bug@amsat.org, willianr@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/2021 21.29, Eric Blake wrote:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> Under SELinux, Unix domain sockets have two labels.  One is on the
> disk and can be set with commands such as chcon(1).  There is a
> different label stored in memory (called the process label).  This can
> only be set by the process creating the socket.  When using SELinux +
> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> you must set both labels correctly first.
> 
> For qemu-nbd the options to set the second label are awkward.  You can
> create the socket in a wrapper program and then exec into qemu-nbd.
> Or you could try something with LD_PRELOAD.
> 
> This commit adds the ability to set the label straightforwardly on the
> command line, via the new --selinux-label flag.  (The name of the flag
> is the same as the equivalent nbdkit option.)
...
> @@ -3430,6 +3437,7 @@ summary_info += {'libdaxctl support': libdaxctl}
>   summary_info += {'libudev':           libudev}
>   # Dummy dependency, keep .found()
>   summary_info += {'FUSE lseek':        fuse_lseek.found()}
> +summary_info += {'selinux':           selinux.found()}

It's nicer if you do it like this (i.e. without the .found()):

summary_info += {'selinux':           selinux}

... then meson prints out the version of the library, too.

Apart from that, patch looks fine to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>


