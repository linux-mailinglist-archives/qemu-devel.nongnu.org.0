Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0C433D45C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:54:44 +0100 (CET)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9Df-0005YL-2o
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9C9-0004hS-P0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9C8-0006V8-5i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615899187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwiOTjG6YUTqFplzROCSG7B3Wo+QKdJBobUzhvYNtao=;
 b=eg9NFFlQuI3onPw0MFB2YkDM7YCZJDLqzKrM3iXhaoTiqhCCrK5rXl0cdSGAaDPayxcbgt
 LPHAj3nBRZwPJ6Kczr3wYFD9dTQm1zKZ+PY8+PV1iHzSH8fP7IyMF2Q4D9Yw7sSBOcjvTs
 bbSAcWWYOatZESqhzww8NVzLGFZB2KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-iUlJyX7GMr-kPJy3GuEg5w-1; Tue, 16 Mar 2021 08:53:05 -0400
X-MC-Unique: iUlJyX7GMr-kPJy3GuEg5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F9F760C1;
 Tue, 16 Mar 2021 12:53:03 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 437681001281;
 Tue, 16 Mar 2021 12:53:03 +0000 (UTC)
Date: Tue, 16 Mar 2021 13:53:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Reinoud Zandijk <reinoud@NetBSD.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316135301.4fd08476@redhat.com>
In-Reply-To: <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 23:27:29 +0100
Reinoud Zandijk <reinoud@NetBSD.org> wrote:

> On Mon, Mar 15, 2021 at 06:53:02PM +0100, Igor Mammedov wrote:
> > Windows 10 1607x64 boots fine when I test it with default machine.
> > 
> > So
> >   1) can you provide full QEMU command line used
> >   2) What Windows build do you use
> >   3) is it existing guest image (i.e. installed in older QEMU version)  
[...]
> 
> The image file was downloaded pre-installed from Microsoft for Edge browser
> evaluation. I used it first on Qemu 5.1 IIRC and it kept working in Qemu 5.2.

issue looks similar to:
0a343a5add7 i386/acpi: restore device paths for pre-5.1 vms

I think that's the problem, the old Windows image (installed on old QEMU),
may fail to boot if started on newest machine type of a newer QEMU.
User should use versioned machine type (the same version it was installed on)
to keep it working the same way otherwise there is no promise that machine ABI
won't change.

> 
> The NVMM accelerator was presented here before but is not yet committed. Its
> API/construction is similar to WHPX.
does it work with kvm for the same image/configuration?

 
> As for the cause, I don't know; q35-6.0 works so why isn't pc-i440fx-6.0 ?
> 
> With regards,
> Reinoud
> 
> 


