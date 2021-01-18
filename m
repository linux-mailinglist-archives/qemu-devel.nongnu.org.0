Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879012FA5B3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:11:30 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1X7n-0003pd-FB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1X6X-0003B8-G8
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1X6U-0001yn-Aw
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610986204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnBzjH2J28uliTSj0tHs6y7sB+EkWSTUy60EZ3lLelw=;
 b=EmyVbckBLYGxS/oYxQYspQT9lX33I0zDy5CW0d0+caPaZNcAifASLSNNh9883G8kXsl6IX
 ZhIzzgKA9NrXLu5Kj+xZY20EsOvkGiquAK8rwUlKCucNRHEO6bDr74ftx6HFkaBZgiE7J/
 +WpMJRuQabNqz0FLF3iHXb/UtPgXP00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-kSMLU3ClN-K9LmWZmjvJ-A-1; Mon, 18 Jan 2021 11:10:01 -0500
X-MC-Unique: kSMLU3ClN-K9LmWZmjvJ-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1CC0806661;
 Mon, 18 Jan 2021 16:10:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1B5177F8;
 Mon, 18 Jan 2021 16:10:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0130C18000BA; Mon, 18 Jan 2021 17:09:58 +0100 (CET)
Date: Mon, 18 Jan 2021 17:09:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2? v3 3/9] hw/usb: reorder fields in UASStatus
Message-ID: <20210118160958.gb24opssdcnprcm2@sirius.home.kraxel.org>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-4-dbuono@linux.vnet.ibm.com>
 <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
 <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
 <9675d8c2-9913-3bc7-2b53-9ed3413fbd23@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9675d8c2-9913-3bc7-2b53-9ed3413fbd23@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > It would seem that the copy is limited to at most sizeof(uas_iu),
> > so even if we had anything in add_cdb[], that wouldn't be copied
> > here?
> > 
> > Is this intended?
> 
> Gerd, do you know?

Don't remember, it's been a few years ago ...

Given that neither add_cdb nor add_cdb_length fields are checked
anywhere in the code it is probably save to just comment out the
add_cdb field.  Should we ever need to look at add_cdb at some
point in the future we can figure some better way deal with it,
in the simplest case just give it a fixed size based on the needs.

take care,
  Gerd


