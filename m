Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9130BD58
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:46:22 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6u8T-0007iO-Ec
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6u7B-0007Be-U3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:45:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6u79-0005da-8l
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612266298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJDF47ML7QNbOXpWGN0smj+8QLzL+M6cvNarS115la4=;
 b=MJEmSgE5ujeQwpndNRhYjVprRc/71nj1IL2e+zNExudkb5GkVbGHyBXeVyYOb6YOzzN0B5
 fhJfu7JFWAI3x4rN25JlrMyfqkRQgBNmBxswG4QptJzQBkUvYaGzpoiXFBayaXmyh2XspV
 KQQ9a3fSZjZR24JS9pPtXg4HhdJar8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-S-6bfhILMr6e_Zggt0wMcQ-1; Tue, 02 Feb 2021 06:44:56 -0500
X-MC-Unique: S-6bfhILMr6e_Zggt0wMcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D373D425C9
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 11:44:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B48E5D9C6;
 Tue,  2 Feb 2021 11:44:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB2DA18000A7; Tue,  2 Feb 2021 12:44:53 +0100 (CET)
Date: Tue, 2 Feb 2021 12:44:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210202114453.j5s3tgdurg4jztxs@sirius.home.kraxel.org>
References: <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <20210202111015.peh4cslwvxuot6qv@sirius.home.kraxel.org>
 <20210202111709.GB4168502@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202111709.GB4168502@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Christophe de Dinechin <cdupontd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 11:17:09AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 02, 2021 at 12:10:15PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > > How do you rate-limit intelligently to avoid overflowing the guest keyboard buffers?
> > > 
> > > Like I said earlier in this thread, this is a big problem with
> > > keyboard injection.
> > 
> > It's a solved problem though, the qemu vnc server has throttling
> > implemented already.  There even is an option to configure the delay
> > (key-delay-ms).
> 
> Depends on your view of "solved" really.

"solved" as in "automated qa can send command lines as vnc key events
way without loosing chars".  That is the use case it was added for.
Doing it in qemu works a bit better and faster than doing it in the vnc
client as you don't have to account for stuff like network delays then.

> If I've highlighted a region
> of text in openoffice that is 100 KB in size, and press "Ctrl-V" in
> the VNC window for the VM, with a 10 ms delay, i'll be waiting 15
> minutes for it to finish injecting keystrokes.

Yep.  It's clearly not for really large quantities of text.

But sending "wget $url" to the guest shell works reasonable well.

> Anything longer than 1 second is unacceptable. If you make the delay
> too short the guest keyboard handler will loose keys. So realistically
> I think keyboard injection is limted to about 100 characters of text.

Yes.

take care,
  Gerd


