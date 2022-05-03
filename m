Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75439518A4D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:43:47 +0200 (CEST)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvco-0004KI-Gy
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlvJi-0000VY-Oq
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlvJg-0007QN-0D
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651595007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLIR9ZZ9zFGHxxYce9jBnclX+z8z1xGUOz0d40nEMIQ=;
 b=YNi4pmde7xXfBTtLGmvOvqcH1/kupD0TgO4fhpRZ8IJh95a5jz/DmY1d8TcDcgwUgjWEVM
 4THMCiGAevnVzSwUb3B2Zr9kOvcDGEqR/QNmcUrfTzZl7dMLZQpOAudLxP32mmF3K+ubzQ
 02KryqN8XUiVv5JYiX8TJbBWwNUFe1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-vMfH8JMLOySBEVSC0EOTiw-1; Tue, 03 May 2022 12:23:46 -0400
X-MC-Unique: vMfH8JMLOySBEVSC0EOTiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C0093806701;
 Tue,  3 May 2022 16:23:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8F6111E40B;
 Tue,  3 May 2022 16:23:07 +0000 (UTC)
Date: Tue, 3 May 2022 11:23:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 6/8] qapi: Drop unnecessary whitespace in comments
Message-ID: <20220503162305.ul4yssy7fyl4ivs6@redhat.com>
References: <20220503073737.84223-1-abologna@redhat.com>
 <20220503073737.84223-7-abologna@redhat.com>
 <87ilqndn5o.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilqndn5o.fsf@pond.sub.org>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 10:40:35AM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> 
> > The only instances that get changed are those in which the
> > additional whitespace was not (or couldn't possibly be) used for
> > alignment purposes.
> >
> > Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> 
> This mixes complete no-brainers with "I consider it an improvement, but
> folks might disagree" (a few examples marked below for illustration).
> 
> Well, folks, if you disagree, speak up!  I don't:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

No complaints from me for the changes made in this patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


