Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7C2B1D91
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 15:36:36 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdaBn-0006i6-1j
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 09:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdaB0-0006DL-Kd
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdaAy-0005P4-Ax
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605278143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WfVX3IReCB2vUMrKBlFRyKh7sLAfSNjR5ckL5ikXt2g=;
 b=eY47lP7c0QIXectZ6DxiPoH+bF3FRkRkPYvUGH3Ej5Ax4Z4zG9hDQURBzblRrsn2Pc2npa
 DbeQM9Z185l33lj6FSX+v5BUDJIDZaC9si1KTl8A4XWPjcY0Z0w7kTqdqaGYHpuH5rKorT
 9SvdKOTHQ9RvrwUlLI0de+pUKHB+A7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-RKai2c49PqyL_vxbgqIJ0g-1; Fri, 13 Nov 2020 09:35:40 -0500
X-MC-Unique: RKai2c49PqyL_vxbgqIJ0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA6B31009E41
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 14:35:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B5096EF5D;
 Fri, 13 Nov 2020 14:35:39 +0000 (UTC)
Date: Fri, 13 Nov 2020 15:35:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/12] Remove QemuOpts usage for HMP, -object and
 -readconfig
Message-ID: <20201113143537.GF5834@merkur.fritz.box>
References: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111142537.1213209-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2020 um 15:25 hat Paolo Bonzini geschrieben:
> This is yet another RFC on the command-line parsing overhaul.  Here,
> I'm switching HMP, -object and -readconfig away from QemuOpts.  There are
> pending QemuOpts and keyval patches that make the syntaxes the same
> apart from:
> 
> - "implicit value" options (where the lack of value is turned
> into "on" or "off"), which will be deprecated
> 
> - the processing of invalid, empty or overlong keys which can be considered
> bugfixes.
> 
> Along the way, the object_add HMP command grows help support.
> 
> The plan on top of this is to also keyval-ify -M and -accel.  The reason
> for this, in my evil plan, is to allow for compound properties.  These
> compound properties would be used for replacements of options like -smp
> (-M smp.xxx), -icount (-accel tcg,icount.xxx) and -chardev (as in -object
> chardev-socket,addr.host).

I haven't reviewed everything in detail, but this approach looks
workable to me.

Of course, at the moment -object is a bit different from other options
in that it doesn't have a QAPI object for the options, but you just
directly pass QDicts to user_creatable_add_dict(). But plugging in a
visitor for other options groups doesn't suddenly require a different
design, so this is fine.

Kevin


