Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE6322D6D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:24:23 +0100 (CET)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZXy-0001zI-Nb
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEZWm-00015z-Si
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEZWh-0000sr-PX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614093781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+vYrpgKqnhZbTBws518N40LyW3cDJLZheD49SCFb+4=;
 b=D1oASENO5J8nXmE3bze9yjbpgyeRVDgCI6MehEFlIcxmPL60vQdqkYuWa4QOD1HC9RM3bU
 2N4x2InF2FFmFojdQ0tKY21XzGEH0jhEBrr2occui4uZucVj2p3UFREHpwXPtwKAkAPTBB
 XirIVa8chB8ji069RDsV3nyWBhI3c/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-LHVeyTLbOFqYOy2Oi5Us-A-1; Tue, 23 Feb 2021 10:22:59 -0500
X-MC-Unique: LHVeyTLbOFqYOy2Oi5Us-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A2EA195D567
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 15:19:52 +0000 (UTC)
Received: from localhost (unknown [10.40.208.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB1F95D9D0;
 Tue, 23 Feb 2021 15:19:50 +0000 (UTC)
Date: Tue, 23 Feb 2021 16:19:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210223161948.56bf86c0@redhat.com>
In-Reply-To: <87mtvw4d59.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com>
 <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com>
 <87sg5xjj60.fsf@vitty.brq.redhat.com>
 <87mtvw4d59.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 11:20:34 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> >  
> >>> 
> >>> We need to distinguish because that would be sane.
> >>> 
> >>> Enlightened VMCS is an extension to VMX, it can't be used without
> >>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,  
> >> ...  
> >>> That bein said, if
> >>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
> >>> there is a problem with explicit enablement: what should
> >>> 
> >>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
> >>> sound sane to me.  
> >> based on above I'd error out is user asks for unsupported option
> >> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out  
> >
> > That's what I keep telling you but you don't seem to listen. 'Scratch
> > CPU' can't possibly help with this use-case because when you parse 
> >
> > 'hv-passthrough,hv-evmcs,vmx=off' you
> >
> > 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
> > host.
> >
> > 2) 'hv-evmcs' -> keep EVMCS bit '1'
> >
> > 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
> >
> > We have to remember which options were aquired from the host and which
> > were set explicitly by the user.   
> 
> Igor,
> 
> could you please comment on the above? In case my line of thought is
> correct, and it is impossible to distinguish between e.g.
> 
> 'hv-passthrough,hv-evmcs,-vmx'
> and
> 'hv-passthrough,-vmx'
> 
> without a custom parser (written just exactly the way I did in this
> version, for example) regardless of when 'hv-passthrough' is
> expanded. E.g. we have the exact same problem with
> 'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing

right, if we need to distinguish between explicit and implicit hv-evmcs set by
hv-passthrough custom parser probably the way to go.

However do we need actually need to do it?
I'd treat 'hv-passthrough,-vmx' the same way as 'hv-passthrough,hv-evmcs,-vmx'
and it applies not only hv-evmcs but other features hv-passthrough might set
(i.e. if whatever was [un]set by hv-passthrough in combination with other
features results in invalid config, QEMU shall error out instead of magically
altering host provided hv-passthrough value).

something like:
  'hv-passthrough,-vmx' when hv-passthrough makes hv-evmcs bit set
should result in
  error_setg(errp,"'vmx' feature can't be disabled when hv-evmcs is enabled,"
                 " either enable 'vmx' or disable 'hv-evmcs' along with disabling 'vmx'"

making host's features set, *magically* mutable, depending on other user provided features
is a bit confusing. One would never know what hv-passthrough actually means, and if
enabling/disabling 'random' feature changes it.

It's cleaner to do just what user asked (whether implicitly or explicitly) and error out
in case it ends up in nonsense configuration.

> 'scratch CPUs' idea at this point because it is not going to change
> anything at all ('hv_features_on' will stay, custom parsers will stay).g
> 
> Am I missing something?
> 


