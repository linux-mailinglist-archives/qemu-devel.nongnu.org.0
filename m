Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C2330C6D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:31:34 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJE6n-0006PN-32
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJE5l-0005tx-UV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJE5k-00089u-5a
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615203027;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBKVS0sBNBifULzj3rPPU3EDjeBCjqqSMfqH4/4bwWk=;
 b=fMRmC104p1LhNaifKph8nrzZMQWjKTrC1/1+xlXJ6E+C6RPZjJgPfj/x2E7/cKbOL9/5mx
 PCd3+XNPYbqvNFllaeH1SwuhkE4+k7EbQFqGayjIPvmRkeQQSAXtK6kGC7LGhfOUsMhY1B
 mjilsY68cxmH7QIjyBOjaAdaB/HKl8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-xMM8qAohO7STCsioOl8_HA-1; Mon, 08 Mar 2021 06:30:25 -0500
X-MC-Unique: xMM8qAohO7STCsioOl8_HA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1DEA81431E;
 Mon,  8 Mar 2021 11:30:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCFF60C17;
 Mon,  8 Mar 2021 11:30:22 +0000 (UTC)
Date: Mon, 8 Mar 2021 11:30:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH] inet_parse: Clarify IPv6 comment and error message
Message-ID: <YEYKy65zOHUWVu/D@redhat.com>
References: <20210308002928.3385275-1-dje@google.com>
 <161516362431.11025.2679751497781286596@c667a6b167f6>
 <CADPb22R89=EcWFcuFABZP3=L3CbUEq1eKPqNJY=SqDSoZ+CDnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22R89=EcWFcuFABZP3=L3CbUEq1eKPqNJY=SqDSoZ+CDnQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 07, 2021 at 05:31:24PM -0800, Doug Evans wrote:
> Not sure how this "Author email address is mangled" happened.
> 
> $ git format-patch -o patches/error-parsing-ipv6 -1
> $ git send-email --to='qemu-devel@nongnu.org,Samuel Thibault <
> samuel.thibault@ens-lyon.org>,"Daniel P. Berrangé" <berrange@redhat.com>' \
> --smtp-server=foo
> patches/error-parsing-ipv6/0001-inet_parse-Clarify-IPv6-comment-and-error-message.patch
> 
> It's possible my smtp-server arg munged things incorrectly, but I've done
> the identical thing for previous patches and not seen this for at least
> some of them.
> Sigh.

The 'via <qemu-devel@nongnu.org>' mangling is something that gnu.org
mailman is configured to do. It used to do this in many scenarios, but
supposedly it now only mangles when the sender has a bad DKIM signature
and their domain has strict DMARC policies:

  https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00416.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


