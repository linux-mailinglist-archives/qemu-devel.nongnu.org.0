Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E42FE8A2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:22:45 +0100 (CET)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Y32-00077z-O0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Xvm-0001iH-HI
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Xvk-00021R-Pk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611227712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3XgMPOwQicuj9uOnwxMelazoMSlgiyqb1UOXg7ZUWU=;
 b=dEuxznX5U79CiwQIiX7vvBzET79VcJa1o5B6+uim9cFaLlcQoE/9L4a8N6yW4S73INSZht
 rvLG2jWNTMMmnSwCS517OXBQJDrFaBziqJ6kXf2rmaqw9gN0fce+mutHvDdKSAeORiw1Kl
 SVfRYgl6AzQHw5qgkEf1vNS59f5kMC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-TcEZmEyQOR2rh5gLIo61Iw-1; Thu, 21 Jan 2021 06:15:10 -0500
X-MC-Unique: TcEZmEyQOR2rh5gLIo61Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62BB6873016;
 Thu, 21 Jan 2021 11:14:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EC63100AE33;
 Thu, 21 Jan 2021 11:14:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 994E618000A0; Thu, 21 Jan 2021 12:14:26 +0100 (CET)
Date: Thu, 21 Jan 2021 12:14:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/usb/dev-uas: Report command additional adb
 length as unsupported
Message-ID: <20210121111426.tcy2fhxzltts2lja@sirius.home.kraxel.org>
References: <20210120153522.1173897-1-philmd@redhat.com>
 <20210120153522.1173897-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120153522.1173897-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 qemu-devel@nongnu.org, Han Han <hhan@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 04:35:22PM +0100, Philippe Mathieu-Daudé wrote:
> We are not ready to handle additional CDB data.
> 
> If a guest sends a packet with such additional data,
> report the command parameter as not supported.
> 
> Specify a size (of 1 byte) for the add_cdb member we
> are not using, to fix the following warning:
> 
>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>       uas_iu                    status;
>                                 ^
> 
> Reported-by: Ed Maste <emaste@FreeBSD.org>
> Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Reported-by: Han Han <hhan@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> v2: include Eric feedbacks

Queued 2+3, fixup #2 conflicts due to dropping #1.

thanks,
  Gerd


