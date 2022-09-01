Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8B5A99C1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:11:04 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkuN-0001N7-3G
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTkrc-00070w-01
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTkrU-000383-Ta
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662041283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fLcNfwOev5KoO3ku2TE20eLNL+jWFDCC+Yt08wRZcGc=;
 b=dVVZyzh4aInKH26pdf8hRg0+1+xXvw2FyhqXZBSwgH4ofNz9Da8Rvz9qCy16lRxOJI89eZ
 RbNlX4ahzSf0DXeFI5vIrnFYW4vKl3+1rPeJBFbKKJ6VXm/t/zHSKmRcush3IIhdY4nJK3
 xl0veqIfqcwQ8ToUmHLWd4HpMqFuQqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-xFczfs4DPlK7DxgiKnYVXQ-1; Thu, 01 Sep 2022 10:08:02 -0400
X-MC-Unique: xFczfs4DPlK7DxgiKnYVXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F1648039BB;
 Thu,  1 Sep 2022 14:08:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F982166B26;
 Thu,  1 Sep 2022 14:08:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CAD6718003AA; Thu,  1 Sep 2022 16:08:00 +0200 (CEST)
Date: Thu, 1 Sep 2022 16:08:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 03/16] qapi: fix example of query-spice command
Message-ID: <20220901140800.c3dmjabjo4vkhnwr@sirius.home.kraxel.org>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-4-victortoso@redhat.com>
 <87sflcaayg.fsf@pond.sub.org>
 <20220831125505.ezjevpomvsns7db7@tapioca>
 <87czcg8s4q.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czcg8s4q.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

  Hi,

> I agree listing more channels in the example wouldn't help users.
> 
> But do we want to indicate that the example is abridged?

Hard to do if the result should be valid qmp ...

Maybe add a second channel to clearly show the command returns
a list of channels?

I'm also curious why you check the syntax in the first place.
Make sure syntax highlight in the documentation works properly?
Make sure the examples are not outdated?

> Gerd, I'd like to have your Acked-by for this patch.

I don't mind that much.  If there is a good reason go for it.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


