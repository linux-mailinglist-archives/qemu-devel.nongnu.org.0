Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC93EF2AD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 21:32:04 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4od-00074S-05
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 15:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG4mn-0005qr-Bw
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG4mj-0001Sj-Vw
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629228604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+jzz8bl6ToprfagDPqhA/ECnaKvbCEi0LYmjSve7jY=;
 b=BC2O5ALP+q0FtEZ4uZKpMLqV2cI/gCwsqN/ukMZeZ62JaIoqClCs6pEYoMcGsgYG9+D/OM
 u2o2TSBQfvISE38NyNZFDb6DKtH3nQur5cbjQSuDlV+6jjukc6oWpXsdS5JqsynWj82ppY
 YgtF8XzJsZNDfzem+7byjrW37CDkJj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-lK4i07ZhMoOKVGlnQLjU1Q-1; Tue, 17 Aug 2021 15:30:00 -0400
X-MC-Unique: lK4i07ZhMoOKVGlnQLjU1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9995E8799E0;
 Tue, 17 Aug 2021 19:29:59 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98C7460871;
 Tue, 17 Aug 2021 19:29:51 +0000 (UTC)
Date: Tue, 17 Aug 2021 14:29:49 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
Message-ID: <20210817192949.cglc7ah2ohlmtf43@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-10-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803182941.504537-10-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 02:29:25PM -0400, John Snow wrote:
> It's a little messier than connect, because it wasn't designed to accept
> *precisely one* connection. Such is life.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/protocol.py | 89 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
> index 77b330627b3..7eca65aa265 100644
> --- a/python/qemu/aqmp/protocol.py
> +++ b/python/qemu/aqmp/protocol.py
> @@ -243,6 +243,24 @@ async def runstate_changed(self) -> Runstate:
>          await self._runstate_event.wait()
>          return self.runstate
>  
> +    @upper_half
> +    @require(Runstate.IDLE)
> +    async def accept(self, address: Union[str, Tuple[str, int]],
> +                     ssl: Optional[SSLContext] = None) -> None:
> +        """
> +        Accept a connection and begin processing message queues.
> +
> +        If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
> +
> +        :param address:
> +            Address to listen to; UNIX socket path or TCP address/port.

Can't TCP use a well-known port name instead of an int?  But limiting
clients to just int port for now isn't fatal to the patch.

> +        :param ssl: SSL context to use, if any.
> +
> +        :raise StateError: When the `Runstate` is not `IDLE`.
> +        :raise ConnectError: If a connection could not be accepted.
> +        """
> +        await self._new_session(address, ssl, accept=True)
> +

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


