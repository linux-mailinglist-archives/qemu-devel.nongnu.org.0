Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7629271D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 14:19:53 +0200 (CEST)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUU8m-0000Y5-Dw
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 08:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUU7S-0008Pg-I9
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUU7Q-0004vn-9o
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603109906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TL2bP26BUbJbO3VlLZ9qCojWyppJ7qk91H5wFWk0L+I=;
 b=f1J59A2Xlzl04Phe73GH0GROfsz4jwSGUxLJYVEirm947YNlUcZVM9srsKHfnX/LjD3ddL
 JH2BMazG49RpIcm4mZDCDpNYRXvMvJkcWsmDOZ4B19Dyv2e2keurkngXImoOprLPD1TUt8
 R9qyUoMSS991x0HRFYJZyLT85PMtxJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-nMvjpf9gPXOpgS2A8qIDug-1; Mon, 19 Oct 2020 08:18:15 -0400
X-MC-Unique: nMvjpf9gPXOpgS2A8qIDug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3308CADC25;
 Mon, 19 Oct 2020 12:18:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EADBA19C71;
 Mon, 19 Oct 2020 12:18:12 +0000 (UTC)
Date: Mon, 19 Oct 2020 13:18:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: AlexChen <alex.chen@huawei.com>
Subject: Re: io: Don't use '#' flag of printf format
Message-ID: <20201019121809.GJ236912@redhat.com>
References: <5F8D8292.5030302@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5F8D8292.5030302@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zhengchuan@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 19, 2020 at 08:12:02PM +0800, AlexChen wrote:
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  io/channel-websock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io/channel-websock.c b/io/channel-websock.c
> index 47a0e941d9..e94a1fcf99 100644
> --- a/io/channel-websock.c
> +++ b/io/channel-websock.c
> @@ -746,7 +746,7 @@ static int qio_channel_websock_decode_header(QIOChannelWebsock *ioc,
>              opcode != QIO_CHANNEL_WEBSOCK_OPCODE_CLOSE &&
>              opcode != QIO_CHANNEL_WEBSOCK_OPCODE_PING &&
>              opcode != QIO_CHANNEL_WEBSOCK_OPCODE_PONG) {
> -            error_setg(errp, "unsupported opcode: %#04x; only binary, close, "
> +            error_setg(errp, "unsupported opcode: 0x%04x; only binary, close, "
>                         "ping, and pong websocket frames are supported", opcode);
>              qio_channel_websock_write_close(
>                  ioc, QIO_CHANNEL_WEBSOCK_STATUS_INVALID_DATA ,

Acked-by: Daniel P. Berrangé <berrange@redhat.com>

and added to my queue

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


